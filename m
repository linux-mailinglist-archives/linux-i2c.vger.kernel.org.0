Return-Path: <linux-i2c+bounces-8714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B849FC74D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 02:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815991882BE8
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B238F49;
	Thu, 26 Dec 2024 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZMeqpox"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A0EC5;
	Thu, 26 Dec 2024 01:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735175971; cv=none; b=vBtgBvBOrrX6xzSmlnXj97o3yGjOuHNVxHDl67fc6uh3NgWyFXt9ZK7WFrigZwae6iQIzqUgPrdB5m7E7oG5+PN1N34cjXh3C3KEQhhS8wYZR8Yqem820iKfg5tc/9NTYCOdy67JnDnqHbsdebkAVGyqcxXzR7fF14mNCDaoHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735175971; c=relaxed/simple;
	bh=/o7bii7whGZZIXffbmXzCf/xQEufJQaOabnBZMBqJ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUYes1tjN+G/VeDtgME/SFWwGVLipOz/jgcZW/WOBOYiGP+H5jxefkZJ6azD+Dbc9iz1mZptEFvqDIF5ypUPajQd60HgYcMSa2hv9VsXPjE5Yp4lZTIx+6IEdtFLjFzdF7pv9YWDn9MfWEH+fzrjpGBEmsZMHi/IwurOpP6yVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZMeqpox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6C6C4CECD;
	Thu, 26 Dec 2024 01:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735175970;
	bh=/o7bii7whGZZIXffbmXzCf/xQEufJQaOabnBZMBqJ4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZMeqpoxCpYR4jHz6v03AR1gweumdSw0d3EH6DWrS/5Pc7MsfCwH7z34qNoSy2dMi
	 wUhdFzo2UVgWF5VeVi7pGkz4WMHDR8cAo6b9xnoYV8OLfUzOL0qXiXcBZodDHSBaS0
	 y9eDVsoZR8dtRb3CeNxgv0ZGK3Ocij4z5lo09xArUuRVnZdlpyUgd7UkRPVVCUy0Ax
	 ZSTQkVPaoR9MhhiV0GxasXdvryvZCx0sCyzhXMCLirECFYLvdrvKY+Z8rtz+YuMAz9
	 vv8HwJxJ+yROyOp2qrMPcb/AolClwXURsOWwArFC/40zC8m51cAzeceiel81N3CYZ0
	 nygLw8BSv93AA==
Date: Thu, 26 Dec 2024 02:19:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in
 `dev_err_probe()`
Message-ID: <vb5nqey4teo3mtblh7wxqwykw2ebs7oo3fjn56kulzgn5il5pm@jgr3xsdn6m2j>
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

On Wed, Dec 18, 2024 at 12:16:11AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the `riic_init_hw()` function to use the local `dev` pointer in
> calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
> `riic->adapter.dev` in error reporting. Since this function is invoked
> during the probe phase, the I2C adapter is not yet initialized, leading to
> `(null) ...` being printed in error messages. This patch fixes the issue by
> consistently using the local `dev` pointer, which points to
> `riic->adapter.dev.parent`.
> 
> Additionally, replace `dev_err()` with `dev_err_probe()` throughout
> `riic_init_hw()` for consistency.
> 
> Fixes: d982d66514192 ("i2c: riic: remove clock and frequency restrictions")
> Fixes: 71dacb2565ed (i2c: riic: Simplify unsupported bus speed handling")

I'm not sure the Fixes are really necessary here, as it's not
really leading to a bug, but I can live with it. But, then, ...

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2
> - Collected RB tag from Geert
> ---
>  drivers/i2c/busses/i2c-riic.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
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

... I'm not happy with the splitting here: mixing a bug fix with
a cosmetic is wrong for two reasons:

 - they are conceptually different;
 - fixes take are applied to the -fixes branch and sent to the
   weekly pull request.

I will appreciate if this second chunk is squashed with patch 1
and the first part has a patch on its own.

Thanks,
Andi

>  
>  	brh = total_ticks - brl;
>  
> -- 
> 2.43.0
> 

