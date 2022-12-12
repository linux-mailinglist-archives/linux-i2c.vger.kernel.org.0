Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1433649B6A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Dec 2022 10:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiLLJrX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Dec 2022 04:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiLLJrW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Dec 2022 04:47:22 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7709FF7;
        Mon, 12 Dec 2022 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670838441; x=1702374441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mQcdCppf0939zGmcUzbOc/kW6IP8G8PO1QMNYMm26NM=;
  b=WuIrMEzJBp9ex747a2H1ExxjKgmtEUk9PWgcb/kg9MysSJW91vgtLHru
   exZL4uQ8DIf5ifgkN6v/+ZRzt8UZtT6lD3yGRpzOZ9k+N3pnxyH1iu8/b
   pPCjO2x9rjxXXZtj5eIiPOI5UUsuDS7LWDB2/TkmGDXynuA++BlxXqpbd
   QYZ9QwVQXgzm+DT0QX1F1dpBNt+r78QflNRv3ZdAxR2ReE/e+Hux6+2+h
   22biBm5RcwjtDUPyLJ7IIU5Xg1jMXjA8UIC7KsWGPu+rW1u3wJEMQ1ElC
   Lk/v4K+Lik9dJhDOS4qkoveLLochBaMtyY8CAzyUJ9FWbHo3S9t4amoTx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="301235565"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="301235565"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 01:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10558"; a="625840668"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; 
   d="scan'208";a="625840668"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2022 01:47:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p4fP0-008PN2-39;
        Mon, 12 Dec 2022 11:47:14 +0200
Date:   Mon, 12 Dec 2022 11:47:14 +0200
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
Message-ID: <Y5b4olYjynDuJekT@smile.fi.intel.com>
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <e088e2ffaef1492adc09b7cdbde0afcea2eeb8b2.1670293176.git.zhoubinbin@loongson.cn>
 <Y49ei1fpEawXvGQB@smile.fi.intel.com>
 <7bc31b2d-6687-5823-6950-cdedb8105db5@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bc31b2d-6687-5823-6950-cdedb8105db5@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 08, 2022 at 04:55:39PM +0800, Binbin Zhou wrote:
> 在 2022/12/6 23:23, Andy Shevchenko 写道:
> > On Tue, Dec 06, 2022 at 11:16:56AM +0800, Binbin Zhou wrote:

...

> > > +/*
> > > + * The I2C controller has a fixed I2C bus frequency by default, but to
> > > + * be compatible with more client devices, we can obtain the set I2C
> > > + * bus frequency from ACPI or FDT.
> > > + */
> > > +static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
> > > +{
> > > +	u16 val = 0x12c; /* Default value of I2C divider latch register */
> > Besides comment better to be placed on top of the commented line, the value
> > is better to have its own definition where you place the comment and elaborate
> > what it means in practice (The clock frequency is changed?  Bus speed is
> > different?)
> 
> Ok, I'll put this comment on a separate line.
> 
> The LS2X I2C supports STANDARD_MODE and FAST_MODE, so the maximum bus
> frequency is 400kHz.
> "0x12c" is our empirical value after experimentation and represents 33KHz.
> 
> Also, I think the better way is:
> 
> @@ -53,6 +53,15 @@
>  #define LS2X_CTR_IEN           BIT(6) /* Enable i2c interrupt */
>  #define LS2X_CTR_MST           BIT(5) /* 0: Slave mode 1: Master mode */
> 
> +/* The PCLK clock frequency input from the LPB bus */
> +#define LS2X_I2C_PCLK_FREQ     (50 * HZ_PER_MHZ)
> +/*
> + * The LS2X I2C controller supports standard mode and fast mode,
> + * so the maximum bus frequency is 400kHz.
> + * The '33KHz' is our empirical value after experimentation.
> + */
> +#define LS2X_I2C_FREQ_STD      (33 * HZ_PER_KHZ)
> +
>  struct ls2x_i2c_priv {
>         struct i2c_adapter      adapter;
>         struct device           *dev;
> @@ -231,17 +240,19 @@ static irqreturn_t ls2x_i2c_irq_handler(int this_irq,
> void *dev_id)
>   */
>  static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
>  {
> -       u16 val = 0x12c; /* Default value of I2C divider latch register */
>         struct i2c_timings *t = &priv->i2c_t;
>         u32 acpi_speed = i2c_acpi_find_bus_speed(priv->dev);
> 
>         i2c_parse_fw_timings(priv->dev, t, false);
> 
>         if (acpi_speed || t->bus_freq_hz)
> -               val = 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed) - 1;
> +               t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
> +       else
> +               t->bus_freq_hz = LS2X_I2C_FREQ_STD;
> 
> -       /* Set LS2X I2C frequency */
> -       writel(val, priv->base + I2C_LS2X_PRER_LO);
> +       /* Calculate and set LS2X I2C frequency */

> +       writel((LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1),

Fine with me, but drop unneeded parentheses.

> +              priv->base + I2C_LS2X_PRER_LO);
>  }

> > > +	struct i2c_timings *t = &priv->i2c_t;
> > > +	u32 acpi_speed = i2c_acpi_find_bus_speed(priv->dev);
> > > +
> > > +	i2c_parse_fw_timings(priv->dev, t, false);
> > > +
> > > +	if (acpi_speed || t->bus_freq_hz)
> > > +		val = 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed) - 1;
> > > +
> > > +	/* Set LS2X I2C frequency */
> > > +	writel(val, priv->base + I2C_LS2X_PRER_LO);
> > > +}

...

> > > +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
> > > +			     IRQF_SHARED, "ls2x-i2c", priv);
> > > +	if (r < 0)
> > > +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
> > You requested IRQ without filling all data structures. Is it fine? Have you
> > checked that with CONFIG_DEBUG_SHIRQ being enabled?
> 
> Sorry, I don't quite understand what you mean by "without filling all data
> structures", I need call ls2x_i2c_reginit(priv) before it ?

When you register an IRQ handler (which is that call) it needs to be prepared
to handle interrupt immediately. Which means that your data structures has to
be filled properly. If you can guarantee that with the current code, fine then.

> I see that other i2c drivers request interrupts at about the same time as I
> do.
> 
> I tested it with CONFIG_DEBUG_SHIRQ and no exceptions were reported.

Good. And you removed and reinserted module?

At least this helps to detect some of the potential issues.

...

> > > +	r = devm_i2c_add_adapter(dev, adap);
> > > +	if (r)
> > > +		return dev_err_probe(dev, r, "Failure adding adapter\n");
> > > +
> > > +	return 0;
> > > +}
> > Looking at the above...
> > 
> > > +static int ls2x_i2c_remove(struct platform_device *pdev)
> > > +{
> > > +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
> > > +
> > > +	i2c_del_adapter(&priv->adapter);
> > ...are you sure this is correct?
> 
> When we use devm_i2c_add_adapter(), the adapter will be auto deleted on
> driver detach.
> 
> So I just drop the ls2x_i2c_remove() ?

Correct.

> > > +	return 0;
> > > +}

...

> > > +static int ls2x_i2c_suspend(struct device *dev)
> > > +{
> > > +	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);
> > > +	priv->suspended = 1;
> > No protection needed?
> 
> Actually this variable is not used elsewhere, maybe it is useless, I will
> try to remove it and add some necessary actions in the suspend/rusume
> callbacks, such as disable i2c interrupts, to ensure integrity.

Is your interrupt a wake source? It might be that you will need a special
handling of it.

> > > +	return 0;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


