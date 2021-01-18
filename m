Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECA82F9CDA
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388301AbhARK04 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388488AbhARJQU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 04:16:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354E5C061573;
        Mon, 18 Jan 2021 01:15:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6B742BB;
        Mon, 18 Jan 2021 10:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610961338;
        bh=hqH9ln6ubltD2xKzirknR3azoIgG4rv/N3xktRkdr5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oMBeOAqf1AFQTatBIXwMo+wQxqkpeo9g511PygEsCFoskScniEgwGvjjOHFimT1hX
         CyhFOokCjNUNgM79z0pCKEz7TZO/EX+yRM+VwIpZNWTg8JdXvn1yZI5CkuYjv2isB2
         8+afh05neh9AT2ODq8JB3v09ebgracqZW01qm7vs=
Date:   Mon, 18 Jan 2021 11:15:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-7-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Jan 18, 2021 at 12:34:27AM +0000, Daniel Scally wrote:
> ACPI devices with _HID INT3472 are currently matched to the tps68470
> driver, however this does not cover all situations in which that _HID
> occurs. We've encountered three possibilities:
> 
> 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
> a physical tps68470 device) that requires a GPIO and OpRegion driver
> 2. On devices designed for Windows, an ACPI device with _HID INT3472
> (again representing a physical tps68470 device) which requires GPIO,
> Clock and Regulator drivers.
> 3. On other devices designed for Windows, an ACPI device with _HID
> INT3472 which does NOT represent a physical tps68470, and is instead
> used as a dummy device to group some system GPIO lines which are meant
> to be consumed by the sensor that is dependent on this entry.
> 
> This commit adds a new module, registering a platform driver to deal
> with the 3rd scenario plus an i2c-driver to deal with #1 and #2, by
> querying the CLDB buffer found against INT3472 entries to determine
> which is most appropriate.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
> 
> 	- Switched to a module registering a platform driver to run
> 	the dummy ACPI devices, plus an i2c driver to replace and extend
> 	the existing tps68470 driver
> 	- Added clock handling functions to the int3472-discrete driver
> 	- A whole bunch of other changes too numerous to enumerate
>  MAINTAINERS                                   |   5 +
>  drivers/platform/x86/Kconfig                  |  25 +
>  drivers/platform/x86/Makefile                 |   4 +
>  .../platform/x86/intel_skl_int3472_common.c   | 100 ++++
>  .../platform/x86/intel_skl_int3472_common.h   | 100 ++++
>  .../platform/x86/intel_skl_int3472_discrete.c | 496 ++++++++++++++++++
>  .../platform/x86/intel_skl_int3472_tps68470.c | 145 +++++
>  7 files changed, 875 insertions(+)
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel_skl_int3472_tps68470.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a091b496fdd8..c4ed8c3bc58e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9147,6 +9147,11 @@ S:	Maintained
>  F:	arch/x86/include/asm/intel_scu_ipc.h
>  F:	drivers/platform/x86/intel_scu_*
>  
> +INTEL SKL INT3472 ACPI DEVICE DRIVER
> +M:	Daniel Scally <djrscally@gmail.com>
> +S:	Maintained
> +F:	drivers/platform/x86/intel_skl_int3472_*
> +
>  INTEL SPEED SELECT TECHNOLOGY
>  M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..916b077df2d5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -844,6 +844,31 @@ config INTEL_CHT_INT33FE
>  	  device and CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m
>  	  for Type-C device.
>  
> +config INTEL_SKL_INT3472
> +	tristate "Intel SkyLake ACPI INT3472 Driver"
> +	depends on X86 && ACPI
> +	select REGMAP_I2C
> +	help
> +	  This driver adds support for the INT3472 ACPI devices found on some
> +	  Intel SkyLake devices.
> +
> +	  There are 3 kinds of INT3472 ACPI device possible; two for devices
> +	  designed for Windows (either with or without a physical tps68470

I'd capitalize TPS, chip names are usually written in upper case, and
driver names in lower case.

> +	  PMIC) and one designed for Chrome OS.

How about expanding this a bit to explain what the INT3472 stands for ?

	  The INT3472 is an Intel camera power controller, a logical device
	  found on some Skylake-based systems that can map to different
	  hardware devices depending on the platform. On machines
	  designed for Chrome OS, it maps to a TPS68470 camera PMIC. On
	  machines designed for Windows, it maps to either a TP68470
	  camera PMIC, a uP6641Q sensor PMIC, or a set of discrete GPIOs
	  and power gates.


