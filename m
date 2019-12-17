Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68D98122D1A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 14:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfLQNj6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 08:39:58 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54882 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728508AbfLQNj5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 08:39:57 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so2961891wmj.4
        for <linux-i2c@vger.kernel.org>; Tue, 17 Dec 2019 05:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IFZR7yFfjCaJ5Zyd28wmKFHJJ/uVBiofrkGTbX0qZ+4=;
        b=Xjvpsk0Rut7XusBTv1UAB4fzGBImRbEixw95u7oUKkag4bvoy73xc6FZYbixAspz0K
         iax8Qu9XI2XGtGSfPAQqzd+pM9HDhxq4yR9fXDO+G0+JBlgO0b3Keo/fCo6tBG+eP5nh
         NvwXv/5UPRer8b73CkXGQXJu+t3EpwkQxUmm8L+maMS9hHcinefthMibV4Cku5w9s4e/
         IIf/lypkUKA82uPTyyWfKC11371ruqD7yg9p7MavGKLulUMcB9DiXH4lLIMBsB3w5gK5
         RplbDF8dCX8T8HaEZ41WO8lqh4FMBOUv0R/eCnFNMoqBoW0++nm9sTuTWF2yOSj5gG47
         RD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IFZR7yFfjCaJ5Zyd28wmKFHJJ/uVBiofrkGTbX0qZ+4=;
        b=Sr3lqOrxL2uyTVKgeCClHp93JUSNvOwt3OVkasq3LuDDPR/NnbSVdLjCyMZErwfEeG
         RgiSnNdvlM9cXBpiSIXcOHxOOsf4uS1a5b2ajlqUy0mWo2SVqI38EDzcMXXRCS0k/Swe
         UkCAp1KVQyfF2hT4GeCWQy7HDiIPNUxH3wAQuHAYjprgZplwXrTvChoXyYspTVBhxp4Y
         4oYFSl/LRDOmOGKL7R1D4uwlWCMkf5APjdZPLDI2Le/2GY4QEmUdZFvVKYEpPJ/5l5Ob
         1Ye9f0ptVIU/6mjyfCnOPIKRz8K9ooKyT0u+vdoSWCYuyzsZpZpP2umJUlvexxSF52u6
         4IDQ==
X-Gm-Message-State: APjAAAXVlAO7Zpt4FSG6beJOtzxJZOTPgfvSZ2JQq7+lW13ouPB1x/5z
        zfHSBiqMWoH/896+eanU4rT2wA==
X-Google-Smtp-Source: APXvYqxJTewRU195IS242gKYuHK+XJLt8HGH8G88T/2+mC0xM987A3hj6SntcX86H3haWFgyBaAv/A==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr5743027wmf.100.1576589993375;
        Tue, 17 Dec 2019 05:39:53 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id o7sm2946632wmh.11.2019.12.17.05.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 05:39:52 -0800 (PST)
Date:   Tue, 17 Dec 2019 13:39:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lars@metafoo.de, pascal.huerst@gmail.com
Subject: Re: [PATCH 06/10] mfd: Add core driver for AD242x A2B transceivers
Message-ID: <20191217133952.GJ18955@dell>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191209183511.3576038-8-daniel@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 09 Dec 2019, Daniel Mack wrote:

> The core driver for these devices is split into several parts.
> 
> The master node driver is an I2C client. It is responsible for
> bringing up the bus topology and discovering the slave nodes.
> This process requries some knowlegde of the slave node configuration
> to program the bus timings correctly, so the master drivers walks
> the tree of nodes in the devicetree. The slave driver handles platform
> devices that are instantiated by the master node driver after
> discovery has finished.
> 
> Master nodes expose two addresses on the I2C bus, one (referred to as
> 'BASE' in the datasheet) for accessing registers on the transceiver
> node itself, and one (referred to as 'BUS') for accessing remote
> registers, either on the remote transceiver itself, or on I2C hardware
> connected to that remote transceiver, which then acts as a remote I2C
> bus master.
> 
> In order to allow MFD sub-devices to be registered as children of
> either the master or any slave node, the details on how to access the
> registers are hidden behind a regmap config. A pointer to the regmap
> is then exposed in the struct shared with the sub-devices.
> 
> The ad242x-bus driver is a simple proxy that occupies the BUS I2C
> address and which is referred to through a devicetree handle by the
> master driver.
> 
> For the discovery process, the driver has to wait for an interrupt
> to occur. In case no interrupt is configured in DT, the driver falls
> back to interrupt polling. After the discovery phase is completed,
> interrupts are only needed for error handling and GPIO handling,
> both of which is not currenty implemented.
> 
> Code common to both the master and the slave driver lives in
> 'ad242x-node.c'.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> 
> mfd

?

> ---
>  drivers/mfd/Kconfig         |  11 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/ad242x-bus.c    |  42 +++
>  drivers/mfd/ad242x-master.c | 611 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/ad242x-node.c   | 262 ++++++++++++++++
>  drivers/mfd/ad242x-slave.c  | 234 ++++++++++++++
>  include/linux/mfd/ad242x.h  | 400 +++++++++++++++++++++++

This device, or at least the way it's been coded is batty!

It's going to need a lot of massaging before being accepted.

Let's start with a quick (it's taken 2 hours already!) glance.

See below ...

>  7 files changed, 1561 insertions(+)
>  create mode 100644 drivers/mfd/ad242x-bus.c
>  create mode 100644 drivers/mfd/ad242x-master.c
>  create mode 100644 drivers/mfd/ad242x-node.c
>  create mode 100644 drivers/mfd/ad242x-slave.c
>  create mode 100644 include/linux/mfd/ad242x.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 420900852166..727a35053d8c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -99,6 +99,17 @@ config PMIC_ADP5520
>  	  individual components like LCD backlight, LEDs, GPIOs and Kepad
>  	  under the corresponding menus.
>  
> +config MFD_AD242X
> +	bool "Analog Devices AD242x A2B support"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	depends on I2C=y && OF
> +	help
> +	  If you say yes here, you get support for devices from the AD242x
> +	  familiy. This driver provides common support for accessing the
> +	  devices, additional drivers must be enabled in order to use the
> +	  functionality of the devices.
> +
>  config MFD_AAT2870_CORE
>  	bool "AnalogicTech AAT2870"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index aed99f08739f..2361c676f6c8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -203,6 +203,7 @@ obj-$(CONFIG_MFD_SPMI_PMIC)	+= qcom-spmi-pmic.o
>  obj-$(CONFIG_TPS65911_COMPARATOR)	+= tps65911-comparator.o
>  obj-$(CONFIG_MFD_TPS65090)	+= tps65090.o
>  obj-$(CONFIG_MFD_AAT2870_CORE)	+= aat2870-core.o
> +obj-$(CONFIG_MFD_AD242X)	+= ad242x-master.o ad242x-slave.o ad242x-bus.o ad242x-node.o
>  obj-$(CONFIG_MFD_AT91_USART)	+= at91-usart.o
>  obj-$(CONFIG_MFD_ATMEL_FLEXCOM)	+= atmel-flexcom.o
>  obj-$(CONFIG_MFD_ATMEL_HLCDC)	+= atmel-hlcdc.o
> diff --git a/drivers/mfd/ad242x-bus.c b/drivers/mfd/ad242x-bus.c
> new file mode 100644
> index 000000000000..6660e13ce43d
> --- /dev/null
> +++ b/drivers/mfd/ad242x-bus.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/mfd/ad242x.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +static int ad242x_bus_i2c_probe(struct i2c_client *i2c,
> +				const struct i2c_device_id *id)
> +{
> +	dev_set_drvdata(&i2c->dev, i2c);
> +	i2c_set_clientdata(i2c, &i2c->dev);

Please explain to me what you think is happening here.

> +	return 0;
> +}

What does this driver do?  Seems kinda pointless?

