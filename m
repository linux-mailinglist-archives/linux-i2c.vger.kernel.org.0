Return-Path: <linux-i2c+bounces-11814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30AAF76CC
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 16:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C153A55F5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 14:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469A52E7BB6;
	Thu,  3 Jul 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEjgCboS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7002E7657;
	Thu,  3 Jul 2025 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551881; cv=none; b=QS47f04mojyAMScHA5M0Imnc9RTfLaxTbf+x8evAxqE7xKdNWX8zav6fK5/ClTTAtxsb1PKcCMxX/ylmxMjKxhJVGEMHFJjp5mRvj5em4A9P9x1N7pJQ00MQfv8Q73Wzw7CBbe8YoUNuCqnZZDiVtHjfKqNI0/spfOgy8iYKLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551881; c=relaxed/simple;
	bh=10SEkwG4ZhGVVZILxWHqFMltZbXKCJuYvyM+hzFcivM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyxrm/+djMxNXP9IolktjlXxCfBlF+fiudHs930mGwaaVRpJItg4Yj+qePwrn1kfdeik/Fcz5RcnRBL4uq1Y8gOBr803hm8YJVIe80ivKjQhMQtNFNiWbp7FCGDBPRaHKTmF0Tl8VEFc8TszQeXhTbQDr3z4iQDN95V3RBfyg18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEjgCboS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751551879; x=1783087879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=10SEkwG4ZhGVVZILxWHqFMltZbXKCJuYvyM+hzFcivM=;
  b=mEjgCboS6orgudZ5THVX2YnIkWCmmsDjwf/DTV1jSs969kcOKv1hZH1t
   AhBpUu5AVdGvsGz13MeKegpRnZEVEkvrSU1mfQjwEGkG9dOT8ps7FyNRX
   Lsn94fBHApil4d937/AU8k/pt58BP1F4PWQCYddKr5tWD1OwcL7hPd+mK
   KDNCE+xekWoPgHYZz2O6GHdHsut/vouonZEMigIhfyCurQtyYaH3rFd77
   3FaMgzoZfMqF8nw8ysPxW+83IHZQXF66U8g37MvDa6d05etQoplsWgRkq
   EeH3fSd1OzCEhlHZITv8juefCjnuNE3HoLSvTKEGu+oF1KJOxY6Iml5Wh
   Q==;
X-CSE-ConnectionGUID: AiVRHY+USDCkBEkDIlwvKQ==
X-CSE-MsgGUID: NB5+YGqBSbuREDPFvOGQIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53004743"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53004743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:11:18 -0700
X-CSE-ConnectionGUID: 2nuSzfNOSfConAcn2TSfSQ==
X-CSE-MsgGUID: toWACkEGQwai73Pp9mXMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="160072232"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:11:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uXKee-0000000CDvy-0fIB;
	Thu, 03 Jul 2025 17:11:12 +0300
Date: Thu, 3 Jul 2025 17:11:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, digetx@gmail.com,
	jonathanh@nvidia.com, krzk+dt@kernel.org, ldewangan@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, robh@kernel.org,
	thierry.reding@gmail.com
Subject: Re: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
Message-ID: <aGaPf_j1SHXMGAn1@smile.fi.intel.com>
References: <aGVMr87HLrYGEw98@smile.fi.intel.com>
 <20250702171036.1892-1-akhilrajeev@nvidia.com>
 <14af238d2106544147dfb1c7824787d6d54f1885.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14af238d2106544147dfb1c7824787d6d54f1885.camel@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 03, 2025 at 10:31:25AM +0200, Philipp Zabel wrote:
> On Mi, 2025-07-02 at 22:40 +0530, Akhil R wrote:
> > On Wed, 2 Jul 2025 18:13:51 +0300, Andy Shevchenko wrote:

...

> > > > > +static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
> > > > > +{
> > > > > +	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
> > > > > +	int err;
> > > > > +
> > > > > +	if (handle) {
> > > > > +		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> > > > > +		if (ACPI_FAILURE(err))
> > > > > +			return -EIO;
> > > > > +
> > > > > +		return 0;
> > > > > +	}
> > > > > +
> > > > > +	return reset_control_reset(i2c_dev->rst);
> > > > 
> > > > It's better to be written other way around:
> > > > 
> > > > 	acpi_handle handle;
> > > > 	int err;
> > > > 
> > > > 	handle = ACPI_HANDLE(i2c_dev->dev);
> > > > 	if (!handle)
> > > > 		return reset_control_reset(i2c_dev->rst);
> > > > 
> > > > 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> > > > 	if (ACPI_FAILURE(err))
> > > > 		return -EIO;
> > > > 
> > > > 	return 0;
> > > > 
> > > > > +}
> > > > 
> > > > Other than that, LGTM,
> > > > 
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Actually I have to withdraw the tag. The above function is repetition of
> > > the device_reset() / device_reset_optional(). Please use that instead.
> > 
> > I did check that. But device_reset_optional() returns '0' if reset is
> > not available or when the reset succeeds. Then there is no option to
> > conditionally trigger the internal reset when the reset is not available.
> > 
> > Other option was to do the internal reset unconditionally. But then the
> > devices that do not have an internal reset will have to skip the reset
> > silently if the reset property is absent in the device tree (or _RST
> > method is absent in the ACPI table).
> > 
> > Though device_reset() returns error when reset is absent, it looks to
> > be not so straight-forward to detect from the return value that if there
> > is an actual error during reset or if the reset is absent.
> 
> device_reset() should return -ENOENT if the reset is absent (as opposed
> to present but somehow broken). If there is any code path where this
> isn't the case, we should probably fix this.
> 
> In the ACPI case, -ENOENT is returned by __device_reset() if the "_RST"
> method is not found.
> 
> In the OF case, -ENOENT is returned by __of_reset_control_get() if the
> requested id can't be found in a "reset-names" property, or if
> of_parse_phandle_with_args() returns -ENOENT for the "resets" (or
> "reset-gpios") property - that is, when this property doesn't exist or
> the entry indicated by the reset id is empty.

I have nothing to add to what Philipp just said. I believe we don't want
open coded variant of the device_reset*().

-- 
With Best Regards,
Andy Shevchenko



