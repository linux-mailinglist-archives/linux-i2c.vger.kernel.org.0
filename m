Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7B52CBD4D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 13:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbgLBMti (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 07:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgLBMti (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 07:49:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A2EC0613CF;
        Wed,  2 Dec 2020 04:48:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1335031D;
        Wed,  2 Dec 2020 13:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606913336;
        bh=hEXBL65wsKMpoxqhRlC0JgpfzMG124QF1pk1LDmzaE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L0T/EkypqD2YvTs10qu7uWmmrC2uttPectWXso0DbWpalELGRri0X7fyU2R5o3Iqf
         Fy+G42bQQPJnQ9jH0T9hXkCoMvOBf5NTijP8Gk9qPgy7mW0Uddr/0pC65AH2IFqWSv
         eCviVQi/vHvBuWgjaYi2LemP4BMjYim+q3/iIqrY=
Date:   Wed, 2 Dec 2020 14:48:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
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
Message-ID: <20201202124847.GG4486@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com>
 <20201201190638.GZ4569@pendragon.ideasonboard.com>
 <20201201192137.GR4077@smile.fi.intel.com>
 <4831d44a-5bcc-8cf3-964c-c7dca6827458@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4831d44a-5bcc-8cf3-964c-c7dca6827458@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Tue, Dec 01, 2020 at 09:34:58PM +0100, Hans de Goede wrote:
> On 12/1/20 8:21 PM, Andy Shevchenko wrote:
> > On Tue, Dec 01, 2020 at 09:06:38PM +0200, Laurent Pinchart wrote:
> >> On Tue, Dec 01, 2020 at 09:05:23PM +0200, Andy Shevchenko wrote:
> >>> On Tue, Dec 01, 2020 at 08:55:48PM +0200, Laurent Pinchart wrote:
> >>>> On Tue, Dec 01, 2020 at 08:54:17PM +0200, Andy Shevchenko wrote:
> >>>>> On Tue, Dec 01, 2020 at 08:30:03AM +0000, Dan Scally wrote:
> >>>>>> On 30/11/2020 20:07, Andy Shevchenko wrote:
> >>>
> >>> ...
> >>>
> >>>>>>>> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> >>>>>>>> +	{ "GNDF140809R", 2, miix_510_ov2680 },
> >>>>>>>> +	{ "YHCU", 2, surface_go2_ov5693 },
> >>>>>>>> +	{ "MSHW0070", 2, surface_book_ov5693 },
> >>>>>>>> +};
> >>>>>>>
> >>>>>>> Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> >>>>>>> false positive matches.
> >>>>>>
> >>>>>> I considered DMI too, no problem to switch to that if it's a better choice.
> >>>>>
> >>>>> I prefer DMI as it's a standard way to describe platform quirks in x86 world.
> >>>>
> >>>> Do you think the Windows driver would use DMI ?
> >>>
> >>> Linux is using DMI for quirks.
> >>>
> >>>> That seems quite
> >>>> unlikely to me, given how they would have to release a new driver binary
> >>>> for every machine. I'm pretty sure that a different mechanism is used to
> >>>> identify camera integration, and I think it would make sense to follow
> >>>> the same approach. That would allow us to avoid large tables of DMI
> >>>> identifiers that would need to be constently updated, potentially making
> >>>> user experience better.
> >>>
> >>> All Surface family can be matched in a way as Apple machines [1].
> >>>
> >>> [1]: https://lkml.org/lkml/2020/4/15/1198
> >>
> >> But not all Surface machines necessarily have the same camera
> >> architecture. My point is that there seems to be identifiers reported in
> >> ACPI for the exact purpose of identifying the camera architecture. If we
> >> used DMI instead, we would have to handle each machine individually.
> > 
> > With help of DMI we may narrow down the search.
> > 
> > But again, we are talking about uncertainity. It may be your way (a lot of
> > platforms that have different settings), or mine (only a few with more or less
> > standard sets of settings).
> > 
> > DMI is simply standard in Linux (people usually easier can grep for quirks for
> > a specific platform).
> > 
> > I would rather ask Hans' opinion since he has quite an expertise with DMI for
> > good and bad.
> 
> So generally there are 2 ways how things like this can go:
> 
> 1) There is sufficient information in the ACPI table and we use data from the
> ACPI tables
> 
> 2) There is unsufficient info in the ACPI tables (or we don't know how to
> get / interpret the data) and we use DMI quirks

And this specific case I believe there is sufficient data in the ACPI
tables, as I don't believe the Windows driver uses DMI quirks, or comes
in the form of machine-specific binaries. We however don't know how to
interpret all the data, but that should hopefully get better over time
(especially as we'll get more data points, with ACPI dumps from machines
whose schematics have leaked).

> Although we do often also use a combination, getting what we can from ACPI,
> combined with a set of defaults for what we cannot get from ACPI
> based on what reference designs use (IOW what most devices seem to have
> copy and pasted). Combined with DMI quirks for when the defaults do not
> work (which is quite often).
> 
> Depending on if "not working because of wrong defaults" has bad side effects,
> another option is also to only allow the driver to load on devices which
> have the necessary info provided through a DMI match.

Right now there shouldn't be bad side effects, but in the future we'll
need to setup a PMIC whose output voltages can be controlled, and
getting it wrong would be very bad. For that I'll definitely vote for
DMI match to start with, but I don't think that precludes using data
from ACPI. We could just prevent the driver from loading if the machine
isn't whitelisted in DMI matches, and still use ACPI data.

> I hope this helps.

-- 
Regards,

Laurent Pinchart
