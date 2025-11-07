Return-Path: <linux-i2c+bounces-14016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DAEC40ACB
	for <lists+linux-i2c@lfdr.de>; Fri, 07 Nov 2025 16:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A279F1A45EED
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Nov 2025 15:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456B332E6BB;
	Fri,  7 Nov 2025 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pSEwsm2U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FC280033
	for <linux-i2c@vger.kernel.org>; Fri,  7 Nov 2025 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762530633; cv=none; b=tRNbGxPeNYIO85hTumbwW9hhqlRH1w1D+UzxUrbdsTnSiRdICi8CkbUnlmJfe/D30nocIDv37t1DJN98SjJGkQp0GYpFm1k3lMM1Ec08BLHj9NAqYtaQQDov3alS27d5X2BFnwX9ObzcxLOQYO9N8Ufzz/wuWHN1DlUaPc8JOug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762530633; c=relaxed/simple;
	bh=EoawwwVoDMz0oKgsCvXm/6hQVMuQW6BNY3YvUamXDNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsfPkQLrcf6J1RNSNBUe3iDCqw2/9q2IHxXVyfLwZuRnW87lzjQnQEmOZbA8l5wvPaJ1Yl6Z7hcZGJU8DTbh3x/KniGF3Jwo16p/6RwofuU75mYP7csfUVPGa6mHAZS+iCa2Bcq3Mk8NVFNF2BW0p8MIbdfeeqT/RQxMpiDJCCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pSEwsm2U; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-4331d3eea61so6623835ab.2
        for <linux-i2c@vger.kernel.org>; Fri, 07 Nov 2025 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762530628; x=1763135428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zXWSz4k79ncGQ5bvvpeFMonpkpyx08LBZ1NwuP3ep0g=;
        b=pSEwsm2UQUSKbHoPNdwFZQIf7FVyKhdSGATnNbx5XTcTUODLr/jRGwmHkiO7KRkCpm
         50fF/L4IroYF+SARCMv7e/1MIUAZN04VXFNNidClHMxudT6UxUpRe6k+DvFHFOJLMKYS
         2q9ODxyAYFpDKrQduqWTeERVS6eHru/Jzc4Tj9fCras71282rejx9XraYICTUoqH+iD6
         Nn0e7+1aiRCfrg8Xu1zoGLYsT1U8kqzmUWq488QE7ldCf9jF8ogHbuickpqdSDYQCePY
         NNtilK/RpX0dalZ3E5+pcovRuSLCcn5bJA/R1+MGLbbISxQiuUIdSKP0huiJ/kuBra7p
         ff7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762530628; x=1763135428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXWSz4k79ncGQ5bvvpeFMonpkpyx08LBZ1NwuP3ep0g=;
        b=HMZ+RlOEgDBg3/ChasyQ+6Bl+JrYqMrYO4oYEsvxxSB1LaHZCxsyC3ERZEuCwdLH5k
         4oXeEu8tAnUu2ghDO0AOOcJGy5rJs6CDuuGh8vbYRIK0qrrM9gTc5CDnXfdovZJLATAt
         fS88U9xvjqUMBMnHMLTyHjXCYBXZcuE8drWOsoiTQdfchFRk6C4em2ZiUqW2RogFQAbu
         eRmPoGWemxk01V7+tyUL5sWemQ0lQpZujnsd1ng53XAfxQAuMvSRHmSnmYGrWedoLNgz
         zb39TG2JqmMuy+6e/gIE0iPVDG+Ce6PalF00dAAtNYrV69wmV493gbdQOabIS41YJdZJ
         24dQ==
X-Gm-Message-State: AOJu0YxzJqpFEYs3i1Q3tYFARfZZ/8OZhph6OmdGwDvvvwGDiPMlClv2
	UizjT0R3SvQ1T9WSwkEe7ge5CpFEZqIPRqyxOuh8GWsUYVHac9klN4LbbkDqI1X1t7k=
