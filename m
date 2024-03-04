Return-Path: <linux-i2c+bounces-2187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D398710DE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 00:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92ACD1C21E2D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 23:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7807C0A1;
	Mon,  4 Mar 2024 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sc39claT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B87C0BF
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 23:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709593489; cv=none; b=iCKnTdzLiNbqP0F9ixcPmtPmScL5BblAFKgt1jZTQiknnboJ2+AkvwtP/CCv0aQeM+EgkGDJzRcgfXelxiAxdsG9F/HBQsOtUsZuryfXriZuLrPkLMh6RZlQcV3NiNYlEAK5D60zFJU00EPQgzcyNsQ2SXU24nFfVt6fPQurSig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709593489; c=relaxed/simple;
	bh=SsRPvCdUH3PoARdzXcAJ+VUZdzl7OysAKnRa51fcWRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPBLuFV0et9yELxYCsqid0CfSgO2/wxQ6o3FAE7mYk8wVjbRHOwGH+ZFrlxK1vmZE7Op5xS7cqcbOpb6m299arryx6C/t56PVG5T4U5AsKmJLOY4Ob065NPCmL7g5akB/9dqmDVI+YmESwh2xVxkAqwIK/+zPw/YxBY4W3Tmlsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sc39claT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78821C433C7;
	Mon,  4 Mar 2024 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709593489;
	bh=SsRPvCdUH3PoARdzXcAJ+VUZdzl7OysAKnRa51fcWRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sc39claTLnR5syHJpFXuhT3t6QrYCwRkSTONRPI8bsjr6aYbq3SBvDh/w5IsMeB/t
	 IsViv+vOvUGlK3fOsVmzeReixPM4ao1IkbVB+w8F07aIUg1juDu/chN2M3U7XjCpPA
	 6WSnaFT1IaglEJ/dLnoiDNmaGy2QPslBehDV9k9RmMFUfxr+xMG3jCHKrJrgny6/gz
	 QOGE7s2PWR6kgy5pedBvMkK8rX1675eqCS84qL9SJP7uKq7uq6qGmICDT2+ddnVu6H
	 GO+Sf4+kQJdtrJk7FP7dits+xktHC7GG+cdcAYERj7UhnPRd8Bym6vt9ODt6/qOGnV
	 akVQ0EKtfXx7w==
Date: Tue, 5 Mar 2024 00:04:45 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] i2c: i801: Avoid potential double call to
 gpiod_remove_lookup_table
Message-ID: <jn7f4n6nnr24jpp5wo6yz55gm5y3mgwqmwaopxuy5kasvub37x@k7xt7kxjcckd>
References: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d35529d-8ba9-4bdd-a3a3-00d67ab6f2d5@gmail.com>

Hi Heiner,

On Mon, Mar 04, 2024 at 09:31:06PM +0100, Heiner Kallweit wrote:
> If registering the platform device fails, the lookup table is
> removed in the error path. On module removal we would try to
> remove the lookup table again. Fix this by setting priv->lookup
> only if registering the platform device was successful.
> In addition free the memory allocated for the lookup table in
> the error path.
> 
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Cc: stable@vger.kernel.org
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - cc stable
> - free memory allocated for the lookup table
> v3:
> - cc'ed Linus

this patch is a resend...

> ---
>  drivers/i2c/busses/i2c-i801.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 291c609d1..9c624f31c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1428,7 +1428,6 @@ static void i801_add_mux(struct i801_priv *priv)
>  		lookup->table[i] = GPIO_LOOKUP(mux_config->gpio_chip,
>  					       mux_config->gpios[i], "mux", 0);
>  	gpiod_add_lookup_table(lookup);
> -	priv->lookup = lookup;

if I miss something obvious in my reviews, please let me know...
I spend most of my time reviewing patches and it happens quite
often :-)

Andi

>  	/*
>  	 * Register the mux device, we use PLATFORM_DEVID_NONE here
> @@ -1442,7 +1441,10 @@ static void i801_add_mux(struct i801_priv *priv)
>  				sizeof(struct i2c_mux_gpio_platform_data));
>  	if (IS_ERR(priv->mux_pdev)) {
>  		gpiod_remove_lookup_table(lookup);
> +		devm_kfree(dev, lookup);
>  		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
> +	} else {
> +		priv->lookup = lookup;
>  	}
>  }
>  
> -- 
> 2.44.0
> 

