Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D742FC3B9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389436AbhASOgk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbhASK5G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 05:57:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AD3C061573;
        Tue, 19 Jan 2021 02:56:24 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50F7F9E6;
        Tue, 19 Jan 2021 11:56:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611053781;
        bh=uf14iafEYPksUSXGchF+zzD8qWJ/KcOPoO1dI4e9Vmo=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IAaFO3VHnIQZ6VAMPGgAV8bjvrGEPz/+pTJC0xaWxnU7zzaAalIOuINj8SyMSHS/4
         SjPg+Ncctm/JjTKQGCg9C32IZB0ydZqk3AuD9xCPbX2S0hlWdnk9Tl6ex5Xheraxqk
         ngCOGEs8+YYyIvW3E8XCYUB9UQ8MOr3uehKFUIeo=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <2d8d7072-3b6f-4ffa-29dc-51f31fe4af72@ideasonboard.com>
Date:   Tue, 19 Jan 2021 10:56:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118003428.568892-7-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On 18/01/2021 00:34, Daniel Scally wrote:
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

I've tried compiling this as a built in and a module and on my minimal
config I had failures on both for regulator_register and
regulator_unregister.

I suspect this needs to have either a selects or a depends upon
CONFIG_REGULATOR

--
Regards

Kieran


> +	help
> +	  This driver adds support for the INT3472 ACPI devices found on some
> +	  Intel SkyLake devices.
> +
> +	  There are 3 kinds of INT3472 ACPI device possible; two for devices
> +	  designed for Windows (either with or without a physical tps68470
> +	  PMIC) and one designed for Chrome OS. This driver handles all three
> +	  situations by discovering information it needs to discern them at
> +	  runtime.
> +
> +	  If your device was designed for Chrome OS, this driver will provide
> +	  an ACPI operation region, which must be available before any of the
> +	  devices using this are probed. For this reason, you should select Y
> +	  if your device was designed for ChromeOS. This option also configures
> +	  the designware-i2c driver to be built-in, for the same reason.
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
> +#include <linux/regulator/machine.h>
> +#include <linux/clk-provider.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/types.h>
> +
> +/* PMIC GPIO Types */
> +#define INT3472_GPIO_TYPE_RESET					0x00
> +#define INT3472_GPIO_TYPE_POWERDOWN				0x01
> +#define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> +#define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
> +#define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_PDEV_MAX_NAME_LEN				23
> +#define INT3472_MAX_SENSOR_GPIOS				3
> +#define GPIO_REGULATOR_NAME_LENGTH				27
> +#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
> +
> +#define INT3472_REGULATOR(_NAME, _SUPPLY, _OPS)			\
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
> +	struct acpi_device *adev;
> +	struct platform_device *pdev;
> +	struct acpi_device *sensor;
> +	char *sensor_name;
> +
> +	unsigned int n_gpios; /* how many GPIOs have we seen */
> +
> +	struct int3472_gpio_regulator regulator;
> +	struct int3472_gpio_clock clock;
> +
> +	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
> +	bool gpios_mapped;
> +	struct gpiod_lookup_table gpios;
> +};
> +
> +struct int3472_gpio_function_remap {
> +	char *documented;
> +	char *actual;
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
> +	INT3472_GPIO_FUNCTION_REMAP("powerdown", "reset"),
> +	{ }
> +};
> +
> +static struct int3472_sensor_config int3472_sensor_configs[] = {
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
> +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> +			    obj->string.pointer)) {
> +			ret = &int3472_sensor_configs[i];
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
> +
> +		while (sensor_config->function_maps[i].documented) {
> +			if (!strcmp(func, sensor_config->function_maps[i].documented)) {
> +				func = sensor_config->function_maps[i].actual;
> +
> +				break;
> +			}
> +
> +			i++;
> +		}
> +	}
> +
> +	if (!func)
> +		return 0;
> +
> +	if (int3472->n_sensor_gpios >= INT3472_MAX_SENSOR_GPIOS) {
> +		dev_warn(&int3472->pdev->dev, "Too many GPIOs mapped\n");
> +		return -EINVAL;
> +	}
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
> +
> +	memcpy(&int3472->gpios.table[int3472->n_sensor_gpios], &table_entry,
> +	       sizeof(table_entry));
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
> +	struct clk_init_data init = { };
> +	int ret = 0;
> +
> +	init.name = kasprintf(GFP_KERNEL, "%s-clk",
> +			      acpi_dev_name(int3472->adev));
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
> +		goto err_unregister_clk;
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
> +	struct int3472_sensor_config *sensor_config;
> +	struct regulator_init_data init_data = { };
> +	struct regulator_config cfg = { };
> +	int ret;
> +
> +	sensor_config = skl_int3472_get_sensor_module_config(int3472);
> +	if (IS_ERR_OR_NULL(sensor_config)) {
> +		dev_err(&int3472->pdev->dev, "No sensor module config\n");
> +		return PTR_ERR(sensor_config);
> +	}
> +
> +	if (!sensor_config->supply_map.supply) {
> +		dev_err(&int3472->pdev->dev, "No supply name defined\n");
> +		return -ENODEV;
> +	}
> +
> +	init_data.supply_regulator = NULL;
> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> +	init_data.num_consumer_supplies = 1;
> +	init_data.consumer_supplies = &sensor_config->supply_map;
> +
> +	snprintf(int3472->regulator.regulator_name,
> +		 GPIO_REGULATOR_NAME_LENGTH, "int3472-discrete-regulator");
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
> +		return ENODEV;
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
> +		if (ret)
> +			dev_err(&int3472->pdev->dev,
> +				"Failed to map indicator led to sensor\n");
> +
> +		break;
> +	default:
> +		dev_warn(&int3472->pdev->dev,
> +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
> +			 (obj->integer.value & 0xff));
> +		ret = EINVAL;
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
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret = acpi_dev_get_resources(int3472->adev, &resource_list,
> +				     skl_int3472_handle_gpio_resources,
> +				     int3472);
> +
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
> +
> +	ret = skl_int3472_get_cldb_buffer(adev, &cldb);
> +	if (ret || cldb.control_logic_type != 1)
> +		return -EINVAL;
> +
> +	int3472 = kzalloc(sizeof(*int3472) +
> +			 ((INT3472_MAX_SENSOR_GPIOS + 1) * sizeof(struct gpiod_lookup)),
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
> +
> +	if (int3472->gpios_mapped)
> +		gpiod_remove_lookup_table(&int3472->gpios);
> +
> +	if (!IS_ERR_OR_NULL(int3472->regulator.rdev)) {
> +		gpiod_put(int3472->regulator.gpio);
> +		regulator_unregister(int3472->regulator.rdev);
> +	}
> +
> +	if (!IS_ERR_OR_NULL(int3472->clock.clk)) {
> +		gpiod_put(int3472->clock.gpio);
> +		clk_unregister(int3472->clock.clk);
> +		clkdev_drop(int3472->clock.cl);
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
> +			PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	i2c_set_clientdata(client, regmap);
> +
> +	ret = tps68470_chip_init(&client->dev, regmap);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "TPS68470 Init Error %d\n", ret);
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
> +	 */
> +	ret = skl_int3472_get_cldb_buffer(adev, &cldb);
> +	if (!ret && cldb.control_logic_type != 2)
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
> 

-- 
Regards
--
Kieran
