Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40C22FBC96
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 17:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbhASQfE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 11:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731595AbhASQeZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 11:34:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4057C061574;
        Tue, 19 Jan 2021 08:33:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 853F7813;
        Tue, 19 Jan 2021 17:33:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611074013;
        bh=0B7P8MsR9D9MbQfwELgHPTeRtHX0Rhx93OBpaDFklfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uqiC9P1DqdnyTeA6XFHF6B/VsYEeu9GRwZDHzIpxq2OPxeG5wxyf7nR3htU+7Nz72
         w9sk738aK2inNd4XCTKYqF+XvopQoaKIMw8M/c374FsZdUr29r8yrmfVbXQkvgUlN/
         T1HW3ZFotqfrEFy/cOC2u2wZXqRaf/tvhGqK86QY=
Date:   Tue, 19 Jan 2021 18:33:16 +0200
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
Message-ID: <YAcJzHQkDHK6K2iV@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <3872041c-1a4a-2508-d325-80242598d55e@gmail.com>
 <YAZ5648kEmCuobdj@pendragon.ideasonboard.com>
 <c76be8f9-1e58-8ea2-4a2e-61ac9865d326@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c76be8f9-1e58-8ea2-4a2e-61ac9865d326@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On Tue, Jan 19, 2021 at 08:43:43AM +0000, Daniel Scally wrote:
