Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4402FC297
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 22:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbhASViR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 16:38:17 -0500
Received: from mga04.intel.com ([192.55.52.120]:42889 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404220AbhASRwJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 12:52:09 -0500
IronPort-SDR: SddFu7hFUCKoPM3ndfCYlXP3oSkzEJiXpF4y3qseLX2jBr08MvvYeDVosoDdGwmgjCD0QRjV/E
 n5kCfczwxnZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="176398953"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; 
   d="scan'208";a="176398953"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 09:50:17 -0800
IronPort-SDR: NRHLIESoEebePQJ7aIh64Xj3fv2mlDiXkP6Rm6JbqQMfqBaQX/fQVJEZ8JfA0fqMRjK5XKZauq
 tJH0M0Pc9heQ==
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; 
   d="scan'208";a="402440188"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 09:50:12 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1v9u-004ocq-HN; Tue, 19 Jan 2021 19:51:14 +0200
Date:   Tue, 19 Jan 2021 19:51:14 +0200
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
Message-ID: <YAccEtQIBrbKPSmv@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com>
 <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
 <20210119110837.GT4077@smile.fi.intel.com>
 <YAcNT1d5zQHGsoe6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YAcNT1d5zQHGsoe6@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 06:48:15PM +0200, Laurent Pinchart wrote:
> On Tue, Jan 19, 2021 at 01:08:37PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 19, 2021 at 10:40:42AM +0000, Daniel Scally wrote:
> > > On 19/01/2021 09:24, Andy Shevchenko wrote:
> > > >>>>> +static struct i2c_driver int3472_tps68470 = {
> > > >>>>> +	.driver = {
> > > >>>>> +		.name = "int3472-tps68470",
> > > >>>>> +		.acpi_match_table = int3472_device_id,
> > > >>>>> +	},
> > > >>>>> +	.probe_new = skl_int3472_tps68470_probe,
> > > >>>>> +};
> > > >>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
> > > >>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
> > > >>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
> > > >> Sorry, I'm a bit confused by this. The i2c device is already
> > > >> present...we just want the driver to bind to them, so what role do those
> > > >> functions have there?
> > > > What I meant is something like
> > > >
> > > >  *_i2c.c
> > > > 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
> > > > 	involved (and it sounds like it should be mfd/tps one, in which you
> > > > 	just cut out ACPI IDs and convert to pure I²C one, that what I had
> > > > 	suggested in the first place)
> > > 
> > > Ahh; sorry - i misunderstood what you meant there. I understand now I
> > > think, but there is one complication; the ACPI subsystem already creates
> > > a client for that i2c adapter and address; i2c_new_client_device()
> > > includes a check to see whether that adapter / address combination has
> > > an i2c device already.  So we would have to have the platform driver
> > > with ACPI ID first find the existing i2c_client and unregister it before
> > > registering the new one...the existing clients have a name matching the
> > > ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
> > > i2c_device_id of course.
> > 
> > See how INT33FE is being handled. Hint: drivers/acpi/scan.c:~1600
> > 
> > static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
> > 	{"BSG1160", },
> > 	{"BSG2150", },
> > 	{"INT33FE", },
> > 	{"INT3515", },
> > 	{}
> > };
> > 
> > So, we quirklist it here and instantiate manually from platform driver (new
> > coming one).
> 
> This is documented as used for devices that have multiple I2cSerialBus
> resources. That's not the case for the INT3472 as far as I can tell. I
> don't think we should abuse this mechanism.

This is quite a similar case to that one. Let's avoid yak shaving, right?

> Don't forget that the TPS68470 I2C driver needs to be ACPI-aware, as it
> has to register an OpRegion for ACPI-based Chrome OS devices. On other
> platforms (including DT platforms), it should only register regulators,
> clocks and GPIOs. Given the differences between those platforms, I don't
> think a TPS68470 driver that would fake being unaware of being probed
> through ACPI would be a good idea. We can always refactor the code later
> when we'll have a non-ACPI based platform using the TPS68470, without
> such a platform there's no way we can test the I2C driver without ACPI
> anyway.

Are you agree that MFD approach should stay? How then we can manage to have an
MFD driver cohabit with our new driver? I proposed a clean solution which will
handle all possible cases via quirk driver. Having two drivers enumerated by
different scenarios is a call for troubles (we have already with one of that
sensors).

And there is no "faking" anything, it's rather gating it depending on the
platform.

-- 
With Best Regards,
Andy Shevchenko


