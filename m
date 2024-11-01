Return-Path: <linux-i2c+bounces-7716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8DC9B9181
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 216E2B2273B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 13:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DE319E98D;
	Fri,  1 Nov 2024 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGK9K5YY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F45487A7;
	Fri,  1 Nov 2024 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730466412; cv=none; b=QkXe9HIfciCXCUoY0CRWtkgKhFpmPUvQlbDRc1xT09dwZuiiaKZA5cI3Oe+g/pa7/K1ZXlrzjQSp/wErHU+L0BmEusFEAoQa802fnhxrP3E3jBrSrYjz7xmCCUzFbAxS6ZHwAxtnhZUBhyMmg1wwQYkgTd6RCyAn5c8Y+m8TmAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730466412; c=relaxed/simple;
	bh=gu9PN5hUQEPSSl3W3JTtMH6NhqRqpmRR8rOASg6nGn8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlSpeKuyv6jzmBL/eh6cf/BQKg+K1g0SUDpKPyclnDyukBqr0caCGBBb/3h4gTZjVN2LrvYv9YAGWt2KMJm242hSpD1vWTPqYSAlBAvj8pTtQnOZ/mRdljdjLSKFW5B/QlQv/VR8peMvleV4AA9FMGhRoiChjRyS+Vh7OJ5d554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGK9K5YY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730466410; x=1762002410;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=gu9PN5hUQEPSSl3W3JTtMH6NhqRqpmRR8rOASg6nGn8=;
  b=TGK9K5YYH2zTpfeub4YUlgNgWw6qMUl0cLBQYX+g6ABdASRAN26naEn3
   x8xJbWqtQsNDcZwi6v5xlPAi/z8C0yu+zGYwYqmX3r85IsW+T8Yq2VvwZ
   /l+pjGzId39ZpuiJyyc8V4806moOSoC23UCSqIujZC9B/TgYYZdX0BLg1
   jrUnw9GRtaNMlcLDuO2XKvulMzWuzm93FGAlX8BEALZ/m4xGhN/Gwmt3h
   OpZnC4K+OihQLx/qTLmugw3zJDiovH86XHq6Y1qaLG+CSajM98yBPoAGH
   oFI7alKxrxrjmFLob8h3NHN4dThOxc00Q3bQYHhCeLKygQXZPEToCo078
   A==;
X-CSE-ConnectionGUID: IRWnjdweR9GZJUq2ArXiug==
X-CSE-MsgGUID: LMDZcWRSSKKa/wRVqKNFiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33919653"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33919653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:06:49 -0700
X-CSE-ConnectionGUID: JdetDu92QCCam8oEEkFnvg==
X-CSE-MsgGUID: y2MPLpiwShePyNb12+62ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="120411333"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 06:06:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6rMU-0000000A2MO-0HzH;
	Fri, 01 Nov 2024 15:06:46 +0200
Date: Fri, 1 Nov 2024 15:06:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Message-ID: <ZyTSZTcNU63F2GjY@smile.fi.intel.com>
References: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
 <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>
 <ZyTNA34Y1BRxMhhn@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyTNA34Y1BRxMhhn@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 01, 2024 at 02:43:47PM +0200, Wolfram Sang wrote:
> 
> > > Let's correct the old usages of *-objs in Makefiles.
> > 
> > Any comments?
> 
> LGTM. What about fixing the drivers, too, in one go?

What drivers do you have in mind?
Shouldn't be separated commit anyway?

-- 
With Best Regards,
Andy Shevchenko