X-Gm-Gg: ASbGncue+BOKwi2EDHfnp1wO9r6DzRFiyfMLk9gb+beGNRTEVBKOVZrNuB+4I7L3ujp
	mG8yJblBQivMKf+hkbUMm8cXvducZePFFhmB3hsM+i/xk4BMBAC+ewhv0RwxRQKL11GtZYP3Hy9
	AkP7OgsRqJA2D+onE5XFmICY7+mopWgAxdsrs8zbpmt1T06x/TnUHCn7PWG8xlWTvsSOg5JLZdE
	Dg94nyX5E9ghYVgzlTmuBu5jZPX9ivhPtQKBGolp3fTVLm1NEtg+AoxYEgW0wX6/t/uq7ZwNC0j
	qPG4nqj3jnGTTppTM8nBgyJxLx1uCFyDXj31ROPGTrmPIuqaVrlhITgpQnSHRPv9a8KjxXl602I
	/ZqWJS+bXIPbnFigvAv1ewVgbsJbHdt6sC8jUrVJWeB6OXv7MhQGyAAjlGeLYbbgtffhr7rGS2l
	Aw8BkPYqyMF2fJ+eDH1YPbrpj47rk7z7lsDvp7oVcwzPedlyEVeA==
X-Google-Smtp-Source: AGHT+IERtPQ2HfyGXSRoRztnRCnWaZPM0gHZcPPreXFNAW24Pk7vrOzzxb+BaiSHpaPwei2lKcwbeQ==
X-Received: by 2002:a05:6e02:7:b0:430:b1ff:74cd with SMTP id e9e14a558f8ab-4335f3f9722mr59114585ab.10.1762530627681;
        Fri, 07 Nov 2025 07:50:27 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4334f44e63csm23592535ab.10.2025.11.07.07.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 07:50:27 -0800 (PST)
Message-ID: <613db920-6025-43cb-a733-d58f65363caa@riscstar.com>
Date: Fri, 7 Nov 2025 09:50:26 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: spacemit: introduce pio for k1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 4:59 AM, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.

