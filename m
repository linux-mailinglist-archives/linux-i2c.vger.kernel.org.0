Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAD72EFC0D
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 01:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbhAIATC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 19:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAIATC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 19:19:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D1AC061574;
        Fri,  8 Jan 2021 16:18:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD210DA;
        Sat,  9 Jan 2021 01:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610151498;
        bh=2xLLCMHfsnoBo0TZlD7viI9mV5cBe/sYdT2c7bn7QPw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KeVw/zdSn6eM78zrDNCaPN13dFxGVpHhHwfTauhy9vVFYDQ8zhT+fURvQfUIlCjym
         lui7QgCY/MIZH0ZhQ9MrA26mRCrz4dHVNJBdCZ9MLakqQ7ZusaRF+T8uK67tveu3oo
         HdY9b/uN6/ZiI0P4o53LLQ8L2fum8HoNr8/d9w28=
Date:   Sat, 9 Jan 2021 02:18:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jordan Hand <jorhand@linux.microsoft.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <X/j2OnQpuJRLw3DP@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <778f23fc-b99c-33a2-642d-ca0e47fd4ed5@gmail.com>
 <CAHp75VeYOqJt9iKaGPA4=dkb2kYUbqUV4PGTn8uSsnUt_kSGSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VeYOqJt9iKaGPA4=dkb2kYUbqUV4PGTn8uSsnUt_kSGSw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

H Andy and Daniel,

On Fri, Jan 08, 2021 at 02:17:49PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 8, 2021 at 1:56 AM Daniel Scally wrote:
> > On 30/11/2020 20:07, Andy Shevchenko wrote:
> > > On Mon, Nov 30, 2020 at 01:31:29PM +0000, Daniel Scally wrote:
> 
> ...
> 
> > > It's solely Windows driver design...
> > > Luckily I found some information and can clarify above table:
> > >
> > > 0x00 Reset
> > > 0x01 Power down
> > > 0x0b Power enable
> > > 0x0c Clock enable
> > > 0x0d LED (active high)
> > >
> > > The above text perhaps should go somewhere under Documentation.
> >
> > Coming back to this; there's a bit of an anomaly with the 0x01 Power
> > Down pin for at least one platform.  As listed above, the OV2680 on one
> > of my platforms has 3 GPIOs defined, and the table above gives them as
> > type Reset, Power down and Clock enable. I'd assumed from this table
> > that "power down" meant a powerdown GPIO (I.E. the one usually called
> > PWDNB in Omnivision datasheets and "powerdown" in drivers), but the
> > datasheet for the OV2680 doesn't list a separate reset and powerdown
> > pin, but rather a single pin that performs both functions.

First question, do we have a confirmation that the OV2680 sensor on that
platform requires GPIO 0x01 to be toggled to work properly ? I'd like to
rule out the option of the GPIO being simply not connected (that would
be best for us, although my experience so far with this terrible ACPI
design doesn't of course give me much hope).

Where did you find the OV2680 datasheet by the way, can you share a link
to a leaked version ?

> All of them are GPIOs, the question here is how they are actually
> connected on PCB level and I have no answer to that. You have to find
> schematics somewhere.
> 
> > Am I wrong to treat that as something that ought to be mapped as a
> > powerdown GPIO to the sensors? Or do you know of any other way to
> > reconcile that discrepancy?
> 
> The GPIOs can go directly to the sensors or be a control pin for
> separate discrete power gates.

GPIO functions 0x00 and 0x01 are meant to control sensor signals, while
GPIO function 0x0b is meant to control a power gate. Of course board
designers may have thought clever to use function 0x01 to control a
second power gate, this can't be ruled out without the schematics (or
reverse engineering of the hardware).

> So, we can do one of the following:
>  a) present PD GPIO as fixed regulator;
>  b) present PD & Reset GPIOs as regulator;
>  c) provide them as is to the sensor and sensor driver must do what it
> considers right.
> 
> Since we don't have schematics (yet?) and we have plenty of variations
> of sensors, I would go to c) and update the driver of the affected
> sensor as needed. Because even if you have separate discrete PD for
> one sensor on one platform there is no guarantee that it will be the
> same on another. Providing a "virtual" PD in a sensor that doesn't
> support it is the best choice I think. Let's hear what Sakari and
> other experienced camera sensor developers say.
> 
> My vision is purely based on electrical engineering background,
> experience with existing (not exactly camera) sensor drivers and
> generic cases.

If the OV2680 has indeed no power down pin, that won't work. Adding
support for a non-existent powerdown pin to the corresponding driver
won't be accepted. Workarounds and hacks to support IPU3-based devices
need to be kept out of camera sensor drivers.

If we need to map GPIO function 0x01 to a sensor GPIO on some platform,
and to a regulator on other platforms, then we will need per-platform
data in the INT3472 driver. For this particular platform, the reset
(0x00) GPIO should be passed to the sensor, and the powerdown (0x01)
GPIO should control a regulator (again assuming that our assumption that
the GPIO is wired to a power gate is correct).

> > Failing that; the only way I can think to handle this is to register
> > proxy GPIO pins assigned to the sensors as you suggested previously, and
> > have them toggle the GPIO's assigned to the INT3472 based on platform
> > specific mapping data (I.E. we register a pin called "reset", which on
> > most platforms just toggles the 0x00 pin, but on this specific platform
> > would drive both 0x00 and 0x01 together. We're already heading that way
> > for the regulator consumer supplies so it's sort of nothing new, but I'd
> > still rather not if it can be avoided.

-- 
Regards,

Laurent Pinchart
