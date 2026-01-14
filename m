Return-Path: <linux-i2c+bounces-15147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE7D1D18E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 09:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD233007964
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D7C37E2F0;
	Wed, 14 Jan 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhKwWlmi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D980E2E7BB6;
	Wed, 14 Jan 2026 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379067; cv=none; b=XZ9OgIfwlN3h/x36m6jnxiMhPR2NnW+pYnaXW/Ic35oZbCJsSJ4cdr1bDdSDsAJ53QMLPC2muW6AcSvblHVc1bneAhOE55fju3MmcHbvWOUv/zagqj50+iCNsM2+3tn1/2ObKO/mz7gN0TTGIBope7L8NmD92twPPAqmwrr5SHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379067; c=relaxed/simple;
	bh=rO+Cri0KlQrwgb+QFYzV0TXK76Uj0ZAhX5oF2alF3UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScoW5mVaz424Z7cOb0zPDfZRZR/c/E1p9MCbZaCkKvqjudnqqdob2Zmlt1IVd8hSJvifuhWW1qWl5v6uGeRjGGfPKer5+6BMZ7qOAHt7FbmR23RVMOXNe5s6FvtzE38iTVm5z5vWuOMY+UFsp77PtZtc78FXuVO5fciVO6OPNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhKwWlmi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379065; x=1799915065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rO+Cri0KlQrwgb+QFYzV0TXK76Uj0ZAhX5oF2alF3UQ=;
  b=LhKwWlmiVybL9oNPtd077MFqTHUQLR8XeHh42zoHSHEzwhOEjlNjn94t
   f9KnyMrtPlj18NKa50E2JqloHjTa4um21av0CC/2Zk0c7efphLxiXyaJO
   PUVq4gTX5TFXrfpIWN6EvJChBfJqkR061kJShtiIfWEFTuL11ORbscLz1
   6UzUisRgN0j77JUSRTddPrWErbe/y6nbCNFiIxbYEiVFUunTYKFuidHcK
   s7XqCp5uPIXiGmcuQ1yb2WphswKL9XJmnXGXskczTHQNz8WgjbZjqW9X2
   Y4IUjHjF0Q/vbQAVLXXajvJVfMhhI4Luoqssd/OJ/mO9ag2c0rm4z8Px2
   A==;
X-CSE-ConnectionGUID: CpMqVQCgTCitx6dfc6lFzA==
X-CSE-MsgGUID: OsnuhoZ6RmO3FVWOGBfaLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73309133"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73309133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:24:23 -0800
X-CSE-ConnectionGUID: KisiiCmQSlSDhwT4sF2GQQ==
X-CSE-MsgGUID: Twemu4bSSwK+lAdWl24nQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235333872"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:24:22 -0800
Date: Wed, 14 Jan 2026 10:24:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH v1 0/2] i2c: mlxbf: A couple of cleanups
Message-ID: <aWdSs_fgdzXhOW1o@smile.fi.intel.com>
References: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
 <aWdHcnAUY8i5IszI@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdHcnAUY8i5IszI@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 14, 2026 at 08:36:38AM +0100, Andi Shyti wrote:
> Hi Andy,
> 
> > Andy Shevchenko (2):
> >   i2c: mlxbf: Remove unused bus speed definitions
> >   i2c: mlxbf: Use HZ_PER_KHZ in the driver
> 
> merged to i2c/i2c-host.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



