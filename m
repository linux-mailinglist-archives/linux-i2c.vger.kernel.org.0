Return-Path: <linux-i2c+bounces-9405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A27A32D29
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 398577A054E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02943256C83;
	Wed, 12 Feb 2025 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEN6PE5K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241C2046BD;
	Wed, 12 Feb 2025 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380514; cv=none; b=eig6JP16AHFkSBeF9+hutQkNepH1e9pYOchpmc2hqPGb8RFQdlDIKKpdTorz2QfKkXRLsHL4w3O9VY/sEV24XaCRVQQpLtwOsu1yHShTYfaoiKpC8V/6U+iN+lNbyfVd0czEaVVUOFXzNgYb6S11FCTxi47bC1744wkYKWIp588=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380514; c=relaxed/simple;
	bh=cKWGt8kgtTf7K+sXX7rpMB7u5WU0srtUtr1HTI1JiQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9arJDEIOnR6oEZYj2AryuaEkbZ3DydX4RC7FXSCB5fp4Evid9FJuBxGr9qZtMlvPnS1lRiwkGMMuvfoo0C0MyrO1F0iL4/dy/859kS9Y5lrHmKV+Gj8FckAurvMuruewfdwodufQ7rQTZDzmbfah44c7EABzuf2HTbE+pf/Q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEN6PE5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88979C4CEE7;
	Wed, 12 Feb 2025 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739380514;
	bh=cKWGt8kgtTf7K+sXX7rpMB7u5WU0srtUtr1HTI1JiQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEN6PE5K/XgVeMyrUnpj9X/H4P4nEZLgld/QYdv1IyzLUACjHKR/kD/WGyQwpFhWz
	 bGg4aSEytJiKgZBmHjwLoRR0bFwQaL++lCLzfoWdIIZqOtTlsFkuGVMOub0bIiHRRv
	 qVrbyxNbGOh+lsOWNZgKy+0gpWSMJrfKduSjZPAxfiKz9+Yx1p/5LfIoUEmzwoPI3l
	 Pjhja6Sd8fWGfbEUlnI+P/ngNfRvVxuE2CAvDCPVu161hlb9LnHCyWHCPlNNG3+ety
	 voxxcgAbHP80D+47CejQi0Mwsn7VI3zieKQTMy01iDcwZ154fPXz0yCr3ZNNuQdYmC
	 n6TyiFqqxtuiw==
Date: Wed, 12 Feb 2025 18:15:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Russell King <rmk@dyn-67.arm.linux.org.uk>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH] i2c: pxa: fix call balance of i2c->clk handling routines
Message-ID: <3vpserpv2pzslwefiqxgyzg6ttjtvb73n3wnkq7k2wotszj2tl@hgxp7yh4umwc>
References: <20250211145321.1137001-1-mordan@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211145321.1137001-1-mordan@ispras.ru>

Hi Vitalii,

On Tue, Feb 11, 2025 at 05:53:21PM +0300, Vitalii Mordan wrote:
> If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
> disabled in any path.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk support")

I'm not sure the Fixes tag is really needed here. It's not a real
bug, just a check on the return value.

> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---
>  drivers/i2c/busses/i2c-pxa.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index cb6988482673..4144b0ae195e 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device *dev)
>  				i2c->adap.name);
>  	}
>  
> -	clk_prepare_enable(i2c->clk);
> +	ret = clk_prepare_enable(i2c->clk);
> +	if (ret) {
> +		dev_err(&dev->dev, "failed to enable clock\n");
> +		return ret;

can you please use dev_err_probe() here?

Thanks,
Andi

> +	}
>  
>  	if (i2c->use_pio) {
>  		i2c->adap.algo = &i2c_pxa_pio_algorithm;
> -- 
> 2.25.1
> 

