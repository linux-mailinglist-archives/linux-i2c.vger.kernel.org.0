Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4BE2C8938
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgK3QSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:18:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60082 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbgK3QSd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:18:33 -0500
Received: from [IPv6:2a01:e0a:169:7140:a584:b2c9:4b50:852e] (unknown [IPv6:2a01:e0a:169:7140:a584:b2c9:4b50:852e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CD74F7F;
        Mon, 30 Nov 2020 17:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606753069;
        bh=SPBcNrBmgtjZCWAEX6BLFoc09fZseCF4o2ruMnq7FBM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JX+RVUZrSD81S7d/NeHOXpSQgCBS360pne5JtSW+WBvRhP4EKzio+hS1v5V6eE5UO
         rxn9yDcuBzryOne6YY8/JIAyTxuxuzCpPibi/XIhTqdFpReBqBg9IcPf5tYfeifuT+
         pXG1OKKBlTo4XONWCLQziTvbPBqmbTZSvNVKW3Xs=
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Message-ID: <f5aca6eb-cc41-64d6-cb72-19ee3a8afd1e@ideasonboard.com>
Date:   Mon, 30 Nov 2020 17:17:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130133129.1024662-19-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thanks for the patch !

On 30/11/2020 14:31, Daniel Scally wrote:
> On platforms where ACPI is designed for use with Windows, resources
> that are intended to be consumed by sensor devices are sometimes in
> the _CRS of a dummy INT3472 device upon which the sensor depends. This
> driver binds to the dummy acpi device (which does not represent a
> physical PMIC) and maps them into GPIO lines and regulators for use by
> the sensor device instead.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	- Patch introduced
> 
> This patch contains the bits of this process that we're least sure about.
> The sensors in scope for this work are called out as dependent (in their
> DSDT entry's _DEP) on a device with _HID INT3472. These come in at least
> 2 kinds; those with an I2cSerialBusV2 entry (which we presume therefore
> are legitimate tps68470 PMICs that need handling by those drivers - work
> on that in the future). And those without an I2C device. For those without
> an I2C device they instead have an array of GPIO pins defined in _CRS. So
> for example, my Lenovo Miix 510's OVTI2680 sensor is dependent on one of
> the _latter_ kind of INT3472 devices, with this _CRS:
> 
> Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> {
>     Name (SBUF, ResourceTemplate ()
>     {
>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> 	    0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x0079
>             }
>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> 	    0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x007A
>             }
>         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> 	    0x00, ResourceConsumer, ,
>             )
>             {   // Pin list
>                 0x008F
>             }
>     })
>     Return (SBUF) /* \_SB_.PCI0.PMI1._CRS.SBUF */
> }
> 
> and the same device has a _DSM Method, which returns 32-bit ints where
> the second lowest byte we noticed to match the pin numbers of the GPIO
> lines:
> 
> Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
> {
>     If ((Arg0 == ToUUID ("79234640-9e10-4fea-a5c1-b5aa8b19756f")))
>     {
>         If ((Arg2 == One))
>         {
>             Return (0x03)
>         }
> 
>         If ((Arg2 == 0x02))
>         {
>             Return (0x01007900)
>         }
> 
>         If ((Arg2 == 0x03))
>         {
>             Return (0x01007A0C)
>         }
> 
>         If ((Arg2 == 0x04))
>         {
>             Return (0x01008F01)
>         }
>     }
> 
>     Return (Zero)
> }
> 
> We know that at least some of those pins have to be toggled active for the
> sensor devices to be available in i2c, so the conclusion we came to was
> that those GPIO entries assigned to the INT3472 device actually represent
> GPIOs and regulators to be consumed by the sensors themselves. Tsuchiya
> noticed that the lowest byte in the return values of the _DSM method
> seemed to represent the type or function of the GPIO line, and we
> confirmed that by testing on each surface device that GPIO lines where the
> low byte in the _DSM entry for that pin was 0x0d controlled the privacy
> LED of the cameras.
> 
> We're guessing as to the exact meaning of the function byte, but I
> conclude they're something like this:
> 
> 0x00 - probably a reset GPIO
> 0x01 - regulator for the sensor
> 0x0c - regulator for the sensor
> 0x0b - regulator again, but for a VCM or EEPROM

