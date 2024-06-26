Return-Path: <linux-i2c+bounces-4380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE99186D4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 18:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A743C283D40
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 16:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF2D19005A;
	Wed, 26 Jun 2024 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYlKeEB+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1A18EFCF;
	Wed, 26 Jun 2024 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417845; cv=none; b=G1ZwS+e5XfByrMOKvWWaJedAxed3GVX0K2iKCQDEuC7nXiXsSO6CQtoaJdUFdsiYlj6FUB8ab55LwVZ0NrlzFPO7DAVjaXYrPPe8Rtr1CNBXuy4aJAzaN10u8xuJi/FS1XBkCGZA49f2W+4LKZAGSphoZeuRGPj7MGBkHVO9Wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417845; c=relaxed/simple;
	bh=+N8RN1iOrnCb689rj04vmHsicxKmCtiJLair6C/x+so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv/diPhFNJUBSXmxUAZ1g9ZK41aNgqCCQz3G+eMs56DqKEULMufQWkz8sKOVwhgKHbke9wazYbBb+LPloT0m72dfroHZyA+gEtLc/42pvp7e4F8vbbg8XEC1zv0tQZJ9bK6I7Tn1zFNwVHFbSR9Kqrg1TfxXWz1Y4fW3QicnDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYlKeEB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE0EC116B1;
	Wed, 26 Jun 2024 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719417845;
	bh=+N8RN1iOrnCb689rj04vmHsicxKmCtiJLair6C/x+so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYlKeEB+18cSv82iz6CVx3F9OA5fSZxkuD/A0Z+z+S4T2Hz16z01xPgOqYtjSCOZP
	 nTJ3A+XrlBdvMDqT6wHIwjCxXSvREkDIkNV8QFzzd6gZQGArnkJ2gRjgZ1gJXKV9/i
	 Npa2tLEWlcatxzs/bqO+FkeI7vglrJolV3jYHCo32hjpbFZynsN8jnHM3vxsqpOhM8
	 ZUUst3WbiLbYsWS2PFf68tqhCuP4sEZjeEK+5Hl1Scca0NpSXqYSXUvh0n270Jj16z
	 gELcbNAzEqjYJVBeDTWGSokQHSbou94NiIF6fHIeVcs5rY/mphKhtat+KE2Ig36Wri
	 igOX/Iou5B9Fg==
Date: Wed, 26 Jun 2024 18:04:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hans Hu <hanshu@zhaoxin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, Wentong Wu <wentong.wu@intel.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: viai2c: turn common code into a proper module
Message-ID: <dceas2m3mllvmoidacnaube7erjvjyrjkis23ppfxboclnnlxq@nlfagnp2ze7y>
References: <20240528120710.3433792-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528120710.3433792-1-arnd@kernel.org>

Hi,

...

> +EXPORT_SYMBOL_GPL(viai2c_init);
> +
> +MODULE_DESCRIPTION("Via/Wondermedia/Zhaoxin I2C master-mode bus adapter");
> +MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");

Do we want to add also Hans here?

> +MODULE_LICENSE("GPL");

...

> +static irqreturn_t wmt_i2c_isr(int irq, void *data)
> +{

...

> +	/* All the data has been successfully transferred or error occurred */
> +	if (i2c->ret)
> +		complete(&i2c->complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +

I took the freedom to remove this double blank line.

>  static int wmt_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;

...

> @@ -239,6 +298,16 @@ static int zxi2c_probe(struct platform_device *pdev)
>  	if (error)
>  		return error;
>  
> +	i2c->irq = platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return i2c->irq;
> +
> +	error = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_isr,
> +			       IRQF_SHARED, pdev->name, i2c);

I took the freedom of re-alligning here.

Queued to i2c/i2c-host-fixes with Tested-by Hans.

Thanks,
Andi

