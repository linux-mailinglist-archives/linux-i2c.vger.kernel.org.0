Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1726FF187
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 14:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237896AbjEKMb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 08:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbjEKMb4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 08:31:56 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37293C12;
        Thu, 11 May 2023 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=3k72su8jx0jzGWLzHiF1rbQYbOh0xOKndwHtZBcl+qc=; b=reLD9IOrJ91V/pJ5ucFHdavNgQ
        xQJHQtAOLUgiWE69y2BynenQDDpiXUEFK1p0HyG6BYDHGckYdAV/PZpftjS4QNnvO6HbKC7nntVvG
        gjSrIhoup0EiheGjOQfhusajg8iA2Abcfen/DesHhGVtupHa+xzSxcPoYKbXueqqj7HU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1px5SS-00CYIl-Dq; Thu, 11 May 2023 14:31:44 +0200
Date:   Thu, 11 May 2023 14:31:44 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v7 6/9] net: txgbe: Support GPIO to SFP socket
Message-ID: <ab8852ce-72e8-4d5b-8c88-772a6c9f1485@lunn.ch>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-7-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509022734.148970-7-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> +static int txgbe_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct wx *wx = gpiochip_get_data(chip);
> +	struct txgbe *txgbe = wx->priv;
> +	int val;
> +
> +	val = rd32m(wx, WX_GPIO_EXT, BIT(offset));
> +
> +	txgbe->gpio_orig &= ~BIT(offset);
> +	txgbe->gpio_orig |= val;
> +
> +	return !!(val & BIT(offset));
> +}

> +static void txgbe_irq_handler(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct wx *wx = irq_desc_get_handler_data(desc);
> +	struct txgbe *txgbe = wx->priv;
> +	irq_hw_number_t hwirq;
> +	unsigned long gpioirq;
> +	struct gpio_chip *gc;
> +	u32 gpio;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	gpioirq = rd32(wx, WX_GPIO_INTSTATUS);
> +
> +	/* workaround for hysteretic gpio interrupts */
> +	gpio = rd32(wx, WX_GPIO_EXT);
> +	if (!gpioirq)
> +		gpioirq = txgbe->gpio_orig ^ gpio;

Please could you expand on the comment. Are you saying that
WX_GPIO_INTSTATUS sometimes does not contain the GPIO which caused the
interrupt? If so, you then compare the last gpio_get with the current
value and assume that is what caused the interrupt?

> +
> +	gc = txgbe->gpio;
> +	for_each_set_bit(hwirq, &gpioirq, gc->ngpio)
> +		generic_handle_domain_irq(gc->irq.domain, hwirq);
> +
> +	chained_irq_exit(chip, desc);
> +
> +	/* unmask interrupt */
> +	if (netif_running(wx->netdev))
> +		wx_intr_enable(wx, TXGBE_INTR_MISC(wx));

Is that a hardware requirement, that interrupts only work when the
interface is running? Interrupts are not normally conditional like
this, at least when the SoC provides the GPIO controller. 

Andrew

---
pw-bot: cr
