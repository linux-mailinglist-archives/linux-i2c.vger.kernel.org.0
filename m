Return-Path: <linux-i2c+bounces-6731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A669788D0
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 21:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EFDE1C2285B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D16884E11;
	Fri, 13 Sep 2024 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxGgbAxs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7F0145B01
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255196; cv=none; b=WjmJWibzfQ+5xECmlRhNzIa15WB4L5O2XO+Z4mGHW2BRBIG/vqi6684T9DmI/fgYRRn4x/DGiIAW3UyfxeOhbqCNZ7g2lDeeuXFzneKvkYfzN0N6F/f5/zr8u6/K6KyD5S9bgeygUPND5akAuX7DBlM7L7S+eJBnp2RNPfNqfFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255196; c=relaxed/simple;
	bh=Uj5H34QvmB79Vewgh7Q0aZpXaVIyiEyzaJUTu0+wv0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX/pciOL46t0rD/+2Da19Npb/v49SUD5yXvhGg+rzIc6JZLsx/W//BoSnpInsfOzZNEKKGFNj9BUi1IfK5M4zHO3Uj6UTT+sKk0rssoU1stZWaAYPBY6zdz88bKYC3lHu4sEtbzgWoozhxF4vEgrFxJXNiidLNLjEz1fezQ0S74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxGgbAxs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726255195; x=1757791195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uj5H34QvmB79Vewgh7Q0aZpXaVIyiEyzaJUTu0+wv0U=;
  b=DxGgbAxsep2BElYAiPuxuwmO2SDZe8wVTzNI3phKbW5Sc1qGFlzAJhx9
   z7ZAAgOkE1VopntFbfL6ammJYl8AcLaWBavZk3fxQyTr++XpRx6FGk9nu
   ggHX3o/dMLfVJ8BUGWdCXgyUiJ1NIJCuyfsUIZjbNqLV1mRXKPWMNWhXb
   eWyDf0VWDMsQj0BrCqpeJ33KMqdn0bVzSoYel7p/jSu0eqGE3Sgmu/FET
   5Cx6WIn1DPXIn86wlw6f/t9K8TguS8YxPDRlMLuIAiitUrlGdd7QtnkWg
   KZuARKmsBGQ6js1Xj94CCX9KIohtyTcdnolr2LHiQdJvfh31f+zz/F9re
   A==;
X-CSE-ConnectionGUID: mEknZdxHRpuLRLLSO+E5Jw==
X-CSE-MsgGUID: mWbxLqpUSiW1LpcvLLNUsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="50584159"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="50584159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:19:55 -0700
X-CSE-ConnectionGUID: GyuiJKysT0C93QDrqepn/Q==
X-CSE-MsgGUID: SWgKZTm5T4mxPZjE0ElBYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68672311"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:19:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBpe-00000008P5u-2MBB;
	Fri, 13 Sep 2024 22:19:50 +0300
Date: Fri, 13 Sep 2024 22:19:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 7/8] i2c: amd-asf: Clear remote IRR bit to get
 successive interrupt
Message-ID: <ZuSQVpIqM3yOSuf4@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:09PM +0530, Shyam Sundar S K wrote:
> To ensure successive interrupts upon packet reception, it is necessary to
> clear the remote IRR bit by writing the interrupt number to the EOI
> register. The base address for this operation is provided by the BIOS and
> retrieved by the driver by traversing the ASF object's namespace.

...

> +	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!eoi_addr)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
> +
> +	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
> +	if (!asf_dev->eoi_base)
> +		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");

Home grown copy of devm_platform_ioremap_resource().

-- 
With Best Regards,
Andy Shevchenko



