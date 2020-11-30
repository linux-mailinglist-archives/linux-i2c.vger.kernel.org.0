Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D902C926F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 00:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgK3XVk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 18:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgK3XVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 18:21:39 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B68C0613CF;
        Mon, 30 Nov 2020 15:20:59 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id k14so18669597wrn.1;
        Mon, 30 Nov 2020 15:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=poMYMWTe44BVmUmsz53Cj9nyFaS8ZMu6uSB3yX6csqA=;
        b=iyN+Yl5RlhR4ncV4iXuNpCEWwIXNC/rDR8vbUg0HWWnJf+wUQ/5sJI2lyegKMbhfdy
         7996H3Fgmm+exxsJTU2wAmCpFtnsy+j8Qxa7WnzPxTRbDxF+ABH5WyQ9ra2sxU7VXjEf
         UJS8noVM7EgPeRNG8FgbwMkj9RnV0rm0ums/xumskqef2sWb2RQ1HQDlzqxPCvWFGigs
         TgT2DjIsiPbiYbKEUHbhWAFU0CUWbGIx/rsFfHoGOtEMfbe3HrBvvJkZYrKk59WL3X5W
         fDXGkUtWKTnwPvkxxfsMQ5Jyfpbba9m/rpb5XIHHyirL5wi/Ys7zpj5hCEUEooHQxG5y
         pfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=poMYMWTe44BVmUmsz53Cj9nyFaS8ZMu6uSB3yX6csqA=;
        b=L6P6wJ3TjifudUpB0WaDt0Jtehrh0eF9ABVhbSKCyDO0J7mpo8gkYOqSRf4jB2q3Rx
         dI8kewXSmheSoP2MoUFZ7bda4dM9vscvmPvpC5vGU5ocNENzHshjWVTahOj60n+OQsVl
         s/KiWDftoh8fXY0RlyvLx8tPrTFIf2G18Daqpq8gNtL7IiStDg3Zw8X9tw+XFGu3kw1R
         HZQSRMYI0rXvJsN9ncNeP634kXQYEUX4fU6gKAFREG4/Ii/2bVqberMmustFb6j+5TDk
         3xoqK15+cZ/eNKvetkKclbwRnKPeAi5cUtjfVT2c1pcunqmmJ7y4GNuIDWpoIL6bPs0M
         HcUA==
X-Gm-Message-State: AOAM533v8Eo4dJid+NQobvpvi24/fmxHtZCJH1JPRTFs3PfcyfS4zkPT
        gt/XYY0PgvJMDrUmjEvp+lg=
X-Google-Smtp-Source: ABdhPJxqy6rvj8gBs7TZ0ZW4UXz9Qd6w/6+SQyRdDII0oRpEIZVuZEJusS+aqqqd/Qw5u7htKyql2g==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr29957454wrm.44.1606778457653;
        Mon, 30 Nov 2020 15:20:57 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id j13sm67513wmi.36.2020.11.30.15.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 15:20:56 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
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
 <f5aca6eb-cc41-64d6-cb72-19ee3a8afd1e@ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <fba097b3-6c61-c1ad-2928-3cb55bff6d19@gmail.com>
Date:   Mon, 30 Nov 2020 23:20:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f5aca6eb-cc41-64d6-cb72-19ee3a8afd1e@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean-Michel

On 30/11/2020 16:17, Jean-Michel Hautbois wrote:
>> We're guessing as to the exact meaning of the function byte, but I
>> conclude they're something like this:
>>
>> 0x00 - probably a reset GPIO
>> 0x01 - regulator for the sensor
>> 0x0c - regulator for the sensor
>> 0x0b - regulator again, but for a VCM or EEPROM
> Is it possible that the ad5823 would be here, and controled by this bit ?

That's one of the devices Laurent guessed might be there yes; when that
GPIO line is toggled it causes an extra device to show on the i2c-bus,
but the ACPI table doesn't define an I2CSerialBusV2 for it. Instead it's
rolled under the sensor's entry, there's a second entry in _CRS for the
sensor that matches the address of the new device:


            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (SBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.PCI0.I2C2",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.PCI0.I2C2",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Return (SBUF) /* \_SB_.PCI0.CAM0._CRS.SBUF */
            }

So that's another thing we need to work on. At the moment it doesn't
exist as far as the kernel is concerned.

