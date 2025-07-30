Return-Path: <linux-i2c+bounces-12076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3431B15BD6
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E73F87A76EE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C5C276058;
	Wed, 30 Jul 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNrZk2Iu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D132B19D065;
	Wed, 30 Jul 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868105; cv=none; b=hqlZdfPKeO3M+JZW+aIBR8KoRacZDOqhm1cfiCM7900nc2YAQhQtISkRu1P/InCSVKW9tww5VIyTbQM4W1FVaAx2O8wZ6NyhXXnL2+stvWFykA8L5mMsJYSt2yrxauLp0pVrOcSBPG9bhuA5WWsTquNu5zyo2clXTiKoXi+S4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868105; c=relaxed/simple;
	bh=10sLARnF5eV8ok4Slb1wNTcF5Nxs+ckq8ULmadkCi0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcC5CbRmeD5Gj2elroWjw8nYe5wc74YKUpZRikV0J7epYJ+Gvz4MbDwCS90u7xatrU7cF4rYdgs//9TyA/q2R1kiaTsT4UgECdMUBH3x5Rp/Jrlfk0Pw0Jf8MEaztZRXOKkNcS2TusuTp+Z+S863/ND7Vdre3Z2DP653hm0FuOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNrZk2Iu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743F1C4CEE7;
	Wed, 30 Jul 2025 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868104;
	bh=10sLARnF5eV8ok4Slb1wNTcF5Nxs+ckq8ULmadkCi0M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XNrZk2Iuy+OR4AC7IwARnDMs9nPmYpwX0wdGRAOoTlKGxcUz4ZCGXrIDVSFu5rYOL
	 f9ypzOFS0/BoyFRdxfm1mwE+CHbn2l8rrw83AktBeuB9aqMcLI+0MENm5FWLj19bfq
	 uzKl8jxsyqL0tS7siFhaVMjFNmzgTRwwFOOXbHAtw8GtWiGUaEj4hskhjfz8fPrRRL
	 jgbXighXs2535Bdp+dti2rmK3vLTBb9jzcvMjjhI5xrK4kV+kvBgDhabeHZOVGUT45
	 xxSbfE7ngED13yjtOSPtSH2QWqX+XmUau8Mse5a8OffW52LJYS8hBKQhmoTsLUZX+o
	 wIXEQ6TliPLPA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:29 +0200
Subject: [PATCH RFC 2/6] dmaengine: Make of_dma_request_slave_channel pass
 a cookie to of_xlate
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=41147;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9tS9fZeoHZSXBaYSdbV1jPZpu0UonCsud5z1b5FfPkA=;
 b=CSlwdyd8BXid7PbifYgkiQoJzLvbhBosOEFKzxAQ2ykBlPZmwvmzv8kaBt3QbC9LWJhp0Z4n1
 7HfOQz+2yzFDpConPJUype0GI4VKqhzIuxuTq0VxSHjjjLMiFob/G+O
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The DMA subsystem attempts to make it theoretically possible to pair
any DMA block with any user. While that's convenient from a
codebase sanity perspective, some blocks are more intertwined.

One such case is the Qualcomm GENI, where each wrapper contains a
number of Serial Engine instances, each one of which can be programmed
to support a different protocol (such as I2C, I3C, SPI, UART, etc.).

The GPI DMA it's designed together with, needs to receive the ID of the
protocol that's in use, to adjust its behavior accordingly. Currently,
that's done through passing that ID through device tree, with each
Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
dt-bindings that are full of useless copypasta.

