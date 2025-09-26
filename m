Return-Path: <linux-i2c+bounces-13202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97887BA372B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 13:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43BFF5601D9
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 11:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C532F546D;
	Fri, 26 Sep 2025 11:11:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7172F5335;
	Fri, 26 Sep 2025 11:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885062; cv=none; b=fty090rP181iCVbq2UO2BeAgtFCh+03E8H7G/8GIt4sNy8O8RSL6WoDOBSw320fFmMRkQCAt0i5G6JZK9HEllatNUDu6cToyjLxYFRp40Vc4UnXldFQQ7YrHjwck412jA/coKdTb+TjNGGobDQ3VE+YFE6VWHuQ5DFFJ9gxp6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885062; c=relaxed/simple;
	bh=7PTfLSJwaA0laY92dxTRZPA6vNrpsXZTbsaDPx/kJX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkMDJR7TCnCOAuydYGRJhkyc4BIZAWDejI17bSubiQnRkIcWz1tf/PEl92MJSnvRRXZSBz1wEndRQVO0ekugdQaLPNtNsq3AL6E0oLlARk/YaTHtx1xNiFP58k5tgm2xOQwvsi17RTN5ws+sHdwaz9dtqJTzP3mnm74OLmhZBUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AAA74340BDE;
	Fri, 26 Sep 2025 11:10:59 +0000 (UTC)
Date: Fri, 26 Sep 2025 19:10:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250926111055-GYB1324993@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>

Hi Troy,

On 10:02 Thu 25 Sep     , Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 164 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 140 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..e403eb7d6f329f4fe5c5242f94cc21094dff105c 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,9 @@
>  
>  #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>  
> +/* Constants */
> +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> +
>  enum spacemit_i2c_state {
>  	SPACEMIT_STATE_IDLE,
>  	SPACEMIT_STATE_START,
> @@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
>  
>  	enum spacemit_i2c_state state;
>  	bool read;
> +	bool is_pio;
using_pio_mode or simply use_pio, but have to say..

I feel it's improper to have this flag here, since it's not a controller
level feature, I understand it was introduced to support aotmic operation

Personally, I'd suggest to pass the flag in xfer(), then propagate down to
whatever needed, so it limit to single transmission which more flexible

>  	struct completion complete;
>  	u32 status;
>  };
> @@ -206,9 +210,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
>  	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
>  		return 0;
>  
> -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	if (!i2c->is_pio)
> +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	else
> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
question, since you have already used state-machine to track the I2C process,
can you not poke hardware ISR register in a scatter way? I'd rather see it handled
more closely in a interrupt context or related?

btw, does some bits of the ISR register have read-then-clear feature?
which may require special attention to handle..

>  	if (ret)
>  		spacemit_i2c_reset(i2c);
>  
> @@ -226,7 +235,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
>  
>  static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  {
> -	u32 val;
> +	u32 val = 0;
>  
>  	/*
>  	 * Unmask interrupt bits for all xfer mode:
> @@ -234,7 +243,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 * For transaction complete signal, we use master stop
>  	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>  	 */
> -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +	if (!i2c->is_pio)
..
> +		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>  
>  	/*
>  	 * Unmask interrupt bits for interrupt xfer mode:
> @@ -244,7 +254,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 * i2c_start function.
>  	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
>  	 */
> -	val |= SPACEMIT_CR_DRFIE;
> +	if (!i2c->is_pio)
..
> +		val |= SPACEMIT_CR_DRFIE;
>  
>  	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>  		val |= SPACEMIT_CR_MODE_FAST;
> @@ -256,7 +267,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_SCLE;
>  
>  	/* enable master stop detected */
> -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +	val |= SPACEMIT_CR_MSDE;
> +
> +	if (!i2c->is_pio)
> +		val |= SPACEMIT_CR_MSDIE;
can you converge all assignment under one if?
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  
> @@ -293,10 +307,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>  	/* send start pulse */
>  	val = readl(i2c->base + SPACEMIT_ICR);
>  	val &= ~SPACEMIT_CR_STOP;
> -	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
> +
> +	if (!i2c->is_pio)
> +		val |= SPACEMIT_CR_DTEIE;
> +
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
> +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> +	int ret;
> +
> +	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
> +		udelay(10);
> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> +
> +		if (!(i2c->status & SPACEMIT_SR_IRF) && !(i2c->status & SPACEMIT_SR_ITE))
> +			continue;
> +
> +		spacemit_i2c_irq_handler(0, i2c);

can you refactor and construct a new function? that can be reused between
irq() and pio() cases, it makes people confused..

> +
> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		/*
> +		 * This is the last byte to write of the current message.
> +		 * If we do not wait here, control will proceed directly to start(),
> +		 * which would overwrite the current data.
> +		 */
> +		if (!i2c->read && !i2c->unprocessed) {
> +			ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +						i2c->status, i2c->status & SPACEMIT_SR_ITE,
> +						30, 1000);
> +			if (ret)
> +				return 0;
> +		}
> +	}
> +
> +	if (i2c->unprocessed)
> +		return 0;
> +
> +	return 1;
> +}
> +

