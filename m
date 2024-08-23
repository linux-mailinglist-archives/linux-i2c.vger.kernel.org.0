Return-Path: <linux-i2c+bounces-5761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28F95D19B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5A951F24FAC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5655418C337;
	Fri, 23 Aug 2024 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxqCI/Sr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2ED18BBBF;
	Fri, 23 Aug 2024 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427367; cv=none; b=sabEHe8Iq9Gis8uFw8ocJ/daHh2d8WzwdYeHIjlvq4qKtMPUmtSBEpb6J9qd6bLk7bR1gKJZypRVfji5KILb7tCepiT03Lmt+q/kvZG4DyGwq0d6r2Qbia2A7lOC9ybk1LJjTdkEsHfzICU5bvI3Yz/N+6uvhJ3bxByH8EK14UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427367; c=relaxed/simple;
	bh=Fmvfj70FxEFHjvBGQ4TftIMGQkQPnluG6NV2mGxPfCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av1VhlGWZ8fJT27t5VBVHzW7HFbdCZ686BRxLkWLMdok6dFZfjH2tR6Znj/3/yJFYE9iXLrZpCvaJu0f3IEFuQYQSby0aZPXnb6r+0B6SS15POOflJyv4q1U5vg08V2Eg8vhB8/vnQ6nt9g49m/izj7Yn52QByquMb4vRO2MZ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxqCI/Sr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724427365; x=1755963365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fmvfj70FxEFHjvBGQ4TftIMGQkQPnluG6NV2mGxPfCE=;
  b=fxqCI/Sr3KDmG3AqAyygX4Vm9BA6Tod2/XuZ/AX3BqGaI/HcmzYhX3cs
   3l4bWPFCXfUe5egTwAWZ+W/NVnpDOtfjIdOzGceTzNWhk41CwDaEz1T/L
   /2FWoEqnmwVFvErOUcxAyOeDmpsWPRgtAFOsEeL9NsSllbL7gt3SJyRsd
   Cl4t0efsSSRmp+uQDzajemjoO0ob33kgR0gU94GHlcss1jQdI/T5oRate
   oJvHL+77dyOctMplmlXXiJ8Hu2hYYsSbPtE0iF8dwgkGXiahRPpShetIU
   MGDzc+9SO46uvq21cfjITNWZrXzZOGjPc/yVRe01vLHQMJ/BaSWP4sAXc
   g==;
X-CSE-ConnectionGUID: ZAz/lXMiToa1ics3cuiR3A==
X-CSE-MsgGUID: dAhixueXQtKbiod7wjhVGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="48294902"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="48294902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:36:04 -0700
X-CSE-ConnectionGUID: rS2nG6MhQ1y1AqLhUBf4vA==
X-CSE-MsgGUID: Ifr2ngIWQYW4oUruBgqq7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61823104"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2024 08:36:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B0B6E209; Fri, 23 Aug 2024 18:36:00 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:36:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v3 4/4] i2c: jz4780: Use dev_err_probe()
Message-ID: <ZsisYOLVdVxOxz70@black.fi.intel.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-5-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823035116.21590-5-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:51:16AM +0800, Rong Qianfeng wrote:
> No more special handling needed here, so use dev_err_probe()
> to simplify the code.

Ah, okay. But see below.

...

>  	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  				   &clk_freq);
> -	if (ret) {
> -		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +					"clock-frequency not specified in DT\n");

Besides converting to the i2c_timings and respective APIs...

>  	i2c->speed = clk_freq / 1000;
> -	if (i2c->speed == 0) {
> -		ret = -EINVAL;
> -		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
> -		return ret;
> -	}
> +	if (i2c->speed == 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +					"clock-frequency minimum is 1000\n");

...this makes sense to do with

	struct device *dev = &pdev->dev;
	...
		return dev_err_probe(dev, ...);

And continue with a patch to replace all those &pdev->dev with dev.

-- 
With Best Regards,
Andy Shevchenko



