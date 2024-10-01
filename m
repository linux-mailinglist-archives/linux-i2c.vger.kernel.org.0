Return-Path: <linux-i2c+bounces-7146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE698BCF8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 15:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D5281C2381C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0CC1C2338;
	Tue,  1 Oct 2024 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wv+cumaM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D5637;
	Tue,  1 Oct 2024 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787667; cv=none; b=hyDpuLeb72btdP2qbT/mGGTiS/pNtV5uP9ony1DzEd6qy1QS7NAQP6NEHg3//wsfapehRPPEGAqAFI4sTIFHy5WS39W7Kol7KXgPSqsFmAY29+R9/KS0H3nseHl4smEBklbJq5A1VcB+tjlTSeHqnsyPxbhCGiFMvsOrN7d6cYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787667; c=relaxed/simple;
	bh=R+raIcKFhEY6v2icKc4lD2NDCqcyjJdPJWGmY0vPyS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh8YvRYI2bbLa+AtUjQKK0si2xRdJlwX/FGK/FDV7yhvvx9AGcLabpLkTXoFuBdxbC/TmOtI2RYoOvX2NijxPyiIP4eCXGLiqoXohF6Hd0PYPzj/0Z/xOSMrXy840RnUvVLS1CSbUDs2d1as0k0PuPj/JT2f5ivOXyvzngfJiME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wv+cumaM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727787665; x=1759323665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R+raIcKFhEY6v2icKc4lD2NDCqcyjJdPJWGmY0vPyS4=;
  b=Wv+cumaMCXXqs/HurTpQIuacBoGCR+ZaESviUIbECYXrcMiRhmrZNouZ
   chaBhGSmfv6RAGbUcQRtbN8uWkPj6xfz114L2xePxLLibt/4xAN6AAGOL
   Tez7zZ48FJo31mDbrxB1ZJTQbfxzZu/2h5njf1pVauvjopHAV0/gg41VC
   uc/XlKeTowFvPGMderg656QJUniVIe18kTgVtNMUV6KQV4UI6g6b5lWCI
   FwHwOkNjtDktmtCLwstTDX6ebr7Qufve3XGkk8Mk9Uda8Dik8+vgE1frt
   xKgDn49kvX2GnprvyxYHdk1pRREiigbI5O6ti65HQmqqrU2N11V1yND15
   A==;
X-CSE-ConnectionGUID: qdsxX3e1SjesZrvyoensqQ==
X-CSE-MsgGUID: Dv2lCH0eS8Ot0YeprdOlFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="29802313"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="29802313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:01:04 -0700
X-CSE-ConnectionGUID: QtzwuE4WQnqea3wKHo7IOg==
X-CSE-MsgGUID: MN8lmyvDTLCU6mlEIfT0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73319461"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:01:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svcUs-0000000FCL5-1IZ0;
	Tue, 01 Oct 2024 16:00:58 +0300
Date: Tue, 1 Oct 2024 16:00:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Wu <michael.wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v3 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Message-ID: <Zvvyii7aViGCklcT@smile.fi.intel.com>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-3-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001082937.680372-3-michael.wu@kneron.us>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 01, 2024 at 04:29:34PM +0800, Michael Wu wrote:
> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
> for High Speed Mode") hs_hcnt and hs_lcnt are calculated based on fixed
> tHIGH = 160 and tLOW = 120. However, the set of these fixed values only
> applies to the combination of hardware parameters IC_CAP_LOADING = 400pF
> and IC_CLK_FREQ_OPTIMIZATION = 1. Outside of this combination, if these
> fixed tHIGH = 160 and tLOW = 120 are still used, the calculated hs_hcnt
> and hs_lcnt may not be small enough, making it impossible for the SCL
> frequency to reach 3.4 MHz.
> 
> Section 3.15.4.5 in DesignWare DW_apb_i2b Databook v2.03 says that when
> IC_CLK_FREQ_OPTIMIZATION = 0,
> 
>     MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 120 ns for 3.4 Mbps, bus loading = 400pF
>     MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> and section 3.15.4.6 says that when IC_CLK_FREQ_OPTIMIZATION = 1,
> 
>     MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 160 ns for 3.4 Mbps, bus loading = 400pF
>     MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> In order to calculate more accurate hs_hcnt amd hs_lcnt, two hardware
> parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
> considered together.

...

> + * @bus_capacitance_pf: bus capacitance in picofarads

Since it seems a new version of the series is warranted, and looking into
the current kernel source (no other users of this unit were observed),
I think we may do correct capitalisation here for the sake of physics
and unit system, i.e.

 * @bus_capacitance_pF: bus capacitance in picofarads


-- 
With Best Regards,
Andy Shevchenko



