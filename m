Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FED92FA37E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 15:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405249AbhAROrM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 09:47:12 -0500
Received: from mga05.intel.com ([192.55.52.43]:62612 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405242AbhAROrJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 09:47:09 -0500
IronPort-SDR: E+roNYQqzRVrBHmSXjIU/Zxr2LWInm1U7qUSORGChI1ie5iQBxk2aCvVmMP9B+nt0J8lJO7GSX
 ipTDee1gwpDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="263617480"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="263617480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 06:45:11 -0800
IronPort-SDR: hXNo5UJGnLCdINQ44Dp11y/5vdFKfJ/rCxXBWwWy3kacz6xalQh0+EaBuT6RU0cC5hqOTE2Tvl
 6nqKZXNfpF5g==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="350232753"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 06:45:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1VnC-002FQB-4n; Mon, 18 Jan 2021 16:46:06 +0200
Date:   Mon, 18 Jan 2021 16:46:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <20210118144606.GO4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 11:15:21AM +0200, Laurent Pinchart wrote:
> On Mon, Jan 18, 2021 at 12:34:27AM +0000, Daniel Scally wrote:

My comments on top of Laurent's to avoid dups.

First of all, PDx86 has its own prefix pattern: "platform/x86: ..."

> > ACPI devices with _HID INT3472 are currently matched to the tps68470
> > driver, however this does not cover all situations in which that _HID
> > occurs. We've encountered three possibilities:
> > 
> > 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
> > a physical tps68470 device) that requires a GPIO and OpRegion driver
> > 2. On devices designed for Windows, an ACPI device with _HID INT3472
> > (again representing a physical tps68470 device) which requires GPIO,
> > Clock and Regulator drivers.
> > 3. On other devices designed for Windows, an ACPI device with _HID
> > INT3472 which does NOT represent a physical tps68470, and is instead

In cover letter you are using form of "**not**", as well as in prerequisite
patch series, can we be consistent with that?

tps -> TPS (same reason as Laurent put below).

> > used as a dummy device to group some system GPIO lines which are meant
> > to be consumed by the sensor that is dependent on this entry.
> > 
> > This commit adds a new module, registering a platform driver to deal
> > with the 3rd scenario plus an i2c-driver to deal with #1 and #2, by

I²C driver ?

> > querying the CLDB buffer found against INT3472 entries to determine
> > which is most appropriate.

...

> > +INTEL SKL INT3472 ACPI DEVICE DRIVER

Here you may spell it in full, i.e. SKYLAKE

> > +M:	Daniel Scally <djrscally@gmail.com>
> > +S:	Maintained
> > +F:	drivers/platform/x86/intel_skl_int3472_*

...

> > +config INTEL_SKL_INT3472
> > +	tristate "Intel SkyLake ACPI INT3472 Driver"
> > +	depends on X86 && ACPI

X86 is a dup. Entire lot of PDx86 is a priory dependent on it (find "if X86"
line in Kconfig).

> > +	select REGMAP_I2C
> > +	help
> > +	  This driver adds support for the INT3472 ACPI devices found on some
> > +	  Intel SkyLake devices.
> > +
> > +	  There are 3 kinds of INT3472 ACPI device possible; two for devices
> > +	  designed for Windows (either with or without a physical tps68470
> 
> I'd capitalize TPS, chip names are usually written in upper case, and
> driver names in lower case.
> 
> > +	  PMIC) and one designed for Chrome OS.

...

> > +obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
> > +intel_skl_int3472-objs			:= intel_skl_int3472_common.o \

> > +				   	   intel_skl_int3472_discrete.o \
> > +				   	   intel_skl_int3472_tps68470.o

Mix of TABs and spaces detected in above two lines!

...

> > +static const struct acpi_device_id int3472_device_id[] = {
> > +	{ "INT3472", 0 },
> > +	{ },

No comma for terminator entry.

> > +};

...

> > +static struct i2c_driver int3472_tps68470 = {
> > +	.driver = {
> > +		.name = "int3472-tps68470",
> > +		.acpi_match_table = int3472_device_id,
> > +	},
> > +	.probe_new = skl_int3472_tps68470_probe,
> > +};

I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...

> > +module_init(skl_int3472_init);
> > +module_exit(skl_int3472_exit);

...and this will become simple module_platfom_driver().

...

