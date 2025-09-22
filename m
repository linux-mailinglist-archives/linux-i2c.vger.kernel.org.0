Return-Path: <linux-i2c+bounces-13103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A2B934D4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39538480398
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6ABA2EAB78;
	Mon, 22 Sep 2025 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Vvy6h959"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA826F28B;
	Mon, 22 Sep 2025 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574609; cv=none; b=NN7Lx5KVkhKPTNtH9zfRbRQxW4slUpntG2EqfYNlkJUNbl9afGmuc9belTXwt8mqhVaI8JheIKrCY81R43ekZRKvVD/0J2q4I8FNKBlHKoElSL5XYWc9d+XNrG2khGhB7cEQrZhLRoOzO+CUBI9la7fNvmWdC/JuaHpzUZgWj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574609; c=relaxed/simple;
	bh=eVbYXydjQ6u3xLzxlYPxKLlky7JeAiUQgOQxwxqEyx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efcmdT7+C8YjVCTo9eqoNTCG2vbRJL90aI4OT7qvF1jx6/YPbepY52l5uqdTI+3wtUHWh/Uy9dSc7Gk7wIuIKXqxL9OW9AobrD0ApqTZO+kiBy5QCFwKc6HyHW1WNlnw4NIlRwEO2Ey2fFSXRFvWROWm2pYRJZCoCSLuZgSl1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Vvy6h959; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tkcGcnyLDQs7+OV1rix0MApiJwN3gW5xWpQTeFCsWWs=; b=Vvy6h959wswjozTzxSIf7gZGcZ
	dmQJULRFzWpCDZ9ljwKvvA4iSr4dQUzMzFQOr3RRsE51R9qK3vMT/Sub1lD5lj2MwHX30dr0JmzBR
	EboPNQ1nvIPJuI+NrHIV8GdBGSlL0JgLhWkPwB2NzZcyLSHcwd49Zr/RibAbCnZM5NZJXdnXCSxH4
	3nAnb/IAigGw7mfI5eV26GRkrJFdmRHvwvLaRkJxoFfEWDj6FJMCqUHyQEe/fwJCHZTN4h/EcIYB2
	a2JnEZGATR8288oyVDlk0GiGRbm8R0FoL7dTCOcvQLKEa4hF72SQwtSfE3H+gs0Hiz88gtLFiF1Ht
	zvWEO2iw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0naT-00AlZq-28;
	Mon, 22 Sep 2025 22:56:41 +0200
Date: Mon, 22 Sep 2025 22:56:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <aNG4CQLraAqyVjdc@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-6-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-6-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-08-27 15:39, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C with interrupts disabled.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 139 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 120 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f..e558fe4cbd5a78b5b53b0c02cbbca818b6495d4a 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -124,6 +124,7 @@ struct spacemit_i2c_dev {
>  
>  	enum spacemit_i2c_state state;
>  	bool read;
> +	bool is_pio;
>  	struct completion complete;
>  	u32 status;
>  };
> @@ -228,7 +229,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
>  
>  static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  {
> -	u32 val;
> +	u32 val = 0;
>  
>  	/*
>  	 * Unmask interrupt bits for all xfer mode:
> @@ -236,7 +237,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 * For transaction complete signal, we use master stop
>  	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>  	 */
> -	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +	if (!i2c->is_pio)
> +		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>  
>  	/*
>  	 * Unmask interrupt bits for interrupt xfer mode:
> @@ -246,7 +248,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	 * i2c_start function.
>  	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
>  	 */
> -	val |= SPACEMIT_CR_DRFIE;
> +	if (!i2c->is_pio)
> +		val |= SPACEMIT_CR_DRFIE;
>  
>  	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>  		val |= SPACEMIT_CR_MODE_FAST;
> @@ -258,7 +261,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_SCLE;
>  
>  	/* enable master stop detected */
> -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +	val |= SPACEMIT_CR_MSDE;
> +
> +	if (!i2c->is_pio)
> +		val |= SPACEMIT_CR_MSDIE;
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  
> @@ -295,10 +301,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
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

For all the above is_pio conditions, I have a stupid question, and the
answer probably depends on the controller behaviour. 

Given all the individual interrupts are kept disabled, does it make 
sense to disable the controller interrupt in spacemit_i2c_xfer_msg() 
below? Or maybe the reverse question, does it make sense to disable the 
controller interrupt in spacemit_i2c_xfer_msg() given all individual 
interrupts are kept disabled?

> +static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);

