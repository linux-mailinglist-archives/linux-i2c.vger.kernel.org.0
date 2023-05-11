Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FB86FFB6D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 22:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238915AbjEKUqL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 16:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239475AbjEKUpi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 16:45:38 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA2EBC
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 13:45:37 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id c56bfb84-f03c-11ed-b3cf-005056bd6ce9;
        Thu, 11 May 2023 23:45:33 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Thu, 11 May 2023 23:45:31 +0300
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Subject: Re: [PATCH net-next v7 6/9] net: txgbe: Support GPIO to SFP socket
Message-ID: <ZF1T62BnVFgR33w0@surfacebook>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com>
 <20230509022734.148970-7-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509022734.148970-7-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Tue, May 09, 2023 at 10:27:31AM +0800, Jiawen Wu kirjoitti:
> Register GPIO chip and handle GPIO IRQ for SFP socket.

...

> +#include <linux/gpio/consumer.h>

What for?

> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/driver.h>

...

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

This can use standard pattern in conjunction with simple rd32() call:

	txgbe->gpio_orig = (txgbe->gpio_orig & ~BIT(offset)) | (val & BIT(offset));

otherwise it's not immediately obvious that val can have only one bit set.

> +	return !!(val & BIT(offset));
> +}

...

> +static int txgbe_gpio_direction_out(struct gpio_chip *chip, unsigned int offset,
> +				    int val)
> +{
> +	struct wx *wx = gpiochip_get_data(chip);
> +	u32 mask;
> +
> +	mask = BIT(offset) | BIT(offset - 1);
> +	if (val)
> +		wr32m(wx, WX_GPIO_DR, mask, mask);
> +	else
> +		wr32m(wx, WX_GPIO_DR, mask, 0);
> +
> +	wr32m(wx, WX_GPIO_DDR, BIT(offset), BIT(offset));

Can you explain, what prevents to have this flow to be interleaved by other API
calls, like ->direction_in()? Didn't you missed proper locking schema?

> +	return 0;
> +}

...

> +	switch (type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		level |= BIT(hwirq);
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		level |= BIT(hwirq);
> +		polarity |= BIT(hwirq);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		level |= BIT(hwirq);

> +		polarity &= ~BIT(hwirq);

This...

> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		level &= ~BIT(hwirq);

...and this can be done outside of the switch-case. Then you simply set certain
bits where it's needed.

> +		polarity |= BIT(hwirq);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		level &= ~BIT(hwirq);
> +		polarity &= ~BIT(hwirq);
> +		break;

default?

> +	}

...

> +	/* workaround for hysteretic gpio interrupts */

GPIO

...

> +	gc->can_sleep = false;

Useless, kzalloc() already sets this to 0.

...

> +	girq->num_parents = 1;
> +	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),

Use girq->num_parents instead of explicit 1 in this call.

> +				     GFP_KERNEL);

Also with 

	struct device *dev = &pdev->dev;

this (and others) can be modified as

	girq->parents = devm_kcalloc(dev, girq->num_parents, sizeof(*girq->parents),

> +	if (!girq->parents)
> +		return -ENOMEM;


...

> +#define TXGBE_PX_MISC_IEN_MASK ( \
> +				TXGBE_PX_MISC_ETH_LKDN | \
> +				TXGBE_PX_MISC_DEV_RST | \
> +				TXGBE_PX_MISC_ETH_EVENT | \
> +				TXGBE_PX_MISC_ETH_LK | \
> +				TXGBE_PX_MISC_ETH_AN | \
> +				TXGBE_PX_MISC_INT_ERR | \
> +				TXGBE_PX_MISC_GPIO)

Wouldn't be better

#define TXGBE_PX_MISC_IEN_MASK				  \
	(TXGBE_PX_MISC_ETH_LKDN | TXGBE_PX_MISC_ETH_LK |  \
	 TXGBE_PX_MISC_ETH_EVENT | TXGBE_PX_MISC_ETH_AN | \
	 TXGBE_PX_MISC_DEV_RST | TXGBE_PX_MISC_INT_ERR |  \
	 TXGBE_PX_MISC_GPIO)

?

-- 
With Best Regards,
Andy Shevchenko