> +static const struct of_device_id ad242x_bus_of_match[] = {
> +	{ .compatible = "adi,ad2428w-bus" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ad242x_bus_of_match);
> +
> +static const struct i2c_device_id ad242x_bus_i2c_id[] = {
> +	{ "ad242x_bus", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, ad242x_bus_i2c_id);

This table cam be removed if you use probe_new.

> +static struct i2c_driver ad242x_bus_i2c_driver = {
> +	.driver = {
> +		.name = "ad242x-bus",
> +		.of_match_table = ad242x_bus_of_match,
> +	},
> +	.probe = ad242x_bus_i2c_probe,
> +	.id_table = ad242x_bus_i2c_id,
> +};
> +
> +module_i2c_driver(ad242x_bus_i2c_driver);
> +
> +MODULE_DESCRIPTION("AD242x bus driver");
> +MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mfd/ad242x-master.c b/drivers/mfd/ad242x-master.c
> new file mode 100644
> index 000000000000..1b0bf90442a2
> --- /dev/null
> +++ b/drivers/mfd/ad242x-master.c
> @@ -0,0 +1,611 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/ad242x.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +struct ad242x_master {
> +	struct ad242x_node	node;
> +	struct clk		*sync_clk;
> +	struct completion	run_completion;
> +	struct completion	discover_completion;
> +	struct ad242x_i2c_bus	bus;
> +	unsigned int		up_slot_size;
> +	unsigned int		dn_slot_size;
> +	bool			up_slot_alt_fmt;
> +	bool			dn_slot_alt_fmt;
> +	unsigned int		sync_clk_rate;
> +	int			irq;
> +	u8			response_cycles;
> +};

> +struct ad242x_node *ad242x_master_get_node(struct ad242x_master *master)
> +{
> +	return &master->node;
> +}
> +EXPORT_SYMBOL_GPL(ad242x_master_get_node);
> +
> +struct ad242x_i2c_bus *ad242x_master_get_bus(struct ad242x_master *master)
> +{
> +	return &master->bus;
> +}
> +EXPORT_SYMBOL_GPL(ad242x_master_get_bus);
> +
> +const char *ad242x_master_get_clk_name(struct ad242x_master *master)
> +{
> +	return __clk_get_name(master->sync_clk);
> +}
> +EXPORT_SYMBOL_GPL(ad242x_master_get_clk_name);
> +
> +unsigned int ad242x_master_get_clk_rate(struct ad242x_master *master)
> +{
> +	return master->sync_clk_rate;
> +}
> +EXPORT_SYMBOL_GPL(ad242x_master_get_clk_rate);

All of these functions provide abstraction for the sake of
abstraction.  They should be removed and replaced with the code
contained within them.

> +static int ad242x_read_one_irq(struct ad242x_master *master)
> +{
> +	struct regmap *regmap = master->node.regmap;
> +	struct device *dev = master->node.dev;
> +	unsigned int val, inttype;
> +	int ret;
> +
> +	ret = regmap_read(regmap, AD242X_INTSTAT, &val);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read INTSTAT register: %d\n", ret);

Users do not care about registers.

"Failed to obtain interrupt status"

> +		return ret;
> +	}
> +
> +	if (!(val & AD242X_INTSTAT_IRQ))
> +		return -ENOENT;

What happened here?  No interrupts fired?

IRQ_NONE would be better than "No such file or directory".

> +	ret = regmap_read(regmap, AD242X_INTTYPE, &inttype);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read INTTYPE register: %d\n", ret);

Same for all log messages throughout this patch-set.

> +		return ret;
> +	}
> +
> +	ret = regmap_read(regmap, AD242X_INTSRC, &val);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to read INTSRC register: %d\n", ret);
> +		return ret;
> +	}

What does this prove?  Why aren't you doing anything with the value?

