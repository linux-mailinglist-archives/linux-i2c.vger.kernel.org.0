Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9704A2FB994
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbhASOdm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:33:42 -0500
Received: from mga14.intel.com ([192.55.52.115]:53291 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732905AbhASJ0I (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 04:26:08 -0500
IronPort-SDR: yzdCDtBwq/+mi8eOFSqsfskx3ZG6xw11n0a36+IuoO3KYTadCogrNbpyFfFtSBjGFvKkH4xhdB
 3G8yRoIxvY8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="178121666"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="178121666"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 01:23:53 -0800
IronPort-SDR: fYt+TwSxnqP24B6kl7d2nh0cJr09mHy0C1J1P/Qytt9UO+g+k4EOGUs6oJi25/lwBBzKbgw85E
 ZQrfueVFWWzQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="350454613"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 01:23:46 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1nFo-003L1D-9R; Tue, 19 Jan 2021 11:24:48 +0200
Date:   Tue, 19 Jan 2021 11:24:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <20210119092448.GN4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 09:19:52PM +0000, Daniel Scally wrote:
> On 18/01/2021 14:46, Andy Shevchenko wrote:
> > On Mon, Jan 18, 2021 at 11:15:21AM +0200, Laurent Pinchart wrote:
> >> On Mon, Jan 18, 2021 at 12:34:27AM +0000, Daniel Scally wrote:

...

> >>> +static struct i2c_driver int3472_tps68470 = {
> >>> +	.driver = {
> >>> +		.name = "int3472-tps68470",
> >>> +		.acpi_match_table = int3472_device_id,
> >>> +	},
> >>> +	.probe_new = skl_int3472_tps68470_probe,
> >>> +};
> > I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
> > be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
> > via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
> 
> Sorry, I'm a bit confused by this. The i2c device is already
> present...we just want the driver to bind to them, so what role do those
> functions have there?

What I meant is something like

 *_i2c.c
	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
	involved (and it sounds like it should be mfd/tps one, in which you
	just cut out ACPI IDs and convert to pure I²C one, that what I had
	suggested in the first place)

 *_proxy.c
	GPIO proxy as library

 *.c
	platform driver with ACPI ID, in which ->probe() we actually instantiate
	above via calling i2c_acpi_new_device(), *if needed*, along with GPIO
	proxy

...

> >>> +struct int3472_gpio_clock {
> >>> +	struct clk *clk;
> >>> +	struct clk_hw clk_hw;
> >>> +	struct clk_lookup *cl;
> >>> +	struct gpio_desc *gpio;
> >>> +};

> >>> +static const struct clk_ops skl_int3472_clock_ops = {
> >>> +	.prepare = skl_int3472_clk_prepare,
> >>> +	.unprepare = skl_int3472_clk_unprepare,
> >>> +	.enable = skl_int3472_clk_enable,
> >>> +	.disable = skl_int3472_clk_disable,
> >>> +};

> > Wondering if this has some similarities with and actually can utilize clk-gpio
> > driver.
> > Yeah, sounds like reinventing clk-gpio.c.
> >
> > static const struct clk_ops clk_gpio_gate_ops = {
> > 	.enable = clk_gpio_gate_enable,
> > 	.disable = clk_gpio_gate_disable,
> > 	.is_enabled = clk_gpio_gate_is_enabled,
> > };
> >
> > Or is it mux? It has support there as well.
> >
> Hmm, yeah, this looks like it would work actually. So I think I'd need to:
> 
> 
> 1. Make enabling INTEL_SKL_INT3472 also enable the clk-gpio driver
> 
> 2. Register a platform device to bind to the clk-gpio driver
> 
> 3. Register a gpio lookup table so that the clk-gpio driver can find the
> gpio in question using gpiod_get()
> 
> And that looks like it will work; I'll try it.

You need to modify clk-gpio.c to export

clk_hw_register_gpio_gate()
clk_hw_register_gpio_mux()

(perhaps it will require to add *_unregister() counterparts) and call it from
your code.

See, for example, how clk_hw_unregister_fixed_rate() is being used. Another
case is to add a helper directly into clk-gpio and call it instead of
clk_hw_*() one, see how clk_register_fractional_divider() is implemented and
used.

...

> >>> +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> >>> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", "i2c-OVTI5648:00"), NULL},
> >>> +	/* Surface Go 1&2 - OV5693, Front */
> >>> +	{ "YHCU", REGULATOR_SUPPLY("avdd", "i2c-INT33BE:00"), NULL},
> > I'm wondering if you should use same I2C format macro and create this
> > dynamically? Or rather find a corresponding ACPI device instance and
> > copy it's name? ...
> 
> The supply name needs hard-coding really, but the device name I suppose
> can come from int3472->sensor_name.

To be strict in terms you are using "device instance name" in the
REGULATOR_SUPPLY() second parameter. Because "device name" is generic and
doesn't point to the actual *instance* of the device in the system.

So, and "device name instance" we may get only by traversing through the (ACPI)
bus and find corresponding struct device and derive name from it. Same way like
you have done in previous patch series.

Because there is no guarantee that, e.g., i2c-INT33BE:00 will be present on
the system and moreover there is no guarantee that if two INT33BE or more
devices are present you will get :00 always for the one you need!

...

> >>> +	ret = ERR_PTR(-ENODEV);
> > This seems redundant. Or are you expecting ARRAY_SIZE() to be 0?
> > If no, you may add static_assert() near to the array definition.
> 
> It **could** become 0, if the entries I've added are removed in future
> because the sensors are no longer supported or something. There might be
> no sensor_module_config for a given device. We only need to supply one if
> 
> a) The platform has a 0x0b type GPIO, which means we need to define a
> supply name the driver is expecting
> 
> b) The GPIO functions deviate from documented purpose, which means we
> need to supply a remapping struct
> 
> Otherwise, there's no need for it.