(Sorry I haven't commented on your earlier versions.  They
included other changes to prepare for this; I'm looking at
this patch in isolation and haven't reviewed the others.)

An aside:  I notice the #includes are indented an additional
space in this source file;  perhaps you can get rid of those
(in a separate patch) at some point.

You really need to provide more information about how this
is implemented.  This patch makes non-trivial changes to
the logic.

> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v4:
> - refactor for better readability: simplify condition check and moving if/else (timeout/
>    wait_xfer_complete) logic into a function
> - remove irrelevant changes
> - remove the status clear call in spacemit_i2c_xfer_common()
> - sort functions to avoid forward declarations,
>    move unavoidable ones above function definitions
> - use udelay() in atomic context to avoid sleeping
> - wait for MSD on the last byte in wait_pio_xfer()
> - Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com
> 
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> 
> Changes in v2:
> - Patch 1/6:
>    Patch 3/6:
>    Patch 4/6:
>      - nothing
> - Patch 2/6:
>    - remove is_pio judgement in irq_handler()
> - Patch 5/6:
>    - fix wrong comment
>    - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
>      return directly instead of using break.
> - Patch 6/6:
>    - add is_pio judgement in irq_handler()
>    - use a fixed timeout value when PIO
>    - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> 
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>   drivers/i2c/busses/i2c-k1.c | 229 +++++++++++++++++++++++++++++++++++---------
>   1 file changed, 185 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..a13284f840ee967466a01375e6603f7568a42f86 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,8 @@
>   
>   #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>   
> +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> +
>   enum spacemit_i2c_state {
>   	SPACEMIT_STATE_IDLE,
>   	SPACEMIT_STATE_START,
> @@ -125,10 +127,14 @@ struct spacemit_i2c_dev {
>   
>   	enum spacemit_i2c_state state;
>   	bool read;
> +	bool use_pio;

This is fine, but you could maybe call it atomic (to match
the callback funtion name).

Actually, almost all uses of this field are negated, i.e.:
	if (!i2c->use_pio)

Maybe you could use a name that doesn't require negation,
like "can_block" for example.

>   	struct completion complete;
>   	u32 status;
>   };
>   
> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);

You should introduce a patch before this one that simply moves
one or both of these functions earlier in the file, so these
forward-declarations can be avoided.

>   static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
>   {
>   	u32 val;
> @@ -177,7 +183,11 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   		return;
>   
>   	spacemit_i2c_reset(i2c);
> -	usleep_range(10, 20);
> +

What determines whether use_pio is set?  The answer is that
it's set when i2c_algorithm->xfer_atomic is used; it is false
if i2c_algorithm->xfer is used.  (This would be something
you'd explain in your patch header.)

> +	if (!i2c->use_pio)
> +		usleep_range(10, 20);
> +	else
> +		udelay(20);

You could encapsulate the above four lines in a new function
spacemit_i2c_delay(unsigned long usec), since they are repeated
in two places.  It can also be used in spacemit_i2c_wait_pio_xfer()
even though the check for PIO isn't needed there.

>   
>   	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
>   		status = readl(i2c->base + SPACEMIT_IBMR);
> @@ -206,9 +216,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
>   	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
>   		return 0;
>   
> -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	if (!i2c->use_pio)
> +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	else
> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);

The above could also be encapsulated, to simplify this block of
code and the one below that uses this structure.  And again, it
could be used in spacemit_i2c_wait_pio_xfer() as well, despite
the check for PIO not being needed there.

>   	if (ret)
>   		spacemit_i2c_reset(i2c);
>   
> @@ -220,31 +235,39 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
>   	/* in case bus is not released after transfer completes */
>   	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
>   		spacemit_i2c_conditionally_reset_bus(i2c);
> -		usleep_range(90, 150);
> +		if (!i2c->use_pio)
> +			usleep_range(90, 150);
> +		else
> +			udelay(150);
>   	}
>   }
>   
>   static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   {
> -	u32 val;
> -
> -	/*
> -	 * Unmask interrupt bits for all xfer mode:
> -	 * bus error, arbitration loss detected.
> -	 * For transaction complete signal, we use master stop
> -	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> -	 */
> -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> -
> -	/*
> -	 * Unmask interrupt bits for interrupt xfer mode:
> -	 * When IDBR receives a byte, an interrupt is triggered.
> -	 *
> -	 * For the tx empty interrupt, it will be enabled in the
> -	 * i2c_start function.
> -	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> -	 */
> -	val |= SPACEMIT_CR_DRFIE;
> +	u32 val = 0;
> +
> +	if (!i2c->use_pio) {

Why does this block of initialization only need to be done
when not using PIO?  What happens in the PIO case?  I think
the answer is that you don't want any interrupts when using
PIO.  But... what if these conditions occur in PIO mode?

> +		/*
> +		 * Unmask interrupt bits for all xfer mode:
> +		 * bus error, arbitration loss detected.
> +		 * For transaction complete signal, we use master stop
> +		 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> +		 */
> +		val |= SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +
> +		/*
> +		 * Unmask interrupt bits for interrupt xfer mode:
> +		 * When IDBR receives a byte, an interrupt is triggered.
> +		 *
> +		 * For the tx empty interrupt, it will be enabled in the
> +		 * i2c_start function.
> +		 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> +		 */
> +		val |= SPACEMIT_CR_DRFIE;

It's worth explaining (somewhere, possibly in the patch
header) that this is different from what was done before.
As a reviewer I didn't realize this at first; I thought
you were simply making a block of code conditional on
the value of use_pio.

> +		/* unmask master stop interrupt bit */
> +		val |= SPACEMIT_CR_MSDIE;
> +	}

I would find it easier to follow if you set up the
common bit assignments to the SPACEMIT_ICR register
first, and then do the non-PIO specific ones afterward.

