Return-Path: <linux-i2c+bounces-2786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993789A2CB
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 18:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19B1DB25BBE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 16:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95C2171091;
	Fri,  5 Apr 2024 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd8ozYRU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D426AB6;
	Fri,  5 Apr 2024 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335453; cv=none; b=pCpgvIaBeYY5yEFOdUFFQwk7Q8iOF+WBSpFRMvJi5g/jJ9l0P/dTSmvIQ+LhqfFUsT5tmUeXS7DIPlE6Wq5y3YIQI+LVUxIsTCj/xl3w35U+xlEyHzjD4/Hsc6ltLAqf5VW9wvNcd/ilDQY+baZX8KMXlauWFU/CMKC6Fqu2FOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335453; c=relaxed/simple;
	bh=ViaSMrZIPCzmKnR3iMx+cq3XI+FjdW5BQMMi7XeiIVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCwfxF/Qjbe/IxAixnDy8K6wbLIjykxBAYUK06MnnOSuVnnPlbiDodAZAKYStPAvzRIBflIovGFsUAcy37yRfrKbD4z4R61ROPQRaUxlPR/oZgiqMwFuYXHRXg+xc6hGK+Va7FszeTrd5EZ+iF8/hhVK41GP5nLMi3+xMsG/T+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd8ozYRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31107C433F1;
	Fri,  5 Apr 2024 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712335453;
	bh=ViaSMrZIPCzmKnR3iMx+cq3XI+FjdW5BQMMi7XeiIVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd8ozYRUncFrTzLH+SmJ/vF3tOrvsD6NvHIFf9fb2ANT6bBktVoawIFjRGqjL2JOL
	 69l3TrB0IA0gzVGKKqdPSjG09Fd23/P14KhVr9CmEL7i81CiiwvJKNYsDpQ5x4O57h
	 4stJUsyJ3THA0LbFLhqY3dkVTatUGzD5FQoQ0yCRQABMI3rgIvmmnO8JHfU51XiNdJ
	 sFEPtTEZfT6hWD0v/Q4bFOXWV2VNWwEID21JBshgiyEtBsSxe2o8Kl3mpPv21yqVto
	 ep9zzo0HvKAzvVWTGAfnbaUJmnDoVhOUyPmeYHw0iS/av7Pswk6cOC54mUx5KUyI2R
	 3QIyTyTQ8ucGw==
Date: Fri, 5 Apr 2024 22:14:09 +0530
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
Subject: Re: [PATCH v4 08/18] phy: ti: phy-j721e-wiz: add resume support
Message-ID: <ZhAqWWdZvGcFDWlM@matsya>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-8-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v4-8-6f1f53390c85@bootlin.com>

On 04-03-24, 16:35, Thomas Richard wrote:
> Add resume support.
> It has been tested on J7200 SR1.0 and SR2.0.
> 
> Co-developed-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/phy/ti/phy-j721e-wiz.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
> index 0e3cb1ed5a52..b2320f2efb72 100644
> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -1660,12 +1660,41 @@ static void wiz_remove(struct platform_device *pdev)
>  	pm_runtime_disable(dev);
>  }
>  
> +static int wiz_resume_noirq(struct device *dev)

I think this should be annotated with __maybe_unused

> +{
> +	struct device_node *node = dev->of_node;
> +	struct wiz *wiz = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Enable supplemental Control override if available */
> +	if (wiz->sup_legacy_clk_override)
> +		regmap_field_write(wiz->sup_legacy_clk_override, 1);
> +
> +	wiz_clock_init(wiz);
> +
> +	ret = wiz_init(wiz);
> +	if (ret) {
> +		dev_err(dev, "WIZ initialization failed\n");
> +		goto err_wiz_init;
> +	}
> +
> +	return 0;
> +
> +err_wiz_init:
> +	wiz_clock_cleanup(wiz, node);
> +
> +	return ret;
> +}
> +
> +static DEFINE_NOIRQ_DEV_PM_OPS(wiz_pm_ops, NULL, wiz_resume_noirq);
> +
>  static struct platform_driver wiz_driver = {
>  	.probe		= wiz_probe,
>  	.remove_new	= wiz_remove,
>  	.driver		= {
>  		.name	= "wiz",
>  		.of_match_table = wiz_id_table,
> +		.pm	= pm_sleep_ptr(&wiz_pm_ops),
>  	},
>  };
>  module_platform_driver(wiz_driver);
> 
> -- 
> 2.39.2

-- 
~Vinod

