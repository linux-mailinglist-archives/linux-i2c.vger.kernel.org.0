Return-Path: <linux-i2c+bounces-2268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CA875AEC
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 00:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D541F22839
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 23:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FEF3D965;
	Thu,  7 Mar 2024 23:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcEc9BR1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33653D3A7;
	Thu,  7 Mar 2024 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709853071; cv=none; b=V8Eew/hi9Lf1AHFMTM6mw+bToXA/XLW7+F9KjrcJuVzdsKkTDacgqja9uJkNGfeCe2y5UvS14SOm2pafH+PzZSz4CETxbtSJTvObAYCW4yWn24te+yI7ZyMB6xKBkz4lele2P5gcQ9l0Ur2CRAIcOX90lRR/AnNmvARZYlKg8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709853071; c=relaxed/simple;
	bh=0DUfqVmStnhMkNmPgPMTVw3GNV1qSqaLIBiV7oc9xHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iahFrma1Hg0jMzvp2nXrkcKCD1My8X1dPHzvIzf56Rjq4GZBYxxDhlI7oVQRdiidA5XP51mYzBrfdZayK/mnd3n6aIC1I7zbc+5s/W1zs3sODNQaWvq3Urits/557CB6hst2lLACWSRu0Yg8mvpXTqLL8NHk5vDEhrtgTzQhapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcEc9BR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBCBC433F1;
	Thu,  7 Mar 2024 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709853071;
	bh=0DUfqVmStnhMkNmPgPMTVw3GNV1qSqaLIBiV7oc9xHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcEc9BR1bo6SgxFcK0K30FLiey7n6MEc1dTlzCh1Qk0HE+4rlKKEEMvDTH4l4HznE
	 DR/6VfHvCQ9e2nLF9zip7AGaP8/8iqez1NG19mnCMYRWuNuhQPKGmW5g9Roh3ZDiJ8
	 OIiFDO8K8jP/ghRhTcuAPbmDbgW6wj8VKsUISXQ61xGZ/vy2OQxUUlcNKaPVkejJ4N
	 BOlZF9kqfemsZeJAnsE5iygncPyza8UgLtc3HDCCIyt3zwRk9kf2UBSSvxTcYnSg9w
	 JwYR3GSCxCdMtj90cNYxvmtd/G3n+o4+tUlCfJL7gwI4Pm8nvUlHd35e+Nxbx5jJhQ
	 EjBCi0xiaDErQ==
Date: Fri, 8 Mar 2024 00:11:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 08/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Message-ID: <xy2nxcjxkw6pkprrjx2sol62xvq2nr3ukdwpn4h3wuwpnnu43j@2djyqtkdpcwc>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-mbly-i2c-v3-8-605f866aa4ec@bootlin.com>

Hi Theo,

...

> +static inline u8 nmk_i2c_readb(const struct nmk_i2c_dev *priv,
> +			       unsigned long reg)
> +{
> +	if (priv->has_32b_bus)
> +		return readl(priv->virtbase + reg);
> +	else
> +		return readb(priv->virtbase + reg);
> +}

you forgot to remove the else... not a problem, it's coherent
with its writeb counterpart.

...

> +static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
> +{
> +	struct device *dev = &priv->adev->dev;
> +	struct device_node *np = dev->of_node;
> +	unsigned int mask, speed_mode;
> +	struct regmap *olb;
> +	unsigned int id;
> +
> +	priv->has_32b_bus = true;
> +
> +	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
> +	if (IS_ERR(olb))
> +		return PTR_ERR(olb);
> +	if (id >= ARRAY_SIZE(nmk_i2c_eyeq5_masks))
> +		return -ENOENT;
> +
> +	if (priv->clk_freq <= 400000)
> +		speed_mode = I2C_EYEQ5_SPEED_FAST;
> +	else if (priv->clk_freq <= 1000000)
> +		speed_mode = I2C_EYEQ5_SPEED_FAST_PLUS;
> +	else
> +		speed_mode = I2C_EYEQ5_SPEED_HIGH_SPEED;
> +
> +	mask = nmk_i2c_eyeq5_masks[id];
> +	regmap_update_bits(olb, NMK_I2C_EYEQ5_OLB_IOCR2,
> +			   mask, speed_mode << __fls(mask));
> +
> +	return 0;
> +}
> +
>  static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	int ret = 0;
> @@ -1012,8 +1087,15 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	priv->vendor = vendor;
>  	priv->adev = adev;
> +	priv->has_32b_bus = false;
>  	nmk_i2c_of_probe(np, priv);
>  
> +	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
> +		ret = nmk_i2c_eyeq5_probe(priv);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed OLB lookup\n");
> +	}
> +

Looks good!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

