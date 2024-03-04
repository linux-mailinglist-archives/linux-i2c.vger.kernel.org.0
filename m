Return-Path: <linux-i2c+bounces-2152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A78704C2
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D5921C2130D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1570E46537;
	Mon,  4 Mar 2024 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwlfxjuC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EA33F9C0;
	Mon,  4 Mar 2024 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709564652; cv=none; b=BYg/4w4bqFAy/L+ONk5mySjLDUnR/zW3gU0vcWTWLpBtvYbq/4bWRhvcILXsKp55j/r80EBaA46Cf7Gkt+OZQRLbLjWmcqaERBcMS6A9EnFQQRPofjAnlVGeeEoNT/Kd516DhmuqHhVH9ZY+hZMDiPgd/JLkBCCDMFZG9njWoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709564652; c=relaxed/simple;
	bh=sUkZRyJ98U5WESus3dO/qr3DdVnkuuLZdtsBx6GFUVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5q9YhPubmeMnF0/ZdEShYpEy7VUhXwjl+vprWbnVUQaYhbtQ7VxyGb7dJb9pYr8BBWSSmWKMe3j+Qt+K2qqJwfL6+7ZXPpAyQN4+e7Ue/s21hFMJGBD2JuOiX2viO4P+c147yOA8yoo4dfDiyx9h4yxMkap6Y6I5NlahGYT06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwlfxjuC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0096C433F1;
	Mon,  4 Mar 2024 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709564652;
	bh=sUkZRyJ98U5WESus3dO/qr3DdVnkuuLZdtsBx6GFUVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwlfxjuCNqmqMUTyLOsCMywTHyYeve0FUWr0Nh+EKoe2ysWjPj2eUeVAk6UPDA7Rv
	 6hUG+TK+e4c4aV6d7C04+jNVHrgWxRc0BsnUlU9zYmUS3QGjS+mRkhTRYK6FKmUwbX
	 EkkGOGl6t0zo84p0autOIEGHNxXNtNWvWeH3t1Tel1fnt2pPgEj1OCzjb80BHwzSgP
	 LMFNXe+diQiiY437/I5LByPyodDxfuIafqX7Qs8C4Ygt2yvMZJ5KovPKvm9fIRdWO3
	 rJCnfuj20yoyigyqm2E1CthVLJFcK5waVtglDg4+K14KBqPAunP9lpKuGh9EXmB/MF
	 RCPNOOzzrWnzg==
Date: Mon, 4 Mar 2024 16:04:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: exynos5: Init data before registering interrupt
 handler
Message-ID: <vpe5jvnhz3r5cpfiofwrelp62awe74knbxrz47i2deflczx276@yahhrshr355r>
References: <20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com>

Hi Jesper,

On Mon, Mar 04, 2024 at 12:01:14PM +0100, Jesper Nilsson wrote:
> devm_request_irq() is called before we initialize the "variant"
> member variable from of_device_get_match_data(), so if an interrupt
> is triggered inbetween, we can end up following a NULL pointer
> in the interrupt handler.
> 
> This problem was exposed when the I2C controller in question was
> (mis)configured to be used in both secure world and Linux.
> 
> That this can happen is also reflected by the existing code that
> clears any pending interrupts from "u-boot or misc causes".
> 
> Move the clearing of pending interrupts and the call to
> devm_request_irq() to the end of probe.

I'm OK with moving the irq request at the end and I'm going to
give my r-b anyway. There is still one comment below.

> Additionally, return failure if we can't find a match in devicetree.
> 
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

The way you are describing it you would need the Fixes tag here
and this patch should be treated as a fix.

Nevertheless, I think that it's odd that the device is sending
interrupts at this phase and the real fix should be preventing
the controller to send interrupts here.

How have you tested this patch?

> ---
>  drivers/i2c/busses/i2c-exynos5.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 385ef9d9e4d4..eba717e5cad7 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -906,24 +906,14 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  	i2c->adap.algo_data = i2c;
>  	i2c->adap.dev.parent = &pdev->dev;
>  
> -	/* Clear pending interrupts from u-boot or misc causes */
> -	exynos5_i2c_clr_pend_irq(i2c);
> -
>  	spin_lock_init(&i2c->lock);
>  	init_completion(&i2c->msg_complete);
>  
> -	i2c->irq = ret = platform_get_irq(pdev, 0);
> -	if (ret < 0)
> -		goto err_clk;
> -
> -	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
> -			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
> -	if (ret != 0) {
> -		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
> -		goto err_clk;
> -	}
> -
>  	i2c->variant = of_device_get_match_data(&pdev->dev);
> +	if (!i2c->variant) {
> +		dev_err(&pdev->dev, "can't match device variant\n");
> +		return -ENODEV;

return dev_err_probe(), please.

Andi