In a step to cut down on that, let the DMA user give the engine driver
a hint at request time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/dma/amba-pl08x.c                       |  3 ++-
 drivers/dma/apple-admac.c                      |  3 ++-
 drivers/dma/at_hdmac.c                         |  6 ++++--
 drivers/dma/at_xdmac.c                         |  3 ++-
 drivers/dma/bcm2835-dma.c                      |  3 ++-
 drivers/dma/dma-jz4780.c                       |  3 ++-
 drivers/dma/dmaengine.c                        | 20 +++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  3 ++-
 drivers/dma/dw/of.c                            |  3 ++-
 drivers/dma/ep93xx_dma.c                       |  6 ++++--
 drivers/dma/fsl-edma-main.c                    |  6 ++++--
 drivers/dma/img-mdc-dma.c                      |  3 ++-
 drivers/dma/imx-dma.c                          |  3 ++-
 drivers/dma/imx-sdma.c                         |  3 ++-
 drivers/dma/lgm/lgm-dma.c                      |  3 ++-
 drivers/dma/milbeaut-hdmac.c                   |  4 +++-
 drivers/dma/mmp_pdma.c                         |  3 ++-
 drivers/dma/mmp_tdma.c                         |  3 ++-
 drivers/dma/moxart-dma.c                       |  3 ++-
 drivers/dma/mxs-dma.c                          |  3 ++-
 drivers/dma/nbpfaxi.c                          |  3 ++-
 drivers/dma/of-dma.c                           | 18 +++++++++++-------
 drivers/dma/owl-dma.c                          |  3 ++-
 drivers/dma/pl330.c                            |  3 ++-
 drivers/dma/pxa_dma.c                          |  3 ++-
 drivers/dma/qcom/bam_dma.c                     |  3 ++-
 drivers/dma/qcom/gpi.c                         |  3 ++-
 drivers/dma/qcom/qcom_adm.c                    |  3 ++-
 drivers/dma/sh/rcar-dmac.c                     |  3 ++-
 drivers/dma/sh/rz-dmac.c                       |  3 ++-
 drivers/dma/sh/usb-dmac.c                      |  3 ++-
 drivers/dma/st_fdma.c                          |  3 ++-
 drivers/dma/ste_dma40.c                        |  3 ++-
 drivers/dma/stm32/stm32-dma.c                  |  3 ++-
 drivers/dma/stm32/stm32-dma3.c                 |  4 +++-
 drivers/dma/stm32/stm32-mdma.c                 |  3 ++-
 drivers/dma/sun4i-dma.c                        |  3 ++-
 drivers/dma/sun6i-dma.c                        |  3 ++-
 drivers/dma/tegra186-gpc-dma.c                 |  3 ++-
 drivers/dma/tegra20-apb-dma.c                  |  3 ++-
 drivers/dma/tegra210-adma.c                    |  3 ++-
 drivers/dma/ti/cppi41.c                        |  3 ++-
 drivers/dma/ti/edma.c                          |  3 ++-
 drivers/dma/ti/k3-udma.c                       |  3 ++-
 drivers/dma/uniphier-xdmac.c                   |  3 ++-
 drivers/dma/xilinx/xilinx_dma.c                |  3 ++-
 drivers/dma/xilinx/xilinx_dpdma.c              |  3 ++-
 drivers/dma/xilinx/zynqmp_dma.c                |  3 ++-
 include/linux/dmaengine.h                      |  7 +++++++
 include/linux/of_dma.h                         | 16 +++++++++-------
 sound/soc/apple/mca.c                          |  2 +-
 sound/soc/renesas/rcar/dma.c                   |  2 +-
 52 files changed, 146 insertions(+), 68 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 38cdbca59485ca22fbe2aa4c786c1d4a69bf8a86..6427367dd459d98a032bded3e915e989e3c4a699 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2529,7 +2529,8 @@ static struct dma_chan *pl08x_find_chan_id(struct pl08x_driver_data *pl08x,
 }
 
 static struct dma_chan *pl08x_of_xlate(struct of_phandle_args *dma_spec,
-				       struct of_dma *ofdma)
+				       struct of_dma *ofdma,
+				       void *data)
 {
 	struct pl08x_driver_data *pl08x = ofdma->of_dma_data;
 	struct dma_chan *dma_chan;
diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index bd49f03742912198804a02a22e38da2c21093761..58507b9dab8c33defe60fa526f7b9dd34a18f6e5 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -579,7 +579,8 @@ static void admac_free_chan_resources(struct dma_chan *chan)
 }
 
 static struct dma_chan *admac_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct admac_data *ad = (struct admac_data *) ofdma->of_dma_data;
 	unsigned int index;
diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 2d147712cbc69b5d296001a4e50cf46277798b89..137409c33441b6bb338c552875f01fc67825e8ef 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1794,7 +1794,8 @@ static bool at_dma_filter(struct dma_chan *chan, void *slave)
 }
 
 static struct dma_chan *at_dma_xlate(struct of_phandle_args *dma_spec,
-				     struct of_dma *of_dma)
+				     struct of_dma *of_dma,
+				     void *data)
 {
 	struct dma_chan *chan;
 	struct at_dma_chan *atchan;
@@ -1861,7 +1862,8 @@ static struct dma_chan *at_dma_xlate(struct of_phandle_args *dma_spec,
 }
 #else
 static struct dma_chan *at_dma_xlate(struct of_phandle_args *dma_spec,
-				     struct of_dma *of_dma)
+				     struct of_dma *of_dma,
+				     void *data)
 {
 	return NULL;
 }
diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 3fbc74710a1336dfb0420fffdc9a1952da1a8f95..9f4c93cbc738e41fcf9042b2f974f8abde8a58f7 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -633,7 +633,8 @@ static inline void at_xdmac_increment_block_count(struct dma_chan *chan,
 }
 
 static struct dma_chan *at_xdmac_xlate(struct of_phandle_args *dma_spec,
-				       struct of_dma *of_dma)
+				       struct of_dma *of_dma,
+				       void *data)
 {
 	struct at_xdmac		*atxdmac = of_dma->of_dma_data;
 	struct at_xdmac_chan	*atchan;
diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0117bb2e8591be630d6682e9625574a1bcc80515..87069bca16328a29a175ab3f9b239f08149ad396 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -860,7 +860,8 @@ static const struct of_device_id bcm2835_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
 
 static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
-					   struct of_dma *ofdma)
+					  struct of_dma *ofdma,
+					  void *data)
 {
 	struct bcm2835_dmadev *d = ofdma->of_dma_data;
 	struct dma_chan *chan;
diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 100057603fd4e1c4f11b678e5cf66517a509ec9b..b41d0b7ab936673812c0047e22dbbf1e743176f1 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -803,7 +803,8 @@ static bool jz4780_dma_filter_fn(struct dma_chan *chan, void *param)
 }
 
 static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