The i2c->adapt.timeout value is computed without a lot of margin, so I 
wonder if it is also valid in PIO mode where there is more overhead?

Note that I haven't encountered any issue, but OTOH I only tried writing 
one register of the P1 chip.

Maybe this whole computation could be simplified, other adapters seems 
to use a fixed value independent of the message, of between 200 ms to 
6s. That could also fix a timeout if the SCL clock is slowed down by the 
slave (again that's not something I have tried or experienced).

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

You can't use readl_poll_timeout() in an atomic context. You should use 
readl_poll_timeout_atomic() instead. Note that there is another one to 
fix in spacemit_i2c_wait_bus_idle.

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
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -312,10 +362,27 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  
>  		reinit_completion(&i2c->complete);
>  
> -		spacemit_i2c_start(i2c);
> +		if (i2c->is_pio) {
> +			disable_irq(i2c->irq);
> +
> +			/*
> +			 * The K1 I2C controller has a quirk:
> +			 * when doing PIO transfers, the status register must be cleared
> +			 * of all other bits before issuing a START.
> +			 * Failing to do so will prevent the transfer from working properly.
> +			 */
> +			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> +
> +			spacemit_i2c_start(i2c);
> +			time_left = spacemit_i2c_wait_pio_xfer(i2c);
> +
> +			enable_irq(i2c->irq);
> +		} else {
> +			spacemit_i2c_start(i2c);
> +			time_left = wait_for_completion_timeout(&i2c->complete,
> +								i2c->adapt.timeout);
> +		}
>  
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
>  		if (!time_left) {
>  			dev_err(i2c->dev, "msg completion timeout\n");
>  			spacemit_i2c_conditionally_reset_bus(i2c);
> @@ -343,6 +410,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>  
>  static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>  {
> +	if (!(i2c->status & SPACEMIT_SR_ITE))
> +		return;
> +
>  	/* if transfer completes, SPACEMIT_ISR will handle it */
>  	if (i2c->status & SPACEMIT_SR_MSD)
>  		return;
> @@ -355,14 +425,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>  
>  	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
>  	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +
> +	if (!i2c->is_pio)
> +		complete(&i2c->complete);
>  }
>  
>  static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
>  {
> +	if (!(i2c->status & SPACEMIT_SR_IRF))
> +		return;
> +
>  	if (i2c->unprocessed) {
>  		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
>  		i2c->unprocessed--;
> +		return;
>  	}
>  
>  	/* if transfer completes, SPACEMIT_ISR will handle it */
> @@ -375,7 +451,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
>  
>  	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
>  	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +
> +	if (!i2c->is_pio)
> +		complete(&i2c->complete);
>  }
>  
>  static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
> @@ -410,7 +488,9 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>  	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
>  
>  	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +
> +	if (!i2c->is_pio)
> +		complete(&i2c->complete);
>  }
>  
>  static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
> @@ -418,13 +498,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
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
> @@ -483,11 +570,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>  	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>  }
>  
> -static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
> +static inline int
> +spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
>  {
>  	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>  	int ret;
>  
> +	i2c->is_pio = is_pio;
> +
>  	i2c->msgs = msgs;
>  	i2c->msg_num = num;
>  
> @@ -510,18 +600,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
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
>  	.functionality = spacemit_i2c_func,
>  };
>  
> 
> -- 
> 2.50.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

