Return-Path: <linux-i2c+bounces-8637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF79F7B27
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 13:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CE817A38A2
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 12:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF1A2248BF;
	Thu, 19 Dec 2024 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyLfjMzo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAA224880;
	Thu, 19 Dec 2024 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610905; cv=none; b=Cy/Ra2/ahtlZvGo43scSf9OERnC67RiZspYfVV+DLPPC4/CUbUZmPuBb+e9M7GYsr01kpXm6l9koEouPA4V5qjlLjT5B4NifIhx3s1vSS6+ygBx+ghoGBDsUVsljKEw6QcMUZYXhIC2iSMYZFwTpxf+73nmEoZX5uebTFkgB3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610905; c=relaxed/simple;
	bh=hMMxlUXR5LEDRG3ZXm//Dkgp/QGGV1XKZh9s+NWLHOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ6FL9EjzlPxr5jGMcNKBAvQXZzSlynMTS1vj2ALqt8ploQNgvzAkNakxSvLIy5RWmIIvJ/XJoVnB9xNIpDlfZT6lQL62yxQIDxR/lfkcXDyMB0VIfyx7XcskVmgX0z43wnl7g3aN454Cv8ei+2Vu3HmbsOHWQqUl16GDvH7tzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyLfjMzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39466C4CECE;
	Thu, 19 Dec 2024 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734610905;
	bh=hMMxlUXR5LEDRG3ZXm//Dkgp/QGGV1XKZh9s+NWLHOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyLfjMzoAk873SO0UewYtmkIGLr3aaA+MjYib1LQxDHPfHL5Y/4125iWA47aYEH6w
	 n4k7BTSy71Nm+hBW0T+2ZJPWLYqT/iaoHT64ZjzbjT3LIj8xzOqA+k7Lbz6Esh2tej
	 gOT7ExQxVAeMKDduXst3m4hB+YjHaEINbsoZt4zfJyg13TSdwXY+olHwAWe31kBGV+
	 DKdSKq2n5JrkCwpuXvCKklIXxvrnNDzoU6fCxjJw5XTCf75vBaRZpS6orM83GZnxg8
	 dZCi2eeGhKDCrlezBvIsPcJKOJT+/Xjgp2A9JxQr+djQ0sK6evGJwpLCRpcZcwalL2
	 FGPnd3x3Tpa2w==
Date: Thu, 19 Dec 2024 13:21:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in
 `dev_err_probe()`
Message-ID: <ozrnsv5gampgx3hz6mfkg6gtazofmfbl2xfelfpuxmwx7porcq@mejsk7hdc55o>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index bfaa2d728a76..01195ffd4c07 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
>  				      : I2C_MAX_FAST_MODE_FREQ;
>  
>  	if (t->bus_freq_hz > max_freq)
> -		return dev_err_probe(&riic->adapter.dev, -EINVAL,
> +		return dev_err_probe(dev, -EINVAL,
>  				     "unsupported bus speed %uHz (%u max)\n",
>  				     t->bus_freq_hz, max_freq);

Which branch are you on? This change has already been introduced
in commit 71dacb2565ed ("i2c: riic: Simplify unsupported bus
speed handling")

>  
> @@ -356,11 +356,9 @@ static int riic_init_hw(struct riic_dev *riic)
>  		rate /= 2;
>  	}
>  
> -	if (brl > (0x1F + 3)) {
> -		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
> -			(unsigned long)t->bus_freq_hz);
> -		return -EINVAL;
> -	}
> +	if (brl > (0x1F + 3))
> +		return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). Too slow.\n",
> +				     (unsigned long)t->bus_freq_hz);

This is OK

Thanks,
Andi

>  
>  	brh = total_ticks - brl;
>  
> -- 
> 2.43.0
> 

