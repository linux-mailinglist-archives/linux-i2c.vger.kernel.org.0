Return-Path: <linux-i2c+bounces-9037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D80A0AF75
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 07:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F70F1886D20
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 06:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B78230D19;
	Mon, 13 Jan 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzGHpmRG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C703122F19;
	Mon, 13 Jan 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736750888; cv=none; b=NehMdX78IBW9+Q8KyYx2G3TuTT2sfFU02iuVgCO615QZTE3omkex2xfrfDZZaFZXUCbMozUwVzdtSaDiSIWC+kiGRYWaFPL50dM3bssXujjsbdc0Lbfye4GfZOZU/FH/9Nt0HRy0D5m4CfIV0G3ctTyyAcmKyppN8BBJzkhu+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736750888; c=relaxed/simple;
	bh=LrpF7j9F5VORHOi/E4E5KDMzb5+CgHjpT5r6CxJ9MlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5TsMUkPD2u+pucB1ve7sTXJYqeEbdb/aDd3u7VKIqFcS+CZQlKGfEa66Cwxt1AS0lJES+t9i6YW8GRB51E8yt+jGAAv5VEPpQFJ8ihPlWyz7cxl3oX/QgIEPXt91btXRm7m0mm/Y+AqWORc5+xG02OwKYDXaeBjaExycbgyZPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzGHpmRG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736750887; x=1768286887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LrpF7j9F5VORHOi/E4E5KDMzb5+CgHjpT5r6CxJ9MlA=;
  b=NzGHpmRGonVx2aS4w1nlCg47g1uBPYfojtQOmoHbnPlS5XCdqmjJ1v2U
   mad6Tbe9iKXyPb096ODGKLQeNbFDLjDkAE4m0M+PsdXmaXRbiFMnKVeUY
   kmBWbdGGWqBLjxY3O/PjaXAyobQUd62leneHVWi6fA9zMgH6xn5SP8kTi
   3OGeqd6HrUeqkAyv2zYdReiNUCDm4xHP8/LUmY2AErLr6XL2gfucW5Me3
   h21cJfngzx28pMka5NWhCH+A41jYveo0KQysp8TWQlv5dAR9T4cOY0diq
   PYcQokNTrz3rLpV3IDXWBP9KA7T/Zq5ItNQgX+TbCHMSMqDzsCmOrWg/H
   w==;
X-CSE-ConnectionGUID: ajVzGisBSpGihFUVAo4Nhw==
X-CSE-MsgGUID: cszJRacZQnWF8ehPt3oM8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36877855"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36877855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:48:05 -0800
X-CSE-ConnectionGUID: kkJvr9eMSWm1LoTkX5NmSQ==
X-CSE-MsgGUID: oAeUxNv4SyWcFM95Lyksfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="109363319"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2025 22:48:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5F6F2329; Mon, 13 Jan 2025 08:48:02 +0200 (EET)
Date: Mon, 13 Jan 2025 08:48:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Randolph Ha <rha051117@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org,
	jarkko.nikula@linux.intel.com
Subject: Re: [PATCH] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250113064802.GJ3713119@black.fi.intel.com>
References: <20250110120740.GH3713119@black.fi.intel.com>
 <20250111155744.2874-1-rha051117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250111155744.2874-1-rha051117@gmail.com>

Hi,

On Sat, Jan 11, 2025 at 09:57:10AM -0600, Randolph Ha wrote:
> When a 400KHz freq is used on this model of ELAN touchpad in Linux,
> excessive smoothing (similar to when the touchpad's firmware detects
> a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
> V15 G4) ACPI tables do not specify a frequency for this device and
> some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
> force the speed to 100KHz as a workaround.

Actually the ACPI tables provide the speed:

	I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
	    AddressingMode7Bit, "\\_SB.PC00.I2C1",
	    0x00, ResourceConsumer, _Y53, Exclusive,
	    )

It's that 0x00061A80 == 400kHz. Linux uses that and I would expect Windows
to do the same.

However, since the behavior is different between the OSses we are missing
something in Linux side. And because we cannot figure out what that is the
current workaround is to quirk the speed down to 100kHz which seems to cure
the problem.

> This problem may be related to the default HCNT/LCNT values given by
> some busses' drivers, because they are also not specified in the
> aforementioned devices' ACPI tables, and because the device works at
> what appears to be a 400KHz frequency in Windows without issues.
> 
> Signed-off-by: Randolph Ha <rha051117@gmail.com>

This is fine by me if we cannot figure out a better way but please correct
the commit message and the comment below to match the fact that the speed
is specified and that we don't know the root cause.

Once done, freel free to add my,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---
>  drivers/i2c/i2c-core-acpi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 14ae0cfc325e..6f1c2377db0a 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -355,6 +355,24 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
>  	{}
>  };
>  
> +static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
> +	/*
> +	 * When a 400KHz freq is used on this model of ELAN touchpad in Linux,
> +	 * excessive smoothing (similar to when the touchpad's firmware detects
> +	 * a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
> +	 * V15 G4) ACPI tables do not specify a frequency for this device and
> +	 * some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
> +	 * force the speed to 100KHz as a workaround.
> +	 *
> +	 * This problem may be related to the default HCNT/LCNT values given by
> +	 * some busses' drivers, because they are also not specified in the
> +	 * aforementioned devices' ACPI tables, and because the device works at
> +	 * what appears to be a 400KHz frequency in Windows without issues.
> +	 */
> +	{ "ELAN06FA", 0 },
> +	{}
> +};
> +
>  static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
>  					   void *data, void **return_value)
>  {
> @@ -373,6 +391,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
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

