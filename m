Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9F73231CE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 21:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbhBWUG7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 15:06:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbhBWUFs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 15:05:48 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A4E958E;
        Tue, 23 Feb 2021 21:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614110694;
        bh=OWHa6+dIalLc+Z+UhLCiTmPRhDXekirR6ep6I/GJbmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M4G0uaVaBG5x5CwHGLi/G6IBk0pRpeIzIMxsfvlquZzThxh5T3h5bpEhAIzhTMOCL
         iNobPDrCWoyUPD99EaJNFWzekxmNJ44UqiRPNzThURi+Garv+1poZhbCavx7gH19e8
         Z8V5clSAbtm8nEFk07CN1t/3lFaevzLXRCcbShM4=
Date:   Tue, 23 Feb 2021 22:04:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
Message-ID: <YDVfyt2d2Nhsa7l3@pendragon.ideasonboard.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210222130735.1313443-6-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Feb 22, 2021 at 01:07:34PM +0000, Daniel Scally wrote:
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
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 
> 	- Added clk_recalc_rate() operation to the clk that's registered, plus
> 	  some associated functions / revisions.
> 	- Moved source and header files to their own folder within platform/x86
> 	- Switched the GPIO toggling for the clock from enable/disable to
> 	  prepare/unprepare to avoid any sleep problems
> 	- Switched handling of the privacy LED GPIO from map-to-sensor to being
> 	  toggled along with the clk enable GPIO; register the clock in
> 	  intel_skl_int3472_parse_crs() instead of during handle_gpio_resources
> 	- Better commenting in a lot of places
> 	- Used the sensor_name formed from acpi_dev_name(int3472->sensor) and
> 	  the i2c name format macro as the dev_id in regulator init data rather
> 	  than hardcoding an instance name.
> 	- Fetched the sensor module config a single time rather than once per
> 	  GPIO
> 	- Switched int3472-tps68470 driver to use MFD framework properly rather
> 	  than open coding the same functionality
> 	- A myriad of other fixes too minor to call out.
> 
> Suggested changes (from Andy) that I didn't follow:
> 
> 	- Using clk-gpio.c as a library: The requirement to add clk_recalc_rate
> 	so that clk_get_rate() would be supported, along with driving the
> 	privacy LED on clk_enable() meant this wouldn't work I think
> 	- Leave the MFD driver in its usual place, and prevent the INT3472 from
> 	probing as an i2c device from ACPI. I definitely see the argument for
> 	this, but in the end I think probably having all the code for the HID
> 	within a single place is probably a bit preferable.
> 
>  MAINTAINERS                                   |   5 +
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-int3472/Kconfig    |  31 +
>  drivers/platform/x86/intel-int3472/Makefile   |   4 +
>  .../intel-int3472/intel_skl_int3472_common.c  | 106 ++++
>  .../intel-int3472/intel_skl_int3472_common.h  | 110 ++++
>  .../intel_skl_int3472_discrete.c              | 592 ++++++++++++++++++
>  .../intel_skl_int3472_tps68470.c              | 113 ++++
>  9 files changed, 964 insertions(+)
>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a091b496fdd8..cf44b3e77b90 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9147,6 +9147,11 @@ S:	Maintained
>  F:	arch/x86/include/asm/intel_scu_ipc.h
>  F:	drivers/platform/x86/intel_scu_*
>  
> +INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
> +M:	Daniel Scally <djrscally@gmail.com>
> +S:	Maintained
> +F:	drivers/platform/x86/intel-int3472/intel_skl_int3472_*
> +
>  INTEL SPEED SELECT TECHNOLOGY
>  M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..9739d30951b6 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -844,6 +844,8 @@ config INTEL_CHT_INT33FE
>  	  device and CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m
>  	  for Type-C device.
>  
> +source "drivers/platform/x86/intel-int3472/Kconfig"
> +
>  config INTEL_HID_EVENT
>  	tristate "INTEL HID Event"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 581475f59819..2293b6c3d1c2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
>  obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
> +obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel-int3472/
>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>  
>  # MSI
> diff --git a/drivers/platform/x86/intel-int3472/Kconfig b/drivers/platform/x86/intel-int3472/Kconfig
> new file mode 100644
> index 000000000000..b94622245c21
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/Kconfig
> @@ -0,0 +1,31 @@
> +config INTEL_SKL_INT3472
> +	tristate "Intel SkyLake ACPI INT3472 Driver"
> +	depends on ACPI
> +	depends on REGULATOR
> +	depends on GPIOLIB
> +	depends on COMMON_CLK && CLKDEV_LOOKUP
> +	depends on I2C

