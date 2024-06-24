Return-Path: <linux-i2c+bounces-4290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16B91422E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 07:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAC41C21CAA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 05:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5605E18044;
	Mon, 24 Jun 2024 05:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sz4Qa+Wi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D118827;
	Mon, 24 Jun 2024 05:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207544; cv=none; b=PVvuKPkuqSUOCdOneczLD9jCVe/vrZy4RSVG3uBjgR0iUmpyEEdQv+dRa7BH8eLgiY6Z0r+z9UBuae5O+rTyVqg/Y8Cu0cyf1Crw9brfpwV35Af5HZic+siEIyDTzHztcTAQiWCK4YgdHr4vuvGNlCOqBBg63vGX+MnOnNUAh94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207544; c=relaxed/simple;
	bh=jJ/Xhogs+nACCcEGlLfB6HJx/oX5Us+Ij/qie1qauF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeygM/93ARaBVrO31SYqXilVODhwTKsvH6dPyBhUR1YHZXi3h1mKCbth4KVdXcEWIFQxfHJF9uboS6mFYlDDy6/T62rXqIRAQdv2Jfkj3wSSFREda2xKrlMugABTU2sdzdhStdzA5c40ycyf8cCHG5fx4YNA9Q0EKn7iDEbRqTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sz4Qa+Wi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15F4C2BBFC;
	Mon, 24 Jun 2024 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719207543;
	bh=jJ/Xhogs+nACCcEGlLfB6HJx/oX5Us+Ij/qie1qauF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sz4Qa+WiiSVBfHghGys3is+d97crwImMZeX7km8DzqnirbEPwfFZiUsmg6QqCM+N6
	 c3c9aY7v1tMgkJLVofzfYgrdifCkut9gb4NmvmjJRWjmnT6OYukYuIyWAQEhngcX4F
	 O8/e/Z44xYgaTJz/QYq9RKcZvEoLmyQ3jf8pDlTBkg74DTdqTZnQoZsWorOW4NgJvh
	 xvLb//6rdSGgcpcwEunLcd0qoLukSM6AWY9RA2dcg61pLa34v87nkJNg60bx1O9K6A
	 Hwy8zWgE3SCaqvfHiFzOcl+K9aM7hfFXbQXNEPSrtRPKdZ/UjFUoVfxDApoXdr8U6V
	 K+8UhvHhXxQsg==
Date: Mon, 24 Jun 2024 11:08:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
Message-ID: <ZnkGcwd8M1QFfmxl@matsya>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>

Hi Piotr,

Any reason why dmaengine parts cant be sent separately, why are they
clubbed together, I dont see any obvious dependencies...

On 20-06-24, 19:56, Piotr Wojtaszczyk wrote:
> LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer,
> this driver allows to route a signal request line thru the multiplexer for
> given peripheral.

What is the difference b/w this and lpc18xx driver, why not reuse that
one?

> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v4:
> - This patch is new in v4
> 
>  MAINTAINERS                  |   1 +
>  drivers/dma/Kconfig          |   9 ++
>  drivers/dma/Makefile         |   1 +
>  drivers/dma/lpc32xx-dmamux.c | 195 +++++++++++++++++++++++++++++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 drivers/dma/lpc32xx-dmamux.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fadf1baafd89..5ffe988ee282 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2403,6 +2403,7 @@ R:	Vladimir Zapolskiy <vz@mleia.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> +F:	drivers/dma/lpc32xx-dmamux.c
>  N:	lpc32xx
>  
>  ARM/Marvell Dove/MV78xx0/Orion SOC support
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 002a5ec80620..aeace3d7e066 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -378,6 +378,15 @@ config LPC18XX_DMAMUX
>  	  Enable support for DMA on NXP LPC18xx/43xx platforms
>  	  with PL080 and multiplexed DMA request lines.
>  
> +config LPC32XX_DMAMUX
> +	bool "NXP LPC32xx DMA MUX for PL080"
> +	depends on ARCH_LPC32XX || COMPILE_TEST
> +	depends on OF && AMBA_PL08X
> +	select MFD_SYSCON
> +	help
> +	  Support for PL080 multiplexed DMA request lines on
> +	  LPC32XX platrofm.
> +
>  config LS2X_APB_DMA
>  	tristate "Loongson LS2X APB DMA support"
>  	depends on LOONGARCH || COMPILE_TEST
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 802ca916f05f..6f1350b62e7f 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
>  obj-y += idxd/
>  obj-$(CONFIG_K3_DMA) += k3dma.o
>  obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
> +obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
>  obj-$(CONFIG_LS2X_APB_DMA) += ls2x-apb-dma.o
>  obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
>  obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
> diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
> new file mode 100644
> index 000000000000..4e6ce6026164
> --- /dev/null
> +++ b/drivers/dma/lpc32xx-dmamux.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright 2024 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
> +//
> +// Based on TI DMA Crossbar driver by:
> +//   Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
> +//   Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#define LPC32XX_SSP_CLK_CTRL 0x78
> +#define LPC32XX_I2S_CLK_CTRL 0x7c
> +
> +struct lpc32xx_dmamux {
> +	int signal;
> +	char *name_sel0;
> +	char *name_sel1;
> +	int muxval;
> +	int muxreg;
> +	int bit;
> +	bool busy;
> +};
> +
> +/* From LPC32x0 User manual "3.2.1 DMA request signals" */
> +static struct lpc32xx_dmamux lpc32xx_muxes[] = {
> +	{
> +		.signal = 3,
> +		.name_sel0 = "spi2-rx-tx",
> +		.name_sel1 = "ssp1-rx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 5,
> +	},
> +	{
> +		.signal = 10,
> +		.name_sel0 = "uart7-rx",
> +		.name_sel1 = "i2s1-dma1",
> +		.muxreg = LPC32XX_I2S_CLK_CTRL,
> +		.bit = 4,
> +	},
> +	{
> +		.signal = 11,
> +		.name_sel0 = "spi1-rx-tx",
> +		.name_sel1 = "ssp1-tx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 4,
> +	},
> +	{
> +		.signal = 14,
> +		.name_sel0 = "none",
> +		.name_sel1 = "ssp0-rx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 3,
> +	},
> +	{
> +		.signal = 15,
> +		.name_sel0 = "none",
> +		.name_sel1 = "ssp0-tx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 2,
> +	},
> +};
> +
> +struct lpc32xx_dmamux_data {
> +	struct dma_router dmarouter;
> +	struct regmap *reg;
> +	spinlock_t lock; /* protects busy status flag */
> +};
> +
> +static void lpc32xx_dmamux_release(struct device *dev, void *route_data)
> +{
> +	struct lpc32xx_dmamux_data *dmamux = dev_get_drvdata(dev);
> +	struct lpc32xx_dmamux *mux = route_data;
> +	unsigned long flags;
> +
> +	dev_dbg(dev, "releasing dma request signal %d routed to %s\n",
> +		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
> +
> +	guard(spinlock)(&dmamux->lock);
> +
> +	mux->busy = false;
> +}
> +
> +static void *lpc32xx_dmamux_reserve(struct of_phandle_args *dma_spec,
> +				    struct of_dma *ofdma)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> +	struct device *dev = &pdev->dev;
> +	struct lpc32xx_dmamux_data *dmamux = platform_get_drvdata(pdev);
> +	unsigned long flags;
> +	struct lpc32xx_dmamux *mux = NULL;
> +	int i;
> +
> +	if (dma_spec->args_count != 3) {
> +		dev_err(&pdev->dev, "invalid number of dma mux args\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(lpc32xx_muxes); i++) {
> +		if (lpc32xx_muxes[i].signal == dma_spec->args[0])
> +			mux = &lpc32xx_muxes[i];
> +	}
> +	if (!mux) {
> +		dev_err(&pdev->dev, "invalid mux request number: %d\n",
> +			dma_spec->args[0]);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (dma_spec->args[2] > 1) {
> +		dev_err(&pdev->dev, "invalid dma mux value: %d\n",
> +			dma_spec->args[1]);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* The of_node_put() will be done in the core for the node */
> +	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
> +	if (!dma_spec->np) {
> +		dev_err(&pdev->dev, "can't get dma master\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	spin_lock_irqsave(&dmamux->lock, flags);
> +	if (mux->busy) {
> +		spin_unlock_irqrestore(&dmamux->lock, flags);
> +		dev_err(dev, "dma request signal %d busy, routed to %s\n",
> +			mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
> +		of_node_put(dma_spec->np);
> +		return ERR_PTR(-EBUSY);
> +	}
> +
> +	mux->busy = true;
> +	mux->muxval = dma_spec->args[2] ? BIT(mux->bit) : 0;
> +
> +	regmap_update_bits(dmamux->reg, mux->muxreg, BIT(mux->bit), mux->muxval);
> +	spin_unlock_irqrestore(&dmamux->lock, flags);
> +
> +	dma_spec->args[2] = 0;
> +	dma_spec->args_count = 2;
> +
> +	dev_dbg(dev, "dma request signal %d routed to %s\n",
> +		mux->signal, mux->muxval ? mux->name_sel1 : mux->name_sel1);
> +
> +	return mux;
> +}
> +
> +static int lpc32xx_dmamux_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct lpc32xx_dmamux_data *dmamux;
> +	int ret;
> +
> +	dmamux = devm_kzalloc(&pdev->dev, sizeof(*dmamux), GFP_KERNEL);
> +	if (!dmamux)
> +		return -ENOMEM;
> +
> +	dmamux->reg = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(dmamux->reg)) {
> +		dev_err(&pdev->dev, "syscon lookup failed\n");
> +		return PTR_ERR(dmamux->reg);
> +	}
> +
> +	spin_lock_init(&dmamux->lock);
> +	platform_set_drvdata(pdev, dmamux);
> +	dmamux->dmarouter.dev = &pdev->dev;
> +	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
> +
> +	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
> +				      &dmamux->dmarouter);
> +}
> +
> +static const struct of_device_id lpc32xx_dmamux_match[] = {
> +	{ .compatible = "nxp,lpc3220-dmamux" },
> +	{},
> +};
> +
> +static struct platform_driver lpc32xx_dmamux_driver = {
> +	.probe	= lpc32xx_dmamux_probe,
> +	.driver = {
> +		.name = "lpc32xx-dmamux",
> +		.of_match_table = lpc32xx_dmamux_match,
> +	},
> +};
> +
> +static int __init lpc32xx_dmamux_init(void)
> +{
> +	return platform_driver_register(&lpc32xx_dmamux_driver);
> +}
> +arch_initcall(lpc32xx_dmamux_init);
> -- 
> 2.25.1

-- 
~Vinod

