Return-Path: <linux-i2c+bounces-13099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2EB934B3
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0081419083BA
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACED32F3C23;
	Mon, 22 Sep 2025 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="XDQqt0Sm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2226527B34A;
	Mon, 22 Sep 2025 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574567; cv=none; b=lno2MuxRjIYbS7OgWAO6rfPxfB1+mZTe6kg1PMBu3f73xuMeb7jjcXGv098t77doMBYG4peQtalhslvLjTF8OAyE+4PqqiY0A5CQ7Si7hmz/t9rDwE8uXAeNwZuu93VBJEtmChPJJyVxMR33QzW8vM3tRW5N2oSR5Lxsx+iBSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574567; c=relaxed/simple;
	bh=VH1x8yT4AB0wro/UjBYQsIBwnN7Hk0h8CqOdk0YKcK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brRXT1/XZlrmMp1U7m5JbjvgJ7vp3qiiuMwBGXulr9DX+/vyYvzmB8wi7hlfFFyn3ZkC0ulqMbnOAaY2uZbFxHjGHXuwxGjaF/TpbP/C4uU1CVzHUwIslYj8+w9Sigd6GxjjscsJGSq6n2XuLcgQ5WQuDDAsdIaK+t+VotI6iSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=XDQqt0Sm; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9/M25QqF3hrAvfV2pEYMvptZeJC6YyPZb9krRsEkPmg=; b=XDQqt0SmM3tdf1ro8bCYl/LJCO
	2tJJJhqELvRVwS+Qqwz4O+k8WURKU1kxiO75FJ6Bao31R81F0nEfQjX8qA4VK0L1Gu+hvMJOSOQPq
	MMgxBJBWQaxku+9ZOJ0hvBxSatHjUZdG1GJmYUMV7l5pd+UrhrwSVSRaSWfuOBULrvRFuWW+xPqjO
	HzCuLdCrg/mipDZNEVBaVgD35aSLqOKG7L4j1/Grr5PDqMCCDuUTFR3pLyrSmy2IPrsnwkRHyqNK/
	9ypXFfnxszPBI94Zx62D7Ji/rkzpvGBWoeyeGlgQ9y+mxXLzNzyRbtLUzP/GKcZo8BlEBSAs767tM
	nTyqcVBg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZl-00AlVL-2f;
	Mon, 22 Sep 2025 22:55:57 +0200
Date: Mon, 22 Sep 2025 22:55:57 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/6] i2c: spacemit: remove stop function to avoid bus
 error
Message-ID: <aNG33WyGENMWI3Wl@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-2-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-2-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-08-27 15:39, Troy Mitchell wrote:
> Previously, STOP handling was split into two separate steps:
>   1) clear TB/STOP/START/ACK bits
>   2) issue STOP by calling spacemit_i2c_stop()
> 
> This left a small window where the control register was updated
> twice, which can confuse the controller. While this race has not
> been observed with interrupt-driven transfers, it reliably causes
> bus errors in PIO mode.
> 
> Inline the STOP sequence into the IRQ handler and ensure that
> control register bits are updated atomically in a single writel().
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index ee08811f4087c8e709d25dd314854ed643cc5a47..d342752030d077953adf84a2886211de96e843c4 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -267,19 +267,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>  	writel(val, i2c->base + SPACEMIT_ICR);
>  }
>  
> -static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
> -{
> -	u32 val;
> -
> -	val = readl(i2c->base + SPACEMIT_ICR);
> -	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
> -
> -	if (i2c->read)
> -		val |= SPACEMIT_CR_ACKNAK;
> -
> -	writel(val, i2c->base + SPACEMIT_ICR);
> -}
> -
>  static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>  {
>  	unsigned long time_left;
> @@ -412,7 +399,6 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  
>  	val = readl(i2c->base + SPACEMIT_ICR);
>  	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> -	writel(val, i2c->base + SPACEMIT_ICR);
>  
>  	switch (i2c->state) {
>  	case SPACEMIT_STATE_START:
> @@ -429,14 +415,18 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  	}
>  
>  	if (i2c->state != SPACEMIT_STATE_IDLE) {
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->is_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +

This needs to be moved to the last patch introducing PIO support.

>  		if (spacemit_i2c_is_last_msg(i2c)) {
>  			/* trigger next byte with stop */
> -			spacemit_i2c_stop(i2c);
> -		} else {
> -			/* trigger next byte */
> -			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
> -			writel(val, i2c->base + SPACEMIT_ICR);
> +			val |= SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |= SPACEMIT_CR_ACKNAK;
>  		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
>  	}
>  
>  err_out:

Otherwise sounds good.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

