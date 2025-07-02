Return-Path: <linux-i2c+bounces-11765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1F6AF5C2B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153714A04C2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700812F5339;
	Wed,  2 Jul 2025 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqO0uarx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160F2D0C9C;
	Wed,  2 Jul 2025 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468694; cv=none; b=LMJpMIebDOCInI1gj6P4MpbNgBLSG0V4R+T1NQZHq+k+v4Zd11mO3xndPdVGjmyHPfYM2xjW7+FNxuYhUZki0TKhcAB8lD2i4eXjZNoelL2LSHIdSW51AljOjuoUl/Qf9H5oJI6cEfZBvdDCSQHSD01zxrIExiVTjXR07v/Rkas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468694; c=relaxed/simple;
	bh=yO6uTKYQhiusu7eCe6xECv5LUII9BjG7D5i9iisHetY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhaYsVNLa/pfAcjYWVCahWoaF/MRdB9HMku1bHDF1xd9y1yd3yFR7Jpf86zoWPcc3IUrH0uayZDe8F2hJEZ0OCCMtYdBq5nnjJqt0h1FZqSc8++cMVMw09hnKWWbgv9Ff9LoL9hicFNwvvWnefZG6/DYPXfuQ6qtBiBRtLcnwQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqO0uarx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751468692; x=1783004692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yO6uTKYQhiusu7eCe6xECv5LUII9BjG7D5i9iisHetY=;
  b=kqO0uarxwjgc9CpojIGiraxRLskNr7n3QF3BKP2fcGvh1IFc5CIs4r5U
   3n4peqs4EsPCnmdhfopAEHHUU/JxAFe8ISFeLOYKxiJPrgVugROMX9G4p
   ExWv6zOxwKwSfLvRtzShKmi4lGwOmPENopYf3KDp+mDW0iZ3s9ZF/x0KE
   UZ8zZJEQLFKpE2PmAaWP74xzDD/JuKvuNuhkJJp6JyM1okxvNQmDiXZ0/
   TjjJeZ4nfikPKblYHXC+87XBACIe0cXd7I+wiSYj6DpB0QK2AblI+3ENO
   0yoFv4rNl1xD6g7qXfAPHDgpy/GAO/FJRIu9nzoiBRlGtZd7l4M/Ioic0
   w==;
X-CSE-ConnectionGUID: TLU1jQoPQcieGuNJz0xWUQ==
X-CSE-MsgGUID: 38E2AHsmR9eXPYY6HbHHig==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79212457"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="79212457"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:04:51 -0700
X-CSE-ConnectionGUID: M7Lk57hFSyaUDXwNi9tsLQ==
X-CSE-MsgGUID: we2hrY3LSKOjVS/yzFTsIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153555466"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:04:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWz0u-0000000Bwus-3KQj;
	Wed, 02 Jul 2025 18:04:44 +0300
Date: Wed, 2 Jul 2025 18:04:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	thierry.reding@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
Message-ID: <aGVKjIwRjMOMlZRF@smile.fi.intel.com>
References: <20250702133450.64257-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702133450.64257-1-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 07:04:47PM +0530, Akhil R wrote:
> The acpi_evaluate_object() returns an ACPI error code and not the
> Linux one. For the some platforms the error will have positive code
> which may be interpreted incorrectly. Use ACPI_FAILURE() to determine
> the failure and return the error. Also move the reset to a separate
> function to handle this better.

...

> +static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
> +	int err;
> +
> +	if (handle) {
> +		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> +		if (ACPI_FAILURE(err))
> +			return -EIO;
> +
> +		return 0;
> +	}
> +
> +	return reset_control_reset(i2c_dev->rst);


It's better to be written other way around:

	acpi_handle handle;
	int err;

	handle = ACPI_HANDLE(i2c_dev->dev);
	if (!handle)
		return reset_control_reset(i2c_dev->rst);

	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
	if (ACPI_FAILURE(err))
		return -EIO;

	return 0;

> +}

Other than that, LGTM,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	err = tegra_i2c_reset(i2c_dev);
>  	WARN_ON_ONCE(err);

Suggestion to improve in a separate change in the future:

Add a comment explaining why we WARN() here. I.o.w. why this condition
is so critical that we need to WARN().

-- 
With Best Regards,
Andy Shevchenko