> > +#define INT3472_REGULATOR(_NAME, _SUPPLY, _OPS)			\
>
> Macro arguments don't need to be capitalized.
>
> > +	(const struct regulator_desc) {				\
> > +		.name = _NAME,					\
> > +		.supply_name = _SUPPLY,				\

> > +		.id = 0,					\

IIRC it will be 0 by standard rules.

> > +		.type = REGULATOR_VOLTAGE,			\
> > +		.ops = _OPS,					\
> > +		.owner = THIS_MODULE,				\
> > +	}
> > +
> > +#define INT3472_GPIO_FUNCTION_REMAP(_PIN, _FUNCTION)		\
> > +	(const struct int3472_gpio_function_remap) {		\
> > +		.documented = _PIN,					\

> > +		.actual = _FUNCTION				\

+ comma

> > +	}

...

> > +struct int3472_gpio_clock {
> > +	struct clk *clk;
> > +	struct clk_hw clk_hw;
> > +	struct clk_lookup *cl;
> > +	struct gpio_desc *gpio;
> > +};

Wondering if this has some similarities with and actually can utilize clk-gpio
driver.

...

> > +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> > +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", "i2c-OVTI5648:00"), NULL},
> > +	/* Surface Go 1&2 - OV5693, Front */
> > +	{ "YHCU", REGULATOR_SUPPLY("avdd", "i2c-INT33BE:00"), NULL},

I'm wondering if you should use same I2C format macro and create this
dynamically? Or rather find a corresponding ACPI device instance and copy it's
name?

...

> > +static const struct clk_ops skl_int3472_clock_ops = {
> > +	.prepare = skl_int3472_clk_prepare,
> > +	.unprepare = skl_int3472_clk_unprepare,
> > +	.enable = skl_int3472_clk_enable,
> > +	.disable = skl_int3472_clk_disable,
> > +};

Yeah, sounds like reinventing clk-gpio.c.

static const struct clk_ops clk_gpio_gate_ops = {
	.enable = clk_gpio_gate_enable,
	.disable = clk_gpio_gate_disable,
	.is_enabled = clk_gpio_gate_is_enabled,
};

(Or is it mux? It has support there as well.

...

> > +static struct int3472_sensor_config *
> > +skl_int3472_get_sensor_module_config(struct int3472_device *int3472)
> > +{
> > +	unsigned int i = ARRAY_SIZE(int3472_sensor_configs);
> > +	struct int3472_sensor_config *ret;
> > +	union acpi_object *obj;
> > +
> > +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
> > +				      &cio2_sensor_module_guid, 0x00,
> > +				      0x01, NULL, ACPI_TYPE_STRING);
> > +
> > +	if (!obj) {
> > +		dev_err(&int3472->pdev->dev,
> > +			"Failed to get sensor module string from _DSM\n");
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	if (obj->string.type != ACPI_TYPE_STRING) {
> > +		dev_err(&int3472->pdev->dev,
> > +			"Sensor _DSM returned a non-string value\n");

> > +		ret = ERR_PTR(-EINVAL);
> > +		goto out_free_obj;

And after below change you can turn this to

	ACPI_FREE(obj);
	return ERR_PTR(-EINVAL);

and remove label completely, but it's up to you.

> > +	}

> > +	ret = ERR_PTR(-ENODEV);

This seems redundant. Or are you expecting ARRAY_SIZE() to be 0?
If no, you may add static_assert() near to the array definition.

> > +	while (i--) {
> 
> Unless there's a specific need to iterate backward over the array,
> 
> 	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); ++i) {
> 
> > +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> > +			    obj->string.pointer)) {
> > +			ret = &int3472_sensor_configs[i];
> 
> Just
> 
> 			break;
> 
> > +			goto out_free_obj;
> > +		}
> > +	}
> > +
> > +out_free_obj:
> > +	ACPI_FREE(obj);
> > +	return ret;
> > +}

...

