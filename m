Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1B12CBD1C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 13:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgLBMgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 07:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgLBMgd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 07:36:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCCFC0613D4;
        Wed,  2 Dec 2020 04:35:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4018231D;
        Wed,  2 Dec 2020 13:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606912548;
        bh=vFRCyeRysRNaucrz5XO0nhTQ4MhbmNXAN8hJkzu4iWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PUTewk2IxAV3eurGOu8Nlfk23gH1DsdGZ8BL6Wi4qfAO3tSXwHax2CPm6orRBxCBe
         zusNqgT1zuSBrGdkXG2rbtQlbG/F1voO6RhqhUtmNEA5IRar+cmx6oVGpLFMuk3D7x
         +GuDrRyEOBKhfRuNBnkg9I9v2Izqa94okdyz3EWI=
Date:   Wed, 2 Dec 2020 14:35:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
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
Message-ID: <20201202123540.GE4486@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201184925.GJ4077@smile.fi.intel.com>
 <4181e6a6-a60f-0a2b-1b46-13a2359d8753@gmail.com>
 <20201202093952.GU4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201202093952.GU4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 02, 2020 at 11:39:52AM +0200, Andy Shevchenko wrote:
> On Tue, Dec 01, 2020 at 08:59:53PM +0000, Dan Scally wrote:
> > On 01/12/2020 18:49, Andy Shevchenko wrote:
> 
> ...
> 
> > > Seems we can do this, by locating intel_int3472.c under PDx86 hood and dropping
> > > ACPI ID table from TPS68470 MFD driver. The PMIC can be instantiated via
> > > i2c_acpi_new_device() (IIRC the API name).
> > >
> > > And actually it makes more sense since it's not and MFD and should not be there.
> > >
> > > (Dan, patch wise the one creates intel_int3472.c followed by another one that
> > >  moves ACPI ID from PMIC and introduces its instantiation via I²C board info
> > >  structure)
> > 
> > I'm mostly following this, but why would we need an i2c_board_info or
> > i2c_acpi_new_device()? The INT3472 entries that refer to actual tps68470
> > devices do have an I2cSerialBusV2 enumerated in _CRS so in their case
> > there's an i2c device registered with the kernel already.
> 
> Because as we discussed already we can't have two drivers for the same ID
> without a big disruption in the driver(s).
> 
> If you have a single point of enumeration, it will make things much easier
> (refer to the same intel_cht_int33fe driver you mentioned earlier).
> 
> I just realize that the name of int3472 should follow the same pattern, i.e.
> intel_skl_int3472.c

We're mostly focussing on Kaby Lake here though. From what I understand
the ACPI infrastructure for camera support is mostly the same on Sky
Lake, but not identical. I think a single driver should be able to cover
both though.

> > I think we need those things when we get round to handling the
> > VCM/EEPROM that's hidden within the sensor's ACPI entry, but I've not
> > done any work on that yet at all.
> 
> Let's consider this later — one step at a time.

-- 
Regards,

Laurent Pinchart