> This driver handles all three
> +	  situations by discovering information it needs to discern them at
> +	  runtime.
> +
> +	  If your device was designed for Chrome OS, this driver will provide
> +	  an ACPI operation region, which must be available before any of the
> +	  devices using this are probed. For this reason, you should select Y
> +	  if your device was designed for ChromeOS. This option also configures
> +	  the designware-i2c driver to be built-in, for the same reason.

Is the last sentence a leftover ?

> +
> +	  Say Y or M here if you have a SkyLake device designed for use
> +	  with Windows or ChromeOS. Say N here if you are not sure.
> +
> +	  The module will be named "intel-skl-int3472"
> +
>  config INTEL_HID_EVENT
>  	tristate "INTEL HID Event"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 581475f59819..ae29c66842ca 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -86,6 +86,10 @@ obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
>  obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
> +obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
> +intel_skl_int3472-objs			:= intel_skl_int3472_common.o \
> +				   	   intel_skl_int3472_discrete.o \
> +				   	   intel_skl_int3472_tps68470.o
>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>  
>  # MSI
> diff --git a/drivers/platform/x86/intel_skl_int3472_common.c b/drivers/platform/x86/intel_skl_int3472_common.c
> new file mode 100644
> index 000000000000..08cb9d3c06aa
> --- /dev/null
> +++ b/drivers/platform/x86/intel_skl_int3472_common.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/acpi.h>
> +#include <linux/i2c.h>
> +#include <linux/platform_device.h>

#include <linux/slab.h>

for kfree().

