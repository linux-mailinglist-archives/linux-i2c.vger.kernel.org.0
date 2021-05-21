Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1FF38C749
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 14:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhEUM7W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 08:59:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:11447 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232256AbhEUM7K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 08:59:10 -0400
IronPort-SDR: Ebv/aroCptOrbvMCfv315JuDJ/7zO/Bgn2QoMusyW+iz5jMy+sTS2ClpMW0j7UZDxbM1J+usuU
 SaXKHOHvXQVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="201511267"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="201511267"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 05:57:46 -0700
IronPort-SDR: crRHv+VXHHm3QxRly6SLfRhQ3QkM3+nfkHjkuY2hto5E8N0LKoj2ndH9iwhhbJqqh+MFAy8IcS
 Pm48BhooAG0w==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="395309749"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 05:57:40 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lk4ie-00Di9Q-OH; Fri, 21 May 2021 15:57:36 +0300
Date:   Fri, 21 May 2021 15:57:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 7/8] platform/x86: Add intel_skl_int3472 driver
Message-ID: <YKeuQM/O9+jDZFpb@smile.fi.intel.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <20210520140928.3252671-8-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520140928.3252671-8-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 03:09:27PM +0100, Daniel Scally wrote:
> ACPI devices with _HID INT3472 are currently matched to the tps68470
> driver, however this does not cover all situations in which that _HID
> occurs. We've encountered three possibilities:
> 
> 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
> a physical TPS68470 device) that requires a GPIO and OpRegion driver
> 2. On devices designed for Windows, an ACPI device with _HID INT3472
> (again representing a physical TPS68470 device) which requires GPIO,
> Clock and Regulator drivers.
> 3. On other devices designed for Windows, an ACPI device with _HID
> INT3472 which does **not** represent a physical TPS68470, and is instead
> used as a dummy device to group some system GPIO lines which are meant
> to be consumed by the sensor that is dependent on this entry.
> 
> This commit adds a new module, registering a platform driver to deal
> with the 3rd scenario plus an i2c driver to deal with #1 and #2, by
> querying the CLDB buffer found against INT3472 entries to determine
> which is most appropriate.

...

>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c

I would rather see this under .../intel/int3472/ but this we may do later on.

...

> +INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
> +M:	Daniel Scally <djrscally@gmail.com>
> +S:	Maintained
> +F:	drivers/platform/x86/intel-int3472/intel_skl_int3472_*

F:	drivers/platform/x86/intel-int3472/

Should be sufficient.

...

> +	help
> +	  This driver adds support for the INT3472 ACPI devices found on some
> +	  Intel SkyLake devices.

I would rephrase this

"This driver adds power controller support for the Intel SkyCam devices found
on the Intel SkyLake platforms."

(Technically speaking this IP is in the entire CPU family, but may be switched
 off)

It's also possible to google for better text based on what Windows says about
it.

> +	  The INT3472 is an Intel camera power controller, a logical device
> +	  found on some Skylake-based systems that can map to different

"The INT3472 is a camera power controller, a logical device found on some Intel
Skylake-based systems that can map to different..."

> +	  hardware devices depending on the platform. On machines
> +	  designed for Chrome OS, it maps to a TPS68470 camera PMIC. On
> +	  machines designed for Windows, it maps to either a TP68470
> +	  camera PMIC, a uP6641Q sensor PMIC, or a set of discrete GPIOs
> +	  and power gates.
> +
> +	  If your device was designed for Chrome OS, this driver will provide
> +	  an ACPI OpRegion, which must be available before any of the devices
> +	  using it are probed. For this reason, you should select Y if your
> +	  device was designed for ChromeOS. For the same reason the
> +	  I2C_DESIGNWARE_PLATFORM option must be set to Y too.
> +
> +	  Say Y or M here if you have a SkyLake device designed for use
> +	  with Windows or ChromeOS. Say N here if you are not sure.
> +
> +	  The module will be named "intel-skl-int3472"

Period missed.

...

> +/*
> + * The regulators have to have .ops to be valid, but the only ops we actually
> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> + * empty struct to clear the check without lying about capabilities.
> + */
> +static const struct regulator_ops int3472_gpio_regulator_ops;

