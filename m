Return-Path: <linux-i2c+bounces-14806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1D0CE58BE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 00:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7CD300EE68
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Dec 2025 23:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30D829BD8E;
	Sun, 28 Dec 2025 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HcCIRtXc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB4829E10C
	for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766964271; cv=none; b=QwxuIWHw5ZjPJ6eYz7vQiGgbq5iIrKzVxeUw8sVB8gaiigjLXYsGnDNFHrVFTmxQw6ySpqiKMluNUDe/3nJxcv/DlW0N+GZsj5J3eWu+0zaY9Es/AOE7xDTZaxoeyINyQu4xVNiG8D9mSo2BPLXV6PnfFa/6RaRxXmYkDCpI7Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766964271; c=relaxed/simple;
	bh=zyHTcs4sAM8qPL8QKtlk5WYOg5CHwgf6sDD5zgD2iIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or+nw5K0hVqd5cq18d7n2IaWP0xmoR5MxkTx8WbGPahBXOGt6nFsnndn4a1mFUIUtDmWrzFqOHG45eIe1rTuNtyI/xMVAwRus9056DT+XwovbeD9fcmPVl8r/lepePI0wVqLCNXUAEOOuFB9LTlwPK7nqpNJZSXBAXA818WROpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HcCIRtXc; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4eda6a8cc12so96786461cf.0
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 15:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766964268; x=1767569068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoUFoM/AFqp8QFieZjlzUsXqyxdJAynwYq4hISTzrmc=;
        b=HcCIRtXc5AT4dTHV9l/8M6eOi5VCOZT4vY7L6iLldIBaSB9VE/OK78FlhtSJI8Sy3I
         U2ncE5AGaW2uhYOsu48F+wEQ8cglGgCJPHwq/DGfodm+5EJsyDP8qhfwq+Qu9Xpv7z28
         p3h53WXk799uHEkwPLcUoHHBVooXcBb3FULNZdkRf3n8ix7qPrVkSw9TQbN7gXAY5QlT
         oqjnG4sFefiyppmK83D5jEsy8Tv2KEhOsW661osO/sR5iDrFNEMRzgAdW3B5J2ZZT4Pt
         3/pYfvgFvKmmr/XOsObJsxFxQhqypF6qNv0kddyjnTqJNqzkjZFD0BppmfNouW5b35pU
         4BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766964268; x=1767569068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoUFoM/AFqp8QFieZjlzUsXqyxdJAynwYq4hISTzrmc=;
        b=uPqJcLV6anytU8MqDxogkm3+qFmgWz1pHEgTdMUhModh2X7JBPwQCRyWZWY7ir1VPt
         J4gt7m7pvLAt9jntc4N/qzlfkLEK6YHz+i+nWUECp3AsAN+sXy5/RNm+YthPd2XDi8LO
         iweT1tyeQhez8+RicdBLAtT/9eAgriEtQFBwKBU+jVM+HkUfIgkk9siJUre9RjAjcdsU
         wmNEtKERFE4+llhICxQv2Ez8/+uDP7LcuE3Kti2GIHxFgxEe7VWn9yJFrgiSvQLd6pMv
         ic/C1IQqHbekSkeraPFh4Zkzv/yxajAfoBM87ZvnnR9RdlFKEusrkWoXIqbo5QuhFdyo
         ffog==
X-Gm-Message-State: AOJu0Yxt6GakUgQY24FEE+ZdsUYLb7Gjjtyv8jPkZTFESs5ez6WYXWwN
	JlxpseAUVkQoXL0Kzp/iAp9x6izKBd2/aZ5jw2xcnepjn76R8diyVPc1EPm3Y7Ac2IE=
X-Gm-Gg: AY/fxX6ULl+VCQUUG20aKVqVoKjyGpG+NeTv7nOWEaP3aFfQDUBe3BamOj2ZqS53sy1
	i+Nhfi/FPkX0izZkk69HfHDhBpi1019uMRO6stqyS761+VTgQP5XWGyTSjhjvdjpPXg7eXKLlZf
	dHX9qebSaYkADHjfD5Ni/bDB/fWK6QV3Lc2eKxzPonVC6WmyVLZMAaKS7R0tpqVfFRyB3Drz9Wt
	06RF4//zi5HzCYsnCbARcxMkqX5MUsHhkJ0c9oR2auxAd6c0BDx3pqQQo6CtUkZs1FQVWASzXSv
	ScTstUlB5vQZnrWVYEKXLZXBmuGAJbJZS4LxofuSs7oOlSbskzl8Tzg/kgvd4VU0rBbyRnKaifw
	EKvx2ADj23bYxCYEEu7uqI96P8gDIOTR5lc3GNSBsSsm3wMYetY19TF/pNyJiUdjEYbwlEagldJ
	XwwXIRl+KqlMhTDExmq5aQJj0sxGi++oDg98rOJgw+/6ygYl9X07c=
