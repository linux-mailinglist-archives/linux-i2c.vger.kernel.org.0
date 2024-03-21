Return-Path: <linux-i2c+bounces-2465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8E88581A
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 12:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0FE0282F56
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 11:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498125820E;
	Thu, 21 Mar 2024 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ndoq/yBe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27641A91
	for <linux-i2c@vger.kernel.org>; Thu, 21 Mar 2024 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020023; cv=none; b=b6rURmx3oepFctxZpAz4GpXGR4oxR8Fr43cjb3N7bqVJuwDkrgqndMo++KRNtgMzZggDIfNT79Ylm5/wr8hIXw8ICL3DAVhMPxg9S3Dv+hcAXklI3JV9Bft6E47pgIN4zqXFFlh9PWrrePZVCQCvMMvCNSgQ2pWLrVua+Dzsmw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020023; c=relaxed/simple;
	bh=PLG/RyMYgYSSoVdUJvEnlRgcDX8x49S5Wte0Ad4LTZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAWDInX7CwZ6KumRSc859/ZRHeuoULft+roHtkrf+lW1V0ddNcZm039/BvEzaOVw3VvnJ+v2+UB6re00D+RhTfwhWw42kbIOoje5oEbfWuYwN9TtebJOFdJe9xewMM5Krg/OJ8ZdI4mZS6tFtDL9qRNinibtj0nfI7KKLZuvcQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ndoq/yBe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711020021; x=1742556021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PLG/RyMYgYSSoVdUJvEnlRgcDX8x49S5Wte0Ad4LTZw=;
  b=Ndoq/yBeESGGoQBMMKFFZnQ8N1nGvcsJWCTXCOUTWmr194n1lQZiyD2H
   uhVBTbLgNAwQdzUumGo7cOEZgDYKRKw4MvzZX4dM61bXqCGjzRArM295R
   L5abZAfKRJDpFefBOX95/4vL1MecioNHzMKLxPAqi3AoLIBXvbvSiAGn5
   nq9RlIhMR73BP4xhGQVKDFN8mJYvRpP2oG5fnrlhPCX4enjphs8BaWWWB
   DVwbGbwP5V0rMPRSMluvVbrs+8F9T/ee0xbmK4ji5VLJY0vpwNqFXV3tm
   D0bA1KderSs7luy7ajWi4SRTDQFABsoDrG6oe5KaOswppArPsrFKDqsAe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23497049"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="23497049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914704265"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="914704265"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:20:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rnGT3-0000000EqYw-1TNw;
	Thu, 21 Mar 2024 13:20:17 +0200
Date: Thu, 21 Mar 2024 13:20:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 20, 2024 at 10:26:06PM +0100, Heiner Kallweit wrote:
> On 20.03.2024 22:07, Andy Shevchenko wrote:
> > On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
> >> On 20.03.2024 16:59, Andy Shevchenko wrote:
> >>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:

...

> >>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> >>
> >> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
> >> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> >> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> > 
> > I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
> > up/down can be enabled.
> > 
> Result is the same
> 
> > Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
> > RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
> > the end of .probe:
> > 
> > 	{
> > 		void __iomem *padcfg0;
> > 	        u32 value;
> > 
> > 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
> > 
> > 		value = readl(padcfg0);
> > 		value |= PADCFG0_GPIOTXDIS;
> > 		value |= PADCFG0_GPIORXDIS;
> > 		writel(value, padcfg0);
> > 	}
> > 
> > If it helps, it will show the BIOS bug (likely).
> > 
> Wow, this indeed fixes the issue for me. Thanks a lot!

Wow! Glad to hear this.
(Side note, can you test the patch against idma64 I sent yesterday?
 Tested-by tag will be appreciated!)

We may try to have the quirk in the kernel, but it might be (quite) tricky
(see the link below).

Can you share `acpidump -o n100-tables.dat` (the file) somewhere?
I would like to see if this pin is anyhow being mentioned in the DSDT.

> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
> GPIO's properly?

Yes, but there are bugs.
You may look, e.g., https://bugzilla.kernel.org/show_bug.cgi?id=214749.

> Or better assume that GPIO's are in an unknown state on
> driver load and configure them for our needs?

It depends. But usually (> 99% cases) we rely on the firmware.

> IOW: If we assume that other systems may have similar issues, should
> "some driver" use e.g. the pinctrl API to configure relevant pins?


-- 
With Best Regards,
Andy Shevchenko



