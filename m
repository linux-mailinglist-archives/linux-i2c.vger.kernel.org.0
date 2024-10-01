Return-Path: <linux-i2c+bounces-7136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A594898BAC5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E05B1F21E66
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5DE1BF819;
	Tue,  1 Oct 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYjxCiB0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195B1BF7E2;
	Tue,  1 Oct 2024 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727781274; cv=none; b=rTMSdt7//r8Ked7plczOO1+vbns+JpcxGZyVLGBG6cO2VycLXOmuieES4/ke/3rUZwVveskDC1TIKRbEH+vmYSdEfnjPHRc4sfJ/w5khLWExLDu0XqVWDirV5rVdUPSN1hZg+Y40bmvkX3HaSlBtGNL1sIIsfnGP0aLkIZKI9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727781274; c=relaxed/simple;
	bh=ruLyCdWUMzr5cBzM1traRkaSuN17eS+NHK9v1U2KnP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjAohNkOzR+kP12HqoEVwuij9uQUCrRLU7Il3zS9SQzLhXGSlxiYSD7rp+Pe8LUw4EJm73D3+GyQaeBQD8Nvm7hyrATizRTkDgI60fzNwsTnnFsp7Tlu15Qe/vVu+5ThI9r6BxHGn0ZEei/CVb1MkasFnq/78zakGUdIV5eeJF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYjxCiB0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDB4C4CEC6;
	Tue,  1 Oct 2024 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727781273;
	bh=ruLyCdWUMzr5cBzM1traRkaSuN17eS+NHK9v1U2KnP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYjxCiB0RrI1JP7+CtX1zX6Rai6fFBLHIdY523yHhsaMqcocO17T8mPYbL3YuTbjB
	 XMmiGN1M4s3sVEucpVLwYcpX8LUWPsqcsnz/3UDXzPR0qXl0YsMFEQYgGDHbOMjalF
	 ZZIZFaAmFI7LB6qvk56F6MzDKmADLko3z6N7Z09uk//m6i55ezD4YBXUUui+Xy3Sti
	 Js8P/Q8CJE1PIkUcaZWFKv/yrS1XaJg4Q8zG9yimS6Az/OslExpxAXsXRS37SUld9H
	 AysDKS+HWJNvjx1iEh90qigjFK43ITPyRCOJTlk2+nckP6ODuKOAwggPd/jViHMHlT
	 oJPuiO6sw9IqQ==
Date: Tue, 1 Oct 2024 13:14:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Michael Wu <michael.wu@kneron.us>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v3 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Message-ID: <hk62cwc33jqxmddgdxhnqqwp6wxqwt2ovpv36mykyvxchc6tpz@2nwnhcrvbew4>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-3-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001082937.680372-3-michael.wu@kneron.us>

Hi Michael,

On Tue, Oct 01, 2024 at 04:29:34PM GMT, Michael Wu wrote:
> In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
> for High Speed Mode") hs_hcnt and hs_lcnt are calculated based on fixed
> tHIGH = 160 and tLOW = 120. However, the set of these fixed values only
> applies to the combination of hardware parameters IC_CAP_LOADING = 400pF
> and IC_CLK_FREQ_OPTIMIZATION = 1. Outside of this combination, if these
> fixed tHIGH = 160 and tLOW = 120 are still used, the calculated hs_hcnt
> and hs_lcnt may not be small enough, making it impossible for the SCL
> frequency to reach 3.4 MHz.

If someone is not familiar with the terms you are using this
paragraph is completely meaningless. Can you please describe or
at least expandi in parenthesis:

  hs_hcnt
  hs_lcnt
  tHIGH/tLOW (this is easy, but redundancy in commit log is never
              enough)
  IC_CAP_LOADING
  IC_CLK_FREQ_OPTIMIZATION

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
> 
> Signed-off-by: Michael Wu <michael.wu@kneron.us>
> ---

...

> + * @bus_capacitance_pf: bus capacitance in picofarads
> + * @clk_freq_optimized: indicate whether hardware input clock frequency is

/indicate/indicates/
/hardware/the hardware/

> + *	reduced by reducing the internal latency

The sentence above is not really meaningful and it's not
describing what "clk_freq_optimized" is.

>   *
>   * HCNT and LCNT parameters can be used if the platform knows more accurate
>   * values than the one computed based only on the input clock frequency.

...

> +			u32 t_high, t_low;
> +
> +			/*
> +			 * The legal values stated in the databook for bus
> +			 * capacitance are only 100pF and 400pF.
> +			 * If dev->bus_capacitance_pf is greater than or equals
> +			 * to 400, t_high and t_low are assumed to be
> +			 * appropriate values for 400pF, otherwise 100pF.
> +			 */
> +			if (dev->bus_capacitance_pf >= 400) {
> +				/* assume bus capacitance is 400pF */
> +				t_high = dev->clk_freq_optimized ? 160 : 120;
> +				t_low = 320;
> +			} else {
> +				/* assume bus capacitance is 100pF */
> +				t_high = 60;
> +				t_low = dev->clk_freq_optimized ? 120 : 160;
> +			}
> +
>  			ic_clk = i2c_dw_clk_rate(dev);
>  			dev->hs_hcnt =
>  				i2c_dw_scl_hcnt(dev,
>  						DW_IC_HS_SCL_HCNT,
>  						ic_clk,
> -						160,	/* tHIGH = 160 ns */
> +						t_high,
>  						sda_falling_time,
>  						0,	/* DW default */
>  						0);	/* No offset */
> @@ -167,7 +186,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
>  				i2c_dw_scl_lcnt(dev,
>  						DW_IC_HS_SCL_LCNT,
>  						ic_clk,
> -						320,	/* tLOW = 320 ns */
> +						t_low,

This looks fine to me.

Thanks,
Andi

>  						scl_falling_time,
>  						0);	/* No offset */
>  		}
> -- 
> 2.43.0
> 