X-Google-Smtp-Source: AGHT+IFc5jR6SugG9szbFnXQB7umgrpQVIU6MtHWSsmnXP4vSvU9fvlnp09UUyvEmWL3e7Lv4m9bcw==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id d75a77b69052e-4f4abd1fd20mr498330641cf.37.1766964267946;
        Sun, 28 Dec 2025 15:24:27 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64c011sm207819451cf.25.2025.12.28.15.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:24:27 -0800 (PST)
Message-ID: <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
Date: Sun, 28 Dec 2025 17:24:26 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/25 9:31 PM, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> When i2c xfer_atomic is invoked, use_pio is set accordingly.
> 
> Since an atomic context is required, all interrupts are disabled when
> operating in PIO mode. Even with interrupts disabled, the bits in the
> ISR (Interrupt Status Register) will still be set, so error handling can
> be performed by polling the relevant status bits in the ISR.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

This generally looks good and what I say below doesn't
really ask for functional changes.

I have some suggestions on comments to improve readability
of the code.  I still have a few questions related to delays
and timeouts, and when you enable TX and RX interrupts.
These are more about explaining/justifying what's going on,
though in some cases they might imply an improvement that
could be made.

> ---
> Changes in v5:
> - optimize code logic
> - refactor delay handling into spacemit_i2c_delay() helper
> - introduce spacemit_i2c_complete() to centralize transfer completion
> - rework PIO transfer wait logic for clarity and correctness
> - modify and add some comments
> - modify commit message
> - Link to v4: https://lore.kernel.org/all/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/
> 
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
> - add is_pio judgement in irq_handler()
> - use a fixed timeout value when PIO
> - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>   drivers/i2c/busses/i2c-k1.c | 297 +++++++++++++++++++++++++++++++++-----------
>   1 file changed, 225 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index accef6653b56bd3505770328af17e441fad613a7..78a2de2c517e51e6ff997cc21402eb8f85054f85 100644
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
> @@ -125,6 +127,7 @@ struct spacemit_i2c_dev {
>   
>   	enum spacemit_i2c_state state;
>   	bool read;
> +	bool use_pio;
>   	struct completion complete;
>   	u32 status;
>   };
> @@ -171,6 +174,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>   }
>   
> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
> +				      unsigned int min_us,
> +				      unsigned int max_us)
> +{
> +	if (i2c->use_pio)
> +		udelay(max_us);
> +	else
> +		usleep_range(min_us, max_us);
> +}
> +
>   static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   {
>   	u32 status;
> @@ -182,7 +195,8 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   		return;
>   
>   	spacemit_i2c_reset(i2c);
> -	usleep_range(10, 20);
> +
> +	spacemit_i2c_delay(i2c, 10, 20);
>   
>   	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
>   		status = readl(i2c->base + SPACEMIT_IBMR);
> @@ -211,9 +225,15 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
>   	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
>   		return 0;
>   
> -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	if (i2c->use_pio)
> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	else
> +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +
>   	if (ret)
>   		spacemit_i2c_reset(i2c);
>   
> @@ -225,7 +245,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
>   	/* in case bus is not released after transfer completes */
>   	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
>   		spacemit_i2c_conditionally_reset_bus(i2c);
> -		usleep_range(90, 150);
> +		spacemit_i2c_delay(i2c, 90, 150);
>   	}
>   }
>   
> @@ -237,25 +257,30 @@ spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
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
> +		/*
> +		 * Unmask interrupt bits for all xfer mode:

Maybe "Enable error interrupts for all xfers".

> +		 * bus error, arbitration loss detected.

I would move the following comment below, where you enable CR_MSDIE.

> +		 * For transaction complete signal, we use master stop
> +		 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> +		 */
> +		val |= SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +
> +		/*
> +		 * Unmask interrupt bits for interrupt xfer mode:
> +		 * When IDBR receives a byte, an interrupt is triggered.

This is a code question, not a comment question:  Why not wait
until i2c_start() to enable the RX FIFO interrupt also?

> +		 *
> +		 * For the tx empty interrupt, it will be enabled in the
> +		 * i2c_start function.
> +		 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.

I don't think the TX FIFO empty interrupt is "erroneous" in
this case, just earlier than necessary.  Maybe:

	We don't want a TX FIFO empty interrupt until we start
	a transfer in i2c_start().

> +		 */
> +		val |= SPACEMIT_CR_DRFIE;
> +
> +		/* unmask master stop interrupt bit */
> +		val |= SPACEMIT_CR_MSDIE;
> +	}
>   
>   	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>   		val |= SPACEMIT_CR_MODE_FAST;
> @@ -267,7 +292,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   	val |= SPACEMIT_CR_SCLE;
>   
>   	/* enable master stop detected */
> -	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> +	val |= SPACEMIT_CR_MSDE;
>   
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   
> @@ -300,7 +325,11 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>   	/* send start pulse */
>   	val = readl(i2c->base + SPACEMIT_ICR);
>   	val &= ~SPACEMIT_CR_STOP;
> -	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
> +	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
> +

	/* Enable the TX empty interrupt */

