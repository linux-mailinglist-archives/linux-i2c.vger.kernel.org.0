Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1D12FC9ED
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 05:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbhATEZF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 23:25:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35560 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729157AbhATEWu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 23:22:50 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A05C813;
        Wed, 20 Jan 2021 05:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611116518;
        bh=xhG0Y3xPv2al0xrkpAKnJ3S/80XPtXaxYvS8LXRwiAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kl20bCBwXdoxZzHIeFzzsb/xpwi/HDn+SJXTa7MWIKPSnl/ljPFChTmea3Krj3XqA
         CVQOhBXlHYmiwNTZLsksFAp3kgGNKUJZNIA7dLn628IvrnrTJcxN8Ju+r6h6kARPIJ
         hyzWsx2NnslhwR1UyQwM+fQva7p1pFKM1vjtZyh4=
Date:   Wed, 20 Jan 2021 06:21:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <YAev1YviLVfEHSg6@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com>
 <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
 <20210119110837.GT4077@smile.fi.intel.com>
 <YAcNT1d5zQHGsoe6@pendragon.ideasonboard.com>
 <YAccEtQIBrbKPSmv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YAccEtQIBrbKPSmv@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Tue, Jan 19, 2021 at 07:51:14PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 19, 2021 at 06:48:15PM +0200, Laurent Pinchart wrote:
> > On Tue, Jan 19, 2021 at 01:08:37PM +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 19, 2021 at 10:40:42AM +0000, Daniel Scally wrote:
> > > > On 19/01/2021 09:24, Andy Shevchenko wrote:
> > > > >>>>> +static struct i2c_driver int3472_tps68470 = {
> > > > >>>>> +	.driver = {
> > > > >>>>> +		.name = "int3472-tps68470",
> > > > >>>>> +		.acpi_match_table = int3472_device_id,
> > > > >>>>> +	},
> > > > >>>>> +	.probe_new = skl_int3472_tps68470_probe,
> > > > >>>>> +};
> > > > >>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
> > > > >>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
> > > > >>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
> > > > >> Sorry, I'm a bit confused by this. The i2c device is already
> > > > >> present...we just want the driver to bind to them, so what role do those
> > > > >> functions have there?
> > > > > What I meant is something like
> > > > >
> > > > >  *_i2c.c
> > > > > 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
> > > > > 	involved (and it sounds like it should be mfd/tps one, in which you
> > > > > 	just cut out ACPI IDs and convert to pure I²C one, that what I had
> > > > > 	suggested in the first place)
> > > > 
> > > > Ahh; sorry - i misunderstood what you meant there. I understand now I
> > > > think, but there is one complication; the ACPI subsystem already creates
> > > > a client for that i2c adapter and address; i2c_new_client_device()
> > > > includes a check to see whether that adapter / address combination has
> > > > an i2c device already.  So we would have to have the platform driver
> > > > with ACPI ID first find the existing i2c_client and unregister it before
> > > > registering the new one...the existing clients have a name matching the
> > > > ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
> > > > i2c_device_id of course.
> > > 
> > > See how INT33FE is being handled. Hint: drivers/acpi/scan.c:~1600
> > > 
> > > static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
> > > 	{"BSG1160", },
> > > 	{"BSG2150", },
> > > 	{"INT33FE", },
> > > 	{"INT3515", },
> > > 	{}
> > > };
> > > 
> > > So, we quirklist it here and instantiate manually from platform driver (new
> > > coming one).
> > 
> > This is documented as used for devices that have multiple I2cSerialBus
> > resources. That's not the case for the INT3472 as far as I can tell. I
> > don't think we should abuse this mechanism.
> 
> This is quite a similar case to that one. Let's avoid yak shaving, right?

Exactly my point, that's why I think this patch is good overall, I don't
think it requires a complete rewrite.

> > Don't forget that the TPS68470 I2C driver needs to be ACPI-aware, as it
> > has to register an OpRegion for ACPI-based Chrome OS devices. On other
> > platforms (including DT platforms), it should only register regulators,
> > clocks and GPIOs. Given the differences between those platforms, I don't
> > think a TPS68470 driver that would fake being unaware of being probed
> > through ACPI would be a good idea. We can always refactor the code later
> > when we'll have a non-ACPI based platform using the TPS68470, without
> > such a platform there's no way we can test the I2C driver without ACPI
> > anyway.
> 
> Are you agree that MFD approach should stay? How then we can manage to have an
> MFD driver cohabit with our new driver? I proposed a clean solution which will
> handle all possible cases via quirk driver. Having two drivers enumerated by
> different scenarios is a call for troubles (we have already with one of that
> sensors).

I think we should solve this problem when it will arise. Solving
problems with complex architectures without a platform to test the code
on is a pretty sure way to get the architecture design wrong. Let's get
this merged, it's an improvement compared to the current situation, and
then let's improve it further on top when we'll need to support more use
cases.

> And there is no "faking" anything, it's rather gating it depending on the
> platform.

-- 
Regards,

Laurent Pinchart
