Return-Path: <linux-i2c+bounces-2734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB45895DFD
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 22:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52FD2B28EDA
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 20:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE71015E1F3;
	Tue,  2 Apr 2024 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N24xqlQF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08D15B542
	for <linux-i2c@vger.kernel.org>; Tue,  2 Apr 2024 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712090815; cv=none; b=MBe9sCg5nAtEUJbRw6RDQ+682cV/RN8ImIEhjXJH/3Br7A+2lRmxJWZqqdBp1KXSada7ejKAa+Uz5q3Vw+4484jYbZpk0g8TarMzMtsnfHdrh84jnLifJ+pVVZOfHLj/HKP0+jjdfxE6nreEq5z0/l430XTjASpdXnrco2bYuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712090815; c=relaxed/simple;
	bh=ja6nFYQF0p3qiXQtFBwJW7UJj1OtpcscrrYDD0+2nZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BriHYhSOfodBuVpVC4FUQ7iePyEyzHD6uKM4aN2D5Oqzr7OsEuYeDpSNcG7mTfgBb/Hx6Pb9127H/6NXrMiINE1XwRRWFuAmIoJ3kvjdlfx2YlnqpPT7zIcBauVkNQefwL2dnC4niBAu9CvuBhrMOv+7c7OQLjX/qdwskHB+2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N24xqlQF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712090814; x=1743626814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ja6nFYQF0p3qiXQtFBwJW7UJj1OtpcscrrYDD0+2nZE=;
  b=N24xqlQFB96wrFEy4pOn0bAGh2FZYjm1TJOcNivT8K1eJgpuWnSSeQ75
   dnQyK7Z+jlWDxEne3/PdhgUVM9X+uyy8P0NEyEvXsBUNR9KkcQGcpRKHn
   uTeYVhCsSnKwCMMn6GJZtelSwLQ3fC5gJPO/1/wWTFeIBXu65Os7lrzUp
   XqnlLXAPknxVeZ939aYVXT/bYzILoOrw1CBhG9R8S6l12QMYTp/qftsV7
   pmvs69Cvk2JEI40JcpTeT1zcc0AZpaZrPf8WMmzB7q0Ic7w0mRnvPs0v6
   Cnqf9FbatTZY9yrSz+i2WIs6Gbo+n8Gk2qvv+MSmVP+5kfcE54DRnU1G2
   w==;
X-CSE-ConnectionGUID: Jc4Pny/uQZubZpBqTeA0WQ==
X-CSE-MsgGUID: ekyymLdIQ1CtWPysZcO2Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7159040"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7159040"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 13:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915153547"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="915153547"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 13:46:52 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rrl1t-00000000vw0-37nv;
	Tue, 02 Apr 2024 23:46:49 +0300
Date: Tue, 2 Apr 2024 23:46:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZgxuubE3MZbZDlOj@smile.fi.intel.com>
References: <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
 <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
 <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
 <Zf2vVsiW2KCEQU-U@smile.fi.intel.com>
 <2cc45e8e-558d-4e7b-a370-1187bac939fa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cc45e8e-558d-4e7b-a370-1187bac939fa@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 22, 2024 at 08:28:08PM +0100, Heiner Kallweit wrote:
> On 22.03.2024 17:18, Andy Shevchenko wrote:
> > On Thu, Mar 21, 2024 at 10:00:27PM +0100, Heiner Kallweit wrote:
> >> On 21.03.2024 18:33, Andy Shevchenko wrote:
> >>> On Thu, Mar 21, 2024 at 12:59:59PM +0100, Heiner Kallweit wrote:
> >>>> On 21.03.2024 12:20, Andy Shevchenko wrote:
> >>>>> On Wed, Mar 20, 2024 at 10:26:06PM +0100, Heiner Kallweit wrote:
> >>>>>> On 20.03.2024 22:07, Andy Shevchenko wrote:
> >>>>>>> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
> >>>>>>>> On 20.03.2024 16:59, Andy Shevchenko wrote:
> >>>>>>>>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:

