Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEAC65BFB5
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jan 2023 13:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233085AbjACMNP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Jan 2023 07:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237550AbjACMNL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Jan 2023 07:13:11 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF2E10077;
        Tue,  3 Jan 2023 04:13:07 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="407904584"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="407904584"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 04:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="632438213"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="632438213"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 03 Jan 2023 04:13:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pCgA7-003sVu-1H;
        Tue, 03 Jan 2023 14:12:59 +0200
Date:   Tue, 3 Jan 2023 14:12:59 +0200
From:   Andy Shevchenko <andy@kernel.org>
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
Subject: Re: [PATCH V9 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y7Qby/QnZdP1QcHK@smile.fi.intel.com>
References: <cover.1672714138.git.zhoubinbin@loongson.cn>
 <30d50a8253eb6d7b08c792fd5426baacf876eb2c.1672714138.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30d50a8253eb6d7b08c792fd5426baacf876eb2c.1672714138.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 03, 2023 at 03:00:47PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

I believe that you have tested this on real hardware and it works as expected.
From the code perspective it is good to me,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/i2c/busses/Kconfig    |  11 +
>  drivers/i2c/busses/Makefile   |   1 +
>  drivers/i2c/busses/i2c-ls2x.c | 381 ++++++++++++++++++++++++++++++++++
>  3 files changed, 393 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ls2x.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index e50f9603d189..d80c938142f5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -761,6 +761,17 @@ config I2C_LPC2K
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-lpc2k.
>  
> +config I2C_LS2X
> +	tristate "Loongson LS2X I2C adapter"
> +	depends on MACH_LOONGSON64 || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C interface on the Loongson-2K SoCs and Loongson LS7A bridge
> +	  chip.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-ls2x.
> +
>  config I2C_MLXBF
>          tristate "Mellanox BlueField I2C controller"
>          depends on MELLANOX_PLATFORM && ARM64
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index e73cdb1d2b5a..0584fe160824 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
>  obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
>  obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
>  obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
> +obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
>  obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
>  obj-$(CONFIG_I2C_MICROCHIP_CORE)	+= i2c-microchip-corei2c.o
>  obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> new file mode 100644
> index 000000000000..2215aa04233b
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ls2x.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson-2K/Loongson LS7A I2C master mode driver
> + *
> + * Copyright (C) 2013 Loongson Technology Corporation Limited.
> + * Copyright (C) 2014-2017 Lemote, Inc.
> + * Copyright (C) 2018-2022 Loongson Technology Corporation Limited.
> + *
> + * Originally written by liushaozong
> + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/iopoll.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +/* I2C Registers */
> +#define I2C_LS2X_PRER		0x0 /* Freq Division Register(16 bits) */
> +#define I2C_LS2X_CTR		0x2 /* Control Register */
> +#define I2C_LS2X_TXR		0x3 /* Transport Data Register */
> +#define I2C_LS2X_RXR		0x3 /* Receive Data Register */
> +#define I2C_LS2X_CR		0x4 /* Command Control Register */
> +#define I2C_LS2X_SR		0x4 /* State Register */
> +
> +/* Command Control Register Bit */
> +#define LS2X_CR_START		BIT(7) /* Start signal */
> +#define LS2X_CR_STOP		BIT(6) /* Stop signal */
> +#define LS2X_CR_READ		BIT(5) /* Read signal */
> +#define LS2X_CR_WRITE		BIT(4) /* Write signal */
> +#define LS2X_CR_ACK		BIT(3) /* Response signal */
> +#define LS2X_CR_IACK		BIT(0) /* Interrupt response signal */
> +
> +/* State Register Bit */
> +#define LS2X_SR_NOACK		BIT(7) /* Receive NACK */
> +#define LS2X_SR_BUSY		BIT(6) /* Bus busy state */
> +#define LS2X_SR_AL		BIT(5) /* Arbitration lost */
> +#define LS2X_SR_TIP		BIT(1) /* Transmission state */
> +#define LS2X_SR_IF		BIT(0) /* Interrupt flag */
> +
> +/* Control Register Bit */
> +#define LS2X_CTR_EN		BIT(7) /* 0: I2c frequency setting 1: Normal */
> +#define LS2X_CTR_IEN		BIT(6) /* Enable i2c interrupt */
> +#define LS2X_CTR_MST		BIT(5) /* 0: Slave mode 1: Master mode */
> +#define CTR_FREQ_MASK		GENMASK(7, 6)
> +#define CTR_READY_MASK		GENMASK(7, 5)
> +
> +/* The PCLK frequency from LPB */
> +#define LS2X_I2C_PCLK_FREQ	(50 * HZ_PER_MHZ)
> +
> +/* The default bus frequency, which is an empirical value */
> +#define LS2X_I2C_FREQ_STD	(33 * HZ_PER_KHZ)
> +
> +struct ls2x_i2c_priv {
> +	struct i2c_adapter	adapter;
> +	void __iomem		*base;
> +	struct i2c_timings	i2c_t;
> +	struct completion	cmd_complete;
> +};
> +
> +/*
> + * Interrupt service routine.
> + * This gets called whenever an I2C interrupt occurs.
> + */
> +static irqreturn_t ls2x_i2c_isr(int this_irq, void *dev_id)
> +{
> +	struct ls2x_i2c_priv *priv = dev_id;
> +
> +	if (!(readb(priv->base + I2C_LS2X_SR) & LS2X_SR_IF))
> +		return IRQ_NONE;
> +
> +	writeb(LS2X_CR_IACK, priv->base + I2C_LS2X_CR);
> +	complete(&priv->cmd_complete);
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * The ls2x i2c controller supports standard mode and fast mode, so the
> + * maximum bus frequency is '400kHz'.
> + * The bus frequency is set to the empirical value of '33KHz' by default,
> + * but it can also be taken from ACPI or FDT for compatibility with more
> + * devices.
> + */
> +static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
> +{
> +	struct i2c_timings *t = &priv->i2c_t;
> +	struct device *dev = priv->adapter.dev.parent;
> +	u32 acpi_speed = i2c_acpi_find_bus_speed(dev);
> +
> +	i2c_parse_fw_timings(dev, t, false);
> +
> +	if (acpi_speed || t->bus_freq_hz)
> +		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
> +	else
> +		t->bus_freq_hz = LS2X_I2C_FREQ_STD;
> +
> +	/* Calculate and set i2c frequency. */
> +	writew(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
> +	       priv->base + I2C_LS2X_PRER);
> +}
> +
> +static void ls2x_i2c_init(struct ls2x_i2c_priv *priv)
> +{
> +	/* Set i2c frequency setting mode and disable interrupts. */
> +	writeb(readb(priv->base + I2C_LS2X_CTR) & ~CTR_FREQ_MASK,
> +	       priv->base + I2C_LS2X_CTR);
> +
> +	ls2x_i2c_adjust_bus_speed(priv);
> +
> +	/* Set i2c normal operating mode and enable interrupts. */
> +	writeb(readb(priv->base + I2C_LS2X_CTR) | CTR_READY_MASK,
> +	       priv->base + I2C_LS2X_CTR);
> +}
> +
> +static int ls2x_i2c_xfer_byte(struct ls2x_i2c_priv *priv, u8 txdata, u8 *rxdatap)
> +{
> +	u8 rxdata;
> +	unsigned long time_left;
> +
> +	writeb(txdata, priv->base + I2C_LS2X_CR);
> +
> +	time_left = wait_for_completion_timeout(&priv->cmd_complete,
> +						priv->adapter.timeout);
> +	if (!time_left)
> +		return -ETIMEDOUT;
> +
> +	rxdata = readb(priv->base + I2C_LS2X_SR);
> +	if (rxdatap)
> +		*rxdatap = rxdata;
> +
> +	return 0;
> +}
> +
> +static int ls2x_i2c_send_byte(struct ls2x_i2c_priv *priv, u8 txdata)
> +{
> +	int ret;
> +	u8 rxdata;
> +
> +	ret = ls2x_i2c_xfer_byte(priv, txdata, &rxdata);
> +	if (ret)
> +		return ret;
> +
> +	if (rxdata & LS2X_SR_AL)
> +		return -EAGAIN;
> +
> +	if (rxdata & LS2X_SR_NOACK)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +
> +static int ls2x_i2c_stop(struct ls2x_i2c_priv *priv)
> +{
> +	u8 value;
> +
> +	writeb(LS2X_CR_STOP, priv->base + I2C_LS2X_CR);
> +	return readb_poll_timeout(priv->base + I2C_LS2X_SR, value,
> +				  !(value & LS2X_SR_BUSY), 100,
> +				  jiffies_to_usecs(priv->adapter.timeout));
> +}
> +
> +static int ls2x_i2c_start(struct ls2x_i2c_priv *priv, struct i2c_msg *msgs)
> +{
> +	reinit_completion(&priv->cmd_complete);
> +
> +	writeb(i2c_8bit_addr_from_msg(msgs), priv->base + I2C_LS2X_TXR);
> +	return ls2x_i2c_send_byte(priv, LS2X_CR_START | LS2X_CR_WRITE);
> +}
> +
> +static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
> +{
> +	int ret;
> +	u8 rxdata, *buf = msg->buf;
> +	u16 len = msg->len;
> +
> +	/* Contains steps to send start condition and address. */
> +	ret = ls2x_i2c_start(priv, msg);
> +	if (ret)
> +		return ret;
> +
> +	while (len--) {
> +		ret = ls2x_i2c_xfer_byte(priv,
> +					 LS2X_CR_READ | (len ? 0 : LS2X_CR_ACK),
> +					 &rxdata);
> +		if (ret)
> +			return ret;
> +
> +		*buf++ = readb(priv->base + I2C_LS2X_RXR);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
> +{
> +	int ret;
> +	u8 *buf = msg->buf;
> +	u16 len = msg->len;
> +
> +	/* Contains steps to send start condition and address. */
> +	ret = ls2x_i2c_start(priv, msg);
> +	if (ret)
> +		return ret;
> +
> +	while (len--) {
> +		writeb(*buf++, priv->base + I2C_LS2X_TXR);
> +
> +		ret = ls2x_i2c_send_byte(priv, LS2X_CR_WRITE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> +			     struct i2c_msg *msg, bool stop)
> +{
> +	int ret;
> +
> +	if (msg->flags & I2C_M_RD)
> +		ret = ls2x_i2c_rx(priv, msg);
> +	else
> +		ret = ls2x_i2c_tx(priv, msg);
> +
> +	if (ret < 0) {
> +		/* Fatel error. Needs reinit. */
> +		if (ret == -ETIMEDOUT)
> +			ls2x_i2c_init(priv);
> +
> +		return ret;
> +	}
> +
> +	if (stop) {
> +		/* Failed to issue STOP. Needs reinit. */
> +		ret = ls2x_i2c_stop(priv);
> +		if (ret)
> +			ls2x_i2c_init(priv);
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls2x_i2c_master_xfer(struct i2c_adapter *adap,
> +				struct i2c_msg *msgs, int num)
> +{
> +	int ret;
> +	struct i2c_msg *msg, *emsg = msgs + num;
> +	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> +
> +	for (msg = msgs; msg < emsg; msg++) {
> +		ret = ls2x_i2c_xfer_one(priv, msg, msg == emsg - 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return num;
> +}
> +
> +static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm ls2x_i2c_algo = {
> +	.master_xfer	= ls2x_i2c_master_xfer,
> +	.functionality	= ls2x_i2c_func,
> +};
> +
> +static int ls2x_i2c_probe(struct platform_device *pdev)
> +{
> +	int ret, irq;
> +	struct i2c_adapter *adap;
> +	struct ls2x_i2c_priv *priv;
> +	struct device *dev = &pdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Map hardware registers */
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	/* Add the i2c adapter */
> +	adap = &priv->adapter;
> +	adap->retries = 5;
> +	adap->nr = pdev->id;
> +	adap->dev.parent = dev;
> +	adap->owner = THIS_MODULE;
> +	adap->algo = &ls2x_i2c_algo;
> +	adap->timeout = msecs_to_jiffies(100);
> +	device_set_node(&adap->dev, dev_fwnode(dev));
> +	i2c_set_adapdata(adap, priv);
> +	strscpy(adap->name, pdev->name, sizeof(adap->name));
> +	init_completion(&priv->cmd_complete);
> +	platform_set_drvdata(pdev, priv);
> +
> +	ls2x_i2c_init(priv);
> +
> +	ret = devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, "ls2x-i2c",
> +			       priv);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n", irq);
> +
> +	return devm_i2c_add_adapter(dev, adap);
> +}
> +
> +static int ls2x_i2c_suspend(struct device *dev)
> +{
> +	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);
> +
> +	/* Disable interrupts */
> +	writeb(readb(priv->base + I2C_LS2X_CTR) & ~LS2X_CTR_IEN,
> +	       priv->base + I2C_LS2X_CTR);
> +
> +	return 0;
> +}
> +
> +static int ls2x_i2c_resume(struct device *dev)
> +{
> +	ls2x_i2c_init(dev_get_drvdata(dev));
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ls2x_i2c_pm_ops,
> +				 ls2x_i2c_suspend, ls2x_i2c_resume, NULL);
> +
> +static const struct of_device_id ls2x_i2c_id_table[] = {
> +	{ .compatible = "loongson,ls2k-i2c" },
> +	{ .compatible = "loongson,ls7a-i2c" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ls2x_i2c_id_table);
> +
> +static const struct acpi_device_id ls2x_i2c_acpi_match[] = {
> +	{ "LOON0004" }, /* Loongson LS7A */
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, ls2x_i2c_acpi_match);
> +
> +static struct platform_driver ls2x_i2c_driver = {
> +	.probe		= ls2x_i2c_probe,
> +	.driver		= {
> +		.name	= "ls2x-i2c",
> +		.pm	= pm_sleep_ptr(&ls2x_i2c_pm_ops),
> +		.of_match_table = ls2x_i2c_id_table,
> +		.acpi_match_table = ls2x_i2c_acpi_match,
> +	},
> +};
> +
> +/* The DC subsystem depends on it, we should initialize it earlier. */
> +static int __init ls2x_i2c_init_driver(void)
> +{
> +	return platform_driver_register(&ls2x_i2c_driver);
> +}
> +subsys_initcall(ls2x_i2c_init_driver);
> +
> +static void __exit ls2x_i2c_exit_driver(void)
> +{
> +	platform_driver_unregister(&ls2x_i2c_driver);
> +}
> +module_exit(ls2x_i2c_exit_driver);
> +
> +MODULE_DESCRIPTION("Loongson LS2X I2C Bus driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


