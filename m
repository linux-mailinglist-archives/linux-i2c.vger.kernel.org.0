Return-Path: <linux-i2c+bounces-8879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCFA0070C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F4F67A1C40
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF811F63C0;
	Fri,  3 Jan 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxCtzAwr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5571F2398;
	Fri,  3 Jan 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896839; cv=none; b=sosY60PGDY5In8i6j8hOAq3NEGkeZD5mMTJH4q6FvrHmondX3PdpZk4Hnn/T4KeDI9aD0nWikvEVKlsq0iRlUFg5iQJM12D5hTtzaFymnLvoTLUoi2yzqUN9md+MwY4xvR8qHa+Zu8jPCVpLMjHuvkyBjLb9+p/X4UvF0P4OLg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896839; c=relaxed/simple;
	bh=9fy/wvkR7p0+ogBKJN/ec62xCUItlL01OTdYhLufvp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+N5JylEhj/kSu807A8RPIBcgA3Vs1p2A4pyGV9VvIxR5ewcMBSrSiInqn1j43pxIWhPjzARhjEBC/RBtlZMDS66OmGq0ZOlbbY2gqj41aVmiVhBHsXO2fKkbqUUxTyFO4bgJBxEW+ksgLVJ3I8jZ8iMaBoa8WL2b9aFCFHV6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxCtzAwr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735896837; x=1767432837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9fy/wvkR7p0+ogBKJN/ec62xCUItlL01OTdYhLufvp0=;
  b=mxCtzAwrVMvao8yYJWwdumeWlrvDB3UdNHXYf6SkdRSk+zf8xCEBxu4h
   BuumyKabCHFI44MVAACKIN3kyC4un2tOM5yGvTm1PRyPy5yRImq4K/2/Y
   1wwwOB08X+1uLgohdPcAk68cJYqsp/cD8Z2upQPBl2XKi9RKFmSiA+toi
   qe6fsC7ckeYxeC33MdTQLeWREkEYFgtNEQ4cLUP6V0JpBI4FZ8CGrcZqm
   chlLJ7sYJbNb7Ui3DRR2da5KKE7gNOANZ2V7XawDkr4/5qAUDqLbx0ewU
   FaML7xaPnNjMoTTwkcDCZIgFyNbnf0Z21ynG4dcBKQ+JNCOv8LMw/nZwm
   w==;
X-CSE-ConnectionGUID: Ry2+fZCiSY2Z46G/ZUHh/g==
X-CSE-MsgGUID: h0i67f5gRo6tsWvBSAllhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36259238"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36259238"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 01:33:56 -0800
X-CSE-ConnectionGUID: M64My0lgTJOAfplabiv2aA==
X-CSE-MsgGUID: lr1VBd/mSP6fngD9Mo210w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105801808"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jan 2025 01:33:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BB1DFF4; Fri, 03 Jan 2025 11:33:53 +0200 (EET)
Date: Fri, 3 Jan 2025 11:33:53 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Randolph Ha <rha051117@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250103093353.GP3713119@black.fi.intel.com>
References: <20250103051657.211966-1-rha051117@gmail.com>
 <20250103051657.211966-2-rha051117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103051657.211966-2-rha051117@gmail.com>

Hi,

On Thu, Jan 02, 2025 at 11:16:52PM -0600, Randolph Ha wrote:
> Some devices do not define valid bus frequencies for the ELAN06FA
> touchpad in their ACPI table, and some controllers run them at
> 400KHz by default. The 06FA touchpad exhibits excessive smoothing
> behaviors when run at 400KHz, so force the bus frequency to 100KHz.

What are those "some devices" and "some controllers"?

Can you add the ACPI table snippet here too for reference?

> Signed-off-by: Randolph Ha <rha051117@gmail.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 14ae0cfc325e..b10f52e12fe8 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -355,6 +355,18 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
>  	{}
>  };
>  
> +static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
> +	/*
> +	 * When a 400KHz freq is used on this model of ELAN touchpad instead
> +	 * of 100Khz, excessive smoothing (similar to when there is noise in
> +	 * the signal) is intermittently applied. As some devices' ACPI
> +	 * tables do not specify the 100KHz frequency requirement, it is
> +	 * necessary to force the speed to 100KHz.
> +	 */
> +	{ "ELAN06FA", 0 },
> +	{}
> +};
> +
>  static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
>  					   void *data, void **return_value)
>  {
> @@ -373,6 +385,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
>  	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
>  		lookup->force_speed = I2C_MAX_FAST_MODE_FREQ;
>  
> +	if (acpi_match_device_ids(adev, i2c_acpi_force_100khz_device_ids) == 0)
> +		lookup->force_speed = I2C_MAX_STANDARD_MODE_FREQ;
> +
>  	return AE_OK;
>  }
>  
> -- 
> 2.47.1

