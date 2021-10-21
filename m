Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D26436914
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Oct 2021 19:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhJUReK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Oct 2021 13:34:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56707 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229968AbhJUReJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Oct 2021 13:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634837512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FttkWqye/woUbVrNK1gNL8Qh2ZShvlyYafkWzXQo3/U=;
        b=SnU0/XAVmTnNY/1um4S8GFJk5/Q1GxV3XHyh3egaNNCufF6aaPoPdfRSwt9V2ijZavsVbB
        a5IrIP+cYA3ghfFyK0K61WRIqHzJcE+2zdpvZb8/OWrhbXAQUDmEcJ+u38q+IxgQWgLAzk
        hAfI2/LxG0sxNZOnL1hHhv9hqZWs8jE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-A73qUsLwPlujKp9xiIqKow-1; Thu, 21 Oct 2021 13:31:51 -0400
X-MC-Unique: A73qUsLwPlujKp9xiIqKow-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640240d400b003dce046ab51so1077865edb.14
        for <linux-i2c@vger.kernel.org>; Thu, 21 Oct 2021 10:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FttkWqye/woUbVrNK1gNL8Qh2ZShvlyYafkWzXQo3/U=;
        b=IcjWWcYgWvG1p0tof7nXaWpgR6WzXcMIyEKMfo+hve2fRzttlO9Xtck5JW/Keg0Ng8
         mIYw2uwN0tLfDTDB8eQlDY2qNw0YB/w5jv3rI9gZKRJdb0pUfLMPzGBUauoDOW/FwxOp
         S0aIZ7VNnWESfqH/iS+07QIm+yiComxftjDQDqn4nhyvSJseIWDcAoEZauSKZV8mXlr9
         yuGthsgJwXSFVg9PjxcltTE4zK2Ul2LjMlFR7OWCZt2JbzQ3hMi18WFrYpckrdY86AMR
         ymOF213U1Bkfa9zAW3J0l2SGlbyypC4g2XQ0bWDgsE3X2cOOkKz3bWBzVE+k7sZbZorH
         q3VQ==
X-Gm-Message-State: AOAM533gbRafCwwNimNWW8YAaUz+4Kn0Dw24w3MupSnjbk0gaAfYmP04
        sLe49R+fN0fmYvl1UUMeuogpxObO/rGOBdsK6fN8wWUsgHk61RJyllCg1Hdr3p8HjYLDbavlzt4
        NdznfHaapnPGz+hEGJZbj
X-Received: by 2002:a05:6402:2682:: with SMTP id w2mr9441537edd.185.1634837509944;
        Thu, 21 Oct 2021 10:31:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw40qts/AHKJnlgI9kc6XOVWl1IM7KUVJnVdm0nO18gQKI+uMolfMwNHlKBNH8kJjWRyFtUaA==
X-Received: by 2002:a05:6402:2682:: with SMTP id w2mr9441489edd.185.1634837509694;
        Thu, 21 Oct 2021 10:31:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e22sm3418183edu.35.2021.10.21.10.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 10:31:36 -0700 (PDT)
Message-ID: <4e5884d5-bcde-dac9-34fb-e29ed32f73c9@redhat.com>
Date:   Thu, 21 Oct 2021 19:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 05/11] clk: Introduce clk-tps68470 driver
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J.Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-6-hdegoede@redhat.com>
 <163415237957.936110.1269283416777498553@swboyd.mtv.corp.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <163415237957.936110.1269283416777498553@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

Thank you for the review.

On 10/13/21 21:12, Stephen Boyd wrote:
> Quoting Hans de Goede (2021-10-10 11:57:01)
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index c5b3dc97396a..7dffecac83d1 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -169,6 +169,12 @@ config COMMON_CLK_CDCE706
>>         help
>>           This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
>>  
>> +config COMMON_CLK_TPS68470
>> +       tristate "Clock Driver for TI TPS68470 PMIC"
>> +       depends on I2C && REGMAP_I2C && INTEL_SKL_INT3472
> 
> Pretty sure REGMAP_I2C should be selected, not depended on.
> 
> Can it
> 
> 	depends on INTEL_SKL_INT3472 || COMPILE_TEST
> 
> so that we don't have to enable the intel specific config to compile
> test this driver?