Maybe these could be sorted alphabetically ?

> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  This driver adds support for the INT3472 ACPI devices found on some
> +	  Intel SkyLake devices.
> +
> +	  The INT3472 is an Intel camera power controller, a logical device
> +	  found on some Skylake-based systems that can map to different
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
> diff --git a/drivers/platform/x86/intel-int3472/Makefile b/drivers/platform/x86/intel-int3472/Makefile
> new file mode 100644
> index 000000000000..c887ee7d52ca
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/Makefile
> @@ -0,0 +1,4 @@
> +obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
> +intel_skl_int3472-objs			:= intel_skl_int3472_common.o \
> +					   intel_skl_int3472_discrete.o \
> +					   intel_skl_int3472_tps68470.o
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
> new file mode 100644
> index 000000000000..f61166b6c497
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/acpi.h>
> +#include <linux/i2c.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "intel_skl_int3472_common.h"
> +
> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
> +					       char *id)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_handle handle = adev->handle;
> +	union acpi_object *obj;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_object(handle, id, NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return ERR_PTR(-ENODEV);
> +
> +	obj = buffer.pointer;
> +	if (!obj)
> +		return ERR_PTR(-ENODEV);
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&adev->dev, "%s object is not an ACPI buffer\n", id);
> +		kfree(obj);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return obj;
> +}
> +
> +int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
> +{
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	obj = skl_int3472_get_acpi_buffer(adev, "CLDB");
> +	if (IS_ERR(obj))
> +		return PTR_ERR(obj);
> +
> +	if (obj->buffer.length > sizeof(*cldb)) {
> +		dev_err(&adev->dev, "The CLDB buffer is too large\n");
> +		ret = -EINVAL;
> +		goto out_free_obj;
> +	}
> +
> +	memcpy(cldb, obj->buffer.pointer, obj->buffer.length);
> +
> +out_free_obj:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +static const struct acpi_device_id int3472_device_id[] = {
> +	{ "INT3472", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, int3472_device_id);
> +
> +static struct platform_driver int3472_discrete = {
> +	.driver = {
> +		.name = "int3472-discrete",
> +		.acpi_match_table = int3472_device_id,
> +	},
> +	.probe = skl_int3472_discrete_probe,
> +	.remove = skl_int3472_discrete_remove,
> +};
> +
> +static struct i2c_driver int3472_tps68470 = {
> +	.driver = {
> +		.name = "int3472-tps68470",
> +		.acpi_match_table = int3472_device_id,
> +	},
> +	.probe_new = skl_int3472_tps68470_probe,
> +};
> +
> +static int skl_int3472_init(void)
> +{
> +	int ret = 0;
> +
> +	ret = platform_driver_register(&int3472_discrete);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_register_driver(THIS_MODULE, &int3472_tps68470);
> +	if (ret)
> +		platform_driver_unregister(&int3472_discrete);
> +
> +	return ret;
> +}
> +module_init(skl_int3472_init);
> +
> +static void skl_int3472_exit(void)
> +{
> +	platform_driver_unregister(&int3472_discrete);
> +	i2c_del_driver(&int3472_tps68470);
> +}
> +module_exit(skl_int3472_exit);
> +
> +MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Device Driver");
> +MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
> new file mode 100644
> index 000000000000..9169356cd522
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#ifndef _INTEL_SKL_INT3472_H
> +#define _INTEL_SKL_INT3472_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/types.h>
> +
> +/* PMIC GPIO Types */
> +#define INT3472_GPIO_TYPE_RESET					0x00
> +#define INT3472_GPIO_TYPE_POWERDOWN				0x01
> +#define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
> +#define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> +#define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +
> +#define INT3472_PDEV_MAX_NAME_LEN				23
> +#define INT3472_MAX_SENSOR_GPIOS				3
> +
> +#define GPIO_REGULATOR_NAME_LENGTH				21
> +#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
> +
> +#define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
> +
> +#define INT3472_REGULATOR(_name, _supply, _ops)			\
> +	(const struct regulator_desc) {				\
> +		.name = _name,					\
> +		.supply_name = _supply,				\
> +		.type = REGULATOR_VOLTAGE,			\
> +		.ops = _ops,					\
> +		.owner = THIS_MODULE,				\
> +	}
> +
> +#define to_int3472_clk(hw)					\
> +	container_of(hw, struct int3472_gpio_clock, clk_hw)
> +
> +#define to_int3472_device(clk)					\
> +	container_of(clk, struct int3472_discrete_device, clock)
> +
> +struct platform_device;
> +struct i2c_client;
> +struct acpi_device;

Alphabetical order ?

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
> +struct int3472_gpio_function_remap {
> +	char *documented;
> +	char *actual;

const char for both ?

> +};
> +
> +struct int3472_sensor_config {
> +	const char *sensor_module_name;
> +	struct regulator_consumer_supply supply_map;
> +	const struct int3472_gpio_function_remap *function_maps;
> +};
> +
> +struct int3472_discrete_device {
> +	struct acpi_device *adev;
> +	struct device *dev;
> +	struct acpi_device *sensor;
> +	const char *sensor_name;
> +
> +	struct int3472_sensor_config *sensor_config;

const

> +
> +	struct int3472_gpio_regulator {
> +		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
> +		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
> +		struct gpio_desc *gpio;
> +		struct regulator_dev *rdev;
> +		struct regulator_desc rdesc;
> +	} regulator;
> +
> +	struct int3472_gpio_clock {
> +		struct clk *clk;
> +		struct clk_hw clk_hw;
> +		struct clk_lookup *cl;
> +		struct gpio_desc *ena_gpio;
> +		struct gpio_desc *led_gpio;
> +		u32 frequency;
> +	} clock;
> +
> +	unsigned int n_gpios; /* how many GPIOs have we seen */
> +	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
> +	struct gpiod_lookup_table gpios;
> +};
> +
> +int skl_int3472_discrete_probe(struct platform_device *pdev);
> +int skl_int3472_discrete_remove(struct platform_device *pdev);
> +int skl_int3472_tps68470_probe(struct i2c_client *client);
> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
> +					       char *id);
> +int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb);
> +
> +#endif
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
> new file mode 100644
> index 000000000000..40652161bbbf
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
> @@ -0,0 +1,592 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/acpi.h>
> +#include <linux/clkdev.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/slab.h>
> +
> +#include "intel_skl_int3472_common.h"
> +
> +/*
> + * 79234640-9e10-4fea-a5c1-b5aa8b19756f
> + * This _DSM GUID returns information about the GPIO lines mapped to a
> + * discrete INT3472 device. Function number 1 returns a count of the GPIO
> + * lines that are mapped. Subsequent functions return 32 bit ints encoding
> + * information about the GPIO line, including its purpose.
> + */
> +static const guid_t int3472_gpio_guid =
> +	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> +		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
> +
> +/*
> + * 822ace8f-2814-4174-a56b-5f029fe079ee
> + * This _DSM GUID returns a string from the sensor device, which acts as a
> + * module identifier.
> + */
> +static const guid_t cio2_sensor_module_guid =
> +	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> +		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
> +
> +/*
> + * Here follows platform specific mapping information that we can pass to
> + * the functions mapping resources to the sensors. Where the sensors have
> + * a power enable pin defined in DSDT we need to provide a supply name so
> + * the sensor drivers can find the regulator. The device name will be derived
> + * from the sensor's ACPI device within the code. Optionally, we can provide a
> + * NULL terminated array of function name mappings to deal with any platform
> + * specific deviations from the documented behaviour of GPIOs.
> + *
> + * Map a GPIO function name to NULL to prevent the driver from mapping that
> + * GPIO at all.
> + */
> +
> +static const struct int3472_gpio_function_remap ov2680_gpio_function_remaps[] = {
> +	{ "reset", NULL },
> +	{ "powerdown", "reset" },
> +	{ }
> +};
> +
> +static struct int3472_sensor_config int3472_sensor_configs[] = {

This should be static const (and there will be some fallout due to that,
as skl_int3472_register_regulator() modifies the supply_map, so I think
you'll have a copy of supply_map in int3472_discrete_device).

> +	/* Lenovo Miix 510-12ISK - OV2680, Front */
> +	{ "GNDF140809R", { 0 }, ov2680_gpio_function_remaps},

Missing space before } (and below too).

> +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL},
> +	/* Surface Go 1&2 - OV5693, Front */
> +	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL},
> +};
> +
> +/*
> + * The regulators have to have .ops to be valid, but the only ops we actually
> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> + * empty struct to clear the check without lying about capabilities.
> + */
> +static const struct regulator_ops int3472_gpio_regulator_ops = { 0 };
> +
> +static int skl_int3472_clk_prepare(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value(clk->ena_gpio, 1);
> +	if (clk->led_gpio)
> +		gpiod_set_value(clk->led_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static void skl_int3472_clk_unprepare(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value(clk->ena_gpio, 0);
> +	if (clk->led_gpio)
> +		gpiod_set_value(clk->led_gpio, 0);
> +}
> +
> +static int skl_int3472_clk_enable(struct clk_hw *hw)
> +{
> +	/*
> +	 * We're just turning a GPIO on to enable, which operation has the
> +	 * potential to sleep. Given enable cannot sleep, but prepare can,
> +	 * we toggle the GPIO in prepare instead. Thus, nothing to do here.
> +	 */
> +	return 0;
> +}
> +
> +static void skl_int3472_clk_disable(struct clk_hw *hw)
> +{
> +	/* Likewise, nothing to do here... */
> +}
> +
> +static unsigned int skl_int3472_get_clk_frequency(struct int3472_discrete_device *int3472)
> +{
> +	union acpi_object *obj;
> +	unsigned int ret = 0;
> +
> +	obj = skl_int3472_get_acpi_buffer(int3472->sensor, "SSDB");
> +	if (IS_ERR(obj))
> +		return 0; /* report rate as 0 on error */
> +
> +	if (obj->buffer.length < CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET + sizeof(u32)) {

Should we define an ssdb structure instead of peeking into the buffer
with an offset ?

> +		dev_err(int3472->dev, "The buffer is too small\n");
> +		goto out_free_buff;
> +	}
> +
> +	ret = *(u32 *)(obj->buffer.pointer + CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET);
> +
> +out_free_buff:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +static unsigned long skl_int3472_clk_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
> +
> +	return int3472->clock.frequency;

Maybe just

	struct int3472_gpio_clock *clk = to_int3472_clk(hw);

	return clk->frequency;

> +}
> +
> +static const struct clk_ops skl_int3472_clock_ops = {
> +	.prepare = skl_int3472_clk_prepare,
> +	.unprepare = skl_int3472_clk_unprepare,
> +	.enable = skl_int3472_clk_enable,
> +	.disable = skl_int3472_clk_disable,
> +	.recalc_rate = skl_int3472_clk_recalc_rate,
> +};
> +
> +static struct int3472_sensor_config *
> +skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
> +{
> +	struct int3472_sensor_config *ret;
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
> +
> +	ret = NULL;
> +	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
> +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> +			    obj->string.pointer)) {
> +			ret = &int3472_sensor_configs[i];
> +			break;
> +		}
> +	}
> +
> +out_free_obj:
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int3472,
> +					  struct acpi_resource *ares,
> +					  char *func, u32 polarity)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;
> +	const struct int3472_sensor_config *sensor_config;
> +	struct gpiod_lookup *table_entry;
> +	struct acpi_device *adev;
> +	acpi_handle handle;
> +	acpi_status status;
> +	int ret;
> +
> +	if (int3472->n_sensor_gpios >= INT3472_MAX_SENSOR_GPIOS) {
> +		dev_warn(int3472->dev, "Too many GPIOs mapped\n");
> +		return -EINVAL;
> +	}
> +
> +	sensor_config = int3472->sensor_config;
> +	if (!IS_ERR_OR_NULL(sensor_config) && sensor_config->function_maps) {
> +		const struct int3472_gpio_function_remap *remap =
> +			sensor_config->function_maps;
> +
> +		for (; remap->documented; ++remap)
> +			if (!strcmp(func, remap->documented)) {
> +				func = remap->actual;
> +				break;
> +			}

No strictly required, but I'd use curly braces for the for loop. Up to
you.

> +	}
> +
> +	/* Functions mapped to NULL should not be mapped to the sensor */
> +	if (!func)
> +		return 0;
> +
> +	status = acpi_get_handle(NULL, path, &handle);
> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
> +
> +	ret = acpi_bus_get_device(handle, &adev);
> +	if (ret)
> +		return -ENODEV;
> +
> +	table_entry = &int3472->gpios.table[int3472->n_sensor_gpios];
> +	table_entry->key = acpi_dev_name(adev);
> +	table_entry->chip_hwnum = ares->data.gpio.pin_table[0];
> +	table_entry->con_id = func;
> +	table_entry->idx = 0;
> +	table_entry->flags = polarity;
> +
> +	int3472->n_sensor_gpios++;
> +
> +	return 0;
> +}
> +
> +static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
> +				       struct acpi_resource *ares, u8 type)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;
> +	struct gpio_desc *gpio;
> +
> +	switch (type) {
> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +		gpio = acpi_get_gpiod(path, ares->data.gpio.pin_table[0],
> +				      "int3472,clk-enable");
> +		if (IS_ERR(gpio))
> +			return (PTR_ERR(gpio));
> +
> +		int3472->clock.ena_gpio = gpio;
> +		break;
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		gpio = acpi_get_gpiod(path, ares->data.gpio.pin_table[0],
> +				      "int3472,privacy-led");
> +		if (IS_ERR(gpio))
> +			return (PTR_ERR(gpio));
> +
> +		int3472->clock.led_gpio = gpio;
> +		break;
> +	default:
> +		dev_err(int3472->dev, "Invalid GPIO type 0x%hx for clock\n",
> +			type);

type being a u8, it should be %hhx, but I'd just use 0x%02x.

> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
> +{
> +	struct clk_init_data init = {
> +		.ops = &skl_int3472_clock_ops,
> +		.flags = CLK_GET_RATE_NOCACHE,
> +	};
> +	int ret = 0;
> +
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
> +
> +	goto out_free_init_name;
> +
> +err_unregister_clk:
> +	clk_unregister(int3472->clock.clk);
> +out_free_init_name:
> +	kfree(init.name);
> +
> +	return ret;
> +}
> +
> +static int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
> +					  struct acpi_resource *ares)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;
> +	struct int3472_sensor_config *sensor_config;
> +	struct regulator_init_data init_data = { };
> +	struct regulator_config cfg = { };
> +	int ret;
> +
> +	sensor_config = int3472->sensor_config;
> +	if (IS_ERR_OR_NULL(sensor_config)) {
> +		dev_err(int3472->dev, "No sensor module config\n");
> +		return PTR_ERR(sensor_config);
> +	}
> +
> +	if (!sensor_config->supply_map.supply) {
> +		dev_err(int3472->dev, "No supply name defined\n");
> +		return -ENODEV;
> +	}
> +
> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> +	init_data.num_consumer_supplies = 1;
> +	sensor_config->supply_map.dev_name = int3472->sensor_name;
> +	init_data.consumer_supplies = &sensor_config->supply_map;
> +
> +	snprintf(int3472->regulator.regulator_name,
> +		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
> +		 acpi_dev_name(int3472->adev));
> +	snprintf(int3472->regulator.supply_name,
> +		 GPIO_REGULATOR_SUPPLY_NAME_LENGTH, "supply-0");
> +
> +	int3472->regulator.rdesc = INT3472_REGULATOR(
> +						int3472->regulator.regulator_name,
> +						int3472->regulator.supply_name,
> +						&int3472_gpio_regulator_ops);
> +
> +	int3472->regulator.gpio = acpi_get_gpiod(path,
> +						 ares->data.gpio.pin_table[0],
> +						 "int3472,regulator");
> +	if (IS_ERR(int3472->regulator.gpio)) {
> +		dev_err(int3472->dev, "Failed to get regulator GPIO lines\n");

s/lines/line/ (sorry, it was a typo in my review of v2)

> +		return PTR_ERR(int3472->regulator.gpio);
> +	}
> +
> +	cfg.dev = &int3472->adev->dev;
> +	cfg.init_data = &init_data;
> +	cfg.ena_gpiod = int3472->regulator.gpio;
> +
> +	int3472->regulator.rdev = regulator_register(&int3472->regulator.rdesc,
> +						     &cfg);
> +	if (IS_ERR(int3472->regulator.rdev)) {
> +		ret = PTR_ERR(int3472->regulator.rdev);
> +		goto err_free_gpio;
> +	}
> +
> +	return 0;
> +
> +err_free_gpio:
> +	gpiod_put(int3472->regulator.gpio);
> +
> +	return ret;
> +}
> +
> +/**
> + * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
> + * @ares: A pointer to a &struct acpi_resource
> + * @data: A pointer to a &struct int3472_discrete_device
> + *
> + * This function handles GPIO resources that are against an INT3472
> + * ACPI device, by checking the value of the corresponding _DSM entry.
> + * This will return a 32bit int, where the lowest byte represents the
> + * function of the GPIO pin:
> + *
> + * 0x00 Reset
> + * 0x01 Power down
> + * 0x0b Power enable
> + * 0x0c Clock enable
> + * 0x0d Privacy LED
> + *
> + * There are some known platform specific quirks where that does not quite
> + * hold up; for example where a pin with type 0x01 (Power down) is mapped to
> + * a sensor pin that performs a reset function or entries in _CRS and _DSM that
> + * do not actually correspond to a physical connection. These will be handled
> + * by the mapping sub-functions.
> + *
> + * GPIOs will either be mapped directly to the sensor device or else used
> + * to create clocks and regulators via the usual frameworks.
> + *
> + * Return:
> + * * 0		- When all resources found are handled properly.
> + * * -EINVAL	- If the resource is not a GPIO IO resource
> + * * -ENODEV	- If the resource has no corresponding _DSM entry
> + * * -Other	- Errors propagated from one of the sub-functions.
> + */
> +static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> +					     void *data)
> +{
> +	struct int3472_discrete_device *int3472 = data;
> +	u16 pin = ares->data.gpio.pin_table[0];
> +	union acpi_object *obj;
> +	char *err_msg;
> +	int ret = 0;
> +	u8 type;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO ||
> +	    ares->data.gpio.connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
> +		return 1; /* Deliberately positive so parsing continues */
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
> +		dev_warn(int3472->dev, "No _DSM entry for GPIO pin %u\n", pin);
> +		return 1;
> +	}
> +
> +	type = obj->integer.value & 0xff;
> +
> +	switch (type) {
> +	case INT3472_GPIO_TYPE_RESET:
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, ares, "reset",
> +						     GPIO_ACTIVE_LOW);
> +		if (ret)
> +			err_msg = "Failed to map reset pin to sensor\n";
> +
> +		break;
> +	case INT3472_GPIO_TYPE_POWERDOWN:
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, ares,
> +						     "powerdown",
> +						     GPIO_ACTIVE_LOW);
> +		if (ret)
> +			err_msg = "Failed to map powerdown pin to sensor\n";
> +
> +		break;
> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		ret = skl_int3472_map_gpio_to_clk(int3472, ares, type);
> +		if (ret)
> +			err_msg = "Failed to map GPIO to clock\n";
> +
> +		break;
> +	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +		ret = skl_int3472_register_regulator(int3472, ares);
> +		if (ret)
> +			err_msg = "Failed to map regulator to sensor\n";
> +
> +		break;
> +	default:
> +		dev_warn(int3472->dev,
> +			 "GPIO type 0x%02x unknown; the sensor may not work\n",
> +			 type);
> +		ret = 1;
> +		break;
> +	}
> +
> +	if (ret < 0 && ret != -EPROBE_DEFER)
> +		dev_err(int3472->dev, err_msg);
> +
> +	int3472->n_gpios++;
> +	ACPI_FREE(obj);
> +
> +	return ret;
> +}
> +
> +static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
> +{
> +	struct list_head resource_list;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	int3472->sensor_config = skl_int3472_get_sensor_module_config(int3472);

I have forgotten some of the context I'm afraid :-/ Are there valid use
cases for not checking for an error here, or should we do so and drop
the error checks in other functions above ?

> +
> +	ret = acpi_dev_get_resources(int3472->adev, &resource_list,
> +				     skl_int3472_handle_gpio_resources,
> +				     int3472);
> +	if (ret)
> +		goto out_free_res_list;
> +
> +	if (int3472->clock.ena_gpio) {
> +		ret = skl_int3472_register_clock(int3472);
> +		if (ret)
> +			goto out_free_res_list;
> +	} else {
> +		if (int3472->clock.led_gpio)
> +			dev_warn(int3472->dev,
> +				 "No clk GPIO. The privacy LED won't work\n");
> +	}
> +
> +	int3472->gpios.dev_id = int3472->sensor_name;
> +	gpiod_add_lookup_table(&int3472->gpios);
> +
> +out_free_res_list:
> +	acpi_dev_free_resource_list(&resource_list);
> +
> +	return ret;
> +}
> +
> +int skl_int3472_discrete_probe(struct platform_device *pdev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> +	struct int3472_discrete_device *int3472;
> +	struct int3472_cldb cldb;
> +	int ret;
> +
> +	ret = skl_int3472_fill_cldb(adev, &cldb);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't fill CLDB structure\n");
> +		return ret;
> +	}
> +
> +	if (cldb.control_logic_type != 1) {
> +		dev_err(&pdev->dev, "Unsupported control logic type %u\n",
> +			cldb.control_logic_type);
> +		return -EINVAL;
> +	}
> +
> +	/* Max num GPIOs we've seen plus a terminator */
> +	int3472 = kzalloc(struct_size(int3472, gpios.table,
> +			  INT3472_MAX_SENSOR_GPIOS + 1), GFP_KERNEL);
> +	if (!int3472)
> +		return -ENOMEM;
> +
> +	int3472->adev = adev;
> +	int3472->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, int3472);
> +
> +	int3472->sensor = acpi_dev_get_dependent_dev(adev);
> +	if (IS_ERR_OR_NULL(int3472->sensor)) {
> +		dev_err(&pdev->dev,
> +			"INT3472 seems to have no dependents.\n");
> +		ret = -ENODEV;
> +		goto err_free_int3472;
> +	}
> +	get_device(&int3472->sensor->dev);