>> 0x0d - privacy led (only one we're totally confident of since we can see
>>        it happen!)
>>
>> After much internal debate I decided to write this as a standalone
>> acpi_driver. Alternative options we considered:
>>
>> 1. Squash all this into the cio2-bridge code, which I did originally write
>> but decided I didn't like.
>> 2. Extend the existing tps68470 mfd driver...they share an ACPI ID so this
>> kinda makes sense, but ultimately given there is no actual physical
>> tps68470 in the scenario this patch handles I decided I didn't like this
>> either.
>>
>>  MAINTAINERS                            |   7 +
>>  drivers/media/pci/intel/ipu3/Kconfig   |  14 +
>>  drivers/media/pci/intel/ipu3/Makefile  |   1 +
>>  drivers/media/pci/intel/ipu3/int3472.c | 381 +++++++++++++++++++++++++
>>  drivers/media/pci/intel/ipu3/int3472.h |  96 +++++++
>>  5 files changed, 499 insertions(+)
>>  create mode 100644 drivers/media/pci/intel/ipu3/int3472.c
>>  create mode 100644 drivers/media/pci/intel/ipu3/int3472.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 188559a0a610..d73471f9c2a3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8753,6 +8753,13 @@ L:	linux-crypto@vger.kernel.org
>>  S:	Maintained
>>  F:	drivers/crypto/inside-secure/
>>  
>> +INT3472 ACPI DEVICE DRIVER
>> +M:	Daniel Scally <djrscally@gmail.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/media/pci/intel/ipu3/int3472.c
>> +F:	drivers/media/pci/intel/ipu3/int3472.h
>> +
>>  INTEGRITY MEASUREMENT ARCHITECTURE (IMA)
>>  M:	Mimi Zohar <zohar@linux.ibm.com>
>>  M:	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
>> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
>> index 2b3350d042be..9dd3b280f821 100644
>> --- a/drivers/media/pci/intel/ipu3/Kconfig
>> +++ b/drivers/media/pci/intel/ipu3/Kconfig
>> @@ -34,3 +34,17 @@ config CIO2_BRIDGE
>>  		- Dell 7285
>>  
>>  	  If in doubt, say N here.
>> +
>> +config INT3472
>> +	tristate "INT3472 Dummy ACPI Device Driver"
>> +	depends on VIDEO_IPU3_CIO2
>> +	depends on ACPI && REGULATOR && GPIOLIB
>> +	help
>> +	  This module provides an ACPI driver for INT3472 devices that do not
>> +	  represent an actual physical tps68470 device.
>> +
>> +	  Say Y here if your device is a detachable / hybrid laptop that comes
>> +	  with Windows installed by the OEM.
>> +	  The module will be called int3472.
>> +
>> +	  If in doubt, say N here.
> Is there any issue if the tps68470 driver is also selected and probed ?
>
>> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
>> index 933777e6ea8a..2285947b2bd2 100644
>> --- a/drivers/media/pci/intel/ipu3/Makefile
>> +++ b/drivers/media/pci/intel/ipu3/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
>> +obj-$(CONFIG_INT3472) += int3472.o
>>  
>>  ipu3-cio2-y += ipu3-cio2-main.o
>>  ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
>> diff --git a/drivers/media/pci/intel/ipu3/int3472.c b/drivers/media/pci/intel/ipu3/int3472.c
>> new file mode 100644
>> index 000000000000..6b0be75f7f35
>> --- /dev/null
>> +++ b/drivers/media/pci/intel/ipu3/int3472.c
>> @@ -0,0 +1,381 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Author: Dan Scally <djrscally@gmail.com> */
>> +#include <linux/acpi.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/regulator/driver.h>
>> +
>> +#include "int3472.h"
>> +
>> +/*
>> + * The regulators have to have .ops to be valid, but the only ops we actually
>> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
>> + * empty struct to clear the check without lying about capabilities.
>> + */
>> +static const struct regulator_ops int3472_gpio_regulator_ops = { 0 };
>> +
>> +static int int3472_map_gpio_to_sensor(struct int3472_device *int3472,
>> +				      struct acpi_resource *ares, char *func)
>> +{
>> +	char *path = ares->data.gpio.resource_source.string_ptr;
>> +	struct gpiod_lookup table_entry;
>> +	struct acpi_device *adev;
>> +	acpi_handle handle;
>> +	acpi_status status;
>> +	int ret;
>> +
>> +	/* Make sure we don't overflow, and leave room for a terminator */
>> +	if (int3472->n_sensor_gpios >= INT3472_MAX_SENSOR_GPIOS) {
>> +		dev_warn(&int3472->sensor->dev, "Too many GPIOs mapped\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Fetch ACPI handle for the GPIO chip  */
>> +	status = acpi_get_handle(NULL, path, &handle);
>> +	if (ACPI_FAILURE(status))
>> +		return -EINVAL;
>> +
>> +	ret = acpi_bus_get_device(handle, &adev);
>> +	if (ret)
>> +		return -ENODEV;
>> +
>> +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
>> +							   ares->data.gpio.pin_table[0],
>> +							   func, 0, GPIO_ACTIVE_HIGH);
>> +
>> +	memcpy(&int3472->gpios.table[int3472->n_sensor_gpios], &table_entry,
>> +	       sizeof(table_entry));
>> +	int3472->n_sensor_gpios++;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct int3472_sensor_regulator_map *
>> +int3472_get_sensor_supply_map(struct int3472_device *int3472)
>> +{
>> +	struct int3472_sensor_regulator_map *ret;
>> +	union acpi_object *obj;
>> +	unsigned int i;
>> +
>> +	/*
>> +	 * Sensor modules seem to be identified by a unique string. We use that
>> +	 * to make sure we pass the right device and supply names to the new
>> +	 * regulator's consumer_supplies
>> +	 */
>> +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
>> +				      &cio2_sensor_module_guid, 0x00,
>> +				      0x01, NULL, ACPI_TYPE_STRING);
>> +
>> +	if (!obj) {
>> +		dev_err(&int3472->sensor->dev,
>> +			"Failed to get sensor module string from _DSM\n");
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	if (obj->string.type != ACPI_TYPE_STRING) {
>> +		dev_err(&int3472->sensor->dev,
>> +			"Sensor _DSM returned a non-string value\n");
>> +		ret = ERR_PTR(-EINVAL);
>> +		goto out_free_obj;
>> +	}
>> +
>> +	ret = ERR_PTR(-ENODEV);
>> +	for (i = 0; i < ARRAY_SIZE(int3472_sensor_regulator_maps); i++) {
>> +		if (!strcmp(int3472_sensor_regulator_maps[i].sensor_module_name,
>> +			    obj->string.pointer)) {
>> +			ret = &int3472_sensor_regulator_maps[i];
>> +			goto out_free_obj;
>> +		}
>> +	}
>> +
>> +out_free_obj:
>> +	ACPI_FREE(obj);
>> +	return ret;
>> +}
>> +
>> +static int int3472_register_regulator(struct int3472_device *int3472,
>> +				      struct acpi_resource *ares)
>> +{
>> +	char *path = ares->data.gpio.resource_source.string_ptr;
>> +	struct int3472_sensor_regulator_map *regulator_map;
>> +	struct regulator_init_data init_data = { };
>> +	struct int3472_gpio_regulator *regulator;
>> +	struct regulator_config cfg = { };
>> +	int ret;
>> +
>> +	/*
>> +	 * We lookup supply names from machine specific tables, based on a
>> +	 * unique identifier in the sensor's _DSM
>> +	 */
>> +	regulator_map = int3472_get_sensor_supply_map(int3472);
>> +	if (IS_ERR_OR_NULL(regulator_map)) {
>> +		dev_err(&int3472->sensor->dev,
>> +			"Found no supplies defined for this sensor\n");
>> +		return PTR_ERR(regulator_map);
>> +	}
>> +
>> +	if (int3472->n_regulators >= regulator_map->n_supplies) {
>> +		dev_err(&int3472->sensor->dev,
>> +			"All known supplies are already mapped\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	init_data.supply_regulator = NULL;
>> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
>> +	init_data.num_consumer_supplies = 1;
>> +	init_data.consumer_supplies = &regulator_map->supplies[int3472->n_regulators];
>> +
>> +	regulator = kmalloc(sizeof(*regulator), GFP_KERNEL);
>> +	if (!regulator)
>> +		return -ENOMEM;
>> +
>> +	snprintf(regulator->regulator_name, GPIO_REGULATOR_NAME_LENGTH,
>> +		 "gpio-regulator-%d", int3472->n_regulators);
>> +	snprintf(regulator->supply_name, GPIO_REGULATOR_SUPPLY_NAME_LENGTH,
>> +		 "supply-%d", int3472->n_regulators);
>> +
>> +	regulator->rdesc = INT3472_REGULATOR(regulator->regulator_name,
>> +					     regulator->supply_name,
>> +					     int3472->n_regulators,
>> +					     &int3472_gpio_regulator_ops);
>> +
>> +	regulator->gpio = acpi_get_gpiod(path, ares->data.gpio.pin_table[0]);
>> +	if (IS_ERR(regulator->gpio)) {
>> +		ret = PTR_ERR(regulator->gpio);
>> +		goto err_free_regulator;
>> +	}
>> +
>> +	cfg.dev = &int3472->adev->dev;
>> +	cfg.init_data = &init_data;
>> +	cfg.ena_gpiod = regulator->gpio;
>> +
>> +	regulator->rdev = regulator_register(&regulator->rdesc, &cfg);
>> +	if (IS_ERR(regulator->rdev)) {
>> +		ret = PTR_ERR(regulator->rdev);
>> +		goto err_free_gpio;
>> +	}
>> +
>> +	list_add(&regulator->list, &int3472->regulators);
>> +	int3472->n_regulators++;
>> +
>> +	return 0;
>> +
>> +err_free_gpio:
>> +	gpiod_put(regulator->gpio);
>> +err_free_regulator:
>> +	kfree(regulator);
>> +
>> +	return ret;
>> +}
>> +
>> +static int int3472_handle_gpio_resources(struct acpi_resource *ares,
>> +					 void *data)
>> +{
>> +	struct int3472_device *int3472 = data;
>> +	union acpi_object *obj;
>> +	int ret = 0;
>> +
>> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO ||
>> +	    ares->data.gpio.connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
>> +		return EINVAL; /* Deliberately positive */
>> +
>> +	/*
>> +	 * n_gpios + 2 because the index of this _DSM function is 1-based and
>> +	 * the first function is just a count.
>> +	 */
>> +	obj = acpi_evaluate_dsm_typed(int3472->adev->handle,
>> +				      &int3472_gpio_guid, 0x00,
>> +				      int3472->n_gpios + 2,
>> +				      NULL, ACPI_TYPE_INTEGER);
>> +
>> +	if (!obj) {
>> +		dev_warn(&int3472->adev->dev,
>> +			 "No _DSM entry for this GPIO pin\n");
>> +		return ENODEV;
>> +	}
>> +
>> +	switch (obj->integer.value & 0xff) { /* low byte holds type data */
>> +	case 0x00: /* Purpose unclear, possibly a reset GPIO pin */
>> +		ret = int3472_map_gpio_to_sensor(int3472, ares, "reset");
>> +		if (ret)
>> +			dev_warn(&int3472->adev->dev,
>> +				 "Failed to map reset pin to sensor\n");
>> +
>> +		break;
>> +	case 0x01: /* Power regulators (we think) */
>> +	case 0x0c:
>> +		ret = int3472_register_regulator(int3472, ares);
>> +		if (ret)
>> +			dev_warn(&int3472->adev->dev,
>> +				 "Failed to map regulator to sensor\n");
>> +
>> +		break;
>> +	case 0x0b: /* Power regulators, but to a device separate to sensor */
>> +		ret = int3472_register_regulator(int3472, ares);
>> +		if (ret)
>> +			dev_warn(&int3472->adev->dev,
>> +				 "Failed to map regulator to sensor\n");
>> +
>> +		break;
>> +	case 0x0d: /* Indicator LEDs */
>> +		ret = int3472_map_gpio_to_sensor(int3472, ares, "indicator-led");
>> +		if (ret)
>> +			dev_warn(&int3472->adev->dev,
>> +				 "Failed to map indicator led to sensor\n");
>> +
>> +		break;
>> +	default:
>> +		/* if we've gotten here, we're not sure what they are yet */
>> +		dev_warn(&int3472->adev->dev,
>> +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
>> +			 (obj->integer.value & 0xff));
>> +		ret = EINVAL;
>> +	}
>> +
>> +	int3472->n_gpios++;
>> +	ACPI_FREE(obj);
>> +	return abs(ret);
>> +}
>> +
>> +static void int3472_parse_crs(struct int3472_device *int3472)
>> +{
>> +	struct list_head resource_list;
>> +
>> +	INIT_LIST_HEAD(&resource_list);
>> +
>> +	acpi_dev_get_resources(int3472->adev, &resource_list,
>> +			       int3472_handle_gpio_resources, int3472);
>> +
>> +	acpi_dev_free_resource_list(&resource_list);
>> +	gpiod_add_lookup_table(&int3472->gpios);
>> +}
>> +
>> +static int int3472_add(struct acpi_device *adev)
>> +{
>> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	struct int3472_device *int3472;
>> +	struct int3472_cldb cldb;
>> +	union acpi_object *obj;
>> +	acpi_status status;
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * This driver is only intended to support "dummy" INT3472 devices
>> +	 * which appear in ACPI designed for Windows. These are distinguishable
>> +	 * from INT3472 entries representing an actual tps68470 PMIC through
>> +	 * the presence of a CLDB buffer with a particular value set.
>> +	 */
>> +	status = acpi_evaluate_object(adev->handle, "CLDB", NULL, &buffer);
>> +	if (ACPI_FAILURE(status))
>> +		return -ENODEV;
>> +
>> +	obj = buffer.pointer;
>> +	if (!obj) {
>> +		dev_err(&adev->dev, "ACPI device has no CLDB object\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (obj->type != ACPI_TYPE_BUFFER) {
>> +		dev_err(&adev->dev, "CLDB object is not an ACPI buffer\n");
>> +		ret = -EINVAL;
>> +		goto out_free_buff;
>> +	}
>> +
>> +	if (obj->buffer.length > sizeof(cldb)) {
>> +		dev_err(&adev->dev, "The CLDB buffer is too large\n");
>> +		ret = -EINVAL;
>> +		goto out_free_buff;
>> +	}
>> +
>> +	memcpy(&cldb, obj->buffer.pointer, obj->buffer.length);
>> +
>> +	/*
>> +	 * control_logic_type = 1 indicates this is a dummy INT3472 device of
>> +	 * the kind we're looking for. If any other value then we shouldn't try
>> +	 * to handle it
>> +	 */
>> +	if (cldb.control_logic_type != 1) {
>> +		ret = -EINVAL;
>> +		goto out_free_buff;
>> +	}
>> +
>> +	/* Space for 4 GPIOs - one more than we've seen so far plus a null */
>> +	int3472 = kzalloc(sizeof(*int3472) +
>> +			 ((INT3472_MAX_SENSOR_GPIOS + 1) * sizeof(struct gpiod_lookup)),
>> +			 GFP_KERNEL);
>> +	if (!int3472) {
>> +		ret = -ENOMEM;
>> +		goto out_free_buff;
>> +	}
>> +
>> +	int3472->adev = adev;
>> +	adev->driver_data = int3472;
>> +
>> +	int3472->sensor = acpi_dev_get_next_dep_dev(adev, NULL);
>> +	if (!int3472->sensor) {
>> +		dev_err(&adev->dev,
>> +			"This INT3472 entry seems to have no dependents.\n");
>> +		ret = -ENODEV;
>> +		goto out_free_int3472;
>> +	}
>> +
>> +	int3472->gpios.dev_id = i2c_acpi_dev_name(int3472->sensor);
>> +
>> +	INIT_LIST_HEAD(&int3472->regulators);
>> +
>> +	int3472_parse_crs(int3472);
>> +
>> +	goto out_free_buff;
>> +
>> +out_free_int3472:
>> +	kfree(int3472);
>> +out_free_buff:
>> +	kfree(buffer.pointer);
>> +	return ret;
>> +}
>> +
>> +static int int3472_remove(struct acpi_device *adev)
>> +{
>> +	struct int3472_gpio_regulator *reg;
>> +	struct int3472_device *int3472;
>> +
>> +	int3472 = acpi_driver_data(adev);
>> +
>> +	acpi_dev_put(int3472->sensor);
>> +	gpiod_remove_lookup_table(&int3472->gpios);
>> +
>> +	list_for_each_entry(reg, &int3472->regulators, list) {
>> +		gpiod_put(reg->gpio);
>> +		regulator_unregister(reg->rdev);
>> +	}
>> +
>> +	kfree(int3472);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct acpi_device_id int3472_device_id[] = {
>> +	{ "INT3472", 0 },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, int3472_device_id);
>> +
>> +static struct acpi_driver int3472_driver = {
>> +	.name = "int3472",
>> +	.ids = int3472_device_id,
>> +	.ops = {
>> +		.add = int3472_add,
>> +		.remove = int3472_remove,
>> +	},
>> +	.owner = THIS_MODULE,
>> +};
>> +
>> +module_acpi_driver(int3472_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Dan Scally <djrscally@gmail.com>");
>> +MODULE_DESCRIPTION("ACPI Driver for Discrete type INT3472 ACPI Devices");
>> diff --git a/drivers/media/pci/intel/ipu3/int3472.h b/drivers/media/pci/intel/ipu3/int3472.h
>> new file mode 100644
>> index 000000000000..6964726e8e1f
>> --- /dev/null
>> +++ b/drivers/media/pci/intel/ipu3/int3472.h
>> @@ -0,0 +1,96 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* Author: Dan Scally <djrscally@gmail.com> */
>> +#include <linux/regulator/machine.h>
>> +
>> +#define INT3472_MAX_SENSOR_GPIOS			3
>> +#define GPIO_REGULATOR_NAME_LENGTH			17
>> +#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH		9
>> +
>> +#define INT3472_REGULATOR(_NAME, _SUPPLY, _ID, _OPS)	\
>> +	((const struct regulator_desc) {		\
>> +		.name = _NAME,				\
>> +		.supply_name = _SUPPLY,			\
>> +		.id = _ID,				\
>> +		.type = REGULATOR_VOLTAGE,		\
>> +		.ops = _OPS,				\
>> +		.owner = THIS_MODULE,			\
>> +	})
>> +
>> +const guid_t int3472_gpio_guid = GUID_INIT(0x79234640, 0x9e10, 0x4fea,
>> +					     0xa5, 0xc1, 0xb5, 0xaa, 0x8b,
>> +					     0x19, 0x75, 0x6f);
>> +
>> +const guid_t cio2_sensor_module_guid = GUID_INIT(0x822ace8f, 0x2814, 0x4174,
>> +						 0xa5, 0x6b, 0x5f, 0x02, 0x9f,
>> +						 0xe0, 0x79, 0xee);
>> +
>> +struct int3472_cldb {
>> +	u8 version;
>> +	/*
>> +	 * control logic type
>> +	 * 0: UNKNOWN
>> +	 * 1: DISCRETE(CRD-D)
>> +	 * 2: PMIC TPS68470
>> +	 * 3: PMIC uP6641
>> +	 */
>> +	u8 control_logic_type;
>> +	u8 control_logic_id;
>> +	u8 sensor_card_sku;
>> +	u8 reserved[28];
>> +};
>> +
>> +struct int3472_device {
>> +	struct acpi_device *adev;
>> +	struct acpi_device *sensor;
>> +
>> +	unsigned int n_gpios; /* how many GPIOs have we seen */
>> +
>> +	unsigned int n_regulators;
>> +	struct list_head regulators;
>> +
>> +	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
>> +	struct gpiod_lookup_table gpios;
>> +};
>> +
>> +struct int3472_gpio_regulator {
>> +	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
>> +	char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
>> +	struct gpio_desc *gpio;
>> +	struct regulator_dev *rdev;
>> +	struct regulator_desc rdesc;
>> +	struct list_head list;
>> +};
>> +
>> +struct int3472_sensor_regulator_map {
>> +	char *sensor_module_name;
>> +	unsigned int n_supplies;
>> +	struct regulator_consumer_supply *supplies;
>> +};
>> +
>> +/*
>> + * Here follows platform specific mapping information that we can pass to
>> + * regulator_init_data when we register our regulators. They're just mapped
>> + * via index, I.E. the first regulator pin that the code finds for the
>> + * i2c-OVTI2680:00 device is avdd, the second is dovdd and so on.
>> + */
>> +
>> +static struct regulator_consumer_supply miix_510_ov2680[] = {
>> +	{ "i2c-OVTI2680:00", "avdd" },
>> +	{ "i2c-OVTI2680:00", "dovdd" },
>> +};
>> +
>> +static struct regulator_consumer_supply surface_go2_ov5693[] = {
>> +	{ "i2c-INT33BE:00", "avdd" },
>> +	{ "i2c-INT33BE:00", "dovdd" },
>> +};
>> +
>> +static struct regulator_consumer_supply surface_book_ov5693[] = {
>> +	{ "i2c-INT33BE:00", "avdd" },
>> +	{ "i2c-INT33BE:00", "dovdd" },
>> +};
>> +
>> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
>> +	{ "GNDF140809R", 2, miix_510_ov2680 },
>> +	{ "YHCU", 2, surface_go2_ov5693 },
>> +	{ "MSHW0070", 2, surface_book_ov5693 },
>> +};
>>
> Thanks,
> JM