Ack, all fixed for v4.

>> +       help
>> +        This driver supports the clocks provided by TPS68470
>> +
>>  config COMMON_CLK_CDCE925
>>         tristate "Clock driver for TI CDCE913/925/937/949 devices"
>>         depends on I2C
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index e42312121e51..6b6a88ae1425 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -63,6 +63,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)                += clk-si570.o
>>  obj-$(CONFIG_COMMON_CLK_STM32F)                += clk-stm32f4.o
>>  obj-$(CONFIG_COMMON_CLK_STM32H7)       += clk-stm32h7.o
>>  obj-$(CONFIG_COMMON_CLK_STM32MP157)    += clk-stm32mp1.o
>> +obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>>  obj-$(CONFIG_CLK_TWL6040)              += clk-twl6040.o
>>  obj-$(CONFIG_ARCH_VT8500)              += clk-vt8500.o
>>  obj-$(CONFIG_COMMON_CLK_VC5)           += clk-versaclock5.o
>> diff --git a/drivers/clk/clk-tps68470.c b/drivers/clk/clk-tps68470.c
>> new file mode 100644
>> index 000000000000..27e8cbd0f60e
>> --- /dev/null
>> +++ b/drivers/clk/clk-tps68470.c
>> @@ -0,0 +1,256 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Clock driver for TPS68470 PMIC
>> + *
>> + * Copyright (C) 2018 Intel Corporation
>> + *
>> + * Authors:
>> + *     Zaikuo Wang <zaikuo.wang@intel.com>
>> + *     Tianshu Qiu <tian.shu.qiu@intel.com>
>> + *     Jian Xu Zheng <jian.xu.zheng@intel.com>
>> + *     Yuning Pu <yuning.pu@intel.com>
>> + *     Antti Laakso <antti.laakso@intel.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clkdev.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/tps68470.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/platform_data/tps68470.h>
>> +#include <linux/regmap.h>
>> +
>> +#define TPS68470_CLK_NAME "tps68470-clk"
>> +
>> +#define to_tps68470_clkdata(clkd) \
>> +       container_of(clkd, struct tps68470_clkdata, clkout_hw)
>> +
>> +struct tps68470_clkout_freqs {
>> +       unsigned long freq;
>> +       unsigned int xtaldiv;
>> +       unsigned int plldiv;
>> +       unsigned int postdiv;
>> +       unsigned int buckdiv;
>> +       unsigned int boostdiv;
>> +} clk_freqs[] = {
>> +/*
>> + *  The PLL is used to multiply the crystal oscillator
>> + *  frequency range of 3 MHz to 27 MHz by a programmable
>> + *  factor of F = (M/N)*(1/P) such that the output
>> + *  available at the HCLK_A or HCLK_B pins are in the range
>> + *  of 4 MHz to 64 MHz in increments of 0.1 MHz
>> + *
>> + * hclk_# = osc_in * (((plldiv*2)+320) / (xtaldiv+30)) * (1 / 2^postdiv)
>> + *
>> + * PLL_REF_CLK should be as close as possible to 100kHz
>> + * PLL_REF_CLK = input clk / XTALDIV[7:0] + 30)
>> + *
>> + * PLL_VCO_CLK = (PLL_REF_CLK * (plldiv*2 + 320))
>> + *
>> + * BOOST should be as close as possible to 2Mhz
>> + * BOOST = PLL_VCO_CLK / (BOOSTDIV[4:0] + 16) *
>> + *
>> + * BUCK should be as close as possible to 5.2Mhz
>> + * BUCK = PLL_VCO_CLK / (BUCKDIV[3:0] + 5)
>> + *
>> + * osc_in   xtaldiv  plldiv   postdiv   hclk_#
>> + * 20Mhz    170      32       1         19.2Mhz
>> + * 20Mhz    170      40       1         20Mhz
>> + * 20Mhz    170      80       1         24Mhz
>> + *
>> + */
>> +       { 19200000, 170, 32, 1, 2, 3 },
>> +       { 20000000, 170, 40, 1, 3, 4 },
>> +       { 24000000, 170, 80, 1, 4, 8 },
>> +};
>> +
>> +struct tps68470_clkdata {
>> +       struct clk_hw clkout_hw;
>> +       struct regmap *regmap;
>> +       struct clk *clk;
>> +       int clk_cfg_idx;
>> +};
>> +
>> +static int tps68470_clk_is_prepared(struct clk_hw *hw)
>> +{
>> +       struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
>> +       int val;
>> +
>> +       if (regmap_read(clkdata->regmap, TPS68470_REG_PLLCTL, &val))
>> +               return 0;
>> +
>> +       return val & TPS68470_PLL_EN_MASK;
>> +}
>> +
>> +static int tps68470_clk_prepare(struct clk_hw *hw)
>> +{
>> +       struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
>> +       int idx = clkdata->clk_cfg_idx;
>> +
>> +       regmap_write(clkdata->regmap, TPS68470_REG_BOOSTDIV, clk_freqs[idx].boostdiv);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_BUCKDIV, clk_freqs[idx].buckdiv);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_PLLSWR, TPS68470_PLLSWR_DEFAULT);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_XTALDIV, clk_freqs[idx].xtaldiv);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_PLLDIV, clk_freqs[idx].plldiv);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV, clk_freqs[idx].postdiv);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV2, clk_freqs[idx].postdiv);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG2, TPS68470_CLKCFG2_DRV_STR_2MA);
>> +
>> +       regmap_write(clkdata->regmap, TPS68470_REG_PLLCTL,
>> +                    TPS68470_OSC_EXT_CAP_DEFAULT << TPS68470_OSC_EXT_CAP_SHIFT |
>> +                    TPS68470_CLK_SRC_XTAL << TPS68470_CLK_SRC_SHIFT);
>> +
>> +       regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1,
>> +                          (TPS68470_PLL_OUTPUT_ENABLE <<
>> +                          TPS68470_OUTPUT_A_SHIFT) |
>> +                          (TPS68470_PLL_OUTPUT_ENABLE <<
>> +                          TPS68470_OUTPUT_B_SHIFT));
>> +
>> +       regmap_update_bits(clkdata->regmap, TPS68470_REG_PLLCTL,
>> +                          TPS68470_PLL_EN_MASK, TPS68470_PLL_EN_MASK);
>> +
>> +       return 0;
>> +}
>> +
>> +static void tps68470_clk_unprepare(struct clk_hw *hw)
>> +{
>> +       struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
>> +
>> +       /* disable clock first*/
>> +       regmap_update_bits(clkdata->regmap, TPS68470_REG_PLLCTL, TPS68470_PLL_EN_MASK, 0);
>> +
>> +       /* write hw defaults */
> 
> Is it necessary to reset the registers to 0? Can the comment indicate
> why it is necessary instead of stating what the code is doing?

As mentioned in the commit msg this driver started out of tree, this part
comes unmodified from the out of tree driver.

After inspecting the datasheet you are right and most of these register
clears are not necessary to disable the clock.

Only the clearing of TPS68470_REG_CLKCFG1 is necesary to tristate the
clk output pin. I will remove the rest and add a comment about the
clearing of TPS68470_REG_CLKCFG1.

> 
>> +       regmap_write(clkdata->regmap, TPS68470_REG_BOOSTDIV, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_BUCKDIV, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_PLLSWR, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_XTALDIV, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_PLLDIV, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG2, 0);
>> +       regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1, 0);
>> +}
>> +
>> +static unsigned long tps68470_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>> +{
>> +       struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
>> +
>> +       return clk_freqs[clkdata->clk_cfg_idx].freq;
>> +}
>> +
>> +static int tps68470_clk_cfg_lookup(unsigned long rate)
> 
> unsigned? Doesn't seem to return negative numbers.

