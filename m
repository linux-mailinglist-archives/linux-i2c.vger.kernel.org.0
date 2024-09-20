Return-Path: <linux-i2c+bounces-6914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B397D97A
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 19:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6E61C2159B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 17:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0DF17C216;
	Fri, 20 Sep 2024 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDlF/mXX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21819376E9
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726855184; cv=none; b=T04V7JIHl8yP9dnLZodZ/d8gaovvYRQ0+j+0S9unHbITpY2pXu0CVK7n7THmD2UYEoKzl6oGznsQtS3qiUTKDt70Oq4jVDb8ceHjWiEy54hhNfVG2t1AAKkYi6ImgIgN++siAKpH88u/1fuJv+OKU+Bccf6vkyDZGhvVw8+36RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726855184; c=relaxed/simple;
	bh=TZ9rpp6bLIjpyKwb29yph2AXKB0G8Ri1F006OdL9PR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1WaEYFmZHMFvq4DmGCpJm+9Y7K3xTGCWHBjPzLxsWSBX9xar08EbmnPo8/1HCNHkVjZXALg61u4cLbws3/X8AZtxxOnrhIX1olx51ptElvtn2pdRwLAL8HdN8d25pClh5LfEDcaYgOsrnfkF8b+OCWyir5SqWJoK6zMxPLz75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDlF/mXX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726855183; x=1758391183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TZ9rpp6bLIjpyKwb29yph2AXKB0G8Ri1F006OdL9PR4=;
  b=dDlF/mXXpnNQWipC6P1U8sTHkOY62gnPFgF1OPsLZYHuYlVxRI5iQNOm
   VNGDzExJYmBN8x8aLhp5GUXAbdABEu66Z3m4xivGzJlHGH1M69OXSriG9
   btm+SJQBIogmzP4mhXfsPFk2Inmg/g7zMx/KEnhLKWbz8E+9+np2cXchr
   93fqkNFX6qgcwa9FxqVhIGTYuKxDhIw+pgnCcfWpzenmQtceDWmfCon5w
   VlSW2PQzJzX4HFTGlXTWMPOcGEiN4/lATJk+jqO8rOng9KtRZlecYf5ta
   qHxOjBQjZ+f2iZrGpWnAKSL7B/RhwN7uWaR4n99xJogzfZ4O7uBGFZCMh
   g==;
X-CSE-ConnectionGUID: 3oZ7+f1BS2K3NfJ6mszNLQ==
X-CSE-MsgGUID: +EMFd07KT/G/IkqbWu3FSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25992057"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25992057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:59:43 -0700
X-CSE-ConnectionGUID: hnJe+H3GRBqxs5nVYUDAxw==
X-CSE-MsgGUID: N+Kf9FJHTZeAXAT70nHtwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70255879"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:59:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srhus-0000000Azv2-18Hx;
	Fri, 20 Sep 2024 20:59:38 +0300
Date: Fri, 20 Sep 2024 20:59:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 7/8] i2c: amd-asf: Clear remote IRR bit to get
 successive interrupt
Message-ID: <Zu24CtPcdO_aINJk@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-8-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-8-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:12PM +0530, Shyam Sundar S K wrote:
> To ensure successive interrupts upon packet reception, it is necessary to
> clear the remote IRR bit by writing the interrupt number to the EOI
> register. The base address for this operation is provided by the BIOS and
> retrieved by the driver by traversing the ASF object's namespace.

...

> +	/*
> +	 * The resource obtained via ACPI might not belong to the ASF device address space. Instead,
> +	 * it could be within other IP blocks of the ASIC, which are crucial for generating
> +	 * subsequent interrupts. Therefore, we avoid using devm_platform_ioremap_resource() and

> +	 * instead use platform_get_resource() and devm_ioremap() separately to prevent any address

s/instead//

> +	 * space conflicts.
> +	 */
> +	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!eoi_addr)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
> +
> +	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
> +	if (!asf_dev->eoi_base)
> +		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");

...

With the above change being applied,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