> +
> +#include "intel_skl_int3472_common.h"
> +
> +int skl_int3472_get_cldb_buffer(struct acpi_device *adev,
> +				struct int3472_cldb *cldb)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_handle handle = adev->handle;
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret = 0;
> +
> +	status = acpi_evaluate_object(handle, "CLDB", NULL, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	obj = buffer.pointer;
> +	if (!obj) {
> +		dev_err(&adev->dev, "ACPI device has no CLDB object\n");

Is this the code path that is taken on Chrome OS ? If so an error
message isn't appropriate. I'd drop this message, and instead add an
error message in the discrete PMIC code.

> +		return -ENODEV;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&adev->dev, "CLDB object is not an ACPI buffer\n");
> +		ret = -EINVAL;
> +		goto out_free_buff;
> +	}
> +
> +	if (obj->buffer.length > sizeof(*cldb)) {
> +		dev_err(&adev->dev, "The CLDB buffer is too large\n");
> +		ret = -EINVAL;
> +		goto out_free_buff;
> +	}
> +
> +	memcpy(cldb, obj->buffer.pointer, obj->buffer.length);
> +
> +out_free_buff:
> +	kfree(buffer.pointer);
> +	return ret;
> +}
> +
> +static const struct acpi_device_id int3472_device_id[] = {
> +	{ "INT3472", 0 },
> +	{ },
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
> +		goto err_unregister_plat_drv;

You could call platform_driver_unregister() directly here and return
ret. I don't expect this function will need to be extended with a more
complex error handling code path.

> +
> +	return 0;
> +
> +err_unregister_plat_drv:
> +	platform_driver_unregister(&int3472_discrete);
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
> diff --git a/drivers/platform/x86/intel_skl_int3472_common.h b/drivers/platform/x86/intel_skl_int3472_common.h
> new file mode 100644
> index 000000000000..9acd0ce7aed9
> --- /dev/null
> +++ b/drivers/platform/x86/intel_skl_int3472_common.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Author: Dan Scally <djrscally@gmail.com> */

Missing blank line, and missing header guard.

> +#include <linux/regulator/machine.h>

Alphabetically sorted please.

> +#include <linux/clk-provider.h>
> +#include <linux/gpio/machine.h>

You can drop this and forward-declare struct gpio_desc.

> +#include <linux/regulator/driver.h>
> +#include <linux/types.h>
> +
> +/* PMIC GPIO Types */
> +#define INT3472_GPIO_TYPE_RESET					0x00
> +#define INT3472_GPIO_TYPE_POWERDOWN				0x01
> +#define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> +#define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b

Should the macros be sorted by value ?

> +#define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d

Blank line here ?

> +#define INT3472_PDEV_MAX_NAME_LEN				23
> +#define INT3472_MAX_SENSOR_GPIOS				3

And blank line here too ?

> +#define GPIO_REGULATOR_NAME_LENGTH				27
> +#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
> +
> +#define INT3472_REGULATOR(_NAME, _SUPPLY, _OPS)			\

Macro arguments don't need to be capitalized.

> +	(const struct regulator_desc) {				\
> +		.name = _NAME,					\
> +		.supply_name = _SUPPLY,				\
> +		.id = 0,					\
> +		.type = REGULATOR_VOLTAGE,			\
> +		.ops = _OPS,					\
> +		.owner = THIS_MODULE,				\
> +	}
> +
> +#define INT3472_GPIO_FUNCTION_REMAP(_PIN, _FUNCTION)		\
> +	(const struct int3472_gpio_function_remap) {		\
> +		.documented = _PIN,					\
> +		.actual = _FUNCTION				\
> +	}
> +
> +#define to_int3472_clk(hw)					\
> +	container_of(hw, struct int3472_gpio_clock, clk_hw)
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
> +struct int3472_gpio_regulator {
> +	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
> +	char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
> +	struct gpio_desc *gpio;
> +	struct regulator_dev *rdev;
> +	struct regulator_desc rdesc;
> +};
> +
> +struct int3472_gpio_clock {
> +	struct clk *clk;
> +	struct clk_hw clk_hw;
> +	struct clk_lookup *cl;
> +	struct gpio_desc *gpio;
> +};
> +
> +struct int3472_device {

Maybe int3472_discrete_device ?

> +	struct acpi_device *adev;
> +	struct platform_device *pdev;
> +	struct acpi_device *sensor;
> +	char *sensor_name;

const ?

> +
> +	unsigned int n_gpios; /* how many GPIOs have we seen */
> +
> +	struct int3472_gpio_regulator regulator;
> +	struct int3472_gpio_clock clock;

You don't necessarily need to define separate structures for this, you
could also write

	struct {
		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
		struct gpio_desc *gpio;
		struct regulator_dev *rdev;
		struct regulator_desc rdesc;
	} regulator;

	struct {
		struct clk *clk;
		struct clk_hw clk_hw;
		struct clk_lookup *cl;
		struct gpio_desc *gpio;
	} clock;

It's entirely up to you.

> +
> +	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
> +	bool gpios_mapped;
> +	struct gpiod_lookup_table gpios;
> +};
> +
> +struct int3472_gpio_function_remap {
> +	char *documented;
> +	char *actual;

const for both ?

> +};
> +
> +struct int3472_sensor_config {
> +	char *sensor_module_name;
> +	struct regulator_consumer_supply supply_map;
> +	const struct int3472_gpio_function_remap *function_maps;
> +};
> +
> +int skl_int3472_discrete_probe(struct platform_device *pdev);
> +int skl_int3472_discrete_remove(struct platform_device *pdev);
> +int skl_int3472_tps68470_probe(struct i2c_client *client);
> +int skl_int3472_get_cldb_buffer(struct acpi_device *adev,
> +				struct int3472_cldb *cldb);

struct platform_device, struct i2c_client and strct acpi_device should
be forward-declared at the top.

> diff --git a/drivers/platform/x86/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel_skl_int3472_discrete.c
> new file mode 100644
> index 000000000000..93d250dca92f
> --- /dev/null
> +++ b/drivers/platform/x86/intel_skl_int3472_discrete.c
> @@ -0,0 +1,496 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/acpi.h>
> +#include <linux/clkdev.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +
> +#include "intel_skl_int3472_common.h"
> +
> +/* 79234640-9e10-4fea-a5c1-b5aa8b19756f */
> +static const guid_t int3472_gpio_guid =
> +	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> +		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
> +
> +/* 822ace8f-2814-4174-a56b-5f029fe079ee */
> +static const guid_t cio2_sensor_module_guid =
> +	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> +		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);


A comment that explains what those DSM functions do would be useful for
reference. It has taken lots of time to figure it out, let's spare the
pain to the next person who tries to understand this :-)

