Return-Path: <linux-i2c+bounces-10827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D0AAC312
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35EA87B4748
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEA627BF7B;
	Tue,  6 May 2025 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwqOAx3B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC1027BF63;
	Tue,  6 May 2025 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532391; cv=none; b=mS5SM7YMM9jm+f2dKP+3jHUEonu47fcxioZkIuZ3r09FBi5jkGR5CpF7xIeGRkMWV3/Cjf3rL1y0oNhLmCaddYS9UpA05TCOOsD1RhfC55w/vQLsyWvkxRkLwo7YsdmhyJTry8NTlF+Pi3SRxGFzwMDIdi2G5FOVRX2cmwHa8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532391; c=relaxed/simple;
	bh=a3ps9uCYt23Egn1BlGHFcrAxg4jOYy6virWRYklcfrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeTYsK7rMVap7pKbgNtl2gVLjXMv9gh/UHniWPynz/sBPkQTvAlKOaX8SaWGskxHTGdPuGd+p1IJzqAJDb7L7+TBe4SymEzV4vwYoqGEl00Hn8uGpilXKiVy4iQUUQGZZO/mbAE35CC571DeD91TbVRyB1v86ZJYJtI/07wk14c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwqOAx3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC98C4CEED;
	Tue,  6 May 2025 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746532391;
	bh=a3ps9uCYt23Egn1BlGHFcrAxg4jOYy6virWRYklcfrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwqOAx3BBIETT8Ay7yDxoU1f+sNu6c8B0bt77zhBlIe1XRoB/u7qHnx98F15Sfn/N
	 ri1zYfndAg3iBJzliOElNc56M3pzPeZ3c5m1I72NrzqVcFeuGp3EW8z04lrKwreyjH
	 AOZkZMjOHZZ1TelnFyJ/ah+tH1PKcqKnVL5jVilkrJ0lqcFPCC0T6JHf/vS6zu/Dwf
	 HZovT6yWhClYxXeL6BVMqmH6ae+Im2GEHKddriOpmXKYWIIawwllxKWdHp/IPGWFJG
	 7Di+n7q2DHODzEz4rfP04xGKMFSIBO81hP7PQlWXfCsNcAYOztRzfYbTibE8LbUzy0
	 Zjuekwu9D8h1Q==
Date: Tue, 6 May 2025 13:53:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Guenter Roeck <linux@roeck-us.net>, 
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: i801: don't instantiate spd5118 under SPD
 Write Disable
Message-ID: <nfxz37zk2nnqmjwaychfvpl5y5f2stkean2oyxxbk3gzduqvcz@ons6jtbtotuf>
References: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
 <20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com>

Hi Yo-Jung,

...

> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a7f89946dad4..88474409e82d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1177,10 +1177,12 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
>  		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
>  
>  	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
> -#ifdef CONFIG_I2C_I801_MUX
> -	if (!priv->mux_pdev)
> -#endif
> -		i2c_register_spd_write_enable(&priv->adapter);
> +	if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {

this if is not really working and it has been reported the
following compile error:

drivers/i2c/busses/i2c-i801.c: In function 'i801_probe_optional_targets':
drivers/i2c/busses/i2c-i801.c:1180:54: error: 'struct i801_priv' has no member named 'mux_pdev'
 1180 |         if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
      |

Therefore I'm going to revert just this patch 2/2. Please do
resubmit it and please test it properly with the
CONFIG_I2C_I801_MUX enabled and disabled.

Thanks,
Andi

