Return-Path: <linux-i2c+bounces-13101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24126B934C5
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF3716AC6E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4B3313535;
	Mon, 22 Sep 2025 20:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="VdPr7U5W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E224F27B34A;
	Mon, 22 Sep 2025 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574572; cv=none; b=DGLWPxaz3k7qa7onhmcTXDB/WxHTm8mhwcArUFAiSyBVbyZIyoQKer93HPC+4qowi7sjHm5N0c8OEKx92x0rf+SLBxVfA1Hv7lMS2LXskgW/URIffKlv5Odn1KY9oLAaRPxUm3JM8xjwQiETrBTBrp7OD+3DRVYf/YWa6U5AIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574572; c=relaxed/simple;
	bh=jEUM8lyfKvFiUdFhZ7PjWops+g7IRy5j7YhU6VucO20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwRUx+S/jVD8x3odB9zlLXenP82jhZDhH2LhfnB0RTU8YieWQBejSLPvCTG/nLzi5O7HOOeSyx6cpsxbCIM0YhF9mBEg5u4Ur1lcK0Q0+3/so4+zxaqQ5dLOz68F1iQzqAI0qEdVkdcKr2Fp5gA1qOxwNsIYtTIIIQ12v6pb+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=VdPr7U5W; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=bgQCp7CA1XODO0c4sqWCuEz1Lkml//ftLZS1eQvEnHw=; b=VdPr7U5WX7c+DPpyALWzTkyeN5
	OJK8cdDVLEklr/DqAjxdg/QQKcBkM9T0MFIUNBx8T+oiDx7VjFrTbo9cnHznd9DxLFdyr1ZWhXIvX
	H9KERN9r4b2mZSsiLu2vRav53XTrFpkDdHDvQzYdpbBSzpBXLtHofDrRi9ykqKOrd48WX+msouj+A
	oKdAqvQPGTspKxyCMqIbZQny9fpm8KGrzEtw7jIh2SK3y7ROImsU/XfJLwvysM3fg32Coh/7YWU5Z
	leG1m2aVv1p2TpTEEAUg9RyjCV0xKrvqFvlY1SgawqTOoO4NIZIqmYxWy5kv706tggfwxQaxOTYOL
	3VEn4vqw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZs-00AlWP-2U;
	Mon, 22 Sep 2025 22:56:04 +0200
Date: Mon, 22 Sep 2025 22:56:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 4/6] i2c: spacemit: check SDA instead of SCL after bus
 reset
Message-ID: <aNG35Dwg7wWivSHJ@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-08-27 15:39, Troy Mitchell wrote:
> After calling spacemit_i2c_conditionally_reset_bus(),
> the controller should ensure that the SDA line is release
> before proceeding.
> 
> Previously, the driver checked the SCL line instead,
> which does not guarantee that the bus is truly idle.
> 
> This patch changes the check to verify SDA. This ensures
> proper bus recovery and avoids potential communication errors
> after a conditional reset.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index c1656b78f1681729ccc2ebca6e290259d14889d9..4d78ee7b6929ee43771e500d4f85d9e55e68b221 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -172,9 +172,9 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>  	spacemit_i2c_reset(i2c);
>  	usleep_range(10, 20);
>  
> -	/* check scl status again */
> +	/* check sda again here */
>  	status = readl(i2c->base + SPACEMIT_IBMR);
> -	if (!(status & SPACEMIT_BMR_SCL))
> +	if (!(status & SPACEMIT_BMR_SDA))
>  		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
>  }

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