Will fix for v4.
> 
>> +{
>> +       long diff, best_diff = LONG_MAX;
>> +       int i, best_idx = 0;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(clk_freqs); i++) {
>> +               diff = clk_freqs[i].freq - rate;
>> +               if (diff == 0)
>> +                       return i;
>> +
>> +               diff = abs(diff);
>> +               if (diff < best_diff) {
>> +                       best_diff = diff;
>> +                       best_idx = i;
>> +               }
>> +       }
>> +
>> +       return best_idx;
>> +}
>> +
>> +static long tps68470_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>> +                                   unsigned long *parent_rate)
>> +{
>> +       int idx = tps68470_clk_cfg_lookup(rate);
> 
> unsigned?

Will fix for v4.


> 
>> +
>> +       return clk_freqs[idx].freq;
>> +}
>> +
>> +static int tps68470_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                                unsigned long parent_rate)
>> +{
>> +       struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
>> +       int idx = tps68470_clk_cfg_lookup(rate);
>> +
>> +       if (rate != clk_freqs[idx].freq)
>> +               return -EINVAL;
>> +
>> +       clkdata->clk_cfg_idx = idx;
> 
> Newline here please.

Done.

> Also, why isn't this function actually writing
> hardware?

set_rate can only be called when the clock is disabled, all the
necessary values are programmed based on the clk_cfg_idx in
tps68470_clk_prepare().

Note there is no enable() since enable() may not sleep and
this device is interfaced over I2C, so the clock is already
enabled from the prepare() op.

> 
>> +       return 0;
>> +}
>> +
>> +static const struct clk_ops tps68470_clk_ops = {
>> +       .is_prepared = tps68470_clk_is_prepared,
>> +       .prepare = tps68470_clk_prepare,
>> +       .unprepare = tps68470_clk_unprepare,
>> +       .recalc_rate = tps68470_clk_recalc_rate,
>> +       .round_rate = tps68470_clk_round_rate,
>> +       .set_rate = tps68470_clk_set_rate,
>> +};
>> +
>> +static struct clk_init_data tps68470_clk_initdata = {
> 
> const?

Ack.

> 
>> +       .name = TPS68470_CLK_NAME,
>> +       .ops = &tps68470_clk_ops,
>> +};
>> +
>> +static int tps68470_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct tps68470_clk_platform_data *pdata = pdev->dev.platform_data;
>> +       struct tps68470_clkdata *tps68470_clkdata;
>> +       int ret;
>> +
>> +       tps68470_clkdata = devm_kzalloc(&pdev->dev, sizeof(*tps68470_clkdata),
>> +                                       GFP_KERNEL);
>> +       if (!tps68470_clkdata)
>> +               return -ENOMEM;
>> +
>> +       tps68470_clkdata->regmap = dev_get_drvdata(pdev->dev.parent);
>> +       tps68470_clkdata->clkout_hw.init = &tps68470_clk_initdata;
>> +       tps68470_clkdata->clk = devm_clk_register(&pdev->dev, &tps68470_clkdata->clkout_hw);
> 
> Please use devm_clk_hw_register()

Good idea, done for v4.

> 
>> +       if (IS_ERR(tps68470_clkdata->clk))
>> +               return PTR_ERR(tps68470_clkdata->clk);
>> +
>> +       ret = devm_clk_hw_register_clkdev(&pdev->dev, &tps68470_clkdata->clkout_hw,
>> +                                         TPS68470_CLK_NAME, NULL);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (pdata) {
>> +               ret = devm_clk_hw_register_clkdev(&pdev->dev,
>> +                                                 &tps68470_clkdata->clkout_hw,
>> +                                                 pdata->consumer_con_id,
>> +                                                 pdata->consumer_dev_name);
>> +               if (ret)
>> +                       return ret;
> 
> Drop these two lines?
> 
>> +       }
>> +
>> +       return 0;
> 
> And then
> 
> return ret;

Done for v4.

Regards,

Hans

