Return-Path: <linux-i2c+bounces-15155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC1D1E8F2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 12:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C04DD30034A7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 11:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C054D396B86;
	Wed, 14 Jan 2026 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LneZHLSk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CE335542;
	Wed, 14 Jan 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391609; cv=none; b=RV/rBq5H67lLjBm09/amu4M3K3OpqD6+Eg2vbImMiDE49e2lMXdiq4ugA680dY11/D5po1cj59+1ACfotWPOPAjK8jlTECLpDFAJj7lrB2U6pN9yq31VNECoAcdbsPSDp8plhjd1x+M728dedzzgm0izCc4CUkf7gtbrNq4wdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391609; c=relaxed/simple;
	bh=zvET7IaVfhQ1RPfvMNwMlFZZ82ZNpf5ywkZcCztOsNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgUFwZn2rrPmyKLiZpvnqMNKyzLn+PEUGuKnIg3RE37bAA0YhXn249g1EPNPsCkACnoDfQ08wmBBNdLIVrUHRI3MwTP23XrS0Sthet5mVKs+sqdCVaUVEL2X7sFek7DJ83mJRttmmltk2tp3qUMm81G56UlrldSJfn5KahR7OiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LneZHLSk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768391605; x=1799927605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zvET7IaVfhQ1RPfvMNwMlFZZ82ZNpf5ywkZcCztOsNU=;
  b=LneZHLSkpMiZtZND6U3s5Urbr3RY9xGn8rxwHzNoZmrgnWT9dOgqQbbm
   TKDX+C2zGaCst3G144dF/9U34FVj0XaDI18FhS3BlCiZ5GPyJS/0XZE3S
   mod5Ql9WU4JSMieGAbPdB7sGD40x6DLygTW5KNQXQh9tqPNfz5dE0Tb5Y
   EfWe+04bLwv4xga6iKsbDzQCo9aKJFFPdJXHRYIzqMvoBaEcdjF0M5ey4
   f6+dr6+ctEdVrb4dJ5jaIi3e5vRDtqmL9M3BuvCHV6OjstSspl/4NzEJo
   IPrhELcIkWU69dxUP+ytNU+VMHwWWyrx2ReaP7H5snc+zRQTqpHWskFdz
   w==;
X-CSE-ConnectionGUID: rKqXzXZfRwiKap1pXPtBGA==
X-CSE-MsgGUID: ufmgizkKS1mAFBAvijZPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69597321"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69597321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:53:18 -0800
X-CSE-ConnectionGUID: HJhoFJGATamNRxP9seYqhw==
X-CSE-MsgGUID: C95i6pClRKOMy9n5rPRnKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205082558"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 03:53:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4430C98; Wed, 14 Jan 2026 12:53:04 +0100 (CET)
Date: Wed, 14 Jan 2026 12:53:04 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Use device_is_compatible()
 instead of custom approach
Message-ID: <20260114115304.GC2275908@black.igk.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>

On Wed, Jan 14, 2026 at 09:17:51AM +0100, Andy Shevchenko wrote:
> We use MODEL_MSCC_OCELOT effectively is a flag for comparing against

as a flag?

> "compatible" property. Use device_is_compatible() directly to make it
> clear.

Okay but if something else ever needs this same quirk then we would need to
add new entry here and also to the IDs list.

With the flag you can have the IDs in a single place not all over the
driver.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c  | 6 +-----
>  drivers/i2c/busses/i2c-designware-core.h    | 1 -
>  drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
>  3 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 5b1e8f74c4ac..c766d9821975 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -238,14 +238,10 @@ static void i2c_dw_of_configure(struct device *device)
>  	struct platform_device *pdev = to_platform_device(device);
>  	struct dw_i2c_dev *dev = dev_get_drvdata(device);
>  
> -	switch (dev->flags & MODEL_MASK) {
> -	case MODEL_MSCC_OCELOT:
> +	if (device_is_compatible(dev->dev, "mscc,ocelot-i2c")) {
>  		dev->ext = devm_platform_ioremap_resource(pdev, 1);
>  		if (!IS_ERR(dev->ext))
>  			dev->set_sda_hold_time = mscc_twi_set_sda_hold_time;
> -		break;
> -	default:
> -		break;
>  	}
>  }
>  
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index cf0364079b55..10055f0e0ec3 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -313,7 +313,6 @@ struct dw_i2c_dev {
>  #define ARBITRATION_SEMAPHORE			BIT(2)
>  #define ACCESS_POLLING				BIT(3)
>  
> -#define MODEL_MSCC_OCELOT			BIT(8)
>  #define MODEL_AMD_NAVI_GPU			BIT(10)
>  #define MODEL_WANGXUN_SP			BIT(11)
>  #define MODEL_MASK				GENMASK(11, 8)
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 2e532f16691b..4e6fe3b55322 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -267,7 +267,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id dw_i2c_of_match[] = {
> -	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
> +	{ .compatible = "mscc,ocelot-i2c" },
>  	{ .compatible = "snps,designware-i2c" },
>  	{}
>  };
> -- 
> 2.50.1

