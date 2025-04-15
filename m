Return-Path: <linux-i2c+bounces-10348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F0A8A06B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4CB16B7BF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 13:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B3A20469E;
	Tue, 15 Apr 2025 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0jPI117"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9C1C5D4C;
	Tue, 15 Apr 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725429; cv=none; b=c27xBgNLEuggplNkwgBvgMU8rTPN5eRdKxvl3KDuTR1r8KozFdgUFYN6Q5Sj1xDolApn12PZpJsrIMyLGq00pKWk0sMqvZ6Hi0G8Ksk9q8ETrPUoHVU6twUbCAo0bwP3LysaMhRBRGNpYpOwtTn4m1Sy8TXfqIFTfX3gukD/N7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725429; c=relaxed/simple;
	bh=xDB93y/tolv30TZZ39hnGlCE9eoTPd+dBm7VxO5zwRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQMUBh5qtc3Aen7XjudXVkZkVNZD3ttbUtjA2e5JOU8lQeXSOhgLrhbGMwBqJ69DFzahpmAL3zgWEJt5TrieuEMCVG5xcTQt/ODctskaNeW60K6k413cOZYzXVD59wnAC2eq0xYlClBxXoTfr6jj+DtwbHkcuhH43xDszvhrLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0jPI117; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744725428; x=1776261428;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xDB93y/tolv30TZZ39hnGlCE9eoTPd+dBm7VxO5zwRs=;
  b=b0jPI117z4YD/BV7TPaSyZN6lKEYjYl9rs6/3S50VSCCibitBgnsYnJa
   oAGW/b41QFxqUnUzRnGt5G/aesklLZv9kZ/JNcdGlHY/I1VclTjHr8NUI
   kncqPbCG4FsqcjtlAY7jtmWDL2T0uM8wQqv9V46wotzQxlpBsLxE8akZP
   q1CagULxzJB6XcKfJy/Q0s6ypqtKbQPyUxr3PYkWSp56BEI24+o4pG4U+
   +7ew/BUFkM6Vp736IszJsb3gqj56nrUVd0ehpzpcviOBTqY7/ouaaBPfi
   sA/+1ZqX5PjFs7dt17KU1m+N429nOpRtdTyijOhHIOdQBjByT+RkKcKZi
   g==;
X-CSE-ConnectionGUID: IklxvyMvSK6LKIhoIiptNQ==
X-CSE-MsgGUID: 6TbphEs8QvyR7oHgbEknrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46323797"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46323797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 06:57:07 -0700
X-CSE-ConnectionGUID: nTgDRg9hTGijLljhIphB/w==
X-CSE-MsgGUID: Mv6/SomiQwy0IMeuXmwkPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130661257"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2025 06:57:05 -0700
Message-ID: <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
Date: Tue, 15 Apr 2025 16:57:03 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
To: ende.tan@starfivetech.com, linux-i2c@vger.kernel.org
Cc: andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
 leyfoon.tan@starfivetech.com, endeneer@gmail.com
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250412023303.378600-1-ende.tan@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 4/12/25 5:33 AM, ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Replaced pm_runtime_put() with pm_runtime_put_sync_suspend() to ensure
> the runtime suspend is invoked immediately when unregistering a slave.
> This prevents a race condition where suspend was skipped when
> unregistering and registering slave in quick succession.
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>
> ---
>   drivers/i2c/busses/i2c-designware-slave.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 5cd4a5f7a472..b936a240db0a 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -96,7 +96,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
>   	i2c_dw_disable(dev);
>   	synchronize_irq(dev->irq);
>   	dev->slave = NULL;
> -	pm_runtime_put(dev->dev);
> +	pm_runtime_put_sync_suspend(dev->dev);
>   
>   	return 0;
>   }

What kind of issue you are seeing?

I tried to test with no delay and 1 second delays between registering 
and unregistering. Power state was changing between D0 and D3 if there 
was delay between unregister and register but I could not see any issue.

