Return-Path: <linux-i2c+bounces-6849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D597BA81
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 12:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99FF21F261AB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 10:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642E516FF3B;
	Wed, 18 Sep 2024 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MY92ZaZL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5F1B5AA
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653813; cv=none; b=Y2uR5pu2JPgi1TShFEwo1WVrloFUjJKxwcYaSgeTVdZvsr3RXzvcblnbBQ7HYm0WQ+hhCtVSjQFPbMea/Afl0uJ9eHmrg5hfyCYeJs8Y5ArRxsk57c4c/EoqW/nCbWWwehvond104osy3rJ3mvGUn0TExkSwIkAZiK8ulQu8omc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653813; c=relaxed/simple;
	bh=Pg/OoAQ/iXBrhH53jR0JxtRIoMLA0XCyMWmB+elFYSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHTK66BdcQZUS4YXyN1Zn5R2As5Riv+hcBi1vxf3fdXQmeRtuGc6YXSCIGlS5fLYfBYlIZ/GIbxTWou+bbVoS90Heky0O56Me1KsEvRqWt+EqT9QM7kDKNF9dUgBF9rkqiFEKnVsLKTadtEwoZe1eyGKfkX/7zjg5rjUZICDMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MY92ZaZL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726653808; x=1758189808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Pg/OoAQ/iXBrhH53jR0JxtRIoMLA0XCyMWmB+elFYSk=;
  b=MY92ZaZL8TTk+FLZ/VpKKPhDFtgAqinauFa8xPDdRV/HmA22gncCye2e
   yvayvNVfAo5b2O4dmm8+iVRP3HObyFgwlW+WxrHSXOWvOMeA7h1wQhtg2
   b300eLJQg01lCCmXMPItQkJ7I5PRtAaGAWzJgpkmlYH7FwkETmuvDeNEP
   vTObOfaBzW1okyEMUZPRRsP0YMSkxeEz/i9QKAaWswSB3LmVWjV23/rPg
   q6yfNgCt7D926275h/WGDI2lAVcatD3DOwe6Q8V6UA0nFRlNTNFTR+sNK
   Kb5N3y8ovdfDo/wUtTW+Nih6taCm4FtOFFltTWicbZoCokVw7m0d70i91
   Q==;
X-CSE-ConnectionGUID: PUAL5rn7R9ycINtwRQUshQ==
X-CSE-MsgGUID: LXe7LqC4RaqavMwc53kilw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29342232"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="29342232"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 03:03:28 -0700
X-CSE-ConnectionGUID: CBOiWlqvQAC9V3RhAKdSYA==
X-CSE-MsgGUID: 6CwcoYtYRhWiwb3lDzubbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69824093"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 03:03:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqrWt-0000000A8Y9-1Uwp;
	Wed, 18 Sep 2024 13:03:23 +0300
Date: Wed, 18 Sep 2024 13:03:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 7/8] i2c: amd-asf: Clear remote IRR bit to get
 successive interrupt
Message-ID: <Zuqla7IMBr7wYs1Z@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
 <ZuSQVpIqM3yOSuf4@smile.fi.intel.com>
 <8e12b68c-0a90-413b-bf02-f8637629f2be@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e12b68c-0a90-413b-bf02-f8637629f2be@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 18, 2024 at 12:01:19AM +0530, Shyam Sundar S K wrote:
> On 9/14/2024 00:49, Andy Shevchenko wrote:
> > On Fri, Sep 13, 2024 at 05:41:09PM +0530, Shyam Sundar S K wrote:

...

> >> +	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> +	if (!eoi_addr)
> >> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
> >> +
> >> +	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
> >> +	if (!asf_dev->eoi_base)
> >> +		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");
> > 
> > Home grown copy of devm_platform_ioremap_resource().
> 
> devm_platform_ioremap_resource() internally calls
> devm_platform_get_and_ioremap_resource(), performing two main actions:
> 
> It uses platform_get_resource().
> It then calls devm_ioremap_resource().
> 
> However, there's an issue.
> 
> devm_ioremap_resource() invokes devm_request_mem_region() followed by
> __devm_ioremap(). In this driver, the resource obtained via ASL might
> not actually belong to the ASF device address space. Instead, it could
> be within other IP blocks of the ASIC, which are crucial for
> generating subsequent interrupts (the main focus of this patch). As a
> result, devm_request_mem_region() fails, preventing __devm_ioremap()
> from being executed.
> 
> TL;DR, it’s more appropriate to call platform_get_resource() and
> devm_ioremap() separately in this scenario.

Okay, at bare minimum this must be commented in the code (like the above
summary). Ideally it should be done differently as the resource regions
should not be shared (it's an exceptional case and usually shows bad design
of the driver). If you can't really split, regmap APIs help with that
(and they also may provide an adequate serialisation to IO).

-- 
With Best Regards,
Andy Shevchenko