> > +	sensor_config = skl_int3472_get_sensor_module_config(int3472);
> > +	if (!IS_ERR(sensor_config) && sensor_config->function_maps) {
> > +		unsigned int i = 0;
> 
> 		const struct int3472_gpio_function_remap *remap =
> 			sensor_config->function_maps;
> 
> 		for (; remap->documented; ++remap) {

Post-increment in for-loops will work fine (to all Laurent's examples :-).

> 			if (!strcmp(func, remap->documented)) {
> 				func = remap->actual;
> 
> > +
> > +		while (sensor_config->function_maps[i].documented) {
> > +			if (!strcmp(func, sensor_config->function_maps[i].documented)) {
> > +				func = sensor_config->function_maps[i].actual;
> > +
> 
> Extra blank line.
> 
> > +				break;
> > +			}
> > +
> > +			i++;
> > +		}
> > +	}

...

> > +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
> > +							   ares->data.gpio.pin_table[0],
> > +							   func, 0, polarity);

Agree with below. But you nay change those GPIO_LOOKUP*() macros to be compound
literals in order to be used in the assignments like this.

> I wonder if
> 
> 	table_entry.key = acpi_dev_name(adev);
> 	table_entry.chip_hwnum = ares->data.gpio.pin_table[0];
> 	table_entry.con_id = func;
> 	table_entry.idx = 0;
> 	table_entry.flags = polarity;
> 
> (with struct gpiod_lookup table_entry = { }; above) would be more
> readable. Up to you.
> 
> > +
> > +	memcpy(&int3472->gpios.table[int3472->n_sensor_gpios], &table_entry,
> > +	       sizeof(table_entry));
> 
> Ah, or maybe
> 
> 	struct gpio_lookup *table_entry;
> 
> 	table_entry = &int3472->gpios.table[int3472->n_sensor_gpios];
> 	table_entry->key = acpi_dev_name(adev);
> 	table_entry->chip_hwnum = ares->data.gpio.pin_table[0];
> 	table_entry->con_id = func;
> 	table_entry->idx = 0;
> 	table_entry->flags = polarity;
> 
> (no need to memset() to 0 first as the whole structure has been
> allocated with kzalloc()).


...

> > +	int3472->clock.cl = clkdev_create(int3472->clock.clk, "xvclk",
> > +					  int3472->sensor_name);
> > +	if (IS_ERR_OR_NULL(int3472->clock.cl))
> 
> 	if (!int3472->clock.cl)
> 
> as the function never return an error pointer.

One more time, please consider to utilize clk-gpio.c.

...

> > +	int3472->regulator.gpio = acpi_get_gpiod(path,
> > +						 ares->data.gpio.pin_table[0]);
> > +	if (IS_ERR(int3472->regulator.gpio)) {
> > +		dev_err(&int3472->pdev->dev, "Failed to get GPIO line\n");
> 
> s/GPIO line/regulator GPIO lines/ ?
> 
> > +		return PTR_ERR(int3472->regulator.gpio);
> > +	}
> > +
> > +	cfg.dev = &int3472->adev->dev;
> > +	cfg.init_data = &init_data;
> > +	cfg.ena_gpiod = int3472->regulator.gpio;
> > +
> > +	int3472->regulator.rdev = regulator_register(&int3472->regulator.rdesc,
> > +						     &cfg);
> > +	if (IS_ERR(int3472->regulator.rdev)) {
> > +		ret = PTR_ERR(int3472->regulator.rdev);
> > +		goto err_free_gpio;
> > +	}

Similar here, can we utilize gpio-regulator.c?

...

> > +		return EINVAL; /* Deliberately positive so parsing continues */
> 
> Maybe 1 instead of EINVAL ?

That's, i.e. 1, what we usually use in other ACPI related code like this.

...

> > +		dev_warn(&int3472->pdev->dev,

Better to have struct device in the structure, you will put this on one line
and derive struct platform_device from it whenever it's required by
to_platform_device() call.

> > +			 "No _DSM entry for this GPIO pin\n");
> 
> s/this GPIO pin/GPIO pin %u/
> 
> (and add the corresponding argument).

...

> > +		dev_warn(&int3472->pdev->dev,
> > +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
> > +			 (obj->integer.value & 0xff));
> 
> No need for parentheses.

And instead of "%llx" with " & 0xff" you may use "%x" with "(u8)" cast.
However, I don't think we need to show only last byte, because it may give
wrong impression on values like "0x100".

...

> > +	ret = skl_int3472_get_cldb_buffer(adev, &cldb);
> > +	if (ret || cldb.control_logic_type != 1)
> 
> An error message is needed for unsupported control_logic_type values.

Yeah, please split checks to two.

> > +		return -EINVAL;

...

> > +	int3472 = kzalloc(sizeof(*int3472) +
> > +			 ((INT3472_MAX_SENSOR_GPIOS + 1) * sizeof(struct gpiod_lookup)),
> 
> One more space for the indentation, and the outer parentheses are not
> needed.

And use struct_size() from overflow.h.


> > +			 GFP_KERNEL);

...

> > +	if (int3472->gpios_mapped)
> > +		gpiod_remove_lookup_table(&int3472->gpios);
> 
> You could avoid the need for the gpios_mapped field by checking for
> 
> 	if (int3472->gpios.list.next)


I think this is an intrusion to GPIO realm.
Instead would you consider to drop the check completely and use ->gpios to be
NULL / not-NULL (and yes, you won't need gpios_mapped flag)?

d321ad1286d2 ("gpiolib: Follow usual pattern for gpiod_remove_lookup_table() call")

in I²C tree makes it possible.

...

> > +static struct platform_device *
> > +skl_int3472_register_pdev(const char *name, struct device *parent)
> > +{
> > +	struct platform_device *pdev;
> > +	int ret;
> > +
> > +	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
> > +	if (IS_ERR_OR_NULL(pdev))
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	pdev->dev.parent = parent;
> > +	pdev->driver_override = kstrndup(pdev->name, INT3472_PDEV_MAX_NAME_LEN,
> > +					 GFP_KERNEL);

NULL check?

> > +	ret = platform_device_add(pdev);
> > +	if (ret) {
> > +		platform_device_put(pdev);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	return pdev;
> > +}

...

> > +int skl_int3472_tps68470_probe(struct i2c_client *client)
> > +{
> > +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> > +	struct platform_device *regulator_dev;
> > +	struct platform_device *opregion_dev;
> > +	struct platform_device *gpio_dev;
> > +	struct int3472_cldb cldb = { 0 };
> > +	struct platform_device *clk_dev;
> > +	bool cldb_present = true;
> > +	struct regmap *regmap;

> > +	int ret = 0;

Redundant assignment.

> > +	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(&client->dev, "devm_regmap_init_i2c Error %ld\n",
> 
> s/Error/error/
> 
> I'd actually write "Failed to create regmap" or something similar.
> 
> > +			PTR_ERR(regmap));
> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	i2c_set_clientdata(client, regmap);
> > +
> > +	ret = tps68470_chip_init(&client->dev, regmap);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "TPS68470 Init Error %d\n", ret);
> 
> s/Init Error/init error/
> 
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * Check CLDB buffer against the PMIC's adev. If present, then we check
> > +	 * the value of control_logic_type field and follow one of the
> > +	 * following scenarios:
> > +	 *
> > +	 *	1. No CLDB - likely ACPI tables designed for ChromeOS. We
> > +	 *	create platform devices for the GPIOs and OpRegion drivers.
> > +	 *
> > +	 *	2. CLDB, with control_logic_type = 2 - probably ACPI tables
> > +	 *	made for Windows 2-in-1 platforms. Register pdevs for GPIO,
> > +	 *	Clock and Regulator drivers to bind to.
> > +	 *
> > +	 *	3. Any other value in control_logic_type, we should never have
> > +	 *	gotten to this point; crash and burn.
> 
> Crash is a bit hard, and that's not what you do below.
> 
> > +	 */
> > +	ret = skl_int3472_get_cldb_buffer(adev, &cldb);
> > +	if (!ret && cldb.control_logic_type != 2)
> 
> You should print an error message here (at least to catch an unsupported
> control_logic_type value, skl_int3472_get_cldb_buffer() errors are
> already logged in that function).
> 
> > +		return -EINVAL;
> > +
> > +	if (ret)
> > +		cldb_present = false;
> > +
> > +	gpio_dev = skl_int3472_register_pdev("tps68470-gpio", &client->dev);
> > +	if (IS_ERR(gpio_dev))
> > +		return PTR_ERR(gpio_dev);
> > +
> > +	if (cldb_present) {
> > +		clk_dev = skl_int3472_register_pdev("tps68470-clk",
> > +						    &client->dev);
> > +		if (IS_ERR(clk_dev)) {
> > +			ret = PTR_ERR(clk_dev);
> > +			goto err_free_gpio;
> > +		}
> > +
> > +		regulator_dev = skl_int3472_register_pdev("tps68470-regulator",
> > +							  &client->dev);
> > +		if (IS_ERR(regulator_dev)) {
> > +			ret = PTR_ERR(regulator_dev);
> > +			goto err_free_clk;
> > +		}
> > +	} else {
> > +		opregion_dev = skl_int3472_register_pdev("tps68470_pmic_opregion",
> > +							 &client->dev);
> > +		if (IS_ERR(opregion_dev)) {
> > +			ret = PTR_ERR(opregion_dev);
> > +			goto err_free_gpio;
> > +		}
> > +	}
> 
> I wonder if this could be simplified by using devm_mfd_add_devices. You
> could have two arrays of mfd_cell, one for each case.

Yeah, which effectively means that we should have some kind of mfd/tps68470 in
place.

> > +	return 0;
> > +
> > +err_free_clk:
> > +	platform_device_put(clk_dev);
> > +err_free_gpio:
> > +	platform_device_put(gpio_dev);
> > +
> > +	return ret;
> > +}

-- 
With Best Regards,
Andy Shevchenko


