Return-Path: <linux-i2c+bounces-13438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD7DBCB12E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 00:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67AA24E1753
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 22:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B271A286405;
	Thu,  9 Oct 2025 22:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4yKBXaG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CAF285CBC;
	Thu,  9 Oct 2025 22:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048718; cv=none; b=ag469UAjihmruVA8Z//syyUKZ2emUE2b0JpQDH6VT6m0Ea6KgDBEbJ52r3nZuVsMIamL4CvUJT4MlFmwOJfN0thrpqaVzF/OOD50dGZX2xPhhS+seBgWeE+YJzfoiGy97vylV8BLAzVMeNP2GNBRWqFRRveN1Bnv5YU+13isZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048718; c=relaxed/simple;
	bh=83bdko5rwze4WW3bMGBsDUspQQmt7g8T21lnn+Xp8LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrGhVAcdEWKl2y4HOTr5IkanZqZGsUySQNgh6445x6XEjwFBjFPPjXjhRNUW8sP8mX4u/V6UH+LCk0o2aVMOuH9E+j1cX20Ad/P/XjHzpZTH32Ni3gR9KZIF6Nn/LqBYIgUOFrHh6eqr8Fvan6bHbfkAaHwLxseBxknx6XGH5LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4yKBXaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E595C4CEE7;
	Thu,  9 Oct 2025 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760048718;
	bh=83bdko5rwze4WW3bMGBsDUspQQmt7g8T21lnn+Xp8LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4yKBXaGBjJhWLfIbbtpbYAgAl8hynK+4LNpuLNDWw0smEGhcp5IsgjHYWOd+x7DE
	 +R1vi+X3L1N94EgkT8t7iqNB/736JQSyntjQF24UwrQfnvc1wSlRW6J7k7r8vpdunq
	 SoqaEpDg6knL2OJRYL3DwxlUsoS72dmMr0pjO5mlXjVBXQSjQX/8QIlEhQVc0AWAo4
	 sb36U7Uw5IKT6jS1Jk/sThuOsN6t40dVorZdXLpmIAujDD+GXD/riQbnSo7t5ITNV2
	 FCeeTZ1wZVPi3+FMVsJ1TsaFzJwjqj9PDmcstIlWx4PXf0NabB3MA6JznZqJrC8BXc
	 5iltp3MkUMtgQ==
Date: Fri, 10 Oct 2025 00:25:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout with
 total transfer timeout
Message-ID: <445z46hybgl2mdmhsapiitqccxkkpafqstgksov45sfd5v2c2m@mmiye6kt6itb>
References: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>

Hi Matthias,

On Tue, Oct 07, 2025 at 02:09:24PM +0200, Matthias Schiffer wrote:
> When a target makes use of clock stretching, a timeout of 1ms may not be
> enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, which
> takes ~320ms to send its ACK after a flash command has been
> submitted.

besides, the specification doesn't impose any maximum time.

> Replace the per-iteration timeout of 1ms with limiting the total
> transfer time to the timeout set in struct i2c_adapter (defaulting to
> 1s, configurable through the I2C_TIMEOUT ioctl). While we're at it, also
> add a cpu_relax() to the busy poll loop.
> 

...

> @@ -269,17 +269,16 @@ static int ocores_wait(struct ocores_i2c *i2c,
>  		       int reg, u8 mask, u8 val,
>  		       const unsigned long timeout)
>  {
> -	unsigned long j;
> -
> -	j = jiffies + timeout;

Any reason we don't take "jiffies + i2c->adap.timeout" and avoud
all the changes below? It also simplifies the parameters list.

>  	while (1) {
>  		u8 status = oc_getreg(i2c, reg);
>  
>  		if ((status & mask) == val)
>  			break;
>  
> -		if (time_after(jiffies, j))
> +		if (time_after(jiffies, timeout))
>  			return -ETIMEDOUT;
> +
> +		cpu_relax();

Good.

>  	}
>  	return 0;
>  }

...

> -	/*
> -	 * once we are here we expect to get the expected result immediately
> -	 * so if after 1ms we timeout then something is broken.
> -	 */

Why have you deleted this comment completely?

> -	err = ocores_wait(i2c, OCI2C_STATUS, mask, 0, msecs_to_jiffies(1));
> +	err = ocores_wait(i2c, OCI2C_STATUS, mask, 0, timeout);
>  	if (err)
> -		dev_warn(i2c->adap.dev.parent,
> -			 "%s: STATUS timeout, bit 0x%x did not clear in 1ms\n",
> -			 __func__, mask);
> +		dev_dbg(i2c->adap.dev.parent,
> +			"%s: STATUS timeout, bit 0x%x did not clear\n",
> +			__func__, mask);

Why are you changing from warn to dbg? This change is not
mentioned in the commit log.

Andi

>  	return err;
>  }

