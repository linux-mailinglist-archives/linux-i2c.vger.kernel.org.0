Return-Path: <linux-i2c+bounces-6993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB549860D6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70BC288834
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F2918CC05;
	Wed, 25 Sep 2024 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbCAf5OM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808917C9BE;
	Wed, 25 Sep 2024 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727271454; cv=none; b=uIQD6mK6lELLRUR6hltHMON4e++pzNw7JKRksTXtJnm6SWObKzhJvt2VhGq5MzLp4HYjdtprHMV62CPxRALbFTthZU5tE5k6stT28YBgvElHEjewT6K94AO4lX1hxHTGhOh0ImPOobKPEJ+z2x8Kwzr0fAEuiIARbep1rVVS0LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727271454; c=relaxed/simple;
	bh=Wz42iFaW5nmB6uSdFxYAFYHC+xat+yNSrwlWWvdQ9wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2cV6FpE45P6UCW3dnCgdi1Lge6M0kGKPTnvh82OmrZYVcHXK0ln7vRLM7ydvv3YhyctNg/nVZMW2OdDuCGTM0V8mSgBOvhZ0kWam8nDlT3JMC/IZjKUxhRJgU27ZU7oAjPL4W/aYLrtOhjabxqdhQH1HGicaPg3+r7u9Q7f+EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbCAf5OM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727271453; x=1758807453;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wz42iFaW5nmB6uSdFxYAFYHC+xat+yNSrwlWWvdQ9wE=;
  b=HbCAf5OMLXbZvmZYaJW2BxWsLMZW6eeXvYPeEC6khGPTM1ROJ1epdrNi
   9FYaLPcNklOeq8Ic6kf3H6/VXuRMvd6ZKJrpfr7gyjw+2wBGnMUhN8BvQ
   AobwfScuplJDqWGNnzUwH2oDrNRnIQw5nTZ9pSpNqAsJLIjwU8Jz1X0q6
   jHke08Bgv2ed6HYlUTNxQ/owlJcrt8SwdiQlxhvGcESnlNVx1xpmhg5ao
   Cg9KfSL19gww03vhUma8wGZkCg1uAsF8iTzuOuwK8UYhOYJHAQGhicVmJ
   R5AwL1JB+cAUurois6qqvk9RazxshbOsuSxWFqOD6x4/E4IE7Vi200HsX
   g==;
X-CSE-ConnectionGUID: ISS0t4tWRSSFPDb9URWfcA==
X-CSE-MsgGUID: /mFUoBnDSG2E/xZe/D3F6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25829345"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="25829345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 06:37:23 -0700
X-CSE-ConnectionGUID: CZT+qTU1Q/iFA2MRBO5DKw==
X-CSE-MsgGUID: OT25vtw6R6WqoBKfn9GyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71919987"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 06:37:21 -0700
Message-ID: <c8d7ceb6-6027-4879-b6e0-32f2299d2e54@linux.intel.com>
Date: Wed, 25 Sep 2024 16:37:20 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] i2c: designware: Cleanups (part 4)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Narasimhan.V@amd.com, Borislav Petkov <bp@alien8.de>,
 Kim Phillips <kim.phillips@amd.com>
References: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/24 3:44 PM, Andy Shevchenko wrote:
> This is the subset of the patches [1] that should not affect any
> functionality. Here are:
> - tiding up the probe and remove functions
> - dead and redundant code removal
> - spelling fixes
> 
> In any case this is Cc'ed to AMD who reported a problem in [1]
> presumably in the patch that is *not* included here.
> 
> Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]
> 
> This is assumed to be the last straightforward patch series to clean up
> the driver. The rest is directly related or dependent on the reported
> problem and needs more thinking and work. Perhaps I can do it in the
> future.
> 
> Andy Shevchenko (5):
>    i2c: designware: Use temporary variable for struct device
>    i2c: designware: Get rid of redundant 'else'
>    i2c: designware: Remove 'cond' from i2c_dw_scl_hcnt()
>    i2c: designware: Use sda_hold_time variable name everywhere
>    i2c: designware: Fix spelling and other issues in the comments
> 
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 10 ++--
>   drivers/i2c/busses/i2c-designware-common.c  | 66 +++++++--------------
>   drivers/i2c/busses/i2c-designware-core.h    | 12 ++--
>   drivers/i2c/busses/i2c-designware-master.c  | 17 +++---
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 39 ++++++------
>   drivers/i2c/busses/i2c-designware-platdrv.c | 52 ++++++++--------
>   drivers/i2c/busses/i2c-designware-slave.c   |  6 +-
>   7 files changed, 90 insertions(+), 112 deletions(-)
> 
To all:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

