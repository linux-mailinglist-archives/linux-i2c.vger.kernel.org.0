Return-Path: <linux-i2c+bounces-7049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBD988070
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 10:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00F57284602
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 08:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D9B189B82;
	Fri, 27 Sep 2024 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioNOhjG0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63582188A13;
	Fri, 27 Sep 2024 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426202; cv=none; b=p9i+w1rlRABKSTufwPZTFX9DtKZCeHrsvVrhHpK792LlnJYD+RGYADKtnNbqC/TV188n7DXscQ9Ye9wNbqKvmwCZH1Evxu3M7aQfwWzxyjUqf0UHrhnZvYZjWbdCL1JxaCmDlXDTty6aJR9zWfsRi8YoHp6ulrUJ9vxtCAyf69o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426202; c=relaxed/simple;
	bh=gN56hQNenZVnqXhAB3K+w5mDxEmbchmUy70xSOnUC+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU+d/MG2Y7oAEz1BNwVPRM2NgvOnWH3Y7j0SAJbB1zGEiR7a+hO+D5vxrnsYLlZvvxtl5H3MXrNAnnk2AbFFxIUGXS8Ai1xVUDdTiZWU95FZSJobcZWA8spgaJce3/w+JJcd0Q1VeROkfMsAB3sCdJ0y6tJdVx3xtOTFHt4EFHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioNOhjG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F77C4CEC7;
	Fri, 27 Sep 2024 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727426202;
	bh=gN56hQNenZVnqXhAB3K+w5mDxEmbchmUy70xSOnUC+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioNOhjG040lK00VBc6SttDlhQzfuazI7nfiE23o0O7qHxaClNR3V+SCbR7SbdREIO
	 hXcT0XRc+bGFzrUY2mtEbh3YK7X9z9urSsuPvKXlIEoXHbweW6iIABNS59H+/qadyY
	 qUJMqGHf78EluvBMenFwJ7d34yQZ7yCWkrx5vDGBI4NMxqpS4o5kPzEMu6kabcT4D8
	 Krgxq6+bgu0XgxAiHkky9g5q7Lu9wujhfwsoneAtrS8/kw1pW0tL1kec9YHuLER6fQ
	 f33utDR2k4f7E8xr/kmgCns97kzveynRNvawxHkysvFwCPRkmfajs8v/Ejdk9+aZl3
	 4axZc7HoXCoJg==
Date: Fri, 27 Sep 2024 10:36:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Wu <michael.wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v2 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Message-ID: <gvc6qhgvp7s4dmnn5bwdpttjx5nmuss62qzi4uxzrzvvqid6fb@b33pvi54digs>
References: <20240927042230.277144-1-michael.wu@kneron.us>
 <20240927042230.277144-3-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927042230.277144-3-michael.wu@kneron.us>

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
> 
> Signed-off-by: Michael Wu <michael.wu@kneron.us>
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 16 ++++++++++++++++
>  drivers/i2c/busses/i2c-designware-core.h   |  6 ++++++
>  drivers/i2c/busses/i2c-designware-master.c | 14 ++++++++++++--
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 080204182bb5..907f049f09f8 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -372,6 +372,20 @@ static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
>  		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
>  }
>  
> +static void i2c_dw_fw_parse_hw_params(struct dw_i2c_dev *dev)
> +{
> +	struct device *device = dev->dev;
> +	int ret;
> +
> +	ret = device_property_read_u32(device, "bus-capacitance-pf", &dev->bus_capacitance_pf);
> +	if (ret || dev->bus_capacitance_pf < 400)

Your binding said nothing about some limits here. Something is not
complete. You might be missing constraints in the binding.


> +		dev->bus_capacitance_pf = 100;
> +	else
> +		dev->bus_capacitance_pf = 400;
> +
> +	dev->clk_freq_optimized = device_property_read_bool(device, "clk-freq-optimized");

Best regards,
Krzysztof


