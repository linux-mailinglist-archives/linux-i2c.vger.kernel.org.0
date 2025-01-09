Return-Path: <linux-i2c+bounces-9009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3BA07B7C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 16:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61AA27A4DD9
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2592248A0;
	Thu,  9 Jan 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9Hh4LGo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1D21CA1F;
	Thu,  9 Jan 2025 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435392; cv=none; b=KxvW2XBnoupt/k9DlLIPXpgMNs/DpSA1brSbNXIPz27en7CAmPOAOLLSxw6tzmN8vMmhPgh/7hbnpJC23dw+5YK/ija7PjrlDIx9Ol0m6Qoa5whDVU8a5XVnWwhXw1Rck+W1gwyiBM7IaV5BAQJJnyKCE5ySi8hnEMargVdaJmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435392; c=relaxed/simple;
	bh=xHeiIxIa6E6yZ6Kk6iQDzKIDM6gnEF3XyhKm1STJdpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHyr/Zv+aM1MAS34w4s428j9vTNqkZondo7Ek56LK7y4ExzxW4UV3m/ditrqx1if3y/HTWWDNWtNwmE7S48HApagNPxa0ZvtRvSFr5uKlcuNlgp7neasfaGn3Bol4bdra6NBIM9qdAk5iF01Mu4JVghCI/GMOWy9Litt3q+hBe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9Hh4LGo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFE7C4CED2;
	Thu,  9 Jan 2025 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736435390;
	bh=xHeiIxIa6E6yZ6Kk6iQDzKIDM6gnEF3XyhKm1STJdpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9Hh4LGo1LjKNof7M9Jer1YS9JWnRoTYm5XIbaPr30BmvrtGbnoeYXpWxmM3hYvC7
	 BQoA76AIwFcKGNxsJX1N70ctRLsQID6KkgCKyaYP/EgCkto1pb9HGN1moss1BYHtgz
	 5SMdnahpiSaT9XMWEB2t50aQLKT7ixbmr0Q5p9tv2cQyfrN4hGYUb8hoaD3WxG4MSv
	 bl1ns5wGVdSufF9jp82iFR9Le+wUsNBO9D+KVdFrxT6TrnLudHxColVY/7ceORE2nr
	 fnxp9cw+tGHQ6wjhqq1juyvWWAPZYIFCo3bFmVg+XR6j7rcM9xsIbyTXCSODAxAzY2
	 x0enUuC+waJHA==
Date: Thu, 9 Jan 2025 16:09:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Babroski <cbabroski@nvidia.com>
Cc: kblaiech@nvidia.com, asmaa@nvidia.com, davthompson@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c-mlxbf: Add repeated start condition support
Message-ID: <db3daq7guy52ywmgslnmphx4mxyp2l7swq2y6erezokolg3v6u@p7ufvbi3tarc>
References: <20241119211215.352797-1-cbabroski@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119211215.352797-1-cbabroski@nvidia.com>

Hi Chris,

Can I have an ack from the other nvidia guys, please? Khalil and
Asmaa?

...

> @@ -694,16 +695,19 @@ static void mlxbf_i2c_smbus_read_data(struct mlxbf_i2c_priv *priv,
>  }
>  
>  static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_priv *priv, u8 slave,
> -				  u8 len, u8 block_en, u8 pec_en, bool read)
> +				  u8 len, u8 block_en, u8 pec_en, bool read, bool no_stop)

I don't really like how the alignment turned out here. This file
rarely exceeds 80 characters, so can we keep it that way?

>  {
> -	u32 command;
> +	u32 command = 0;
>  
>  	/* Set Master GW control word. */
> +	if (!no_stop)
> +		command |= MLXBF_I2C_MASTER_STOP_BIT;

If "no stop" we enable the stop bit? Can we make it a bit more
straight?

> +

...

> -/*
> - * Note that the mlxbf_i2c_timings->timeout value is not related to the
> - * bus frequency, it is impacted by the time it takes the driver to
> - * complete data transmission before transaction abort.
> - */
> +/* Timing values are in nanoseconds */
>  static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
>  	[MLXBF_I2C_TIMING_CONFIG_100KHZ] = {
>  		.scl_high = 4810,
> @@ -1203,8 +1218,8 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
>  		.scl_fall = 50,
>  		.hold_data = 300,
>  		.buf = 20000,
> -		.thigh_max = 5000,
> -		.timeout = 106500
> +		.thigh_max = 50000,
> +		.timeout = 35000000
>  	},
>  	[MLXBF_I2C_TIMING_CONFIG_400KHZ] = {
>  		.scl_high = 1011,
> @@ -1219,24 +1234,24 @@ static const struct mlxbf_i2c_timings mlxbf_i2c_timings[] = {
>  		.scl_fall = 50,
>  		.hold_data = 300,
>  		.buf = 20000,
> -		.thigh_max = 5000,
> -		.timeout = 106500
> +		.thigh_max = 50000,
> +		.timeout = 35000000
>  	},
>  	[MLXBF_I2C_TIMING_CONFIG_1000KHZ] = {
> -		.scl_high = 600,
> -		.scl_low = 1300,
> +		.scl_high = 383,
> +		.scl_low = 460,
>  		.hold_start = 600,
> -		.setup_start = 600,
> -		.setup_stop = 600,
> -		.setup_data = 100,
> +		.setup_start = 260,
> +		.setup_stop = 260,
> +		.setup_data = 50,
>  		.sda_rise = 50,
>  		.sda_fall = 50,
>  		.scl_rise = 50,
>  		.scl_fall = 50,
>  		.hold_data = 300,
> -		.buf = 20000,
> -		.thigh_max = 5000,
> -		.timeout = 106500
> +		.buf = 500,
> +		.thigh_max = 50000,
> +		.timeout = 35000000

Can you please explain better how the stop bit affects the timing
values?

Thanks,
Andi

