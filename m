Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387512CBD38
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 13:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgLBMnU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 07:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLBMnT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 07:43:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5182EC0613CF;
        Wed,  2 Dec 2020 04:42:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62C3C31D;
        Wed,  2 Dec 2020 13:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606912957;
        bh=uCg6TyIii1s5v0WeSqtkpiOld1cs/X5JMk4hle7skKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fTVcbBIbDyWsui2B5V2e+rpZRbl/9mRZ9R1GR5OFzmc4ZMjrD8k90A0gVZCi2h/mf
         O3kNKGKoTP+rA29iJPIaWAsDh6bNEDzfvGeYpb9sZdK2W2SKqSJwMusLX/4R2ew3lM
         GH6MMKtLdRGDMoLe0FgEoVKabrPxEhPHTCJSNj0I=
Date:   Wed, 2 Dec 2020 14:42:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201202124228.GF4486@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201155513.GB852@paasikivi.fi.intel.com>
 <20201201183758.GE3085@pendragon.ideasonboard.com>
 <20201202110956.GD852@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201202110956.GD852@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 01:09:56PM +0200, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Tue, Dec 01, 2020 at 08:37:58PM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > On Tue, Dec 01, 2020 at 05:55:13PM +0200, Sakari Ailus wrote:
> > > On Tue, Dec 01, 2020 at 01:32:32AM +0200, Laurent Pinchart wrote:
> > > > On Mon, Nov 30, 2020 at 10:07:19PM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:
> > > > > > On platforms where ACPI is designed for use with Windows, resources
> > > > > > that are intended to be consumed by sensor devices are sometimes in
> > > > > > the _CRS of a dummy INT3472 device upon which the sensor depends. This
> > > > > > driver binds to the dummy acpi device (which does not represent a
> > > > > 
> > > > > acpi device -> acpi_device
> > > > > 
> > > > > > physical PMIC) and maps them into GPIO lines and regulators for use by
> > > > > > the sensor device instead.
> > > > > 
> > > > > ...
> > > > > 
> > > > > > This patch contains the bits of this process that we're least sure about.
> > > > > > The sensors in scope for this work are called out as dependent (in their
> > > > > > DSDT entry's _DEP) on a device with _HID INT3472. These come in at least
> > > > > > 2 kinds; those with an I2cSerialBusV2 entry (which we presume therefore
> > > > > > are legitimate tps68470 PMICs that need handling by those drivers - work
> > > > > > on that in the future). And those without an I2C device. For those without
> > > > > > an I2C device they instead have an array of GPIO pins defined in _CRS. So
> > > > > > for example, my Lenovo Miix 510's OVTI2680 sensor is dependent on one of
> > > > > > the _latter_ kind of INT3472 devices, with this _CRS:
> > > > > > 
> > > > > > Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> > > > > > {
> > > > > >     Name (SBUF, ResourceTemplate ()
> > > > > >     {
> > > > > >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> > > > > > 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> > > > > > 	    0x00, ResourceConsumer, ,
> > > > > >             )
> > > > > >             {   // Pin list
> > > > > >                 0x0079
> > > > > >             }
> > > > > >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> > > > > > 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> > > > > > 	    0x00, ResourceConsumer, ,
> > > > > >             )
> > > > > >             {   // Pin list
> > > > > >                 0x007A
> > > > > >             }
> > > > > >         GpioIo (Exclusive, PullDefault, 0x0000, 0x0000,
> > > > > > 	    IoRestrictionOutputOnly, "\\_SB.PCI0.GPI0",
> > > > > > 	    0x00, ResourceConsumer, ,
> > > > > >             )
> > > > > >             {   // Pin list
> > > > > >                 0x008F
> > > > > >             }
> > > > > >     })
> > > > > >     Return (SBUF) /* \_SB_.PCI0.PMI1._CRS.SBUF */
> > > > > > }
> > > > > > 
> > > > > > and the same device has a _DSM Method, which returns 32-bit ints where
> > > > > > the second lowest byte we noticed to match the pin numbers of the GPIO
> > > > > > lines:
> > > > > > 
> > > > > > Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
> > > > > > {
> > > > > >     If ((Arg0 == ToUUID ("79234640-9e10-4fea-a5c1-b5aa8b19756f")))
> > > > > >     {
> > > > > >         If ((Arg2 == One))
> > > > > >         {
> > > > > >             Return (0x03)
> > > > > >         }
> > > > > > 
> > > > > >         If ((Arg2 == 0x02))
> > > > > >         {
> > > > > >             Return (0x01007900)
> > > > > >         }
> > > > > > 
> > > > > >         If ((Arg2 == 0x03))
> > > > > >         {
> > > > > >             Return (0x01007A0C)
> > > > > >         }
> > > > > > 
> > > > > >         If ((Arg2 == 0x04))
> > > > > >         {
> > > > > >             Return (0x01008F01)
> > > > > >         }
> > > > > >     }
> > > > > > 
> > > > > >     Return (Zero)
> > > > > > }
> > > > > > 
> > > > > > We know that at least some of those pins have to be toggled active for the
> > > > > > sensor devices to be available in i2c, so the conclusion we came to was
> > > > > > that those GPIO entries assigned to the INT3472 device actually represent
> > > > > > GPIOs and regulators to be consumed by the sensors themselves. Tsuchiya
> > > > > > noticed that the lowest byte in the return values of the _DSM method
> > > > > > seemed to represent the type or function of the GPIO line, and we
> > > > > > confirmed that by testing on each surface device that GPIO lines where the
> > > > > > low byte in the _DSM entry for that pin was 0x0d controlled the privacy
> > > > > > LED of the cameras.
> > > > > > 
> > > > > > We're guessing as to the exact meaning of the function byte, but I
> > > > > > conclude they're something like this:
> > > > > > 
> > > > > > 0x00 - probably a reset GPIO
> > > > > > 0x01 - regulator for the sensor
> > > > > > 0x0c - regulator for the sensor
> > > > > > 0x0b - regulator again, but for a VCM or EEPROM
> > > > > > 0x0d - privacy led (only one we're totally confident of since we can see
> > > > > >        it happen!)
> > > > > 
> > > > > It's solely Windows driver design...
> > > > > Luckily I found some information and can clarify above table:
> > > > > 
> > > > > 0x00 Reset
> > > > > 0x01 Power down
> > > > > 0x0b Power enable
> > > > > 0x0c Clock enable
> > > > > 0x0d LED (active high)
> > > > 
> > > > That's very useful information ! Thank you.
> > > > 
> > > > > The above text perhaps should go somewhere under Documentation.
> > > > 
> > > > Or in the driver source code, but definitely somewhere else than in the
> > > > commit message.
> > > > 
> > > > > > After much internal debate I decided to write this as a standalone
> > > > > > acpi_driver. Alternative options we considered:
> > > > > > 
> > > > > > 1. Squash all this into the cio2-bridge code, which I did originally write
> > > > > > but decided I didn't like.
> > > > > > 2. Extend the existing tps68470 mfd driver...they share an ACPI ID so this
> > > > > > kinda makes sense, but ultimately given there is no actual physical
> > > > > > tps68470 in the scenario this patch handles I decided I didn't like this
> > > > > > either.
> > > > > 
> > > > > Looking to this I think the best is to create a module that can be consumed by tps68470 and separately.
> > > > > So, something near to it rather than under ipu3 hood.
> > > > > 
> > > > > You may use same ID's in both drivers (in PMIC less case it can be simple
> > > > > platform and thus they won't conflict), but both of them should provide GPIO
> > > > > resources for consumption.
> > > > > 
> > > > > So, something like
> > > > > 
> > > > >  tps68470.h with API to consume
> > > > >  split tps68470 to -core, -i2c parts
> > > > >  add int3472, which will serve for above and be standalone platform driver
> > > > >  update cio2-bridge accordingly
> > > > > 
> > > > > Would it be feasible?
> > > > 
> > > > Given that INT3472 means Intel camera power management device (that's
> > > > more or less the wording in Windows, I can double-check), would the
> > > > following make sense ?
> > > > 
> > > > A top-level module named intel-camera-pmic (or int3472, or ...) would
> > > > register two drivers, a platform driver and an I2C driver, to
> > > > accommodate for both cases ("discrete PMIC" that doesn't have an
> > > > I2cSerialBusV2, and TPS64870 or uP6641Q that are I2C devices). The probe
> > > > function would perform the following:
> > > > 
> > > > - If there's no CLDB, then the device uses the Chrome OS "ACPI
> > > >   bindings", and refers to a TPS64870. The code that exists in the
> > > >   kernel today (registering GPIOs, and registering an OpRegion to
> > > >   communicate with the power management code in the DSDT) would be
> > > >   activated.
> > > > 
> > > > - If there's a CLDB, then the device type would be retrieved from it:
> > > > 
> > > >   - If the device is a "discrete PMIC", the driver would register clocks
> > > >     and regulators controlled by GPIOs, and create clock, regulator and
> > > >     GPIO lookup entries for the sensor device that references the PMIC.
> > > > 
> > > >   - If the device is a TPS64870, the code that exists in the kernel
> > > >     today to register GPIOs would be activated, and new code would need
> > > >     to be written to register regulators and clocks.
> > > > 
> > > >   - If the device is a uP6641Q, a new driver will need to be written (I
> > > >     don't know on which devices this PMIC is used, so this can probably
> > > >     be deferred).
> > > > 
> > > > We can split this in multiple files and/or modules.
> > > 
> > > That's what I thought of, too, as one option, but with some more detail.
> > > This would be indeed the cleanest option.
> > > 
> > > I think it'd be nice if the CLDB stuff (apart from checking whether it's
> > > there) would be in a different module to avoid cluttering up the real
> > > tps68470 driver.
> > 
> > Given the amount of code, and the fact that the driver should be
> > compiled as a module, I don't think it will make a huge difference in
> > the memory footprint.
> 
> I'd still prefer to keep the ACPI hack support and the real driver well
> separated. That way it'd be also easy to put them to their respective
> modules. That's actually how the tps68470 MFD driver is currently arranged;
> the GPIO and OP region drivers are separate from each other.

I think we should consider ACPI to be a hack in the first place :-)

> Could this be just one more platform device for each of the three cases (or
> one for the two latter; I'm not quite sure yet)?

Using MFD for this seems a bit overkill to me. I won't care much as I
won't maintain those drivers, but the current situation is complex
enough, it was hard for me to understand how things worked. Adding yet
another layer with another platform device won't make it any simpler.

If we want to split this in two, I'd rather have a tps68470 driver on
one side, without ACPI op region support, but registering regulators,
GPIOs and clocks (without using separate drivers and devices for these
three features), and an INT3472 driver on the other side, with all the
ACPI glue and hacks. The tps68470 code could possibly even be structured
in such a way that it would be used as a library by the INT3472 driver
instead of requiring a separate platform device.

> The GPIO regulator case is relatively safe, but the real PMICs require
> regulator voltage control as well as enabling and disabling the regulators.
> That probably requires either schematics or checking the register values at
> runtime on Windows (i.e. finding out which system you're dealing with, at
> runtime).

-- 
Regards,

Laurent Pinchart