> +	if (!i2c->use_pio)
> +		val |= SPACEMIT_CR_DTEIE;
> +
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
>   
> @@ -315,8 +344,20 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>   	return !i2c->unprocessed;
>   }
>   
> +static inline void spacemit_i2c_complete(struct spacemit_i2c_dev *i2c)
> +{
> +	/* SPACEMIT_STATE_IDLE avoids triggering the next byte */
> +	i2c->state = SPACEMIT_STATE_IDLE;
> +
> +	if (!i2c->use_pio)

	if (i2c->use_pio)
		return;

	complete(&i2c->complete);

> +		complete(&i2c->complete);
> +}
> +
>   static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>   {

	/* If there's no space in the TX FIFO, we're done */

> +	if (!(i2c->status & SPACEMIT_SR_ITE))
> +		return;
> +
>   	/* if transfer completes, SPACEMIT_ISR will handle it */
>   	if (i2c->status & SPACEMIT_SR_MSD)
>   		return;
> @@ -327,16 +368,18 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
>   		return;
>   	}
>   
> -	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
> -	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +	spacemit_i2c_complete(i2c);
>   }
>   
>   static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
>   {

	/* If there's nothing in the RX FIFO, we're done */

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
> @@ -347,9 +390,7 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
>   	if (i2c->unprocessed)
>   		return;
>   
> -	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
> -	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +	spacemit_i2c_complete(i2c);
>   }
>   
>   static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
> @@ -383,8 +424,134 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>   
>   	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
>   
> -	i2c->state = SPACEMIT_STATE_IDLE;
> -	complete(&i2c->complete);
> +	spacemit_i2c_complete(i2c);
> +}
> +
> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	if (i2c->status & SPACEMIT_SR_ERR)
> +		goto err_out;
> +
> +	val = readl(i2c->base + SPACEMIT_ICR);
> +	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> +
> +	switch (i2c->state) {
> +	case SPACEMIT_STATE_START:
> +		spacemit_i2c_handle_start(i2c);
> +		break;
> +	case SPACEMIT_STATE_READ:
> +		spacemit_i2c_handle_read(i2c);
> +		break;
> +	case SPACEMIT_STATE_WRITE:
> +		spacemit_i2c_handle_write(i2c);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (i2c->state != SPACEMIT_STATE_IDLE) {
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->use_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +
> +
> +		if (spacemit_i2c_is_last_msg(i2c)) {
> +			/* trigger next byte with stop */
> +			val |= SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |= SPACEMIT_CR_ACKNAK;
> +		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
> +	}
> +
> +err_out:
> +	spacemit_i2c_err_check(i2c);
> +}
> +
> +/*
> + * In PIO mode, this function is used as a replacement for
> + * wait_for_completion_timeout(), whose return value indicates
> + * the remaining time.
> + *
> + * We do not have a meaningful remaining-time value here, so
> + * return a non-zero value on success to indicate "not timed out".
> + * Returning 1 ensures callers treating the return value as
> + * time_left will not incorrectly report a timeout.
> + */
> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
> +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> +	int ret;
> +
> +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> +
> +	do {
> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> +
> +		if (!(i2c->status & mask)) {
> +			udelay(10);

You are looking only for TX FIFO empty and RX FIFO full
interrupts.  In this situation I *think* you have several
possible interrupt conditions occurring.  Some questions:
- Would observing one of the other possibly conditions
   at this point be an error?
- If so, is it OK to simply ignore (and acknowledge) these?
- Why is the 10 microsecond delay required?
- Is it reasonable to delay if you see the RXHF condition?

> +			continue;
> +		}
> +
> +		spacemit_i2c_handle_state(i2c);
> +
> +

Delete the extra blank lines here.

> +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
> +
> +	if (i2c->unprocessed)
> +		return 0;
> +
> +	if (i2c->read)
> +		return 1;
> +
> +	/*
> +	 * If this is the last byte to write of the current message,
> +	 * we have to wait here. Otherwise, control will proceed directly
> +	 * to start(), which would overwrite the current data.
> +	 */
> +	ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +					i2c->status, i2c->status & SPACEMIT_SR_ITE,
> +					30, 1000);

Why is 1000 microseconds the correct timeout period here?

> +	if (ret)
> +		return 0;
> +
> +	/*
> +	 * For writes: in interrupt mode, an ITE (write-empty) interrupt is triggered
> +	 * after the last byte, and the MSD-related handling takes place there.
> +	 * In PIO mode, however, we need to explicitly call err_check() to emulate this
> +	 * step, otherwise the next transfer will fail.
> +	 */
> +	if (i2c->msg_idx == i2c->msg_num - 1) {
> +		mask = SPACEMIT_SR_MSD | SPACEMIT_SR_ERR;
> +		/*
> +		 * In some cases, MSD may not arrive immediately;
> +		 * wait here to handle that.
> +		 */
> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +						i2c->status, i2c->status & mask,
> +						30, 1000);

Same question in this case.  Also, symbolic constants for
timeouts are often better.

> +		if (ret)
> +			return 0;
> +
> +		spacemit_i2c_err_check(i2c);
> +	}
> +
> +	return 1;
> +}
> +
> +static int spacemit_i2c_wait_xfer_complete(struct spacemit_i2c_dev *i2c)
> +{
> +	if (i2c->use_pio)
> +		return spacemit_i2c_wait_pio_xfer(i2c);
> +
> +	return wait_for_completion_timeout(&i2c->complete,
> +					   i2c->adapt.timeout);
>   }
>   
>   static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> @@ -402,8 +569,8 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
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
> @@ -421,7 +588,7 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>   static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   {
>   	struct spacemit_i2c_dev *i2c = devid;
> -	u32 status, val;
> +	u32 status;
>   
>   	status = readl(i2c->base + SPACEMIT_ISR);
>   	if (!status)
> @@ -431,41 +598,8 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   
>   	spacemit_i2c_clear_int_status(i2c, status);
>   
> -	if (i2c->status & SPACEMIT_SR_ERR)
> -		goto err_out;
> -
> -	val = readl(i2c->base + SPACEMIT_ICR);
> -	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> -
> -	switch (i2c->state) {
> -	case SPACEMIT_STATE_START:
> -		spacemit_i2c_handle_start(i2c);
> -		break;
> -	case SPACEMIT_STATE_READ:
> -		spacemit_i2c_handle_read(i2c);
> -		break;
> -	case SPACEMIT_STATE_WRITE:
> -		spacemit_i2c_handle_write(i2c);
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	if (i2c->state != SPACEMIT_STATE_IDLE) {
> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
> +	spacemit_i2c_handle_state(i2c);
>   
> -		if (spacemit_i2c_is_last_msg(i2c)) {
> -			/* trigger next byte with stop */
> -			val |= SPACEMIT_CR_STOP;
> -
> -			if (i2c->read)
> -				val |= SPACEMIT_CR_ACKNAK;
> -		}
> -		writel(val, i2c->base + SPACEMIT_ICR);
> -	}
> -
> -err_out:
> -	spacemit_i2c_err_check(i2c);
>   	return IRQ_HANDLED;
>   }
>   
> @@ -474,6 +608,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>   	unsigned long timeout;
>   	int idx = 0, cnt = 0;
>   
> +	if (i2c->use_pio) {
> +		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);

Again, why is a rough 1000 millisecond timeout OK for PIO, while a
fairly precise timeout value based on the number of bytes to be
transferred and the transfer bit rate computed for interrupt mode?

					-Alex


> +		return;
> +	}
> +
>   	for (; idx < i2c->msg_num; idx++)
>   		cnt += (i2c->msgs + idx)->len + 1;
>   
> @@ -486,11 +625,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
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
> @@ -518,6 +660,16 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
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
> @@ -525,6 +677,7 @@ static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>   
>   static const struct i2c_algorithm spacemit_i2c_algo = {
>   	.xfer = spacemit_i2c_xfer,
> +	.xfer_atomic = spacemit_i2c_pio_xfer_atomic,
>   	.functionality = spacemit_i2c_func,
>   };
>   
> 


