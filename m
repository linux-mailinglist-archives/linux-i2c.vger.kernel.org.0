Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75C7763E241
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Nov 2022 21:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiK3UlU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 15:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiK3UlU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 15:41:20 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB5E686A9;
        Wed, 30 Nov 2022 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669840879; x=1701376879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWOmdKVYguDg1LsTwZ8A9yuFL4p5c/ehz9UBytFtKoM=;
  b=MXclAX+R/5I2twvUalPtDhI77t82OZvtLbOWlnT7Yv89r/IcItDmFNfG
   t/yw9MAj5Xwp9a4vr9uuCSgP8RIlCiXoWqQoUmX2kveF5jjOOMkGBgrSS
   ziUxRFXLdTSKN/FDd5vY3GjZWUUzBAhMILZsB5YE/S0/IEtwJriPmtv5g
   ML9haMojLGrXYxi60lCwPpe+JI078As624qD21dG3xI8XFi7ChsRi5Esw
   RgnOsR9GcawT8mtvXvfntgwPMSWxpX1FgQWuiU+4RQqEFO/5jMljht0ah
   W4/SGtNA/JHmLDh5aYUNt2iVcFqusyzNG9y8vlhU7TpCloYINWjWLTHB3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="315533203"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="315533203"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 12:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="889438889"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="889438889"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2022 12:41:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0TtI-002TDf-25;
        Wed, 30 Nov 2022 22:41:12 +0200
Date:   Wed, 30 Nov 2022 22:41:12 +0200
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
Subject: Re: [PATCH V4 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y4e/6KewuHjAluSZ@smile.fi.intel.com>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 30, 2022 at 01:56:20PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

Looks like some of my comments were not addressed. Are you sure
you have read the previous reviews carefully?

...

> +static int ls2x_i2c_xfer(struct i2c_adapter *adap,
> +			struct i2c_msg *msgs, int num)
> +{
> +	int ret, retry;
> +	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> +
> +	for (retry = 0; retry < adap->retries; retry++) {
> +		ret = ls2x_i2c_doxfer(adap, msgs, num);
> +		if (ret != -EAGAIN)
> +			return ret;
> +
> +		dev_dbg(priv->dev, "Retrying transmission (%d)\n", retry);

> +		udelay(100);

Why atomic? This long (esp. atomic) delay must be explained.

> +	}
> +
> +	return -EREMOTEIO;
> +}

...

> +static void ls2x_i2c_reginit(struct ls2x_i2c_priv *priv)
> +{
> +	u8 data;
> +
> +	/* Enable operations about frequency divider register */
> +	data = readb(priv->base + I2C_LS2X_CTR);
> +	writeb(data & ~0x80, priv->base + I2C_LS2X_CTR);

Magic number.

> +	ls2x_i2c_adjust_bus_speed(priv);
> +
> +	/* Set to normal I2C operating mode and enable interrupts */
> +	data = readb(priv->base + I2C_LS2X_CTR);
> +	writeb(data | 0xe0, priv->base + I2C_LS2X_CTR);

Ditto.

> +}

...

> +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
> +				IRQF_SHARED, "ls2x-i2c", priv);

Indentation.

> +	if (r < 0)
> +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);

...

> +	adap->dev.of_node = pdev->dev.of_node;

Why is this needed?

> +	device_set_node(&adap->dev, dev_fwnode(dev));

...

> +	/* i2c device drivers may be active on return from add_adapter() */
> +	r = i2c_add_adapter(adap);

Why not use devm_ variant of this?

> +	if (r)
> +		return dev_err_probe(dev, r, "Failure adding adapter\n");

...

> +static int ls2x_i2c_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);

Can't you use dev_get_drvdata() directly? Why?

> +
> +	priv->suspended = 1;
> +
> +	return 0;
> +}
> +
> +static int ls2x_i2c_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);

Ditto.

> +	priv->suspended = 0;
> +	ls2x_i2c_reginit(priv);
> +
> +	return 0;
> +}

...

> +static const struct dev_pm_ops ls2x_i2c_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend, ls2x_i2c_resume)
> +};

Use corresponding DEFINE_ macro.

-- 
With Best Regards,
Andy Shevchenko


