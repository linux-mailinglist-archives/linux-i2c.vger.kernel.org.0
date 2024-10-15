Return-Path: <linux-i2c+bounces-7379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED899E06A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 10:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71BD41C218BD
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 08:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25141B85EB;
	Tue, 15 Oct 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbXWbwiv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D981AC450;
	Tue, 15 Oct 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979717; cv=none; b=bYbE+nLtPHUxVjxt+IbzmneQPUQ5NIQgBpwvbboyh93MC2P9tFlGohbJeSXD/zV6KJjCFVK3YN/x9w6YufYu7x3O8yWgD3Qb0yi6ZKBazsW4nGrbaKb3ZuNX01ijEoWmNQv0aCXQ9gHPjLd3I2t8t8HNYVO1By5vbfsU5VgoPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979717; c=relaxed/simple;
	bh=SxRcfy07HWRHVvCeOcAKYGN2gzLztYTiSILDxf0OiO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFz82vAp1i/a6RUB7Y/whdNXuRHrT2Ezr4XdTGK2tA0G1xsA7s222patrdmHM00v9TEonRluAk5nej6fhNzCyk/HFsQqCuBE1IocZMyjkeMK7Kn5FtEa3WnBnRvNvM8jE6TmOczl+FFJ4snaVWlq/cRXto8qwsLxVPMQE80BYCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbXWbwiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4489EC4CEC7;
	Tue, 15 Oct 2024 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728979716;
	bh=SxRcfy07HWRHVvCeOcAKYGN2gzLztYTiSILDxf0OiO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IbXWbwivVtpNeRQ2NDb/NYnvIcI/FK2Vo2GDtnHNM3yfjMrNs6HbOhF4t2EebSeWv
	 GFpL99uMYCbXVMBxjBEk1Xh1mS4PyQ28+hS+ANxRWi1PQwzezlDCKjtOYlTxclwfk/
	 BfjhSRM5P8IKsgdBmBEy8fqc12QwYDpnvoIN3cS0f0Oar9gYUx1Utj88rS/U8R51Vr
	 fcFGPrLGq0cK7E5reRrMhP8Gq/nre0BHWOOUx2q77cmuhKmnqjRDwDnv86NUiToXsv
	 l7bd6qGzyZyMXBJWkfw5SYJ5YpNNjR4zTB5Wyp+bCV41yD0OWp8nkX4b61DEdCFZTn
	 +NjywQQ8uEdDw==
Message-ID: <eb4112aa-21d0-4537-a18c-940d8832711a@kernel.org>
Date: Tue, 15 Oct 2024 10:08:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-3-TroyMitchell988@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241015075134.1449458-3-TroyMitchell988@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2024 09:51, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig  |  18 +
>  drivers/i2c/busses/Makefile |   1 +
>  drivers/i2c/busses/i2c-k1.c | 694 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 713 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-k1.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 53f18b351f53..cfa5cda9c8d8 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -800,6 +800,24 @@ config I2C_KEMPLD
>  	  This driver can also be built as a module. If so, the module
>  	  will be called i2c-kempld.
>  
> +config I2C_K1
> +	tristate "Spacemit K1 I2C adapter"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST

There is no such thing as ARCH_SPACEMIT. You never mentioned any dependency.


> +	help
> +	  This option enables support for the I2C interface on the Spacemit K1
> +	  platform.
> +
> +	  If you enable this configuration, the kernel will include support for
> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca
> +	  be used to manage I2C bus transactions, which are necessary for
> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
> +	  devices.
> +
> +	  This driver can also be compiled as a module. If you choose to build
> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
> +	  Loading this module will enable the I2C functionality for the K1
> +	  platform dynamically, without requiring a rebuild of the kernel.
> +
>  config I2C_LPC2K
>  	tristate "I2C bus support for NXP LPC2K/LPC178x/18xx/43xx"
>  	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index ecc07c50f2a0..682e10435a7f 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
>  obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
>  obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
>  obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
> +obj-$(CONFIG_I2C_K1)		+= i2c-k1.o

Are you sure you ordered it alphabetically? The same in Kconfig.

>  obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
>  obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
>  obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> new file mode 100644
> index 000000000000..85053530d9b0
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -0,0 +1,694 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
> + */


...

