Return-Path: <linux-i2c+bounces-2556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EC6887077
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D5D1C22B0E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 16:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF045CDE1;
	Fri, 22 Mar 2024 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVysgCUj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F756B68;
	Fri, 22 Mar 2024 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711123793; cv=none; b=mvVV5lGmPvFONA/9SzFOVLBXBb3Y7O397f3B1Si0qyZhhle8IlFYYs5gmnzEtEikMtay8bdN3nMv1+GhaEveYk6mD1nLcr865NaqOQtXmgme3vAWRTxHc/x/oL6BtujPEgEPfjau8BTgk7C53PJXd/URTvur2zpCocK02CAAmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711123793; c=relaxed/simple;
	bh=cuGiQISoVKHBaZbLIVHnraYHHoAO1WEtkqCEo2+zeaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgIQDnKLsWYegyurwm54nDb/XG953mH0sPvGOkZqQe9uqJ8cEStDIB9Sn2F/j/HHkunlpB8zsm++m6lnam9JT+VqvlWYtxVeWo/bkU2ydomEmK0D9/fBlO9ssIwtZsrNNDlQKDbZXaAsL3CPFOCupypUJajt2EmStdutAhYy+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVysgCUj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711123793; x=1742659793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuGiQISoVKHBaZbLIVHnraYHHoAO1WEtkqCEo2+zeaY=;
  b=cVysgCUjthGXsXESrmm6GvwBx3Ubd3mW30jUrr6yqd1d+PIwUoQCDscs
   szlw+EIeVIN9I1FabCKBUzlt7qLnfoKqfL3QmxnBsRYiRwkbH68qs4BIL
   cweH4b76wwphHndDsgb3NIOzIr3Gy6iiZT6RASzNib6olEPHxKyzUNEbe
   7mIfLJ44yc13Lq4JO4SpcUMa2RCk5teisaG1D0rf3e8gmw4HZ78EuIcFV
   l1v1dnGAHPTA63f77HJ5tk1UKfXBm+62cp1lGSX8j6s68CJ9qtzChnPWz
   /a8hOhJsRS2f6VZjn4LDg+MS6qlODy/6wTTfPh2EIO2SWPAcW3q8SG4lO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23634248"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="23634248"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914747988"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914747988"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:09:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rnhSi-0000000FCTj-1lkG;
	Fri, 22 Mar 2024 18:09:44 +0200
Date: Fri, 22 Mar 2024 18:09:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 22, 2024 at 02:25:57PM +0100, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.

...

>  static const struct i2c_algorithm at91_twi_algorithm = {
> -	.master_xfer	= at91_twi_xfer,
> +	.xfer	= at91_twi_xfer,

Seems you made this by a script, can you check the indentations afterwards?

>  	.functionality	= at91_twi_func,
>  };

-- 
With Best Regards,
Andy Shevchenko



