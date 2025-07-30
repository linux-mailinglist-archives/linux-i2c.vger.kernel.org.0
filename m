Return-Path: <linux-i2c+bounces-12089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF98B16603
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 20:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8AA17CB51
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 18:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99FA2DECBF;
	Wed, 30 Jul 2025 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S0KP4Rwv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD41D1DF98F;
	Wed, 30 Jul 2025 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898679; cv=none; b=SCe7Dg/Lx18Sg3I1OFgkjr1mdJARG694rgHbtzsjUs7lmpH2cF1Yvr5Gz8OjYqCDyE54JzG16lpyCU1JmuPjYj0mbStL6HGCMiIE1aX1wrVzx6veOWIeb8oTFSgOYJ+ck2a1fUFaa0WrmQ1zwdITBZr6fRcYWlAhI+KifApwxoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898679; c=relaxed/simple;
	bh=cbMS9OmeSERInvl7UM9IzHA/1kYbIyujkvyTsarEoyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX376fW1YTOI2YNpbWPUQa/Xr8INTFiGemLVRkZCk55Z3mTuEI/gCXYtKerJeM/dSuAgZXeJZsv2YBIuo2PSxf9b1+yXkgfhkZ7OJZ7Yqgzafe0cPYbTdY5I+A5bQalZH0vS4dOhuI62ywop2ekQFheHC49IiJVNXO6qMZr4qLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S0KP4Rwv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B2602C7A;
	Wed, 30 Jul 2025 20:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753898623;
	bh=cbMS9OmeSERInvl7UM9IzHA/1kYbIyujkvyTsarEoyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0KP4RwvjhhMCHmYAsXZhPvBAliHVBXvGmTOFn0QRy/xgBYQ37WjvUeDdDfOF8VqJ
	 4w+3CldYfOmcc+CTzsXf9EPW11/nspDIDvbpl3dvSt3rXoNsvxPu72ajfhRG3E6BLo
	 X1Fx2sy170lQ7HQmW8yy5kK+kVNDpQpNmz8aiJ2o=
Date: Wed, 30 Jul 2025 21:04:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?utf-8?Q?Am=C3=A9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel
 pass a cookie to of_xlate
Message-ID: <20250730180417.GC21430@pendragon.ideasonboard.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>

