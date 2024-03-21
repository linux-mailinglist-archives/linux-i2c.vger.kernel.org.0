Return-Path: <linux-i2c+bounces-2473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A27885FD0
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 18:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA26FB20AAD
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 17:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95248131720;
	Thu, 21 Mar 2024 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdcIXp9s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ED317590
	for <linux-i2c@vger.kernel.org>; Thu, 21 Mar 2024 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042443; cv=none; b=qtQby3i4r0f7YaW3lu3HyZI6qGKudeRbe0rR0B6OyilsAr5uw4650zeVfHWIPK6LfQs7HwOtqZOcVVlg3JcYvYZHsk92kwc8wxVDZReO0o0WiC9GiKZ9nQgJpLCOlAp6LZJL/ZIGRcuYgZpNFRxZASspOOBEQdLjup8wSzycnwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042443; c=relaxed/simple;
	bh=cje7qcbhuaX0GPTxwdpDU+ChtqHGE0XD+5Zh74Rnoig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3x9fNmwe86iHh1qA5d4LIn2pdUHj8cEFyEToyPX/KylcGvrIlNLQp2Hy2Xs6xN4uSJny0Xsx41bm92lDmP3qgmzhibrI3yh0Y4Rmln5l7ahbUTFlz60Tj7nyirwJ9LaNWcsE9W7BvwMzUP9wlbcnQ4t8jNf7EoNT5ho1gmrzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdcIXp9s; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711042442; x=1742578442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cje7qcbhuaX0GPTxwdpDU+ChtqHGE0XD+5Zh74Rnoig=;
  b=HdcIXp9sSG/IHTmqAuk3/gSY0nOzUC0+r2SGqzaaDuZwqYnEvWaUOuAq
   x62yoVZdC6VBC5YOXsh6xxGv5GP7yQvWfFG/Ls23B7BkVj3Ep4cl/8b/i
   406/2xcCXq8Sr9FtuP94k65+5aAvTNNepE26k8NeoG5BQ5sHIHjrawlyM
   lpILQx/TqbrGjbfni23/MDB5JkRa9CVU5CkfTkhWJYU8nADzLf9tQgQak
   SyDMNH4vKW8DfyRJlshVmR/ncy3SL7M1B3TvMEiMOC8yP8iIGzFZe35eh
   r0GNtZw2rgDlynHWGmeAQqQiE50pzjZrt2uGTspB1onU+GF3sVVup8ekn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5920167"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5920167"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 10:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914716402"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="914716402"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 10:33:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rnMIf-0000000Ex9S-0EZW;
	Thu, 21 Mar 2024 19:33:57 +0200
Date: Thu, 21 Mar 2024 19:33:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
References: <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 21, 2024 at 12:59:59PM +0100, Heiner Kallweit wrote:
> On 21.03.2024 12:20, Andy Shevchenko wrote:
> > On Wed, Mar 20, 2024 at 10:26:06PM +0100, Heiner Kallweit wrote:
> >> On 20.03.2024 22:07, Andy Shevchenko wrote:
> >>> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
> >>>> On 20.03.2024 16:59, Andy Shevchenko wrote:
> >>>>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:

...

> >>>>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> >>>>
> >>>> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
> >>>> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >>>> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >>>
> >>> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
> >>> up/down can be enabled.
> >>>
> >> Result is the same
> >>
> >>> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
> >>> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
> >>> the end of .probe:
> >>>
> >>> 	{
> >>> 		void __iomem *padcfg0;
> >>> 	        u32 value;
> >>>
> >>> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
> >>>
> >>> 		value = readl(padcfg0);
> >>> 		value |= PADCFG0_GPIOTXDIS;
> >>> 		value |= PADCFG0_GPIORXDIS;
> >>> 		writel(value, padcfg0);
> >>> 	}
> >>>
> >>> If it helps, it will show the BIOS bug (likely).
> >>>
> >> Wow, this indeed fixes the issue for me. Thanks a lot!
> > 
> > Wow! Glad to hear this.
> > (Side note, can you test the patch against idma64 I sent yesterday?
> >  Tested-by tag will be appreciated!)
> > 
> Done, sent the Tested-by

Thank you!

> > We may try to have the quirk in the kernel, but it might be (quite) tricky
> > (see the link below).
> > 
> > Can you share `acpidump -o n100-tables.dat` (the file) somewhere?
> > I would like to see if this pin is anyhow being mentioned in the DSDT.
> > 
> Attached. Compressed file isn't that big, so hope it's ok to send it
> as an attachment.

Yes, got it.

Can you also share the output of

1) `dmesg` (when kernel command line has 'ignore_loglevel apic=debug');
2) `lspci -nk -vv`;
3) `grep -H 15 /sys/bus/acpi/devices/*/status`?

> >> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
> >> GPIO's properly?
> > 
> > Yes, but there are bugs.
> > You may look, e.g., https://bugzilla.kernel.org/show_bug.cgi?id=214749.
> > 
> >> Or better assume that GPIO's are in an unknown state on
> >> driver load and configure them for our needs?
> > 
> > It depends. But usually (> 99% cases) we rely on the firmware.
> > 
> >> IOW: If we assume that other systems may have similar issues, should
> >> "some driver" use e.g. the pinctrl API to configure relevant pins?

-- 
With Best Regards,
Andy Shevchenko



