Return-Path: <linux-i2c+bounces-3725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B88D5E27
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 11:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD6A28331A
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 09:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AD978C9A;
	Fri, 31 May 2024 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2kWpwgz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB337710F
	for <linux-i2c@vger.kernel.org>; Fri, 31 May 2024 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147413; cv=none; b=no1Pkh2kGlsxD48rSB5qcuEuYI91FOex6ewMEqqYrJwh0zUAl1LUtOtqWdLrWy/9A9ffuhRjF0CiKNpD7e4TiLOijuD9wn6l/rm5viDI2P3mMEWqDcjAyTnp1qPV1epdSDLRn3JsRLELNfCe2zZpyBKJr5i+lr5XqY3+HGMc/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147413; c=relaxed/simple;
	bh=dEMpqSZf7bc1Gd+YYiufp13btahNKFL8jC5AiXridI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpV4VP67NR90Vy4I2o4Tvk3rYIa5cALuxQ0cQM6oZ5NHziCNXGGxq5E90GWzJXc0OXCNKDLKLxEVPVz+RQVKXL+6RZGjjuZiDy8lx2Yy82eGjH8msZhtHJiyhspjesSO9v7xDrNzdGeJYenY/HCu10Yf2jn+XaR46rR40DRNSiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2kWpwgz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717147412; x=1748683412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dEMpqSZf7bc1Gd+YYiufp13btahNKFL8jC5AiXridI8=;
  b=V2kWpwgzAb2LevKNFd291JwC/TjwAqnsxaYI0azllqAQ/Ga8ohWFyYwl
   fU2Ssz45NFjoDadZ9T4HErZK2ijTR23XiVSrNiVXKrLTLfUcY00NYgDPl
   NPmCAWNbs2fuGwICpbYANMJT5/P8ka6rNsIidrZ4YnaTFmGUAxGIU0Bdo
   4nbpRnA07o+AZHim2e3VKP7jISMNa8j1sVpbXlV0I5Vzbi1yIKp5t58qR
   xrj9hN2Vy/9ZlBq4AzzCo2tk81pxdYgaazkWkwWL4ymF4T8JWngdwBeXt
   omH+30y+7Pcr2DA9CDgyppSTN4wCk+4zjAYNALSPdCXIaVm+lwvfzuLum
   Q==;
X-CSE-ConnectionGUID: hKz4s95YT564yRueiWKYWw==
X-CSE-MsgGUID: S3+K6CY5StiJhBR9lvngDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13853118"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="13853118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 02:23:31 -0700
X-CSE-ConnectionGUID: vCvvksnKRMOUSrFuQ4xwWQ==
X-CSE-MsgGUID: GfxvELlsStGq07K9HdWRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="40667003"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 02:23:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCyTu-0000000CQXt-2P4r;
	Fri, 31 May 2024 12:23:26 +0300
Date: Fri, 31 May 2024 12:23:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
	Luis Oliveira <lolivei@synopsys.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: designware: Fix the functionality flags of the
 slave-only interface
Message-ID: <ZlmXDgHnWNvVIN20@smile.fi.intel.com>
References: <20240531111748.441a85b6@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531111748.441a85b6@endymion.delvare>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 11:17:48AM +0200, Jean Delvare wrote:
> When an I2C adapter acts only as a slave, it should not claim to
> support I2C master capabilities.
> 
> Fixes: 5b6d721b266a ("i2c: designware: enable SLAVE in platform module")
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

The below can be separated by

---

to avoid noise in the commit messages. The effect, namely Cc'ing to people,
will stay the same.

> Cc: Luis Oliveira <lolivei@synopsys.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Jan Dabros <jsd@semihalf.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> ---

Other than that, LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/i2c/busses/i2c-designware-slave.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-6.9.orig/drivers/i2c/busses/i2c-designware-slave.c
> +++ linux-6.9/drivers/i2c/busses/i2c-designware-slave.c
> @@ -220,7 +220,7 @@ static const struct i2c_algorithm i2c_dw
>  
>  void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
>  {
> -	dev->functionality = I2C_FUNC_SLAVE | DW_IC_DEFAULT_FUNCTIONALITY;
> +	dev->functionality = I2C_FUNC_SLAVE;
>  
>  	dev->slave_cfg = DW_IC_CON_RX_FIFO_FULL_HLD_CTRL |
>  			 DW_IC_CON_RESTART_EN | DW_IC_CON_STOP_DET_IFADDRESSED;

-- 
With Best Regards,
Andy Shevchenko