-	struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct jz4780_dma_dev *jzdma = ofdma->of_dma_data;
 	dma_cap_mask_t mask = jzdma->dma_device.cap_mask;
diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index ca13cd39330ba4d822baaab412356a166b656350..a3f14c4da906e95a4dda07f09b2b2e19b3bab22d 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -806,20 +806,21 @@ static const struct dma_slave_map *dma_filter_match(struct dma_device *device,
 }
 
 /**
- * dma_request_chan - try to allocate an exclusive slave channel
+ * dma_request_chan_w_data - try to allocate an exclusive slave channel, with extra data
  * @dev:	pointer to client device structure
  * @name:	slave channel name
+ * @data:	pointer to producer-consumer specific data
  *
  * Returns pointer to appropriate DMA channel on success or an error pointer.
  */
-struct dma_chan *dma_request_chan(struct device *dev, const char *name)
+struct dma_chan *dma_request_chan_w_data(struct device *dev, const char *name, void *data)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct dma_device *d, *_d;
 	struct dma_chan *chan = NULL;
 
 	if (is_of_node(fwnode))
-		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
+		chan = of_dma_request_slave_channel(to_of_node(fwnode), name, data);
 	else if (is_acpi_device_node(fwnode))
 		chan = acpi_dma_request_slave_chan_by_name(dev, name);
 
@@ -871,6 +872,19 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 
 	return chan;
 }