On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
> On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > The DMA subsystem attempts to make it theoretically possible to pair
> > any DMA block with any user. While that's convenient from a
> > codebase sanity perspective, some blocks are more intertwined.
> >
> > One such case is the Qualcomm GENI, where each wrapper contains a
> > number of Serial Engine instances, each one of which can be programmed
> > to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
> >
> > The GPI DMA it's designed together with, needs to receive the ID of the
> > protocol that's in use, to adjust its behavior accordingly. Currently,
> > that's done through passing that ID through device tree, with each
> > Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
> > dt-bindings that are full of useless copypasta.
> >
> > In a step to cut down on that, let the DMA user give the engine driver
> > a hint at request time.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/dma/amba-pl08x.c                       |  3 ++-
> >  drivers/dma/apple-admac.c                      |  3 ++-
> >  drivers/dma/at_hdmac.c                         |  6 ++++--
> >  drivers/dma/at_xdmac.c                         |  3 ++-
> >  drivers/dma/bcm2835-dma.c                      |  3 ++-
> >  drivers/dma/dma-jz4780.c                       |  3 ++-
> >  drivers/dma/dmaengine.c                        | 20 +++++++++++++++++---
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  3 ++-
> >  drivers/dma/dw/of.c                            |  3 ++-
> >  drivers/dma/ep93xx_dma.c                       |  6 ++++--
> >  drivers/dma/fsl-edma-main.c                    |  6 ++++--
> >  drivers/dma/img-mdc-dma.c                      |  3 ++-
> >  drivers/dma/imx-dma.c                          |  3 ++-
> >  drivers/dma/imx-sdma.c                         |  3 ++-
> >  drivers/dma/lgm/lgm-dma.c                      |  3 ++-
> >  drivers/dma/milbeaut-hdmac.c                   |  4 +++-
> >  drivers/dma/mmp_pdma.c                         |  3 ++-
> >  drivers/dma/mmp_tdma.c                         |  3 ++-
> >  drivers/dma/moxart-dma.c                       |  3 ++-
> >  drivers/dma/mxs-dma.c                          |  3 ++-
> >  drivers/dma/nbpfaxi.c                          |  3 ++-
> >  drivers/dma/of-dma.c                           | 18 +++++++++++-------
> >  drivers/dma/owl-dma.c                          |  3 ++-
> >  drivers/dma/pl330.c                            |  3 ++-
> >  drivers/dma/pxa_dma.c                          |  3 ++-
> >  drivers/dma/qcom/bam_dma.c                     |  3 ++-
> >  drivers/dma/qcom/gpi.c                         |  3 ++-
> >  drivers/dma/qcom/qcom_adm.c                    |  3 ++-
> >  drivers/dma/sh/rcar-dmac.c                     |  3 ++-
> >  drivers/dma/sh/rz-dmac.c                       |  3 ++-
> >  drivers/dma/sh/usb-dmac.c                      |  3 ++-
> >  drivers/dma/st_fdma.c                          |  3 ++-
> >  drivers/dma/ste_dma40.c                        |  3 ++-
> >  drivers/dma/stm32/stm32-dma.c                  |  3 ++-
> >  drivers/dma/stm32/stm32-dma3.c                 |  4 +++-
> >  drivers/dma/stm32/stm32-mdma.c                 |  3 ++-
> >  drivers/dma/sun4i-dma.c                        |  3 ++-
> >  drivers/dma/sun6i-dma.c                        |  3 ++-
> >  drivers/dma/tegra186-gpc-dma.c                 |  3 ++-
> >  drivers/dma/tegra20-apb-dma.c                  |  3 ++-
> >  drivers/dma/tegra210-adma.c                    |  3 ++-
> >  drivers/dma/ti/cppi41.c                        |  3 ++-
> >  drivers/dma/ti/edma.c                          |  3 ++-
> >  drivers/dma/ti/k3-udma.c                       |  3 ++-
> >  drivers/dma/uniphier-xdmac.c                   |  3 ++-
> >  drivers/dma/xilinx/xilinx_dma.c                |  3 ++-
> >  drivers/dma/xilinx/xilinx_dpdma.c              |  3 ++-
> >  drivers/dma/xilinx/zynqmp_dma.c                |  3 ++-
> >  include/linux/dmaengine.h                      |  7 +++++++
> >  include/linux/of_dma.h                         | 16 +++++++++-------
> >  sound/soc/apple/mca.c                          |  2 +-
> >  sound/soc/renesas/rcar/dma.c                   |  2 +-
> >  52 files changed, 146 insertions(+), 68 deletions(-)
> >
> > diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> 
> ...
> 
> >  						const char *name)
> >  {
> > diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> > index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
> > --- a/include/linux/of_dma.h
> > +++ b/include/linux/of_dma.h
> > @@ -19,7 +19,7 @@ struct of_dma {
> >  	struct list_head	of_dma_controllers;
> >  	struct device_node	*of_node;
> >  	struct dma_chan		*(*of_dma_xlate)
> > -				(struct of_phandle_args *, struct of_dma *);
> > +				(struct of_phandle_args *, struct of_dma *, void *);
> 
> I suggest pass down more informaiton, like client's dev point. So we can
> auto create device link between client's dev and dma chan's device.

Is .of_dma_xlate() really the right place to do that ? If you want to
create a device link for PM reasons, isn't it better created when the
channel is requested ? It should also be removed when the channel is
freed.

> 
> DMA Engineer device
>    DMA chan device
>        consumer clients' device.
> 
> If consumer device runtime pm suspend can auto trigger DMA chan's device's
> runtime pm function.
> 
> It will simplifly DMA engine's run time pm manage. Currently many DMA run
> time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
> free channel.  But many devices request dma channel at probe, which make
> dma engine work at always 'on' state.
> 
> But ideally, dma chan should be resume only when it is used to transfer.

This is exactly what I was going to mention after reading the last
paragraph. Is there anything that prevents a DMA engine driver to
perform a rutime PM get() when a transfer is submitted and a put() when
it completes ? (Logically speaking, the actual implementation would
likely be a bit different in drivers, but the result would be similar.)

> >  	void			*(*of_dma_route_allocate)
> >  				(struct of_phandle_args *, struct of_dma *);
> >  	struct dma_router	*dma_router;
> > @@ -34,7 +34,7 @@ struct of_dma_filter_info {
> >  #ifdef CONFIG_DMA_OF
> >  extern int of_dma_controller_register(struct device_node *np,
> >  		struct dma_chan *(*of_dma_xlate)
> > -		(struct of_phandle_args *, struct of_dma *),
> > +		(struct of_phandle_args *, struct of_dma *, void *),
> >  		void *data);
> >  extern void of_dma_controller_free(struct device_node *np);
> >
> > @@ -45,16 +45,17 @@ extern int of_dma_router_register(struct device_node *np,
> >  #define of_dma_router_free of_dma_controller_free
> >
> >  extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> > -						     const char *name);
> > +						     const char *name,
> > +						     void *data);
> >  extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
> > -		struct of_dma *ofdma);
> > +		struct of_dma *ofdma, void *data);
> >  extern struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
> > -		struct of_dma *ofdma);
> > +		struct of_dma *ofdma, void *data);
> >
> >  #else
> >  static inline int of_dma_controller_register(struct device_node *np,
> >  		struct dma_chan *(*of_dma_xlate)
> > -		(struct of_phandle_args *, struct of_dma *),
> > +		(struct of_phandle_args *, struct of_dma *, void *),
> >  		void *data)
> >  {
> >  	return -ENODEV;
> > @@ -75,7 +76,8 @@ static inline int of_dma_router_register(struct device_node *np,
> >  #define of_dma_router_free of_dma_controller_free
> >
> >  static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> > -						     const char *name)
> > +							    const char *name,
> > +							    void *data)
> >  {
> >  	return ERR_PTR(-ENODEV);
> >  }
> > diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> > index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..43d48e4ac8161ee9955120fe64f7b911bfdfe1ca 100644
> > --- a/sound/soc/apple/mca.c
> > +++ b/sound/soc/apple/mca.c
> > @@ -926,7 +926,7 @@ static struct dma_chan *mca_request_dma_channel(struct mca_cluster *cl, unsigned
> >  	char *name = devm_kasprintf(cl->host->dev, GFP_KERNEL,
> >  				    is_tx ? "tx%da" : "rx%db", cl->no);
> >  #endif
> > -	return of_dma_request_slave_channel(cl->host->dev->of_node, name);
> > +	return of_dma_request_slave_channel(cl->host->dev->of_node, name, NULL);
> >
> >  }
> >
> > diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> > index 2035ce06fe4c4aeaa8620d817910a5319732fa58..dcbff2fc61a0472adea226371016a128563b3cd0 100644
> > --- a/sound/soc/renesas/rcar/dma.c
> > +++ b/sound/soc/renesas/rcar/dma.c
> > @@ -204,7 +204,7 @@ struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *nam
> >  		}
> >
> >  		if (i == rsnd_mod_id_raw(mod) && (!chan))
> > -			chan = of_dma_request_slave_channel(np, x);
> > +			chan = of_dma_request_slave_channel(np, x, NULL);
> >  		i++;
> >  	}
> >

-- 
Regards,

Laurent Pinchart

