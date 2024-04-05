Return-Path: <linux-i2c+bounces-2785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501DA89A2C2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 18:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066D6287FE5
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 16:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A571C171096;
	Fri,  5 Apr 2024 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r48kuiPi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49697200CB;
	Fri,  5 Apr 2024 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335380; cv=none; b=dyCi4iehqPXuy+C8uSAnHIHQosdM5AbSr/evBwuFzWwWOtVukEbAHxPLA+SeENP/ylf3KWdGWuvVIKpI4oT5tyLtPCXR2d/4tDXZWK4gozprp6Ecb0JP3Qi1x9OgWwSTxKpn6iri4J9HuFMMpA/v20A3jgNebd7Zd0uGkL9r27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335380; c=relaxed/simple;
	bh=tzIzKG9cY5iB1cNbyOSerZNGuncnsSg9ri0aWSb8kwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flJqrapU9bUAQuLDQ6RpWmDI/+UK5y6maP2IDKzOsF9VEpzGHUR3eOkScVqrLjK8QDRToC8Qgrlbtmtp8/hWHg5fzf3B8ZExcsRGLeh5YilShc/fraOyOw/6V/eTcPWrBmvXcSZVf4+ZLtc/rKzjV2BdEEvOcvSuc8nZdR6a9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r48kuiPi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15C5C433C7;
	Fri,  5 Apr 2024 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712335379;
	bh=tzIzKG9cY5iB1cNbyOSerZNGuncnsSg9ri0aWSb8kwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r48kuiPiZk+YPXBGXE/t9V6lM/orfbdYF3HLBfM3IvOIKzRpBmoqkPh0kV3QulPsb
	 RpETs988GevTLNLY8feR091/mWnHiHJ+TNRXJ8CyNDjLdPglNQd7ozHdCnPpglGzym
	 QWgJA1H9c8ovLqRFWQIEWWdJKJNfDde8b5ADQduEShbl8SgLDI2FhYvPsYVLy5buYt
	 4fGzIHgftRydymvjBlXIeKkAXHVomC9lSv9XGguBVtMpbg2inY9G/Q38MM5SJHNKXY
	 Z7eosNVB8cd/PiGsigrvivnFv5rwNePd5PlrM+IyFOwIMZ2n3D9CW4nq58rXVtOaxB
	 RMNwFYglC8zLA==
Date: Fri, 5 Apr 2024 22:12:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v4 07/18] phy: ti: phy-j721e-wiz: split wiz_clock_init()
 function
Message-ID: <ZhAqDmQO9TYeDPz6@matsya>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-7-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v4-7-6f1f53390c85@bootlin.com>

On 04-03-24, 16:35, Thomas Richard wrote:
> The wiz_clock_init() function mixes probe and hardware configuration.
> Rename the wiz_clock_init() to wiz_clock_probe() and move the hardware
> configuration part in a new function named wiz_clock_init().
> 
> This hardware configuration sequence must be called during the resume
> stage of the driver.

Do you have phy patches dependent on rest, if not consider submitting
them in a separate series

> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/phy/ti/phy-j721e-wiz.c | 67 ++++++++++++++++++++++++------------------
>  1 file changed, 38 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
> index 5fea4df9404e..0e3cb1ed5a52 100644
> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -1076,26 +1076,12 @@ static int wiz_clock_register(struct wiz *wiz)
>  	return ret;
>  }
>  
> -static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
> +static void wiz_clock_init(struct wiz *wiz)
>  {
> -	const struct wiz_clk_mux_sel *clk_mux_sel = wiz->clk_mux_sel;
> -	struct device *dev = wiz->dev;
> -	struct device_node *clk_node;
> -	const char *node_name;
>  	unsigned long rate;
> -	struct clk *clk;
> -	int ret;
> -	int i;
> -
> -	clk = devm_clk_get(dev, "core_ref_clk");
> -	if (IS_ERR(clk))
> -		return dev_err_probe(dev, PTR_ERR(clk),
> -				     "core_ref_clk clock not found\n");
>  
> -	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
> -
> -	rate = clk_get_rate(clk);
> -	if (rate >= 100000000)
> +	rate = clk_get_rate(wiz->input_clks[WIZ_CORE_REFCLK]);
> +	if (rate >= REF_CLK_100MHZ)
>  		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x1);
>  	else
>  		regmap_field_write(wiz->pma_cmn_refclk_int_mode, 0x3);
> @@ -1119,6 +1105,39 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
>  		break;
>  	}
>  
> +	if (wiz->input_clks[WIZ_CORE_REFCLK1]) {
> +		rate = clk_get_rate(wiz->input_clks[WIZ_CORE_REFCLK1]);
> +		if (rate >= REF_CLK_100MHZ)
> +			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
> +		else
> +			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
> +

unnecessary empty line

> +	}
> +
> +	rate = clk_get_rate(wiz->input_clks[WIZ_EXT_REFCLK]);
> +	if (rate >= REF_CLK_100MHZ)
> +		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x0);
> +	else
> +		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x2);
> +}
> +
> +static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
> +{
> +	const struct wiz_clk_mux_sel *clk_mux_sel = wiz->clk_mux_sel;
> +	struct device *dev = wiz->dev;
> +	struct device_node *clk_node;
> +	const char *node_name;
> +	struct clk *clk;
> +	int ret;
> +	int i;
> +
> +	clk = devm_clk_get(dev, "core_ref_clk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "core_ref_clk clock not found\n");
> +
> +	wiz->input_clks[WIZ_CORE_REFCLK] = clk;
> +
>  	if (wiz->data->pma_cmn_refclk1_int_mode) {
>  		clk = devm_clk_get(dev, "core_ref1_clk");
>  		if (IS_ERR(clk))
> @@ -1126,12 +1145,6 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
>  					     "core_ref1_clk clock not found\n");
>  
>  		wiz->input_clks[WIZ_CORE_REFCLK1] = clk;
> -
> -		rate = clk_get_rate(clk);
> -		if (rate >= 100000000)
> -			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x1);
> -		else
> -			regmap_field_write(wiz->pma_cmn_refclk1_int_mode, 0x3);
>  	}
>  
>  	clk = devm_clk_get(dev, "ext_ref_clk");
> @@ -1141,11 +1154,7 @@ static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
>  
>  	wiz->input_clks[WIZ_EXT_REFCLK] = clk;
>  
> -	rate = clk_get_rate(clk);
> -	if (rate >= 100000000)
> -		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x0);
> -	else
> -		regmap_field_write(wiz->pma_cmn_refclk_mode, 0x2);
> +	wiz_clock_init(wiz);
>  
>  	switch (wiz->type) {
>  	case AM64_WIZ_10G:
> @@ -1589,7 +1598,7 @@ static int wiz_probe(struct platform_device *pdev)
>  		goto err_get_sync;
>  	}
>  
> -	ret = wiz_clock_init(wiz, node);
> +	ret = wiz_clock_probe(wiz, node);
>  	if (ret < 0) {
>  		dev_warn(dev, "Failed to initialize clocks\n");
>  		goto err_get_sync;
> 
> -- 
> 2.39.2

-- 
~Vinod

