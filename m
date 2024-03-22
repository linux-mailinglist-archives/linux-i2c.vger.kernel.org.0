Return-Path: <linux-i2c+bounces-2557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA26A8870C2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E795C1C2262F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F375820C;
	Fri, 22 Mar 2024 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RP2sSWZj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F409B41C6A
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711124316; cv=none; b=IMn0bFLJehB0tYqVEtfs0XG2SKEVOhJYJr5ndXqd82GDL4Xhw2kVgEbzwgK5trD5WtcDmHrlUE3PLEeSwNUtcQkGwX2PUtuP70k3A18BCoxq9f3mp8RWvKZU8H78aQJ0wn6D+iioq0atZKOFoeYQNrS/xxnBVRgx5sIatSqJs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711124316; c=relaxed/simple;
	bh=lI8yEmZbFn6Hr4/B6+HP2RZgE/rFp2hbI9KAUoBx/C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pf8Yd59wDE4WjW5NvRNtYcNV80SpdF2UL4ZIydYheXZA7PhUI4fYo0vZOvyixF6iK3jCQHrVE0emHQUpIniTtZtMM/EWR6V4Jrm0I8+RCPC9RnOkKykQNESh9A6+W+Bb8B4a7wqb3ozQFyCPi2nr96HTDcZyrSB6nD+OdhuNVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RP2sSWZj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711124315; x=1742660315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lI8yEmZbFn6Hr4/B6+HP2RZgE/rFp2hbI9KAUoBx/C0=;
  b=RP2sSWZjx9fZJ8IT9QFbh6XHPuxgozO2rNKb3QhTqeBptttxdJbGV3xS
   vzodKjUxnxkiM5qy3Wmh9CUJf+I3Mf6xwtJcm7Y2qusBnNHBDdYqvhNJR
   DIkjsGi/wpq5Ck00MU3rprJoEo+Va33zeGZyuFY1pJmDyICPlmynCgYbV
   tmCHsk6ijuiz95n+C6VSSWZdsj7+MSQKzDef5jL0pMacCAE8k1Qvt9P68
   aiJz/CvmRaRZ8u2nZPEA54i3YUMs29ZDXQt2UsKt78DzglVJw+Muaohx6
   KhzRGyxVzCmIq6RcfLx//vkR2PtLGYoq6TsAfu1u7RBVBHvScmqyJXf3R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6081413"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6081413"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914748197"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914748197"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:18:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rnhbC-0000000FCaV-1PK9;
	Fri, 22 Mar 2024 18:18:30 +0200
Date: Fri, 22 Mar 2024 18:18:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <Zf2vVsiW2KCEQU-U@smile.fi.intel.com>
References: <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
 <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
 <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 21, 2024 at 10:00:27PM +0100, Heiner Kallweit wrote:
> On 21.03.2024 18:33, Andy Shevchenko wrote:
> > On Thu, Mar 21, 2024 at 12:59:59PM +0100, Heiner Kallweit wrote:
> >> On 21.03.2024 12:20, Andy Shevchenko wrote:
> >>> On Wed, Mar 20, 2024 at 10:26:06PM +0100, Heiner Kallweit wrote:
> >>>> On 20.03.2024 22:07, Andy Shevchenko wrote:
> >>>>> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
> >>>>>> On 20.03.2024 16:59, Andy Shevchenko wrote:
> >>>>>>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:

...