Hmm... Can you use 'reg-fixed-voltage' platform device instead?

One example, although gone from upstream, but available in the tree, I can
point to is this:

  git log -p -- arch/x86/platform/intel-mid/device_libs/platform_bcm43xx.c

It uses constant structures, but I think you may dynamically generate the
necessary ones.

...

> +static int skl_int3472_clk_prepare(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value(clk->ena_gpio, 1);
> +	gpiod_set_value(clk->led_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static void skl_int3472_clk_unprepare(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value(clk->ena_gpio, 0);
> +	gpiod_set_value(clk->led_gpio, 0);
> +}
> +
> +static int skl_int3472_clk_enable(struct clk_hw *hw)
> +{
> +	/*
> +	 * We're just turning a GPIO on to enable the clock, which operation
> +	 * has the potential to sleep. Given .enable() cannot sleep, but
> +	 * .prepare() can, we toggle the GPIO in .prepare() instead. Thus,
> +	 * nothing to do here.
> +	 */

It's a nice comment, but you are using non-sleeping GPIO value setters. Perhaps
you need to replace them with gpiod_set_value_cansleep()?

> +	return 0;
> +}

...

> +static unsigned int skl_int3472_get_clk_frequency(struct int3472_discrete_device *int3472)
> +{
> +	union acpi_object *obj;
> +	unsigned int freq;
> +
> +	obj = skl_int3472_get_acpi_buffer(int3472->sensor, "SSDB");
> +	if (IS_ERR(obj))
> +		return 0; /* report rate as 0 on error */
> +
> +	if (obj->buffer.length < CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET + sizeof(u32)) {
> +		dev_err(int3472->dev, "The buffer is too small\n");

> +		goto out_free_buff;

First of all, freq will be uninitialized here.

I'm wondering if you can simple drop the goto and replace it with direct steps, i.e.
	kfree(obj);
	return 0;

> +	}
> +
> +	freq = *(u32 *)(obj->buffer.pointer + CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET);
> +
> +out_free_buff:
> +	kfree(obj);
> +	return freq;
> +}

...

> +int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
> +{
> +	struct clk_init_data init = {
> +		.ops = &skl_int3472_clock_ops,
> +		.flags = CLK_GET_RATE_NOCACHE,
> +	};

> +	int ret = 0;

I would not assign it here. See below.

> +	init.name = kasprintf(GFP_KERNEL, "%s-clk",
> +			      acpi_dev_name(int3472->adev));
> +	if (!init.name)
> +		return -ENOMEM;
> +
> +	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
> +
> +	int3472->clock.clk_hw.init = &init;
> +	int3472->clock.clk = clk_register(&int3472->adev->dev,
> +					  &int3472->clock.clk_hw);
> +	if (IS_ERR(int3472->clock.clk)) {
> +		ret = PTR_ERR(int3472->clock.clk);
> +		goto out_free_init_name;
> +	}
> +
> +	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL,
> +					  int3472->sensor_name);
> +	if (!int3472->clock.cl) {
> +		ret = -ENOMEM;
> +		goto err_unregister_clk;
> +	}

> +	goto out_free_init_name;

Better pattern is

	kfree(init.name);
	return 0;

directly here.

> +err_unregister_clk:
> +	clk_unregister(int3472->clock.clk);
> +out_free_init_name:
> +	kfree(init.name);
> +
> +	return ret;
> +}

...

> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
> +					       char *id)

One line?

...

> +int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
> +{
> +	union acpi_object *obj;

> +	int ret = 0;

I would assign it closer to the real use, see below.

> +	obj = skl_int3472_get_acpi_buffer(adev, "CLDB");
> +	if (IS_ERR(obj))
> +		return PTR_ERR(obj);
> +
> +	if (obj->buffer.length > sizeof(*cldb)) {
> +		acpi_handle_err(adev->handle, "The CLDB buffer is too large\n");
> +		ret = -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +	memcpy(cldb, obj->buffer.pointer, obj->buffer.length);

ret = 0;

> +out_free_obj:
> +	kfree(obj);
> +	return ret;
> +}

...

> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
> +					       char *id);

