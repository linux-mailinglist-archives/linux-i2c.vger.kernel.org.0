Return-Path: <linux-i2c+bounces-13100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1CB934BF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051623B2F12
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23992F657C;
	Mon, 22 Sep 2025 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="zTFazuRa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090852C21EA;
	Mon, 22 Sep 2025 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574568; cv=none; b=eYXgVFnRz13wu5cp7IMq5rzlV3w/dd/Qt+IfIGhvKqTc0TB4L3EUTKaLcv7m3NI795meHo0x7ddvOs56OmpuU5tuGa2OWsnrNcYC5eBvccZHeXpkgmGeuh9T8pyLiCpfvUJO4mmSaNP0wZmrSuIauTSCRvek0fKcgwjvww2Au6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574568; c=relaxed/simple;
	bh=iuWEwnIEh36bQN0TIsF/hFUj+ITB9xKbKrwIpkhSsII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy426aefzgMGJQ6VL93GwlwAuoRqhyEAwIzHpo+i0WMvUgK3ok29wsJBpJZ7DZUQa37oPfCFl67wjiAV1Ci2Kria11VjQefHR0ueEm0Kru3trunJz9Fu+AHXyJDZRkreZuw31fUnZcMbac84Gzh/J1FMdonqil0klKYBZRTnikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=zTFazuRa; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jTITD6AqcMH7I4efM2QUzxpq1SEchTC2JyIB8KNcP3s=; b=zTFazuRagiSCFpA7BjEy+F9z+7
	xorCtoro1E1Qowdv2szUU75S01WCI8Ui9TdwXR1+0vMlXgJsaqeNgJ6pYn0jVTHt3VQFHCMAWtsy9
	VFkNTqiM37jjzMTx/t4vIfp0sNDt0p7vc4D127wgpV8mo5vLG7/f3gAeBRA+ijqS4wJ+zdbnAiHCv
	3izLhwuKH2XuIaWNo+scyvq8DP/ExzgTqJtnZRG+8uISfoowz22bLj86Ssyp4AVH18S6Yurg7gcHL
	Cw73IF9hH0UVO4AsYZ4YZ3AuV1YQSXyTjLcthQqiOcqEdOauWsduGBfEZ47A/3MJ5Z8kaLjHP2YrS
	Ztkp7ztg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZo-00AlVU-25;
	Mon, 22 Sep 2025 22:56:00 +0200
Date: Mon, 22 Sep 2025 22:56:00 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
Message-ID: <aNG34K6V-sFhX-g1@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-08-27 15:39, Troy Mitchell wrote:
> The K1 I2C controller has an SDA glitch fix that introduces a small
> delay on restart signals. While this feature can suppress glitches
> on SDA when SCL = 0, it also delays the restart signal, which may
> cause unexpected behavior in some transfers.
> 
> The glitch itself does not affect normal I2C operation, because
> the I2C specification allows SDA to change while SCL is low.
> 
> To ensure correct transmission for every message, we disable the
> SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
> initialization.
> 
> This guarantees that restarts are issued promptly without
> unintended delays.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -14,6 +14,7 @@
>  #define SPACEMIT_ICR		 0x0		/* Control register */
>  #define SPACEMIT_ISR		 0x4		/* Status register */
>  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> +#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
>  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>  
>  /* SPACEMIT_ICR register fields */
> @@ -76,6 +77,8 @@
>  					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
>  					SPACEMIT_SR_ALD)
>  
> +#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> +

The datasheet seems to use FIX_BYPASS instead of NOFIX, but maybe you 
have chosen the later because it's shorter.

>  /* SPACEMIT_IBMR register fields */
>  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> @@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>  	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>  
>  	writel(val, i2c->base + SPACEMIT_ICR);
> +
> +	/*
> +	 * The glitch fix in the K1 I2C controller introduces a delay
> +	 * on restart signals, so we disable the fix here.
> +	 */
> +	val = readl(i2c->base + SPACEMIT_IRCR);
> +	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
> +	writel(val, i2c->base + SPACEMIT_IRCR);
>  }
>  
>  static inline void

I trust you on the waveform captures, with that:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

