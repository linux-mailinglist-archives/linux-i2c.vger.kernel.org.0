Return-Path: <linux-i2c+bounces-6978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F1985641
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 11:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91028B236C3
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB0615B966;
	Wed, 25 Sep 2024 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdF6zM1X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776215B145;
	Wed, 25 Sep 2024 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727256088; cv=none; b=Y+cCiplV8I1lYzLiX1vxyxV9kHxNfT3j6Kty08Rg4E397iCRHp7Kf7ctay98lxiKK0mWitLjYO4BJrt5gRHOLph8qNBaEYmp297KD6MwUw5QWJ7iypqo5uelb/y+84gA5KIUi+Xjcrj/fqMKnvhGHHB6N6Zf5ykzUWYCv6/H9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727256088; c=relaxed/simple;
	bh=/y1sA1GCRw659rWxFaPVv+MoUehAK7pmrOc/uRGIEW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTgwJGKiOdVfzPTSi7v7X2tFjs8CmSJIDcg1EhD93SFKxG+qYqCClt3iD9f11Hwqbzh4r3oCnXLb/r20pByptVFKE4nRK5g0mrbBV0JlCTbPG15gYhCWjiGy7w2l+C+vdmlNRiMxfeiWMqPZY7cky7vwSkxx+WlQQb66c5YY/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdF6zM1X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727256086; x=1758792086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/y1sA1GCRw659rWxFaPVv+MoUehAK7pmrOc/uRGIEW8=;
  b=CdF6zM1Xc0O7D1Ptw8auIk0sdF5k6E9+fTQlVe2EU5ZEpnJFhhh5bF3B
   +JGQ7ZdyNf3OifziAdIi6U7EyhnGZtxFhtgtwZfSjBVqbNFeQjPaSFaVA
   1X17fdqOdjMjEFjz9zm3timKrQqu1yKeVrEv73DFsAJKJBfa1WosGsEYG
   z0VWWVlD12uxT7TG7/U/aKAiQYVd1x61icwO8VxR5pvA5PZhTXUKVTqBh
   JcGTzpiuaRyCBMC+9EjGF9+ZPm6EPIdmOCF+RRQSEVINzfmsjdMuxGIZG
   VdVpI3051lF9ryuueqiFJoYJAVHg2eyOcHkSiIdTxrFSU20s0mw0d/SdT
   A==;
X-CSE-ConnectionGUID: iGaQZWuvRx+yNvGFqNTXfg==
X-CSE-MsgGUID: Kn2AzGZmSzW5LnkRUiJahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26389415"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26389415"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:21:25 -0700
X-CSE-ConnectionGUID: QMIXrMshRhCpdNGCNjFXGQ==
X-CSE-MsgGUID: LExQES8PT7CxTK7abGUajw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="102524909"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:21:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stOD3-0000000ClFO-04mb;
	Wed, 25 Sep 2024 12:21:21 +0300
Date: Wed, 25 Sep 2024 12:21:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Wu <michael.wu@kneron.us>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Message-ID: <ZvPWEFWk_MG5SsCg@smile.fi.intel.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 25, 2024 at 12:16:10PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 25, 2024 at 04:04:30PM +0800, Michael Wu wrote:

...

> > + * @bus_loading: for high speed mode, the bus loading affects the high and low
> > + *	pulse width of SCL
> 
> This is bad naming, better is bus_capacitance.

Even more specific bus_capacitance_pf as we usually add physical units to the
variable names, so we immediately understand from the code the order of
numbers and their physical meanings.

-- 
With Best Regards,
Andy Shevchenko



