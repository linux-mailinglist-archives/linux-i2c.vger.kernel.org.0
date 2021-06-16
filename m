Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CA63AA2BE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 19:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFPSAe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 14:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55505 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231463AbhFPSAe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Jun 2021 14:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623866307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=avqz9+BQoBLU1vmf8gdRIGxrTzjk8DR2AlYw9/7EZ/c=;
        b=GfOJxU97C6MeBe7zNE972Kt/dPGxOZF9ouy74Vnkya2PNbRKNkv2175upuhcbCddxacGIu
        FvGIJ5RvDj2tfuTKPqce7TjnRazw9daIPwBvBFRrnYRjjiwQml0+F4LbNzNBbD4ncNZLhZ
        GOynQSyKjzDbNf055TV7BqEXJw2xUbg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-4ev4YfmJPI2ccKA_s5PB_w-1; Wed, 16 Jun 2021 13:58:26 -0400
X-MC-Unique: 4ev4YfmJPI2ccKA_s5PB_w-1
Received: by mail-ej1-f70.google.com with SMTP id o6-20020a1709063586b0290454e77502aeso1270859ejb.12
        for <linux-i2c@vger.kernel.org>; Wed, 16 Jun 2021 10:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=avqz9+BQoBLU1vmf8gdRIGxrTzjk8DR2AlYw9/7EZ/c=;
        b=ddFbXbDIeZzFzkLzbJB4eHoVqzvdbAgPCNj0Z160oe99aNEIG2npKvjlgplFH4bzee
         ue9ygpVtsEWzsX4izn5lfBweU41QN9yyYiSdttfNLc5wnkrHmaJ1+T5pOADRVsydS1kN
         AEVpHqgqh4QiCmwmMKaIiqyVHYUV7eo/fA6ALKuP+CPVAQKLt8NE+psm7i0I3ZTMiy8x
         2aJcQdHIeiETu4+JGqvt3hiLVw587jSTK09osHyO668IUIbgECD1BDnALJfu61jiSRH0
         ChmyKSAsEHxfKYBtZowW03YF0e8WLaDldOM8J/4Z3mO4KvoMP7j6szeZ02WD8OPf9L6x
         hPnA==
X-Gm-Message-State: AOAM533va1hmgZXNW/9+LdSDenpmu1vhdZIcOl1qfiJMrH2iBtTh5uBW
        tBL/ARZwn1s76EPIwQZBG0W4GBr6FVQwrcAsyltGTNp11CcovcG/frpYHPoBhTXyk3rhNv8daxl
        Vo4G7hLOMq9AEpEtQ9mdQ
X-Received: by 2002:a05:6402:22fa:: with SMTP id dn26mr1128539edb.230.1623866304836;
        Wed, 16 Jun 2021 10:58:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLyfQroZWxGUCy66VOgGYzHWxjZlvfWemfDhD1QQgU4iGprjuaCEr2S4ocrPcVOTXDk7YawA==
X-Received: by 2002:a05:6402:22fa:: with SMTP id dn26mr1128502edb.230.1623866304445;
        Wed, 16 Jun 2021 10:58:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b14sm2001593ejk.120.2021.06.16.10.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:58:23 -0700 (PDT)
