Return-Path: <linux-i2c+bounces-1670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A084EA9C
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 22:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CCAA1C24AC1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 21:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AFE4F1F9;
	Thu,  8 Feb 2024 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DI1glNQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607F4F1EB;
	Thu,  8 Feb 2024 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707428141; cv=none; b=X3HAODfJPRKLLagm/e6LZW9+rq1cDjH9O6FREzoKqbhXrgIkQDsan7jzaCNv8OX/ospzzr2iTvxGVN3HVFU77TZz9yKTIMZtCBrcW85BoKZBr6ywo3zOg5ZVAIrmdroZJ51qoGakmh/jFOFK3/1zP54dEyp0bA79DeoZO+k/ksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707428141; c=relaxed/simple;
	bh=NjQyP7NF+t7ccFp+E/AotqnFWc8P3i6YKlPgB/CiJRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nirUUGY6m98n0s5uSQ+jAe9gJVoSXQ7ta2ozXvgdYGwJOr41Pz2XP22nfEgi1zfaHpWhwfioOEobv46nweV/ZBwljxCxZ85DxmgxKPBjtxTvy45OR0K1XVzTAbuI06OJ8Rgb98Fg6Sb9j1lmZGKR3rcfOUsdtCXxmXsZ05aHvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DI1glNQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C04C433F1;
	Thu,  8 Feb 2024 21:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707428140;
	bh=NjQyP7NF+t7ccFp+E/AotqnFWc8P3i6YKlPgB/CiJRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DI1glNQfYpCXIg6GUC57ZHHp3xCLGKH9w70Xf2MFxnjfryXzngZdm03hUXwEgcsOz
	 GkpVaq5MdvBNkKBdX/B7UDajBjGV2wsIed20nvslo88HlmVl2lluNcJkHdChDDXixn
	 /ihCiBUPiS8tP3wuRevCnHxARlpoGnsjVd99/yvE+hZuDams/vzUuFiM4VhvEzwh5Q
	 MaCoH5JbESsnTvgyEdoxis3dusbG6Q+uWjRgFUV+7QkFXgfi52OuYF5u8bUITehwMP
	 lXIWJuVOtlp+rExR/iF6tU+LU4dEt/YuBr2EI35kfmY9ToJfnIQ1phOl20bBMZrcud
	 P+/fJ5Id5e1fg==
Date: Thu, 8 Feb 2024 22:35:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v3 1/4] i2c: thunderx: Clock divisor logic changes
Message-ID: <unmzpxjbpxaqlj323533riqdb5zitx4zha2bhdk6rrvrfa4rc7@ywf4xo5jc5n3>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
 <20240206114349.32197-2-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206114349.32197-2-pmalgujar@marvell.com>

Hi Suneel and Piyush,

...

>  void octeon_i2c_set_clock(struct octeon_i2c *i2c)
>  {
>  	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
> -	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = 1000000;
> +	int mdiv_min = 2;

why is this int while all the other variables moved to be
"unsigned int"?

> +	/* starting value on search for lowest diff */
> +	const int huge_delta = INITIAL_DELTA_HZ;

this is not needed.

> +	/*
> +	 * Find divisors to produce target frequency, start with large delta
> +	 * to cover wider range of divisors, note thp = TCLK half period.
> +	 */
> +	unsigned int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
> +
> +	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {

you could save this in a boolean at the beginning and keep using
it.

> +		thp = 0x3;

as you are here, can we give a meaningful define to 0x18 and 0x3?

> +		mdiv_min = 0;
> +	}
>  
>  	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
>  		/*
>  		 * An mdiv value of less than 2 seems to not work well
>  		 * with ds1337 RTCs, so we constrain it to larger values.
>  		 */
> -		for (mdiv_idx = 15; mdiv_idx >= 2 && delta_hz != 0; mdiv_idx--) {
> +		for (mdiv_idx = 15; mdiv_idx >= mdiv_min && delta_hz != 0; mdiv_idx--) {
>  			/*
>  			 * For given ndiv and mdiv values check the
>  			 * two closest thp values.
>  			 */
>  			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
>  			tclk *= (1 << ndiv_idx);
> -			thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
> +			if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
> +				thp_base = (i2c->sys_freq / tclk) - 2;
> +			else
> +				thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
>  
>  			for (inc = 0; inc <= 1; inc++) {
>  				thp_idx = thp_base + inc;
>  				if (thp_idx < 5 || thp_idx > 0xff)
>  					continue;
>  
> -				foscl = i2c->sys_freq / (2 * (thp_idx + 1));
> +				if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
> +					foscl = i2c->sys_freq / (thp_idx + 2);
> +				else
> +					foscl = i2c->sys_freq /
> +						(2 * (thp_idx + 1));

I need to trust you on this.

>  				foscl = foscl / (1 << ndiv_idx);
>  				foscl = foscl / (mdiv_idx + 1) / 10;
>  				diff = abs(foscl - i2c->twsi_freq);
> +				/* Use it if smaller diff from target */

can you please expand?

>  				if (diff < delta_hz) {
>  					delta_hz = diff;
>  					thp = thp_idx;
> diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
> index 9bb9f64fdda0392364638ecbaafe3fab5612baf6..694c24cecb7b144c1021549d1661b040c21bb998 100644
> --- a/drivers/i2c/busses/i2c-octeon-core.h
> +++ b/drivers/i2c/busses/i2c-octeon-core.h
> @@ -7,6 +7,7 @@
>  #include <linux/i2c-smbus.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/pci.h>
>  
>  /* Controller command patterns */
>  #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
> @@ -98,6 +99,8 @@ struct octeon_i2c_reg_offset {
>  #define TWSI_INT(x)	(x->roff.twsi_int)
>  #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
>  
> +#define INITIAL_DELTA_HZ	1000000

This define doesn't need to be in the header, right? Can we move
it in the c file?

Andi