> +
> +static inline u32 spacemit_i2c_read_reg(struct spacemit_i2c_dev *i2c, int reg)
> +{
> +	return readl(i2c->base + reg);

So basically short and obvious code like this:

	readl(i2c->base + reg);

you replace with:

	spacemit_i2c_read_reg(i2c, reg)

how is this helpful?



> +}
> +
> +static inline void
> +spacemit_i2c_write_reg(struct spacemit_i2c_dev *i2c, int reg, u32 val)
> +{
> +	writel(val, i2c->base + reg);
> +}
> +
> +static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	val = spacemit_i2c_read_reg(i2c, ICR);
> +	spacemit_i2c_write_reg(i2c, ICR, val | CR_IUE);
> +}
> +
> +static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	val = spacemit_i2c_read_reg(i2c, ICR);
> +	val &= ~CR_IUE;
> +	spacemit_i2c_write_reg(i2c, ICR, val);
> +}
> +
> +static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
> +{
> +	spacemit_i2c_write_reg(i2c, ICR, CR_UR);
> +	udelay(5);
> +	spacemit_i2c_write_reg(i2c, ICR, 0);
> +}
> +
> +static void spacemit_i2c_bus_reset(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 status;
> +
> +	/* if bus is locked, reset unit. 0: locked */
> +	status = spacemit_i2c_read_reg(i2c, IBMR);
> +
> +	if ((status & BMR_SDA) && (status & BMR_SCL))
> +		return;
> +
> +	spacemit_i2c_reset(i2c);
> +	usleep_range(10, 20);
> +
> +	/* check scl status again */
> +	status = spacemit_i2c_read_reg(i2c, IBMR);
> +
> +	if (!(status & BMR_SCL))
> +		dev_alert(i2c->dev, "unit reset failed\n");

dev_warn_ratelimited

> +}
> +
> +static int spacemit_i2c_recover_bus_busy(struct spacemit_i2c_dev *i2c)
> +{
> +	int ret = 0;
> +	u32 val;
> +

...

> +static inline int spacemit_i2c_xfer_core(struct spacemit_i2c_dev *i2c)
> +{
> +	int ret = 0;
> +
> +	spacemit_i2c_reset(i2c);
> +
> +	spacemit_i2c_calc_timeout(i2c);
> +
> +	spacemit_i2c_init(i2c);
> +
> +	spacemit_i2c_enable(i2c);
> +	enable_irq(i2c->irq);
> +
> +	/* i2c wait for bus busy */
> +	ret = spacemit_i2c_recover_bus_busy(i2c);
> +
> +	if (unlikely(ret))
> +		return ret;
> +
> +	ret = spacemit_i2c_xfer_msg(i2c);
> +

This coding style is poor... further on this in probe function.

> +	if (unlikely(ret < 0)) {
> +		dev_dbg(i2c->dev, "i2c transfer error\n");
> +		/* timeout error should not be overridden, and the transfer
> +		 * error will be confirmed by err handle function latter,
> +		 * the reset should be invalid argument error.
> +		 */
> +		if (ret != -ETIMEDOUT)
> +			ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int
> +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg msgs[], int num)
> +{
> +	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
> +	int ret;
> +
> +	i2c->msgs = msgs;
> +	i2c->msg_num = num;
> +
> +	ret = spacemit_i2c_xfer_core(i2c);
> +
> +	if (likely(!ret))
> +		spacemit_i2c_check_bus_release(i2c);
> +
> +	disable_irq(i2c->irq);
> +
> +	spacemit_i2c_disable(i2c);
> +
> +	if (unlikely((ret == -ETIMEDOUT || ret == -EAGAIN)))
> +		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%x\n",
> +			  ret, i2c->err);
> +
> +	return ret < 0 ? ret : num;
> +}
> +
> +static u32 spacemit_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> +}
> +
> +static const struct i2c_algorithm spacemit_i2c_algo = {
> +	.xfer = spacemit_i2c_xfer,
> +	.functionality = spacemit_i2c_func,
> +};
> +
> +static int spacemit_i2c_probe(struct platform_device *pdev)
> +{
> +	struct spacemit_i2c_dev *i2c;
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct clk *clk;
> +	int ret = 0;
> +
> +	i2c = devm_kzalloc(&pdev->dev,
> +			   sizeof(struct spacemit_i2c_dev),

sizeof(*) and stop unnecessary wrapping.

> +			   GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	i2c->dev = &pdev->dev;
> +
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (!i2c->base) {
> +		ret = PTR_ERR(i2c->base);

Drop

> +		return dev_err_probe(&pdev->dev, ret, "failed to do ioremap");

Just use here PTR_ERR


> +	}
> +
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0) {
> +		ret = i2c->irq;

Drop, really useless.

> +		return dev_err_probe(&pdev->dev, ret, "failed to get irq resource");
> +	}
> +
> +	ret = devm_request_irq(i2c->dev, i2c->irq,
> +			       spacemit_i2c_irq_handler,
> +			       IRQF_NO_SUSPEND | IRQF_ONESHOT,
> +			       dev_name(i2c->dev), i2c);
> +

There is never a blank line between call and it's condition check if()
statement.

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq");
> +
> +	disable_irq(i2c->irq);

Why?

> +
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);

drop

> +		return dev_err_probe(&pdev->dev, ret, "failed to enable clock");
> +	}
> +
> +	i2c_set_adapdata(&i2c->adapt, i2c);
> +	i2c->adapt.owner = THIS_MODULE;
> +	i2c->adapt.algo = &spacemit_i2c_algo;
> +	i2c->adapt.dev.parent = i2c->dev;
> +	i2c->adapt.nr = pdev->id;
> +
> +	i2c->adapt.dev.of_node = of_node;
> +	i2c->adapt.algo_data = i2c;
> +
> +	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
> +
> +	init_completion(&i2c->complete);
> +
> +	ret = i2c_add_numbered_adapter(&i2c->adapt);
> +

Drop stray blank line

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	return 0;
> +}
> +
> +static void spacemit_i2c_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adapt);
> +}
> +
> +static const struct of_device_id spacemit_i2c_dt_match[] = {
> +	{ .compatible = "spacemit,k1-i2c", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_i2c_dt_match);
> +
> +static struct platform_driver spacemit_i2c_driver = {
> +	.probe = spacemit_i2c_probe,
> +	.remove_new = spacemit_i2c_remove,
> +	.driver = {
> +		.name = "i2c-k1",
> +		.of_match_table = spacemit_i2c_dt_match,
> +	},
> +};
> +module_platform_driver(spacemit_i2c_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");

Best regards,
Krzysztof


