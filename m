Return-Path: <linux-i2c+bounces-15164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B7D1FF1E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 16:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 829D53008DD4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232713A0E8D;
	Wed, 14 Jan 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpFf7575"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3483A0B39;
	Wed, 14 Jan 2026 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405645; cv=none; b=TuH72rgXNYl4tJtPCqoAC1/KvMIzgJNTNUosWmA7VrHtu0+XWjTn0cLg3mqrDtBF0sE6Egnd0LXEWi6mzQakIa5dAL7efe59BFLiAQHA9LeB9bSyj45uxKY1jb3sZ9jY+aGUyzTyKbaBLmhn+rV8kJ0ejbhDIUwkirkjlHV/WRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405645; c=relaxed/simple;
	bh=gErwCbPWxg85fNo495sxPpFMvvtkbsFJg6xUa56/AlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjWTMrCxYttnpeZ/oYFJS6veE0mHTR/fpd4SIiBlJRYtDtAH7pTvLZBkKKakHm2ZtsSs3vs/UzSPOCZbC0YJUL1Kj/76joUJuP7hHEIjE2B229c/U7QQIwwpmgjBbTV7deiaVZA0NMLGf2Dgkjlj3A2m5y+LVkl+j88s4zM+xWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpFf7575; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2B8C4CEF7;
	Wed, 14 Jan 2026 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405645;
	bh=gErwCbPWxg85fNo495sxPpFMvvtkbsFJg6xUa56/AlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpFf7575toSf2HueGcvcfezNtNTHiMg9B1RojAExCrCWHjhdQZhwvNGwa+xKZ8XEC
	 l0C/H+2W+GbpPWkUiQtveAEx58CUywDzMItInrWUy/6CED47/wc9a6qnsAjXruKMCI
	 bjM9wG6/1zFgW3bQUk7WSwCckRETgy7ANThtF93L6d3MiGWxNyDR1lAM1VHmFbA8ID
	 5gwE1/HRFUGizMcdhUeOnbBF1Z0sXKQLYN9m+TZ019+lYDTmNxEfS3gfVwfrKG+SRV
	 zY/0zm/ScgTg4d+VOwd/WlmVJ5O3I0NZFBnl37qFAvSeNxC3ZtvsEf+h9W6dX8Kz7B
	 ig6FPzpWWJ8dQ==
Date: Wed, 14 Jan 2026 16:47:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>

Hi Troy,

...

> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>  }
>  
> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
> +				      unsigned int min_us,
> +				      unsigned int max_us)
> +{
> +	if (i2c->use_pio)
> +		udelay(max_us);

We need some control on how much we want to sleep in atomic. This
can have effects on the whole system.

> +	else
> +		usleep_range(min_us, max_us);

If we assume that max_us = min_us * 2 we don't need to pass it as
a parameter. Even better you can use fsleep here which does it
for you.

> +}

...

> +	if (!i2c->use_pio) {
> +		/*
> +		 * Enable interrupt bits for all xfer mode:
> +		 * bus error, arbitration loss detected.
> +		 */
> +		val |= SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
> +
> +		/*
> +		 * Unmask interrupt bits for interrupt xfer mode:
> +		 * When IDBR receives a byte, an interrupt is triggered.
> +		 *
> +		 * For the tx empty interrupt, it will be enabled in the
> +		 * i2c_start().
> +		 * We don't want a TX empty interrupt until we start
> +		 * a transfer in i2c_start().
> +		 */
> +		val |= SPACEMIT_CR_DRFIE;
> +
> +		/* Enable master stop interrupt bit.

Please run checkpatch.pl before sending the patch. Here the
comment format is wrong.

> +		 * For transaction complete signal, we use master stop
> +		 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
> +		 */
> +		val |= SPACEMIT_CR_MSDIE;
> +	}

...

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

Why are we enabling ALDIE here?

> +
> +

please drop one blank line here

> +		if (spacemit_i2c_is_last_msg(i2c)) {
> +			/* trigger next byte with stop */
> +			val |= SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |= SPACEMIT_CR_ACKNAK;
> +		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
> +	}

...

> @@ -431,41 +605,8 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>  
>  	spacemit_i2c_clear_int_status(i2c, status);
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
> -
> -		if (spacemit_i2c_is_last_msg(i2c)) {
> -			/* trigger next byte with stop */
> -			val |= SPACEMIT_CR_STOP;
> -
> -			if (i2c->read)
> -				val |= SPACEMIT_CR_ACKNAK;
> -		}
> -		writel(val, i2c->base + SPACEMIT_ICR);
> -	}
> +	spacemit_i2c_handle_state(i2c);

Next time this can be on a separate patch as a preparatory patch
to make the review of this one a bit easier.

>  
> -err_out:
> -	spacemit_i2c_err_check(i2c);
>  	return IRQ_HANDLED;
>  }

Thanks,
Andi

