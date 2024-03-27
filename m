Return-Path: <linux-i2c+bounces-2635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC788F095
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 22:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDD51F2CECA
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 21:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A27215350C;
	Wed, 27 Mar 2024 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sX9lUzM6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA521514DB;
	Wed, 27 Mar 2024 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711573338; cv=none; b=hHnPyM9zn+uaw19GoDC2o4juuho4gtM21n6LhgHjgv/A5RyVLIxpgvIwMnRNVwnNe01wPY9nTBYJU9XBmKPkW3rd6177t03zScgx6st5lqqBnFu8VLUkCYyYlha+4vR84rkWLqF5wZmk7LwQ3QdlLNtp8Bkfk5G/rVjz5fMVHMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711573338; c=relaxed/simple;
	bh=zimNrLl1t2P5OKTQ7qXF3CGYSVBY7jD6LDZ0qUvDB/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJrwuxfBHUPzrTRATgJKP/ovUUsUOgF5IlBBFOdmlrg742UMrDn8YVkO9Q594IZSEK6yGZAaKrMliVJHvbziB02rN0fJDxMZsoThJBPfbI6gyK+JfdEVV/5pDC9j9A4Sulv1qr+H17VRD6n0sj0WYfx9yaV9FtHll2ujtrtdN3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sX9lUzM6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D62AC433F1;
	Wed, 27 Mar 2024 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711573337;
	bh=zimNrLl1t2P5OKTQ7qXF3CGYSVBY7jD6LDZ0qUvDB/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sX9lUzM6hibJ1nC/TA2GFKnJg5DmzdnKK1TDASFYDlVc0hXwLrXvxkt8Y6lWk/C/Y
	 E/QOlOpsWwJeUbAJhsiFGl6y0DPre3hTGXNBoYWmyklyvZCVBRhD342U1haaoRXoqr
	 jottNhtFoVvF/R5Fbj3uWDGQSW+A/d43BFYuBB+ZnsWlTR7H2dQvp3RRyQZmhdl9a4
	 i27tJHClUGy3kBJWcU/LzL1/NuVWG1yIU8lpfJhr/Okn39CQcoq6OZRtj79bAIV7z0
	 c3kjAf8tez3e8hfMaYDR6NSW70icbW8LcHldAWQZhjWqI7XsVtBRCE6KowGJLUMzw8
	 55o+CxsSulfuA==
Date: Wed, 27 Mar 2024 22:02:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/64] i2c: highlander: reword according to newest
 specification
Message-ID: <u4dtq2ii3kjvwj5hhxogcqje27adpoxxlr7y6bkqo2suqcumxb@p5vsjp3m2rop>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-23-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-23-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:15PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").

I'm just noticing... what do you mean with client/target? Can you
please be a bit more specific?

If I search through the three documents I find the word "client"
written only once in the i3c document.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-highlander.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
> index 7922bc917c33..ec3546a5178b 100644
> --- a/drivers/i2c/busses/i2c-highlander.c
> +++ b/drivers/i2c/busses/i2c-highlander.c
> @@ -331,7 +331,7 @@ static int highlander_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
>  	/* Ensure we're in a sane state */
>  	highlander_i2c_done(dev);
>  
> -	/* Set slave address */
> +	/* Set client address */

/client/target/ ?

Andi

