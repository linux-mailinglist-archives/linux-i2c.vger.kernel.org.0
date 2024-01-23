Return-Path: <linux-i2c+bounces-1424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B68387E2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8AF1C24350
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 07:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74752F92;
	Tue, 23 Jan 2024 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+BjxU0T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CB652F7E;
	Tue, 23 Jan 2024 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705994316; cv=none; b=qAnzk1XcdbWd8TEAah+ozAKTPZhipih+tUjaNjYcutxtfj1HNCHVrqQb6gDJTCqZ+058aAmD7rIdzaiVN29o8zzsoqaizzK/QUn2kgL147hjRMNNSnvVWOaFJDsQ26jl8gdi+ANrnUBrwlVUDdQztB9Dut75BbU72v85SmDsaGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705994316; c=relaxed/simple;
	bh=TTjPVKSuyim+Y5YMrAL6bgP1bnNaR126K293xNj8wus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDmyhJW9T7k5bN7/Bp5fD0XfzSUJKtnwRMgofoIqry87H82o2vyymHwNARWO+sULdA4UmoQTIfyz5gMRRYyPvvEDX68hTzUqa+3gxVDA5MtEUWJflMMVF4eQM/r1hrLNdMwx7jRO3+ArhZdGZnb1NB2Ck22bFcG+pP99D/gK+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+BjxU0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E8BC433A6;
	Tue, 23 Jan 2024 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705994315;
	bh=TTjPVKSuyim+Y5YMrAL6bgP1bnNaR126K293xNj8wus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+BjxU0TR2OpXB4waPzTZj1kTTGDgUdfUuxRh7lU3N0AOex+AnlIqKpSBZ5g/OwxB
	 UbQyfRyI5U6o0uEZK7E3aIl0/IuMuuhmzeBnIiXVwrqPz1KvhvyYcFnyyA/V8Gs0WM
	 GRdWsDUTTOvZOLHVz62FXOkW87+k6D5UBQMweVNfNn4tzAHmlPvaEfB2gN1UHuxbV/
	 7JfT2gRpZZ8wl1tnHPRvrS/6KdaKW3NQSYdElD6rpyT0qWK3TaGxq06mAttAq85YuN
	 aqeQjeaqXwYmYNX/zfQhVdoKiFi4eF7y35V6mSYkWlmKtBD4JkwDa4nYtpiShQ4to4
	 wTvdM6T0eigbg==
Date: Tue, 23 Jan 2024 12:48:31 +0530
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
	Tom Joseph <tjoseph@cadence.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH 05/14] phy: ti: phy-j721e-wiz: make wiz_clock_init
 callable multiple times
Message-ID: <Za9oR8BpoufCRNIw@matsya>
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-5-84e55da52400@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v1-5-84e55da52400@bootlin.com>

On 15-01-24, 17:14, Thomas Richard wrote:
> For suspend and resume support, wiz_clock_init needs to be called
> multiple times.
> Add a parameter to wiz_clock_init to be able to skip clocks
> registration.
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

You are calling it one once? So what am I missing

-- 
~Vinod

