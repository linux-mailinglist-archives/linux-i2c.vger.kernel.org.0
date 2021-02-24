Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438A2323A46
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 11:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234822AbhBXKPJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 05:15:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbhBXKOw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Feb 2021 05:14:52 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 563F08A1;
        Wed, 24 Feb 2021 11:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614161627;
        bh=BM8lOGuRvoLTKyEJ7u9bZfJwft8BAQN1ZTU/JoK82Y4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dY6wVGSDtsePY5LZgV4p+1Ii6l/pNQaRuF9lxnQfZML3TAxm+F6qX3MvgsjIGU92d
         NdjsSsLQZjhPvMig+iEtD5LwMySQxAICQ5H/YW5gcRRWYx2lSpB/YwVBGVPHWoyTgH
         7Ir1ve4d3WyeOGiKQ3osP7qjf4jek+4gMU3pm0pQ=
Date:   Wed, 24 Feb 2021 12:13:19 +0200
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
Message-ID: <YDYmv0PpSndAlnDC@pendragon.ideasonboard.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
 <YDVfyt2d2Nhsa7l3@pendragon.ideasonboard.com>
 <1360fc85-3f39-1dce-eee9-c4e76c2087ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1360fc85-3f39-1dce-eee9-c4e76c2087ae@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On Tue, Feb 23, 2021 at 10:36:18PM +0000, Daniel Scally wrote:
