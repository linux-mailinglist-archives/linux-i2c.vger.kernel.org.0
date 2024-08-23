Return-Path: <linux-i2c+bounces-5760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A05295D177
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D4011C2144F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84639186E33;
	Fri, 23 Aug 2024 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEo05le5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CFB187FFD;
	Fri, 23 Aug 2024 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427230; cv=none; b=Wo0mHf4GJZ6SIQhnGTJpVlC3ugVNO5fGJXCkxKDihYYTTBblDKClm+qdee2nun8MPTSWKEyfcavs5Mq8frYmFuXJOWezArhJZgihavgw50PpWmVgsHSXEHuwyauke+suH5T2aNBaFo9uI8ziZgr4ggKbPY9k9kJkdEvarz1dB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427230; c=relaxed/simple;
	bh=3BbBDobsZnzKQsmNrxzJR5bd1l54D7ceI2SoF0It+SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knvKVX4elX9dCY1zdN+/5pIYrRV6pHFbS+MMGK2M542SPuzvrjelbXXUVMZKaHWwmWKn7BjvXAvRVdpoVNPoSJm3cwuoTanycLjl0wp46E/4Q8DCmNZBJO0dToFLC7iLShcDEn/lzrHm7kcPCM012NkYlaBLXFDEh+uNVtwLIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEo05le5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724427229; x=1755963229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3BbBDobsZnzKQsmNrxzJR5bd1l54D7ceI2SoF0It+SM=;
  b=ZEo05le5OwxeKHBKIt5PFOKcpBtl/3gl5ODIrdOegIPh0zPhBG6x6ANf
   /fiFogWmqtjIC4QlHgfdnxW3QYb7WtT+c/oZgYJ2/u4JyJLV2vj9R6BcI
   HH2hNwkb3hp8Y1cJQThSjSsziNIawyDO70i8tpZ+W6Pu/UdKtNz77NZfO
   LhwPi4qJwnHbLk4HJyId6O0lSY8D6Vhe+bDzr9zJq3G2AepcDamrYvTdh
   2OnkbDMQOcU7eiOp5VnkoeV1RNCXfWgK3yfT2Pr/Va887AYtuS1WPhirY
   wY1eT4eBTyuCGSrhVdfkLYrCffnOrwUQgiTQRhZ0xuS3MysIiKXzfwhZ4
   Q==;
X-CSE-ConnectionGUID: KPFCnwMzRI+IkiCD0CSYmw==
X-CSE-MsgGUID: nGzo63FVQj2Mvq49OaUpRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23081594"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23081594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:33:48 -0700
X-CSE-ConnectionGUID: x5FJ2yfcRb6Znr+8tyXYKQ==
X-CSE-MsgGUID: mEJxqwWvRIGGgDB+fUosKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61847840"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 23 Aug 2024 08:33:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8E55209; Fri, 23 Aug 2024 18:33:44 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:33:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v3 3/4] i2c: jz4780: Use devm_clk_get_enabled() helpers
Message-ID: <Zsir2Lo5TM8YKKrY@black.fi.intel.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-4-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823035116.21590-4-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:51:15AM +0800, Rong Qianfeng wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> While at it, no more special handling needed here, remove the goto
> label "err:".

...

>  	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  				   &clk_freq);

(side note: this driver should use i2c_timings and respective I2C core
APIs instead of this)

>  	if (ret) {
>  		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
> -		goto err;
> +		return ret;

While at it,

		return dev_err_probe(...);

>  	}

>  	i2c->speed = clk_freq / 1000;

(side note: this should be HZ_PER_KHZ from units.h)

>  	if (i2c->speed == 0) {
>  		ret = -EINVAL;
>  		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
> -		goto err;
> +		return ret;

		return dev_err_probe(...);

>  	}

...

>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
> -		goto err;
> +		return ret;
>  	i2c->irq = ret;

I would add a blank line here.

>  	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
>  			       dev_name(&pdev->dev), i2c);
>  	if (ret)
> -		goto err;
> +		return ret;


-- 
With Best Regards,
Andy Shevchenko