+EXPORT_SYMBOL_GPL(dma_request_chan_w_data);
+
+/**
+ * dma_request_chan - try to allocate an exclusive slave channel
+ * @dev:	pointer to client device structure
+ * @name:	slave channel name
+ *
+ * Returns pointer to appropriate DMA channel on success or an error pointer.
+ */
+struct dma_chan *dma_request_chan(struct device *dev, const char *name)
+{
+	return dma_request_chan_w_data(dev, name, NULL);
+}
 EXPORT_SYMBOL_GPL(dma_request_chan);
 
 /**
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7ccb59fa1363f500f742a41b7631f..fba3cc34a91d1017f4a5f69028e85a028bd9f94b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1358,7 +1358,8 @@ static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
 }
 
 static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct dw_axi_dma *dw = ofdma->of_dma_data;
 	struct axi_dma_chan *chan;
diff --git a/drivers/dma/dw/of.c b/drivers/dma/dw/of.c
index 523ca806837cb3c028f2ae7c1b3b7be7275344f1..92c320542fa6e9d60ac7abbda9ac8ec207017d34 100644
--- a/drivers/dma/dw/of.c
+++ b/drivers/dma/dw/of.c
@@ -14,7 +14,8 @@
 #include "internal.h"
 
 static struct dma_chan *dw_dma_of_xlate(struct of_phandle_args *dma_spec,
-					struct of_dma *ofdma)
+					struct of_dma *ofdma,
+					void *data)
 {
 	struct dw_dma *dw = ofdma->of_dma_data;
 	struct dw_dma_slave slave = {
diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index e424bb5c40e79c5784437c5b6e259c340fb30432..81e66580911c7894cad9558106a497f4a4c59bd4 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1443,7 +1443,8 @@ static bool ep93xx_m2p_dma_filter(struct dma_chan *chan, void *filter_param)
 }
 
 static struct dma_chan *ep93xx_m2p_dma_of_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+						struct of_dma *ofdma,
+						void *data)
 {
 	struct ep93xx_dma_engine *edma = ofdma->of_dma_data;
 	dma_cap_mask_t mask = edma->dma_dev.cap_mask;
@@ -1474,7 +1475,8 @@ static bool ep93xx_m2m_dma_filter(struct dma_chan *chan, void *filter_param)
 }
 
 static struct dma_chan *ep93xx_m2m_dma_of_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+						struct of_dma *ofdma,
+						void *data)
 {
 	struct ep93xx_dma_engine *edma = ofdma->of_dma_data;
 	dma_cap_mask_t mask = edma->dma_dev.cap_mask;
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 97583c7d51a2e8e7a50c7eb4f5ff0582ac95798d..e9b2441779cee3278f0ab03c6a957c00a7f8d0be 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -249,7 +249,8 @@ static bool fsl_edma_srcid_in_use(struct fsl_edma_engine *fsl_edma, u32 srcid)
 }
 
 static struct dma_chan *fsl_edma_xlate(struct of_phandle_args *dma_spec,
-		struct of_dma *ofdma)
+				       struct of_dma *ofdma,
+				       void *data)
 {
 	struct fsl_edma_engine *fsl_edma = ofdma->of_dma_data;
 	struct dma_chan *chan, *_chan;
@@ -292,7 +293,8 @@ static struct dma_chan *fsl_edma_xlate(struct of_phandle_args *dma_spec,
 }
 
 static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
-					struct of_dma *ofdma)
+					struct of_dma *ofdma,
+					void *data)
 {
 	struct fsl_edma_engine *fsl_edma = ofdma->of_dma_data;
 	struct dma_chan *chan, *_chan;
diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index fd55bcd060ab89e7a871e4db26c4519985e90c2b..88a304af3ed2adfbb9566f161d8b12c39d7ce86a 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -805,7 +805,8 @@ static irqreturn_t mdc_chan_irq(int irq, void *dev_id)
 }
 
 static struct dma_chan *mdc_of_xlate(struct of_phandle_args *dma_spec,
-				     struct of_dma *ofdma)
+				     struct of_dma *ofdma,
+				     void *data)
 {
 	struct mdc_dma *mdma = ofdma->of_dma_data;
 	struct dma_chan *chan;
diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ba434657059a8b984849a058afa501a89320d494..d0bd11f73f74f59af2e4bf96d187fde459262e22 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -1016,7 +1016,8 @@ static bool imxdma_filter_fn(struct dma_chan *chan, void *param)
 }
 
 static struct dma_chan *imxdma_xlate(struct of_phandle_args *dma_spec,
-						struct of_dma *ofdma)
+				     struct of_dma *ofdma,
+				     void *data)
 {
 	int count = dma_spec->args_count;
 	struct imxdma_engine *imxdma = ofdma->of_dma_data;
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 02a85d6f1bea2df7d355858094c0c0b0bd07148e..76dbe21cfa2bf97c5fac0ef7e6c4f73927c9d7de 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2207,7 +2207,8 @@ static bool sdma_filter_fn(struct dma_chan *chan, void *fn_param)
 }
 
 static struct dma_chan *sdma_xlate(struct of_phandle_args *dma_spec,
-				   struct of_dma *ofdma)
+				   struct of_dma *ofdma,
+				   void *data)
 {
 	struct sdma_engine *sdma = ofdma->of_dma_data;
 	dma_cap_mask_t mask = sdma->dma_device.cap_mask;
diff --git a/drivers/dma/lgm/lgm-dma.c b/drivers/dma/lgm/lgm-dma.c
index 8173c3f1075a629f54bb6172b9afd3579e51a91b..b51070fd2a7480321ac59258903200ae0bc0ecf0 100644
--- a/drivers/dma/lgm/lgm-dma.c
+++ b/drivers/dma/lgm/lgm-dma.c
@@ -1382,7 +1382,8 @@ update_client_configs(struct of_dma *ofdma, struct of_phandle_args *spec)
 }
 
 static struct dma_chan *ldma_xlate(struct of_phandle_args *spec,
-				   struct of_dma *ofdma)
+				   struct of_dma *ofdma,
+				   void *data)
 {
 	struct ldma_dev *d = ofdma->of_dma_data;
 	u32 chan_id =  spec->args[0];
diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
index 9a5ec247ed6d924f364e9232e8a6de5476db7825..b4cdb707303264224977e5e876a8fd5fd42d9eb5 100644
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -400,7 +400,9 @@ static void milbeaut_hdmac_desc_free(struct virt_dma_desc *vd)
 }
 
 static struct dma_chan *
-milbeaut_hdmac_xlate(struct of_phandle_args *dma_spec, struct of_dma *of_dma)
+milbeaut_hdmac_xlate(struct of_phandle_args *dma_spec,
+		     struct of_dma *of_dma,
+		     void *data)
 {
 	struct milbeaut_hdmac_device *mdev = of_dma->of_dma_data;
 	struct milbeaut_hdmac_chan *mc;
diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d3063a1d11177a1a37b89ac2fd213e9..d2cd00423d7871d93965210008ee5b16044ab8a6 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -1001,7 +1001,8 @@ static const struct of_device_id mmp_pdma_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mmp_pdma_dt_ids);
 
 static struct dma_chan *mmp_pdma_dma_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct mmp_pdma_device *d = ofdma->of_dma_data;
 	struct dma_chan *chan;
diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index b7fb843c67a6f247395296fc726f7b6cab7d223f..cb4db4b266df31702de8c2b8bb5b2206013d3284 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -607,7 +607,8 @@ static bool mmp_tdma_filter_fn(struct dma_chan *chan, void *fn_param)
 }
 
 static struct dma_chan *mmp_tdma_xlate(struct of_phandle_args *dma_spec,
-			       struct of_dma *ofdma)
+				       struct of_dma *ofdma,
+				       void *data)
 {
 	struct mmp_tdma_device *tdev = ofdma->of_dma_data;
 	dma_cap_mask_t mask = tdev->device.cap_mask;
diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
index de09e1ab77676d3ff2070dfb30c9d03a9bb63e0d..2ce3e5c3ca511ac2c5d5f0f29627819ecb518c96 100644
--- a/drivers/dma/moxart-dma.c
+++ b/drivers/dma/moxart-dma.c
@@ -321,7 +321,8 @@ static struct dma_async_tx_descriptor *moxart_prep_slave_sg(
 }
 
 static struct dma_chan *moxart_of_xlate(struct of_phandle_args *dma_spec,
-					struct of_dma *ofdma)
+					struct of_dma *ofdma,
+					void *data)
 {
 	struct moxart_dmadev *mdc = ofdma->of_dma_data;
 	struct dma_chan *chan;
diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfb9962417ef68e976ae03c3c6f3054dc89bd1e6..30209bf506fe93563423881610fdd5b259decdaa 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -722,7 +722,8 @@ static bool mxs_dma_filter_fn(struct dma_chan *chan, void *fn_param)
 }
 
 static struct dma_chan *mxs_dma_xlate(struct of_phandle_args *dma_spec,
-			       struct of_dma *ofdma)
+				      struct of_dma *ofdma,
+				      void *data)
 {
 	struct mxs_dma_engine *mxs_dma = ofdma->of_dma_data;
 	dma_cap_mask_t mask = mxs_dma->dma_device.cap_mask;
diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 765462303de098c01ee38540ae7e1cf70570e92e..d9387f34b886631144d06ef2d8475672f9bc79fd 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1098,7 +1098,8 @@ static void nbpf_free_chan_resources(struct dma_chan *dchan)
 }
 
 static struct dma_chan *nbpf_of_xlate(struct of_phandle_args *dma_spec,
-				      struct of_dma *ofdma)
+				      struct of_dma *ofdma,
+				      void *data)
 {
 	struct nbpf_device *nbpf = ofdma->of_dma_data;
 	struct dma_chan *dchan;
diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index 423442e55d368d1e020b981306aa6b792c8b66b9..6cd8dd285c041dedb7ed61e18a1cd91316ed0dda 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -53,7 +53,8 @@ static struct of_dma *of_dma_find_controller(const struct of_phandle_args *dma_s
  * to request channel from the real DMA controller.
  */
 static struct dma_chan *of_dma_router_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct dma_chan		*chan;
 	struct of_dma		*ofdma_target;
