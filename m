Return-Path: <linux-i2c+bounces-5759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63595D169
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1C7284638
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3217318890B;
	Fri, 23 Aug 2024 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnca2AZR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC56186295;
	Fri, 23 Aug 2024 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427043; cv=none; b=que6G8aAP6w97HW7PK2NA78Qy0V4aiHqxmWpqN+zk8lBqTq+PxgyCfB2OuEx6kmvrmvVhK2ZsmGN40VhCmTHwLNUXfK2Ay+FqzmhpNneg5F+dnt1rG6Xnok4+I4sqTV8AHzk0RS9UAiTKCzHpUMDkvS57iJ5YKkfFPYnfOT/Cc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427043; c=relaxed/simple;
	bh=kCb0qf3frDaVNH10iQvkHcTOZpKtB2zTgvyCiSJzD2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaqxnGfVrtv/XzCSUx9j19lVyc47A4RNUuLapY2tzam9SMmRcQSRmSDLrA0fHZHRx/hpymSZ4kHd0otyrVmUdeEr5r9WrtLcNGvteFIRMtvgAe/N2PkUsTpGoH1+u19UVSsIhjMhw3Kw6Ds9sDVlCuShkdsyGCwrNg6p4hZ+ISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnca2AZR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724427041; x=1755963041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kCb0qf3frDaVNH10iQvkHcTOZpKtB2zTgvyCiSJzD2E=;
  b=hnca2AZR731QzDVBIGdrCRmJGxyy4vSLXQ2NmuK7hM2PH9fwHEViXV2e
   t+ABB4UVzRlFTm4DW8rJVDAiHu+5VO0riPEIfxgd2afhrEjTh6jxNo9TK
   lYSsWuD9AY5HZVuKTMI84bJjJEADWukZCU79iZ3jZMSholuKwiPx14ksd
   AOxSHxPtNyl3uKPfSw1vH+hvwVVomYJOGRqr0mfOUYXuyYeU4lghj5h29
   kAjjEmbf30f2luY+REA+zPCFhijsxLm9O1DL4O6sgCcI+y2gR9q21f/1d
   WQ8BwxvqPnWkzCtaKT/tGNGmUF2J4lKoPF2utzQc7tCZj9FBwQXvIRjEQ
   A==;
X-CSE-ConnectionGUID: l1otv91aQ3WBRVQCXuBr9Q==
X-CSE-MsgGUID: 9TaE1o8SQx28CujGtxRLgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23070139"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23070139"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:30:40 -0700
X-CSE-ConnectionGUID: JxwaESHRTtmmEkeIvIRAQw==
X-CSE-MsgGUID: IYq6XVg9TJupJRutz8aNpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61680496"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 23 Aug 2024 08:30:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 77F64209; Fri, 23 Aug 2024 18:30:36 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:30:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v3 1/4] i2c: emev2: Use devm_clk_get_enabled() helpers
Message-ID: <ZsirHLneY1FiOStJ@black.fi.intel.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-2-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823035116.21590-2-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:51:13AM +0800, Rong Qianfeng wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().

...

>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
> -		goto err_clk;
> +		return ret;
>  	priv->irq = ret;

(1)

>  	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
>  				"em_i2c", priv);
>  	if (ret)
> -		goto err_clk;
> +		return ret;
>  

>  	ret = i2c_add_adapter(&priv->adap);

>  

While at it, you may move this blank line to (1) above.

>  	if (ret)
> -		goto err_clk;
> +		return ret;


-- 
With Best Regards,
Andy Shevchenko



