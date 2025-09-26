Return-Path: <linux-i2c+bounces-13212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C0CBA4B40
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 18:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EA2F2A67EF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 16:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50EC306487;
	Fri, 26 Sep 2025 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="xJbuw3K4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110422FF676;
	Fri, 26 Sep 2025 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905250; cv=none; b=Aw2awaUVPOQPXZq51YpHC5KGjUFvcDXaCnlH50c7/F/02YbEKMjUg7U4DkjbYND3zpjjbZb+yc+zDBMRtVrE0i7AGG9uT+p0lIs8uNB7RO/mM/HGxwz5MIFlO1wzAV1CgtzSFLKqM+YdnZhKriCXMRIfdFlZ2+Ua+nKjM5VRzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905250; c=relaxed/simple;
	bh=/uY42YFE2pKVTRQ2gUXq1OM//KaQee8HjPayqN6+Q+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnNHJPio2i0MGzpTfyC3Gm9QslOgpHlP448p4qt0G7ptE/zUU7pa3GjHc5iLwg+Iw2//GRANC3gQpHNCAVimAcb/SIMb8g1AYIN//ft5YUi7PgbeLegEqCnJMvv41Ag87BpJqU8oLMpYEtdwbqUcKNlxlU0vycW3vfaGUMZIRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=xJbuw3K4; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=L4ev/Rjd0n90nVSqX0Vq46Pw/EmC7LCm4/hilBmaS0s=; b=xJbuw3K41S0SLgVW9GPg5L+9yO
	N+/WS0IZpJ3XWQWpwYs8ba19NX/IVQ/X9gk61CPS2LslLZ/fF18e5FcdFBW0dFlSMInbLOv4yZoAd
	vX26Z1T3hzwt8R1xxu9B/2qkEWVc0+4vAvzViX1RNwXRAtvszVvj8Jx4i7YI5PW6gZRCqFnPsYa8w
	lzwidRgG/fZWVdPtxtJxRHGez+O5LrzkR31mv308XptybfP3lSqOHmN0ZUG21qViuOCPsaON7i1xJ
	ZlS86nNVJT+6U2n8Hyj9mHhJLzQp/azC9GL3xPSRnd4h3pACx80DGk998Rz0SfY9uKHpS1uDf37Dl
	Fw95WEnw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v2BbG-00GLNE-2n;
	Fri, 26 Sep 2025 18:47:14 +0200
Date: Fri, 26 Sep 2025 18:47:14 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <aNbDkn9AC4FFx-Zc@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi Troy,

On 2025-09-25 10:02, Troy Mitchell wrote:
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

[snip]

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

This needs to be readl_poll_timeout_atomic(), like you changed in 
spacemit_i2c_wait_bus_idle().

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

[snip]

> @@ -479,15 +578,21 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
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
> -	spacemit_i2c_calc_timeout(i2c);
> +	if (!i2c->is_pio)
> +		spacemit_i2c_calc_timeout(i2c);
> +	else
> +		i2c->adapt.timeout = SPACEMIT_WAIT_TIMEOUT;

Thanks for fixing that, however i2c->adapt.timeout needs to be in 
jiffies, so you want to use msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT).

>  	spacemit_i2c_init(i2c);
>  

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

