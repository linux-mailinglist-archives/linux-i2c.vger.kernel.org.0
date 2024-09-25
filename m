Return-Path: <linux-i2c+bounces-6977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DB985630
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 11:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA901F23A1B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 09:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1566915A4B7;
	Wed, 25 Sep 2024 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlzrISRo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE601537B9;
	Wed, 25 Sep 2024 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727255780; cv=none; b=pfRaMbyJRUYu85fygO03BxNqPv4HgjvbTqFtdBsay+B+chfYPRe0JdhniLBuQ8K34bnJSDZmMZe5L3hQ6ezQSwaiMsz8I4asmkAhEFIhvw4OYa2rX6iBrr9lR46pbOmmC+TPBvWIgUbNfkCrMxGKS3erwoSjEdFisTh/eErxTzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727255780; c=relaxed/simple;
	bh=PGYNPV2DA2x1n9XVXr9pJ1WqM1VT24jrJYqJrYX8pLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv6BswRxnjHGcUW1xFABhTtK4/VN4XkhGWHIO8JeDvmh6w/padlcP9NjiYQCXgOyfXtiBUtbFKJ8MiDAF03LbeCAKZaSTFgyJaeM6gIaYYNMfGairTQjOhL6wsC9AAuQj8QfMLFo5JULln+NMbgrWMpYBA6xDRxSDxWTECNYapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlzrISRo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727255780; x=1758791780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PGYNPV2DA2x1n9XVXr9pJ1WqM1VT24jrJYqJrYX8pLQ=;
  b=IlzrISRoz1nCYL+bpD8SOvQlmjstNi5PxpoPR3u1xCB5YjOusl5nYTpr
   rZxlIr4SGHr70AXRGKo205dF09SPBWXRoURZ/1kiMJSfJXNJVMg15xO6s
   TDlbfEzxRnDbOJsILQ3+4uh9YQ5W7l8TakYHVlVllBepWmn32QMznI+W+
   PWLeGPbSCaufF17/EYpYJujWRB9uiMiq5qJkMhWH3Ab7V9JimgwqWFcJ/
   1WNKqDDsb131M5a/fWFztgZ1lFCB5+LvtRQNuUnC+Nwf6aBNfQRauI1Vc
   HGRbwYULxAIKsRFxi/8D/HDvwyiVDHQKXcbpGV9xQjH7+ZAli5QqSD9nt
   Q==;
X-CSE-ConnectionGUID: tBEZXJDRQJKAfdmFTlDo3g==
X-CSE-MsgGUID: jvhVh05QQcuvDLrJo+FSDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43768452"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="43768452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:16:15 -0700
X-CSE-ConnectionGUID: Cj8B8ja8RN68KbmGKXWg+w==
X-CSE-MsgGUID: MjASpi57RF6e7wChQjrMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71590735"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:16:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stO82-0000000ClAm-0A9b;
	Wed, 25 Sep 2024 12:16:10 +0300
Date: Wed, 25 Sep 2024 12:16:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Wu <michael.wu@kneron.us>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Message-ID: <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925080432.186408-2-michael.wu@kneron.us>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 25, 2024 at 04:04:30PM +0800, Michael Wu wrote:
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
>     MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 120 ns for 3,4 Mbps, bus loading = 400pF
>     MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> and section 3.15.4.6 says when IC_CLK_FREQ_OPTIMIZATION = 1,
> 
>     MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
> 		     = 160 ns for 3.4 Mbps, bus loading = 400pF
>     MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
> 		    = 320 ns for 3.4 Mbps, bus loading = 400pF
> 
> In order to calculate more accurate hs_hcnt and hs_lcnt, two hardware
> parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
> considered together.

...

> +void i2c_dw_parse_of(struct dw_i2c_dev *dev)
> +{

+	struct device *device = dev->dev;

> +	int ret;
> +
> +	ret = device_property_read_u32(dev->dev, "bus-loading",
> +				       &dev->bus_loading);

	ret = device_property_read_u32(device, "bus-loading", &dev->bus_loading);

(now one line)

> +	if (ret || dev->bus_loading < 400)
> +		dev->bus_loading = 100;
> +	else
> +		dev->bus_loading = 400;

> +	dev->clk_freq_optimized =
> +		device_property_read_bool(dev->dev, "clk-freq-optimized");

	dev->clk_freq_optimized = device_property_read_bool(device, "clk-freq-optimized");

(now one line)

> +

Redundant blank line.

> +}

> + * @bus_loading: for high speed mode, the bus loading affects the high and low
> + *	pulse width of SCL

This is bad naming, better is bus_capacitance.

> + * @clk_freq_optimized: indicate whether the system clock frequency is reduced

...

> +void i2c_dw_parse_of(struct dw_i2c_dev *dev);

Should be part of i2c_dw_fw_parse_and_configure().

...

> +			if (dev->clk_freq_optimized) {
> +				if (dev->bus_loading == 400) {
> +					t_high = 160;
> +					t_low = 320;
> +				} else {
> +					t_high = 60;
> +					t_low = 120;
> +				}
> +			} else {
> +				if (dev->bus_loading == 400) {
> +					t_high = 120;
> +					t_low = 320;
> +				} else {
> +					t_high = 60;
> +					t_low = 160;
> +				}
> +			}

Can be as simple as

			if (dev->bus_loading == 400) {
				t_high = dev->clk_freq_optimized ? 160 : 120;
				t_low = 320;
			} else {
				t_high = 60;
				t_low = dev->clk_freq_optimized ? 120 : 160;
			}

It also makes it much more visible to get how this flag affects the values.

-- 
With Best Regards,
Andy Shevchenko



