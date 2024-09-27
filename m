Return-Path: <linux-i2c+bounces-7051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B809881A0
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 11:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7866EB2616A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 09:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1AA1BBBEC;
	Fri, 27 Sep 2024 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXOK0aGP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E01BC066;
	Fri, 27 Sep 2024 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430264; cv=none; b=Nif8vGziZey9CSfv+g8cjwWnbiy/INiq4hd6/+aGM+M88R89reN0yBSIO/rLfgtWYoMqFnT7QUEkpkYemD881TcESCfthNc4i7MbqPeGUUQOi53+aC5ZaRSKXvE2NUqqsAgFtsOHTKhGWF8nsdWbZU4izlfBZSHEfg+c5sTINxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430264; c=relaxed/simple;
	bh=n/bltVhnYzxNYiNE4PxbxGOVMK5htlf883JwUC9dahs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQcCu7jmHhuHEadsRhQiCYQ9Vr3pHrRFvBpNJ0oLUp4E7H6RPCi8tm/SlrwmK1l2Rprj6omhh67/HOQYSLokxQqDA4pq9pKFPrVBFkLKDScqxzKFxTVZGZ+uNrTgTYSAw5L1Ac9fKYXhr1jLmZddct7ngEcnTivZdHq6YiDGTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXOK0aGP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727430262; x=1758966262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/bltVhnYzxNYiNE4PxbxGOVMK5htlf883JwUC9dahs=;
  b=XXOK0aGPjK3KGxO3viW+tFrhysvwkqJXPKKyZYLIO0HCS+x3XICxTpaf
   NQ9Ov3fcgA7H8FLcrwaw0emhVAb+d0Yj5nS+jixomcg61WvlpAWYH6USD
   HYoDCAt+B8LWRjWCYzgS048z9RjRg0rhCRFAj78Q6IoLKxxH37DyBV+hg
   0xLZq0s2d1yRhvMMWfZeplEhTPYdMkBLXtInXrg7P7wsMjQ7oF1zq5q49
   ZeV2LqfBW1FzSQqroxkrZBIPbl3dT5m/fI+QsOUHEyAuEVO5lUnP6AFG1
   lK4dtdcFXTDSOZ77NkV7Y/jHZuZGaSbYfUFQ+Mr925WpQph4xOl76uPfz
   Q==;
X-CSE-ConnectionGUID: KjpAhFJ+SXKW39n6pAchjA==
X-CSE-MsgGUID: Wmx6Tf4wTKaMui5G6pGezQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="51984046"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="51984046"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:44:21 -0700
X-CSE-ConnectionGUID: JrghRUXCShqSfvO3s9n4NA==
X-CSE-MsgGUID: hRP4172ySS6/WR2zK0n4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="76997208"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 02:44:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1su7WJ-0000000DWWK-45nm;
	Fri, 27 Sep 2024 12:44:15 +0300
Date: Fri, 27 Sep 2024 12:44:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Wu <michael.wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v2 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Message-ID: <ZvZ-b_JRVnsh9o_8@smile.fi.intel.com>
References: <20240927042230.277144-1-michael.wu@kneron.us>
 <20240927042230.277144-3-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927042230.277144-3-michael.wu@kneron.us>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 27, 2024 at 12:22:17PM +0800, Michael Wu wrote:
> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
> for High Speed Mode") hs_hcnt and hs_lcnt are calculated based on fixed
> tHIGH = 160 and tLOW = 120. However, the set of these fixed values only
> applies to the combination of hardware parameters IC_CAP_LOADING = 400pF
> and IC_CLK_FREQ_OPTIMIZATION = 1. Outside of this combination, if these
> fixed tHIGH = 160 and tLOW = 120 are still used, the calculated hs_hcnt
> and hs_lcnt may not be small enough, making it impossible for the SCL
> frequency to reach 3.4 MHz.
> 
> Section 3.15.4.5 in DesignWare DW_apb_i2b Databook v2.03 says that when
> IC_CLK_FREQ_OPTIMIZATION = 0,
> 
>     MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 120 ns for 3.4 Mbps, bus loading = 400pF
>     MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> and section 3.15.4.6 says that when IC_CLK_FREQ_OPTIMIZATION = 1,
> 
>     MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 160 ns for 3.4 Mbps, bus loading = 400pF
>     MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> In order to calculate more accurate hs_hcnt amd hs_lcnt, two hardware
> parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
> considered together.

...

> +static void i2c_dw_fw_parse_hw_params(struct dw_i2c_dev *dev)

Separate function is an overkill. Just inline its contents...

...

> +	ret = device_property_read_u32(device, "bus-capacitance-pf", &dev->bus_capacitance_pf);
> +	if (ret || dev->bus_capacitance_pf < 400)
> +		dev->bus_capacitance_pf = 100;
> +	else
> +		dev->bus_capacitance_pf = 400;
> +
> +	dev->clk_freq_optimized = device_property_read_bool(device, "clk-freq-optimized");

...

>  	i2c_parse_fw_timings(device, t, false);
>  
> +	i2c_dw_fw_parse_hw_params(dev);

...here.

>  	i2c_dw_adjust_bus_speed(dev);

...

> + * @bus_capacitance_pf: bus capacitance in picofarad

picofarads

...

> +			u32 t_high, t_low;
> +
> +			if (dev->bus_capacitance_pf == 400) {
> +				t_high = dev->clk_freq_optimized ? 160 : 120;
> +				t_low = 320;
> +			} else {

Yeah, this has no protection against wrong values in the DT/ACPI.
So, perhaps

			} else if (...) {

and assign defaults or bail out with an error?

> +				t_high = 60;
> +				t_low = dev->clk_freq_optimized ? 120 : 160;
> +			}

-- 
With Best Regards,
Andy Shevchenko



