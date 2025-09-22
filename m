Return-Path: <linux-i2c+bounces-13098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059CDB934AD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 22:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 921C0447ED0
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 20:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E966F2D5427;
	Mon, 22 Sep 2025 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="oOcM84ju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F827B34A;
	Mon, 22 Sep 2025 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574560; cv=none; b=CaekyAb2bKPXwetkbeuBrgVoAWv6Kvu8tpp3WZm7CFa+XkcPtHPcWbYF+P2x70ndjeAcW3ALghH8YvavkSFTFAfTO5/W++vdNFmLas7K8NGt+JrUJ9zbKtnPdRoD9xkjouoPX82CDG9DlHP3aMGYTn/vMyoCxkOxpmgU58z1pMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574560; c=relaxed/simple;
	bh=T7WZGdZOvHNAD5K1+Mkm2P62R8zudjwfQiBX3EFo10c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj1TmVMMOZAN77kV/hw2jrn1TMnKdFf9U9IcaPFAbWVXs/J+OmScunoPk05077BOtjhbolOYZaw4iBJGk2MYicnEKYRzT4zOZGppQNKLe4hvEewAUHNSEfQ0z2WKg25YhznJIw+U9y7Nk7xc4bKhGnhuFq9k6dx5dY1YpHzogvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=oOcM84ju; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Z+xT5ZAidydnDUxknzskzkjKYUH13sdYH5kSDT+jEyw=; b=oOcM84juTa02LQPGCuI+ms728O
	86S8AWolcYy4F5+EG8d1PLQwvsnuzQcIrYFfjKPDIx+wn919L0WQpr2YvPlyAFwB3jOqL2vsmilOi
	MdHXaPO8VG02lW7W5kxjQ2ttcW9n1b6HH/QbkldhamJZ/ty89VieGJERGIz2dDLWfp8lORWOLR3eK
	XwjiO25s7NLK2REpFXIkrVdvR9v/lRkTsup29/++XVgxaFkNnnlheN/enrUDvGpESL7p/FZZiu2g9
	HxTx+ZnevlyRrIZieAq2REW8yvlAEcOJ98sUkj5dXuOGCeJLywsFCFbtSG8WE5swR/7BqYJkaW//v
	17cjvihQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0nZg-00AlUy-1y;
	Mon, 22 Sep 2025 22:55:52 +0200
Date: Mon, 22 Sep 2025 22:55:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/6] i2c: spacemit: ensure bus release check runs when
 wait_bus_idle() fails
Message-ID: <aNG32F7QlaSNmg-y@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-1-e59bea02d680@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-k1-i2c-atomic-v1-1-e59bea02d680@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2025-08-27 15:39, Troy Mitchell wrote:
> spacemit_i2c_wait_bus_idle() only returns 0 on success or a negative
> error code on failure.
> 
> Since 'ret' can never be positive, the final 'else' branch was
> unreachable, and spacemit_i2c_check_bus_release() was never called.
> 
> This commit guarantees we attempt to release the bus whenever waiting for
> an idle bus fails.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index b68a21fff0b56b59fe2032ccb7ca6953423aad32..ee08811f4087c8e709d25dd314854ed643cc5a47 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -476,12 +476,13 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
>  	spacemit_i2c_enable(i2c);
>  
>  	ret = spacemit_i2c_wait_bus_idle(i2c);
> -	if (!ret)
> +	if (!ret) {
>  		ret = spacemit_i2c_xfer_msg(i2c);
> -	else if (ret < 0)
> -		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
> -	else
> +		if (ret < 0)
> +			dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
> +	} else {
>  		spacemit_i2c_check_bus_release(i2c);
> +	}
>  
>  	spacemit_i2c_disable(i2c);

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

