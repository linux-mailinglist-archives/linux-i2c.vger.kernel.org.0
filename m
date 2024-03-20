Return-Path: <linux-i2c+bounces-2460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986E881901
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 22:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F98283799
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 21:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AF385653;
	Wed, 20 Mar 2024 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNCzpwWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76C4F8B2
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 21:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710969719; cv=none; b=Y1ZtD2XygNji/wvgVg/qeIPY2MpI4oDKE5WsRKEj9gMDt2mNod4UzdVQZtA3Vy177z2e4J1stdH3z/js+jGn5GjnKkvRUEY38VhcVcM8tI5OtiI88zVkGskrDX5X6xjAzJh/q+JEp+ytzU+h8McySrecdvP5vBWqvfv/mHgLa8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710969719; c=relaxed/simple;
	bh=s09CN35FbjRL8coBzz3VwTqZ4IWa6RkUFcXp8tm3MEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQrWKAqJdUGxhOU0xCn2hv1UnjcwrVoeKAjKp3gm6UBI1AEtUM7I/Rale0SMOzaAfVrl5XG3O8WktsMYj0OcmJHU6ahj3u9vQJcFtAAf6NX0G9mpsQHNy42aUxRpKi4AQCD0PD3i1WBJAhgHovIEQsnmRXCt+RlpwvRbBLxGIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNCzpwWL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710969718; x=1742505718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s09CN35FbjRL8coBzz3VwTqZ4IWa6RkUFcXp8tm3MEU=;
  b=gNCzpwWLtpAw3NATwTrB561PHpjLAsL6qJU4LwodAXCJ6F7pFZpPzzZs
   pgDQ2JxfAxtONyAThJBY3h0KDwPhWtQhlof8N2mUC2XKFcRagLmQ43i6O
   6wszNhrsmPi4NWE7ihP8PrGOahpzroALm8UaKrKvao1ci/Cczs4yqZ464
   6F4dxBpCLV73teUtRY3YvDLpRpVXupxjUptOqKtMtmkSEnoXbrt7Tk3Ll
   IBKenL5OHZkK9y7VmtTCaUVTXl8H++cgi28YF4mT8jOaeC4GTYnvFSNZ/
   VSQNtcCyIMkZX6M+fW8KkxtabOKnCV8ebRpDbbENqdtDY7C47yYrrQGRz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6105624"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6105624"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 14:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914679423"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="914679423"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 14:21:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rn3Ni-0000000Eh2j-0mGO;
	Wed, 20 Mar 2024 23:21:54 +0200
Date: Wed, 20 Mar 2024 23:21:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZftTcSA5dn13eAmr@smile.fi.intel.com>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 20, 2024 at 11:07:53PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
> > On 20.03.2024 16:59, Andy Shevchenko wrote:
> > > On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:

...

> > >   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> > 
> > pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
> > pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> > pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
> 
> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
> up/down can be enabled.
> 
> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
> the end of .probe:

(Meaning intel_pinctrl_probe() implementation)

> 	{
> 		void __iomem *padcfg0;
> 	        u32 value;
> 
> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);

It might also need

	        guard(raw_spinlock_irqsave)(&pctrl->lock);

just in case.

> 		value = readl(padcfg0);
> 		value |= PADCFG0_GPIOTXDIS;
> 		value |= PADCFG0_GPIORXDIS;
> 		writel(value, padcfg0);
> 	}
> 
> If it helps, it will show the BIOS bug (likely).

-- 
With Best Regards,
Andy Shevchenko



