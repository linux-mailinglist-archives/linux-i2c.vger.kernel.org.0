Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABECA6447F4
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 16:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiLFPYx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 10:24:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbiLFPYY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 10:24:24 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7E1A193;
        Tue,  6 Dec 2022 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670340261; x=1701876261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sp1kX2dPljTrHQsc7vo9PXw4LW7YS91wuLLg6PS0UVo=;
  b=DR64pkIaox9n1ZpV8qntXPo1QFOnVLkXn//e72h/oN4lcew2vHjJb4vX
   UEXPgr979SRhsjigaKMbjAgD/fIepM8pyOoukeF0uz+ja0p0/u2e/rk4+
   CTw6xm/RWfFLCXZqbjgBrhepnL5l8+x3yMexevjlp9yAaxGaFqHYHPGRe
   b5zSQz26KqgPmKsjQjQxjHeXGRXtWPUwSBmyPklhtjzbZQ8COw7dckwbF
   gcRErSyktBWYROFeQI4dwbtn69LHjvOmrTo5iEJAcinTrBf300SivcJ2o
   RizirsEIEJRcxILBUbTzesiIJVqMiFoFffjc8P7pVYWdy+LRh07R1N/ux
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="402924089"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="402924089"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 07:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="646248416"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="646248416"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 06 Dec 2022 07:23:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2ZnX-005MPs-2q;
        Tue, 06 Dec 2022 17:23:55 +0200
Date:   Tue, 6 Dec 2022 17:23:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V5 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y49ei1fpEawXvGQB@smile.fi.intel.com>
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <e088e2ffaef1492adc09b7cdbde0afcea2eeb8b2.1670293176.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e088e2ffaef1492adc09b7cdbde0afcea2eeb8b2.1670293176.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 06, 2022 at 11:16:56AM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

Much better, thanks!

...

> +/*
> + * The I2C controller has a fixed I2C bus frequency by default, but to
> + * be compatible with more client devices, we can obtain the set I2C
> + * bus frequency from ACPI or FDT.
> + */
> +static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
> +{
> +	u16 val = 0x12c; /* Default value of I2C divider latch register */

Besides comment better to be placed on top of the commented line, the value
is better to have its own definition where you place the comment and elaborate
what it means in practice (The clock frequency is changed?  Bus speed is
different?)

> +	struct i2c_timings *t = &priv->i2c_t;
> +	u32 acpi_speed = i2c_acpi_find_bus_speed(priv->dev);
> +
> +	i2c_parse_fw_timings(priv->dev, t, false);
> +
> +	if (acpi_speed || t->bus_freq_hz)
> +		val = 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed) - 1;
> +
> +	/* Set LS2X I2C frequency */
> +	writel(val, priv->base + I2C_LS2X_PRER_LO);
> +}

...

> +	writeb(data | LS2X_CTR_EN | LS2X_CTR_IEN | LS2X_CTR_MST,
> +			priv->base + I2C_LS2X_CTR);

Wrong indentation.

...

> +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
> +			     IRQF_SHARED, "ls2x-i2c", priv);
> +	if (r < 0)
> +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);

You requested IRQ without filling all data structures. Is it fine? Have you
checked that with CONFIG_DEBUG_SHIRQ being enabled?

...

> +	r = devm_i2c_add_adapter(dev, adap);
> +	if (r)
> +		return dev_err_probe(dev, r, "Failure adding adapter\n");
> +
> +	return 0;
> +}

Looking at the above...

> +static int ls2x_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&priv->adapter);

...are you sure this is correct?

> +	return 0;
> +}

...

> +static int ls2x_i2c_suspend(struct device *dev)
> +{
> +	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);

> +	priv->suspended = 1;

No protection needed?

> +	return 0;
> +}
> +
> +static int ls2x_i2c_resume(struct device *dev)
> +{
> +	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);

> +	priv->suspended = 0;

Ditto.

> +	ls2x_i2c_reginit(priv);
> +	return 0;
> +}

...

> +MODULE_ALIAS("platform:ls2x-i2c");

Why is this required?

-- 
With Best Regards,
Andy Shevchenko


