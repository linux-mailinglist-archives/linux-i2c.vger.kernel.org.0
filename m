Return-Path: <linux-i2c+bounces-6854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3597BDB0
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 16:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C0F1F2202D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 14:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8040B18C010;
	Wed, 18 Sep 2024 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtKdYc+W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EC818A6CD
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726668502; cv=none; b=s+4wy6fokIJhoN2IYgUC3WbSMXHCWQAbeI8uJRl+lb/4PkBStCwRqEKqWkPinBYs53GcUOWAAI9vy5+upD4fD9VT5ZOY/UrvOpj0YD/hgwcYCWh1rTcCWyNGB10f2cXqyG3I5AnTSR2JwLtVpudUzJ4kJXgkWWfsliSiAD0DgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726668502; c=relaxed/simple;
	bh=/jYztx90har0kjRV7ReQEcnHXO47DyTVTOFW0r97hHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TS/mPrDqj/S7eEpPplRufHHSfgY6fC0zdtl87Bt9ZZCE4pyVwOtKmZZ9FEGKiPb3/zonAz631J+vBUXKVb59eBMMg1GAgLSyAhq2qoAkYCwAfoQUUCWRUoFk1hbe+1DV1QRSxRURuyqajMxFtN5hTYi834ksh5F525z0erDZPTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtKdYc+W; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726668501; x=1758204501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/jYztx90har0kjRV7ReQEcnHXO47DyTVTOFW0r97hHQ=;
  b=WtKdYc+Wb5MG/cUw6Yri9rXu8je8JBEE+q84ILMBAnHIt1O06qnb/8Dx
   VtOVXKSMs76pGUdsBhBVpHBv+oiDAVKR0WyoT+cF+15EVM6A6Zn+YYqjZ
   /nG3fXvG8KWowCH9b9KBjGL2VZHKeo/lCJ9wl3qAhuS4HIXwCEoDSFCnm
   wyINYFsY5GmWJzzcmP1cBzG5RyQZcTi9vn8z5KIMvGvSaDtUmk5SZk6CF
   CKUWHVMyFbkNuBguqbiTmVrKKbbz6UCBOnGmCFii77lCtBOS8gztfcVxx
   BcUEocjvyWEPc9RXbo6jcK2uZm5bbdvknSwp28sZR4QhSsMAOq6bNKWPL
   g==;
X-CSE-ConnectionGUID: nVpk4CZHQ2GzeY+8pTB+xg==
X-CSE-MsgGUID: VzsPm6PjRruMrHcCHlDWyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36943418"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="36943418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 07:05:30 -0700
X-CSE-ConnectionGUID: 73M/YQQdT7SiVu/KA2UcPw==
X-CSE-MsgGUID: M6WmdyoNRgKc8QMDSXZcoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69822235"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 07:05:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqvJ4-0000000ACOh-17XV;
	Wed, 18 Sep 2024 17:05:22 +0300
Date: Wed, 18 Sep 2024 17:05:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 7/8] i2c: amd-asf: Clear remote IRR bit to get
 successive interrupt
Message-ID: <ZureIjs-7x6Hvl9g@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
 <ZuSQVpIqM3yOSuf4@smile.fi.intel.com>
 <8e12b68c-0a90-413b-bf02-f8637629f2be@amd.com>
 <Zuqla7IMBr7wYs1Z@smile.fi.intel.com>
 <027f723f-a276-4e63-8578-167d74e14d12@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <027f723f-a276-4e63-8578-167d74e14d12@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 18, 2024 at 03:58:11PM +0530, Shyam Sundar S K wrote:
> On 9/18/2024 15:33, Andy Shevchenko wrote:
> > On Wed, Sep 18, 2024 at 12:01:19AM +0530, Shyam Sundar S K wrote:
> >> On 9/14/2024 00:49, Andy Shevchenko wrote:
> >>> On Fri, Sep 13, 2024 at 05:41:09PM +0530, Shyam Sundar S K wrote:

...

> >>>> +	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>>> +	if (!eoi_addr)
> >>>> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
> >>>> +
> >>>> +	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
> >>>> +	if (!asf_dev->eoi_base)
> >>>> +		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");
> >>>
> >>> Home grown copy of devm_platform_ioremap_resource().
> >>
> >> devm_platform_ioremap_resource() internally calls
> >> devm_platform_get_and_ioremap_resource(), performing two main actions:
> >>
> >> It uses platform_get_resource().
> >> It then calls devm_ioremap_resource().
> >>
> >> However, there's an issue.
> >>
> >> devm_ioremap_resource() invokes devm_request_mem_region() followed by
> >> __devm_ioremap(). In this driver, the resource obtained via ASL might
> >> not actually belong to the ASF device address space. Instead, it could
> >> be within other IP blocks of the ASIC, which are crucial for
> >> generating subsequent interrupts (the main focus of this patch). As a
> >> result, devm_request_mem_region() fails, preventing __devm_ioremap()
> >> from being executed.
> >>
> >> TL;DR, it’s more appropriate to call platform_get_resource() and
> >> devm_ioremap() separately in this scenario.
> > 
> > Okay, at bare minimum this must be commented in the code (like the above
> > summary). 
> 
> Okay, I will leave a comment.
> 
> > Ideally it should be done differently as the resource regions
> > should not be shared (it's an exceptional case and usually shows bad design
> > of the driver). If you can't really split, regmap APIs help with that
> > (and they also may provide an adequate serialisation to IO).
> 
> Unfortunately, this is the only way to get subsequent interrupts from
> the ASF IP block (based on the AMD ASF databook).

How is it related to the pure software concept of the assigning (exclusively)
the resources? Again, if you need to share, switch over to use regmap APIs.
See how I2C DesignWare driver does. It's also used as the part of complex
hardware where the register windows may not be clearly split between drivers.

-- 
With Best Regards,
Andy Shevchenko