> +
> +/*
> + * Here follows platform specific mapping information that we can pass to
> + * the functions mapping resources to the sensors. Where the sensors have
> + * a power enable pin defined in DSDT we need to provide a supply name so
> + * the sensor drivers can find the regulator. Optionally, we can provide a
> + * NULL terminated array of function name mappings to deal with any platform
> + * specific deviations from the documented behaviour of GPIOs.
> + *
> + * Map a GPIO function name to NULL to prevent the driver from mapping that
> + * GPIO at all.
> + */
> +
> +static const struct int3472_gpio_function_remap ov2680_gpio_function_remaps[] = {
> +	INT3472_GPIO_FUNCTION_REMAP("reset", NULL),

Does the macro increase readability compared to writing

	{ "reset", NULL },

? I think I'd drop it.

> +	INT3472_GPIO_FUNCTION_REMAP("powerdown", "reset"),
> +	{ }
> +};
> +
> +static struct int3472_sensor_config int3472_sensor_configs[] = {

static const struct

> +	/* Lenovo Miix 510-12ISK - OV2680, Front */
> +	{ "GNDF140809R", { 0 }, ov2680_gpio_function_remaps},
> +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", "i2c-OVTI5648:00"), NULL},
> +	/* Surface Go 1&2 - OV5693, Front */
> +	{ "YHCU", REGULATOR_SUPPLY("avdd", "i2c-INT33BE:00"), NULL},
> +};
> +
> +/*
> + * The regulators have to have .ops to be valid, but the only ops we actually
> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> + * empty struct to clear the check without lying about capabilities.
> + */
> +static const struct regulator_ops int3472_gpio_regulator_ops = { 0 };
> +
> +static int skl_int3472_clk_enable(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value(clk->gpio, 1);

The clock enable() and disable() methods are not supposed to sleep,
while setting a GPIO value may sleep in the general case. Should this be
moved to skl_int3472_clk_prepare() ? Same for skl_int3472_clk_disable()
and skl_int3472_clk_unprepare().

> +
> +	return 0;
> +}
> +
> +static void skl_int3472_clk_disable(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value(clk->gpio, 0);
> +}
> +
> +static int skl_int3472_clk_prepare(struct clk_hw *hw)
> +{
> +	/*
> +	 * We're just turning a GPIO on to enable, so nothing to do here, but
> +	 * we want to provide the op so prepare_enable() works.
> +	 */
> +	return 0;
> +}
> +
> +static void skl_int3472_clk_unprepare(struct clk_hw *hw)
> +{
> +	/* Likewise, nothing to do here... */
> +}
> +
> +static const struct clk_ops skl_int3472_clock_ops = {
> +	.prepare = skl_int3472_clk_prepare,
> +	.unprepare = skl_int3472_clk_unprepare,
> +	.enable = skl_int3472_clk_enable,
> +	.disable = skl_int3472_clk_disable,
> +};
> +
> +static struct int3472_sensor_config *
> +skl_int3472_get_sensor_module_config(struct int3472_device *int3472)
> +{
> +	unsigned int i = ARRAY_SIZE(int3472_sensor_configs);
> +	struct int3472_sensor_config *ret;
> +	union acpi_object *obj;
> +
> +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
> +				      &cio2_sensor_module_guid, 0x00,
> +				      0x01, NULL, ACPI_TYPE_STRING);
> +
> +	if (!obj) {
> +		dev_err(&int3472->pdev->dev,
> +			"Failed to get sensor module string from _DSM\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	if (obj->string.type != ACPI_TYPE_STRING) {
> +		dev_err(&int3472->pdev->dev,
> +			"Sensor _DSM returned a non-string value\n");
> +		ret = ERR_PTR(-EINVAL);
> +		goto out_free_obj;
> +	}
> +
> +	ret = ERR_PTR(-ENODEV);
> +	while (i--) {

Unless there's a specific need to iterate backward over the array,

	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); ++i) {

> +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> +			    obj->string.pointer)) {
> +			ret = &int3472_sensor_configs[i];

Just

			break;

> +			goto out_free_obj;
> +		}
> +	}
> +
> +out_free_obj:
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static int skl_int3472_map_gpio_to_sensor(struct int3472_device *int3472,
> +					  struct acpi_resource *ares,
> +					  char *func, u32 polarity)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;