> On 23/02/2021 20:04, Laurent Pinchart wrote:
> >> +
> >> +/*
> >> + * Here follows platform specific mapping information that we can pass to
> >> + * the functions mapping resources to the sensors. Where the sensors have
> >> + * a power enable pin defined in DSDT we need to provide a supply name so
> >> + * the sensor drivers can find the regulator. The device name will be derived
> >> + * from the sensor's ACPI device within the code. Optionally, we can provide a
> >> + * NULL terminated array of function name mappings to deal with any platform
> >> + * specific deviations from the documented behaviour of GPIOs.
> >> + *
> >> + * Map a GPIO function name to NULL to prevent the driver from mapping that
> >> + * GPIO at all.
> >> + */
> >> +
> >> +static const struct int3472_gpio_function_remap ov2680_gpio_function_remaps[] = {
> >> +	{ "reset", NULL },
> >> +	{ "powerdown", "reset" },
> >> +	{ }
> >> +};
> >> +
> >> +static struct int3472_sensor_config int3472_sensor_configs[] = {
> >
> > This should be static const (and there will be some fallout due to that,
> > as skl_int3472_register_regulator() modifies the supply_map, so I think
> > you'll have a copy of supply_map in int3472_discrete_device).
> 
> Ack to all of the constness; you mentioned that last time too - not sure
> how I missed doing those! I think I can just having a local struct
> regulator_consumer_supply in skl_int3472_register_regulator and fill it
> from int3472->sensor_config.supply_map
> 
> >> +static unsigned int skl_int3472_get_clk_frequency(struct int3472_discrete_device *int3472)
> >> +{
> >> +	union acpi_object *obj;
> >> +	unsigned int ret = 0;
> >> +
> >> +	obj = skl_int3472_get_acpi_buffer(int3472->sensor, "SSDB");
> >> +	if (IS_ERR(obj))
> >> +		return 0; /* report rate as 0 on error */
> >> +
> >> +	if (obj->buffer.length < CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET + sizeof(u32)) {
> >
> > Should we define an ssdb structure instead of peeking into the buffer
> > with an offset ?
> 
> I thought about that, but in the end decided it didn't seem worth
> defining the whole SSDB structure just to use one field. Particularly
> since we use it in cio2-bridge already, so if we're going to do that it
> really ought to just live in a header that's included in both - and that
> seemed even less worthwhile.
> 
> I don't have a strong feeling though, so if you think it's better to
> define the struct I'm happy to.

If the structure is available already, sharing it in a common header
would be best I think, but that's not a blocker. It can be done on top
of this series.

> >> +static unsigned long skl_int3472_clk_recalc_rate(struct clk_hw *hw,
> >> +						 unsigned long parent_rate)
> >> +{
> >> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> >> +	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
> >> +
> >> +	return int3472->clock.frequency;
> >
> > Maybe just
> >
> > 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> >
> > 	return clk->frequency;
> 
> Oops, of course.
> 
> >> +static int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
> >> +					  struct acpi_resource *ares)
> >> +{
> >> +	char *path = ares->data.gpio.resource_source.string_ptr;
> >> +	struct int3472_sensor_config *sensor_config;
> >> +	struct regulator_init_data init_data = { };
> >> +	struct regulator_config cfg = { };
> >> +	int ret;
> >> +
> >> +	sensor_config = int3472->sensor_config;
> >> +	if (IS_ERR_OR_NULL(sensor_config)) {
> >> +		dev_err(int3472->dev, "No sensor module config\n");
> >> +		return PTR_ERR(sensor_config);
> >> +	}
> >> +
> >> +	if (!sensor_config->supply_map.supply) {
> >> +		dev_err(int3472->dev, "No supply name defined\n");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> >> +	init_data.num_consumer_supplies = 1;
> >> +	sensor_config->supply_map.dev_name = int3472->sensor_name;
> >> +	init_data.consumer_supplies = &sensor_config->supply_map;
> >> +
> >> +	snprintf(int3472->regulator.regulator_name,
> >> +		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
> >> +		 acpi_dev_name(int3472->adev));
> >> +	snprintf(int3472->regulator.supply_name,
> >> +		 GPIO_REGULATOR_SUPPLY_NAME_LENGTH, "supply-0");
> >> +
> >> +	int3472->regulator.rdesc = INT3472_REGULATOR(
> >> +						int3472->regulator.regulator_name,
> >> +						int3472->regulator.supply_name,
> >> +						&int3472_gpio_regulator_ops);
> >> +
> >> +	int3472->regulator.gpio = acpi_get_gpiod(path,
> >> +						 ares->data.gpio.pin_table[0],
> >> +						 "int3472,regulator");
> >> +	if (IS_ERR(int3472->regulator.gpio)) {
> >> +		dev_err(int3472->dev, "Failed to get regulator GPIO lines\n");
> >
> > s/lines/line/ (sorry, it was a typo in my review of v2)
> 
> No problem!
> 
> >> +static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
> >> +{
> >> +	struct list_head resource_list;
> >> +	int ret;
> >> +
> >> +	INIT_LIST_HEAD(&resource_list);
> >> +
> >> +	int3472->sensor_config = skl_int3472_get_sensor_module_config(int3472);
> >
> > I have forgotten some of the context I'm afraid :-/ Are there valid use
> > cases for not checking for an error here, or should we do so and drop
> > the error checks in other functions above ?
> 
> Not all platforms need a sensor_config; only those which have either a
> regulator pin or need a GPIO function to be remapped; the rest will do
> without it.
> 
> So, we need to not check for an error here because the absence of a
> sensor_config isn't necessarily an error, we won't know till later.
> 
> >> +int skl_int3472_discrete_probe(struct platform_device *pdev)
> >> +{
> >> +	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> >> +	struct int3472_discrete_device *int3472;
> >> +	struct int3472_cldb cldb;
> >> +	int ret;
> >> +
> >> +	ret = skl_int3472_fill_cldb(adev, &cldb);
> >> +	if (ret) {
> >> +		dev_err(&pdev->dev, "Couldn't fill CLDB structure\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (cldb.control_logic_type != 1) {
> >> +		dev_err(&pdev->dev, "Unsupported control logic type %u\n",
> >> +			cldb.control_logic_type);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	/* Max num GPIOs we've seen plus a terminator */
> >> +	int3472 = kzalloc(struct_size(int3472, gpios.table,
> >> +			  INT3472_MAX_SENSOR_GPIOS + 1), GFP_KERNEL);
> >> +	if (!int3472)
> >> +		return -ENOMEM;
> >> +
> >> +	int3472->adev = adev;
> >> +	int3472->dev = &pdev->dev;
> >> +	platform_set_drvdata(pdev, int3472);
> >> +
> >> +	int3472->sensor = acpi_dev_get_dependent_dev(adev);
> >> +	if (IS_ERR_OR_NULL(int3472->sensor)) {
> >> +		dev_err(&pdev->dev,
> >> +			"INT3472 seems to have no dependents.\n");
> >> +		ret = -ENODEV;
> >> +		goto err_free_int3472;
> >> +	}
> >> +	get_device(&int3472->sensor->dev);
> >
> > I see no corresponding put_device(), am I missing something ? I'm also
> > not sure why this is needed.
> 
> The put is acpi_dev_put() in skl_int3472_discrete_remove(); there seems
> to be no acpi_dev_get() for some reason. We use the sensor acpi_device
> to get the clock frequency, and to fetch the sensor module string, so I
> thought it ought to hold a reference on those grounds.

Shouldn't acpi_dev_get_dependent_dev() increase the reference count
then, instead of doing it manually here ?

> >> diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> >> new file mode 100644
> >> index 000000000000..d0d2391e263f
> >> --- /dev/null
> >> +++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> >> @@ -0,0 +1,113 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/* Author: Dan Scally <djrscally@gmail.com> */
> >> +
> >> +#include <linux/i2c.h>
> >> +#include <linux/mfd/core.h>
> >> +#include <linux/mfd/tps68470.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/regmap.h>
> >> +
> >> +#include "intel_skl_int3472_common.h"
> >> +
> >> +static const struct mfd_cell tps68470_c[] = {
> >> +	{ .name = "tps68470-gpio" },
> >> +	{ .name = "tps68470_pmic_opregion" },
> >> +};
> >> +
> >> +static const struct mfd_cell tps68470_w[] = {
> >
> > Maybe more explicit names than _c and _w could be nice ?
> 
> _chrome and _windows was in my mind - sound ok?

As Andy mentioned, _cros is better, and _windows_ or _win both work for
me.

-- 
Regards,

Laurent Pinchart
