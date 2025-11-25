Return-Path: <linux-i2c+bounces-14258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5BC844D0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 10:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 343084E4804
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 09:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17402ECD37;
	Tue, 25 Nov 2025 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IN+EiILX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090E12E093C;
	Tue, 25 Nov 2025 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064251; cv=none; b=HpbK0oQQwqwuhbZi1TdV66FzhFYp+8dpFxAiCWHUrhqa6ebUM9Bdie5bwNI6fV8ssZSMfaQslFDCvYGlm5ORI/NZRYSV5CPmIDSPKghytREiCTVGHXM0DtilbHCQMnjivoJfW7+ZqpVbkSKupB8H17JHf1D53jr6xryTkbPD5E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064251; c=relaxed/simple;
	bh=FQpSpgUnMKCOMFr0Gdp+zCHZJHVQwUg6TuxZoHVk6rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRWOhH8vkCLKI7FgWRhuSAVbSMIZVyYpKM0GLMveXVNJWDemFeGLJ7xFWSZySdoUGTOGyiwpBLJxYU+5WuRW8b9vSQM7DwkWFFLLQ/ocm4FDU1UZRcE3OiDC6awGuGKNW+9GNHRsApDgNgeBTebZmhBAs8QfP5rY+/aHUluahG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IN+EiILX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764064250; x=1795600250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FQpSpgUnMKCOMFr0Gdp+zCHZJHVQwUg6TuxZoHVk6rc=;
  b=IN+EiILXHOlPolHXGEJyKHlMSt8EICxFI3z4FeVeR5O7Q9ffKZalbQc3
   irFA/3iqyEYE99yosCJpo8kX0KEVIBsBBHA9AVYR8Dg7CWpO6hO2E78O7
   2HzOUw++8kCaQycWX7kls6eJzSiWtXDm8MkSyB7QSy5Pyo1F+qo5rezJh
   eu2QSEBh/xy7Qvv7rfFevNZYZgu0tUcXb/wqDjDGj2I2z1V+RjJqu28iD
   ypzMFK4IZPt8w7QtKvggVBl2g8NY5UYSqZ95sSJfXjnuNGJlU1IRmAz4I
   weL6TPVzEtlj63VlKuTKMT0rdr+l6eiwjflc2CLTLq7DxiLL5wF4jr1CV
   g==;
X-CSE-ConnectionGUID: VSu9RxAWSia53WbEcLti6g==
X-CSE-MsgGUID: 4kwfyqtXQcClmJfwgEl7fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65077813"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65077813"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:50:49 -0800
X-CSE-ConnectionGUID: b4ahSxWHQ4yjdfA+iiTodw==
X-CSE-MsgGUID: rJzMmL12TyOaB5pQ39ey6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="196896100"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2025 01:50:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 115B0A0; Tue, 25 Nov 2025 10:50:46 +0100 (CET)
Date: Tue, 25 Nov 2025 10:50:46 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v1 1/2] i2c: acpi: Return -ENOENT when no resources found
 in i2c_acpi_client_count()
Message-ID: <20251125095046.GB323117@black.igk.intel.com>
References: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com>
 <20251125094249.1627498-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125094249.1627498-2-andriy.shevchenko@linux.intel.com>

On Tue, Nov 25, 2025 at 10:40:11AM +0100, Andy Shevchenko wrote:
> Some users want to return an error to the upper layers when
> i2c_acpi_client_count() returns 0. Follow the common pattern
> in such cases, i.e. return -ENOENT instead of 0.

Well what does 0 mean then?

To me it's logical that i2c_acpi_client_count() as it returns count,
returns 0 if the count is 0. Let's not make it any more complex than that.
;-)

> While at it, fix the kernel-doc warning about missing return value
> description.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index ed90858a27b7..a7d36f8d7f2f 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -84,8 +84,11 @@ static int i2c_acpi_resource_count(struct acpi_resource *ares, void *data)
>   * i2c_acpi_client_count - Count the number of I2cSerialBus resources
>   * @adev:	ACPI device
>   *
> - * Returns the number of I2cSerialBus resources in the ACPI-device's
> + * Return:
> + * The number of I2cSerialBus resources in the ACPI-device's
>   * resource-list; or a negative error code.
> + *
> + * Specifically returns -ENOENT when no resources found.
>   */
>  int i2c_acpi_client_count(struct acpi_device *adev)
>  {
> @@ -97,7 +100,7 @@ int i2c_acpi_client_count(struct acpi_device *adev)
>  		return ret;
>  
>  	acpi_dev_free_resource_list(&r);
> -	return count;
> +	return count ?: -ENOENT;
>  }
>  EXPORT_SYMBOL_GPL(i2c_acpi_client_count);
>  
> -- 
> 2.50.1