>   	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>   		val |= SPACEMIT_CR_MODE_FAST;
> @@ -256,7 +279,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   	val |= SPACEMIT_CR_SCLE;
>   
>   	/* enable master stop detected */
> -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +	val |= SPACEMIT_CR_MSDE;
>   
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   
> @@ -293,10 +316,85 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>   	/* send start pulse */
>   	val = readl(i2c->base + SPACEMIT_ICR);
>   	val &= ~SPACEMIT_CR_STOP;
> -	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
> +
> +	if (!i2c->use_pio)
> +		val |= SPACEMIT_CR_DTEIE;
> +
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
>   

You should add a comment here indicating this returns 0
if there's a timeout/error, or non-zero (1) for success.

> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
> +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> +	int ret;
> +
> +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;

I think this can be a do..while block instead.  Both conditions
will certainly be true initially.

> +	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
> +		udelay(10);

Why do you delay *first*?  I think you should read the status
and only if you're not done, insert the delay.

> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> +
> +		if (!(i2c->status & mask))
> +			continue;
> +
> +		spacemit_i2c_handle_state(i2c);
> +
> +		/*
> +		 * This is the last byte to write of the current message.

You mean *if* this is the last byte to write in the message, ...

> +		 * If we do not wait here, control will proceed directly to start(),
> +		 * which would overwrite the current data.
> +		 */
> +		if (!i2c->read && !i2c->unprocessed) {

Instead, do this:

		if (i2c->read || i2c->unprocessed)
			continue;

> +			ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +							i2c->status, i2c->status & SPACEMIT_SR_ITE,
> +							30, 1000);
> +			if (ret)
> +				return 0;

I'd rather see the above be done outside the loop. It would
simplify things.  The call to spacemit_i2c_handle_state()
would be the end of the loop.

Then outside the loop:

	if (unprocessed)
		return 0;	/* timeout */

	if (!i2c->read)
		return 1;

	/*
	 * In read mode, err_check() ...
	 * ...
	 */

I might have the logic wrong here, but you might find
it's simpler if you try to handle it this way.