> >>>>>>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> >>>>>>
> >>>>>> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
> >>>>>> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >>>>>> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >>>>>
> >>>>> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
> >>>>> up/down can be enabled.
> >>>>>
> >>>> Result is the same
> >>>>
> >>>>> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
> >>>>> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
> >>>>> the end of .probe:
> >>>>>
> >>>>> 	{
> >>>>> 		void __iomem *padcfg0;
> >>>>> 	        u32 value;
> >>>>>
> >>>>> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
> >>>>>
> >>>>> 		value = readl(padcfg0);
> >>>>> 		value |= PADCFG0_GPIOTXDIS;
> >>>>> 		value |= PADCFG0_GPIORXDIS;
> >>>>> 		writel(value, padcfg0);
> >>>>> 	}
> >>>>>
> >>>>> If it helps, it will show the BIOS bug (likely).
> >>>>>
> >>>> Wow, this indeed fixes the issue for me. Thanks a lot!
> >>>
> >>> Wow! Glad to hear this.
> >>> (Side note, can you test the patch against idma64 I sent yesterday?
> >>>  Tested-by tag will be appreciated!)
> >>>
> >> Done, sent the Tested-by
> > 
> > Thank you!
> > 
> >>> We may try to have the quirk in the kernel, but it might be (quite) tricky
> >>> (see the link below).
> >>>
> >>> Can you share `acpidump -o n100-tables.dat` (the file) somewhere?
> >>> I would like to see if this pin is anyhow being mentioned in the DSDT.
> >>>
> >> Attached. Compressed file isn't that big, so hope it's ok to send it
> >> as an attachment.
> > 
> > Yes, got it.
> > 
> > Can you also share the output of
> > 
> > 1) `dmesg` (when kernel command line has 'ignore_loglevel apic=debug');
> attached
> > 2) `lspci -nk -vv`;
> attached
> > 3) `grep -H 15 /sys/bus/acpi/devices/*/status`?
> > 
> /sys/bus/acpi/devices/ACPI0003:00/status:15
> /sys/bus/acpi/devices/ACPI000C:00/status:15
> /sys/bus/acpi/devices/ACPI000E:00/status:15
> /sys/bus/acpi/devices/device:4a/status:15
> /sys/bus/acpi/devices/device:86/status:15
> /sys/bus/acpi/devices/device:87/status:15
> /sys/bus/acpi/devices/device:88/status:15
> /sys/bus/acpi/devices/device:8a/status:15
> /sys/bus/acpi/devices/device:8b/status:15
> /sys/bus/acpi/devices/device:8c/status:15
> /sys/bus/acpi/devices/INT33A1:00/status:15
> /sys/bus/acpi/devices/INTC1041:00/status:15
> /sys/bus/acpi/devices/INTC1048:00/status:15
> /sys/bus/acpi/devices/INTC1057:00/status:15
> /sys/bus/acpi/devices/INTC1070:00/status:15
> /sys/bus/acpi/devices/INTC1099:00/status:15
> /sys/bus/acpi/devices/MSFT0001:00/status:15
> /sys/bus/acpi/devices/OVTI01AS:00/status:15
> /sys/bus/acpi/devices/OVTID858:00/status:15
> /sys/bus/acpi/devices/PNP0103:00/status:15
> /sys/bus/acpi/devices/PNP0C09:00/status:15
> /sys/bus/acpi/devices/PNP0C0C:00/status:15
> /sys/bus/acpi/devices/PNP0C0D:00/status:15
> /sys/bus/acpi/devices/PRP00001:00/status:15
> /sys/bus/acpi/devices/TXNW3643:00/status:15
> /sys/bus/acpi/devices/TXNW3643:01/status:15

Can you also add this

 grep -H 15 /sys/bus/acpi/devices/*/status | while read x; do grep -H . `dirname $x`/path; done

?

> >>>> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
> >>>> GPIO's properly?
> >>>
> >>> Yes, but there are bugs.
> >>> You may look, e.g., https://bugzilla.kernel.org/show_bug.cgi?id=214749.
> >>>
> >>>> Or better assume that GPIO's are in an unknown state on
> >>>> driver load and configure them for our needs?
> >>>
> >>> It depends. But usually (> 99% cases) we rely on the firmware.
> >>>
> >>>> IOW: If we assume that other systems may have similar issues, should
> >>>> "some driver" use e.g. the pinctrl API to configure relevant pins?

-- 
With Best Regards,
Andy Shevchenko



