Return-Path: <linux-i2c+bounces-7158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB198CCEE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 08:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1D5F1F22357
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 06:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE098823DD;
	Wed,  2 Oct 2024 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9d0BGw7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9741C28F4;
	Wed,  2 Oct 2024 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727849326; cv=none; b=NPJNfeQp6nYHuRHwF6PZnFP6c45g4RH4asv+l7cx8uEUC48vS3+JlKfM1BGfd25cf+vVyFrn3PfeMWRa0NJVMJ0HQeIuVZjGPHTm0cJjROG2b8A8/9eL9aozLPnNg8F4aP1PK9sjXTKFCRWTS7jI9rFHJkNozWLAu4JyjsVvtjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727849326; c=relaxed/simple;
	bh=oYooHsaM+39HQ9f/BVj0rXCGr4MDgTvb1QumxXJyDcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgGf/kSIAXPYpYeyWHs4/mnUJGTWmGw0oJCq0xABGdTWck4HeDkYwh9i/XH+SrNXjww1/aZU5dZGOyX4fi479TRKz4A8CpDfTJGq0M+KjtEIK5LUGqy8HO4k2QTh5+fcAqCfbURKDrh8H6/dYBiT6rVHsX2fA/S9VeCHS+3EzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9d0BGw7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F124C4CEC5;
	Wed,  2 Oct 2024 06:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849326;
	bh=oYooHsaM+39HQ9f/BVj0rXCGr4MDgTvb1QumxXJyDcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9d0BGw7FAIZQVWKdj/yJCzLVoTwCRTXeoQQgjz0GyRLJEDKT3VbPcOObOYPP2d+o
	 PTjM5SPI5PWm9ikYtEl6EHQNK35iPJFOc70gPXn5Tamf7kGIyKIyIHwheLKkiHzQlh
	 Fo8SIGEP9MBsiM1o0Sh51OM0Ia/H9J1VTIbmrHKHaL/aBPFmA7ePuAaz+hQCeH5o2d
	 IF/qy9ox/L9qUSaf/ACfoY4v62tWg7IJuLUhwpSvDlwnSiWEXDRWIOdHIkLgcFJery
	 g0tiBlY/RCq873dI/7+/Fif64CyOb0px2R+qwOfsHY9va4NawUDV0/IX9wyvB0mrzp
	 IVenLLY0l3hnA==
Date: Wed, 2 Oct 2024 08:08:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Wu <michael.wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare
 bus capacitance and clk freq optimized
Message-ID: <cmm7l2kxu2wl55rmcoi3q43ieejnivi5rvjdy6j3wvj6qahse7@ocgi7nyju4je>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-2-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001082937.680372-2-michael.wu@kneron.us>

On Tue, Oct 01, 2024 at 04:29:33PM +0800, Michael Wu wrote:
> Since there are no registers controlling the hardware parameters
> IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
> declared in the device tree.
> 
> snps,bus-capacitance-pf indicates the bus capacitance in picofarads (pF).
> It affects the high and low pulse width of SCL line in high speed mode.
> The legal values for this property are 100 and 400 only, and default
> value is 100. This property corresponds to IC_CAP_LOADING.
> 
> snps,clk-freq-optimized indicates whether the hardware input clock
> frequency is reduced by reducing the internal latency. This property
> corresponds to IC_CLK_FREQ_OPTIMIZATION.
> 
> The driver can calculate hs_hcnt and hs_lcnt appropriate for the hardware
> based on these two properties.
> 
> Signed-off-by: Michael Wu <michael.wu@kneron.us>
> ---
>  .../bindings/i2c/snps,designware-i2c.yaml     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index 60035a787e5c..c373f3acd34b 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -97,6 +97,21 @@ properties:
>        - const: tx
>        - const: rx
>  
> +  snps,bus-capacitance-pf:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >

I asked to drop |, so you replaced it with something else? So drop >...
and then you are going to replace it with another one?

That's not a cat and mouse.

> +      This property indicates the bus capacitance in picofarads (pF).
> +      This value is used to compute the tHIGH and tLOW periods for high speed
> +      mode.
> +    default: 100

I asked for some constraints here. min/maximum. I think you never
replied to this.

> +
> +  snps,clk-freq-optimized:
> +    description: >
> +      This property indicates whether the hardware input clock frequency is
> +      reduced by reducing the internal latency. This value is used to compute
> +      the tHIGH and tLOW periods for high speed mode.
> +    type: boolean
> +
>  unevaluatedProperties: false
>  
>  required:
> @@ -146,4 +161,13 @@ examples:
>        interrupts = <8>;
>        clocks = <&ahb_clk>;
>      };
> +  - |
> +    i2c@c5000000 {
> +      compatible = "snps,designware-i2c";

Extend EXISTING example. Not add new example.

Best regards,
Krzysztof


