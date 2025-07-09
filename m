Return-Path: <linux-i2c+bounces-11886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07DAFF0D9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 20:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53C9563FC3
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 18:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D3123959D;
	Wed,  9 Jul 2025 18:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Cd5eIaWN";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="j5vaIi+M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ECC8F40;
	Wed,  9 Jul 2025 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752085563; cv=pass; b=OW8/M+Nb1nUw/7aIIq3ENGV1/2Mf0xEFSt6azGvpYTZzUBKXjfCmjIFhS0EbFlEucG8zSuDvBNFzW3XRVu+JavbKqB2kxufMG1TijEriswOHaW0tatzfUh8KVq4wZN3AUBGClVAiSH1IYWyEd9W7h2J8s7w1oFovh+MrSrabjrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752085563; c=relaxed/simple;
	bh=Abcsubps400Tmimi8x/85khLrrQGEef3bZBOcjjxcGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDqmjoydxvDurn+DPW9T6TX4rRsRxUYGOLZE58q4NWHSEombDA9UK+dqxITyiY1m7ZZk9UPCzppY0y5+gtQj30MsjmwGMKYSEJ8pmPOLHffprWnqNNl5eAxnSNX2S64i1Ceae80gqjFY7AbhoaRsIwssCSkUn4knmEfPwf4zpi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Cd5eIaWN; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=j5vaIi+M; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4bcmcs2hLQz49PyD;
	Wed,  9 Jul 2025 21:25:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1752085549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idK43d5pW+sDqqJyF1QryvhgswgryS6oV6QlfEsn3to=;
	b=Cd5eIaWNVHAris92EJIj5pBSOCxO2SSeEx55YMAx1UH0F34D+WCLNhazFOX2jNd1XWSOKn
	PBuDK+BxMkolX+WQibY7vkv0hy/3q+pxnOnN3RRWOc83PppuRtvFzjT3+WbOT+N0Rq2Yy3
	riZdKvjYZE5ZROqPw8QPB5FMn/xqVcTBRkw/fbINW3dEOVDBEIjC+Tw8+OeIT7d7JsbxpW
	DobqtgYrGeJZ8ScUd0YGsgHoxxRY2d09+g2YPy+F9Y2MKHHKLXVmXHB3pcQF6H9BP4Dzzg
	tb1Fa1XF4bF2R5IUHun1x7SshcRsM0RuO528sTGLjD/ncDbIOV2BVQKh4/wUrA==
Received: from roadster.musicnaut.iki.fi (85-76-14-75-nat.elisa-mobile.fi [85.76.14.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4bcmcW2pw0zyTV;
	Wed,  9 Jul 2025 21:25:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1752085539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idK43d5pW+sDqqJyF1QryvhgswgryS6oV6QlfEsn3to=;
	b=j5vaIi+MKE0K97FkMCCJSkf6NqB1iWzHr64fe76FUCCLFVDm7A3/c+peJxwaeLo0T0CSiU
	MAGMXRNMz00c23w0I0f/W1kLQJnGgTVi/33b+khX6Ub/4GcGyggbIW/aHq8FM9Ybyx/71s
	Z/q3EwX5M5W0klTxt39g5c9UZZc0wXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1752085539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idK43d5pW+sDqqJyF1QryvhgswgryS6oV6QlfEsn3to=;
	b=aC9jN/sxtfI1P8h0up0XRe/mAbUDv9hEENcRN1bcxYHJtiKDySolJsLhJIft7rM5c1LgRj
	u7rtB8QrT3xCTsiIDfO1BNP/B4eaesw2rTIBWR5Ag4d1LJLnb5EDr3LPI1BEb8ksIZfeyi
	7mP0dDp9W6MPaxncT2k9hf5u4kuNVN8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1752085539; a=rsa-sha256; cv=none;
	b=gz2tdtmSexXg/gmdwhV70+VDtBZTb1fFyQFb0fnZOivnGsQhpNC8rA5wP/QPWRoNtTe2mO
	SlsmZdBYUOxqasqNyUhXB3z6ffe5FggtAhM5RH4exvJTzJilQRxTUDfWln3dOWfdrtyfEL
	ni8SKQmg6h4mbIox0/tdSJbp5T4Z+Bs=
Date: Wed, 9 Jul 2025 21:25:28 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vigneshr@ti.com, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com,
	andi.shyti@kernel.org, miaoqinglang@huawei.com,
	grygorii.strashko@ti.com, wsa@kernel.org,
	Jean Delvare <khali@linux-fr.org>,
	Komal Shah <komal_shah802003@yahoo.com>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: omap: Handle omap_i2c_init() errors in
 omap_i2c_probe()
Message-ID: <aG60GJy60Jf3w8tZ@roadster.musicnaut.iki.fi>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
 <565311abf9bafd7291ca82bcecb48c1fac1e727b.1751701715.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565311abf9bafd7291ca82bcecb48c1fac1e727b.1751701715.git.christophe.jaillet@wanadoo.fr>

Hi,

On Sat, Jul 05, 2025 at 09:57:37AM +0200, Christophe JAILLET wrote:
> omap_i2c_init() can fail. Handle this error in omap_i2c_probe().
> 
> Fixes: 010d442c4a29 ("i2c: New bus driver for TI OMAP boards")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/i2c/busses/i2c-omap.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 8b01df3cc8e9..485313d872e5 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -1472,7 +1472,11 @@ omap_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	/* reset ASAP, clearing any IRQs */
> -	omap_i2c_init(omap);
> +	r = omap_i2c_init(omap);
> +	if (r) {
> +		dev_err(omap->dev, "failure to initialize i2c: %d\n", r);

Error paths in omap_i2c_init already print a message and error code,
so this is log is redundant.

A.

> +		goto err_mux_state_deselect;
> +	}
>  
>  	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
>  		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
> @@ -1515,6 +1519,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  
>  err_unuse_clocks:
>  	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
> +err_mux_state_deselect:
>  	if (omap->mux_state)
>  		mux_state_deselect(omap->mux_state);
>  err_put_pm:
> -- 
> 2.50.0
> 
> 