[snip]..

>  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> @@ -416,13 +505,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  	struct spacemit_i2c_dev *i2c = devid;
>  	u32 status, val;
>  
> -	status = readl(i2c->base + SPACEMIT_ISR);
> -	if (!status)
> -		return IRQ_HANDLED;
> +	/*
> +	 * In PIO mode, do not read status again.
> +	 * It has already been read in wait_pio_xfer(),
> +	 * and reading it clears some bits.
> +	 */
> +	if (!i2c->is_pio) {
> +		status = readl(i2c->base + SPACEMIT_ISR);
> +		if (!status)
> +			return IRQ_HANDLED;
>  
> -	i2c->status = status;
> +		i2c->status = status;
>  
> -	spacemit_i2c_clear_int_status(i2c, status);
> +		spacemit_i2c_clear_int_status(i2c, status);
> +	}
>  
>  	if (i2c->status & SPACEMIT_SR_ERR)
>  		goto err_out;
> @@ -445,7 +541,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  	}
>  
>  	if (i2c->state != SPACEMIT_STATE_IDLE) {
> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->is_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +
>  
>  		if (spacemit_i2c_is_last_msg(i2c)) {
>  			/* trigger next byte with stop */
> @@ -479,15 +578,21 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>  	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>  }
>  
> -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +static inline int
> +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
s/spacemit_i2c_xfer/spacemit_i2c_xfer_common/

s/is_pio/atomic/, I'd suggest to distinguish 'pio' vs 'atomic'

>  {
>  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>  	int ret;
>  
> +	i2c->is_pio = is_pio;
so, check my previous comment, you use this member to cache the flag..

> +
>  	i2c->msgs = msgs;
>  	i2c->msg_num = num;
>  
> -	spacemit_i2c_calc_timeout(i2c);
> +	if (!i2c->is_pio)
> +		spacemit_i2c_calc_timeout(i2c);
> +	else
> +		i2c->adapt.timeout = SPACEMIT_WAIT_TIMEOUT;
>  
>  	spacemit_i2c_init(i2c);
>  
> @@ -506,18 +611,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  
>  	if (ret == -ETIMEDOUT || ret == -EAGAIN)
>  		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
> -			  ret, i2c->status & SPACEMIT_SR_ERR);
> +			ret, i2c->status & SPACEMIT_SR_ERR);
>  
>  	return ret < 0 ? ret : num;
>  }
>  
> +static int spacemit_i2c_int_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)

> +{
> +	return spacemit_i2c_xfer(adapt, msgs, num, false);
> +}
> +
> +static int spacemit_i2c_pio_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +{
> +	return spacemit_i2c_xfer(adapt, msgs, num, true);
> +}
> +
>  static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>  {
>  	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>  }
>  
>  static const struct i2c_algorithm spacemit_i2c_algo = {
> -	.xfer = spacemit_i2c_xfer,
> +	.xfer = spacemit_i2c_int_xfer,
> +	.xfer_atomic = spacemit_i2c_pio_xfer,
I'd suggest to align with core function's prototype,
s/spacemit_i2c_int_xfer/spacemit_i2c_xfer/
s/spacemit_i2c_pio_xfer/spacemit_i2c_pio_xfer_atomic /

>  	.functionality = spacemit_i2c_func,
>  };
>  
> 
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

