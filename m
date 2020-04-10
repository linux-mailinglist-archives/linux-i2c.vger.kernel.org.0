Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEDE1A3DBC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 03:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgDJB1W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 21:27:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32962 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDJB1W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Apr 2020 21:27:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id c138so413205pfc.0
        for <linux-i2c@vger.kernel.org>; Thu, 09 Apr 2020 18:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NYP092oVFHUvsHsbAIAUOMXg/TnEaBPI03rKaaHliOQ=;
        b=vkzr1COU6mPIcpet5at6WCuXvKFxS8FYEPvr6qRhWGU+1Od2bpTX6o25uYQeSQC/xS
         CGyXdeJN2IA7bbr3cpkG/DHC8nvsi5ogunSnmFpjhBKC1R4UH3FmC6/ZzY+hBKmpPbyf
         jPqLvWWZbsD2GQgfBvUdYO7XWYt6b4ZdrvmdotoEaUiwaJu1QAdDLp3186EmKKZzK7re
         gggrn5E4rkP3jPNdcqDhLwBh2XO1sTJx7QCgz+iXoPY3NTh2xVmm8i1HA3pBPglTrNtD
         +Ir+dGwxi12GPVRcPfF+fgz6IYRvV8/DidSKzw9jMl0swmQXDrm69nQTpsNrXFtm+n8B
         pXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NYP092oVFHUvsHsbAIAUOMXg/TnEaBPI03rKaaHliOQ=;
        b=Si3vJbQjcI85SgIBvSyRcfwuzrGwj0yPJApiTvLnHGzbe5JTAt5qtfnZTm2q3qoO/X
         1hCxeLRE+l4Ao58ZJh+wyrf6OWf8Y1CBUX9DYjpY5CNo/wqxhDay5hCfEMbKhgSSb0z4
         NqjfeE9OBw72I6NcLfApi85EagEcjmU2UAudWJV34xLPKOHbqQY8S6GDrsj1gUz6Dvd5
         iot7lQeSnKjO0lPGcMPwI4uMUCORUIGcrIUaQIYtdhJr4WRRU9MXJu1EaN+97eomYDbB
         y50XVhVh/N1tUxkZcraBcczN+kTwbz/j51rWXWhYoag600IUfCwmRhTno+gSFTTbvqr6
         4mtQ==
X-Gm-Message-State: AGi0PuYD0TlOnOTyrH+dbCGqHxY3Irt2sba73pDQz1zYDXSglhEEy4V7
        910HrcMfXcRICxVbNmk0ePMsdg==
X-Google-Smtp-Source: APiQypICRcUZA+lD3qx4nK3TcjI7Ib+q46nqVWpdM08KQjGI/VyqWZ8iFEisoqIXyGiP5wlv2JyqFA==
X-Received: by 2002:aa7:8815:: with SMTP id c21mr2525430pfo.86.1586482040290;
        Thu, 09 Apr 2020 18:27:20 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t186sm315434pgd.43.2020.04.09.18.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 18:27:19 -0700 (PDT)
Date:   Thu, 9 Apr 2020 18:27:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        heiko@sntech.de, baohua@kernel.org, linus.walleij@linaro.org,
        mripard@kernel.org, wens@csie.org, ardb@kernel.org,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3] i2c: busses: convert to devm_platform_ioremap_resource
Message-ID: <20200410012727.GC576963@builder.lan>
References: <20200409135224.7426-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409135224.7426-1-zhengdejin5@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu 09 Apr 06:52 PDT 2020, Dejin Zheng wrote:

> use devm_platform_ioremap_resource() to simplify code, it
> contains platform_get_resource and devm_ioremap_resource.
> 
> Reviewed-by: Barry Song <baohua@kernel.org>
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Acked-by: Robert Richter <rrichter@marvell.com>
> Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>

Didn't Wolfram "only" suggest that you should squash your series?

> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Change looks good though.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> v2 -> v3:
> 	- squash all 24 patches into one by Wolfram's suggestion.
> v1 -> v2:
> 	- delete 4 patches of can not be sent by gmail server.
> 	  then, has 24 patches.
> 
>  drivers/i2c/busses/i2c-altera.c         | 4 +---
>  drivers/i2c/busses/i2c-axxia.c          | 4 +---
>  drivers/i2c/busses/i2c-bcm-kona.c       | 4 +---
>  drivers/i2c/busses/i2c-davinci.c        | 4 +---
>  drivers/i2c/busses/i2c-digicolor.c      | 4 +---
>  drivers/i2c/busses/i2c-emev2.c          | 4 +---
>  drivers/i2c/busses/i2c-exynos5.c        | 4 +---
>  drivers/i2c/busses/i2c-hix5hd2.c        | 4 +---
>  drivers/i2c/busses/i2c-img-scb.c        | 4 +---
>  drivers/i2c/busses/i2c-jz4780.c         | 4 +---
>  drivers/i2c/busses/i2c-lpc2k.c          | 4 +---
>  drivers/i2c/busses/i2c-meson.c          | 4 +---
>  drivers/i2c/busses/i2c-mv64xxx.c        | 4 +---
>  drivers/i2c/busses/i2c-octeon-platdrv.c | 4 +---
>  drivers/i2c/busses/i2c-owl.c            | 4 +---
>  drivers/i2c/busses/i2c-qup.c            | 4 +---
>  drivers/i2c/busses/i2c-rk3x.c           | 4 +---
>  drivers/i2c/busses/i2c-sirf.c           | 4 +---
>  drivers/i2c/busses/i2c-stu300.c         | 4 +---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c     | 4 +---
>  drivers/i2c/busses/i2c-synquacer.c      | 4 +---
>  drivers/i2c/busses/i2c-xlp9xx.c         | 4 +---
>  drivers/i2c/busses/i2c-xlr.c            | 4 +---
>  drivers/i2c/busses/i2c-zx2967.c         | 4 +---
>  24 files changed, 24 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 1de23b4f3809..7c4c836a3228 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -382,7 +382,6 @@ static const struct i2c_algorithm altr_i2c_algo = {
>  static int altr_i2c_probe(struct platform_device *pdev)
>  {
>  	struct altr_i2c_dev *idev = NULL;
> -	struct resource *res;
>  	int irq, ret;
>  	u32 val;
>  
> @@ -390,8 +389,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
>  	if (!idev)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	idev->base = devm_ioremap_resource(&pdev->dev, res);
> +	idev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(idev->base))
>  		return PTR_ERR(idev->base);
>  
> diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
> index 0214daa913ff..0aa0753e2430 100644
> --- a/drivers/i2c/busses/i2c-axxia.c
> +++ b/drivers/i2c/busses/i2c-axxia.c
> @@ -734,7 +734,6 @@ static int axxia_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct axxia_i2c_dev *idev = NULL;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret = 0;
>  
> @@ -742,8 +741,7 @@ static int axxia_i2c_probe(struct platform_device *pdev)
>  	if (!idev)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index 4e489a9d16fb..2bde3b5bad04 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -750,7 +750,6 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
>  	int rc = 0;
>  	struct bcm_kona_i2c_dev *dev;
>  	struct i2c_adapter *adap;
> -	struct resource *iomem;
>  
>  	/* Allocate memory for private data structure */
>  	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> @@ -762,8 +761,7 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
>  	init_completion(&dev->done);
>  
>  	/* Map hardware registers */
> -	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dev->base = devm_ioremap_resource(dev->device, iomem);
> +	dev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dev->base))
>  		return -ENOMEM;
>  
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index e3ceb256a380..232a7679b69b 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -761,7 +761,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  {
>  	struct davinci_i2c_dev *dev;
>  	struct i2c_adapter *adap;
> -	struct resource *mem;
>  	struct i2c_bus_recovery_info *rinfo;
>  	int r, irq;
>  
> @@ -814,8 +813,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(dev->clk))
>  		return PTR_ERR(dev->clk);
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dev->base = devm_ioremap_resource(&pdev->dev, mem);
> +	dev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dev->base)) {
>  		return PTR_ERR(dev->base);
>  	}
> diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
> index 3adf72540db1..c199ed3334f9 100644
> --- a/drivers/i2c/busses/i2c-digicolor.c
> +++ b/drivers/i2c/busses/i2c-digicolor.c
> @@ -291,7 +291,6 @@ static int dc_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct dc_i2c *i2c;
> -	struct resource *r;
>  	int ret = 0, irq;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct dc_i2c), GFP_KERNEL);
> @@ -312,8 +311,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->clk))
>  		return PTR_ERR(i2c->clk);
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->regs = devm_ioremap_resource(&pdev->dev, r);
> +	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->regs))
>  		return PTR_ERR(i2c->regs);
>  
> diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
> index 959d4912ec0d..1a319352e51b 100644
> --- a/drivers/i2c/busses/i2c-emev2.c
> +++ b/drivers/i2c/busses/i2c-emev2.c
> @@ -361,15 +361,13 @@ static const struct i2c_algorithm em_i2c_algo = {
>  static int em_i2c_probe(struct platform_device *pdev)
>  {
>  	struct em_i2c_device *priv;
> -	struct resource *r;
>  	int ret;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(&pdev->dev, r);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index e7514c16b756..5bf716df88f4 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -740,7 +740,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct exynos5_i2c *i2c;
> -	struct resource *mem;
>  	int ret;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct exynos5_i2c), GFP_KERNEL);
> @@ -766,8 +765,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
> +	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->regs)) {
>  		ret = PTR_ERR(i2c->regs);
>  		goto err_clk;
> diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
> index 224f830f77f9..4b72cb3b4231 100644
> --- a/drivers/i2c/busses/i2c-hix5hd2.c
> +++ b/drivers/i2c/busses/i2c-hix5hd2.c
> @@ -390,7 +390,6 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct hix5hd2_i2c_priv *priv;
> -	struct resource *mem;
>  	unsigned int freq;
>  	int irq, ret;
>  
> @@ -411,8 +410,7 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->regs = devm_ioremap_resource(&pdev->dev, mem);
> +	priv->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->regs))
>  		return PTR_ERR(priv->regs);
>  
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 20a4fbc53007..5e0022e55315 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1330,7 +1330,6 @@ static int img_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
>  	struct img_i2c *i2c;
> -	struct resource *res;
>  	int irq, ret;
>  	u32 val;
>  
> @@ -1338,8 +1337,7 @@ static int img_i2c_probe(struct platform_device *pdev)
>  	if (!i2c)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->base))
>  		return PTR_ERR(i2c->base);
>  
> diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
> index b426fc956938..ba831df6661e 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -763,7 +763,6 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
>  	int ret = 0;
>  	unsigned int clk_freq = 0;
>  	unsigned short tmp;
> -	struct resource *r;
>  	struct jz4780_i2c *i2c;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct jz4780_i2c), GFP_KERNEL);
> @@ -787,8 +786,7 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
>  	init_completion(&i2c->trans_waitq);
>  	spin_lock_init(&i2c->lock);
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->iomem = devm_ioremap_resource(&pdev->dev, r);
> +	i2c->iomem = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->iomem))
>  		return PTR_ERR(i2c->iomem);
>  
> diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
> index deea18b14add..30f6dd1d37c7 100644
> --- a/drivers/i2c/busses/i2c-lpc2k.c
> +++ b/drivers/i2c/busses/i2c-lpc2k.c
> @@ -346,7 +346,6 @@ static const struct i2c_algorithm i2c_lpc2k_algorithm = {
>  static int i2c_lpc2k_probe(struct platform_device *pdev)
>  {
>  	struct lpc2k_i2c *i2c;
> -	struct resource *res;
>  	u32 bus_clk_rate;
>  	u32 scl_high;
>  	u32 clkrate;
> @@ -356,8 +355,7 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
>  	if (!i2c)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->base))
>  		return PTR_ERR(i2c->base);
>  
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 06b3bed78421..b3bd869281d3 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -397,7 +397,6 @@ static int meson_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct meson_i2c *i2c;
> -	struct resource *mem;
>  	struct i2c_timings timings;
>  	int irq, ret = 0;
>  
> @@ -422,8 +421,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(i2c->clk);
>  	}
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
> +	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->regs))
>  		return PTR_ERR(i2c->regs);
>  
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index febb7c7ea72b..62fb1ecc84a2 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -877,7 +877,6 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  {
>  	struct mv64xxx_i2c_data		*drv_data;
>  	struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
> -	struct resource	*r;
>  	int	rc;
>  
>  	if ((!pdata && !pd->dev.of_node))
> @@ -888,8 +887,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	if (!drv_data)
>  		return -ENOMEM;
>  
> -	r = platform_get_resource(pd, IORESOURCE_MEM, 0);
> -	drv_data->reg_base = devm_ioremap_resource(&pd->dev, r);
> +	drv_data->reg_base = devm_platform_ioremap_resource(pd, 0);
>  	if (IS_ERR(drv_data->reg_base))
>  		return PTR_ERR(drv_data->reg_base);
>  
> diff --git a/drivers/i2c/busses/i2c-octeon-platdrv.c b/drivers/i2c/busses/i2c-octeon-platdrv.c
> index 64bda83e65ac..0c227963c8d6 100644
> --- a/drivers/i2c/busses/i2c-octeon-platdrv.c
> +++ b/drivers/i2c/busses/i2c-octeon-platdrv.c
> @@ -136,7 +136,6 @@ static int octeon_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
>  	int irq, result = 0, hlc_irq = 0;
> -	struct resource *res_mem;
>  	struct octeon_i2c *i2c;
>  	bool cn78xx_style;
>  
> @@ -167,8 +166,7 @@ static int octeon_i2c_probe(struct platform_device *pdev)
>  	i2c->roff.twsi_int = 0x10;
>  	i2c->roff.sw_twsi_ext = 0x18;
>  
> -	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->twsi_base = devm_ioremap_resource(&pdev->dev, res_mem);
> +	i2c->twsi_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->twsi_base)) {
>  		result = PTR_ERR(i2c->twsi_base);
>  		goto out;
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index b6b5a495118b..c9e7fcac12ae 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -399,15 +399,13 @@ static int owl_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct owl_i2c_dev *i2c_dev;
> -	struct resource *res;
>  	int ret, irq;
>  
>  	i2c_dev = devm_kzalloc(dev, sizeof(*i2c_dev), GFP_KERNEL);
>  	if (!i2c_dev)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c_dev->base = devm_ioremap_resource(dev, res);
> +	i2c_dev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c_dev->base))
>  		return PTR_ERR(i2c_dev->base);
>  
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 2d7dabe12723..940e9fcca8ec 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1665,7 +1665,6 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  	static const int blk_sizes[] = {4, 16, 32};
>  	struct qup_i2c_dev *qup;
>  	unsigned long one_bit_t;
> -	struct resource *res;
>  	u32 io_mode, hw_ver, size;
>  	int ret, fs_div, hs_div;
>  	u32 src_clk_freq = DEFAULT_SRC_CLK;
> @@ -1762,8 +1761,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	qup->base = devm_ioremap_resource(qup->dev, res);
> +	qup->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(qup->base))
>  		return PTR_ERR(qup->base);
>  
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 1a33007b03e9..862a26f66b76 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1193,7 +1193,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	const struct of_device_id *match;
>  	struct rk3x_i2c *i2c;
> -	struct resource *mem;
>  	int ret = 0;
>  	int bus_nr;
>  	u32 value;
> @@ -1223,8 +1222,7 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  	spin_lock_init(&i2c->lock);
>  	init_waitqueue_head(&i2c->wait);
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
> +	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->regs))
>  		return PTR_ERR(i2c->regs);
>  
> diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
> index fb7a046b3226..269a71b0ee7f 100644
> --- a/drivers/i2c/busses/i2c-sirf.c
> +++ b/drivers/i2c/busses/i2c-sirf.c
> @@ -272,7 +272,6 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>  {
>  	struct sirfsoc_i2c *siic;
>  	struct i2c_adapter *adap;
> -	struct resource *mem_res;
>  	struct clk *clk;
>  	int bitrate;
>  	int ctrl_speed;
> @@ -310,8 +309,7 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>  	adap = &siic->adapter;
>  	adap->class = I2C_CLASS_DEPRECATED;
>  
> -	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	siic->base = devm_ioremap_resource(&pdev->dev, mem_res);
> +	siic->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(siic->base)) {
>  		err = PTR_ERR(siic->base);
>  		goto out;
> diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
> index 42e0a53e7fa4..9a03779c149e 100644
> --- a/drivers/i2c/busses/i2c-stu300.c
> +++ b/drivers/i2c/busses/i2c-stu300.c
> @@ -860,7 +860,6 @@ static int stu300_probe(struct platform_device *pdev)
>  {
>  	struct stu300_dev *dev;
>  	struct i2c_adapter *adap;
> -	struct resource *res;
>  	int bus_nr;
>  	int ret = 0;
>  
> @@ -876,8 +875,7 @@ static int stu300_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->pdev = pdev;
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dev->virtbase = devm_ioremap_resource(&pdev->dev, res);
> +	dev->virtbase = devm_platform_ioremap_resource(pdev, 0);
>  	dev_dbg(&pdev->dev, "initialize bus device I2C%d on virtual "
>  		"base %p\n", bus_nr, dev->virtbase);
>  	if (IS_ERR(dev->virtbase))
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> index 7c07ce116e38..cb78c38ea3a6 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -187,7 +187,6 @@ static int p2wi_probe(struct platform_device *pdev)
>  	struct device_node *childnp;
>  	unsigned long parent_clk_freq;
>  	u32 clk_freq = 100000;
> -	struct resource *r;
>  	struct p2wi *p2wi;
>  	u32 slave_addr;
>  	int clk_div;
> @@ -231,8 +230,7 @@ static int p2wi_probe(struct platform_device *pdev)
>  		p2wi->slave_addr = slave_addr;
>  	}
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	p2wi->regs = devm_ioremap_resource(dev, r);
> +	p2wi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(p2wi->regs))
>  		return PTR_ERR(p2wi->regs);
>  
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index 86026798b4f7..be389e95b57a 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -536,7 +536,6 @@ static const struct i2c_adapter synquacer_i2c_ops = {
>  static int synquacer_i2c_probe(struct platform_device *pdev)
>  {
>  	struct synquacer_i2c *i2c;
> -	struct resource *r;
>  	u32 bus_speed;
>  	int ret;
>  
> @@ -574,8 +573,7 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	i2c->base = devm_ioremap_resource(&pdev->dev, r);
> +	i2c->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(i2c->base))
>  		return PTR_ERR(i2c->base);
>  
> diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
> index 8a873975cf12..beb2bb6905d6 100644
> --- a/drivers/i2c/busses/i2c-xlp9xx.c
> +++ b/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -504,15 +504,13 @@ static int xlp9xx_i2c_smbus_setup(struct xlp9xx_i2c_dev *priv,
>  static int xlp9xx_i2c_probe(struct platform_device *pdev)
>  {
>  	struct xlp9xx_i2c_dev *priv;
> -	struct resource *res;
>  	int err = 0;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> diff --git a/drivers/i2c/busses/i2c-xlr.c b/drivers/i2c/busses/i2c-xlr.c
> index 34cd4b308540..544fd9459d60 100644
> --- a/drivers/i2c/busses/i2c-xlr.c
> +++ b/drivers/i2c/busses/i2c-xlr.c
> @@ -362,7 +362,6 @@ static int xlr_i2c_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
>  	struct xlr_i2c_private  *priv;
> -	struct resource *res;
>  	struct clk *clk;
>  	unsigned long clk_rate;
>  	unsigned long clk_div;
> @@ -380,8 +379,7 @@ static int xlr_i2c_probe(struct platform_device *pdev)
>  	else
>  		priv->cfg = &xlr_i2c_config_default;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->iobase = devm_ioremap_resource(&pdev->dev, res);
> +	priv->iobase = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->iobase))
>  		return PTR_ERR(priv->iobase);
>  
> diff --git a/drivers/i2c/busses/i2c-zx2967.c b/drivers/i2c/busses/i2c-zx2967.c
> index 5f3318559b8d..8db9519695a6 100644
> --- a/drivers/i2c/busses/i2c-zx2967.c
> +++ b/drivers/i2c/busses/i2c-zx2967.c
> @@ -502,7 +502,6 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
>  {
>  	struct zx2967_i2c *i2c;
>  	void __iomem *reg_base;
> -	struct resource *res;
>  	struct clk *clk;
>  	int ret;
>  
> @@ -510,8 +509,7 @@ static int zx2967_i2c_probe(struct platform_device *pdev)
>  	if (!i2c)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base))
>  		return PTR_ERR(reg_base);
>  
> -- 
> 2.25.0
> 