const

> +	struct int3472_sensor_config *sensor_config;
> +	struct gpiod_lookup table_entry;
> +	struct acpi_device *adev;
> +	acpi_handle handle;
> +	acpi_status status;
> +	int ret;
> +
> +	sensor_config = skl_int3472_get_sensor_module_config(int3472);
> +	if (!IS_ERR(sensor_config) && sensor_config->function_maps) {
> +		unsigned int i = 0;

		const struct int3472_gpio_function_remap *remap =
			sensor_config->function_maps;

		for (; remap->documented; ++remap) {
			if (!strcmp(func, remap->documented)) {
				func = remap->actual;

> +
> +		while (sensor_config->function_maps[i].documented) {
> +			if (!strcmp(func, sensor_config->function_maps[i].documented)) {
> +				func = sensor_config->function_maps[i].actual;
> +

Extra blank line.

> +				break;
> +			}
> +
> +			i++;
> +		}
> +	}
> +
> +	if (!func)
> +		return 0;

I initially thought this wasn't right, as if no entry was found in the
mapping table, func would still have its non-NULL value as passed to
this function. I then realized that you're checking if the match that
was found is NULL. A comment to explain this would be useful.

> +
> +	if (int3472->n_sensor_gpios >= INT3472_MAX_SENSOR_GPIOS) {
> +		dev_warn(&int3472->pdev->dev, "Too many GPIOs mapped\n");
> +		return -EINVAL;
> +	}

You can move this to the top.

> +
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
> +							   func, 0, polarity);

I wonder if

	table_entry.key = acpi_dev_name(adev);
	table_entry.chip_hwnum = ares->data.gpio.pin_table[0];
	table_entry.con_id = func;
	table_entry.idx = 0;
	table_entry.flags = polarity;

(with struct gpiod_lookup table_entry = { }; above) would be more
readable. Up to you.

> +
> +	memcpy(&int3472->gpios.table[int3472->n_sensor_gpios], &table_entry,
> +	       sizeof(table_entry));

Ah, or maybe

	struct gpio_lookup *table_entry;

	table_entry = &int3472->gpios.table[int3472->n_sensor_gpios];
	table_entry->key = acpi_dev_name(adev);
	table_entry->chip_hwnum = ares->data.gpio.pin_table[0];
	table_entry->con_id = func;
	table_entry->idx = 0;
	table_entry->flags = polarity;

(no need to memset() to 0 first as the whole structure has been
allocated with kzalloc()).

> +
> +	int3472->n_sensor_gpios++;
> +
> +	return 0;
> +}
> +
> +static int skl_int3472_register_clock(struct int3472_device *int3472,
> +				      struct acpi_resource *ares)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;

const

> +	struct clk_init_data init = { };

	struct clk_init_data init = {
		.ops = &skl_int3472_clock_ops,
	};

and drop it from below (up to you).

> +	int ret = 0;
> +
> +	init.name = kasprintf(GFP_KERNEL, "%s-clk",
> +			      acpi_dev_name(int3472->adev));

You need to check for NULL and return -ENOMEM.

> +	init.ops = &skl_int3472_clock_ops;
> +
> +	int3472->clock.gpio = acpi_get_gpiod(path,
> +					     ares->data.gpio.pin_table[0]);
> +	if (IS_ERR(int3472->clock.gpio)) {
> +		ret = PTR_ERR(int3472->clock.gpio);
> +		goto out_free_init_name;
> +	}
> +
> +	int3472->clock.clk_hw.init = &init;
> +	int3472->clock.clk = clk_register(&int3472->adev->dev,
> +					  &int3472->clock.clk_hw);
> +	if (IS_ERR(int3472->clock.clk)) {
> +		ret = PTR_ERR(int3472->clock.clk);
> +		goto err_put_gpio;
> +	}
> +
> +	int3472->clock.cl = clkdev_create(int3472->clock.clk, "xvclk",
> +					  int3472->sensor_name);
> +	if (IS_ERR_OR_NULL(int3472->clock.cl))

	if (!int3472->clock.cl)

as the function never return an error pointer.

> +		goto err_unregister_clk;