...

> >>>>>>>>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> >>>>>>>>
> >>>>>>>> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
> >>>>>>>> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >>>>>>>> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >>>>>>>
> >>>>>>> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
> >>>>>>> up/down can be enabled.
> >>>>>>>
> >>>>>> Result is the same
> >>>>>>
> >>>>>>> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
> >>>>>>> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
> >>>>>>> the end of .probe:
> >>>>>>>
> >>>>>>> 	{
> >>>>>>> 		void __iomem *padcfg0;
> >>>>>>> 	        u32 value;
> >>>>>>>
> >>>>>>> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
> >>>>>>>
> >>>>>>> 		value = readl(padcfg0);
> >>>>>>> 		value |= PADCFG0_GPIOTXDIS;
> >>>>>>> 		value |= PADCFG0_GPIORXDIS;
> >>>>>>> 		writel(value, padcfg0);
> >>>>>>> 	}
> >>>>>>>
> >>>>>>> If it helps, it will show the BIOS bug (likely).
> >>>>>>>
> >>>>>> Wow, this indeed fixes the issue for me. Thanks a lot!
> >>>>>
> >>>>> Wow! Glad to hear this.
> >>>>> (Side note, can you test the patch against idma64 I sent yesterday?
> >>>>>  Tested-by tag will be appreciated!)
> >>>>>
> >>>> Done, sent the Tested-by
> >>>
> >>> Thank you!
> >>>
> >>>>> We may try to have the quirk in the kernel, but it might be (quite) tricky
> >>>>> (see the link below).
> >>>>>
> >>>>> Can you share `acpidump -o n100-tables.dat` (the file) somewhere?
> >>>>> I would like to see if this pin is anyhow being mentioned in the DSDT.
> >>>>>
> >>>> Attached. Compressed file isn't that big, so hope it's ok to send it
> >>>> as an attachment.
> >>>
> >>> Yes, got it.
> >>>
> >>> Can you also share the output of
> >>>
> >>> 1) `dmesg` (when kernel command line has 'ignore_loglevel apic=debug');
> >> attached
> >>> 2) `lspci -nk -vv`;
> >> attached
> >>> 3) `grep -H 15 /sys/bus/acpi/devices/*/status`?
> >>>
> >> /sys/bus/acpi/devices/ACPI0003:00/status:15
> >> /sys/bus/acpi/devices/ACPI000C:00/status:15
> >> /sys/bus/acpi/devices/ACPI000E:00/status:15
> >> /sys/bus/acpi/devices/device:4a/status:15
> >> /sys/bus/acpi/devices/device:86/status:15
> >> /sys/bus/acpi/devices/device:87/status:15
> >> /sys/bus/acpi/devices/device:88/status:15
> >> /sys/bus/acpi/devices/device:8a/status:15
> >> /sys/bus/acpi/devices/device:8b/status:15
> >> /sys/bus/acpi/devices/device:8c/status:15
> >> /sys/bus/acpi/devices/INT33A1:00/status:15
> >> /sys/bus/acpi/devices/INTC1041:00/status:15
> >> /sys/bus/acpi/devices/INTC1048:00/status:15
> >> /sys/bus/acpi/devices/INTC1057:00/status:15
> >> /sys/bus/acpi/devices/INTC1070:00/status:15
> >> /sys/bus/acpi/devices/INTC1099:00/status:15
> >> /sys/bus/acpi/devices/MSFT0001:00/status:15
> >> /sys/bus/acpi/devices/OVTI01AS:00/status:15
> >> /sys/bus/acpi/devices/OVTID858:00/status:15
> >> /sys/bus/acpi/devices/PNP0103:00/status:15
> >> /sys/bus/acpi/devices/PNP0C09:00/status:15
> >> /sys/bus/acpi/devices/PNP0C0C:00/status:15
> >> /sys/bus/acpi/devices/PNP0C0D:00/status:15
> >> /sys/bus/acpi/devices/PRP00001:00/status:15
> >> /sys/bus/acpi/devices/TXNW3643:00/status:15
> >> /sys/bus/acpi/devices/TXNW3643:01/status:15
> > 
> > Can you also add this
> > 
> >  grep -H 15 /sys/bus/acpi/devices/*/status | while read x; do grep -H . `dirname $x`/path; done
> > 
> 
> /sys/bus/acpi/devices/ACPI0003:00/path:\_SB_.ADP1
> /sys/bus/acpi/devices/ACPI000C:00/path:\_SB_.PAGD
> /sys/bus/acpi/devices/ACPI000E:00/path:\_SB_.AWAC
> /sys/bus/acpi/devices/device:4a/path:\_SB_.PC00.TCPU
> /sys/bus/acpi/devices/device:86/path:\_SB_.PC00.THC0.TLC1
> /sys/bus/acpi/devices/device:87/path:\_SB_.PC00.THC0.TLC2
> /sys/bus/acpi/devices/device:88/path:\_SB_.PC00.THC0.TLC3
> /sys/bus/acpi/devices/device:8a/path:\_SB_.PC00.THC1.TLC1
> /sys/bus/acpi/devices/device:8b/path:\_SB_.PC00.THC1.TLC2
> /sys/bus/acpi/devices/device:8c/path:\_SB_.PC00.THC1.TLC3
> /sys/bus/acpi/devices/INT33A1:00/path:\_SB_.PEPD
> /sys/bus/acpi/devices/INTC1041:00/path:\_SB_.IETM
> /sys/bus/acpi/devices/INTC1048:00/path:\_SB_.PC00.LPCB.H_EC.TFN1
> /sys/bus/acpi/devices/INTC1057:00/path:\_SB_.GPI0
> /sys/bus/acpi/devices/INTC1070:00/path:\_SB_.HIDD
> /sys/bus/acpi/devices/INTC1099:00/path:\_SB_.PC00.LPCB.CWDT
> /sys/bus/acpi/devices/MSFT0001:00/path:\_SB_.PC00.LPCB.PS2K
> /sys/bus/acpi/devices/OVTI01AS:00/path:\_SB_.PC00.LNK0
> /sys/bus/acpi/devices/OVTID858:00/path:\_SB_.PC00.LNK1
> /sys/bus/acpi/devices/PNP0103:00/path:\_SB_.PC00.LPCB.HPET
> /sys/bus/acpi/devices/PNP0C09:00/path:\_SB_.PC00.LPCB.H_EC
> /sys/bus/acpi/devices/PNP0C0C:00/path:\_SB_.PWRB
> /sys/bus/acpi/devices/PNP0C0D:00/path:\_SB_.PC00.LPCB.H_EC.LID0
> /sys/bus/acpi/devices/PRP00001:00/path:\_SB_.PC00.HDAS.IDA_.SNDW
> /sys/bus/acpi/devices/TXNW3643:00/path:\_SB_.PC00.FLM0
> /sys/bus/acpi/devices/TXNW3643:01/path:\_SB_.PC00.FLM1

Okay, from these and DSDT I see no active device using GPIO from DSDT.
So, the behaviour you have is definitely is a BIOS bug.

Let me and maybe others think if we can to work this around in the kernel
and if so, how.

> > ?
> > 
> >>>>>> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
> >>>>>> GPIO's properly?
> >>>>>
> >>>>> Yes, but there are bugs.
> >>>>> You may look, e.g., https://bugzilla.kernel.org/show_bug.cgi?id=214749.
> >>>>>
> >>>>>> Or better assume that GPIO's are in an unknown state on
> >>>>>> driver load and configure them for our needs?
> >>>>>
> >>>>> It depends. But usually (> 99% cases) we rely on the firmware.
> >>>>>
> >>>>>> IOW: If we assume that other systems may have similar issues, should
> >>>>>> "some driver" use e.g. the pinctrl API to configure relevant pins?

-- 
With Best Regards,
Andy Shevchenko