One line?

...

> +static const struct int3472_sensor_config *
> +skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
> +{
> +	const struct int3472_sensor_config *ret;
> +	union acpi_object *obj;
> +	unsigned int i;
> +
> +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
> +				      &cio2_sensor_module_guid, 0x00,
> +				      0x01, NULL, ACPI_TYPE_STRING);
> +
> +	if (!obj) {
> +		dev_err(int3472->dev,
> +			"Failed to get sensor module string from _DSM\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	if (obj->string.type != ACPI_TYPE_STRING) {
> +		dev_err(int3472->dev,
> +			"Sensor _DSM returned a non-string value\n");
> +		ret = ERR_PTR(-EINVAL);
> +		goto out_free_obj;
> +	}

> +	ret = ERR_PTR(-EINVAL);
> +	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
> +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> +			    obj->string.pointer)) {
> +			ret = &int3472_sensor_configs[i];
> +			break;
> +		}
> +	}

Can be refactored like this:

	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
			    obj->string.pointer))
			break;
	}

	ACPI_FREE(obj);

	if (i >= ARRAY_SIZE(int3472_sensor_configs))
		return ERR_PTR(-EINVAL);

	return &int3472_sensor_configs[i];

> +out_free_obj:
> +	ACPI_FREE(obj);
> +	return ret;

And this moved to the one user above.

> +}

...

> +		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n",
> +			type);

One line?

...

> + * Return:
> + * * 0		- When all resources found are handled properly.

Positive number ... ?

> + * * -EINVAL	- If the resource is not a GPIO IO resource
> + * * -ENODEV	- If the resource has no corresponding _DSM entry
> + * * -Other	- Errors propagated from one of the sub-functions.

...

> +	if (!acpi_gpio_get_io_resource(ares, &agpio))
> +		return 1; /* Deliberately positive so parsing continues */

Move it to description above?

...

> +	/*
> +	 * n_gpios + 2 because the index of this _DSM function is 1-based and
> +	 * the first function is just a count.
> +	 */
> +	obj = acpi_evaluate_dsm_typed(int3472->adev->handle,
> +				      &int3472_gpio_guid, 0x00,
> +				      int3472->n_gpios + 2,
> +				      NULL, ACPI_TYPE_INTEGER);

can we rename n_gpios -> ngpios?

...

> +	if (int3472->clock.ena_gpio) {
> +		ret = skl_int3472_register_clock(int3472);
> +		if (ret)
> +			goto out_free_res_list;
> +	} else {

Hmm... Have I got it correctly that we can't have ena_gpio && led_gpio together?

> +		if (int3472->clock.led_gpio)
> +			dev_warn(int3472->dev,
> +				 "No clk GPIO. The privacy LED won't work\n");
> +	}

...

> +		dev_err(&client->dev, "Failed to create regmap: %ld\n",
> +			PTR_ERR(regmap));

One line?

...

> +	ret = skl_int3472_fill_cldb(adev, &cldb);
> +	if (!ret && cldb.control_logic_type != 2) {
> +		dev_err(&client->dev, "Unsupported control logic type %u\n",
> +			cldb.control_logic_type);
> +		return -EINVAL;
> +	}

> +	if (ret)
> +		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,

This I don't like. Since we get a returned variable with different meaning, can
we use a specific variable name for it? On top of that, I would rather see
something like this:

	whatever = skl_...(...);
	switch (whatever) {
	case WHATEVER_ONE_CASE:
		if (cldb.control_logic_type != 2) {
			dev_err(&client->dev, "Unsupported control logic type %u\n",
				cldb.control_logic_type);
			return -EINVAL;
		}
		cells_data = tps68470_win;
		cells_size = ARRAY_SIZE(tps68470_win);
		break;
	case WHATEVER_ANOTHER_CASE:
		...
		break;
	default:
		...Oops...
		break; // or return -ERRNO
	}

	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
				    cells_data, cells_size, NULL, 0, NULL);

-- 
With Best Regards,
Andy Shevchenko


