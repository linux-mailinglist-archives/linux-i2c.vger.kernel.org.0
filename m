Return-Path: <linux-i2c+bounces-11767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F2AF5C6F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC8ED162D98
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21CD2D375F;
	Wed,  2 Jul 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKJ0Uq8o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206392D375B;
	Wed,  2 Jul 2025 15:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469240; cv=none; b=rIhMDM0zcgn7GVNPLDU3h/ttieMUjSy/c7CgFZgNuL42dBhqGYMZJb7NpYiRCteTS9gQOI9R561egczzmv5W1bmiOYzcWjqRBhxVtk2YJT7kDwyyc7lboNffaR4FnKvtK+o6zXYfPbIG3ffiXf/iePSwC23C1+lZ+aj1iUXhCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469240; c=relaxed/simple;
	bh=guHe0RW+30eTbT9ZyWS13Xj4pqieJiawrLva9Vt/itg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKb78d5hexWkqCRy1Iy7HQjQTnrYjlWy3c9USIZjCBjTM3gjqbieEuISQfLnkfMTj6Cqn+Oj/bGo9MoVw0AT6WWcxjWLWFKA0an7Hb01B/G9+QkSdoMEXlVuOHT/EJMmzNjb1WpUr584tY2RyZ/qWnYo+q0LhDtfeEooMBA9/wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKJ0Uq8o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751469239; x=1783005239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=guHe0RW+30eTbT9ZyWS13Xj4pqieJiawrLva9Vt/itg=;
  b=MKJ0Uq8opXih44hY9AcMHE6QYhBNYib0k7RZc+JfovYA82Sa+OLnKas3
   RU7kU9px2XFi46WMQ6ppzX7z4738YMljPV1GFypPKb+KixAVeywF92OLH
   04DnAylW1CLm29Srd0rmbujs2V+WphuxwP92OIipTvOO9qTlDjlMIP+u7
   iNIdJJBWO18f1BweRE4WDCWN5SPjwGsmffwDFpv3ZazurgHq197QMuns1
   i0jagI9+Qm7tAe6Y2av/QpMADFgSwi6BQSW3RgLTlkEQEvsyKBTre4iB+
   sV3KwcHa/T4BKNeI3M1p5vtxPRqLsMdvq1NUyj+cwjx3uhKIa0yQEjIDU
   A==;
X-CSE-ConnectionGUID: ChjxAKsnRmeO6d4YC0EA3w==
X-CSE-MsgGUID: vJZohpVDSH2k7gPHuzWHRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79213895"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79213895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:13:58 -0700
X-CSE-ConnectionGUID: /rAX40xCTwGhqu9E32/a5w==
X-CSE-MsgGUID: +l+UKF1IQbCCEx1E2iU3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153558840"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:13:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWz9j-0000000Bx3p-3Mf8;
	Wed, 02 Jul 2025 18:13:51 +0300
Date: Wed, 2 Jul 2025 18:13:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	thierry.reding@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
Message-ID: <aGVMr87HLrYGEw98@smile.fi.intel.com>
References: <20250702133450.64257-1-akhilrajeev@nvidia.com>
 <aGVKjIwRjMOMlZRF@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGVKjIwRjMOMlZRF@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 06:04:44PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 07:04:47PM +0530, Akhil R wrote:

...

> > +static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
> > +{
> > +	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
> > +	int err;
> > +
> > +	if (handle) {
> > +		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> > +		if (ACPI_FAILURE(err))
> > +			return -EIO;
> > +
> > +		return 0;
> > +	}
> > +
> > +	return reset_control_reset(i2c_dev->rst);
> 
> It's better to be written other way around:
> 
> 	acpi_handle handle;
> 	int err;
> 
> 	handle = ACPI_HANDLE(i2c_dev->dev);
> 	if (!handle)
> 		return reset_control_reset(i2c_dev->rst);
> 
> 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> 	if (ACPI_FAILURE(err))
> 		return -EIO;
> 
> 	return 0;
> 
> > +}
> 
> Other than that, LGTM,
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Actually I have to withdraw the tag. The above function is repetition of
the device_reset() / device_reset_optional(). Please use that instead.

Also in the next version provide a cover letter. I use my own script [1]
that makes me sure I won't skip it.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