> +			/*
> +			 * In read mode, err_check() in handle_state properly handles what happens
You can drop the sentence about what happens in read mode.
It's a distraction.  Just explain what you have to do in write
mode.

> +			 * after the MSD bit is set. For writes it is different: in interrupt mode,
> +			 * an ITE (write-empty) interrupt is triggered after the last byte, and the
> +			 * MSD-related handling takes place there. In PIO mode, however, we need to
> +			 * explicitly call err_check() to emulate this step, otherwise the next
> +			 * transfer will fail.
> +			 */
> +			if (i2c->msg_idx == i2c->msg_num - 1) {
> +				mask = SPACEMIT_SR_MSD | SPACEMIT_SR_ERR;
> +				/*
> +				 * In some cases, MSD may not arrive immediately;
> +				 * wait here to handle that.
> +				 */
> +				ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +								i2c->status, i2c->status & mask,
> +								30, 1000);
> +				if (ret)
> +					return 0;
> +
> +				spacemit_i2c_err_check(i2c);
> +			}
> +		}
> +	}
> +
> +	if (i2c->unprocessed)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static int spacemit_i2c_wait_xfer_complete(struct spacemit_i2c_dev *i2c)
> +{
> +	if (i2c->use_pio)
> +		return spacemit_i2c_wait_pio_xfer(i2c);
> +	else
No need for else here.

> +		return wait_for_completion_timeout(&i2c->complete,
> +						   i2c->adapt.timeout);
> +}
> +
>   static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>   {
>   	unsigned long time_left;
> @@ -312,8 +410,8 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>   
>   		spacemit_i2c_start(i2c);
>   
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
> +		time_left = spacemit_i2c_wait_xfer_complete(i2c);
> +
>   		if (!time_left) {
>   			dev_err(i2c->dev, "msg completion timeout\n");
>   			spacemit_i2c_conditionally_reset_bus(i2c);
> @@ -341,6 +439,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>   
>   static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>   {
> +	if (!(i2c->status & SPACEMIT_SR_ITE))
> +		return;
> +
>   	/* if transfer completes, SPACEMIT_ISR will handle it */
>   	if (i2c->status & SPACEMIT_SR_MSD)
>   		return;
> @@ -353,14 +454,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>   
>   	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
>   	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +
> +	if (!i2c->use_pio)
> +		complete(&i2c->complete);

The above two lines could be wrapped in spacemit_i2c_complete(i2c),
to avoid repeating them.

>   }
>   
>   static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
>   {
> +	if (!(i2c->status & SPACEMIT_SR_IRF))
> +		return;
> +
>   	if (i2c->unprocessed) {
>   		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
>   		i2c->unprocessed--;
> +		return;
>   	}
>   
>   	/* if transfer completes, SPACEMIT_ISR will handle it */
> @@ -373,7 +480,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
>   
>   	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
>   	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +
> +	if (!i2c->use_pio)
> +		complete(&i2c->complete);
>   }
>   
>   static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
> @@ -408,21 +517,14 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>   	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
>   
>   	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +
> +	if (!i2c->use_pio)
> +		complete(&i2c->complete);
>   }
>   
> -static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
>   {
> -	struct spacemit_i2c_dev *i2c = devid;
> -	u32 status, val;
> -
> -	status = readl(i2c->base + SPACEMIT_ISR);
> -	if (!status)
> -		return IRQ_HANDLED;
> -
> -	i2c->status = status;
> -
> -	spacemit_i2c_clear_int_status(i2c, status);
> +	u32 val;
>   
>   	if (i2c->status & SPACEMIT_SR_ERR)
>   		goto err_out;
> @@ -445,7 +547,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   	}
>   
>   	if (i2c->state != SPACEMIT_STATE_IDLE) {
> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->use_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +
>   
>   		if (spacemit_i2c_is_last_msg(i2c)) {
>   			/* trigger next byte with stop */
> @@ -459,6 +564,23 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   
>   err_out:
>   	spacemit_i2c_err_check(i2c);
> +}
> +
> +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)

Introducing spacemit_i2c_handle_state() as a simple separate
initial patch would simplify review.  (Not a big deal, but
something to think about for future patch series.)

> +{
> +	struct spacemit_i2c_dev *i2c = devid;
> +	u32 status;
> +
> +	status = readl(i2c->base + SPACEMIT_ISR);
> +	if (!status)
> +		return IRQ_HANDLED;
> +
> +	i2c->status = status;
> +
> +	spacemit_i2c_clear_int_status(i2c, status);
> +
> +	spacemit_i2c_handle_state(i2c);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -467,6 +589,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>   	unsigned long timeout;
>   	int idx = 0, cnt = 0;

Why is the timeout a fixed constant for PIO, but a fairly
precise calculation based on message length otherwise?

					-Alex

> +	if (i2c->use_pio) {
> +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
> +		return;
> +	}
> +
>   	for (; idx < i2c->msg_num; idx++)
>   		cnt += (i2c->msgs + idx)->len + 1;
>   
> @@ -479,11 +606,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>   	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>   }
>   
> -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +static inline int
> +spacemit_i2c_xfer_common(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool use_pio)
>   {
>   	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>   	int ret;
>   
> +	i2c->use_pio = use_pio;
> +
>   	i2c->msgs = msgs;
>   	i2c->msg_num = num;
>   
> @@ -511,6 +641,16 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>   	return ret < 0 ? ret : num;
>   }
>   
> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	return spacemit_i2c_xfer_common(adapt, msgs, num, false);
> +}
> +
> +static int spacemit_i2c_pio_xfer_atomic(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	return spacemit_i2c_xfer_common(adapt, msgs, num, true);
> +}
> +
>   static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>   {
>   	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> @@ -518,6 +658,7 @@ static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>   
>   static const struct i2c_algorithm spacemit_i2c_algo = {
>   	.xfer = spacemit_i2c_xfer,
> +	.xfer_atomic = spacemit_i2c_pio_xfer_atomic,
>   	.functionality = spacemit_i2c_func,
>   };
>   
> 
> ---
> base-commit: bc574b64121525b24d52e9bab747184181c808dc
> change-id: 20250814-k1-i2c-atomic-f1a90cd34364
> 
> Best regards,


