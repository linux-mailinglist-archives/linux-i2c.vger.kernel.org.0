Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA506387B3
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Nov 2022 11:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiKYKle (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Nov 2022 05:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiKYKld (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Nov 2022 05:41:33 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE0848400;
        Fri, 25 Nov 2022 02:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669372892; x=1700908892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m0y5KGOTPY1Jx4UVgieKKzfqxOu+aPjraVBANCkc9tQ=;
  b=O3fphiP1SFpxaJSHkqW6+O38CD/sfEiwY44yni3fzD0hlcLDrGv1uwDH
   hIi/Ofbf7bRT3IF/E4DenMaqLuLdGzCmcTLUYy1ngQ2o9KkQeSMnc+ljl
   zjS9dWIw/qsL77BnoP/YUL80F56d6yb8r8WWt+poIlXTEdj8IP3JRyMiK
   XOdI+bZu5zjldanSNqVSvC8fDturnVqlGFql+bW5IkDZR+/N9xXpUFQG2
   ylKCqZHQwSJw+NN5/nxL1CMNkjSV7mTNlq2trtg4EQUlKpMiofZ6dz1T9
   aqS4wZIzGonAowWq790NUwzNPOj4ZOPV/WgBs/PH8F9878E4z/0fBuz0W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="400748631"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="400748631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 02:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="706030849"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="706030849"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 25 Nov 2022 02:41:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oyW99-00HBvZ-0w;
        Fri, 25 Nov 2022 12:41:27 +0200
Date:   Fri, 25 Nov 2022 12:41:27 +0200
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
Subject: Re: [PATCH V3 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y4Cb19PM97M9HaiB@smile.fi.intel.com>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 25, 2022 at 04:55:20PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

...

Missing bits.h.

> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of_device.h>

There is no user of this header.
Why?

> +#include <linux/platform_device.h>

...

> +/* LS2X I2C clock frequency 50M */
> +#define HZ_PER_MHZ		(50 * 1000000)

units.h ?

...

> +struct ls2x_i2c_dev {
> +	struct device		*dev;
> +	void __iomem		*base;
> +	int			irq;
> +	u32			bus_clk_rate;
> +	struct completion	cmd_complete;

> +	struct i2c_adapter	adapter;

Check if moving this to be the first field makes code generation better
(bloat-o-meter is your friend).

> +	unsigned int		suspended:1;
> +};

> +	return ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
> +}

...

> +static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
> +{
> +	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
> +	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
> +
> +	reinit_completion(&dev->cmd_complete);

> +	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;

Why is this needed?

> +	writeb(addr, dev->base + I2C_LS2X_TXR);
> +
> +	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
> +}

...

> +	while (len--) {

> +		if (len == 0)
> +			cmd |= LS2X_CR_ACK;
> +
> +		writeb(cmd, dev->base + I2C_LS2X_CR);

Can be written as

		writeb(cmd | (len ? 0 : LS2X_CR_ACK), dev->base + I2C_LS2X_CR);

but it's up to you.

> +		time_left = wait_for_completion_timeout(&dev->cmd_complete,
> +							adap->timeout);
> +		if (unlikely(!time_left)) {
> +			dev_err(dev->dev, "transaction timeout\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		*buf++ = readb(dev->base + I2C_LS2X_RXR);
> +	}

...

> +	for (retry = 0; retry < adap->retries; retry++) {

> +

Unneeded blank line.

> +		ret = ls2x_i2c_doxfer(adap, msgs, num);
> +		if (ret != -EAGAIN)
> +			return ret;
> +
> +		dev_dbg(dev->dev, "Retrying transmission (%d)\n", retry);
> +		udelay(100);
> +	}

Can something from iopoll.h be utilized here?

...

> +	if (iflag & LS2X_SR_IF) {
> +		writeb(LS2X_CR_IACK, dev->base + I2C_LS2X_CR);
> +		complete(&dev->cmd_complete);
> +	} else
> +		return IRQ_NONE;


Use usual pattern: checking for error condition first.

	if (!(iflag & LS2X_SR_IF))
		return IRQ_NONE;

	writeb(LS2X_CR_IACK, dev->base + I2C_LS2X_CR);
	complete(&dev->cmd_complete);

> +	return IRQ_HANDLED;

...

> +	writeb((val & 0xff00) >> 8, dev->base + I2C_LS2X_PRER_HI);


What ' & 0xff00' part is for?

...

> +	dev = devm_kzalloc(&pdev->dev,
> +			sizeof(struct ls2x_i2c_dev), GFP_KERNEL);

sizeof(*dev) and make it one line.

> +	if (unlikely(!dev))

Why unlikely()?

> +		return -ENOMEM;

...

> +	dev->irq = platform_get_irq(pdev, 0);
> +	if (unlikely(dev->irq <= 0))

Why 'unlikely()'? Why == 0 is here?

> +		return -ENODEV;

...

> +	r = devm_request_irq(&pdev->dev, dev->irq, ls2x_i2c_isr,
> +			      IRQF_SHARED, "ls2x-i2c", dev);

> +	if (unlikely(r)) {

Why 'unlikely()'? You must explain all likely() / unlikely() use in the code.

> +		dev_err(dev->dev, "failure requesting irq %i\n", dev->irq);
> +		return r;

	return dev_err_probe(...);

> +	}

...

> +	/*
> +	 * The I2C controller has a fixed I2C bus frequency by default, but to
> +	 * be compatible with more client devices, we can obtain the set I2C
> +	 * bus frequency from ACPI or FDT.
> +	 */
> +	dev->bus_clk_rate = i2c_acpi_find_bus_speed(&pdev->dev);

> +	if (!dev->bus_clk_rate)
> +		device_property_read_u32(&pdev->dev, "clock-frequency",
> +					&dev->bus_clk_rate);

This should be done via

        i2c_parse_fw_timings(&pdev->dev, ...);

no?

...

> +	adap->dev.of_node = pdev->dev.of_node;
> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));

device_set_node()

...

> +	/* i2c device drivers may be active on return from add_adapter() */
> +	r = i2c_add_adapter(adap);
> +	if (r) {
> +		dev_err(dev->dev, "failure adding adapter\n");
> +		return r;

	return dev_err_probe(...);

> +	}

...

> +static int __maybe_unused ls2x_i2c_suspend_noirq(struct device *dev)

No __maybe_unused, use proper PM macros and definitions.
(look for pm_ptr() / pm_sleep_ptr() and corresponding defines)

> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ls2x_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
> +
> +	i2c_dev->suspended = 1;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ls2x_i2c_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct ls2x_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
> +
> +	i2c_dev->suspended = 0;
> +	ls2x_i2c_reginit(i2c_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ls2x_i2c_dev_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend_noirq, ls2x_i2c_resume)
> +};

As per above.

...

> +static const struct of_device_id ls2x_i2c_id_table[] = {
> +	{ .compatible = "loongson,ls2k-i2c" },
> +	{ .compatible = "loongson,ls7a-i2c" },
> +	{ /* sentinel */ },

No comma for terminator entry.

> +};

...

> +	{ "LOON0004", 0 },

', 0' is redundant.

...

> +static struct platform_driver ls2x_i2c_driver = {
> +	.probe		= ls2x_i2c_probe,
> +	.remove		= ls2x_i2c_remove,
> +	.driver		= {
> +		.name	= "ls2x-i2c",

> +		.owner	= THIS_MODULE,

Why?

> +		.pm	= &ls2x_i2c_dev_pm_ops,
> +		.of_match_table = ls2x_i2c_id_table,
> +		.acpi_match_table = ls2x_i2c_acpi_match,
> +	},
> +};

-- 
With Best Regards,
Andy Shevchenko


