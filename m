Return-Path: <linux-i2c+bounces-5099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF69944DB3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 16:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49DBA1F23820
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 14:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B63B1A0704;
	Thu,  1 Aug 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhbuzQ5w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2DF28F3
	for <linux-i2c@vger.kernel.org>; Thu,  1 Aug 2024 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521412; cv=none; b=BqaJgWiCw2ON49zfXE+aClLUbk1CWdnMCg7zdl5+YEErd2DcAcXiW600DLncgMw9ozZBOMkbg+rpCWJQoW5DnYE0jXDIUseeHCVraWN1Vz66clGlrIzB4CODjKOh2DmhfPv07v4s0hYSTJ14Tq4vxlo1Jc9ljYTTWKBNgop4VAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521412; c=relaxed/simple;
	bh=lmRrW0iowZPUnRX+jBrP5lIpdO5wCtiPTnVHF9W6BsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8thD6AJB8XvuKp2JCFRVDQN+1vYeJpipnx4FwfJr984qs/9dBZ/z03BqlF1F/dn+wpdMpUUGu5nTG1bg8gGfVcZ2h+RSfG4g6IuoOjOwiILwYRK7jmUYoBItxw7WTftqYa58wjVbiznnNRwmInzd9QhIDmTZ2AHeSx2K776QL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhbuzQ5w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722521410; x=1754057410;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lmRrW0iowZPUnRX+jBrP5lIpdO5wCtiPTnVHF9W6BsA=;
  b=dhbuzQ5wxuYi3JSwiRwXOeoEu3hkz+UCovNDNw4tJ/08Ho3LwzLX/Odc
   cEOj+4d3xjbmf1jEDtMNE2ic9MNtK0wV05b+xNaDq3Cu7qAmTi7lfUUh2
   fU0VL2UgJRz7r0pkKcqKWQB/AR5oyOW4GwG094F2TNsN/hJQwTorBZQTS
   4Z5TghMx6H+Jh5aE17PH/ZRwmh3IxzsbL9Hxxk+yd25gs5lhDYlAJJg7b
   C3VJ/XbwPQUNHZGJdhXUyHAlsp0LNZBW8/xWr1zZ5cEmIwTZq1PgE3AR6
   Tl1ZVb8jV5ul4tkhWccJJtDi+pc6qiVK/4cFNLhaLf8KT8wCCLzYvV0q/
   A==;
X-CSE-ConnectionGUID: 0OrbpQFxTW+1T4x5aa5GtQ==
X-CSE-MsgGUID: r1YV5jSOQU6luEz3eOHXEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20367273"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="20367273"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 07:10:09 -0700
X-CSE-ConnectionGUID: swLruNmeR16wDgVdvPvTJA==
X-CSE-MsgGUID: +JUG83tMQU2p+SQ72bgKkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54956283"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa008.fm.intel.com with ESMTP; 01 Aug 2024 07:10:06 -0700
Message-ID: <8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com>
Date: Thu, 1 Aug 2024 17:10:05 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] i2c: designware: Fix wrong setting for
 {ss,fs}_{h,l}cnt registers
To: Adrian Huang <adrianhuang0701@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Adrian Huang <ahuang12@lenovo.com>, Dong Wang <wangdong28@lenovo.com>
References: <20240717065917.18399-1-ahuang12@lenovo.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240717065917.18399-1-ahuang12@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Sorry the delay.

On 7/17/24 9:59 AM, Adrian Huang wrote:
> From: Adrian Huang <ahuang12@lenovo.com>
> 
> When disabling CONFIG_X86_AMD_PLATFORM_DEVICE option, the driver
> 'drivers/acpi/acpi_apd.c' won't be compiled. This leads to a situation
> where BMC (Baseboard Management Controller) cannot retrieve the memory
> temperature via the i2c interface after i2c DW driver is loaded. Note
> that BMC can retrieve the memory temperature before booting into OS.
> 
> [Debugging Detail]
>    1. dev->pclk and dev->clk are NULL when calling devm_clk_get_optional()
>       in dw_i2c_plat_probe().
> 
>    2. The callings of i2c_dw_scl_hcnt() in i2c_dw_set_timings_master()
>       return 65528 (-8 in integer format) or 65533 (-3 in integer format).
>       The following log shows SS's HCNT/LCNT:
> 
>         i2c_designware AMDI0010:01: Standard Mode HCNT:LCNT = 65533:65535
> 
>    3. The callings of i2c_dw_scl_lcnt() in i2c_dw_set_timings_master()
>       return 65535 (-1 in integer format). The following log shows SS's
>       HCNT/LCNT:
> 
>         i2c_designware AMDI0010:01: Fast Mode HCNT:LCNT = 65533:65535
> 
>    4. i2c_dw_init_master() configures the register IC_SS_SCL_HCNT with
>       the value 65533. However, the DW i2c databook mentioned the value
>       cannot be higher than 65525. Quote from the DW i2c databook:
> 
>         NOTE: This register must not be programmed to a value higher than
>               65525, because DW_apb_i2c uses a 16-bit counter to flag an
>               I2C bus idle condition when this counter reaches a value of
>               IC_SS_SCL_HCNT + 10.
> 
>    5. Since ss_hcnt, ss_lcnt, fs_hcnt, and fs_lcnt are the invalid
>       values, we should not write the corresponding registers.
> 
> Fix the issue by returning 0 if ic_clk is 0 in i2c_dw_scl_{h,l}cnt().
> Then, do not write the corresponding registers if those values are 0.
> 
You are correct, indeed driver miscalculates those timing parameters in 
that case.

However debugging point of view below is misleading since it doesn't 
necessarily match with HW registers since they are not touched and have 
values what bootloader has left there.

	i2c_designware i2c_designware.0: Standard Mode HCNT:LCNT = 0:0

Would it work if patch just reads the dev->ss_hcnt, dev->ss_lcnt and so 
on from HW registers in case they and ic_clk are not set in 
i2c_dw_set_timings_master()? Then debug prints and HW values are in sync.

