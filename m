Return-Path: <linux-i2c+bounces-6983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA46985775
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 12:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D443285B40
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DDD1662F7;
	Wed, 25 Sep 2024 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl2BeJNG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FADC14B94C;
	Wed, 25 Sep 2024 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727261914; cv=none; b=RfdJeIbCbm/a0O0CIaWjcHMiEQbjkHiVwAkH9LZiDHlmuBMoIWmBqROm+lMiq3WYjvS1lyHyi904xtLrKXzq1Gy7vMzCShvWSHv9zgZvwYETwa08qu0pZ/HoaTIsVGfOE1bisx9jDYhVsLWFHG6zFf3N5WLoEJQzyxouqEBXIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727261914; c=relaxed/simple;
	bh=xbGkoffuSAvg1OpI731V72OH6zmPBU3cjaqvfly31NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZ7yUFJKAC5IxZSbvmmLMAiP5ha2lnk/YyzYSFwaWqnepN1gErKYilmSgEf8RSTWG05zfb01/mcjkhHqevDX28+Yw+mxQysz6OH3/cILdRVyDaF9ykUI5mXlkoGsAt26x4gDaZJkzVLN6J74BmsJWGWK8ntVlTp6qx062ndFjSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pl2BeJNG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727261914; x=1758797914;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xbGkoffuSAvg1OpI731V72OH6zmPBU3cjaqvfly31NY=;
  b=Pl2BeJNGIfKjzWPsNjmNzIe9NqrCUJ4sesPrRXJIKhwp3BQDemPRS8wR
   vPIR2Wr58gokH09y57azGjIRWCtr3nq09Gp+HiyTqbTNqk+bK+KhTjBDB
   /OltP+kI7Zhht1PLxGp9UP2ltPYgKs6Ppc89otom4D1gM6xC76C7u92nt
   BSoDXeMxN+eWowbVj/WSTVwg9qhRzCj7hHvsmymQ57BjxJWHoM8jm7RgA
   tYu2INZSdSHfngC3o0uQBblpyyJoDrwGIqIyx+vvA6hR32EHi65K9te4V
   DWZtc13yjuv3Hkg1KUttXdSNzfJXdM4/RjOF3YjQy6mA1uWDmfUoGLFZK
   w==;
X-CSE-ConnectionGUID: 9owdnr3ESCKvE6MBsq2W+w==
X-CSE-MsgGUID: RkY7JtLjQWSpRrjevxjgxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30093636"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="30093636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 03:58:32 -0700
X-CSE-ConnectionGUID: QnHwRlVARWm5p0J/OMfh2g==
X-CSE-MsgGUID: qaEesQtKRgG9MypQQT8MUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="102551930"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2024 03:58:28 -0700
Message-ID: <90f64539-3092-4d3b-bdf2-c6af51e32fdc@linux.intel.com>
Date: Wed, 25 Sep 2024 13:58:27 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based on
 HW paramters
To: Michael Wu <michael.wu@kneron.us>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, Morgan Chang
 <morgan.chang@kneron.us>, linux-kernel@vger.kernel.org
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240925080432.186408-2-michael.wu@kneron.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 9/25/24 11:04 AM, Michael Wu wrote:
> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing
> parameter for High Speed Mode") hs_hcnt and hs_hcnt are computed based on
> fixed tHIGH = 160 and tLOW = 320. However, this fixed values only applies
> to the set of conditions of IC_CAP_LOADING = 400pF and
> IC_FREQ_OPTIMIZATION = 1. Outside of this conditions set, if this fixed
> values are still used, the calculated HCNT and LCNT will make the SCL
> frequency unabled to reach 3.4 MHz.
> 
> If hs_hcnt and hs_lcnt are calculated based on fixed tHIGH = 160 and
> tLOW = 320, SCL frequency may not reach 3.4 MHz when IC_CAP_LOADING is not
> 400pF or IC_FREQ_OPTIMIZATION is not 1.
> 
> Section 3.15.4.5 in DesignWare DW_apb_i2c Databook v2.03 says when
> IC_CLK_FREQ_OPTIMIZATION = 0,
> 
>      MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 120 ns for 3,4 Mbps, bus loading = 400pF
>      MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> and section 3.15.4.6 says when IC_CLK_FREQ_OPTIMIZATION = 1,
> 
>      MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 160 ns for 3.4 Mbps, bus loading = 400pF
>      MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> In order to calculate more accurate hs_hcnt and hs_lcnt, two hardware
> parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
> considered together.
> 
> Signed-off-by: Michael Wu <michael.wu@kneron.us>
> ---
>   drivers/i2c/busses/i2c-designware-common.c  | 16 ++++++++++++++
>   drivers/i2c/busses/i2c-designware-core.h    |  8 +++++++
>   drivers/i2c/busses/i2c-designware-master.c  | 24 +++++++++++++++++++--
>   drivers/i2c/busses/i2c-designware-platdrv.c |  2 ++
>   4 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e8a688d04aee..f0a7d0ce6fd6 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -332,6 +332,22 @@ void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
>   }
>   EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
>   
> +void i2c_dw_parse_of(struct dw_i2c_dev *dev)
> +{
> +	int ret;
> +
> +	ret = device_property_read_u32(dev->dev, "bus-loading",
> +				       &dev->bus_loading);

Like Andy said better name would be bus_capacitance_pf.

Also i2c_dw_parse_of() sounds too generic and may lead to think all and 
only device tree related parameters are parsed here.

> +	if (ret || dev->bus_loading < 400)
> +		dev->bus_loading = 100;
> +	else
> +		dev->bus_loading = 400;
> +

I think these are more understandable and robust if no parameter 
adjustments are not done here but used straight in the if statements in 
the i2c_dw_set_timings_master(). Less if statements that way and all 
checked in one place.

