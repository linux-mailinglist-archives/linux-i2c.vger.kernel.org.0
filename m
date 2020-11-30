Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D4A2C92A0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 00:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388762AbgK3XdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 18:33:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34630 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388510AbgK3XdY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 18:33:24 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A5492A4;
        Tue,  1 Dec 2020 00:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606779160;
        bh=lU++4kSerLSCK/Ovv5NuVq0+EwNTdVJlezIWcTkIZMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GG7828EkJ8QIL1QEhX2jJjrzRw3jyotgA+MjJt/uTn2BlTK1hgjH7u9tktQAkPq6g
         g9+FalPvL0BiMojlELCObp2xQaDntR+srQL0Y1lPJKqYC0W6L4EMrhnTa1wBevRSQg
         IFFVxyQf+z4NWjzOKkdX+hbiRRoD1nX1fxRUhuSo=
Date:   Tue, 1 Dec 2020 01:32:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201130233232.GD25713@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130200719.GB4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Nov 30, 2020 at 10:07:19PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:
> > On platforms where ACPI is designed for use with Windows, resources
> > that are intended to be consumed by sensor devices are sometimes in
> > the _CRS of a dummy INT3472 device upon which the sensor depends. This
> > driver binds to the dummy acpi device (which does not represent a
> 
> acpi device -> acpi_device
> 
> > physical PMIC) and maps them into GPIO lines and regulators for use by
> > the sensor device instead.
> 
> ...
> 
> > This patch contains the bits of this process that we're least sure about.
> > The sensors in scope for this work are called out as dependent (in their
> > DSDT entry's _DEP) on a device with _HID INT3472. These come in at least
> > 2 kinds; those with an I2cSerialBusV2 entry (which we presume therefore
> > are legitimate tps68470 PMICs that need handling by those drivers - work
> > on that in the future). And those without an I2C device. For those without
> > an I2C device they instead have an array of GPIO pins defined in _CRS. So
> > for example, my Lenovo Miix 510's OVTI2680 sensor is dependent on one of
> > the _latter_ kind of INT3472 devices, with this _CRS:
> > 
> > Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> > {
> >     Name (SBUF, ResourceTemplate ()
> >     {
> >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> > 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> > 	    0x00, ResourceConsumer, ,
> >             )
> >             {   // Pin list
> >                 0x0079
> >             }
> >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> > 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> > 	    0x00, ResourceConsumer, ,
> >             )
> >             {   // Pin list
> >                 0x007A
> >             }
> >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> > 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> > 	    0x00, ResourceConsumer, ,
> >             )
> >             {   // Pin list
> >                 0x008F
> >             }
> >     })
> >     Return (SBUF) /* \_SB_.PCI0.PMI1._CRS.SBUF */
> > }
> > 
> > and the same device has a _DSM Method, which returns 32-bit ints where
> > the second lowest byte we noticed to match the pin numbers of the GPIO
> > lines:
> > 
> > Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
> > {
> >     If ((Arg0 == ToUUID ("79234640-9e10-4fea-a5c1-b5aa8b19756f")))
> >     {
> >         If ((Arg2 == One))
> >         {
> >             Return (0x03)
> >         }
> > 
> >         If ((Arg2 == 0x02))
> >         {
> >             Return (0x01007900)
> >         }
> > 
> >         If ((Arg2 == 0x03))
> >         {
> >             Return (0x01007A0C)
> >         }
> > 
> >         If ((Arg2 == 0x04))
> >         {
> >             Return (0x01008F01)
> >         }
> >     }
> > 
> >     Return (Zero)
> > }
> > 
> > We know that at least some of those pins have to be toggled active for the
> > sensor devices to be available in i2c, so the conclusion we came to was
> > that those GPIO entries assigned to the INT3472 device actually represent
> > GPIOs and regulators to be consumed by the sensors themselves. Tsuchiya
> > noticed that the lowest byte in the return values of the _DSM method
> > seemed to represent the type or function of the GPIO line, and we
> > confirmed that by testing on each surface device that GPIO lines where the
> > low byte in the _DSM entry for that pin was 0x0d controlled the privacy
> > LED of the cameras.
> > 
> > We're guessing as to the exact meaning of the function byte, but I
> > conclude they're something like this:
> > 
> > 0x00 - probably a reset GPIO
> > 0x01 - regulator for the sensor
> > 0x0c - regulator for the sensor
> > 0x0b - regulator again, but for a VCM or EEPROM
> > 0x0d - privacy led (only one we're totally confident of since we can see
> >        it happen!)
> 
> It's solely Windows driver design...
> Luckily I found some information and can clarify above table:
> 
> 0x00 Reset
> 0x01 Power down
> 0x0b Power enable
> 0x0c Clock enable
> 0x0d LED (active high)

That's very useful information ! Thank you.

> The above text perhaps should go somewhere under Documentation.

Or in the driver source code, but definitely somewhere else than in the
commit message.

