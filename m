Return-Path: <linux-i2c+bounces-2782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB689A208
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 18:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFF96B21566
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 16:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE60416FF5E;
	Fri,  5 Apr 2024 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4f+xWWM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BD116FF4A
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712332880; cv=none; b=NZ7pZ0Ue5YPh7ejttnbY1MqDp7RzmcIrmEC/JntI84fnh2M7Rm76r6plOiZGpOw9jWz7QEM92yrADs2tcTRiAegjgMXFpNJEn2IQYq5Plo0hxE6GsQ++O3ff1kABRCT4aEvOBbhyYScWSqH7l42vMQp/b5DHaQlNjnw+wvY2+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712332880; c=relaxed/simple;
	bh=fPEsrtHuwMwKpdHkp/NVB9GGUYVyyPI6regPyz+cHEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLUAJ7+Qp7z18YZ8AoUp0fYZZRrha4cgvreF4FhGGixXp8u0bmA1OhW77LrSUQapd3+mQajkT2oWj0PEMKcX4WrW+0iNnNHk+BkfY9tzM7mUFVbkBYX9Jp6BFH3I0yBVIyv5Nv/PdaqNrXRms0ycMJw1jolKwCJvtVPRe2pVF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4f+xWWM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712332879; x=1743868879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fPEsrtHuwMwKpdHkp/NVB9GGUYVyyPI6regPyz+cHEM=;
  b=K4f+xWWMTG6avkcreeVYgEk7/OnctOkwCz3a4XBjCLcbydvaG9qsBzrG
   dnh3CWQwJQ9t1ymBdrYhrcYWqSTmrfNGhV0oALZSYV9tWxEI1u0/0p9fA
   hKGyxdMTf7JCvzaFHMxaiM+SuKu5JVl3Azdem4t5VssdABtojrn19Y9mF
   Z+Zy6vlxzpWeKX1ym27X0lSxyhMGsHVPVJWLGnA0ZYqOv6aD9pDKGDViW
   2K2NmNXe0lp/m0/sKUtuyCQxXZIrYYvvO3jYTm1A+vzaa+xhKY6Mtrq2w
   zN8E5/eNBOAbodBERAi8Q3rBFGKfP6ycdEWJ38/PeghPOp1ZggoAGQqsy
   w==;
X-CSE-ConnectionGUID: jwtNXc93SI6Bx5I3tYOvjQ==
X-CSE-MsgGUID: +29iDwFfT9+ATq7wJfvWAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7795215"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7795215"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="915257845"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="915257845"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:01:16 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rsm09-00000001nEP-3rnQ;
	Fri, 05 Apr 2024 19:01:13 +0300
Date: Fri, 5 Apr 2024 19:01:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZhAgSSWHxQKesX0o@smile.fi.intel.com>
References: <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
 <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
 <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
 <Zf2vVsiW2KCEQU-U@smile.fi.intel.com>
 <2cc45e8e-558d-4e7b-a370-1187bac939fa@gmail.com>
 <ZgxuubE3MZbZDlOj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgxuubE3MZbZDlOj@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 02, 2024 at 11:46:49PM +0300, Andy Shevchenko wrote:
> On Fri, Mar 22, 2024 at 08:28:08PM +0100, Heiner Kallweit wrote:

...

> Okay, from these and DSDT I see no active device using GPIO from DSDT.
> So, the behaviour you have is definitely is a BIOS bug.
> 
> Let me and maybe others think if we can to work this around in the kernel
> and if so, how.

Can you share output of `dmidecode`?

-- 
With Best Regards,
Andy Shevchenko



