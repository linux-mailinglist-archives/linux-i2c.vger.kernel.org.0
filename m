Return-Path: <linux-i2c+bounces-1587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7CC8456B3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 12:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7991F25FAD
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1775415D5BB;
	Thu,  1 Feb 2024 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aer6V52l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9FA15CD76
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788773; cv=none; b=Zk84LcclecWLBYuaigzXMVzfOgk1XO4Pt05XMHBXKd/8UIDZ4lkYYWtuFTjd4Jr2YV5d3JnxUn3THXkig16IGpCCOz7rXHQUsjMzlEgJkD8/eC2mZGh7/+7be/6yl1aLon5ZMpbSwZPgT7Qo+vBleBcVAKTmsHeMPJiX23YSJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788773; c=relaxed/simple;
	bh=fGisqsNWKySzDDozins5KfoINvrR5jFi657cn9t62e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc3pWEx2c8vjRW6KI1uRZSChv3s70QSs/4g1wSgUjB9/Cwj46dZt6Bxinm8+KLAuhK4stDnojy0PJUgZLyYpNVaar0uFkMRIv/H5yVN0fMwBl5qYvQxLaVZgpTDKsOEroCJYCTRF7NuZhy9kVhvQymtQS3JruWfGwI2nYBEIF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aer6V52l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706788772; x=1738324772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fGisqsNWKySzDDozins5KfoINvrR5jFi657cn9t62e8=;
  b=Aer6V52ll/xP/Rcrp8bOnQXpqbW1fpCJyq5SNUUP9BxlFSI0fJ73WVpV
   uBDLu0Ca27Y/dNjvQEdL0InynqGkLZJoPd+B9VZKfZ+03c8yJC3pMIWMb
   66HQhZJ4Avi70Y47utfb07epm8ba81KONGh8mPYmXAlF4zuxYwrAcknac
   gr/UN9GOG+QDQbjsIlFT3+ViNkeYfPEQkaR05f3v4qv4l6gga771zxh/s
   XYEAMp44kNN1ONtr0638Jc4Lqxz0RfT4yLEggeXrf++3je5zQrnGfpUJ+
   05cO7ZcAfV4J0VF4clN8e0g4XSRxrJ/cVWDrRzhGu2iMbOtKoMCe6xRr+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10531073"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="10531073"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738409874"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738409874"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:59:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVVgu-00000000pAX-0reG;
	Thu, 01 Feb 2024 13:57:12 +0200
Date: Thu, 1 Feb 2024 13:57:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@smile.fi.intel.com, Michael J <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 1/6] i2c: designware: Uniform initialization flow for
 polling mode
Message-ID: <ZbuHF31mMv_KN2J4@smile.fi.intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <20240131141653.2689260-2-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131141653.2689260-2-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 31, 2024 at 04:16:47PM +0200, Jarkko Nikula wrote:
> Currently initialization flow in i2c_dw_probe_master() skips a few steps
> and has code duplication for polling mode implementation.
> 
> Simplify this by adding a new ACCESS_POLLING flag that is set for those
> two platforms that currently use polling mode and use it to skip
> interrupt handler setup.

...

>  #define ACCESS_INTR_MASK			BIT(0)
>  #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
>  #define ARBITRATION_SEMAPHORE			BIT(2)
> +#define ACCESS_POLLING				BIT(3)

For the sake of consistency, you may incorporate internal patch from somebody
else to move to the same prefix  (namespace) for ARBITRATION_SEMAPHORE.

...

> +	if (!(dev->flags & ACCESS_POLLING)) {

Actually seems to me that is better to have in a separate helper and you
then can do here something like

	ret = i2c_dw_request_irq(...);
	if (ret)
		return ret;

> +		ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,
> +				       irq_flags, dev_name(dev->dev), dev);
> +		if (ret) {
> +			dev_err(dev->dev, "failure requesting irq %i: %d\n",
> +				dev->irq, ret);
> +			return ret;
> +		}

-- 
With Best Regards,
Andy Shevchenko



