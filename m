Return-Path: <linux-i2c+bounces-7971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6600D9C7E37
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 23:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4921B25C50
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 22:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDA318C019;
	Wed, 13 Nov 2024 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gw7hWGFt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83818BC34;
	Wed, 13 Nov 2024 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731536666; cv=none; b=i3NZfLmXPga21Ij4vYxwKm/SesxDG0BHVmY1iUXh0hVc95Vq9/Hi8a2JMYWxE34p5iRZBcjklip8MwQiCfq+i/bIjAzWRJyO+Ia0o540zx1pUe4N4TxuJkCAgLesi9rVHv7XqJMunaQK4Mm/i+4wtu6gq9YfhDBrHlB50TC6No4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731536666; c=relaxed/simple;
	bh=4c3JsyMgE4ipwm0tWTQ4ryrY2cLMm2Jke0JitnwChlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODjAqTRoKTZj36E3Wn2KAO+dAeL0XYLcezRvK/OxA0uI8lLpMlZF/lECISh9Teeru7d/+nUk2yoFs59aeIHVMbGzlo+4xLxS0CbhDyWDqoEpdaIIuAiNBOz0NWa3bamjgtocuOolCw66/522LhbWduhgf5NkHOOqorA3O/cFI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gw7hWGFt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13819C4CEC3;
	Wed, 13 Nov 2024 22:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731536666;
	bh=4c3JsyMgE4ipwm0tWTQ4ryrY2cLMm2Jke0JitnwChlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gw7hWGFtNcNPvDPPYAKVNRQO8c6IuR/deLvbCnzf975LnqSsBaJgBF7i65Q036CMH
	 oZ2Tdz91mcp6yTMYpuw13NNiG/rKcOPA2erZNek99eIUp0DdlTvCuiHBg7MiwFjYTd
	 83/PyQGQ1mCPxqvv4y1JLZrR8anHxfsjibxb919/s76mWeZbs0Ko+2k0qveEyMkmAd
	 xLJfXscazyiglCmJTfSeWlMPfKqE6kyiw9rzA5NjiaioPcPoaIVG6dSHfD9G9dpZT/
	 AfW9jUtSixI0jVPCLQ7wJ9AYu4owmI5RWS1dFaquAJD+PSXh3A5hm/0u/pfRXl4Dby
	 AQJEVQpukwO6w==
Date: Wed, 13 Nov 2024 23:24:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, 
	max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
Message-ID: <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107211428.32273-3-jiashengjiangcool@gmail.com>

Hi Jiasheng,

On Thu, Nov 07, 2024 at 09:14:28PM +0000, Jiasheng Jiang wrote:
> Add check for the return value of clk_enable() in order to catch the
> potential exception. Moreover, convert the return type of

It's more an "unlikely exception" rather than a "potential
exeption".

> rk3x_i2c_adapt_div() into int and add the check.

...

>  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	clk_rate = clk_get_rate(i2c->clk);
> -	rk3x_i2c_adapt_div(i2c, clk_rate);
> +	ret = rk3x_i2c_adapt_div(i2c, clk_rate);
>  	clk_disable(i2c->clk);

you can't disable a clock that has failed to enable, right?

BTW, although I like this patch (or at least I don't dislike), I
still want to check whether it's wanted or not.

Andi

>  
> +	if (ret)
> +		goto err_clk_notifier;
> +
>  	ret = i2c_add_adapter(&i2c->adap);
>  	if (ret < 0)
>  		goto err_clk_notifier;
> -- 
> 2.25.1
> 

