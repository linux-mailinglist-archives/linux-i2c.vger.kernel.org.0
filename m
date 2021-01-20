Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260C72FD212
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 14:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbhATNxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jan 2021 08:53:04 -0500
Received: from mga07.intel.com ([134.134.136.100]:26813 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388785AbhATM6w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Jan 2021 07:58:52 -0500
IronPort-SDR: a16MObkPOgydVTtVtVn4sM3NMfNjZeDoh+63rUHnmjQmOm0Wm4QkCuVAEg/gD0CFioFNXcowF2
 JvTe+hZkEphA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="243168906"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="243168906"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 04:56:58 -0800
IronPort-SDR: E3+DqvOKS99F18AO9ed7Ig/CTmbzFRmG4z7PEc2gZkB40x9L2sX9NZvSvQK14js++SPQenII19
 EhuidwvK1I+w==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="351036000"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 04:56:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2D3b-006A5X-GZ; Wed, 20 Jan 2021 14:57:55 +0200
Date:   Wed, 20 Jan 2021 14:57:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <YAgo06hhlael1/rm@smile.fi.intel.com>
References: <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com>
 <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
 <20210119110837.GT4077@smile.fi.intel.com>
 <YAcNT1d5zQHGsoe6@pendragon.ideasonboard.com>
 <YAccEtQIBrbKPSmv@smile.fi.intel.com>
 <YAev1YviLVfEHSg6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YAev1YviLVfEHSg6@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 20, 2021 at 06:21:41AM +0200, Laurent Pinchart wrote:
> On Tue, Jan 19, 2021 at 07:51:14PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 19, 2021 at 06:48:15PM +0200, Laurent Pinchart wrote:
> > > On Tue, Jan 19, 2021 at 01:08:37PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Jan 19, 2021 at 10:40:42AM +0000, Daniel Scally wrote:
> > > > > On 19/01/2021 09:24, Andy Shevchenko wrote:
> > > > > >>>>> +static struct i2c_driver int3472_tps68470 = {
> > > > > >>>>> +	.driver = {
> > > > > >>>>> +		.name = "int3472-tps68470",
> > > > > >>>>> +		.acpi_match_table = int3472_device_id,
> > > > > >>>>> +	},
> > > > > >>>>> +	.probe_new = skl_int3472_tps68470_probe,
> > > > > >>>>> +};
> > > > > >>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
> > > > > >>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
> > > > > >>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
> > > > > >> Sorry, I'm a bit confused by this. The i2c device is already
> > > > > >> present...we just want the driver to bind to them, so what role do those
> > > > > >> functions have there?
> > > > > > What I meant is something like
> > > > > >
> > > > > >  *_i2c.c
> > > > > > 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
> > > > > > 	involved (and it sounds like it should be mfd/tps one, in which you
> > > > > > 	just cut out ACPI IDs and convert to pure I²C one, that what I had
> > > > > > 	suggested in the first place)
> > > > > 
> > > > > Ahh; sorry - i misunderstood what you meant there. I understand now I
> > > > > think, but there is one complication; the ACPI subsystem already creates
> > > > > a client for that i2c adapter and address; i2c_new_client_device()
> > > > > includes a check to see whether that adapter / address combination has
> > > > > an i2c device already.  So we would have to have the platform driver
> > > > > with ACPI ID first find the existing i2c_client and unregister it before
> > > > > registering the new one...the existing clients have a name matching the
> > > > > ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
> > > > > i2c_device_id of course.
> > > > 
> > > > See how INT33FE is being handled. Hint: drivers/acpi/scan.c:~1600
> > > > 
> > > > static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
> > > > 	{"BSG1160", },
> > > > 	{"BSG2150", },
> > > > 	{"INT33FE", },
> > > > 	{"INT3515", },
> > > > 	{}
> > > > };
> > > > 
> > > > So, we quirklist it here and instantiate manually from platform driver (new
> > > > coming one).
> > > 
> > > This is documented as used for devices that have multiple I2cSerialBus
> > > resources. That's not the case for the INT3472 as far as I can tell. I
> > > don't think we should abuse this mechanism.
> > 
> > This is quite a similar case to that one. Let's avoid yak shaving, right?
> 
> Exactly my point, that's why I think this patch is good overall, I don't
> think it requires a complete rewrite.

The approach in the series is to reinvent the MFD driver which I against of.
I don;t think we need to kill it there and reborn in a new form and dragging
code from there to here to there.

On top of that the approach with a quirk driver in the middle seems to me
cleaner than using different paths how the two drivers are being initialized.
In the proposed approach there will be one making decision point and easy to
understand what's going on.

The bad example of two making decision points is acpi_lpss.c vs. individual
drivers (however in that case it have different ID's, i.e. ACPI vs. PCI),

> > > Don't forget that the TPS68470 I2C driver needs to be ACPI-aware, as it
> > > has to register an OpRegion for ACPI-based Chrome OS devices. On other
> > > platforms (including DT platforms), it should only register regulators,
> > > clocks and GPIOs. Given the differences between those platforms, I don't
> > > think a TPS68470 driver that would fake being unaware of being probed
> > > through ACPI would be a good idea. We can always refactor the code later
> > > when we'll have a non-ACPI based platform using the TPS68470, without
> > > such a platform there's no way we can test the I2C driver without ACPI
> > > anyway.
> > 
> > Are you agree that MFD approach should stay? How then we can manage to have an
> > MFD driver cohabit with our new driver? I proposed a clean solution which will
> > handle all possible cases via quirk driver. Having two drivers enumerated by
> > different scenarios is a call for troubles (we have already with one of that
> > sensors).
> 
> I think we should solve this problem when it will arise. Solving
> problems with complex architectures without a platform to test the code
> on is a pretty sure way to get the architecture design wrong. Let's get
> this merged, it's an improvement compared to the current situation, and
> then let's improve it further on top when we'll need to support more use
> cases.

But this is problem already here right now. The submitted code is to support
a new platform that needs a quirk and treats INT3472 differently. The usual
way is to refactor the existing solution to make them both to have a best
compromise.

> > And there is no "faking" anything, it's rather gating it depending on the
> > platform.

-- 
With Best Regards,
Andy Shevchenko


