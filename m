Return-Path: <linux-i2c+bounces-6333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB7A96F901
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 18:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15F181C21FBD
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 16:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7011D31A1;
	Fri,  6 Sep 2024 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8uW2som"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB81D1732
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638711; cv=none; b=oalYx77KnELBg9xbJSZaFe2vqqbKJ2pmVlCQRPbKnX1iQNw7itEq1Ns7NgWEK4TJ+2ph9913oOReg7wKVtNmrsRBEhI8lUKBKGYfvVryEhytGMdcseLoE7Q1TCZJ5SRUau9HMLK8qPVOfLfMnu3/EDXXlbufLzObyH7iaJjSPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638711; c=relaxed/simple;
	bh=NrkvERYnGl4f/Z95GT9t0ayRa6J/uKSqW6ilbwffb10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCrohXv0n607geryvcm35P/igCvVxkXw7aDEo6TJyqvuMru68QWIfEDIlAr0Mo2dZnUnUtgSes3X2H3PsMJ7/H/RgG6942n0FNh0wvZjvGt6luBMtwpU35hYqMhY+/S+eNCf55TwNopajU7bAPUVxbxiK6+/ykW9mIfU4Vmyh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8uW2som; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725638710; x=1757174710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NrkvERYnGl4f/Z95GT9t0ayRa6J/uKSqW6ilbwffb10=;
  b=G8uW2somHs9qH2gDOLeB5RL0vKzg9YXOdveEayNvkGuX3EXcseVGdkBV
   BTxsY00Y63ic9uNDpbqBCB3qf3X1Y33USFKWOOLrMjXQPpcW8KU8zFL3H
   pQIR3ji0Rh40Q/3EKoDZxhoYBFla0M/QB+5EQQzI7+QlH+x8zOFEuDL6O
   6w3b54I/SY1jpNiBclNFRURHClspDmNkmoH7x/SrzpKwzAMlT61JrfXV3
   qYf9VLjwoj0lFZ0VsTfsVa1sn4nkYEgkG+LctyTYApmXX0dXPK8JUeghM
   MSXIJOHfB63+Flh/knv4BaYDza9FspcW8h7jzI68bjDo+5caxUrWMElHf
   g==;
X-CSE-ConnectionGUID: /Yb89ZbFQAiD+wV0vPwNvQ==
X-CSE-MsgGUID: 8oUV+MaETDaPDSl4FkcicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23908573"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="23908573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 09:04:06 -0700
X-CSE-ConnectionGUID: F85P/qMXSzSMCwgGEHF4Zg==
X-CSE-MsgGUID: d+GEOW8zS5uefNeIyhhH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="66740846"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 09:04:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smbRK-00000005rJZ-0JLK;
	Fri, 06 Sep 2024 19:04:02 +0300
Date: Fri, 6 Sep 2024 19:04:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <Ztsn8ZqWjY1P3qws@smile.fi.intel.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
 <Ztr0alsDWrBodtyv@smile.fi.intel.com>
 <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
 <ZtsUZfxeE8Tqf1OD@smile.fi.intel.com>
 <a4525896-8eba-4927-bb18-fcba1432f0e0@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4525896-8eba-4927-bb18-fcba1432f0e0@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 08:41:19PM +0530, Shyam Sundar S K wrote:
> On 9/6/2024 20:10, Andy Shevchenko wrote:
> > On Fri, Sep 06, 2024 at 06:50:48PM +0530, Shyam Sundar S K wrote:
> >> On 9/6/2024 17:54, Andy Shevchenko wrote:
> >>> On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:

...

> >>>> The AMD ASF controller is presented to the operating system as an ACPI
> >>>> device. The piix4 driver can obtain the ASF handle through ACPI to
> >>>> retrieve information about the ASF controller's attributes, such as the
> >>>> ASF address space and interrupt number, and to handle ASF interrupts.
> >>>
> >>> Can you share an excerpt of DSDT to see how it looks like?
> >>
> >> Device (ASFC)
> >> {
> >> 	...
> > 
> > Can you put the necessary bits for the enumeration (you may replace some IDs if
> > they are not public yet to something like XX..XX or xx..xx)?
> 
> Name (_HID, "AMDIXXXX")  // _HID: Hardware ID
> Name (_UID, Zero)  // _UID: Unique ID

Thank you!

Now a question, why your case can't have a separate (platform) device driver?

> >>     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> >>     {
> >>         Name (ASBB, ResourceTemplate ()
> >>         {
> >>             Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
> >>             {
> >>                 0x00000014,
> >>             }
> >>             IO (Decode16,
> >>                 0x0B20,             // Range Minimum
> >>                 0x0B20,             // Range Maximum
> > 
> > Typo in value? Shouldn't this be 0x0b3f?
> 
> Its is 0xb20, that is meant for ASF.

Yes, I mixed up IO() vs. Memory*() resource. The IO() has two values for
the start address and you fixed that to the above mentioned value.

TL;DR: this looks okay.

> >>                 0x00,               // Alignment
> >>                 0x20,               // Length
> >>                 )
> >>             Memory32Fixed (ReadWrite,
> >>                 0xFEC00040,         // Address Base
> >>                 0x00000100,         // Address Length
> >>                 )
> >>         })
> >>         Return (ASBB) /* \_SB_.ASFC._CRS.ASBB */
> >>     }
> >> 	...
> >> }

...

> >>>> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
> >>>> +	if (ACPI_FAILURE(status))
> >>>> +		return -ENODEV;
> >>>> +
> >>>> +	adev = acpi_fetch_acpi_dev(handle);
> >>>> +	if (!adev)
> >>>> +		return -ENODEV;
> >>>
> >>> This approach I don't like. I would like to see DSDT for that
> >>> as I mentioned above.
> >>
> >> I have posted the DSDT. Can you please elaborate your remarks?
> > 
> > Not that parts that affect this...
> 
> Alright, I have posted the _HID enumeration details above. Please let
> me know if using acpi_fetch_acpi_dev() is acceptable or if there's a
> better alternative.

> I am open to making changes based on these clarifications.

Since you have a proper Device object in ACPI, it seems to me that you should
do other way around, i.e. having a platform device driver for this ACPI device
(based on _HID) and use piix4 as a library for it.

-- 
With Best Regards,
Andy Shevchenko



