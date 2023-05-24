Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C85B70F6EC
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 14:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbjEXMvt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 08:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbjEXMvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 08:51:47 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C073D1A4;
        Wed, 24 May 2023 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=keKTg5VtMqo6Q3R7n48z+ZXxK0Q5LNYujQVq8IuM2MM=; b=MPl27mZjUIOkq0TICzorkz7sEz
        sF8ZhsFzUsmaWaBmVO2Xg5MC8javtQ6H6rzaVw9dcjvHdhE/iY/azZJU0mFXMPblzTy+sdYvdBbpu
        haaeYQad7JLE8iFkwgeI5noKAzRMtTdCaaYr80/1SqCbliZKOmWXTs1HbeSz5k8LSycw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q1nxd-00Dn3i-3M; Wed, 24 May 2023 14:51:25 +0200
Date:   Wed, 24 May 2023 14:51:25 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v9 6/9] net: txgbe: Support GPIO to SFP socket
Message-ID: <83de8be3-7d00-4456-94b0-76fea2de825d@lunn.ch>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
 <20230524091722.522118-7-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524091722.522118-7-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> +static void txgbe_toggle_trigger(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct wx *wx = gpiochip_get_data(gc);
> +	u32 pol, val;
> +
> +	pol = rd32(wx, WX_GPIO_POLARITY);
> +	val = rd32(wx, WX_GPIO_EXT);
> +
> +	if (val & BIT(offset))
> +		pol &= ~BIT(offset);
> +	else
> +		pol |= BIT(offset);
> +
> +	wr32(wx, WX_GPIO_POLARITY, pol);
> +}

So you look at the current state of the GPIO and set the polarity to
trigger an interrupt when it changes.

This is not race free. And if it does race, at best you loose an
interrupt. The worst is your hardware locks up because that interrupt
was missed and it cannot continue until some action is taken.

Is there any other GPIO driver doing this?

I think you would be better indicating you don't support
IRQ_TYPE_EDGE_BOTH.

	Andrew