I see no corresponding put_device(), am I missing something ? I'm also
not sure why this is needed.

> +
> +	int3472->sensor_name = kasprintf(GFP_KERNEL, I2C_DEV_NAME_FORMAT,
> +					 acpi_dev_name(int3472->sensor));

This needs a NULL check.

> +
> +	ret = skl_int3472_parse_crs(int3472);
> +	if (ret) {
> +		skl_int3472_discrete_remove(pdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_free_int3472:
> +	kfree(int3472);
> +	return ret;
> +}
> +
> +int skl_int3472_discrete_remove(struct platform_device *pdev)
> +{
> +	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
> +
> +	if (int3472->gpios.dev_id)
> +		gpiod_remove_lookup_table(&int3472->gpios);
> +
> +	if (!IS_ERR(int3472->regulator.rdev))
> +		regulator_unregister(int3472->regulator.rdev);
> +
> +	if (!IS_ERR(int3472->clock.clk))
> +		clk_unregister(int3472->clock.clk);
> +
> +	if (int3472->clock.cl)
> +		clkdev_drop(int3472->clock.cl);
> +
> +	gpiod_put(int3472->regulator.gpio);
> +	gpiod_put(int3472->clock.ena_gpio);
> +	gpiod_put(int3472->clock.led_gpio);
> +
> +	acpi_dev_put(int3472->sensor);
> +
> +	kfree(int3472->sensor_name);
> +	kfree(int3472);
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> new file mode 100644
> index 000000000000..d0d2391e263f
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/tps68470.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "intel_skl_int3472_common.h"
> +
> +static const struct mfd_cell tps68470_c[] = {
> +	{ .name = "tps68470-gpio" },
> +	{ .name = "tps68470_pmic_opregion" },
> +};
> +
> +static const struct mfd_cell tps68470_w[] = {

Maybe more explicit names than _c and _w could be nice ?

> +	{ .name = "tps68470-gpio" },
> +	{ .name = "tps68470-clk" },
> +	{ .name = "tps68470-regulator"},

Missing space before }.

> +};
> +
> +static const struct regmap_config tps68470_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = TPS68470_REG_MAX,
> +};
> +
> +static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
> +{
> +	unsigned int version;
> +	int ret;
> +
> +	/* Force software reset */
> +	ret = regmap_write(regmap, TPS68470_REG_RESET, TPS68470_REG_RESET_MASK);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(regmap, TPS68470_REG_REVID, &version);
> +	if (ret) {
> +		dev_err(dev, "Failed to read revision register: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "TPS68470 REVID: 0x%02x\n", version);
> +
> +	return 0;
> +}
> +
> +int skl_int3472_tps68470_probe(struct i2c_client *client)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct int3472_cldb cldb = { 0 };
> +	bool cldb_present = true;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&client->dev, "Failed to create regmap: %ld\n",
> +			PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	i2c_set_clientdata(client, regmap);
> +
> +	ret = tps68470_chip_init(&client->dev, regmap);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "TPS68470 init error %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check CLDB buffer against the PMIC's adev. If present, then we check
> +	 * the value of control_logic_type field and follow one of the
> +	 * following scenarios:
> +	 *
> +	 *	1. No CLDB - likely ACPI tables designed for ChromeOS. We
> +	 *	create platform devices for the GPIOs and OpRegion drivers.
> +	 *
> +	 *	2. CLDB, with control_logic_type = 2 - probably ACPI tables
> +	 *	made for Windows 2-in-1 platforms. Register pdevs for GPIO,
> +	 *	Clock and Regulator drivers to bind to.
> +	 *
> +	 *	3. Any other value in control_logic_type, we should never have
> +	 *	gotten to this point; fail probe and return.
> +	 */
> +	ret = skl_int3472_fill_cldb(adev, &cldb);
> +	if (!ret && cldb.control_logic_type != 2) {
> +		dev_err(&client->dev, "Unsupported control logic type %u\n",
> +			cldb.control_logic_type);
> +		return -EINVAL;
> +	}
> +
> +	if (ret)
> +		cldb_present = false;
> +
> +	if (cldb_present)
> +		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					   tps68470_w, ARRAY_SIZE(tps68470_w),
> +					   NULL, 0, NULL);
> +	else
> +		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					   tps68470_c, ARRAY_SIZE(tps68470_c),
> +					   NULL, 0, NULL);
> +
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to add MFD devices\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}

-- 
Regards,

Laurent Pinchart