@@ -74,7 +75,7 @@ static struct dma_chan *of_dma_router_xlate(struct of_phandle_args *dma_spec,
 		goto err;
 	}
 
-	chan = ofdma_target->of_dma_xlate(&dma_spec_target, ofdma_target);
+	chan = ofdma_target->of_dma_xlate(&dma_spec_target, ofdma_target, NULL);
 	if (IS_ERR_OR_NULL(chan)) {
 		ofdma->dma_router->route_free(ofdma->dma_router->dev,
 					      route_data);
@@ -117,7 +118,7 @@ static struct dma_chan *of_dma_router_xlate(struct of_phandle_args *dma_spec,
  */
 int of_dma_controller_register(struct device_node *np,
 				struct dma_chan *(*of_dma_xlate)
-				(struct of_phandle_args *, struct of_dma *),
+				(struct of_phandle_args *, struct of_dma *, void *),
 				void *data)
 {
 	struct of_dma	*ofdma;
@@ -249,7 +250,8 @@ static int of_dma_match_channel(struct device_node *np, const char *name,
  * Returns pointer to appropriate DMA channel on success or an error pointer.
  */
 struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
-					      const char *name)
+					      const char *name,
+					      void *data)
 {
 	struct of_phandle_args	dma_spec;
 	struct of_dma		*ofdma;
@@ -289,7 +291,7 @@ struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 		ofdma = of_dma_find_controller(&dma_spec);
 
 		if (ofdma) {
-			chan = ofdma->of_dma_xlate(&dma_spec, ofdma);
+			chan = ofdma->of_dma_xlate(&dma_spec, ofdma, data);
 		} else {
 			ret_no_channel = -EPROBE_DEFER;
 			chan = NULL;
@@ -319,7 +321,8 @@ EXPORT_SYMBOL_GPL(of_dma_request_slave_channel);
  * pointer to appropriate dma channel on success or NULL on error.
  */
 struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
-						struct of_dma *ofdma)
+				     struct of_dma *ofdma,
+				     void *data)
 {
 	int count = dma_spec->args_count;
 	struct of_dma_filter_info *info = ofdma->of_dma_data;
@@ -349,7 +352,8 @@ EXPORT_SYMBOL_GPL(of_dma_simple_xlate);
  * Returns pointer to appropriate dma channel on success or NULL on error.
  */
 struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
-					 struct of_dma *ofdma)
+					 struct of_dma *ofdma,
+					 void *data)
 {
 	struct dma_device *dev = ofdma->of_dma_data;
 	struct dma_chan *chan, *candidate = NULL;
diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 57cec757d8f5687d465f8b2a7997709f91f03335..b80ae8c3cff2a787cf22ee24b9bd7205c39ff997 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1060,7 +1060,8 @@ static inline void owl_dma_free(struct owl_dma *od)
 }
 
 static struct dma_chan *owl_dma_of_xlate(struct of_phandle_args *dma_spec,
-					 struct of_dma *ofdma)
+					 struct of_dma *ofdma,
+					 void *data)
 {
 	struct owl_dma *od = ofdma->of_dma_data;
 	struct owl_dma_vchan *vchan;
diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 82a9fe88ad54c995616ceb9b4be63e3e884fa49f..0671cda5dcd767aa0a8492fc128a9a0be0992ec5 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2140,7 +2140,8 @@ static void pl330_tasklet(struct tasklet_struct *t)
 }
 
 static struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
-						struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	int count = dma_spec->args_count;
 	struct pl330_dmac *pl330 = ofdma->of_dma_data;
diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index 249296389771cf685b65eb11e38fd0262c26679d..94b7ba1cd0aa57c4a5eaa76cf6b7fdd5c5b479ed 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -1281,7 +1281,8 @@ static const struct of_device_id pxad_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, pxad_dt_ids);
 
 static struct dma_chan *pxad_dma_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+				       struct of_dma *ofdma,
