Return-Path: <linux-i2c+bounces-2149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FA68703AD
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4A761F27BD8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98733FB31;
	Mon,  4 Mar 2024 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKhwZti5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1573FB0D;
	Mon,  4 Mar 2024 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561321; cv=none; b=dsqXffidY5YY9E1ToJ02qnvTxFubhmXD2bmN0rP9YnZdPBzd+nES0qpRpqXprfzh4cfi/fX1AnjOf6yxBead030d1rR9I+9hxa0lkaN/ze3GvhKWgcNVEUqaPFK1fkdyVJcH2ksFZoMgehlRv/Yviwl2C24+0INxa5u1DwZ81Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561321; c=relaxed/simple;
	bh=mGavApi6w7ofRRdajIRCPCMtvgMiEtdIO9FBAOcKrK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWe9o+DqDU6bpsRIYDjHgd+tVI17X5xFsuOZbLFYluxwlOmN2GTO/wc5tY+4ocxZWWdq+TPro1Rv66it9HA5YrMym3ptGNHHXnymFOM9e713knZDAuYLInLxnqAbVKXQE0X+OEgAqqcosOQ1wCCjULpmWP9Q/ZD4GXDLRXeZVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKhwZti5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D70C43390;
	Mon,  4 Mar 2024 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709561321;
	bh=mGavApi6w7ofRRdajIRCPCMtvgMiEtdIO9FBAOcKrK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKhwZti5qxer0MQBIkoAhnJwwnxBdoHzXNIrtkspZueeH6FpLx3XTPV1NhCPPLz29
	 BULfYRkejdIO2Pop70eNvGR76v3kQj3XY/B0xCkYz6zu6HsB/lMO1CpYKpQQG+yRSD
	 6eBIYcL9JDBIu4nPI3o9gNIidBt8NkQk42Jw+xuPRTFYIuruzVMRNytiyVrOWaopBp
	 poiJO9tsmy9OzxJrWUR38CrzBu1dwevCTH3pwORypoOnQmlBYBhEigR4VwKrpOU6zN
	 w0EG2NbthUoGWVqpGdPO6L1zbAVxYc3Fhg+5OvspiJf802zwQpfVrb0wtEmam37HSm
	 vapr3O4W8lMqw==
Date: Mon, 4 Mar 2024 15:08:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 09/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Message-ID: <yqyhu3qsrfyj52sraeo76jnpbgq6wi4o66hfqepxwwwupaggoa@7t5bah3qqcwb>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>

Hi Theo,

...

> +#include <linux/amba/bus.h>
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
>  #include <linux/init.h>
> -#include <linux/module.h>
> -#include <linux/amba/bus.h>
> -#include <linux/slab.h>
>  #include <linux/interrupt.h>
> -#include <linux/i2c.h>
> -#include <linux/err.h>
> -#include <linux/clk.h>
>  #include <linux/io.h>
> -#include <linux/pm_runtime.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>

Please reorder the headers in a different patch.

>  #define DRIVER_NAME "nmk-i2c"
>  

...

> +static inline u8 nmk_i2c_readb(const struct nmk_i2c_dev *priv,
> +			       unsigned long reg)
> +{
> +	if (priv->has_32b_bus)
> +		return readl(priv->virtbase + reg);
> +	else
> +		return readb(priv->virtbase + reg);

nit: no need for the else (your choice though, if you want to
have ti coherent with the write counterpart).

> +}
> +
> +static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 val,
> +				unsigned long reg)
> +{
> +	if (priv->has_32b_bus)
> +		writel(val, priv->virtbase + reg);
> +	else
> +		writeb(val, priv->virtbase + reg);
> +}

...

> +static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
> +{
> +	struct device *dev = &priv->adev->dev;
> +	struct device_node *np = dev->of_node;
> +	unsigned int shift, speed_mode;
> +	struct regmap *olb;
> +	unsigned int id;
> +
> +	priv->has_32b_bus = true;
> +
> +	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
> +	if (IS_ERR_OR_NULL(olb)) {
> +		if (!olb)
> +			olb = ERR_PTR(-ENOENT);
> +		return dev_err_probe(dev, PTR_ERR(olb),
> +				     "failed OLB lookup: %lu\n", PTR_ERR(olb));

just return PTR_ERR(olb) and use dev_err_probe() in the upper
layer probe.

> +	}
> +
> +	if (priv->clk_freq <= 400000)
> +		speed_mode = 0b00;
> +	else if (priv->clk_freq <= 1000000)
> +		speed_mode = 0b01;
> +	else
> +		speed_mode = 0b10;

would be nice to have these as defines.

> +
> +	shift = NMK_I2C_EYEQ5_OLB_IOCR2_SHIFT(id);
> +	regmap_update_bits(olb, NMK_I2C_EYEQ5_OLB_IOCR2,
> +			   0b11 << shift, speed_mode << shift);

please define these values and for hexadecimals use 0x...

> +	return 0;
> +}
> +
>  static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	int ret = 0;
> @@ -1001,8 +1065,17 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	priv->vendor = vendor;
>  	priv->adev = adev;
> +	priv->has_32b_bus = false;
>  	nmk_i2c_of_probe(np, priv);
>  
> +	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
> +		ret = nmk_i2c_eyeq5_probe(priv);
> +		if (ret) {
> +			dev_info(dev, "%s: %d: %d\n", __func__, __LINE__, ret);
> +			return ret;
> +		}

as said above, use dev_err_probe here.

Andi

> +	}
> +
>  	if (priv->tft > max_fifo_threshold) {
>  		dev_warn(dev, "requested TX FIFO threshold %u, adjusted down to %u\n",
>  			 priv->tft, max_fifo_threshold);
> 
> -- 
> 2.44.0
> 

