Return-Path: <linux-i2c+bounces-11907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D225BB0177A
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 11:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A516564CE3
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2772279DA0;
	Fri, 11 Jul 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VY4pYBtN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7BC21CFF6;
	Fri, 11 Jul 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752225654; cv=none; b=lsf+B8Oj4xZQ7qd5XJUWYSc0T08UWhp/yDaKzQjukTufxdeHxxwX+bSnaNv14aQzgSx3NGn7wa0PCx9feeqRxAsyXm/LtS4qdkc3FoIgMqdaPPYs34N07ovKBBT6rS0J3DDOG+Vz0OZRwOJ9Dasntn0xSjV/AXCh0jJx3OO71d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752225654; c=relaxed/simple;
	bh=ljGZUkwu7/bMzuB6R6jei6eeG2QtIMDml2mCoGRDTj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsRA2NXxpy35OWj7VzjmFPzXY6k9OB8avMJbQz3VYwNAHi51DCGaBUQrgIW3WgAPdg2mb1HgvDmLw4HKVfBam41u+Znoq70Hacng16/vBfBsD1L7ZXtCglQfmVJrMNXaQdMYALSbcdEU4ggKXzzkuhiMm6sgTLudpMWggQcXnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VY4pYBtN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD17C4CEF5;
	Fri, 11 Jul 2025 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752225652;
	bh=ljGZUkwu7/bMzuB6R6jei6eeG2QtIMDml2mCoGRDTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VY4pYBtN8lnxbpJ+5q/R4BGHr6JoZIz+Bn79H9uX3gcWEz1rlmbz0dIthc4/2AaS/
	 X9o1EoUnXv31C/HJIy58EWfCPU3L0DZXPBNRTZL2zKyB0ylDbsYWqXjKWVEkaWGws6
	 yXXFyeY9Pm/A0xHn70Sd436+USpK9YXf9M0OUDb4fBTl0H16RIeL7Y8aWlFLf/83fB
	 xMWmNmN09av7ZlmccUbm5vIBPPUwqmcisWoMvVqEK40rVmkp/lqA2VfJpWE4TYlMNB
	 NHC34a+NZAaECbNqKx8GztyEjC7nzAn68rbHzn1P6jltkPy05x2xKBOgONT8in2Y4U
	 HVyP4hLKvjrZg==
Date: Fri, 11 Jul 2025 11:20:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: configure ILCR for accurate SCL frequency
Message-ID: <bf6nkxdfctgz2tacf3vm6tv4qhd72vbqj52gu6kt2fc5erltkw@nufl7i3bddkb>
References: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com>

Hi Troy,

> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include "linux/bits.h"

this should be <linux/bits.h>

> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>

Is the diff a bit noisy or am I failing to see some differences?

>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */

...

> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)

here the alignment is a bit off.

> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lv, lcr;
> +
> +	lv = DIV_ROUND_UP(parent_rate, rate);

do we want to sanity check the lv value here?

> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> +		lcr &= ~SPACEMIT_LCR_LV_STANDARD_MASK;
> +		lcr |= lv << SPACEMIT_LCR_LV_STANDARD_SHIFT;
> +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> +		lcr &= ~SPACEMIT_LCR_LV_FAST_MASK;
> +		lcr |= lv << SPACEMIT_LCR_LV_FAST_SHIFT;
> +	}
> +	writel(lcr, i2c->base + SPACEMIT_ILCR);
> +
> +	return 0;
> +}
> +
> +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)

Alignment.

> +{
> +	u32 lv, freq;
> +
> +	lv = DIV_ROUND_UP(*parent_rate, rate);
> +	freq = DIV_ROUND_UP(*parent_rate, lv);
> +
> +	return freq;
> +}
> +
> +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)

alignment.

> +{

...

> @@ -519,15 +636,13 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
>  
>  	/* For now, this driver doesn't support high-speed. */
> -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> -	}
> +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +		i2c->mode = SPACEMIT_MODE_FAST;
> +	else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ)
> +		i2c->mode = SPACEMIT_MODE_STANDARD;
> +	else
> +		return -EINVAL;

Should we print an error here? And how likely is this case to
happen? Perhaps we can force the mode even if the frequency is
off and move forward instead of forcing the failure.

Andi

>  
>  	i2c->dev = &pdev->dev;

