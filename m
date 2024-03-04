Return-Path: <linux-i2c+bounces-2126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E25B86F7F6
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 01:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ED93280FD8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 00:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05CC33D5;
	Mon,  4 Mar 2024 00:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJTAHqdB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D1259C
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 00:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709512219; cv=none; b=H3vmYCoTRfpOw9m2jjn2pkkCbA93cj31QMlqKeVkU6gQRI6/GYjHb9ty8ZTbl1BAt06LFKv+JbNq9ArKBaRD2FNV132R0P7FRkuUFXVh62GrrIPTi0TFXVDA3vXAjqWpNli9MyqLMWppjpzGdgweaCqv9F8+geIrfumb6ppz9OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709512219; c=relaxed/simple;
	bh=qGmUTlJ3gEZ+4OIJnySLKmISJJAXNoKbrWu3wq4fMZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9/ak5jgwS+p+YRPBWLXa825PzZLD8CpPL2d9A1MSHbgcM/+6wDize9KvucJ+/Mfi23jveOxNw3q/1NNqpupj4XVjdSZKEVhO/fdHvwSREqe5/4qdYpjHwemRQAXurKr24IEiHNVUhy/KvsHmBWRXslB8u4dMv8B3qv+4DH8Wwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJTAHqdB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF977C433F1;
	Mon,  4 Mar 2024 00:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709512219;
	bh=qGmUTlJ3gEZ+4OIJnySLKmISJJAXNoKbrWu3wq4fMZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJTAHqdBCA3mJvYT3jrrbwvtMrDLNQ1eOpveTI72EUzc1gV42sxrEJZepoOYJv7t6
	 7sEiHKQ74y0k7ehlEAAK3RiHQefbuLxbsmCn9VtYQgKzyV1P5C1pGHMcieTNbmjT46
	 JhEttgDC6mnzzGcyPpQ2MjJh7Nc9FeR4+1mc78sZMXgtjcTzp6GI//O/d6s8q1Mn0J
	 E/sYy2pibooCwx5IgY4KAUGiDY7gqerK76yKmFd2ly7yhsGcd7OTFvNN7TqXVWY4i2
	 fnkVP17hwwV+Y7eLIM+7d3F3w8XN8SXA+mGya77sOrivW1lC5L90L6FNl0cicFog+b
	 W/whVKpzLXlhQ==
Date: Mon, 4 Mar 2024 01:30:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Avoid potential double call to
 gpiod_remove_lookup_table
Message-ID: <d4it33rkc5rric6v5r4mwefcbvre2wf5iucbcqnkhzlhhj4lwf@3yx2ax7zlfgs>
References: <5c8f5f27-9d81-46dd-92d3-d13478b4448b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8f5f27-9d81-46dd-92d3-d13478b4448b@gmail.com>

On Sun, Mar 03, 2024 at 11:41:44AM +0100, Heiner Kallweit wrote:
> If registering the platform device fails, the lookup table is
> removed in the error path. On module removal we would try to
> remove the lookup table again. Fix this by leaving it to
> i801_del_mux() to clean up.
> 
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

You might want to Cc also Linus Walleij here as the patch is from
him.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Just a little thought...

> ---
> v2:
> - cc stable
> - free memory allocated for the lookup table
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
>  
>  	/*
>  	 * Register the mux device, we use PLATFORM_DEVID_NONE here
> @@ -1442,7 +1441,10 @@ static void i801_add_mux(struct i801_priv *priv)
>  				sizeof(struct i2c_mux_gpio_platform_data));
>  	if (IS_ERR(priv->mux_pdev)) {
>  		gpiod_remove_lookup_table(lookup);
> +		devm_kfree(dev, lookup);

perhaps you also want to set priv->lookup to NULL. It's not
really needed, but it's just some paranoiac thinking.

Andi

>  		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
> +	} else {
> +		priv->lookup = lookup;
>  	}
>  }
>  
> -- 
> 2.44.0
> 

