Return-Path: <linux-i2c+bounces-1657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1E284DE93
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 11:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52302282094
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 10:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275BD6A8C6;
	Thu,  8 Feb 2024 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f93fTres"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7969DF3;
	Thu,  8 Feb 2024 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389173; cv=none; b=rS0npKQP8aS9E35AlNs5kelbzBpfF5enNkm65azQtBphiDE8mt6EC0+vwVRlj/NwPxkshcWMH76pR3UJC9dE5yU2FVyguLX48+M5lKmZnhReu0QWKKrSZQIYN2W8jqvCivuZZTVJkuK56Jejn3z0BZ8B/WszC8t/ZrLj1K/KeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389173; c=relaxed/simple;
	bh=GVYcOEIaU1SproEODsty0/0uYSbalBkQCyKMvYsXavg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTDY9uXt7P4/Dh8v53Xkks61nV1NWwk7qweLBnnujCmQnsbR5vVCglWPVYAaTNdDVFXYOJC0OpwfBYs42QYvvWQTV6dqwdtDMzohbjjvO5PeRDQP5MA4LVN130h/YY+zjXOEpGi4jelHVH3e0T8cgTe2jxK0yFNI8+QXJ8VfKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f93fTres; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707389172; x=1738925172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVYcOEIaU1SproEODsty0/0uYSbalBkQCyKMvYsXavg=;
  b=f93fTresEpEGl+ZSY4LX64/EelTMbpwACbu8pYdnbeqvZga3mtnqdnB2
   Ssqq89Lp2kxz45hW4o+j6kEGu+j/XqLaQhwJMWU2i9dSTBo/xIHCegrB1
   4GoQDRI9c80tSbh8JYnDMJXQLpgyLfilaZmm0Ypw1XV/pAMBGweYISOI1
   9C3nZ0gSrLx+DNkrtyFfuJ7NTMCSHrYUADMulLYe/B5PLFm0mJOe8RIOA
   MqMpxdy5urxQsIDTcfIN8Wi4ZOLO/8+4AhveN+PAbPGH6TbbBzWVI9ics
   BeweLRaYIdtHSg5uNj0JoN4SQG4AYZDs8kTG5bIjndYMima3n8g9Y9Kwb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12557813"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="12557813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:46:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="934096217"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="934096217"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:46:05 -0800
Date: Thu, 8 Feb 2024 12:46:02 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: designware: constify regmap_config
Message-ID: <ZcSw6gV2GzIG9OOg@black.fi.intel.com>
References: <20240122033108.31053-1-raag.jadav@intel.com>
 <20240122033108.31053-2-raag.jadav@intel.com>
 <2caa903b-e5a6-499c-84ea-b8f85e4d1c71@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2caa903b-e5a6-499c-84ea-b8f85e4d1c71@linux.intel.com>

On Mon, Jan 22, 2024 at 11:44:22AM +0200, Jarkko Nikula wrote:
> On 1/22/24 05:31, Raag Jadav wrote:
> > We never modify regmap_config, mark it as const.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> Both:
> 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Bump.

Anything I can do to move these forward?

Raag