Subject: Re: [PATCH v5 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210603224007.120560-1-djrscally@gmail.com>
 <20210603224007.120560-6-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ea322abe-fa78-bbc3-b4c5-b372a4f28235@redhat.com>
Date:   Wed, 16 Jun 2021 19:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603224007.120560-6-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 6/4/21 12:40 AM, Daniel Scally wrote:
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

Thank you for your patch, I've applied this patch to my review-hans
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've fixed up the missing static marking of skl_int3472_tps68470_calc_type()
spotted by lkp@intel.com while applying the patch to my tree.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
> Changes since v4:
> 	- Some formatting and commenting tidy up
> 	- Cleared up some function exit paths to avoid gotos
> 	- Refactored skl_int3472_get_sensor_module_config() and also
> 	skl_int3472_tps68470_probe(), which involved adding a new function.
> 
> Andy - I didn't look at the reg-fixed-voltage suggestion yet, but I think I
> covered the rest of your suggestions from v4.
> 
>  MAINTAINERS                                   |   5 +
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-int3472/Kconfig    |  30 ++
>  drivers/platform/x86/intel-int3472/Makefile   |   5 +
>  .../intel_skl_int3472_clk_and_regulator.c     | 196 ++++++++
>  .../intel-int3472/intel_skl_int3472_common.c  | 106 +++++
>  .../intel-int3472/intel_skl_int3472_common.h  | 118 +++++
>  .../intel_skl_int3472_discrete.c              | 417 ++++++++++++++++++
>  .../intel_skl_int3472_tps68470.c              | 137 ++++++
>  10 files changed, 1017 insertions(+)
>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 008fcad7ac00..8dcc7e005ace 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9378,6 +9378,11 @@ S:	Maintained
>  F:	arch/x86/include/asm/intel_scu_ipc.h
>  F:	drivers/platform/x86/intel_scu_*
>  
> +INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
> +M:	Daniel Scally <djrscally@gmail.com>
> +S:	Maintained
> +F:	drivers/platform/x86/intel-int3472/
> +
>  INTEL SPEED SELECT TECHNOLOGY
>  M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2714f7c3843e..1263b8efcd50 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -697,6 +697,8 @@ config INTEL_CHT_INT33FE
>  	  device and CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m
>  	  for Type-C device.
>  
> +source "drivers/platform/x86/intel-int3472/Kconfig"
> +
>  config INTEL_HID_EVENT
>  	tristate "INTEL HID Event"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index dcc8cdb95b4d..c0612c02d037 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -76,6 +76,7 @@ obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
>  obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
>  obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
> +obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel-int3472/
>  obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
>  
>  # MSI
> diff --git a/drivers/platform/x86/intel-int3472/Kconfig b/drivers/platform/x86/intel-int3472/Kconfig
> new file mode 100644
> index 000000000000..c112878e833b
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/Kconfig
> @@ -0,0 +1,30 @@
> +config INTEL_SKL_INT3472
> +	tristate "Intel SkyLake ACPI INT3472 Driver"
> +	depends on ACPI
> +	depends on COMMON_CLK && CLKDEV_LOOKUP
> +	depends on I2C
> +	depends on GPIOLIB
> +	depends on REGULATOR
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  This driver adds power controller support for the Intel SkyCam
> +	  devices found on the Intel SkyLake platforms.
> +
> +	  The INT3472 is a camera power controller, a logical device found on
> +	  Intel Skylake-based systems that can map to different hardware
> +	  devices depending on the platform. On machines designed for Chrome OS
> +	  it maps to a TPS68470 camera PMIC. On machines designed for Windows,
> +	  it maps to either a TP68470 camera PMIC, a uP6641Q sensor PMIC, or a
> +	  set of discrete GPIOs and power gates.
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
> +	  The module will be named "intel-skl-int3472".
> diff --git a/drivers/platform/x86/intel-int3472/Makefile b/drivers/platform/x86/intel-int3472/Makefile
> new file mode 100644
> index 000000000000..48bd97f0a04e
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/Makefile
> @@ -0,0 +1,5 @@
> +obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
> +intel_skl_int3472-objs			:= intel_skl_int3472_common.o \
> +					   intel_skl_int3472_discrete.o \
> +					   intel_skl_int3472_tps68470.o \
> +					   intel_skl_int3472_clk_and_regulator.o
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
> new file mode 100644
> index 000000000000..ceee860e2c07
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/acpi.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/slab.h>
> +
> +#include "intel_skl_int3472_common.h"
> +
> +/*
> + * The regulators have to have .ops to be valid, but the only ops we actually
> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> + * empty struct to clear the check without lying about capabilities.
> + */
> +static const struct regulator_ops int3472_gpio_regulator_ops;
> +
> +static int skl_int3472_clk_prepare(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value_cansleep(clk->ena_gpio, 1);
> +	gpiod_set_value_cansleep(clk->led_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static void skl_int3472_clk_unprepare(struct clk_hw *hw)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	gpiod_set_value_cansleep(clk->ena_gpio, 0);
> +	gpiod_set_value_cansleep(clk->led_gpio, 0);
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
> +	unsigned int freq;
> +
> +	obj = skl_int3472_get_acpi_buffer(int3472->sensor, "SSDB");
> +	if (IS_ERR(obj))
> +		return 0; /* report rate as 0 on error */
> +
> +	if (obj->buffer.length < CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET + sizeof(u32)) {
> +		dev_err(int3472->dev, "The buffer is too small\n");
> +		kfree(obj);
> +		return 0;
> +	}
> +
> +	freq = *(u32 *)(obj->buffer.pointer + CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET);
> +
> +	kfree(obj);
> +	return freq;
> +}
> +
> +static unsigned long skl_int3472_clk_recalc_rate(struct clk_hw *hw,
> +						 unsigned long parent_rate)
> +{
> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> +
> +	return clk->frequency;
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
> +int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
> +{
> +	struct clk_init_data init = {
> +		.ops = &skl_int3472_clock_ops,
> +		.flags = CLK_GET_RATE_NOCACHE,
> +	};
> +	int ret;
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
> +	kfree(init.name);
> +	return 0;
> +
> +err_unregister_clk:
> +	clk_unregister(int3472->clock.clk);
> +out_free_init_name:
> +	kfree(init.name);
> +
> +	return ret;
> +}
> +
> +int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
> +				   struct acpi_resource *ares)
> +{
> +	char *path = ares->data.gpio.resource_source.string_ptr;
> +	const struct int3472_sensor_config *sensor_config;
> +	struct regulator_consumer_supply supply_map;
> +	struct regulator_init_data init_data = { };
> +	struct regulator_config cfg = { };
> +	int ret;
> +
> +	sensor_config = int3472->sensor_config;
> +	if (IS_ERR(sensor_config)) {
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
> +	supply_map = sensor_config->supply_map;
> +	supply_map.dev_name = int3472->sensor_name;
> +	init_data.consumer_supplies = &supply_map;
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
> +	int3472->regulator.gpio = acpi_get_and_request_gpiod(path,
> +							     ares->data.gpio.pin_table[0],
> +							     "int3472,regulator");
> +	if (IS_ERR(int3472->regulator.gpio)) {
> +		dev_err(int3472->dev, "Failed to get regulator GPIO line\n");
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
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
> new file mode 100644
> index 000000000000..497e74fba75f
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
> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
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
> +		acpi_handle_err(handle, "%s object is not an ACPI buffer\n", id);
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
> +	int ret;
> +
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
> +	ret = 0;
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
> +	int ret;
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
> index 000000000000..6fdf78584219
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
> @@ -0,0 +1,118 @@
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
> +/* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
> +#ifndef I2C_DEV_NAME_FORMAT
> +#define I2C_DEV_NAME_FORMAT					"i2c-%s"
> +#endif
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
> +struct acpi_device;
> +struct i2c_client;
> +struct platform_device;
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
> +	const char *documented;
> +	const char *actual;
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
> +	const struct int3472_sensor_config *sensor_config;
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
> +	unsigned int ngpios; /* how many GPIOs have we seen */
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
> +int skl_int3472_register_clock(struct int3472_discrete_device *int3472);
> +int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
> +				   struct acpi_resource *ares);
> +
> +#endif
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
> new file mode 100644
> index 000000000000..8c18dbff1c43
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Author: Dan Scally <djrscally@gmail.com> */
> +
> +#include <linux/acpi.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/uuid.h>
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
> +static const struct int3472_sensor_config int3472_sensor_configs[] = {
> +	/* Lenovo Miix 510-12ISK - OV2680, Front */
> +	{ "GNDF140809R", { 0 }, ov2680_gpio_function_remaps },
> +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
> +	/* Surface Go 1&2 - OV5693, Front */
> +	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
> +};
> +
> +static const struct int3472_sensor_config *
> +skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
> +{
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
> +
> +		ACPI_FREE(obj);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
> +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> +			    obj->string.pointer))
> +			break;
> +	}
> +
> +	ACPI_FREE(obj);
> +
> +	if (i >= ARRAY_SIZE(int3472_sensor_configs))
> +		return ERR_PTR(-EINVAL);
> +
> +	return &int3472_sensor_configs[i];
> +}
> +
> +static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int3472,
> +					  struct acpi_resource *ares,
> +					  const char *func, u32 polarity)
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
> +	if (!IS_ERR(sensor_config) && sensor_config->function_maps) {
> +		const struct int3472_gpio_function_remap *remap;
> +
> +		for (remap = sensor_config->function_maps; remap->documented; remap++) {
> +			if (!strcmp(func, remap->documented)) {
> +				func = remap->actual;
> +				break;
> +			}
> +		}
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
> +		gpio = acpi_get_and_request_gpiod(path, ares->data.gpio.pin_table[0],
> +						  "int3472,clk-enable");
> +		if (IS_ERR(gpio))
> +			return (PTR_ERR(gpio));
> +
> +		int3472->clock.ena_gpio = gpio;
> +		break;
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		gpio = acpi_get_and_request_gpiod(path, ares->data.gpio.pin_table[0],
> +						  "int3472,privacy-led");
> +		if (IS_ERR(gpio))
> +			return (PTR_ERR(gpio));
> +
> +		int3472->clock.led_gpio = gpio;
> +		break;
> +	default:
> +		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);
> +		break;
> +	}
> +
> +	return 0;
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
> + * * 1		- To continue the loop
> + * * 0		- When all resources found are handled properly.
> + * * -EINVAL	- If the resource is not a GPIO IO resource
> + * * -ENODEV	- If the resource has no corresponding _DSM entry
> + * * -Other	- Errors propagated from one of the sub-functions.
> + */
> +static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> +					     void *data)
> +{
> +	struct int3472_discrete_device *int3472 = data;
> +	struct acpi_resource_gpio *agpio;
> +	union acpi_object *obj;
> +	const char *err_msg;
> +	int ret;
> +	u8 type;
> +
> +	if (!acpi_gpio_get_io_resource(ares, &agpio))
> +		return 1;
> +
> +	/*
> +	 * ngpios + 2 because the index of this _DSM function is 1-based and
> +	 * the first function is just a count.
> +	 */
> +	obj = acpi_evaluate_dsm_typed(int3472->adev->handle,
> +				      &int3472_gpio_guid, 0x00,
> +				      int3472->ngpios + 2,
> +				      NULL, ACPI_TYPE_INTEGER);
> +
> +	if (!obj) {
> +		dev_warn(int3472->dev, "No _DSM entry for GPIO pin %u\n",
> +			 ares->data.gpio.pin_table[0]);
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
> +	int3472->ngpios++;
> +	ACPI_FREE(obj);
> +
> +	if (ret)
> +		return dev_err_probe(int3472->dev, ret, err_msg);
> +
> +	return 0;
> +}
> +
> +static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
> +{
> +	LIST_HEAD(resource_list);
> +	int ret;
> +
> +	/*
> +	 * No error check, because not having a sensor config is not necessarily
> +	 * a failure mode.
> +	 */
> +	int3472->sensor_config = skl_int3472_get_sensor_module_config(int3472);
> +
> +	ret = acpi_dev_get_resources(int3472->adev, &resource_list,
> +				     skl_int3472_handle_gpio_resources,
> +				     int3472);
> +	if (ret)
> +		goto out_free_res_list;
> +
> +	/*
> +	 * If we find no clock enable GPIO pin then the privacy LED won't work.
> +	 * We've never seen that situation, but it's possible. Warn the user so
> +	 * it's clear what's happened.
> +	 */
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
> +	int3472 = devm_kzalloc(&pdev->dev, struct_size(int3472, gpios.table,
> +			       INT3472_MAX_SENSOR_GPIOS + 1), GFP_KERNEL);
> +	if (!int3472)
> +		return -ENOMEM;
> +
> +	int3472->adev = adev;
> +	int3472->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, int3472);
> +
> +	int3472->sensor = acpi_dev_get_first_consumer_dev(adev);
> +	if (!int3472->sensor) {
> +		dev_err(&pdev->dev, "INT3472 seems to have no dependents.\n");
> +		return -ENODEV;
> +	}
> +
> +	int3472->sensor_name = devm_kasprintf(int3472->dev, GFP_KERNEL,
> +					      I2C_DEV_NAME_FORMAT,
> +					      acpi_dev_name(int3472->sensor));
> +	if (!int3472->sensor_name) {
> +		ret = -ENOMEM;
> +		goto err_put_sensor;
> +	}
> +
> +	/*
> +	 * Initialising this list means we can call gpiod_remove_lookup_table()
> +	 * in failure paths without issue.
> +	 */
> +	INIT_LIST_HEAD(&int3472->gpios.list);
> +
> +	ret = skl_int3472_parse_crs(int3472);
> +	if (ret) {
> +		skl_int3472_discrete_remove(pdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_put_sensor:
> +	acpi_dev_put(int3472->sensor);
> +
> +	return ret;
> +}
> +
> +int skl_int3472_discrete_remove(struct platform_device *pdev)
> +{
> +	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
> +
> +	gpiod_remove_lookup_table(&int3472->gpios);
> +	regulator_unregister(int3472->regulator.rdev);
> +	clk_unregister(int3472->clock.clk);
> +
> +	if (int3472->clock.cl)
> +		clkdev_drop(int3472->clock.cl);
> +
> +	gpiod_put(int3472->regulator.gpio);
> +	gpiod_put(int3472->clock.ena_gpio);
> +	gpiod_put(int3472->clock.led_gpio);
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> new file mode 100644
> index 000000000000..6306ba24e0bc
> --- /dev/null
> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> @@ -0,0 +1,137 @@
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
> +#define DESIGNED_FOR_CHROMEOS		1
> +#define DESIGNED_FOR_WINDOWS		2
> +
> +static const struct mfd_cell tps68470_cros[] = {
> +	{ .name = "tps68470-gpio" },
> +	{ .name = "tps68470_pmic_opregion" },
> +};
> +
> +static const struct mfd_cell tps68470_win[] = {
> +	{ .name = "tps68470-gpio" },
> +	{ .name = "tps68470-clk" },
> +	{ .name = "tps68470-regulator" },
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
> +/** skl_int3472_tps68470_calc_type: Check what platform a device is designed for
> + * @adev: A pointer to a &struct acpi_device
> + *
> + * Check CLDB buffer against the PMIC's adev. If present, then we check
> + * the value of control_logic_type field and follow one of the
> + * following scenarios:
> + *
> + *	1. No CLDB - likely ACPI tables designed for ChromeOS. We
> + *	create platform devices for the GPIOs and OpRegion drivers.
> + *
> + *	2. CLDB, with control_logic_type = 2 - probably ACPI tables
> + *	made for Windows 2-in-1 platforms. Register pdevs for GPIO,
> + *	Clock and Regulator drivers to bind to.
> + *
> + *	3. Any other value in control_logic_type, we should never have
> + *	gotten to this point; fail probe and return.
> + *
> + * Return:
> + * * 1		Device intended for ChromeOS
> + * * 2		Device intended for Windows
> + * * -EINVAL	Where @adev has an object named CLDB but it does not conform to
> + *		our expectations
> + */
> +int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
> +{
> +	struct int3472_cldb cldb = { 0 };
> +	int ret;
> +
> +	/*
> +	 * A CLDB buffer that exists, but which does not match our expectations
> +	 * should trigger an error so we don't blindly continue.
> +	 */
> +	ret = skl_int3472_fill_cldb(adev, &cldb);
> +	if (ret && ret != -ENODEV)
> +		return ret;
> +
> +	if (ret)
> +		return DESIGNED_FOR_CHROMEOS;
> +
> +	if (cldb.control_logic_type != 2)
> +		return -EINVAL;
> +
> +	return DESIGNED_FOR_WINDOWS;
> +}
> +
> +int skl_int3472_tps68470_probe(struct i2c_client *client)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
> +	struct regmap *regmap;
> +	int device_type;
> +	int ret;
> +
> +	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
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
> +	device_type = skl_int3472_tps68470_calc_type(adev);
> +	switch (device_type) {
> +	case DESIGNED_FOR_WINDOWS:
> +		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					   tps68470_win, ARRAY_SIZE(tps68470_win),
> +					   NULL, 0, NULL);
> +		break;
> +	case DESIGNED_FOR_CHROMEOS:
> +		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
> +					   NULL, 0, NULL);
> +		break;
> +	default:
> +		dev_err(&client->dev, "Failed to add MFD devices\n");
> +		return device_type;
> +	}
> +
> +	return ret;
> +}
> 