If this fails, you will end up calling clk_unregister() and
clkdev_drop() in skl_int3472_discrete_remove(). You should replace the
check in the remove function with

	if (!int3472->clock.cl) {

> +
> +	goto out_free_init_name;
> +
> +err_unregister_clk:
> +	clk_unregister(int3472->clock.clk);
> +err_put_gpio:
> +	gpiod_put(int3472->clock.gpio);
> +out_free_init_name:
> +	kfree(init.name);
> +
> +	return ret;
> +}
> +
> +static int skl_int3472_register_regulator(struct int3472_device *int3472,
> +					  struct acpi_resource *ares)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;

const

> +	struct int3472_sensor_config *sensor_config;
> +	struct regulator_init_data init_data = { };
> +	struct regulator_config cfg = { };
> +	int ret;
> +
> +	sensor_config = skl_int3472_get_sensor_module_config(int3472);
> +	if (IS_ERR_OR_NULL(sensor_config)) {

The function never returns NULL, you can use IS_ERR().

> +		dev_err(&int3472->pdev->dev, "No sensor module config\n");
> +		return PTR_ERR(sensor_config);
> +	}

Would it make sense to call this in skl_int3472_discrete_probe() or
skl_int3472_parse_crs() and cache the config pointer ?

> +
> +	if (!sensor_config->supply_map.supply) {
> +		dev_err(&int3472->pdev->dev, "No supply name defined\n");
> +		return -ENODEV;
> +	}
> +
> +	init_data.supply_regulator = NULL;

Not needed, you initialize init_data to 0 when declaring it.

> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> +	init_data.num_consumer_supplies = 1;
> +	init_data.consumer_supplies = &sensor_config->supply_map;
> +
> +	snprintf(int3472->regulator.regulator_name,
> +		 GPIO_REGULATOR_NAME_LENGTH, "int3472-discrete-regulator");

s/GPIO_REGULATOR_NAME_LENGTH/sizeof(int3472->regulator.regulator_name)/

Do regulator names need to be unique ? If so you may have a problem if a
platform has two discrete INT3472.

> +	snprintf(int3472->regulator.supply_name,
> +		 GPIO_REGULATOR_SUPPLY_NAME_LENGTH, "supply-0");
> +
> +	int3472->regulator.rdesc = INT3472_REGULATOR(
> +						int3472->regulator.regulator_name,
> +						int3472->regulator.supply_name,
> +						&int3472_gpio_regulator_ops);
> +
> +	int3472->regulator.gpio = acpi_get_gpiod(path,
> +						 ares->data.gpio.pin_table[0]);
> +	if (IS_ERR(int3472->regulator.gpio)) {
> +		dev_err(&int3472->pdev->dev, "Failed to get GPIO line\n");

s/GPIO line/regulator GPIO lines/ ?

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
> + * skl_int3472_handle_gpio_resources: maps PMIC resources to consuming sensor

s/: maps/ - Map/

> + * @ares: A pointer to a &struct acpi_resource
> + * @data: A pointer to a &struct int3472_device
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
> + * do not actually correspond to a physical connection. These will be handled by
> + * the mapping sub-functions.
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
> +	struct int3472_device *int3472 = data;
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO ||
> +	    ares->data.gpio.connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
> +		return EINVAL; /* Deliberately positive so parsing continues */

Maybe 1 instead of EINVAL ?

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
> +		dev_warn(&int3472->pdev->dev,
> +			 "No _DSM entry for this GPIO pin\n");

s/this GPIO pin/GPIO pin %u/

(and add the corresponding argument).

> +		return ENODEV;

		return 1;

> +	}
> +
> +	switch (obj->integer.value & 0xff) {
> +	case INT3472_GPIO_TYPE_RESET:
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, ares, "reset",
> +						     GPIO_ACTIVE_LOW);
> +		if (ret)
> +			dev_err(&int3472->pdev->dev,
> +				"Failed to map reset pin to sensor\n");
> +
> +		break;
> +	case INT3472_GPIO_TYPE_POWERDOWN:
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, ares, "powerdown",
> +						     GPIO_ACTIVE_LOW);
> +		if (ret)
> +			dev_err(&int3472->pdev->dev,
> +				"Failed to map powerdown pin to sensor\n");
> +
> +		break;
> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +		ret = skl_int3472_register_clock(int3472, ares);
> +		if (ret)
> +			dev_err(&int3472->pdev->dev,
> +				"Failed to map clock to sensor\n");
> +
> +		break;
> +	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +		ret = skl_int3472_register_regulator(int3472, ares);
> +		if (ret) {
> +			dev_err(&int3472->pdev->dev,
> +				"Failed to map regulator to sensor\n");
> +		}
> +
> +		break;
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, ares,
> +						     "indicator-led",
> +						     GPIO_ACTIVE_HIGH);