> On 19/01/2021 06:19, Laurent Pinchart wrote:
> > On Mon, Jan 18, 2021 at 08:46:34PM +0000, Daniel Scally wrote:
> >> Hi Laurent, thanks for the comments - really appreciate the detail.
> >>
> >> Some specific responses below but assume a general "will do" to
> >> everything you mentioned otherwise...
> >>
> >> On 18/01/2021 09:15, Laurent Pinchart wrote:
> >>>> +	  PMIC) and one designed for Chrome OS.
> >>> How about expanding this a bit to explain what the INT3472 stands for ?
> >>>
> >>> 	  The INT3472 is an Intel camera power controller, a logical device
> >>> 	  found on some Skylake-based systems that can map to different
> >>> 	  hardware devices depending on the platform. On machines
> >>> 	  designed for Chrome OS, it maps to a TPS68470 camera PMIC. On
> >>> 	  machines designed for Windows, it maps to either a TP68470
> >>> 	  camera PMIC, a uP6641Q sensor PMIC, or a set of discrete GPIOs
> >>> 	  and power gates.
> >> Yeah sure ok
> >>
> >>>> This driver handles all three
> >>>> +	  situations by discovering information it needs to discern them at
> >>>> +	  runtime.
> >>>> +
> >>>> +	  If your device was designed for Chrome OS, this driver will provide
> >>>> +	  an ACPI operation region, which must be available before any of the
> >>>> +	  devices using this are probed. For this reason, you should select Y
> >>>> +	  if your device was designed for ChromeOS. This option also configures
> >>>> +	  the designware-i2c driver to be built-in, for the same reason.
> >>> Is the last sentence a leftover ?
> >> Oops - it is, but it was supposed to remind me to double check that that
> >> was still necessary. I'll take a look, thanks.
> >>
> >>>> +
> >>>> +#include "intel_skl_int3472_common.h"
> >>>> +
> >>>> +int skl_int3472_get_cldb_buffer(struct acpi_device *adev,
> >>>> +				struct int3472_cldb *cldb)
> >>>> +{
> >>>> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> >>>> +	acpi_handle handle = adev->handle;
> >>>> +	union acpi_object *obj;
> >>>> +	acpi_status status;
> >>>> +	int ret = 0;
> >>>> +
> >>>> +	status = acpi_evaluate_object(handle, "CLDB", NULL, &buffer);
> >>>> +	if (ACPI_FAILURE(status))
> >>>> +		return -ENODEV;
> >>>> +
> >>>> +	obj = buffer.pointer;
> >>>> +	if (!obj) {
> >>>> +		dev_err(&adev->dev, "ACPI device has no CLDB object\n");
> >>> Is this the code path that is taken on Chrome OS ? If so an error
> >>> message isn't appropriate. I'd drop this message, and instead add an
> >>> error message in the discrete PMIC code.
> >> Ah yes of course, thanks, I'll move the error message.
> >>
> >>>> +
> >>>> +	unsigned int n_gpios; /* how many GPIOs have we seen */
> >>>> +
> >>>> +	struct int3472_gpio_regulator regulator;
> >>>> +	struct int3472_gpio_clock clock;
> >>> You don't necessarily need to define separate structures for this, you
> >>> could also write
> >>>
> >>> 	struct {
> >>> 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
> >>> 		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
> >>> 		struct gpio_desc *gpio;
> >>> 		struct regulator_dev *rdev;
> >>> 		struct regulator_desc rdesc;
> >>> 	} regulator;
> >>>
> >>> 	struct {
> >>> 		struct clk *clk;
> >>> 		struct clk_hw clk_hw;
> >>> 		struct clk_lookup *cl;
> >>> 		struct gpio_desc *gpio;
> >>> 	} clock;
> >>>
> >>> It's entirely up to you.
> >> Ooh yeah I like that more, thanks very much.
> >>
> >>>> +/* 79234640-9e10-4fea-a5c1-b5aa8b19756f */
> >>>> +static const guid_t int3472_gpio_guid =
> >>>> +	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> >>>> +		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
> >>>> +
> >>>> +/* 822ace8f-2814-4174-a56b-5f029fe079ee */
> >>>> +static const guid_t cio2_sensor_module_guid =
> >>>> +	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> >>>> +		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
> >>> A comment that explains what those DSM functions do would be useful for
> >>> reference. It has taken lots of time to figure it out, let's spare the
> >>> pain to the next person who tries to understand this :-)
> >> Hah - good point, well made. I'll explain what they're for then.
> >>
> >>>> +static int skl_int3472_clk_enable(struct clk_hw *hw)
> >>>> +{
> >>>> +	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
> >>>> +
> >>>> +	gpiod_set_value(clk->gpio, 1);
> >>> The clock enable() and disable() methods are not supposed to sleep,
> >>> while setting a GPIO value may sleep in the general case. Should this be
> >>> moved to skl_int3472_clk_prepare() ? Same for skl_int3472_clk_disable()
> >>> and skl_int3472_clk_unprepare().
> >> I was under the assumption the difference between gpiod_set_value() and
> >> gpiod_set_value_cansleep() was that gpiod_set_value() _can't_ sleep, but
> >> actually reading the function's comments it seems it will just complain
> >> if it turns out it can sleep:
> >>
> >> * This function can be called from contexts where we cannot sleep, and will
> >> * complain if the GPIO chip functions potentially sleep. It doesn't
> >> complain, on either of my devices, but I guess that can't be guaranteed
> >> for _every_ device, so these calls probably are safer in (un)prepare() yes.
> > If we could guarantee that the GPIOs are connected to the SoC, we could
> > keep using the code above, as there should be no need to sleep. The
> > question is whether this can be guaranteed or not. It's true that I
> > would be surprised if the GPIOs were connected, for instance, to an I2C
> > GPIO expander..
>
> Is that the deciding factor? I'd say that's unlikely, but what do I
> know? Then again, is there actually any downside to calling
> gpiod_set_value() in the prepare() function instead? If not, may as well
> be safe.

The downside is that prepare() is meant to be called earlier than
enable() when the consumer needs to call enable() in a context that
can't sleep. This can sometimes cause the clock to be enabled for longer
than necessary. In this case I don't think it's an issue, sensor drivers
will use clk_prepare_enable() anyway.

> >>>> +			}
> >>>> +
> >>>> +			i++;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	if (!func)
> >>>> +		return 0;
> >>> I initially thought this wasn't right, as if no entry was found in the
> >>> mapping table, func would still have its non-NULL value as passed to
> >>> this function. I then realized that you're checking if the match that
> >>> was found is NULL. A comment to explain this would be useful.
> >> Yep ok - I actually had one and decided it was superfluous and removed
> >> it - my bad.
> >>
> >>>> +
> >>>> +	status = acpi_get_handle(NULL, path, &handle);
> >>>> +	if (ACPI_FAILURE(status))
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	ret = acpi_bus_get_device(handle, &adev);
> >>>> +	if (ret)
> >>>> +		return -ENODEV;
> >>>> +
> >>>> +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
> >>>> +							   ares->data.gpio.pin_table[0],
> >>>> +							   func, 0, polarity);
> >>> I wonder if
> >>>
> >>> 	table_entry.key = acpi_dev_name(adev);
> >>> 	table_entry.chip_hwnum = ares->data.gpio.pin_table[0];
> >>> 	table_entry.con_id = func;
> >>> 	table_entry.idx = 0;
> >>> 	table_entry.flags = polarity;
> >>>
> >>> (with struct gpiod_lookup table_entry = { }; above) would be more
> >>> readable. Up to you.
> >>>
> >>>> +
> >>>> +	memcpy(&int3472->gpios.table[int3472->n_sensor_gpios], &table_entry,
> >>>> +	       sizeof(table_entry));
> >>> Ah, or maybe
> >>>
> >>> 	struct gpio_lookup *table_entry;
> >>>
> >>> 	table_entry = &int3472->gpios.table[int3472->n_sensor_gpios];
> >>> 	table_entry->key = acpi_dev_name(adev);
> >>> 	table_entry->chip_hwnum = ares->data.gpio.pin_table[0];
> >>> 	table_entry->con_id = func;
> >>> 	table_entry->idx = 0;
> >>> 	table_entry->flags = polarity;
> >>>
> >>> (no need to memset() to 0 first as the whole structure has been
> >>> allocated with kzalloc()).
> >> Yeah you're right, this looks much nicer - thanks.
> >>
> >>>> +	int ret = 0;
> >>>> +
> >>>> +	init.name = kasprintf(GFP_KERNEL, "%s-clk",
> >>>> +			      acpi_dev_name(int3472->adev));
> >>> You need to check for NULL and return -ENOMEM.
> >> Oops, of course, thanks
> >>
> >>>> +		goto err_unregister_clk;
> >>> If this fails, you will end up calling clk_unregister() and
> >>> clkdev_drop() in skl_int3472_discrete_remove(). You should replace the
> >>> check in the remove function with
> >>>
> >>> 	if (!int3472->clock.cl) {
> >> You're right, good spot, thank you.
> >>
> >>>> +		dev_err(&int3472->pdev->dev, "No sensor module config\n");
> >>>> +		return PTR_ERR(sensor_config);
> >>>> +	}
> >>> Would it make sense to call this in skl_int3472_discrete_probe() or
> >>> skl_int3472_parse_crs() and cache the config pointer ?
> >> Yes, probably actually, and then the GPIO mapping function can just
> >> check for its presence.
> >>
> >>>> +	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> >>>> +	init_data.num_consumer_supplies = 1;
> >>>> +	init_data.consumer_supplies = &sensor_config->supply_map;
> >>>> +
> >>>> +	snprintf(int3472->regulator.regulator_name,
> >>>> +		 GPIO_REGULATOR_NAME_LENGTH, "int3472-discrete-regulator");
> >>> s/GPIO_REGULATOR_NAME_LENGTH/sizeof(int3472->regulator.regulator_name)/
> >>>
> >>> Do regulator names need to be unique ? If so you may have a problem if a
> >>> platform has two discrete INT3472.
> >> Unlike clocks, the regulator framework doesn't shout at you when you do
> >> this, but I agree it's suboptimal at the very least, I'll set it to
> >> ..."%s-regulator", acpi_dev_name(int3472->adev)... as with the clock.
> >>
> >>>> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> >>>> +		ret = skl_int3472_map_gpio_to_sensor(int3472, ares,
> >>>> +						     "indicator-led",
> >>>> +						     GPIO_ACTIVE_HIGH);
> >>> Mapping the indicator LED to the sensor isn't great, as all sensor
> >>> drivers would then need to handle it. Could it be handled in the
> >>> regulator instead, so that it would be turned on automatically when the
> >>> sensor is powered up ? Another option, more complicated, would be to
> >>> handle it in the CIO2 driver (but I'm not sure how we would map it).
> >> Not with the regulator, because it turns out only the 0x0b pin is one of
> >> those and those appear on very few devices in scope, so it wouldn't be
> >> called on a Surface Book 2 for example. Perhaps as part of clock
> >> prepare/enable? I don't much like the idea of it running in the CIO2
> >> driver to be honest, feels a bit out of place.
> > The clock is another option, but could there be platforms where the
> > clock GPIO isn't present ?
> 
> I haven't ever seen a DSDT that didn't include a 0x0c pin to enable the
> clock, though that doesn't necessarily mean they're always there. Plenty
> of driver datasheets say they're happy for the external clock to be free
> running, so it could just be always active I suppose.

Maybe we can handle this later if such a platform is found. You should
then print a warning message if no clock is present.

> > Another option would be to let userspace handle that GPIO, but we then
> > need to convey it to userspace.
> 
> Can you point me to an example of that to look at perhaps?

I don't think there's any :-) We'd have to design the mechanism.

> >>>> +
> >>>> +	if (int3472->gpios_mapped)
> >>>> +		gpiod_remove_lookup_table(&int3472->gpios);
> >>> You could avoid the need for the gpios_mapped field by checking for
> >>>
> >>> 	if (int3472->gpios.list.next)
> >>>
> >>> Up to you.
> >> Thank you! I was scratching my head trying to figure out a better way of
> >> doing that.

-- 
Regards,

Laurent Pinchart
