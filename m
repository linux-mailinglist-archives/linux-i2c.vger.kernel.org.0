Return-Path: <linux-i2c+bounces-6589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9D9758C5
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 18:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88D96B20D1C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5EB1AC8B3;
	Wed, 11 Sep 2024 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmRGneGr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003334D8B9
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726073561; cv=none; b=p05P64Y++3zRKTSBOpo7eWmftLdKF0TxcK8HECzUffG29XoSghyJBnlJdWnQltT30Ji0BbENoPF7m12UKvGApX1we4Y9PsapyucFIq9PHjsRvrCTWTgwHZ8uykUL8Byr3VEbTeJ5oZmjXuzdyxqAdGTEU/CjTZVlV3FaiJ5Tk8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726073561; c=relaxed/simple;
	bh=pgyiF+uOgc28poEc58VOzFDvdxxtsDVV4IElG8AoeLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbCVSirFbhUnCHCb0L83gQPgH21l80wsLKTWqd8VRWLHoDyYua6ET5vR5lVYx5J33g2nZSxNAFQXT0amHghKqbr+0wxSf7pi8GTelVRAnWNl2/gEdKJANkNQYZJKkz63YY8KPgMCzFEP1QhVBQBrXosAMSqBawXtFI6jfh+8guk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmRGneGr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726073559; x=1757609559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pgyiF+uOgc28poEc58VOzFDvdxxtsDVV4IElG8AoeLU=;
  b=DmRGneGrJ/gBeIcyU8f+COQpjG0gtemB00+fNdXo1S+0+ZLVhQtvEh+p
   HimKqSS6Dqk4CnH89wrBpUoN1ouKEe/H2/7FWIlNvoGiV50rh6cRWBa1a
   2LywQUYR+1KXbzBlaCvs1opv6N4udUprTJEMinCBFoazKajgLITFISBB0
   GUQtbX3Z6lPibSCluSP3aqnlqmm84XMj0NTwQoh8YSaE19GfBnLztEZf5
   FmOqCllUMSANATytOSE2rGTHFoqJYsREIiLTdAyeer7A0Z/3ncO5Wqtl6
   GmBQvvS1kaVNdx49MvQESo9+Isbgu96ovsq17AEO2SZr8Hz6UQHNQoSM9
   g==;
X-CSE-ConnectionGUID: /ixoFiuXQ+meGTXKS6WXxw==
X-CSE-MsgGUID: hj9vvPx2SvytglTB+8TeMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25043324"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="25043324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 09:50:40 -0700
X-CSE-ConnectionGUID: VGZRiJQ9SWCtlmXAPxAE+w==
X-CSE-MsgGUID: O3x3VNLzRju5EaNIvb11Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67265055"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 09:50:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soQY7-00000007dD7-3fLd;
	Wed, 11 Sep 2024 19:50:35 +0300
Date: Wed, 11 Sep 2024 19:50:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <ZuHKW5YjcRTshb31@smile.fi.intel.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-5-Shyam-sundar.S-k@amd.com>
 <ZuG0R6rLes_s3lWt@smile.fi.intel.com>
 <d80434a2-d997-4db6-aff4-14211612f2fd@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d80434a2-d997-4db6-aff4-14211612f2fd@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 10:07:42PM +0530, Shyam Sundar S K wrote:
> On 9/11/2024 20:46, Andy Shevchenko wrote:
> > On Wed, Sep 11, 2024 at 05:24:03PM +0530, Shyam Sundar S K wrote:

...

> >> +	struct i2c_adapter adap;
> > 
> > Make it first member, it might help if we ever do a container_of() against
> > this.
> > 
> >> +	struct sb800_mmio_cfg mmio_cfg;
> >> +	unsigned short port_addr;
> > 
> > What you probably want is to have
> > 
> > 	void __iomem *addr;
> 
> I will address the above remarks in the next patch.
> 
> I believe this should remain "unsigned short" because
> 
> - it is defined a unsigned short in i2c_piix4
> - this is just a port address (like 0xb00, 0xb20) and not a real iomem
> address.

It all depends on how you use that. The devm_ioport_map() is just a trick (in
combination with ioreadXX()/iowriteXX() APIs) to have it in "mapped" address
space.

> > and use devm_ioport_map() somewhere (see
> > drivers/pinctl/intel/pinctrl-lynxpoint.c, for example)

...

> >> +	LIST_HEAD(res_list);

> >> +	adev = ACPI_COMPANION(&pdev->dev);
> >> +	if (!adev)
> >> +		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get ASF device\n");
> > 
> > No need. You will get here only if enumerated via ACPI (or if it's out-of-tree
> > board file which we do not care about at all).
> 
> Not sure if I understand your comment correctly. But I used
> ACPI_COMPANION to retrieve the acpi device that needs to be passed to
> acpi_dev_get_resources(struct acpi_device *, ...) to address your
> previous remarks.

With platform device driver you don't need all this as you are repeating what
drivers/acpi/acpi_platform.c already does it for all ACPI devices.

> >> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
> >> +	if (ret < 0)
> >> +		return dev_err_probe(&pdev->dev, ret, "Error getting ASF ACPI resource: %d\n", ret);
> >> +
> >> +	list_for_each_entry(rentry, &res_list, node) {
> >> +		switch (resource_type(rentry->res)) {
> >> +		case IORESOURCE_IO:
> >> +			asf_dev->port_addr = rentry->res->start;
> >> +			break;
> >> +		default:
> >> +			dev_warn(&adev->dev, "Invalid ASF resource\n");
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >> +	acpi_dev_free_resource_list(&res_list);
> > 
> > Now this is a duplicate of what ACPI glue layer does. You have these already
> > available as platform device resources.
> 
> looking at drivers/acpi/resource.c acpi_dev_get_resources() mentions
> that the caller should call acpi_dev_free_resource_list(). Is that not
> the case?

I meant that entire block is just a dup of the existing code. See above.
Instead use simple platform_get_resource() and similar to retrieve this
information.

...

> >> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);
> > 
> > Is it used?
> 
> Yes, in the subsequent patches.

I wasn't Cc'ed on the series. Please, make sure you Cc me in the entire series.

...

> >> +	status = acpi_get_handle(NULL, (acpi_string)SB800_ASF_ACPI_PATH, &handle);
> > 
> > Does it compile with CONFIG_ACPI=n?
> 
> I have used a explicit 'depends on' ACPI to this driver soon that LKP
> does not complain with a randconfig.
> 
> > Also don't you need to include acpi.h for this? Or is it already there?
> > (I haven't checked).
> 
> acpi_get_handle() is defined in acpi.h.

Yes, and I meant piix4 driver where you call this API.

> please assume the rest of the unanswered remarks as "I agree" :-)

Noted!

> >> +	if (ACPI_SUCCESS(status))
> >> +		is_asf = true;

-- 
With Best Regards,
Andy Shevchenko