Mapping the indicator LED to the sensor isn't great, as all sensor
drivers would then need to handle it. Could it be handled in the
regulator instead, so that it would be turned on automatically when the
sensor is powered up ? Another option, more complicated, would be to
handle it in the CIO2 driver (but I'm not sure how we would map it).

> +		if (ret)
> +			dev_err(&int3472->pdev->dev,
> +				"Failed to map indicator led to sensor\n");
> +
> +		break;
> +	default:
> +		dev_warn(&int3472->pdev->dev,
> +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
> +			 (obj->integer.value & 0xff));

No need for parentheses.

> +		ret = EINVAL;

		ret = 1;
		break;

> +	}
> +
> +	int3472->n_gpios++;
> +	ACPI_FREE(obj);
> +
> +	return ret;
> +}
> +
> +static int skl_int3472_parse_crs(struct int3472_device *int3472)
> +{
> +	struct list_head resource_list;
> +	int ret = 0;

No need to initialize ret to 0.

> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret = acpi_dev_get_resources(int3472->adev, &resource_list,
> +				     skl_int3472_handle_gpio_resources,
> +				     int3472);
> +

You can drop this blank line.

> +	if (!ret) {
> +		gpiod_add_lookup_table(&int3472->gpios);
> +		int3472->gpios_mapped = true;
> +	}
> +
> +	acpi_dev_free_resource_list(&resource_list);
> +
> +	return ret;
> +}
> +
> +int skl_int3472_discrete_probe(struct platform_device *pdev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> +	struct int3472_device *int3472;
> +	struct int3472_cldb cldb;
> +	int ret = 0;

No need to initialize ret to 0.

> +
> +	ret = skl_int3472_get_cldb_buffer(adev, &cldb);
> +	if (ret || cldb.control_logic_type != 1)

An error message is needed for unsupported control_logic_type values.

> +		return -EINVAL;
> +
> +	int3472 = kzalloc(sizeof(*int3472) +
> +			 ((INT3472_MAX_SENSOR_GPIOS + 1) * sizeof(struct gpiod_lookup)),

One more space for the indentation, and the outer parentheses are not
needed.

> +			 GFP_KERNEL);
> +	if (!int3472)
> +		return -ENOMEM;
> +
> +	int3472->adev = adev;
> +	int3472->pdev = pdev;
> +	platform_set_drvdata(pdev, int3472);
> +
> +	int3472->sensor = acpi_dev_get_next_dep_dev(adev, NULL);
> +	if (!int3472->sensor) {
> +		dev_err(&pdev->dev,
> +			"This INT3472 entry seems to have no dependents.\n");

s/This INT3472 entry/INT3472/

> +		ret = -ENODEV;
> +		goto err_free_int3472;
> +	}
> +	int3472->sensor_name = i2c_acpi_dev_name(int3472->sensor);
> +	int3472->gpios.dev_id = int3472->sensor_name;
> +
> +	ret = skl_int3472_parse_crs(int3472);
> +	if (ret) {
> +		skl_int3472_discrete_remove(pdev);
> +		goto err_return_ret;

Just

		return ret;

will do.

> +	}
> +
> +	return 0;
> +
> +err_free_int3472:
> +	kfree(int3472);
> +err_return_ret:
> +	return ret;
> +}
> +
> +int skl_int3472_discrete_remove(struct platform_device *pdev)
> +{
> +	struct int3472_device *int3472;
> +
> +	int3472 = platform_get_drvdata(pdev);

	struct int3472_device *int3472 = platform_get_drvdata(pdev);

> +
> +	if (int3472->gpios_mapped)
> +		gpiod_remove_lookup_table(&int3472->gpios);

You could avoid the need for the gpios_mapped field by checking for

	if (int3472->gpios.list.next)

Up to you.

> +
> +	if (!IS_ERR_OR_NULL(int3472->regulator.rdev)) {
> +		gpiod_put(int3472->regulator.gpio);
> +		regulator_unregister(int3472->regulator.rdev);

You should call regulator_unregister(), in case unregistering the
regulator tries to turn it off.

> +	}
> +
> +	if (!IS_ERR_OR_NULL(int3472->clock.clk)) {
> +		gpiod_put(int3472->clock.gpio);
> +		clk_unregister(int3472->clock.clk);
> +		clkdev_drop(int3472->clock.cl);

Same here, gpiod_put() should go last.

> +	}
> +
> +	acpi_dev_put(int3472->sensor);
> +
> +	kfree(int3472->sensor_name);
> +	kfree(int3472);
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/x86/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel_skl_int3472_tps68470.c
> new file mode 100644
> index 000000000000..9bda65d34987
> --- /dev/null
> +++ b/drivers/platform/x86/intel_skl_int3472_tps68470.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/tps68470.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "intel_skl_int3472_common.h"
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
> +	dev_info(dev, "TPS68470 REVID: 0x%x\n", version);

0x%02x

> +
> +	return 0;
> +}
> +
> +static struct platform_device *
> +skl_int3472_register_pdev(const char *name, struct device *parent)
> +{
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
> +	if (IS_ERR_OR_NULL(pdev))
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdev->dev.parent = parent;
> +	pdev->driver_override = kstrndup(pdev->name, INT3472_PDEV_MAX_NAME_LEN,
> +					 GFP_KERNEL);
> +
> +	ret = platform_device_add(pdev);
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return pdev;
> +}
> +
> +int skl_int3472_tps68470_probe(struct i2c_client *client)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct platform_device *regulator_dev;
> +	struct platform_device *opregion_dev;
> +	struct platform_device *gpio_dev;
> +	struct int3472_cldb cldb = { 0 };
> +	struct platform_device *clk_dev;
> +	bool cldb_present = true;
> +	struct regmap *regmap;
> +	int ret = 0;
> +
> +	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&client->dev, "devm_regmap_init_i2c Error %ld\n",

