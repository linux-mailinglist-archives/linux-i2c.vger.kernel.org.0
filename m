Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E692702898
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 11:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjEOJaZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 05:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240715AbjEOJaC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 05:30:02 -0400
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B421B5
        for <linux-i2c@vger.kernel.org>; Mon, 15 May 2023 02:29:36 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 0016b2ae-f303-11ed-b3cf-005056bd6ce9;
        Mon, 15 May 2023 12:29:34 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Mon, 15 May 2023 12:29:32 +0300
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v8 4/9] net: txgbe: Register I2C platform device
Message-ID: <ZGH7fHlq0Ao_Mr3U@surfacebook>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-5-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515063200.301026-5-jiawenwu@trustnetic.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mon, May 15, 2023 at 02:31:55PM +0800, Jiawen Wu kirjoitti:
> Register the platform device to use Designware I2C bus master driver.
> Use regmap to read/write I2C device region from given base offset.

...

> +#include <linux/platform_device.h>
>  #include <linux/gpio/property.h>
> +#include <linux/regmap.h>

Perhaps keeping this ordered?

>  #include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include <linux/i2c.h>

...

> +static const struct regmap_config i2c_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_read = txgbe_i2c_read,
> +	.reg_write = txgbe_i2c_write,

	fast_io = true;

? (Note, I haven't checked if IO accessors are really fast)

> +};

...

> +	i2c_regmap = devm_regmap_init(&pdev->dev, NULL, wx,
> +				      &i2c_regmap_config);

This is exactly a single line (80 characters), why to have two?

> +	if (IS_ERR(i2c_regmap)) {
> +		wx_err(wx, "failed to init regmap\n");
> +		return PTR_ERR(i2c_regmap);
> +	}

...

> +	res = DEFINE_RES_IRQ(pdev->irq);
> +	info.res = &res;

You can do

	info.res = &DEFINE_RES_IRQ(pdev->irq);

-- 
With Best Regards,
Andy Shevchenko


