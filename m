Return-Path: <linux-i2c+bounces-13102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7BB934D1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750554803F5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA2313525;
	Mon, 22 Sep 2025 20:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="DLF2S+l7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916AD2D739F;
	Mon, 22 Sep 2025 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574578; cv=none; b=Lm7EDwrgYv8ZLUvR5tR2uTn21YyyBqdawsIUUuCuEt+ePTgPYugcfya49++pf1VA0nrQ/4AS6esnjwHZveYkEG9QWOfMFAfJch8I/GobI/UxAwUJF6eG52cOeMdB8xoqMr9EelZG5uUACQUVA54qkDGc2TKTvlLqTUgqAZLnXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574578; c=relaxed/simple;
	bh=woxsXfvEaKUIc3jAktObDpfOyqGVZN737X7ZuEp0tF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9uqSjo81gJE400f/+O09t10AuqUYd7oLG1QAjq/1Iax+r4t06NoAWbrdMhxjinyhyNAkkpVFIosr1MiPFYsT+NHKtt6iHTQV6MvWLOPoi5F9lbiBpxezOlMrp6+R+xWX1NX7YLlo3uUhsu+y+H5guTXJd1SR7Ei/umgHf/IqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=DLF2S+l7; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=QUOgJuOydaJvvEUKF3VgdXsY388ThHK01o8nAArGd1M=; b=DLF2S+l7LuH32J//NQoMt11fiQ
	/5lCo/GwSxHpqqv8/unALb7f59u5iZm2ClnYJAYp1gFl3nsQBRSk+Wrv4lSBchgydEk+DT441RiLw
	Dv7dWf7a+/LkkTUr27+JgAGpfGaFeGNXHhC8IqirC119WSqgRt2RPchtM1w80tskOimkzy8gciPDS
	UsCSupsGCQPeTLMQpwpM5WTCAr+FRUB2uwHCsUDDqVWMPNYe9/SZEoEx14iJCvu6H7jT86xXvfxRt
	d/n3e3b1jKdhvqciN6XCSmKhkQyIrvNcu0w8LeboneK/BGC7tMRO5P67HEEEPSAms57m7k/gdROgg
	rYd7DZVA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZz-00AlX1-0H;
	Mon, 22 Sep 2025 22:56:11 +0200
Date: Mon, 22 Sep 2025 22:56:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 5/6] i2c: spacemit: ensure SDA is released after bus reset
Message-ID: <aNG36jhaWN-mtgMm@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-08-27 15:39, Troy Mitchell wrote:
> After performing a conditional bus reset, the controller must ensure
> that the SDA line is actually released.
> 
> Previously, the reset routine only performed a single check,
> which could leave the bus in a locked state in some situations.
> 
> This patch introduces a loop that toggles the reset cycle and issues
> a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
> SDA after each attempt. If SDA is released before the maximum count,
> the function returns early. Otherwise, a warning is emitted.
> 
> This change improves bus recovery reliability.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 4d78ee7b6929ee43771e500d4f85d9e55e68b221..d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
>   */
>  
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/i2c.h>
>   #include <linux/iopoll.h>
> @@ -26,7 +27,8 @@
>  #define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
>  /* Bit 9 is reserved */
>  #define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
> -/* Bits 11-12 are reserved */
> +#define SPACEMIT_CR_RSTREQ	 BIT(11)	/* i2c bus reset request */
> +/* Bit 12 is reserved */
>  #define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
>  #define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
>  /* Bits 15-17 are reserved */
> @@ -78,6 +80,7 @@
>  					SPACEMIT_SR_ALD)
>  
>  #define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> +#define SPACEMIT_RCR_FIELD_RST_CYC		GENMASK(3, 0)	/* bypass the SDA glitch fix */

The comment here seems wrong, datasheet says "The cycles of SCL during 
bus reset."

>  /* SPACEMIT_IBMR register fields */
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> @@ -91,6 +94,8 @@
>  
>  #define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
>  
> +#define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
> +
>  enum spacemit_i2c_state {
>  	SPACEMIT_STATE_IDLE,
>  	SPACEMIT_STATE_START,
> @@ -163,6 +168,7 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>  static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  {
>  	u32 status;
> +	u8 clk_cnt;
>  
>  	/* if bus is locked, reset unit. 0: locked */
>  	status = readl(i2c->base + SPACEMIT_IBMR);
> @@ -172,6 +178,21 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  	spacemit_i2c_reset(i2c);
>  	usleep_range(10, 20);
>  
> +	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
> +		status = readl(i2c->base + SPACEMIT_IBMR);
> +		if (status & SPACEMIT_BMR_SDA)
> +			break;

What about just adding the return here instead of checking clk_cnt 
below?

> +
> +		/* There's nothing left to save here, we are about to exit */
> +		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
> +		       i2c->base + SPACEMIT_IRCR);
> +		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> +		usleep_range(20, 30);
> +	}
> +
> +	if (clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX)
> +		return;
> +
>  	/* check sda again here */
>  	status = readl(i2c->base + SPACEMIT_IBMR);
>  	if (!(status & SPACEMIT_BMR_SDA))

Once we have exited the loop, I am not sure we should check SDA once 
more, maybe just display the error message directly.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

