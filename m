Return-Path: <linux-i2c+bounces-12087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B7B1619C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 15:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B645A7A4D1D
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FD72D3EE0;
	Wed, 30 Jul 2025 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrspX88k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23AD2D375D;
	Wed, 30 Jul 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882470; cv=none; b=qLrBQ95cvdwQbJGspbnArTlTQfWXru1dXw8LexkPNlCESXsbhlgfXDBDNa/JqonsYKPs4LWB7VEBh5GXvskwezzLP/IQBkIuDQ8Ggwa1WiOMKZx/jdNkiI5EREGaFJ+lTSZq0YZGoZGvINL6yPNDkYT+sfzYBHmUG6WVsMaeMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882470; c=relaxed/simple;
	bh=MG+BKYbIMINkVluK+N+beHrXIhRtKeLgcqbEkaRnyHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhlwWXugv5gpyl7OzNoCMhZRV+yBhpWp5IX0UYfln8vgylUcjhLr8sKTQP5GV/4gQT3y8vndJBwPyOY9XuOi6lRhCAGF0iWaRK5VkoXPUbmuhYZzcoc5iEdi8KJoU1/19kTC05mZ+HHiVdl+nTnJdoEvshmtXeqpUJhMecBp5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrspX88k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753882469; x=1785418469;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MG+BKYbIMINkVluK+N+beHrXIhRtKeLgcqbEkaRnyHU=;
  b=XrspX88kH9jjSJY9SENi8OLutMrwZisO4JXLSEc6EsKyYYmcQUiNpNU3
   cmdONlbky5CGYeM+nALcS5972JWQOpBUgG8IOiVcGreaBNnd/40oB0mRs
   UD0UALxVi7viumhZPXBsrZrHu4+IuM5/N0uG5go27FpPkfIRxiine+Ss3
   cE2abZZMiFbiAjKwA/5XNp+s0oswvZsBcCAxR8IHnjhmOToY4wH8O/5tf
   9HEC6pHdq/OrEss/llh8oI6VEe+I9HmhrrhGZVNolEmcVxaWTzPYTm9kq
   t9msqVMagbuVJj5214LHlZCUQpcGVp+8UTH0wMN+MjQRmEbjF61ciynCw
   w==;
X-CSE-ConnectionGUID: G5W0vlG+TbWvrHfz+9+gzg==
X-CSE-MsgGUID: jXQa0JgGR1uW5/8whPdsRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66456721"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66456721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 06:34:28 -0700
X-CSE-ConnectionGUID: PM++2oJnR1S9e4zE5drCyA==
X-CSE-MsgGUID: inK3wZKoSs+eAjyStpkIMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167241363"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2025 06:32:21 -0700
Message-ID: <262e1907-5b11-40ca-8fdb-852c38244cdc@linux.intel.com>
Date: Wed, 30 Jul 2025 16:32:21 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: designware: Add disabling clocks when probe
 fails
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Kohei Ito <ito.kohei@socionext.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250724042211.2160339-1-hayashi.kunihiko@socionext.com>
 <20250724042211.2160339-3-hayashi.kunihiko@socionext.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250724042211.2160339-3-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 7/24/25 7:22 AM, Kunihiko Hayashi wrote:
> After an error occurs during probing state, dw_i2c_plat_pm_cleanup() is
> called. However, this function doesn't disable clocks and the clock-enable
> count keeps increasing. Should disable these clocks explicitly.
> 
> Co-developed-by: Kohei Ito <ito.kohei@socionext.com>
> Signed-off-by: Kohei Ito <ito.kohei@socionext.com>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index edaebfb165f9..f6424dcfdff6 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -308,6 +308,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   
>   exit_probe:
>   	dw_i2c_plat_pm_cleanup(dev);
> +	i2c_dw_prepare_clk(dev, false);
>   exit_reset:
>   	reset_control_assert(dev->rst);
>   	return ret;

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

