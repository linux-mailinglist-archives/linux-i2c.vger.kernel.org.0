Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A3D2CAB07
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 19:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgLASuP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 13:50:15 -0500
Received: from mga17.intel.com ([192.55.52.151]:64930 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgLASuP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 13:50:15 -0500
IronPort-SDR: zC1jzEntLR5WeyiusCjRCDw52AeqCffYJMROruJGYr9h5smA9oppPWC4Lg3pjyy/JluJ1p+1Lb
 l6M9HICq7lnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152715090"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="152715090"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:48:32 -0800
IronPort-SDR: yRfp/l/szXFP7pDE6Y0dRxFbTz9CYbggzv+2JjLpfa7dqy+O2ui7oLEBwp2x2m7cRaoeKvX2l1
 1VG1Ezvc/PTQ==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="315803677"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 10:48:25 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kkAiL-00BL7K-Vw; Tue, 01 Dec 2020 20:49:25 +0200
Date:   Tue, 1 Dec 2020 20:49:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20201201184925.GJ4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201130233232.GD25713@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 01, 2020 at 01:32:32AM +0200, Laurent Pinchart wrote:
> On Mon, Nov 30, 2020 at 10:07:19PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:

...

> > So, something like
> > 
> >  tps68470.h with API to consume
> >  split tps68470 to -core, -i2c parts
> >  add int3472, which will serve for above and be standalone platform driver
> >  update cio2-bridge accordingly
> > 
> > Would it be feasible?
> 
> Given that INT3472 means Intel camera power management device (that's
> more or less the wording in Windows, I can double-check), would the
> following make sense ?
> 
> A top-level module named intel-camera-pmic (or int3472, or ...) would
> register two drivers, a platform driver and an I2C driver, to
> accommodate for both cases ("discrete PMIC" that doesn't have an
> I2cSerialBusV2, and TPS64870 or uP6641Q that are I2C devices). The probe
> function would perform the following:
> 
> - If there's no CLDB, then the device uses the Chrome OS "ACPI
>   bindings", and refers to a TPS64870. The code that exists in the
>   kernel today (registering GPIOs, and registering an OpRegion to
>   communicate with the power management code in the DSDT) would be
>   activated.
> 
> - If there's a CLDB, then the device type would be retrieved from it:
> 
>   - If the device is a "discrete PMIC", the driver would register clocks
>     and regulators controlled by GPIOs, and create clock, regulator and
>     GPIO lookup entries for the sensor device that references the PMIC.
> 
>   - If the device is a TPS64870, the code that exists in the kernel
>     today to register GPIOs would be activated, and new code would need
>     to be written to register regulators and clocks.
> 
>   - If the device is a uP6641Q, a new driver will need to be written (I
>     don't know on which devices this PMIC is used, so this can probably
>     be deferred).
> 
> We can split this in multiple files and/or modules.

Seems we can do this, by locating intel_int3472.c under PDx86 hood and dropping
ACPI ID table from TPS68470 MFD driver. The PMIC can be instantiated via
i2c_acpi_new_device() (IIRC the API name).

And actually it makes more sense since it's not and MFD and should not be there.

(Dan, patch wise the one creates intel_int3472.c followed by another one that
 moves ACPI ID from PMIC and introduces its instantiation via I²C board info
 structure)

...

> > > +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
> > > +							   ares->data.gpio.pin_table[0],
> > > +							   func, 0, GPIO_ACTIVE_HIGH);
> > 
> > You won't need this if you have regular INT3472 platform driver.
> > Simple call there _DSM to map resources to the type and use devm_gpiod_get on
> > consumer behalf. Thus, previous patch is not needed.
> 
> How does the consumer (the camera sensor) retrieve the GPIO though ? The
> _DSM is in the PMIC device object, while the real consumer is the camera
> sensor.

1. A GPIO proxy
2. A custom GPIO lookup tables
3. An fwnode passing to the sensor (via swnodes graph)

First may issue deferred probe, while second needs some ordering tricks I guess.
Third one should also provide an ACPI GPIO mapping table or so to make the
consumer rely on names rather than custom numbers.

Perhaps someone may propose other solutions.

-- 
With Best Regards,
Andy Shevchenko