s/Error/error/

I'd actually write "Failed to create regmap" or something similar.

> +			PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	i2c_set_clientdata(client, regmap);
> +
> +	ret = tps68470_chip_init(&client->dev, regmap);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "TPS68470 Init Error %d\n", ret);

s/Init Error/init error/

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
> +	 *	gotten to this point; crash and burn.

Crash is a bit hard, and that's not what you do below.

> +	 */
> +	ret = skl_int3472_get_cldb_buffer(adev, &cldb);
> +	if (!ret && cldb.control_logic_type != 2)

You should print an error message here (at least to catch an unsupported
control_logic_type value, skl_int3472_get_cldb_buffer() errors are
already logged in that function).

> +		return -EINVAL;
> +
> +	if (ret)
> +		cldb_present = false;
> +
> +	gpio_dev = skl_int3472_register_pdev("tps68470-gpio", &client->dev);
> +	if (IS_ERR(gpio_dev))
> +		return PTR_ERR(gpio_dev);
> +
> +	if (cldb_present) {
> +		clk_dev = skl_int3472_register_pdev("tps68470-clk",
> +						    &client->dev);
> +		if (IS_ERR(clk_dev)) {
> +			ret = PTR_ERR(clk_dev);
> +			goto err_free_gpio;
> +		}
> +
> +		regulator_dev = skl_int3472_register_pdev("tps68470-regulator",
> +							  &client->dev);
> +		if (IS_ERR(regulator_dev)) {
> +			ret = PTR_ERR(regulator_dev);
> +			goto err_free_clk;
> +		}
> +	} else {
> +		opregion_dev = skl_int3472_register_pdev("tps68470_pmic_opregion",
> +							 &client->dev);
> +		if (IS_ERR(opregion_dev)) {
> +			ret = PTR_ERR(opregion_dev);
> +			goto err_free_gpio;
> +		}
> +	}

I wonder if this could be simplified by using devm_mfd_add_devices. You
could have two arrays of mfd_cell, one for each case.

> +
> +	return 0;
> +
> +err_free_clk:
> +	platform_device_put(clk_dev);
> +err_free_gpio:
> +	platform_device_put(gpio_dev);
> +
> +	return ret;
> +}

-- 
Regards,

Laurent Pinchart
