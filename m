Return-Path: <linux-i2c+bounces-2459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E21948818EE
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 22:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96DC51F21648
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 21:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440DC80621;
	Wed, 20 Mar 2024 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1+UXI2a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0F224F2
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710968881; cv=none; b=YFuSEfkTtqk0kxliQSlK2w4hIZzDrlSXD57rYNYqHuRhMbKpogiHI+tfahiUPFi4PYU3tpvLF9P0fBVskslBQyzU6NospdOLulRkvqJP085jn5Fg15r/AxlNcSSTNI9TtgI9Zg3hU4NKrzUEFW78nDxKOoXbqcWR5HX6KDNer0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710968881; c=relaxed/simple;
	bh=fhkCAn+DMd3n4Xd0S+AeZ4IWtz6cPOMENjVdl47mWBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDjUKyhgrfseUEGRUUPvA0Huj0+JjR1bJATb4rwUKYYGv23eAt1JDYCmOzxugVO/tY11SrUs5NRAcDIpDmCnWl2GawwSva+42VWMDSUSAS+AXK83dTDkS+1r7KbXixDDvBIoB9mE2B3iF8wPuCqlFfsqCxdIZVGvNHx2h7dcKBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1+UXI2a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710968879; x=1742504879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhkCAn+DMd3n4Xd0S+AeZ4IWtz6cPOMENjVdl47mWBA=;
  b=I1+UXI2aHkmJbnenh3aqQpbMCjoEIpj4bfEhghsI4tln3Xlb/Ouow61O
   2X5BzkOHEaAd3v1MvbAi/0Q6aUwX9uBEKxJNqxJRE8b8mVfl4neeacy3f
   tID+Jp9/BU9thRC0d4pEA7x6yxQ0Z4QBmi7pyIMh3vf74WdSjT8vfDR5P
   h6iKxinD6iUZ9wi5jMgap7G5XIktNMMM6qZM0A/YF9mDprpdkR9nEJW40
   Wu3IbeJ+bjOZ61h4JxGxMeTU1z6LibL5vVBxjrh5LRXXXYcjY7719soCM
   sujpT9KZQMl+CoTkuiB7oIf766tZtMnu5OC1iwWcMfuRnjoDqZ55KywH2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6104242"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6104242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 14:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914679049"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="914679049"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 14:07:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rn3A9-0000000Egst-2Jtg;
	Wed, 20 Mar 2024 23:07:53 +0200
Date: Wed, 20 Mar 2024 23:07:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
> On 20.03.2024 16:59, Andy Shevchenko wrote:
> > On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:

...

> >   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> 
> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]

I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
up/down can be enabled.

Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
the end of .probe:

	{
		void __iomem *padcfg0;
	        u32 value;

		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);

		value = readl(padcfg0);
		value |= PADCFG0_GPIOTXDIS;
		value |= PADCFG0_GPIORXDIS;
		writel(value, padcfg0);
	}

If it helps, it will show the BIOS bug (likely).

-- 
With Best Regards,
Andy Shevchenko



