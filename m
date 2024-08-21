Return-Path: <linux-i2c+bounces-5628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CF3959F76
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31AB28531F
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE871B1D47;
	Wed, 21 Aug 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAEGwQ17"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6705199FC0;
	Wed, 21 Aug 2024 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249743; cv=none; b=VjmCpgks2FTTFq1ENivifXvGH7Fx5YIDY9logWjoR7TUg3NsuF8AZQk49cd51NkZSNTfFFpfthlGE9V3m76UBfKUgsMiIKMAXF8JK2g6qFP63QDzjE1usZGYPs+SVzmFJLSxh3qXhnKkzvxpVL38DB7gucDtr0ErzRhaGEMqLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249743; c=relaxed/simple;
	bh=16KV62VvRRJIHyF+WzE9AQXMD8TnqdfN1f11bQbI2aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER74+yDUm7ITexj0ZytF/yy34773OOauoN7rTBNpiIt3hEepJgwSsvfJmawjTZppPDR2CwB97z/lGaYzHlHpdeYmkGna8/sDATGnv4dIwD8rek03vaZPsDKGXD4xFV+M5MuKsRLPK5/5I/0n3RHL8GkVzSCf1pH/L8hcQa8UoNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAEGwQ17; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724249742; x=1755785742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=16KV62VvRRJIHyF+WzE9AQXMD8TnqdfN1f11bQbI2aI=;
  b=mAEGwQ17YYR1/qqSdAurkt+ePSGYQKE3Y17+kEqGF4GNtZ6kceQ03ozB
   hk+y9f2S6ZfRwy0dfw1mo/m9bzyyNZXdeBzuHRjijo39Gla0OEi6SfhMp
   cPOl90QvRNAhSewyLMDAyVSoBET0VyWzD9roRBlGNRneLz2G0ERioOZ4N
   LCFT1/BeZFzrAQzE7BYQy50mAsLc2tYmqLcUKrtpYccixCG0LNZNMHVqT
   fEs6bGv3K0iBbYzWN03iIQ833Cu8haJG2XiEcSXHqMi7Ap48NdIr4BtX2
   0ftc0nKSR2TXDB69/CSFNNrSiv8i+894xRcrTd6J8jcc4puWp7iTwoEId
   A==;
X-CSE-ConnectionGUID: k7w9yq6BSP2w4YDdaAOFAQ==
X-CSE-MsgGUID: kQyq+MONTq6wnFkyhiS+Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33996069"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="33996069"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 07:15:41 -0700
X-CSE-ConnectionGUID: /qxavnx2Qr2YCgjzAmpyUw==
X-CSE-MsgGUID: S8Dzb3dVSWij41yLE3hrLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="84281725"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 07:15:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgm7a-000000006Yr-30Qb;
	Wed, 21 Aug 2024 17:15:34 +0300
Date: Wed, 21 Aug 2024 17:15:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>,
	grom@black.fi.intel.com,
	84c04d074b1778886a1af1062a4ca9d9afd72306@black.fi.intel.com,
	Mon@black.fi.intel.com, Sep@black.fi.intel.com,
	17@black.fi.intel.com, 2001@black.fi.intel.com
Subject: Re: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <ZsX2hiF5QJZZH8Z1@smile.fi.intel.com>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
 <kwan4cnf4dkwdirddkcixs265jisegjn6drkpv3ydlz4zpiswe@ih4x3h4c3ghs>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kwan4cnf4dkwdirddkcixs265jisegjn6drkpv3ydlz4zpiswe@ih4x3h4c3ghs>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 21, 2024 at 04:11:44PM +0200, Andi Shyti wrote:
> Hi Andy,
> 
> All merged to i2c/i2c-host.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