I see. So, up to you then.

> 
> 
> >>> +
> >>> +	int3472->regulator.rdev = regulator_register(&int3472->regulator.rdesc,
> >>> +						     &cfg);
> >>> +	if (IS_ERR(int3472->regulator.rdev)) {
> >>> +		ret = PTR_ERR(int3472->regulator.rdev);
> >>> +		goto err_free_gpio;
> >>> +	}
> > Similar here, can we utilize gpio-regulator.c?
> >
> 
> Also yes probably, with the same steps as for the clocks. Again, I'll
> try that out, thanks very much.

You may look at arch/x86/platform/intel-mid/device_libs/platform_bcm43xx.c
(but in your case you probably don't need a GPIO lookup table, just check).

...

> >>> +		dev_warn(&int3472->pdev->dev,
> >>> +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
> >>> +			 (obj->integer.value & 0xff));
> >> No need for parentheses.
> > And instead of "%llx" with " & 0xff" you may use "%x" with "(u8)" cast.
> > However, I don't think we need to show only last byte, because it may give
> > wrong impression on values like "0x100".
> 
> But in this case only the last byte holds the type information, second
> lowest byte is the pin number. So as we understand it, 0x100 would be
> invalid anyway.

Ah, indeed. So, I think the best is to have %hhx and see if you can supply just
obj->integer.value and compiler won't warn about type mismatch.

...

> >>> +	} else {
> >>> +		opregion_dev = skl_int3472_register_pdev("tps68470_pmic_opregion",
> >>> +							 &client->dev);
> >>> +		if (IS_ERR(opregion_dev)) {
> >>> +			ret = PTR_ERR(opregion_dev);
> >>> +			goto err_free_gpio;
> >>> +		}
> >>> +	}
> >> I wonder if this could be simplified by using devm_mfd_add_devices. You
> >> could have two arrays of mfd_cell, one for each case.
> > Yeah, which effectively means that we should have some kind of mfd/tps68470 in
> > place.
> 
> Can you expand on what you mean by that a little, please?

The very first comment in this reply should hopefully shed a light on my idea.

-- 
With Best Regards,
Andy Shevchenko


