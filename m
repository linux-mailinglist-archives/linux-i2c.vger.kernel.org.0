Return-Path: <linux-i2c+bounces-5146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E6947CCC
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 16:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F408D2839E1
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 14:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABFD13A265;
	Mon,  5 Aug 2024 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRXW1Yi5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E73EA64
	for <linux-i2c@vger.kernel.org>; Mon,  5 Aug 2024 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722868079; cv=none; b=hKuQJibBxhdrzmc4E8lGgoajF2f7ev2NMjhkaGUK/ysTWZ3OSXkM1lusaOUZYKvCWMrnOQBbQLn+ylgJdpk+KPeqi1jBmhiCKhWF0YBKHDtvb+6OLA0Zp51m+jxvmJiXHo5Zez42OfJ3Yclk3MjFCIYT2LNRKA+W4oi+WXBCNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722868079; c=relaxed/simple;
	bh=Np+C3lxz197BmSoqsfL05N/qqEzjCzQ/vCNwiBo0NYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klASBh9IWRCW+d17pjO4HpahgNtBz0R8ZNsRD5Dt8h1OIg39A0XUljgpP9elsixPucQY9Wt84nLmVWjhEEAriGO6A4c+gvBn8FQfYpd0aOD+BOH8gHpdiiwJI6WBEqlZ56ig3cB0FJR/OSW1UEbYPHsqT/IcBVSXivWkgljJALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRXW1Yi5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722868078; x=1754404078;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Np+C3lxz197BmSoqsfL05N/qqEzjCzQ/vCNwiBo0NYw=;
  b=SRXW1Yi5bguqU3WJphbjQwsUZVBa+FDUYZmzOqKDU1aKrFBpZXL9rZ48
   KpcQvSnhuhsaIdzlBtl5b2glmxAhfymP76jET/40l/YZnO5WU1qkwA6LV
   hGsA2X2JZpJZy7nEkxvy1omORvWl4HqlnZUwsEk7NJzoxC8SEqj7teWLQ
   IeHEd/9fc5zrmM49le4MIZjzWFgLFky25LW5N3+k4ZHiSuDRCaAIAXwAj
   EDiI/AWfePpesXbNRTZQp1LmqrQ9/4JKSwzlMOYMqq3OcKXUZ5xbkT2OL
   H3wyqYD6RqWwfVS5g3+3Eo/GGvATMg7h9AYg6EOwixOFSzKblJpDYnSI4
   Q==;
X-CSE-ConnectionGUID: N6eg+4jJRbm9pC53wkqDeg==
X-CSE-MsgGUID: bQUyJQtOTbatesU79zTivA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="38340313"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="38340313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 07:27:52 -0700
X-CSE-ConnectionGUID: c36d7OoGRE21knju8BwPTw==
X-CSE-MsgGUID: SSWPj4Y/SQ+u/sdLuWQGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56123640"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa008.fm.intel.com with ESMTP; 05 Aug 2024 07:27:31 -0700
Message-ID: <59353915-2360-42e7-b38d-ca64d59f5b45@linux.intel.com>
Date: Mon, 5 Aug 2024 17:27:30 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: designware: Fix wrong setting for
 {ss,fs,hs}_{h,l}cnt registers
To: Adrian Huang <adrianhuang0701@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Adrian Huang <ahuang12@lenovo.com>, Dong Wang <wangdong28@lenovo.com>
References: <20240802130143.26908-1-ahuang12@lenovo.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240802130143.26908-1-ahuang12@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/24 4:01 PM, Adrian Huang wrote:
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
> Fix the issue by reading dev->{ss,fs,hs}_hcnt and dev->{ss,fs,hs}_lcnt
> from HW registers if ic_clk is not set.
> 
> Link: https://lore.kernel.org/linux-i2c/8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com/
> Suggested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> Reported-by: Dong Wang <wangdong28@lenovo.com>
> Tested-by: Dong Wang <wangdong28@lenovo.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