> +	ret = regmap_read(regmap, AD242X_INTPND0, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_INTPND0, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(regmap, AD242X_INTPND1, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_INTPND1, val);
> +	if (ret < 0)
> +		return ret;

What does writing back the value do?  Comments please.

> +	if (val & AD242X_INTSRC_MSTINT) {
> +		ret = regmap_read(regmap, AD242X_INTPND2, &val);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(regmap, AD242X_INTPND2, val);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	dev_err(dev, "%s() inttype: 0x%02x\n", __func__, inttype);

No debugging type 'func's please.

What makes this an error?

> +	switch (inttype) {
> +	case AD242X_INTTYPE_DSCDONE:
> +		complete(&master->discover_completion);
> +		break;
> +	case AD242X_INTTYPE_MSTR_RUNNING:
> +		complete(&master->run_completion);
> +		break;
> +	default:
> +		dev_info(dev, "Unhandled interrupt type 0x%02x\n", inttype);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ad242x_read_irqs(struct ad242x_master *master)
> +{
> +	int ret;
> +	bool first = true;
> +
> +	while (true) {
> +		ret = ad242x_read_one_irq(master);
> +		if (ret < 0)
> +			return ret;
> +		if (ret == -ENOENT)
> +			return first ? ret : 0;
> +
> +		first = false;
> +	}
> +}
> +
> +static irqreturn_t ad242x_handle_irq(int irq, void *devid)
> +{
> +	struct ad242x_master *master = devid;
> +	int ret;
> +
> +	ret = ad242x_read_irqs(master);
> +	if (ret == -ENOENT)
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ad242x_wait_for_irq(struct ad242x_master *master,
> +			       struct completion *completion,
> +			       unsigned int timeout)
> +{
> +	int ret;
> +
> +	if (master->irq > 0) {
> +		ret = wait_for_completion_timeout(completion,
> +						  msecs_to_jiffies(timeout));
> +	} else {
> +		usleep_range(timeout * 1000, timeout * 1500);
> +		ad242x_read_irqs(master);
> +		ret = completion_done(completion);
> +	}

What are the semantics of this function.  Comments please.

> +	return ret == 0 ? -ETIMEDOUT : 0;
> +}
> +
> +/* See Table 3-2 in the datasheet */

Do you provide a link to the datasheet anywhere?

All I can find is a 1 page overview.

Please provide a description to what you're doing *here*.

> +static unsigned int ad242x_bus_bits(unsigned int slot_size, bool alt_fmt)
> +{
> +	int alt_bits[8] = { 0, 13, 17, 21, 30, 0, 39, 0 };
> +	int idx = AD242X_SLOTFMT_DNSIZE(slot_size);
> +
> +	return alt_fmt ? alt_bits[idx] : slot_size + 1;
> +}
> +
> +/* See Table 9-1 in the datasheet */

It's okay to reference the datasheet, but tell us what you're doing
here as well.

> +static unsigned int ad242x_master_respoffs(struct ad242x_node *node)
> +{
> +	if (node->tdm_mode == 2 && node->tdm_slot_size == 16)
> +		return 238;
> +
> +	if ((node->tdm_mode == 2 && node->tdm_slot_size == 32) ||
> +	    (node->tdm_mode == 4 && node->tdm_slot_size == 16))
> +		return 245;
> +
> +	return 248;

No magic numbers please.  You need to define them.

> +}
> +
> +static int ad242x_discover(struct ad242x_master *master,
> +			   struct device_node *nodes_np)
> +{
> +	struct regmap *regmap = master->node.regmap;
> +	struct device *dev = master->node.dev;
> +	struct device_node *child_np;
> +	unsigned int val, n = 0, i, respoffs, respcycs;

> +	unsigned int respcycs_up_min = UINT_MAX;
> +	unsigned int respcycs_dn_max = 0;

What are these?

> +	unsigned int master_up_slots = 0;
> +	unsigned int master_dn_slots = 0;
> +	bool up_enabled = false, dn_enabled = false;
> +	uint8_t slave_control = 0;
> +	int ret;
> +
> +	respoffs = ad242x_master_respoffs(&master->node);
> +
> +	for_each_available_child_of_node(nodes_np, child_np) {

What are we discovering here?  Child devices, or something else?

> +		unsigned int dnslot_activity, upslot_activity;
> +		unsigned int slave_dn_slots, slave_up_slots;
> +		unsigned int respcycs_dn, respcycs_up;
> +		struct ad242x_slot_config slot_config;
> +
> +		ret = ad242x_read_slot_config(dev, child_np, &slot_config);
> +		if (ret < 0) {
> +			dev_err(dev, "slot config of slave %d is invalid\n", n);
> +			return ret;
> +		}

What is a 'slot' defined as?

> +		/* See section 3-18 in the datasheet */

Give us a quick explanation.

> +		slave_dn_slots = max_t(int, slot_config.dn_n_forward_slots,
> +				       fls(slot_config.dn_rx_slots));
> +		slave_up_slots = max_t(int, slot_config.up_n_forward_slots,
> +				       fls(slot_config.up_rx_slots));
> +
> +		if (n == 0) {
> +			master_up_slots = slave_up_slots;
> +			master_dn_slots = slave_dn_slots;
> +		}
> +
> +		/* See Appendix B in the datasheet */

Give us a quick explanation.

> +		dnslot_activity = slave_dn_slots *
> +			ad242x_bus_bits(master->dn_slot_size,
> +					master->dn_slot_alt_fmt);
> +		upslot_activity = slave_up_slots *
> +			ad242x_bus_bits(master->up_slot_size,
> +					master->up_slot_alt_fmt);
> +
> +		respcycs_dn = DIV_ROUND_UP(64 + dnslot_activity, 4) + 4*n + 2;

Spaces around the '*'.  If it's not clear, use brackets.

> +		respcycs_up = respoffs -
> +			      (DIV_ROUND_UP(64 + upslot_activity, 4) + 1);

No idea what's going on here.

You need to define these magic numbers to make it clear.

> +		if (respcycs_dn > respcycs_dn_max)
> +			respcycs_dn_max = respcycs_dn;
> +
> +		if (respcycs_up < respcycs_up_min)
> +			respcycs_up_min = respcycs_up;
> +
> +		if (slave_dn_slots > 0)
> +			dn_enabled = true;
> +
> +		if (slave_up_slots > 0)
> +			up_enabled = true;
> +
> +		n++;
> +	}
> +
> +	if (n == 0) {
> +		dev_err(dev, "No child nodes specified\n");
> +		return -EINVAL;
> +	}
> +
> +	if (of_property_read_bool(dev->of_node, "adi,invert-xcvr-b")) {
> +		ret = regmap_update_bits(regmap, AD242X_CONTROL,
> +					 AD242X_CONTROL_XCVRBINV,
> +					 AD242X_CONTROL_XCVRBINV);
> +		if (ret < 0)
> +			return ret;
> +
> +		slave_control = AD242X_CONTROL_XCVRBINV;
> +	}
> +
> +	if (respcycs_dn_max > respcycs_up_min) {
> +		dev_err(dev, "Unsupported bus topology\n");
> +		return -EINVAL;
> +	}
> +
> +	respcycs = (respcycs_dn_max + respcycs_up_min) / 2;
> +	ret = regmap_write(regmap, AD242X_RESPCYCS, respcycs);
> +	if (ret < 0)
> +		return ret;

Comments please.

In fact, comments throughout please.

Anything that isn't absolutely crystal clear should have at least a
little one liner to clarify what is being calculated/set.

> +	ret = regmap_update_bits(regmap, AD242X_CONTROL,
> +				 AD242X_CONTROL_NEWSTRCT,
> +				 AD242X_CONTROL_NEWSTRCT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_SWCTL, AD242X_SWCTL_ENSW);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < n; i++) {
> +		ret = regmap_write(regmap, AD242X_DISCVRY, respcycs - (4*i));

Spaces.

What is 4?

> +		if (ret < 0)
> +			return ret;
> +
> +		ret = ad242x_wait_for_irq(master,
> +					  &master->discover_completion, 35);

Define magic numbers throughout.

> +		if (ret < 0) {
> +			dev_err(dev, "Discovery of node %d timed out\n", i);
> +			return ret;
> +		}
> +
> +		val = AD242X_SWCTL_MODE(2) | AD242X_SWCTL_ENSW;
> +
> +		if (i == 0)
> +			ret = regmap_write(regmap, AD242X_SWCTL, val);
> +		else
> +			ret = ad242x_slave_write(&master->bus, regmap, i,
> +						 AD242X_SWCTL, val);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		dev_info(dev, "Node %d discovered\n", i);
> +
> +		/* Last node? */
> +		if (i == n - 1)
> +			break;
> +
> +		ret = ad242x_slave_write(&master->bus, regmap, i,
> +					 AD242X_INTMSK2,
> +					 AD242X_INTMSK2_DSCDIEN);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = ad242x_slave_write(&master->bus, regmap, i,
> +					 AD242X_CONTROL, slave_control);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = ad242x_slave_write(&master->bus, regmap, i,
> +					 AD242X_SWCTL, AD242X_SWCTL_ENSW);
> +		if (ret < 0)
> +			return ret;
> +
> +		reinit_completion(&master->discover_completion);
> +	}
> +
> +	ret = regmap_write(regmap, AD242X_DNSLOTS, master_dn_slots);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_UPSLOTS, master_up_slots);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = 0;
> +	if (dn_enabled)
> +		val |= AD242X_DATCTL_DNS;
> +
> +	if (up_enabled)
> +		val |= AD242X_DATCTL_UPS;
> +
> +	ret = regmap_write(regmap, AD242X_DATCTL, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int ad242x_init_irq(struct ad242x_master *master)
> +{
> +	struct regmap *regmap = master->node.regmap;
> +	struct device *dev = master->node.dev;
> +	int ret;
> +
> +	if (master->irq > 0) {
> +		ret = devm_request_threaded_irq(dev, master->irq, NULL,
> +						ad242x_handle_irq, IRQF_ONESHOT,
> +						dev_name(dev), master);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(regmap, AD242X_INTMSK0,
> +			   AD242X_INTMSK0_SRFEIEN | AD242X_INTMSK0_BECIEN |
> +			   AD242X_INTMSK0_PWREIEN | AD242X_INTMSK0_CRCEIEN |
> +			   AD242X_INTMSK0_DDEIEN  | AD242X_INTMSK0_HCEIEN);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_INTMSK2,
> +			   AD242X_INTMSK2_DSCDIEN | AD242X_INTMSK2_SLVIRQEN);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config ad242x_regmap_config = {
> +	.reg_bits	= 8,
> +	.val_bits	= 8,
> +	.volatile_reg	= ad242x_is_volatile_reg,
> +	.writeable_reg	= ad242x_is_writeable_reg,
> +	.max_register	= AD242X_MAX_REG,
> +	.cache_type	= REGCACHE_RBTREE,
> +};
> +
> +static int ad242x_master_probe(struct i2c_client *i2c,
> +			       const struct i2c_device_id *id)
> +{
> +	struct device_node *bus_np, *nodes_np, *np;
> +	struct device *busdev, *dev = &i2c->dev;
> +	struct ad242x_master *master;
> +	struct regmap *regmap;
> +	unsigned int val;
> +	int ret;
> +
> +	nodes_np = of_get_child_by_name(dev->of_node, "nodes");
> +	if (!nodes_np) {
> +		dev_err(dev, "no 'nodes' property given\n");
> +		return -EINVAL;
> +	}
> +
> +	bus_np = of_parse_phandle(dev->of_node, "adi,a2b-bus", 0);
> +	if (!bus_np) {
> +		dev_err(dev, "no 'adi,a2b-bus' handle specified for master node\n");
> +		return -EINVAL;
> +	}
> +
> +	busdev = bus_find_device_by_of_node(&i2c_bus_type, bus_np);
> +	if (!busdev) {
> +		dev_err(dev, "'adi,a2b-bus' handle invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	master = devm_kzalloc(dev, sizeof(struct ad242x_master), GFP_KERNEL);

sizeof(*master)

> +	if (!master)
> +		return -ENOMEM;
> +
> +	mutex_init(&master->bus.mutex);
> +	init_completion(&master->run_completion);
> +	init_completion(&master->discover_completion);

> +	dev_set_drvdata(dev, &master->node);
> +	i2c_set_clientdata(i2c, master);

What do you think is happening here?

> +	regmap = devm_regmap_init_i2c(i2c, &ad242x_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "regmap init failed: %d\n", ret);

"initialisation"

Or even better "Failed to initialise I2C Regmap"

> +		return ret;
> +	}
> +
> +	master->bus.client = to_i2c_client(busdev);

What does 'bus' do in this context?

> +	master->node.regmap = regmap;
> +	master->node.dev = dev;
> +	master->node.master = master;
> +	master->node.id = AD242X_MASTER_ID;
> +	master->irq = i2c->irq;
> +
> +	master->sync_clk = devm_clk_get(dev, "sync");
> +	if (IS_ERR(master->sync_clk)) {
> +		ret = PTR_ERR(master->sync_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get sync clk: %d\n", ret);
> +
> +		return ret;
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "clock-frequency",
> +				 &master->sync_clk_rate)) {
> +		ret = clk_set_rate(master->sync_clk, master->sync_clk_rate);
> +		if (ret < 0) {
> +			dev_err(dev, "Cannot set sync clock rate: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	master->sync_clk_rate = clk_get_rate(master->sync_clk);
> +	if (master->sync_clk_rate != 44100 && master->sync_clk_rate != 48000) {

Please define these magic numbers.

Something descriptive that tells us what the different clock speeds
do.

> +		dev_err(dev, "SYNC clock rate %d is invalid\n",
> +			master->sync_clk_rate);
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_prepare_enable(master->sync_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable sync clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Master node setup */
> +
> +	ret = regmap_write(regmap, AD242X_CONTROL,
> +			   AD242X_CONTROL_MSTR | AD242X_CONTROL_SOFTRST);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad242x_wait_for_irq(master, &master->run_completion, 10);
> +	if (ret < 0) {
> +		dev_err(dev, "timeout waiting for PLL sync: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(regmap, AD242X_CONTROL,
> +				 AD242X_CONTROL_SOFTRST, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad242x_node_probe(&master->node);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad242x_init_irq(master);
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to set up IRQ: %d", ret);
> +		return ret;
> +	}
> +
> +	/* Slot format setup */
> +
> +	of_property_read_u32(dev->of_node, "adi,upstream-slot-size", &val);
> +	if (val < 8 || val > 32 || (val % 4 != 0)) {
> +		dev_err(dev, "invalid upstream-slot-size %d\n", val);
> +		return -EINVAL;
> +	}
> +	master->up_slot_size = val;
> +
> +	of_property_read_u32(dev->of_node, "adi,downstream-slot-size", &val);
> +	if (val < 8 || val > 32 || (val % 4 != 0)) {
> +		dev_err(dev, "invalid downstream-slot-size %d\n", val);
> +		return -EINVAL;
> +	}
> +	master->dn_slot_size = val;
> +
> +	master->dn_slot_alt_fmt =
> +		of_property_read_bool(dev->of_node,
> +				      "adi,alternate-downstream-slot-format");
> +	master->up_slot_alt_fmt =
> +		of_property_read_bool(dev->of_node,
> +				      "adi,alternate-upstream-slot-format");

Obviously this all needs to be run past the DT maintainer(s).

> +	val = AD242X_SLOTFMT_DNSIZE(master->dn_slot_size) |
> +	      AD242X_SLOTFMT_UPSIZE(master->up_slot_size);
> +
> +	if (master->dn_slot_alt_fmt)
> +		val |= AD242X_SLOTFMT_DNFMT;
> +
> +	if (master->up_slot_alt_fmt)
> +		val |= AD242X_SLOTFMT_UPFMT;
> +
> +	ret = regmap_write(regmap, AD242X_SLOTFMT, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Node discovery and MFD setup */
> +
> +	ret = ad242x_discover(master, nodes_np);
> +	if (ret < 0) {
> +		dev_err(dev, "error discovering nodes: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ad242x_node_add_mfd_cells(dev);

Why is this called twice with the same children?

> +	if (ret < 0) {
> +		dev_err(dev, "failed to add MFD devices %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Register platform devices for nodes */
> +
> +	for_each_available_child_of_node(nodes_np, np)
> +		of_platform_device_create(np, NULL, dev);

What are you doing here?

Either use OF to register all child devices OR use MFD, not a mixture
of both.

> +	of_node_put(nodes_np);
> +
> +	return 0;
> +}
> +
> +static int ad242x_master_remove(struct i2c_client *i2c)
> +{
> +	struct ad242x_master *master = i2c_get_clientdata(i2c);
> +
> +	if (master->sync_clk)
> +		clk_disable_unprepare(master->sync_clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ad242x_master_of_match[] = {
> +	{ .compatible = "adi,ad2428w-master" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ad242x_master_of_match);
> +
> +static const struct i2c_device_id ad242x_master_i2c_id[] = {
> +	{"ad242x-master", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ad242x_master_i2c_id);

If you one the OF match table, you don't need this empty I2C table.
Grep for probe_new.

> +static struct i2c_driver ad242x_master_i2c_driver = {
> +	.driver	= {
> +		.name = "ad242x-master",
> +		.of_match_table	= ad242x_master_of_match,
> +	},
> +	.probe = ad242x_master_probe,
> +	.remove = ad242x_master_remove,
> +	.id_table = ad242x_master_i2c_id,
> +};
> +

Remove this line.

> +module_i2c_driver(ad242x_master_i2c_driver);
> +
> +MODULE_DESCRIPTION("AD242x master master driver");

Typo.

> +MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mfd/ad242x-node.c b/drivers/mfd/ad242x-node.c
> new file mode 100644
> index 000000000000..f9db689380a7
> --- /dev/null
> +++ b/drivers/mfd/ad242x-node.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/ad242x.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +/* See Table 7-43 in the datasheet */

More information please.

> +static int ad242x_tdmmode_index(unsigned int mode, bool slave)
> +{
> +	switch (mode) {
> +	case 2:
> +		return 0;
> +	case 4:
> +		return 1;
> +	case 8:
> +		return 2;
> +	case 12:
> +		return slave ? -EINVAL : 3;
> +	case 16:
> +		return 4;
> +	case 20:
> +		return slave ? -EINVAL : 5;
> +	case 24:
> +		return slave ? -EINVAL : 6;
> +	case 32:
> +		return 7;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +int ad242x_node_probe(struct ad242x_node *node)
> +{
> +	struct device_node *np = node->dev->of_node;
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(node->regmap, AD242X_VENDOR, &val);
> +	if (ret < 0) {
> +		dev_err(node->dev, "failed to read VENDOR register %d\n", ret);

Please re-write all of your kernel log messages to be user friendly.

> +		return ret;
> +	}
> +
> +	if (val != 0xad) {

No magic numbers - please define them all.

> +		dev_err(node->dev, "bogus value 0x%02x in VENDOR register\n",
> +			val);
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_read(node->regmap, AD242X_PRODUCT, &val);
> +	if (ret < 0) {
> +		dev_err(node->dev, "failed to read PRODUCT register %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	if (val != 0x28) {
> +		dev_err(node->dev, "bogus value 0x%02x in PRODUCT register\n",
> +			val);
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_read(node->regmap, AD242X_VERSION, &val);
> +	if (ret < 0) {
> +		dev_err(node->dev, "failed to read VERSION register %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (node->id == AD242X_MASTER_ID)
> +		dev_info(node->dev,
> +			 "Detected AD242x master node, version %d.%d\n",
> +			 val >> 4, val & 0xf);
> +	else
> +		dev_info(node->dev,
> +			 "Detected AD242x slave node, version %d.%d, id %d\n",
> +			 val >> 4, val & 0xf, node->id);
> +
> +	ret = regmap_read(node->regmap, AD242X_CAPABILITY, &val);
> +	if (ret < 0) {
> +		dev_err(node->dev, "failed to read CAPABILITY register %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	node->caps = val;
> +
> +	val = 0;
> +
> +	if (of_property_read_bool(np, "adi,spread-a2b-clock"))
> +		val |= AD242X_PLLCTL_SSMODE_AB;
> +	else if (of_property_read_bool(np, "adi,spread-a2b-i2s-clock"))
> +		val |= AD242X_PLLCTL_SSMODE_AB_I2S;
> +
> +	if (of_property_read_bool(np, "adi,spread-spectrum-high"))
> +		val |= AD242X_PLLCTL_SSDEPTH;
> +
> +	ret = regmap_write(node->regmap, AD242X_PLLCTL, val);
> +	if (ret < 0) {
> +		dev_err(node->dev, "failed to write PLLCTL register %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* I2S global setup */
> +
> +	of_property_read_u32(np, "adi,tdm-mode", &node->tdm_mode);
> +	of_property_read_u32(np, "adi,tdm-slot-size", &node->tdm_slot_size);
> +
> +	ret = ad242x_tdmmode_index(node->tdm_mode, false);
> +	if (ret < 0) {
> +		dev_err(node->dev, "invalid TDM mode %d\n", node->tdm_mode);
> +		return -EINVAL;
> +	}
> +
> +	val = AD242X_I2SGCTL_TDMMODE(ret);
> +
> +	if (node->tdm_slot_size == 16) {
> +		val |= AD242X_I2SGCTL_TDMSS;
> +	} else if (node->tdm_slot_size != 32) {
> +		dev_err(node->dev, "invalid TDM slot size %d\n",
> +			node->tdm_slot_size);
> +		return -EINVAL;
> +	}
> +
> +	if (of_property_read_bool(np, "adi,alternating-sync"))
> +		val |= AD242X_I2SGCTL_ALT;
> +
> +	if (of_property_read_bool(np, "adi,early-sync"))
> +		val |= AD242X_I2SGCTL_EARLY;
> +
> +	if (of_property_read_bool(np, "adi,invert-sync"))
> +		val |= AD242X_I2SGCTL_INV;
> +
> +	ret = regmap_write(node->regmap, AD242X_I2SGCTL, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct mfd_cell ad242x_mfd_cells[] = {
> +	{
> +		.of_compatible	= "adi,ad2428w-i2c",
> +		.name		= "ad242x-i2c",

Swap these around.  Or better still, use the macros found in:

  include/linux/mfd/core.h

> +	},
> +	{
> +		.of_compatible	= "adi,ad2428w-gpio",
> +		.name		= "ad242x-gpio",
> +	},
> +	{
> +		.of_compatible	= "adi,ad2428w-clk",
> +		.name		= "ad242x-clk",
> +	},
> +	{
> +		.of_compatible	= "adi,ad2428w-codec",
> +		.name		= "ad242x-codec",
> +	},
> +};
> +
> +int ad242x_node_add_mfd_cells(struct device *dev)
> +{
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				    ad242x_mfd_cells,
> +				    ARRAY_SIZE(ad242x_mfd_cells),
> +				    NULL, 0, NULL);
> +}
> +
> +static int ad242x_get_slot_mask(const struct device_node *np,
> +				const char *propname, u32 *mask)
> +{
> +	unsigned int i, num;
> +	int ret, proplen;
> +	u32 slots[32];

You should define 32 as the maximum number of slots available, then
use it again for most of the random '32's below.

> +	if (!of_get_property(np, propname, &proplen))
> +		return -ENOENT;

This whole piece becomes simpler if you use:

 of_property_read_variable_u32_array()

> +	num = proplen / sizeof(u32);
> +
> +	if (num > ARRAY_SIZE(slots))
> +		return -EOVERFLOW;
> +
> +	ret = of_property_read_u32_array(np, propname, slots, num);
> +	if (ret < 0)
> +		return ret;
> +
> +	*mask = 0;
> +
> +	for (i = 0; i < num; i++) {
> +		if (slots[i] >= 32)
> +			return -EINVAL;
> +
> +		*mask |= BIT(slots[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +int ad242x_read_slot_config(struct device *dev,
> +			    struct device_node *np,
> +			    struct ad242x_slot_config *config)
> +{
> +	struct device_node *dn_np, *up_np;
> +	int ret;
> +
> +	dn_np = of_get_child_by_name(np, "downstream");
> +	if (!dn_np) {
> +		dev_err(dev, "no downstream node\n");
> +		return -EINVAL;
> +	}
> +
> +	up_np = of_get_child_by_name(np, "upstream");
> +	if (!dn_np) {
> +		dev_err(dev, "no upstream node\n");
> +		ret = -EINVAL;
> +		goto err_put_dn_node;
> +	}
> +
> +	ret = ad242x_get_slot_mask(dn_np, "rx-slots", &config->dn_rx_slots);
> +	if (ret < 0 && ret != -ENOENT) {

If you're going to ignore -ENOENT, why not just return 0?

> +		dev_err(dev, "invalid downstream rx-slots property\n");
> +		goto err_put_nodes;
> +	}
> +
> +	of_property_read_u32(dn_np, "#tx-slots", &config->dn_n_tx_slots);
> +	of_property_read_u32(dn_np, "#forward-slots",
> +			     &config->dn_n_forward_slots);
> +	if (config->dn_n_tx_slots + config->dn_n_forward_slots >= 32) {
> +		dev_err(dev, "invalid downstream tx-slots property\n");
> +		goto err_put_nodes;
> +	}
> +
> +

Superfluous '\n'.

> +	ret = ad242x_get_slot_mask(up_np, "rx-slots", &config->up_rx_slots);
> +	if (ret < 0) {
> +		dev_err(dev, "invalid upstream rx-slots property\n");
> +		goto err_put_nodes;
> +	}
> +
> +	of_property_read_u32(up_np, "#tx-slots", &config->up_n_tx_slots);
> +	of_property_read_u32(up_np, "#forward-slots",
> +			     &config->up_n_forward_slots);
> +	if (config->up_n_tx_slots + config->up_n_forward_slots >= 32) {
> +		dev_err(dev, "invalid downstream tx-slots property\n");
> +		goto err_put_nodes;
> +	}
> +
> +err_put_nodes:
> +	of_node_put(up_np);
> +err_put_dn_node:
> +	of_node_put(dn_np);
> +
> +	return ret;
> +}
> diff --git a/drivers/mfd/ad242x-slave.c b/drivers/mfd/ad242x-slave.c
> new file mode 100644
> index 000000000000..ad255d67a5b6
> --- /dev/null
> +++ b/drivers/mfd/ad242x-slave.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/mfd/ad242x.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mutex.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct ad242x_slave {
> +	struct ad242x_node		node;
> +	struct ad242x_node		*master;
> +	struct ad242x_slot_config	slot_config;
> +	unsigned int			sync_offset;
> +};
> +
> +int ad242x_slave_read(struct ad242x_i2c_bus *bus,
> +		      struct regmap *master_regmap,
> +		      uint8_t node_id, uint8_t reg, unsigned int *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&bus->mutex);
> +
> +	ret = regmap_write(master_regmap, AD242X_NODEADR, node_id);
> +	if (ret < 0)
> +		goto err_unlock;
> +
> +	ret = i2c_smbus_read_byte_data(bus->client, reg);
> +	if (ret < 0)
> +		goto err_unlock;
> +
> +	*val = ret;
> +	ret = 0;
> +
> +err_unlock:
> +	mutex_unlock(&bus->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(ad242x_slave_read);
> +
> +int ad242x_slave_write(struct ad242x_i2c_bus *bus,
> +		       struct regmap *master_regmap,
> +		       uint8_t node_id, uint8_t reg, unsigned int val)
> +{
> +	int ret;
> +
> +	mutex_lock(&bus->mutex);
> +
> +	ret = regmap_write(master_regmap, AD242X_NODEADR, node_id);
> +	if (ret < 0)
> +		goto err_unlock;
> +
> +	ret = i2c_smbus_write_byte_data(bus->client, reg, val);
> +	if (ret < 0)
> +		goto err_unlock;
> +
> +	ret = 0;
> +
> +err_unlock:
> +	mutex_unlock(&bus->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(ad242x_slave_write);
> +
> +static int ad242x_slave_regmap_read(void *context, unsigned int reg,
> +				    unsigned int *val)
> +{
> +	struct ad242x_slave *slave = context;
> +	struct ad242x_i2c_bus *bus = ad242x_master_get_bus(slave->node.master);
> +	struct ad242x_node *mnode = ad242x_master_get_node(slave->node.master);
> +
> +	if (reg > 0xff)
> +		return -EINVAL;
> +
> +	return ad242x_slave_read(bus, mnode->regmap, slave->node.id, reg, val);
> +}
> +
> +static int ad242x_slave_regmap_write(void *context, unsigned int reg,
> +				     unsigned int val)
> +{
> +	struct ad242x_slave *slave = context;
> +	struct ad242x_i2c_bus *bus = ad242x_master_get_bus(slave->node.master);
> +	struct ad242x_node *mnode = ad242x_master_get_node(slave->node.master);
> +
> +	if (val > 0xff || reg > 0xff)
> +		return -EINVAL;
> +
> +	return ad242x_slave_write(bus, mnode->regmap, slave->node.id, reg, val);
> +}
> +
> +static const struct regmap_config ad242x_regmap_config = {
> +	.reg_bits	= 8,
> +	.val_bits	= 8,
> +	.volatile_reg	= ad242x_is_volatile_reg,
> +	.writeable_reg	= ad242x_is_writeable_reg,
> +	.reg_read	= ad242x_slave_regmap_read,
> +	.reg_write	= ad242x_slave_regmap_write,
> +	.max_register	= AD242X_MAX_REG,
> +	.cache_type	= REGCACHE_RBTREE,
> +};
> +
> +static int ad242x_calc_sync_offset(unsigned int val)
> +{
> +	if (val == 0)
> +		return 0;
> +
> +	if (val > 127)
> +		return -EINVAL;
> +
> +	return 256 - val;

More magic numbers to define.

> +}
> +
> +static int ad242x_slave_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ad242x_slave *slave;
> +	struct ad242x_node *mnode;
> +	struct regmap *regmap;
> +	unsigned int val;
> +	int i, ret;
> +
> +	slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
> +	if (!slave)
> +		return -ENOMEM;
> +
> +	regmap = devm_regmap_init(dev, NULL, slave, &ad242x_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "regmap init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	of_property_read_u32(dev->of_node, "reg", &val);
> +	slave->node.id = val;

This looks like an abuse of the 'reg' property.

> +	slave->node.dev = dev;
> +	slave->node.regmap = regmap;
> +
> +	mnode = dev_get_drvdata(dev->parent);

What is the parent of the slave?

(it's not clear without looking at the DT I guess)

> +	slave->node.master = mnode->master;
> +
> +	dev_set_name(dev, "%s-a2b-%d", dev_name(dev->parent), slave->node.id);
> +	dev_set_drvdata(dev, &slave->node);
> +
> +	ret = ad242x_node_probe(&slave->node);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad242x_read_slot_config(dev, dev->of_node, &slave->slot_config);
> +	if (ret < 0) {
> +		dev_err(dev, "slot config is invalid: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(regmap, AD242X_UPSLOTS,
> +			   slave->slot_config.up_n_forward_slots);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_DNSLOTS,
> +			   slave->slot_config.dn_n_forward_slots);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_LUPSLOTS,
> +			   slave->slot_config.up_n_tx_slots);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_LDNSLOTS,
> +			   slave->slot_config.dn_n_tx_slots |
> +			   AD242X_LDNSLOTS_DNMASKEN);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < 4; i++) {

Why 4?  Please define it.

> +		ret = regmap_write(regmap, AD242X_UPMASK(i),
> +			(slave->slot_config.up_rx_slots >> (i * 8)) & 0xff);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(regmap, AD242X_DNMASK(i),
> +			(slave->slot_config.dn_rx_slots >> (i * 8)) & 0xff);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	of_property_read_u32(dev->of_node, "adi,sync-offset",
> +			     &slave->sync_offset);
> +
> +	ret = ad242x_calc_sync_offset(slave->sync_offset);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, AD242X_SYNCOFFSET, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad242x_node_add_mfd_cells(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to add MFD devices %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ad242x_slave_of_match[] = {
> +	{ .compatible = "adi,ad2428w-slave" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ad242x_slave_of_match);
> +
> +static struct platform_driver ad242x_slave_driver = {
> +	.driver = {
> +		.name = "ad242x-slave",
> +		.of_match_table = ad242x_slave_of_match,
> +	},
> +	.probe = ad242x_slave_probe,
> +};
> +
> +module_platform_driver(ad242x_slave_driver);
> +
> +MODULE_DESCRIPTION("AD242x slave node driver");
> +MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mfd/ad242x.h b/include/linux/mfd/ad242x.h
> new file mode 100644
> index 000000000000..02a174824f85
> --- /dev/null
> +++ b/include/linux/mfd/ad242x.h
> @@ -0,0 +1,400 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __LINUX_MFD_AD242X_H
> +#define __LINUX_MFD_AD242X_H
> +
> +#define AD242X_CHIP			0x00
> +#define AD242X_NODEADR			0x01
> +#define AD242X_NODEADR_MASK		0x0f
> +#define AD242X_NODEADR_PERI		BIT(5)
> +#define AD242X_NODEADR_BRCST		BIT(7)
> +
> +#define AD242X_VENDOR			0x02
> +#define AD242X_PRODUCT			0x03
> +#define AD242X_VERSION			0x04
> +
> +#define AD242X_CAPABILITY		0x05
> +#define AD242X_CAPABILITY_I2C		BIT(0)
> +
> +#define AD242X_SWCTL			0x09
> +#define AD242X_SWCTL_ENSW		BIT(0)
> +#define AD242X_SWCTL_DIAGMODE		BIT(3)
> +#define AD242X_SWCTL_MODE(X)		(((X) & 3) << 4)
> +#define AD242X_SWCTL_MODE_MASK		(3 << 4)
> +#define AD242X_SWCTL_DISNXT		BIT(6)
> +
> +#define AD242X_BCDNSLOTS		0x0a
> +#define AD242X_BCDNSLOTS_MASK		0x3f
> +
> +#define AD242X_LDNSLOTS			0x0b
> +#define AD242X_LDNSLOTS_MASK		0x3f
> +#define AD242X_LDNSLOTS_DNMASKEN	BIT(7)
> +
> +#define AD242X_LUPSLOTS			0x0c
> +#define AD242X_LUPSLOTS_MASK		0x3f
> +
> +#define AD242X_DNSLOTS			0x0d
> +#define AD242X_DNSLOTS_MASK		0x3f
> +
> +#define AD242X_UPSLOTS			0x0e
> +#define AD242X_UPSLOTS_MASK		0x3f
> +
> +#define AD242X_RESPCYCS			0x0f
> +
> +#define AD242X_SLOTFMT			0x10
> +#define AD242X_SLOTFMT_DNSIZE(X)	((((X) - 8) >> 2) & 7)
> +#define AD242X_SLOTFMT_DNFMT		BIT(3)
> +#define AD242X_SLOTFMT_UPSIZE(X)	(((((X) - 8) >> 2) & 7) << 4)
> +#define AD242X_SLOTFMT_UPFMT		BIT(7)
> +
> +#define AD242X_DATCTL			0x11
> +#define AD242X_DATCTL_DNS		BIT(0)
> +#define AD242X_DATCTL_UPS		BIT(1)
> +#define AD242X_DATCTL_ENDSNIFF		BIT(5)
> +#define AD242X_DATCTL_STANDBY		BIT(7)
> +
> +#define AD242X_CONTROL			0x12
> +#define AD242X_CONTROL_NEWSTRCT		BIT(0)
> +#define AD242X_CONTROL_ENDDSC		BIT(1)
> +#define AD242X_CONTROL_SOFTRST		BIT(2)
> +#define AD242X_CONTROL_SWBYP		BIT(3)
> +#define AD242X_CONTROL_XCVRBINV		BIT(4)
> +#define AD242X_CONTROL_MSTR		BIT(7)
> +
> +#define AD242X_DISCVRY			0x13
> +
> +#define AD242X_SWSTAT			0x14
> +#define AD242X_SWSTAT_FIN		BIT(0)
> +#define AD242X_SWSTAT_FAULT		BIT(1)
> +#define AD242X_SWSTAT_FAULTCODE(X)	(((X) & 0x7) >> 4)
> +#define AD242X_SWSTAT_FAULT_NLOC	BIT(7)
> +
> +#define AD242X_INTSTAT			0x15
> +#define AD242X_INTSTAT_IRQ		BIT(0)
> +
> +#define AD242X_INTSRC			0x16
> +#define AD242X_INTSRC_INODE		0x0f
> +#define AD242X_INTSRC_SLVINT		BIT(6)
> +#define AD242X_INTSRC_MSTINT		BIT(7)
> +
> +#define AD242X_INTTYPE			0x17
> +
> +#define AD242X_INTTYPE_DSCDONE		24
> +#define AD242X_INTTYPE_MSTR_RUNNING	255
> +
> +#define AD242X_INTPND0			0x18
> +#define AD242X_INTPDN0_HDCNTERR		BIT(0)
> +#define AD242X_INTPDN0_DDERR		BIT(1)
> +#define AD242X_INTPDN0_CRCERR		BIT(2)
> +#define AD242X_INTPDN0_DPERR		BIT(3)
> +#define AD242X_INTPDN0_PWRERR		BIT(4)
> +#define AD242X_INTPDN0_BECOVF		BIT(5)
> +#define AD242X_INTPDN0_SRFERR		BIT(6)
> +#define AD242X_INTPDN0_SRFCRCERR	BIT(7)
> +
> +#define AD242X_INTPND1			0x19
> +#define AD242X_INTPND1_IOPND(X)		BIT(X)
> +
> +#define AD242X_INTPND2			0x1a
> +#define AD242X_INTPND2_DSCDONE		BIT(0)
> +#define AD242X_INTPND2_I2CERR		BIT(1)
> +#define AD242X_INTPND2_ICRCERR		BIT(2)
> +#define AD242X_INTPND2_SLVIRQ		BIT(3)
> +
> +#define AD242X_INTMSK0			0x1b
> +#define AD242X_INTMSK0_HCEIEN		BIT(0)
> +#define AD242X_INTMSK0_DDEIEN		BIT(1)
> +#define AD242X_INTMSK0_CRCEIEN		BIT(2)
> +#define AD242X_INTMSK0_DPEIEN		BIT(3)
> +#define AD242X_INTMSK0_PWREIEN		BIT(4)
> +#define AD242X_INTMSK0_BECIEN		BIT(5)
> +#define AD242X_INTMSK0_SRFEIEN		BIT(6)
> +#define AD242X_INTMSK0_SRFCRCEIEN	BIT(7)
> +
> +#define AD242X_INTMSK1			0x1c
> +#define AD242X_INTMSK1_IOIRQEN(X)	BIT(X)
> +
> +#define AD242X_INTMSK2			0x1d
> +#define AD242X_INTMSK2_DSCDIEN		BIT(0)
> +#define AD242X_INTMSK2_I2CEIEN		BIT(1)
> +#define AD242X_INTMSK2_ICRCEIEN		BIT(2)
> +#define AD242X_INTMSK2_SLVIRQEN		BIT(3)
> +
> +#define AD242X_BECCTL			0x1e
> +#define AD242X_BECCTL_ENHDCNT		BIT(0)
> +#define AD242X_BECCTL_ENDD		BIT(1)
> +#define AD242X_BECCTL_ENCRC		BIT(2)
> +#define AD242X_BECCTL_ENDP		BIT(3)
> +#define AD242X_BECCTL_ENICRC		BIT(4)
> +#define AD242X_BECCTL_THRESHLD(X)	((X) >> 5)
> +
> +#define AD242X_BECNT			0x1f
> +
> +#define AD242X_TESTMODE			0x20
> +#define AD242X_TESTMODE_PRBSUP		BIT(0)
> +#define AD242X_TESTMODE_PRBSDN		BIT(1)
> +#define AD242X_TESTMODE_PRBSN2N		BIT(2)
> +#define AD242X_TESTMODE_RXDPTH(X)	((X) >> 4)
> +
> +#define AD242X_ERRCNT0			0x21
> +#define AD242X_ERRCNT1			0x22
> +#define AD242X_ERRCNT2			0x23
> +#define AD242X_ERRCNT3			0x24
> +
> +#define AD242X_NODE			0x29
> +#define AD242X_NODE_MASK		0xf
> +#define AD242X_NODE_DISCVD		BIT(5)
> +#define AD242X_NODE_NLAST		BIT(6)
> +#define AD242X_NODE_LAST		BIT(7)
> +
> +#define AD242X_DISCSTAT			0x2b
> +#define AD242X_DISCSTAT_DNODE(X)	((X) & 0xf)
> +#define AD242X_DISCSTAT_DSCACT		BIT(7)
> +
> +#define AD242X_TXACTL			0x2e
> +#define AD242X_TXACTL_LEVEL_HIGH	0
> +#define AD242X_TXACTL_LEVEL_MEDIUM	2
> +#define AD242X_TXACTL_LEVEL_LOW		3
> +
> +#define AD242X_TXBCTL			0x30
> +#define AD242X_TXBCTL_LEVEL_HIGH	0
> +#define AD242X_TXBCTL_LEVEL_MEDIUM	2
> +#define AD242X_TXBCTL_LEVEL_LOW		3
> +
> +#define AD242X_LINTTYPE			0x3e
> +
> +#define AD242X_I2CCFG			0x3f
> +#define AD242X_I2CCFG_DATARATE		BIT(0)
> +#define AD242X_I2CCFG_EACK		BIT(1)
> +#define AD242X_I2CCFG_FRAMERATE		BIT(2)
> +
> +#define AD242X_PLLCTL			0x40
> +#define AD242X_PLLCTL_SSFREQ(X)		((X) & 3)
> +#define AD242X_PLLCTL_SSDEPTH		BIT(2)
> +#define AD242X_PLLCTL_SSMODE_AB		(1 << 6)
> +#define AD242X_PLLCTL_SSMODE_AB_I2S	(2 << 6)
> +
> +#define AD242X_I2SGCTL			0x41
> +#define AD242X_I2SGCTL_TDMMODE(X)	((X) & 3)
> +#define AD242X_I2SGCTL_RXONDTX1		BIT(3)
> +#define AD242X_I2SGCTL_TDMSS		BIT(4)
> +#define AD242X_I2SGCTL_ALT		BIT(5)
> +#define AD242X_I2SGCTL_EARLY		BIT(6)
> +#define AD242X_I2SGCTL_INV		BIT(7)
> +
> +#define AD242X_I2SCTL			0x42
> +#define AD242X_I2SCTL_TX0EN		BIT(0)
> +#define AD242X_I2SCTL_TX1EN		BIT(1)
> +#define AD242X_I2SCTL_TX2PINTL		BIT(2)
> +#define AD242X_I2SCTL_TXBCLKINV		BIT(3)
> +#define AD242X_I2SCTL_RX0EN		BIT(4)
> +#define AD242X_I2SCTL_RX1EN		BIT(5)
> +#define AD242X_I2SCTL_RX2PINTL		BIT(6)
> +#define AD242X_I2SCTL_RXBCLKINV		BIT(7)
> +
> +#define AD242X_I2SRATE			0x43
> +#define AD242X_I2SRATE_I2SRATE(X)	((X) & 3)
> +#define AD242X_I2SRATE_BCLKRATE(X)	(((X) << 3) & 3)
> +#define AD242X_I2SRATE_REDUCE		BIT(6)
> +#define AD242X_I2SRATE_SHARE		BIT(7)
> +
> +#define AD242X_I2STXOFFSET		0x44
> +#define AD242X_I2STXOFFSET_VAR(X)	((X) & 0x3f)
> +#define AD242X_I2STXOFFSET_TSAFTER	BIT(6)
> +#define AD242X_I2STXOFFSET_TSBEFORE	BIT(7)
> +
> +#define AD242X_2SRXOFFSET		0x45
> +#define AD242X_I2SRXOFFSET_VAR(X)	((X) & 0x3f)
> +
> +#define AD242X_SYNCOFFSET		0x46
> +
> +#define AD242X_PDMCTL			0x47
> +#define AD242X_PDMCTL_PDM0EN		BIT(0)
> +#define AD242X_PDMCTL_PDM0SLOTS		BIT(1)
> +#define AD242X_PDMCTL_PDM1EN		BIT(2)
> +#define AD242X_PDMCTL_PDM1SLOTS		BIT(3)
> +#define AD242X_PDMCTL_HPFEN		BIT(4)
> +#define AD242X_PDMCTL_PDMRATE(X)	(((X) & 3) << 5)
> +
> +#define AD242X_ERRMGMT			0x48
> +#define AD242X_ERRMGMT_ERRLSB		BIT(0)
> +#define AD242X_ERRMGMT_ERRSIG		BIT(1)
> +#define AD242X_ERRMGMT_ERRSLOT		BIT(2)
> +
> +#define AD242X_GPIODAT			0x4a
> +#define AD242X_GPIODAT_SET		0x4b
> +#define AD242X_GPIODAT_CLR		0x4c
> +#define AD242X_GPIOOEN			0x4d
> +#define AD242X_GPIOIEN			0x4e
> +#define AD242X_GPIODAT_IN		0x4f
> +#define AD242X_PINTEN			0x50
> +#define AD242X_PINTINV			0x51
> +
> +#define AD242X_PINCFG			0x52
> +#define AD242X_PINCFG_DRVSTR		BIT(0)
> +#define AD242X_PINCFG_IRQINV		BIT(4)
> +#define AD242X_PINCFG_IRQTS		BIT(5)
> +
> +#define AD242X_I2STEST			0x53
> +#define AD242X_I2STEST_PATTRN2TX	BIT(0)
> +#define AD242X_I2STEST_LOOPBK2TX	BIT(1)
> +#define AD242X_I2STEST_RX2LOOPBK	BIT(2)
> +#define AD242X_I2STEST_SELRX1		BIT(3)
> +#define AD242X_I2STEST_BUSLOOPBK	BIT(4)
> +
> +#define AD242X_RAISE			0x54
> +
> +#define AD242X_GENERR			0x55
> +#define AD242X_GENERR_GENHCERR		BIT(0)
> +#define AD242X_GENERR_GENDDERR		BIT(1)
> +#define AD242X_GENERR_GENCRCERR		BIT(2)
> +#define AD242X_GENERR_GENDPERR		BIT(3)
> +#define AD242X_GENERR_GENICRCERR	BIT(4)
> +
> +#define AD242X_I2SRRATE			0x56
> +#define AD242X_I2SRRATE_RRDIV(X)	((X) & 0x3f)
> +#define AD242X_I2SRRATE_RBUS		BIT(7)
> +
> +#define AD242X_I2SRRCTL			0x57
> +#define AD242X_I2SRRCTL_ENVLSB		BIT(0)
> +#define AD242X_I2SRRCTL_ENXBIT		BIT(1)
> +#define AD242X_I2SRRCTL_ENSTRB		BIT(4)
> +#define AD242X_I2SRRCTL_STRBDIR		BIT(5)
> +
> +#define AD242X_I2SRRSOFFS		0x58
> +
> +#define AD242X_CLK1CFG			0x59
> +#define AD242X_CLK2CFG			0x5a
> +#define AD242X_CLKCFG_DIV(X)		((X) & 0xf)
> +#define AD242X_CLKCFG_DIVMSK		0xf
> +#define AD242X_CLKCFG_PDIV32		BIT(5)
> +#define AD242X_CLKCFG_INV		BIT(6)
> +#define AD242X_CLKCFG_EN		BIT(7)
> +
> +#define AD242X_BMMCFG			0x5b
> +#define AD242X_BMMCFG_BMMEN		BIT(0)
> +#define AD242X_BMMCFG_BMMRXEN		BIT(1)
> +#define AD242X_BMMCFG_BMMNDSC		BIT(2)
> +
> +#define AD242X_PDMCTL2			0x5d
> +#define AD242X_PDMCTL2_DEST_A2B		0
> +#define AD242X_PDMCTL2_DEST_DTX		1
> +#define AD242X_PDMCTL2_DEST_A2B_DTX	2
> +
> +#define AD242X_UPMASK(X)		(0x60 + ((X) & 3))
> +
> +#define AD242X_UPOFFSET			0x64
> +#define AD242X_UPOFFSET_VAL(X)		((X) & 0x1f)
> +
> +#define AD242X_DNMASK(X)		(0x65 + ((X) % 3))
> +
> +#define AD242X_DNOFFSET			0x69
> +#define AD242X_DNOFFSET_VAL(X)		((X) & 0x1f)
> +
> +#define AD242X_CHIPID(X)		((X) + 0x6a)
> +
> +#define AD242X_GPIODEN			0x80
> +#define AD242X_GPIOD_MSK(X)		((X) + 0x81)
> +
> +#define AD242X_GPIODDAT			0x89
> +#define AD242X_GPIODINV			0x8a
> +
> +#define AD242X_MAX_REG			0x9b
> +
> +static inline bool ad242x_is_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case AD242X_VENDOR:
> +	case AD242X_PRODUCT:
> +	case AD242X_VERSION:
> +	case AD242X_CAPABILITY:
> +	case AD242X_SWSTAT:
> +	case AD242X_INTSTAT:
> +	case AD242X_INTSRC:
> +	case AD242X_INTTYPE:
> +	case AD242X_INTPND0:
> +	case AD242X_INTPND1:
> +	case AD242X_INTPND2:
> +	case AD242X_BECNT:
> +	case AD242X_ERRCNT0:
> +	case AD242X_ERRCNT1:
> +	case AD242X_ERRCNT2:
> +	case AD242X_ERRCNT3:
> +	case AD242X_NODE:
> +	case AD242X_DISCSTAT:
> +	case AD242X_LINTTYPE:
> +	case AD242X_GPIODAT:
> +	case AD242X_GPIODAT_IN:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static inline bool ad242x_is_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	/* Write-to-clean registers */
> +	switch (reg) {
> +	case AD242X_INTPND0:
> +	case AD242X_INTPND1:
> +	case AD242X_INTPND2:
> +	case AD242X_BECNT:
> +		return true;
> +	default:
> +		return !ad242x_is_volatile_reg(dev, reg);
> +	}
> +}
> +
> +#define AD242X_MASTER_ID 0xff
> +
> +struct ad242x_master;
> +
> +struct ad242x_i2c_bus {
> +	struct i2c_client	*client;
> +	struct mutex		mutex;
> +};
> +
> +struct ad242x_node {
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	struct ad242x_master	*master;
> +	unsigned int		tdm_mode;
> +	unsigned int		tdm_slot_size;
> +	uint8_t			id;
> +	uint8_t			caps;
> +};
> +
> +struct ad242x_slot_config {
> +	unsigned int dn_rx_slots;
> +	unsigned int dn_n_tx_slots;
> +	unsigned int dn_n_forward_slots;
> +	unsigned int up_rx_slots;
> +	unsigned int up_n_tx_slots;
> +	unsigned int up_n_forward_slots;
> +};
> +
> +int ad242x_read_slot_config(struct device *dev,
> +			    struct device_node *np,
> +			    struct ad242x_slot_config *config);
> +
> +static inline bool ad242x_node_is_master(struct ad242x_node *node)
> +{
> +	return node->id == AD242X_MASTER_ID;
> +}
> +
> +int ad242x_node_probe(struct ad242x_node *node);
> +int ad242x_node_add_mfd_cells(struct device *dev);
> +
> +struct ad242x_node *ad242x_master_get_node(struct ad242x_master *master);
> +struct ad242x_i2c_bus *ad242x_master_get_bus(struct ad242x_master *master);
> +const char *ad242x_master_get_clk_name(struct ad242x_master *master);
> +unsigned int ad242x_master_get_clk_rate(struct ad242x_master *master);
> +
> +int ad242x_slave_read(struct ad242x_i2c_bus *bus,
> +		      struct regmap *master_regmap,
> +		      uint8_t node_id, uint8_t reg, unsigned int *val);
> +int ad242x_slave_write(struct ad242x_i2c_bus *bus,
> +		       struct regmap *master_regmap,
> +		       uint8_t node_id, uint8_t reg, unsigned int val);
> +
> +#endif

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