+				       void *data)
 {
 	struct pxad_device *d = ofdma->of_dma_data;
 	struct dma_chan *chan;
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bbc3276992bb012a1b79937bdbd069fc01f75331..471500951dc493cbf9e4f085352a37c11d0b9274 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1165,7 +1165,8 @@ static void bam_dma_free_desc(struct virt_dma_desc *vd)
 }
 
 static struct dma_chan *bam_dma_xlate(struct of_phandle_args *dma_spec,
-		struct of_dma *of)
+				      struct of_dma *of,
+				      void *data)
 {
 	struct bam_device *bdev = container_of(of->of_dma_data,
 					struct bam_device, common);
diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 8e87738086b25ac37edbdcd5e237447f3e832e8e..51d19494099dae09f4579ba8c3eddfa0487bf487 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2108,7 +2108,8 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
 
 /* gpi_of_dma_xlate: open client requested channel */
 static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
-					 struct of_dma *of_dma)
+					 struct of_dma *of_dma,
+					 void *data)
 {
 	struct gpi_dev *gpi_dev = (struct gpi_dev *)of_dma->of_dma_data;
 	u32 seid, chid;
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index 6be54fddcee18f9be6b5fee9f55c4bbd9a99ca56..7702c1d904160cbaa73e79ce29408f576df6e1f4 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -716,7 +716,8 @@ static void adm_channel_init(struct adm_device *adev, struct adm_chan *achan,
  * Returns pointer to appropriate dma channel on success or NULL on error.
  */
 static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
-			       struct of_dma *ofdma)
+				      struct of_dma *ofdma,
+				      void *data)
 {
 	struct dma_device *dev = ofdma->of_dma_data;
 	struct dma_chan *chan, *candidate = NULL;
diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 0c45ce8c74aa2dedb2764856453da4d9944ab83f..510424bfb86b344ffa2ff2dc566a1d0fff826715 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1700,7 +1700,8 @@ static bool rcar_dmac_chan_filter(struct dma_chan *chan, void *arg)
 }
 
 static struct dma_chan *rcar_dmac_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct rcar_dmac_chan *rchan;
 	struct dma_chan *chan;
diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 1f687b08d6b8677d9300b5c7274559bfc9574643..381a00db75da5e84336a51852333efaa3001077e 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -767,7 +767,8 @@ static bool rz_dmac_chan_filter(struct dma_chan *chan, void *arg)
 }
 
 static struct dma_chan *rz_dmac_of_xlate(struct of_phandle_args *dma_spec,
-					 struct of_dma *ofdma)
+					 struct of_dma *ofdma,
+					 void *data)
 {
 	dma_cap_mask_t mask;
 
diff --git a/drivers/dma/sh/usb-dmac.c b/drivers/dma/sh/usb-dmac.c
index 7e2b6c97fa2f97f2d3dfe323f684f65278f012ee..c1c141cc49ff40ac367150fecb475a087cd8d827 100644
--- a/drivers/dma/sh/usb-dmac.c
+++ b/drivers/dma/sh/usb-dmac.c
@@ -646,7 +646,8 @@ static bool usb_dmac_chan_filter(struct dma_chan *chan, void *arg)
 }
 
 static struct dma_chan *usb_dmac_of_xlate(struct of_phandle_args *dma_spec,
-					  struct of_dma *ofdma)
+					  struct of_dma *ofdma,
+					  void *data)
 {
 	struct dma_chan *chan;
 	dma_cap_mask_t mask;
diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index c65ee0c7bfbdb2ade49e24618a5a83160440681d..cf78abb9654f4259a57faf63c0183212771dfae0 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -165,7 +165,8 @@ static irqreturn_t st_fdma_irq_handler(int irq, void *dev_id)
 }
 
 static struct dma_chan *st_fdma_of_xlate(struct of_phandle_args *dma_spec,
-					 struct of_dma *ofdma)
+					 struct of_dma *ofdma,
+					 void *data)
 {
 	struct st_fdma_dev *fdev = ofdma->of_dma_data;
 	struct dma_chan *chan;
diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d52e1685aed53ffa49c7c7f6d6a611a358e7f360..45ba20448354d840629495935b963bc4574003ec 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2365,7 +2365,8 @@ static void d40_set_prio_realtime(struct d40_chan *d40c)
 #define D40_DT_FLAGS_HIGH_PRIO(flags)  ((flags >> 4) & 0x1)
 
 static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
-				  struct of_dma *ofdma)
+				  struct of_dma *ofdma,
+				  void *data)
 {
 	struct stedma40_chan_cfg cfg;
 	dma_cap_mask_t cap;
diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index 04389936c8a6a5970b43408173e3d9968e6b148c..a477030c2bbcf241d35b285af06c9fb8f980b625 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -1519,7 +1519,8 @@ static void stm32_dma_set_config(struct stm32_dma_chan *chan,
 }
 
 static struct dma_chan *stm32_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct stm32_dma_device *dmadev = ofdma->of_dma_data;
 	struct device *dev = dmadev->ddev.dev;
diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 50e7106c5cb73394c1de52ad5f571f6db63750e6..c63bd9f5640aae458da9c1522e8d68f6290fe2c6 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1582,7 +1582,9 @@ static bool stm32_dma3_filter_fn(struct dma_chan *c, void *fn_param)
 	return true;
 }
 