Is it possible that the ad5823 would be here, and controled by this bit ?

> 0x0d - privacy led (only one we're totally confident of since we can see
>        it happen!)
> 
> After much internal debate I decided to write this as a standalone
> acpi_driver. Alternative options we considered:
> 
> 1. Squash all this into the cio2-bridge code, which I did originally write
> but decided I didn't like.
> 2. Extend the existing tps68470 mfd driver...they share an ACPI ID so this
> kinda makes sense, but ultimately given there is no actual physical
> tps68470 in the scenario this patch handles I decided I didn't like this
> either.
> 
>  MAINTAINERS                            |   7 +
>  drivers/media/pci/intel/ipu3/Kconfig   |  14 +
>  drivers/media/pci/intel/ipu3/Makefile  |   1 +
>  drivers/media/pci/intel/ipu3/int3472.c | 381 +++++++++++++++++++++++++
>  drivers/media/pci/intel/ipu3/int3472.h |  96 +++++++
>  5 files changed, 499 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu3/int3472.c
>  create mode 100644 drivers/media/pci/intel/ipu3/int3472.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 188559a0a610..d73471f9c2a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8753,6 +8753,13 @@ L:	linux-crypto@vger.kernel.org
>  S:	Maintained
>  F:	drivers/crypto/inside-secure/
>  
> +INT3472 ACPI DEVICE DRIVER
> +M:	Daniel Scally <djrscally@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/pci/intel/ipu3/int3472.c
> +F:	drivers/media/pci/intel/ipu3/int3472.h
> +
>  INTEGRITY MEASUREMENT ARCHITECTURE (IMA)
>  M:	Mimi Zohar <zohar@linux.ibm.com>
>  M:	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
> index 2b3350d042be..9dd3b280f821 100644
> --- a/drivers/media/pci/intel/ipu3/Kconfig
> +++ b/drivers/media/pci/intel/ipu3/Kconfig
> @@ -34,3 +34,17 @@ config CIO2_BRIDGE
>  		- Dell 7285
>  
>  	  If in doubt, say N here.
> +
> +config INT3472
> +	tristate "INT3472 Dummy ACPI Device Driver"
> +	depends on VIDEO_IPU3_CIO2
> +	depends on ACPI && REGULATOR && GPIOLIB
> +	help
> +	  This module provides an ACPI driver for INT3472 devices that do not
> +	  represent an actual physical tps68470 device.
> +
> +	  Say Y here if your device is a detachable / hybrid laptop that comes
> +	  with Windows installed by the OEM.
> +	  The module will be called int3472.
> +
> +	  If in doubt, say N here.

Is there any issue if the tps68470 driver is also selected and probed ?

> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
> index 933777e6ea8a..2285947b2bd2 100644
> --- a/drivers/media/pci/intel/ipu3/Makefile
> +++ b/drivers/media/pci/intel/ipu3/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
> +obj-$(CONFIG_INT3472) += int3472.o
>  
>  ipu3-cio2-y += ipu3-cio2-main.o
>  ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
> diff --git a/drivers/media/pci/intel/ipu3/int3472.c b/drivers/media/pci/intel/ipu3/int3472.c
> new file mode 100644
> index 000000000000..6b0be75f7f35
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu3/int3472.c
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +#include <linux/acpi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/regulator/driver.h>
> +
> +#include "int3472.h"
> +
> +/*
> + * The regulators have to have .ops to be valid, but the only ops we actually
> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> + * empty struct to clear the check without lying about capabilities.
> + */
> +static const struct regulator_ops int3472_gpio_regulator_ops = { 0 };
> +
> +static int int3472_map_gpio_to_sensor(struct int3472_device *int3472,
> +				      struct acpi_resource *ares, char *func)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;
> +	struct gpiod_lookup table_entry;
> +	struct acpi_device *adev;
> +	acpi_handle handle;
> +	acpi_status status;
> +	int ret;
> +
> +	/* Make sure we don't overflow, and leave room for a terminator */
> +	if (int3472->n_sensor_gpios >= INT3472_MAX_SENSOR_GPIOS) {
> +		dev_warn(&int3472->sensor->dev, "Too many GPIOs mapped\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Fetch ACPI handle for the GPIO chip  */
> +	status = acpi_get_handle(NULL, path, &handle);
> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
> +
> +	ret = acpi_bus_get_device(handle, &adev);
> +	if (ret)
> +		return -ENODEV;
> +
> +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
> +							   ares->data.gpio.pin_table[0],
> +							   func, 0, GPIO_ACTIVE_HIGH);
> +
> +	memcpy(&int3472->gpios.table[int3472->n_sensor_gpios], &table_entry,
> +	       sizeof(table_entry));
> +	int3472->n_sensor_gpios++;
> +
> +	return 0;
> +}
> +
> +static struct int3472_sensor_regulator_map *
> +int3472_get_sensor_supply_map(struct int3472_device *int3472)
> +{
> +	struct int3472_sensor_regulator_map *ret;
> +	union acpi_object *obj;
> +	unsigned int i;
> +
> +	/*
> +	 * Sensor modules seem to be identified by a unique string. We use that
> +	 * to make sure we pass the right device and supply names to the new
> +	 * regulator's consumer_supplies
> +	 */
> +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
> +				      &cio2_sensor_module_guid, 0x00,
> +				      0x01, NULL, ACPI_TYPE_STRING);
> +
> +	if (!obj) {
> +		dev_err(&int3472->sensor->dev,
> +			"Failed to get sensor module string from _DSM\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	if (obj->string.type != ACPI_TYPE_STRING) {
> +		dev_err(&int3472->sensor->dev,
> +			"Sensor _DSM returned a non-string value\n");
> +		ret = ERR_PTR(-EINVAL);
> +		goto out_free_obj;
> +	}
> +
> +	ret = ERR_PTR(-ENODEV);
> +	for (i = 0; i < ARRAY_SIZE(int3472_sensor_regulator_maps); i++) {
> +		if (!strcmp(int3472_sensor_regulator_maps[i].sensor_module_name,
> +			    obj->string.pointer)) {
> +			ret = &int3472_sensor_regulator_maps[i];
> +			goto out_free_obj;
> +		}
> +	}
> +
> +out_free_obj:
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static int int3472_register_regulator(struct int3472_device *int3472,
> +				      struct acpi_resource *ares)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;
> +	struct int3472_sensor_regulator_map *regulator_map;
> +	struct regulator_init_data init_data = { };
> +	struct int3472_gpio_regulator *regulator;
> +	struct regulator_config cfg = { };
> +	int ret;
> +
> +	/*
> +	 * We lookup supply names from machine specific tables, based on a
> +	 * unique identifier in the sensor's _DSM
> +	 */
> +	regulator_map = int3472_get_sensor_supply_map(int3472);
> +	if (IS_ERR_OR_NULL(regulator_map)) {
> +		dev_err(&int3472->sensor->dev,
> +			"Found no supplies defined for this sensor\n");
> +		return PTR_ERR(regulator_map);
> +	}
> +
> +	if (int3472->n_regulators >= regulator_map->n_supplies) {
> +		dev_err(&int3472->sensor->dev,
> +			"All known supplies are already mapped\n");
> +		return -EINVAL;
> +	}
> +
> +	init_data.supply_regulator = NULL;
> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> +	init_data.num_consumer_supplies = 1;
> +	init_data.consumer_supplies = &regulator_map->supplies[int3472->n_regulators];
> +
> +	regulator = kmalloc(sizeof(*regulator), GFP_KERNEL);
> +	if (!regulator)
> +		return -ENOMEM;
> +
> +	snprintf(regulator->regulator_name, GPIO_REGULATOR_NAME_LENGTH,
> +		 "gpio-regulator-%d", int3472->n_regulators);
> +	snprintf(regulator->supply_name, GPIO_REGULATOR_SUPPLY_NAME_LENGTH,
> +		 "supply-%d", int3472->n_regulators);
> +
> +	regulator->rdesc = INT3472_REGULATOR(regulator->regulator_name,
> +					     regulator->supply_name,
> +					     int3472->n_regulators,
> +					     &int3472_gpio_regulator_ops);
> +
> +	regulator->gpio = acpi_get_gpiod(path, ares->data.gpio.pin_table[0]);
> +	if (IS_ERR(regulator->gpio)) {
> +		ret = PTR_ERR(regulator->gpio);
> +		goto err_free_regulator;
> +	}
> +
> +	cfg.dev = &int3472->adev->dev;
> +	cfg.init_data = &init_data;
> +	cfg.ena_gpiod = regulator->gpio;
> +
> +	regulator->rdev = regulator_register(&regulator->rdesc, &cfg);
> +	if (IS_ERR(regulator->rdev)) {
> +		ret = PTR_ERR(regulator->rdev);
> +		goto err_free_gpio;
> +	}
> +
> +	list_add(&regulator->list, &int3472->regulators);
> +	int3472->n_regulators++;
> +
> +	return 0;
> +
> +err_free_gpio:
> +	gpiod_put(regulator->gpio);
> +err_free_regulator:
> +	kfree(regulator);
> +
> +	return ret;
> +}
> +
> +static int int3472_handle_gpio_resources(struct acpi_resource *ares,
> +					 void *data)
> +{
> +	struct int3472_device *int3472 = data;
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO ||
> +	    ares->data.gpio.connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
> +		return EINVAL; /* Deliberately positive */
> +
> +	/*
> +	 * n_gpios + 2 because the index of this _DSM function is 1-based and
> +	 * the first function is just a count.
> +	 */
> +	obj = acpi_evaluate_dsm_typed(int3472->adev->handle,
> +				      &int3472_gpio_guid, 0x00,
> +				      int3472->n_gpios + 2,
> +				      NULL, ACPI_TYPE_INTEGER);
> +
> +	if (!obj) {
> +		dev_warn(&int3472->adev->dev,
> +			 "No _DSM entry for this GPIO pin\n");
> +		return ENODEV;
> +	}
> +
> +	switch (obj->integer.value & 0xff) { /* low byte holds type data */
> +	case 0x00: /* Purpose unclear, possibly a reset GPIO pin */
> +		ret = int3472_map_gpio_to_sensor(int3472, ares, "reset");
> +		if (ret)
> +			dev_warn(&int3472->adev->dev,
> +				 "Failed to map reset pin to sensor\n");
> +
> +		break;
> +	case 0x01: /* Power regulators (we think) */
> +	case 0x0c:
> +		ret = int3472_register_regulator(int3472, ares);
> +		if (ret)
> +			dev_warn(&int3472->adev->dev,
> +				 "Failed to map regulator to sensor\n");
> +
> +		break;
> +	case 0x0b: /* Power regulators, but to a device separate to sensor */
> +		ret = int3472_register_regulator(int3472, ares);
> +		if (ret)
> +			dev_warn(&int3472->adev->dev,
> +				 "Failed to map regulator to sensor\n");
> +
> +		break;
> +	case 0x0d: /* Indicator LEDs */
> +		ret = int3472_map_gpio_to_sensor(int3472, ares, "indicator-led");
> +		if (ret)
> +			dev_warn(&int3472->adev->dev,
> +				 "Failed to map indicator led to sensor\n");
> +
> +		break;
> +	default:
> +		/* if we've gotten here, we're not sure what they are yet */
> +		dev_warn(&int3472->adev->dev,
> +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
> +			 (obj->integer.value & 0xff));
> +		ret = EINVAL;
> +	}
> +
> +	int3472->n_gpios++;
> +	ACPI_FREE(obj);
> +	return abs(ret);
> +}
> +
> +static void int3472_parse_crs(struct int3472_device *int3472)
> +{
> +	struct list_head resource_list;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	acpi_dev_get_resources(int3472->adev, &resource_list,
> +			       int3472_handle_gpio_resources, int3472);
> +
> +	acpi_dev_free_resource_list(&resource_list);
> +	gpiod_add_lookup_table(&int3472->gpios);
> +}
> +
> +static int int3472_add(struct acpi_device *adev)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct int3472_device *int3472;
> +	struct int3472_cldb cldb;
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret = 0;
> +
> +	/*
> +	 * This driver is only intended to support "dummy" INT3472 devices
> +	 * which appear in ACPI designed for Windows. These are distinguishable
> +	 * from INT3472 entries representing an actual tps68470 PMIC through
> +	 * the presence of a CLDB buffer with a particular value set.
> +	 */
> +	status = acpi_evaluate_object(adev->handle, "CLDB", NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	obj = buffer.pointer;
> +	if (!obj) {
> +		dev_err(&adev->dev, "ACPI device has no CLDB object\n");
> +		return -ENODEV;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&adev->dev, "CLDB object is not an ACPI buffer\n");
> +		ret = -EINVAL;
> +		goto out_free_buff;
> +	}
> +
> +	if (obj->buffer.length > sizeof(cldb)) {
> +		dev_err(&adev->dev, "The CLDB buffer is too large\n");
> +		ret = -EINVAL;
> +		goto out_free_buff;
> +	}
> +
> +	memcpy(&cldb, obj->buffer.pointer, obj->buffer.length);
> +
> +	/*
> +	 * control_logic_type = 1 indicates this is a dummy INT3472 device of
> +	 * the kind we're looking for. If any other value then we shouldn't try
> +	 * to handle it
> +	 */
> +	if (cldb.control_logic_type != 1) {
> +		ret = -EINVAL;
> +		goto out_free_buff;
> +	}
> +
> +	/* Space for 4 GPIOs - one more than we've seen so far plus a null */
> +	int3472 = kzalloc(sizeof(*int3472) +
> +			 ((INT3472_MAX_SENSOR_GPIOS + 1) * sizeof(struct gpiod_lookup)),
> +			 GFP_KERNEL);
> +	if (!int3472) {
> +		ret = -ENOMEM;
> +		goto out_free_buff;
> +	}
> +
> +	int3472->adev = adev;
> +	adev->driver_data = int3472;
> +
> +	int3472->sensor = acpi_dev_get_next_dep_dev(adev, NULL);
> +	if (!int3472->sensor) {
> +		dev_err(&adev->dev,
> +			"This INT3472 entry seems to have no dependents.\n");
> +		ret = -ENODEV;
> +		goto out_free_int3472;
> +	}
> +
> +	int3472->gpios.dev_id = i2c_acpi_dev_name(int3472->sensor);
> +
> +	INIT_LIST_HEAD(&int3472->regulators);
> +
> +	int3472_parse_crs(int3472);
> +
> +	goto out_free_buff;
> +
> +out_free_int3472:
> +	kfree(int3472);
> +out_free_buff:
> +	kfree(buffer.pointer);
> +	return ret;
> +}
> +
> +static int int3472_remove(struct acpi_device *adev)
> +{
> +	struct int3472_gpio_regulator *reg;
> +	struct int3472_device *int3472;
> +
> +	int3472 = acpi_driver_data(adev);
> +
> +	acpi_dev_put(int3472->sensor);
> +	gpiod_remove_lookup_table(&int3472->gpios);
> +
> +	list_for_each_entry(reg, &int3472->regulators, list) {
> +		gpiod_put(reg->gpio);
> +		regulator_unregister(reg->rdev);
> +	}
> +
> +	kfree(int3472);
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id int3472_device_id[] = {
> +	{ "INT3472", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, int3472_device_id);
> +
> +static struct acpi_driver int3472_driver = {
> +	.name = "int3472",
> +	.ids = int3472_device_id,
> +	.ops = {
> +		.add = int3472_add,
> +		.remove = int3472_remove,
> +	},
> +	.owner = THIS_MODULE,
> +};
> +
> +module_acpi_driver(int3472_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Dan Scally <djrscally@gmail.com>");
> +MODULE_DESCRIPTION("ACPI Driver for Discrete type INT3472 ACPI Devices");
> diff --git a/drivers/media/pci/intel/ipu3/int3472.h b/drivers/media/pci/intel/ipu3/int3472.h
> new file mode 100644
> index 000000000000..6964726e8e1f
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu3/int3472.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +#include <linux/regulator/machine.h>
> +
> +#define INT3472_MAX_SENSOR_GPIOS			3
> +#define GPIO_REGULATOR_NAME_LENGTH			17
> +#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH		9
> +
> +#define INT3472_REGULATOR(_NAME, _SUPPLY, _ID, _OPS)	\
> +	((const struct regulator_desc) {		\
> +		.name = _NAME,				\
> +		.supply_name = _SUPPLY,			\
> +		.id = _ID,				\
> +		.type = REGULATOR_VOLTAGE,		\
> +		.ops = _OPS,				\
> +		.owner = THIS_MODULE,			\
> +	})
> +
> +const guid_t int3472_gpio_guid = GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> +					     0xa5, 0xc1, 0xb5, 0xaa, 0x8b,
> +					     0x19, 0x75, 0x6f);
> +
> +const guid_t cio2_sensor_module_guid = GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> +						 0xa5, 0x6b, 0x5f, 0x02, 0x9f,
> +						 0xe0, 0x79, 0xee);
> +
> +struct int3472_cldb {
> +	u8 version;
> +	/*
> +	 * control logic type
> +	 * 0: UNKNOWN
> +	 * 1: DISCRETE(CRD-D)
> +	 * 2: PMIC TPS68470
> +	 * 3: PMIC uP6641
> +	 */
> +	u8 control_logic_type;
> +	u8 control_logic_id;
> +	u8 sensor_card_sku;
> +	u8 reserved[28];
> +};
> +
> +struct int3472_device {
> +	struct acpi_device *adev;
> +	struct acpi_device *sensor;
> +
> +	unsigned int n_gpios; /* how many GPIOs have we seen */
> +
> +	unsigned int n_regulators;
> +	struct list_head regulators;
> +
> +	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
> +	struct gpiod_lookup_table gpios;
> +};
> +
> +struct int3472_gpio_regulator {
> +	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
> +	char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
> +	struct gpio_desc *gpio;
> +	struct regulator_dev *rdev;
> +	struct regulator_desc rdesc;
> +	struct list_head list;
> +};
> +
> +struct int3472_sensor_regulator_map {
> +	char *sensor_module_name;
> +	unsigned int n_supplies;
> +	struct regulator_consumer_supply *supplies;
> +};
> +
> +/*
> + * Here follows platform specific mapping information that we can pass to
> + * regulator_init_data when we register our regulators. They're just mapped
> + * via index, I.E. the first regulator pin that the code finds for the
> + * i2c-OVTI2680:00 device is avdd, the second is dovdd and so on.
> + */
> +
> +static struct regulator_consumer_supply miix_510_ov2680[] = {
> +	{ "i2c-OVTI2680:00", "avdd" },
> +	{ "i2c-OVTI2680:00", "dovdd" },
> +};
> +
> +static struct regulator_consumer_supply surface_go2_ov5693[] = {
> +	{ "i2c-INT33BE:00", "avdd" },
> +	{ "i2c-INT33BE:00", "dovdd" },
> +};
> +
> +static struct regulator_consumer_supply surface_book_ov5693[] = {
> +	{ "i2c-INT33BE:00", "avdd" },
> +	{ "i2c-INT33BE:00", "dovdd" },
> +};
> +
> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> +	{ "GNDF140809R", 2, miix_510_ov2680 },
> +	{ "YHCU", 2, surface_go2_ov5693 },
> +	{ "MSHW0070", 2, surface_book_ov5693 },
> +};
> 

Thanks,
JM