> > After much internal debate I decided to write this as a standalone
> > acpi_driver. Alternative options we considered:
> > 
> > 1. Squash all this into the cio2-bridge code, which I did originally write
> > but decided I didn't like.
> > 2. Extend the existing tps68470 mfd driver...they share an ACPI ID so this
> > kinda makes sense, but ultimately given there is no actual physical
> > tps68470 in the scenario this patch handles I decided I didn't like this
> > either.
> 
> Looking to this I think the best is to create a module that can be consumed by tps68470 and separately.
> So, something near to it rather than under ipu3 hood.
> 
> You may use same ID's in both drivers (in PMIC less case it can be simple
> platform and thus they won't conflict), but both of them should provide GPIO
> resources for consumption.
> 
> So, something like
> 
>  tps68470.h with API to consume
>  split tps68470 to -core, -i2c parts
>  add int3472, which will serve for above and be standalone platform driver
>  update cio2-bridge accordingly
> 
> Would it be feasible?

Given that INT3472 means Intel camera power management device (that's
more or less the wording in Windows, I can double-check), would the
following make sense ?

A top-level module named intel-camera-pmic (or int3472, or ...) would
register two drivers, a platform driver and an I2C driver, to
accommodate for both cases ("discrete PMIC" that doesn't have an
I2cSerialBusV2, and TPS64870 or uP6641Q that are I2C devices). The probe
function would perform the following:

- If there's no CLDB, then the device uses the Chrome OS "ACPI
  bindings", and refers to a TPS64870. The code that exists in the
  kernel today (registering GPIOs, and registering an OpRegion to
  communicate with the power management code in the DSDT) would be
  activated.

- If there's a CLDB, then the device type would be retrieved from it:

  - If the device is a "discrete PMIC", the driver would register clocks
    and regulators controlled by GPIOs, and create clock, regulator and
    GPIO lookup entries for the sensor device that references the PMIC.

  - If the device is a TPS64870, the code that exists in the kernel
    today to register GPIOs would be activated, and new code would need
    to be written to register regulators and clocks.

  - If the device is a uP6641Q, a new driver will need to be written (I
    don't know on which devices this PMIC is used, so this can probably
    be deferred).

We can split this in multiple files and/or modules.

> ...
> 
> > +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
> > +							   ares->data.gpio.pin_table[0],
> > +							   func, 0, GPIO_ACTIVE_HIGH);
> 
> You won't need this if you have regular INT3472 platform driver.
> Simple call there _DSM to map resources to the type and use devm_gpiod_get on
> consumer behalf. Thus, previous patch is not needed.

How does the consumer (the camera sensor) retrieve the GPIO though ? The
_DSM is in the PMIC device object, while the real consumer is the camera
sensor.

> ...
> 
> > +	case 0x01: /* Power regulators (we think) */
> > +	case 0x0c:
> > +	case 0x0b: /* Power regulators, but to a device separate to sensor */
> > +	case 0x0d: /* Indicator LEDs */
> 
> 
> Give names to those constants.
> 
> 	#define INT3472_GPIO_TYPE_RESET 0x00
> 	...
> 
> 
> > +static struct acpi_driver int3472_driver = {
> 
> No acpi_driver! Use platform_driver instead with plenty of examples all over
> the kernel.
> 
> > +	.name = "int3472",
> > +	.ids = int3472_device_id,
> > +	.ops = {
> > +		.add = int3472_add,
> > +		.remove = int3472_remove,
> > +	},
> 
> > +	.owner = THIS_MODULE,
> 
> No need
> 
> > +};
> 
> ...
> 
> > +const guid_t int3472_gpio_guid = GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> > +					     0xa5, 0xc1, 0xb5, 0xaa, 0x8b,
> > +					     0x19, 0x75, 0x6f);
> > +
> > +const guid_t cio2_sensor_module_guid = GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> > +						 0xa5, 0x6b, 0x5f, 0x02, 0x9f,
> > +						 0xe0, 0x79, 0xee);
> 
> Use more or less standard pattern for these, like
> 
> /* 79234640-9e10-4fea-a5c1b5aa8b19756f */
> const guid_t int3472_gpio_guid =
> 	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> 		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
> 
> ...
> 
> > +static struct regulator_consumer_supply miix_510_ov2680[] = {
> > +	{ "i2c-OVTI2680:00", "avdd" },
> > +	{ "i2c-OVTI2680:00", "dovdd" },
> > +};
> 
> Can we use acpi_dev_first_match_dev() to get instance name out of their HIDs?
> 
> > +static struct regulator_consumer_supply surface_go2_ov5693[] = {
> > +	{ "i2c-INT33BE:00", "avdd" },
> > +	{ "i2c-INT33BE:00", "dovdd" },
> > +};
> > +
> > +static struct regulator_consumer_supply surface_book_ov5693[] = {
> > +	{ "i2c-INT33BE:00", "avdd" },
> > +	{ "i2c-INT33BE:00", "dovdd" },
> > +};
> 
> Ditto.
> 
> ...
> 
> > +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> > +	{ "GNDF140809R", 2, miix_510_ov2680 },
> > +	{ "YHCU", 2, surface_go2_ov5693 },
> > +	{ "MSHW0070", 2, surface_book_ov5693 },
> > +};
> 
> Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> false positive matches.

-- 
Regards,

Laurent Pinchart
