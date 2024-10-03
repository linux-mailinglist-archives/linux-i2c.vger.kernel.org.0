Return-Path: <linux-i2c+bounces-7204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A485D98EE57
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 13:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9751C21800
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 11:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E571552ED;
	Thu,  3 Oct 2024 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmdpvfWU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60B154434;
	Thu,  3 Oct 2024 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955704; cv=none; b=oR36DPKDsjDUzqFk4H0elWQvhx9JHuGvo32J9/KdauVe8FcAwin+/vdswyeK/hpr7xjSyAkQkp1cJ/X/nJDvHDZ1KlgTuKEDXQoKvsQ1VfxEWtoH/o6vHDrCT03swf6MJ3mRyDIfs669G7U1o3ObeEU5P+VQJi5qdR2tYO3rllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955704; c=relaxed/simple;
	bh=wNrw4eZwzrrYs1rZs/Rki+ec5IFjk/dB5RKKPmVtwM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGHoghH1lwo2OAqE03nVbZALbxILMGS4LXYHT94G1t5vSN2m7xSCbMAl02N7wUl6LlvlAEFSe8QxIvfTFXx8MdF2d/7euo6AC2AuvvYY1h6nxT/IlIHGYTKvIg6u6wnNjQYHwOCVvW0l5sX01eGhVeR6ngO2SysSnasptj3NQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmdpvfWU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727955701; x=1759491701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wNrw4eZwzrrYs1rZs/Rki+ec5IFjk/dB5RKKPmVtwM8=;
  b=EmdpvfWU+86RRy7kmMs0yWjryI5M4cQvM42JgwR/LcT2PZhS1lnMaduL
   KlJMHXHO6dVIG6xKsLMrWCesktYukRfMksP+2e7nBUk9k+byZcfDB+Nr0
   OqLZs1wPZZFy4/n+Yp0hyght6UnFTZJ0+rEQ2/r9CflS2ARt+2cdcMoyw
   g7v8n6yXvDpeXfNuCdNY/J1PlUniXkkmahciwnvHi7Wi3tSxWkGudaIp0
   iyWOX4NKPni/H/vy5lNidltL7PQK6HqfILX8Awq7VbPy/FcIsgoSYxSHA
   rlwej9igKc9LjMcq5p7t+cJVhuLGlCeiWlr40LgFKH3E7s+e4nzOT/3L6
   Q==;
X-CSE-ConnectionGUID: e0rRGs/RRCu/vfnaQ02oIA==
X-CSE-MsgGUID: y2DJdveiS96i9UXBh7VJYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37703061"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="37703061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:41:41 -0700
X-CSE-ConnectionGUID: /rMF49kITt+iLedw14j6OQ==
X-CSE-MsgGUID: idKEmBdMQlq9C1jFiq1usQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74315091"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:41:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1swKDB-0000000G74l-1nNG;
	Thu, 03 Oct 2024 14:41:37 +0300
Date: Thu, 3 Oct 2024 14:41:37 +0300
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
Subject: Re: [PATCH v4 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Message-ID: <Zv6C8Zj4NabZf_PM@smile.fi.intel.com>
References: <20241003111525.779410-1-michael.wu@kneron.us>
 <20241003111525.779410-3-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003111525.779410-3-michael.wu@kneron.us>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 03, 2024 at 07:15:24PM +0800, Michael Wu wrote:
> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
> for High Speed Mode") the SCL high period count and low period count for
> high speed mode are calculated based on fixed tHIGH = 160 and tLOW = 120.
> However, the set of two fixed values is only applicable to the combination
> of hardware parameters IC_CAP_LOADING is 400 and IC_CLK_FREQ_OPTIMIZATION
> is true. Outside of this combination, the SCL frequency may not reach
> 3.4 MHz because the fixed tHIGH and tLOW are not small enough.
> 
> If IC_CAP_LOADING is 400, it means the bus capacitance is 400pF;
> Otherwise, 100 pF. If IC_CLK_FREQ_OPTIMIZATION is true, it means that the
> hardware reduces its internal clock frequency by reducing the internal
> latency required to generate the high period and low period of the SCL line.
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
> In order to calculate more accurate SCL high period count and low period
> count for high speed mode, two hardware parameters IC_CAP_LOADING and
> IC_CLK_FREQ_OPTIMIZATION must be considered together. Since there're no
> registers controlliing these these two hardware parameters, users can
> declare them in the device tree so that the driver can obtain them.

As long as DT schema (new properties) is accepted, this LGTM now,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



