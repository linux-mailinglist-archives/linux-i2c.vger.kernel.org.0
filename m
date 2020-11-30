Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C532C9274
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 00:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388013AbgK3XWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 18:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgK3XWl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 18:22:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43631C0613CF;
        Mon, 30 Nov 2020 15:22:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 257E993;
        Tue,  1 Dec 2020 00:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606778518;
        bh=2rZbLW54bWofYEhqpSjR8n/RiQEA9IFG0ZE3J1Tl/aE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HuuIPMEOwH4NZ8aZWjt+cx9M4J4hhh7ObDG38HBMhOT8aTpScH8gGtV45aQKzVCHb
         caBwLmBSHbNpXYBlijLRFD1ZdqI2m6eevga8awsAe0PIq0v1EunZeRHBJV0PWLPS22
         9PKVDWJMB+TFlaqJ81VUcrSWv2skfqrkIoOzTurs=
Date:   Tue, 1 Dec 2020 01:21:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201130232150.GC25713@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130205203.GQ4351@valkosipuli.retiisi.org.uk>
 <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e8494a0-a2c0-59e7-46bb-9635c3c239dd@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

On Mon, Nov 30, 2020 at 11:06:03PM +0000, Dan Scally wrote:
> On 30/11/2020 20:52, Sakari Ailus wrote:
> >> +static const struct acpi_device_id int3472_device_id[] = {
> >> +	{ "INT3472", 0 },
> >
> > The INT3472 _HID is really allocated for the tps68470 PMIC chip. It may not
> > be used by other drivers; people will want to build kernels where both of
> > these ACPI table layouts are functional.

I actually don't think it is, at least not if you consider how Intel
uses it. It can mean TI TPS64870, uPI Semi uP6641Q, or "discrete
regulator". It's called an "Intel camera power management device" in
Windows if I remember correctly.

If we go in the direction of creating a platform driver for this ACPI
HID, it should be called accordingly (int3472, intel-camera-pmic, ...),
check the device type from the CLDB, and register the right device.

One Chrome OS platforms, INT3472 refers to the TPS64870 only, and the
ACPI device object doesn't have a CLDB. That's easy to detect, and we
can enable tps64870 support when there's no CLDB. Note that for the
TPS64870 case, when a CLDB is present, the kernel driver will need to
register regulators and clocks, while when no CLDB is present, it will
need to register an opregion as done today. That's yet another mode of
operation of this driver.

> > Instead, I propose, that you add this as an option to the tps68470 driver
> > that figures out whether the ACPI device for the tps68470 device actually
> > describes something else, in a similar fashion you do with the cio2-bridge
> > driver. I think it may need a separate Kconfig option albeit this and
> > cio2-bridge cannot be used separately.
> 
> It actually occurs to me that that may not work (I know I called that
> out as an option we considered, but that was a while ago actually). The
> reason I wasn't worried about the existing tps68470 driver binding to
> these devices is that it's an i2c driver, and these dummy devices don't
> have an I2cSerialBusV2, so no I2C device is created by them the kernel.
> 
> Won't that mean the tps68470 driver won't ever be probed for these devices?

I think we can create a platform driver in that case. The same module
can register multiple drivers (platform and I2C).

> >> +	{ },
> >> +};
> >> +MODULE_DEVICE_TABLE(acpi, int3472_device_id);
> >> +
> >> +static struct acpi_driver int3472_driver = {
> >> +	.name = "int3472",
> >> +	.ids = int3472_device_id,
> >> +	.ops = {
> >> +		.add = int3472_add,
> >> +		.remove = int3472_remove,
> >> +	},
> >> +	.owner = THIS_MODULE,
> >> +};
> >> +
> >> +module_acpi_driver(int3472_driver);
> >> +
> >> +MODULE_LICENSE("GPL v2");
> >> +MODULE_AUTHOR("Dan Scally <djrscally@gmail.com>");
> >> +MODULE_DESCRIPTION("ACPI Driver for Discrete type INT3472 ACPI Devices");
> >> diff --git a/drivers/media/pci/intel/ipu3/int3472.h b/drivers/media/pci/intel/ipu3/int3472.h
> >> new file mode 100644
> >> index 000000000000..6964726e8e1f
> >> --- /dev/null
> >> +++ b/drivers/media/pci/intel/ipu3/int3472.h
> >> @@ -0,0 +1,96 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/* Author: Dan Scally <djrscally@gmail.com> */
> >> +#include <linux/regulator/machine.h>
> >> +
> >> +#define INT3472_MAX_SENSOR_GPIOS			3
> >> +#define GPIO_REGULATOR_NAME_LENGTH			17
> >> +#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH		9
> >> +
> >> +#define INT3472_REGULATOR(_NAME, _SUPPLY, _ID, _OPS)	\
> >> +	((const struct regulator_desc) {		\
> >> +		.name = _NAME,				\
> >> +		.supply_name = _SUPPLY,			\
> >> +		.id = _ID,				\
> >> +		.type = REGULATOR_VOLTAGE,		\
> >> +		.ops = _OPS,				\
> >> +		.owner = THIS_MODULE,			\
> >> +	})
> >> +
> >> +const guid_t int3472_gpio_guid = GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> >> +					     0xa5, 0xc1, 0xb5, 0xaa, 0x8b,
> >> +					     0x19, 0x75, 0x6f);
> >> +
> >> +const guid_t cio2_sensor_module_guid = GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> >> +						 0xa5, 0x6b, 0x5f, 0x02, 0x9f,
> >> +						 0xe0, 0x79, 0xee);
> >> +
> >> +struct int3472_cldb {
> >> +	u8 version;
> >> +	/*
> >> +	 * control logic type
> >> +	 * 0: UNKNOWN
> >> +	 * 1: DISCRETE(CRD-D)
> >> +	 * 2: PMIC TPS68470
> >> +	 * 3: PMIC uP6641
> >> +	 */
> >> +	u8 control_logic_type;
> >> +	u8 control_logic_id;
> >> +	u8 sensor_card_sku;
> >> +	u8 reserved[28];
> >> +};
> >> +
> >> +struct int3472_device {
> >> +	struct acpi_device *adev;
> >> +	struct acpi_device *sensor;
> >> +
> >> +	unsigned int n_gpios; /* how many GPIOs have we seen */
> >> +
> >> +	unsigned int n_regulators;
> >> +	struct list_head regulators;
> >> +
> >> +	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
> >> +	struct gpiod_lookup_table gpios;
> >> +};
> >> +
> >> +struct int3472_gpio_regulator {
> >> +	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
> >> +	char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
> >> +	struct gpio_desc *gpio;
> >> +	struct regulator_dev *rdev;
> >> +	struct regulator_desc rdesc;
> >> +	struct list_head list;
> >> +};
> >> +
> >> +struct int3472_sensor_regulator_map {
> >> +	char *sensor_module_name;
> >> +	unsigned int n_supplies;
> >> +	struct regulator_consumer_supply *supplies;
> >> +};
> >> +
> >> +/*
> >> + * Here follows platform specific mapping information that we can pass to
> >> + * regulator_init_data when we register our regulators. They're just mapped
> >> + * via index, I.E. the first regulator pin that the code finds for the
> >> + * i2c-OVTI2680:00 device is avdd, the second is dovdd and so on.
> >> + */
> >> +
> >> +static struct regulator_consumer_supply miix_510_ov2680[] = {
> >> +	{ "i2c-OVTI2680:00", "avdd" },
> >> +	{ "i2c-OVTI2680:00", "dovdd" },
> >> +};
> >> +
> >> +static struct regulator_consumer_supply surface_go2_ov5693[] = {
> >> +	{ "i2c-INT33BE:00", "avdd" },
> >> +	{ "i2c-INT33BE:00", "dovdd" },
> >> +};
> >> +
> >> +static struct regulator_consumer_supply surface_book_ov5693[] = {
> >> +	{ "i2c-INT33BE:00", "avdd" },
> >> +	{ "i2c-INT33BE:00", "dovdd" },
> >> +};
> >> +
> >> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> >> +	{ "GNDF140809R", 2, miix_510_ov2680 },
> >> +	{ "YHCU", 2, surface_go2_ov5693 },
> >> +	{ "MSHW0070", 2, surface_book_ov5693 },
> >> +};

-- 
Regards,

Laurent Pinchart