-static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, struct of_dma *ofdma)
+static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec,
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct stm32_dma3_ddata *ddata = ofdma->of_dma_data;
 	dma_cap_mask_t mask = ddata->dma_dev.cap_mask;
diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index 080c1c725216cb627675c372591b4c0c227c3cea..8700ff0308ea71fff6a35f0c0c4071f3bd60d4a3 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1539,7 +1539,8 @@ static bool stm32_mdma_filter_fn(struct dma_chan *c, void *fn_param)
 }
 
 static struct dma_chan *stm32_mdma_of_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct stm32_mdma_device *dmadev = ofdma->of_dma_data;
 	dma_cap_mask_t mask = dmadev->ddev.cap_mask;
diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 00d2fd38d17f65a5fcbb4d0ec57c2361f499d3c7..4a71f64439c83154f7699ba3a37dd6bcb706b85e 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -1018,7 +1018,8 @@ static int sun4i_dma_config(struct dma_chan *chan,
 }
 
 static struct dma_chan *sun4i_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct sun4i_dma_dev *priv = ofdma->of_dma_data;
 	struct sun4i_dma_vchan *vchan;
diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 2215ff877bf7d024d1885c37c98187b519c75980..715d7ba6e681d9053eb0f31f0456e75938586a89 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1029,7 +1029,8 @@ static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 }
 
 static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct sun6i_dma_dev *sdev = ofdma->of_dma_data;
 	struct sun6i_vchan *vchan;
diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 4d6fe0efa76e4b4270958e5cfeecdc7d5c762414..171ece174300553c39242a7fd691f5e8fd65ccf5 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1289,7 +1289,8 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 }
 
 static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct tegra_dma *tdma = ofdma->of_dma_data;
 	struct tegra_dma_channel *tdc;
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 14a61e53a41b73f29bb2ab04ae9d95421280f51c..8d0976a50e6f035fe9765ef5259c2a8173060151 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1343,7 +1343,8 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 }
 
 static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct tegra_dma *tdma = ofdma->of_dma_data;
 	struct tegra_dma_channel *tdc;
diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index fad896ff29a2d3f5b2605ae2bc93e1b5b2349978..e8343d0264f729bffa919a1774d0df3fc78d6c0c 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -802,7 +802,8 @@ static void tegra_adma_free_chan_resources(struct dma_chan *dc)
 }
 
 static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
-					   struct of_dma *ofdma)
+					   struct of_dma *ofdma,
+					   void *data)
 {
 	struct tegra_adma *tdma = ofdma->of_dma_data;
 	struct tegra_adma_chan *tdc;
diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 8d8c3d6038fcc20b43d1b31292092cde00dc123e..c0947a6a35b37868ed7c60a1466035d143896d7c 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -981,7 +981,8 @@ static struct of_dma_filter_info cpp41_dma_info = {
 };
 
 static struct dma_chan *cppi41_dma_xlate(struct of_phandle_args *dma_spec,
-		struct of_dma *ofdma)
+					 struct of_dma *ofdma,
+					 void *data)
 {
 	int count = dma_spec->args_count;
 	struct of_dma_filter_info *info = ofdma->of_dma_data;
diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 3ed406f08c442e1930aca4d15059d914eca4b55e..4fe6c0fae307e1bdb50a354d46c11ae38fe503db 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2275,7 +2275,8 @@ static struct edma_soc_info *edma_setup_info_from_dt(struct device *dev,
 }
 
 static struct dma_chan *of_edma_xlate(struct of_phandle_args *dma_spec,
-				      struct of_dma *ofdma)
+				      struct of_dma *ofdma,
+				      void *data)
 {
 	return NULL;
 }
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index aa2dc762140f6eee334f4506a592e72600ae9834..22e5a61a3a3364723c64bf4548337714d7b9bfa6 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -4250,7 +4250,8 @@ static bool udma_dma_filter_fn(struct dma_chan *chan, void *param)
 }
 
 static struct dma_chan *udma_of_xlate(struct of_phandle_args *dma_spec,
-				      struct of_dma *ofdma)
+				      struct of_dma *ofdma,
+				      void *data)
 {
 	struct udma_dev *ud = ofdma->of_dma_data;
 	struct udma_filter_param filter_param;
diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
index ceeb6171c9d1174cc643e9b5e7c70f6488884aec..ea8e8e244b3a994005e1e3b44bbb0dcc36886c92 100644
--- a/drivers/dma/uniphier-xdmac.c
+++ b/drivers/dma/uniphier-xdmac.c
@@ -464,7 +464,8 @@ static void uniphier_xdmac_chan_init(struct uniphier_xdmac_device *xdev,
 }
 
 static struct dma_chan *of_dma_uniphier_xlate(struct of_phandle_args *dma_spec,
-					      struct of_dma *ofdma)
+					      struct of_dma *ofdma,
+					      void *data)
 {
 	struct uniphier_xdmac_device *xdev = ofdma->of_dma_data;
 	int chan_id = dma_spec->args[0];
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index a34d8f0ceed8b18402954e5a27555e2a2978cb7b..359f419535140b980d003cf0a49bbcbeded906dc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3005,7 +3005,8 @@ static int xilinx_dma_child_probe(struct xilinx_dma_device *xdev,
  * Return: DMA channel pointer on success and NULL on error
  */
 static struct dma_chan *of_dma_xilinx_xlate(struct of_phandle_args *dma_spec,
-						struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct xilinx_dma_device *xdev = ofdma->of_dma_data;
 	int chan_id = dma_spec->args[0];
diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index ee5d9fdbfd7fa84f82fd45970151c056275ce7d3..efa0dcb25fa016e76ef41f784d9b651065e1285f 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1689,7 +1689,8 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 }
 
 static struct dma_chan *of_dma_xilinx_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct xilinx_dpdma_device *xdev = ofdma->of_dma_data;
 	u32 chan_id = dma_spec->args[0];
diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index d05fc5fcc77dcedd32cc23c99d084504647c31aa..717ab63f398a12c31035ca8bda78a9d4db9ce325 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -972,7 +972,8 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
  * Return: DMA channel pointer on success and NULL on error
  */
 static struct dma_chan *of_zynqmp_dma_xlate(struct of_phandle_args *dma_spec,
-					    struct of_dma *ofdma)
+					    struct of_dma *ofdma,
+					    void *data)
 {
 	struct zynqmp_dma_device *zdev = ofdma->of_dma_data;
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 6de7c05d6bd8c99e176fe2fde0a9c3b55d40b37c..586f871234e60cd2e042bda124db5c8aed5ea814 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1522,6 +1522,7 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
 				       dma_filter_fn fn, void *fn_param,
 				       struct device_node *np);
 
+struct dma_chan *dma_request_chan_w_data(struct device *dev, const char *name, void *data);
 struct dma_chan *dma_request_chan(struct device *dev, const char *name);
 struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask);
 struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
