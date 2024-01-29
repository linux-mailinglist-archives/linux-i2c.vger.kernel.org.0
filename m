Return-Path: <linux-i2c+bounces-1515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A072841672
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E77A7B20ABF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC5A51C4B;
	Mon, 29 Jan 2024 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVsOxus2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE5F51C37;
	Mon, 29 Jan 2024 23:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706569378; cv=none; b=AF211OkYtVzXZMF9Bl2Yb40xhm0U/aQ7mIMWrCqXnfWdFhaKj4Ux/Rubrndivdsk7gfkVHiUeSU+w5UsVf2Iyeg2Q33mvcDJPxEiBxIqbSMnuQgAUFgURLPR2WTFO6tyLA5jMxjB2NCTildA5eMz9eXa9KcEOcUpRL0XuEWNEC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706569378; c=relaxed/simple;
	bh=Q9nI/7RI1JNzkkHw+IaFq8YSl/MHeKMqR9LTizL5pp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfWcElM6OGMCIk6zhvuGMU1GjzqM9pfxf6WW9XBVTS+fHYk8Sq9/2IzC+87OugLl6x6XiggEsTkn6YDJcQjdhnIHwD7HHhQc4WSr71kZRbLu3sJoys2rtD+n4p3cpUY+kBkQ0/60CoOJDK+4Nn+5QcTO1oJxdKcP6/ndSsLWrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVsOxus2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57116C433F1;
	Mon, 29 Jan 2024 23:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706569377;
	bh=Q9nI/7RI1JNzkkHw+IaFq8YSl/MHeKMqR9LTizL5pp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVsOxus2tS5Psg05RwTRruqFVli62GM50PCGljBOEPO78vdQ+kQPiX12feiAYJRCP
	 zmzeixvlWPfiDoi9/OUzecyKMbJSN3eQSlo/JX+ervt9sINBPQ+peZ4K2cPibMtew8
	 /3HzDyHoNR/F2oMe0ze5P0ZvwzuN3J6PfVTFb0yv/kZAzVSvysBHqFfr0WK/n/yj8J
	 1p+wdTRZQuhlI9Hmub5H1khM2vEJSoKLbnFbcUKBTg+NswIJufXYN+3irZt4vRtgvh
	 ZrejASxPcL+1XGUp6Zp2uufXhlp0ttIAGVHfcwSDKcLlz+bjaMn5WUXzFBEGLiM7y2
	 TyjHbLohykQJw==
Date: Tue, 30 Jan 2024 00:02:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH v2 06/15] phy: ti: phy-j721e-wiz: make wiz_clock_init
 callable multiple times
Message-ID: <grxi7y5l52fyyd7w5kmgvdzgbld2g2tjl4keudmykbuaxk6abk@ramj3rfa5lai>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-6-8e4f7d228ec2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v2-6-8e4f7d228ec2@bootlin.com>

Hi Thomas,

On Fri, Jan 26, 2024 at 03:36:48PM +0100, Thomas Richard wrote:
> For suspend and resume support, wiz_clock_init needs to be called multiple
> times.
> 
> Add a parameter to wiz_clock_init to be able to skip clocks registration.
> 
> Based on the work of Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/phy/ti/phy-j721e-wiz.c | 60 +++++++++++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
> index fc3cd98c60ff..09f7edf16562 100644
> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -1076,7 +1076,7 @@ static int wiz_clock_register(struct wiz *wiz)
>  	return ret;
>  }
>  
> -static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
> +static int wiz_clock_init(struct wiz *wiz, struct device_node *node, bool probe)

the 'bool probe' is ugly. When someone reads something like 
"ret = wiz_clock_init(wiz, node, true);" wonders what the
true/false is and needs to follow through the function to
understand.

Please, split this function (and below) into two parts:

wiz_clock_probe() and wiz_clock_init(). The former calls the
latter. Later on you can just call wiz_clock_init().

Andi

>  {
>  	const struct wiz_clk_mux_sel *clk_mux_sel = wiz->clk_mux_sel;
>  	struct device *dev = wiz->dev;
> @@ -1087,14 +1087,36 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
>  	int ret;
>  	int i;
>  
> -	clk = devm_clk_get(dev, "core_ref_clk");
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "core_ref_clk clock not found\n");
> -		ret = PTR_ERR(clk);
> -		return ret;
> +	if (probe) {
> +		clk = devm_clk_get(dev, "core_ref_clk");
> +		if (IS_ERR(clk)) {
> +			dev_err(dev, "core_ref_clk clock not found\n");
> +			ret = PTR_ERR(clk);
> +			return ret;
> +		}
> +		wiz->input_clks[WIZ_CORE_REFCLK] = clk;
> +
> +		if (wiz->data->pma_cmn_refclk1_int_mode) {
> +			clk = devm_clk_get(dev, "core_ref1_clk");
> +			if (IS_ERR(clk)) {
> +				dev_err(dev, "core_ref1_clk clock not found\n");
> +				ret = PTR_ERR(clk);
> +				return ret;
> +			}
> +			wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
> +		}
> +
> +		clk = devm_clk_get(dev, "ext_ref_clk");
> +		if (IS_ERR(clk)) {
> +			dev_err(dev, "ext_ref_clk clock not found\n");
> +			ret = PTR_ERR(clk);
> +			return ret;
> +		}
> +		wiz->input_clks[WIZ_EXT_REFCLK] = clk;
>  	}
> -	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
>  
> +
> +	clk = wiz->input_clks[WIZ_CORE_REFCLK];
>  	rate = clk_get_rate(clk);
>  	if (rate >= 100000000)
>  		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x1);
> @@ -1121,14 +1143,7 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
>  	}
>  
>  	if (wiz->data->pma_cmn_refclk1_int_mode) {
> -		clk = devm_clk_get(dev, "core_ref1_clk");
> -		if (IS_ERR(clk)) {
> -			dev_err(dev, "core_ref1_clk clock not found\n");
> -			ret = PTR_ERR(clk);
> -			return ret;
> -		}
> -		wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
> -
> +		clk = wiz->input_clks[WIZ_CORE_REFCLK1];
>  		rate = clk_get_rate(clk);
>  		if (rate >= 100000000)
>  			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
> @@ -1136,20 +1151,17 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
>  			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
>  	}
>  
> -	clk = devm_clk_get(dev, "ext_ref_clk");
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "ext_ref_clk clock not found\n");
> -		ret = PTR_ERR(clk);
> -		return ret;
> -	}
> -	wiz->input_clks[WIZ_EXT_REFCLK] = clk;
> -
> +	clk = wiz->input_clks[WIZ_EXT_REFCLK];
>  	rate = clk_get_rate(clk);
>  	if (rate >= 100000000)
>  		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x0);
>  	else
>  		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x2);
>  
> +	/* What follows is about registering clocks. */
> +	if (!probe)
> +		return 0;
> +
>  	switch (wiz->type) {
>  	case AM64_WIZ_10G:
>  	case J7200_WIZ_10G:
> @@ -1592,7 +1604,7 @@ static int wiz_probe(struct platform_device *pdev)
>  		goto err_get_sync;
>  	}
>  
> -	ret = wiz_clock_init(wiz, node);
> +	ret = wiz_clock_init(wiz, node, true);
>  	if (ret < 0) {
>  		dev_warn(dev, "Failed to initialize clocks\n");
>  		goto err_get_sync;
> 
> -- 
> 2.39.2
> 

