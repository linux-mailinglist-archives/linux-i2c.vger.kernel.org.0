Return-Path: <linux-i2c+bounces-1085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A70822DCE
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 13:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 874861F2122C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 12:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F371C28C;
	Wed,  3 Jan 2024 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iePa/tXS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AC1C289
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 12:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975F4C433C8;
	Wed,  3 Jan 2024 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704286582;
	bh=VtKs6t83KSsmBNsRCCVUeAE/850Hp6jbrRqKZlyyqrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iePa/tXScDIL72xP6Q4iLCWkTCAd5H/mccmCcwsFGRUm/hrBgcNRYSUQPjA3QVZyS
	 InETFafUxmpJ87MF1l/g/GO8/QyzP+XCMrPUvucd5XvpYmIO8GcvyGDWEkRTwr1K1H
	 GtbrAHzwbWUNolD82k3OEjdZeII60G6+WLYt6xALC6Ur8C88uXnXP1rJ29Z47PO7W9
	 a7S/0rSKnR/vBSAuvkg4iyKsmwR5FELDgolPg3bch8f3optLDRG0NwjLsb867n+XaD
	 Z/cNRswV8uqDvlVRhKHZKNufhk1/uoUbeUl+lzdNikUbDfq4NWxkKMlMOWF1rzPMo+
	 jiulucVuDiS4Q==
Date: Wed, 3 Jan 2024 13:56:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 1/8] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <20240103125618.pzp4wtvinz2et4zp@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <19a2be1aeb0d935b433d0b0eff0dabaeaaaa3de7.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19a2be1aeb0d935b433d0b0eff0dabaeaaaa3de7.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

On Fri, Dec 29, 2023 at 02:30:32PM +0800, Hans Hu wrote:
> v4->v5:
> 	add previous prototype 'static' for wmt_i2c_init().
> 
> Some common initialization actions are put in the function
> wmt_i2c_init(), which is convenient to share with zhaoxin.
> 
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
> ---
>  drivers/i2c/busses/i2c-wmt.c | 67 +++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
> index ec2a8da134e5..f1888f100d83 100644
> --- a/drivers/i2c/busses/i2c-wmt.c
> +++ b/drivers/i2c/busses/i2c-wmt.c
> @@ -286,6 +286,38 @@ static irqreturn_t wmt_i2c_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)

looks good, I would rather make this a 

   static struct wmt_i2c_dev *wmt_i2c_init(struct platform_device *pdev)
   {
	struct wmt_i2c_dev *i2c_dev;
   	...
	return i2c_dev;
   }

kind of function and call it as:

   i2c_dev = wmt_i2c_init(...);
   if (IS_ERR(i2c_dev))
   	return ERR_PTR(i2c_dev);

Not a binding comment. It just looks nicer; in that case I would
call the function wmt_i2c_dev_alloc().

In any case:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

> +{
> +	int err;
> +	struct wmt_i2c_dev *i2c_dev;
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
> +	if (!i2c_dev)
> +		return -ENOMEM;
> +
> +	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(i2c_dev->base))
> +		return PTR_ERR(i2c_dev->base);
> +
> +	i2c_dev->irq = irq_of_parse_and_map(np, 0);
> +	if (!i2c_dev->irq)
> +		return -EINVAL;
> +
> +	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
> +					0, pdev->name, i2c_dev);
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err,
> +				"failed to request irq %i\n", i2c_dev->irq);
> +
> +	i2c_dev->dev = &pdev->dev;
> +	init_completion(&i2c_dev->complete);
> +	platform_set_drvdata(pdev, i2c_dev);
> +
> +	*pi2c_dev = i2c_dev;
> +	return 0;
> +}
> +
>  static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
>  {
>  	int err;
> @@ -327,19 +359,9 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	int err;
>  	u32 clk_rate;
>  
> -	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
> -	if (!i2c_dev)
> -		return -ENOMEM;
> -
> -	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> -	if (IS_ERR(i2c_dev->base))
> -		return PTR_ERR(i2c_dev->base);
> -
> -	i2c_dev->irq = irq_of_parse_and_map(np, 0);
> -	if (!i2c_dev->irq) {
> -		dev_err(&pdev->dev, "irq missing or invalid\n");
> -		return -EINVAL;
> -	}
> +	err = wmt_i2c_init(pdev, &i2c_dev);
> +	if (err)
> +		return err;
>  
>  	i2c_dev->clk = of_clk_get(np, 0);
>  	if (IS_ERR(i2c_dev->clk)) {
> @@ -351,15 +373,6 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
>  		i2c_dev->tcr = TCR_FAST_MODE;
>  
> -	i2c_dev->dev = &pdev->dev;
> -
> -	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr, 0,
> -							"i2c", i2c_dev);
> -	if (err) {
> -		dev_err(&pdev->dev, "failed to request irq %i\n", i2c_dev->irq);
> -		return err;
> -	}
> -
>  	adap = &i2c_dev->adapter;
>  	i2c_set_adapdata(adap, i2c_dev);
>  	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
> @@ -368,21 +381,13 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	adap->dev.parent = &pdev->dev;
>  	adap->dev.of_node = pdev->dev.of_node;
>  
> -	init_completion(&i2c_dev->complete);
> -
>  	err = wmt_i2c_reset_hardware(i2c_dev);
>  	if (err) {
>  		dev_err(&pdev->dev, "error initializing hardware\n");
>  		return err;
>  	}
>  
> -	err = i2c_add_adapter(adap);
> -	if (err)
> -		return err;
> -
> -	platform_set_drvdata(pdev, i2c_dev);
> -
> -	return 0;
> +	return i2c_add_adapter(adap);
>  }
>  
>  static void wmt_i2c_remove(struct platform_device *pdev)
> -- 
> 2.34.1
> 