@@ -1551,6 +1552,12 @@ static inline struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
 {
 	return NULL;
 }
+struct dma_chan *dma_request_chan_w_data(struct device *dev,
+					 const char *name,
+					 void *data)
+{
+	return ERR_PTR(-ENODEV);
+}
 static inline struct dma_chan *dma_request_chan(struct device *dev,
 						const char *name)
 {
diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -19,7 +19,7 @@ struct of_dma {
 	struct list_head	of_dma_controllers;
 	struct device_node	*of_node;
 	struct dma_chan		*(*of_dma_xlate)
-				(struct of_phandle_args *, struct of_dma *);
+				(struct of_phandle_args *, struct of_dma *, void *);
 	void			*(*of_dma_route_allocate)
 				(struct of_phandle_args *, struct of_dma *);
 	struct dma_router	*dma_router;
@@ -34,7 +34,7 @@ struct of_dma_filter_info {
 #ifdef CONFIG_DMA_OF
 extern int of_dma_controller_register(struct device_node *np,
 		struct dma_chan *(*of_dma_xlate)
-		(struct of_phandle_args *, struct of_dma *),
+		(struct of_phandle_args *, struct of_dma *, void *),
 		void *data);
 extern void of_dma_controller_free(struct device_node *np);
 
@@ -45,16 +45,17 @@ extern int of_dma_router_register(struct device_node *np,
 #define of_dma_router_free of_dma_controller_free
 
 extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
-						     const char *name);
+						     const char *name,
+						     void *data);
 extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
-		struct of_dma *ofdma);
+		struct of_dma *ofdma, void *data);
 extern struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
-		struct of_dma *ofdma);
+		struct of_dma *ofdma, void *data);
 
 #else
 static inline int of_dma_controller_register(struct device_node *np,
 		struct dma_chan *(*of_dma_xlate)
-		(struct of_phandle_args *, struct of_dma *),
+		(struct of_phandle_args *, struct of_dma *, void *),
 		void *data)
 {
 	return -ENODEV;
@@ -75,7 +76,8 @@ static inline int of_dma_router_register(struct device_node *np,
 #define of_dma_router_free of_dma_controller_free
 
 static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
-						     const char *name)
+							    const char *name,
+							    void *data)
 {
 	return ERR_PTR(-ENODEV);
 }
diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..43d48e4ac8161ee9955120fe64f7b911bfdfe1ca 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -926,7 +926,7 @@ static struct dma_chan *mca_request_dma_channel(struct mca_cluster *cl, unsigned
 	char *name = devm_kasprintf(cl->host->dev, GFP_KERNEL,
 				    is_tx ? "tx%da" : "rx%db", cl->no);
 #endif
-	return of_dma_request_slave_channel(cl->host->dev->of_node, name);
+	return of_dma_request_slave_channel(cl->host->dev->of_node, name, NULL);
 
 }
 
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 2035ce06fe4c4aeaa8620d817910a5319732fa58..dcbff2fc61a0472adea226371016a128563b3cd0 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -204,7 +204,7 @@ struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *nam
 		}
 
 		if (i == rsnd_mod_id_raw(mod) && (!chan))
-			chan = of_dma_request_slave_channel(np, x);
+			chan = of_dma_request_slave_channel(np, x, NULL);
 		i++;
 	}
 

-- 
2.50.1


