Return-Path: <linux-i2c+bounces-12074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8AB15BC4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D313561EA1
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 09:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504F8275B16;
	Wed, 30 Jul 2025 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mn3mWr7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B9F26D4F9;
	Wed, 30 Jul 2025 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868068; cv=none; b=g2PJORVj1fHCcNah+9TOz1kAPRqVKoYqHBYBsEW+TcPz0c1JMZnc3G8hpG0o1E1F9lEhExKCR+lJhvBSzLMCAQ+GzPT/mkmfGSWSOfhL7xhUR3Qa012PeeU7kmoGETwzyKzPYOb4JNaLoJ1fvDR6ZHU7jAAGwvqifixFRBjvfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868068; c=relaxed/simple;
	bh=CIVuQYfavwb/2ra5GsD9SGItvqbBHNthKR9qvQvzOGI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F3TEofKNqz0g3c03dE9qltvrtdv0Pp5TYf3dvh5xX+vDu5wmpH1RGXACxl7hOGoS9xqxnYZLPx99Ady9hU0iTfc6npreCUfqEq7lTdZFP9gbWE+qsYuRS9gM/gG8V4AKyxTpQ/oghO82xhAlU9WTNO5DNwwwVZfPa3E3cYP1M0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mn3mWr7a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05A0C4CEE7;
	Wed, 30 Jul 2025 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868067;
	bh=CIVuQYfavwb/2ra5GsD9SGItvqbBHNthKR9qvQvzOGI=;
	h=From:Subject:Date:To:Cc:From;
	b=mn3mWr7aA9V5VQdmoPI1MDwUFqmYcbYou3spQN0mTpS2xY/Q2IAmer8ElcJzAHti+
	 KDI3Je9i5rYwxmc1Uu6frvKz5aCvEdeIaJV5v0eUbJgOtZmLFLXve2bcmizzIvgMEn
	 zQqsAseUiBNcc0woER4J692Ev/4bp7WTpJQJ+R/ErEE5f9CVblx7OIN1CZA/zM/LZx
	 ZgtSmBLu8mJcqqTFok+wdPrjTWQ4KU23lsYRxK+U5FL/RLAIYBgwxmTvJMoFOzaETL
	 y6mDyNH5gHTpUEo+vdF56kw6vXYSq/gBDMHez4n+nx7iA96Ye8h3ttmX3XshWhq+mw
	 OFIlGH+1lL8JQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFC PATCH 0/6] Allow DMA consumers to pass a cookie to providers'
 of_xlate
Date: Wed, 30 Jul 2025 11:33:27 +0200
Message-Id: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfmiWgC/x3MTQqAIBBA4avErBO0P6mrRETpaEOkoRFBePek5
 bd474WIgTDCULwQ8KZI3mWIsgC1Lc4iI50NFa9aLkXDLn+SYvpYZouOIs7K+52QdZ1WK5emNrq
 HXJ8BDT3/eZxS+gB+aeXZaQAAAA==
X-Change-ID: 20250714-topic-dma_genise_cookie-66dcb07f3fd9
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=5799;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CIVuQYfavwb/2ra5GsD9SGItvqbBHNthKR9qvQvzOGI=;
 b=va5fmQm0vcHgbpGnfydpzko+HQU0+0iHNYCXm7WHYjVRwugQO/jlg6FABqOs3xChvtQiLtHfX
 nwgfqitX8ihAL4cqD4UZZ9Xblo1yiqYPkj39iyy4q4XnXfktK7X59k3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

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

Currently, the DT looks like:

i2c@foobar {
	compatible = "qcom,geni-i2c";
	dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
	       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
	// actual hw description
};

spi@foobar {
        compatible = "qcom,geni-spi";
        dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
               <&gpi_dma1 1 1 QCOM_GPI_SPI>;
	// actual, identical hw description
};

Which is manageable when there's two of them. Unfortunately, we're
in the double digits range nowadays.

This series attempts to cut down on that through making the last cell
unnecessary, moving the purely-SW data that the current protocol ID is
into the driver.

The mass of_xlate signature change is a little unfortunate, let me know
if it can be avoided somehow..

Attaching the relevant dt-bindings change and converting one platform
over as an example.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (6):
      dt-bindings: dma: qcom,gpi: Retire passing the protocol ID
      dmaengine: Make of_dma_request_slave_channel pass a cookie to of_xlate
      dmaengine: qcom: gpi: Accept protocol ID hints
      i2c: qcom-geni: Hint GENI protocol ID to GPI DMA
      spi: geni-qcom: Hint GENI protocol ID to GPI DMA
      arm64: dts: qcom: x1e80100: Remove GENI protocol ID from DMA cells

 .../devicetree/bindings/dma/qcom,gpi.yaml          |   5 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 198 ++++++++++-----------
 drivers/dma/amba-pl08x.c                           |   3 +-
 drivers/dma/apple-admac.c                          |   3 +-
 drivers/dma/at_hdmac.c                             |   6 +-
 drivers/dma/at_xdmac.c                             |   3 +-
 drivers/dma/bcm2835-dma.c                          |   3 +-
 drivers/dma/dma-jz4780.c                           |   3 +-
 drivers/dma/dmaengine.c                            |  20 ++-
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c     |   3 +-
 drivers/dma/dw/of.c                                |   3 +-
 drivers/dma/ep93xx_dma.c                           |   6 +-
 drivers/dma/fsl-edma-main.c                        |   6 +-
 drivers/dma/img-mdc-dma.c                          |   3 +-
 drivers/dma/imx-dma.c                              |   3 +-
 drivers/dma/imx-sdma.c                             |   3 +-
 drivers/dma/lgm/lgm-dma.c                          |   3 +-
 drivers/dma/milbeaut-hdmac.c                       |   4 +-
 drivers/dma/mmp_pdma.c                             |   3 +-
 drivers/dma/mmp_tdma.c                             |   3 +-
 drivers/dma/moxart-dma.c                           |   3 +-
 drivers/dma/mxs-dma.c                              |   3 +-
 drivers/dma/nbpfaxi.c                              |   3 +-
 drivers/dma/of-dma.c                               |  18 +-
 drivers/dma/owl-dma.c                              |   3 +-
 drivers/dma/pl330.c                                |   3 +-
 drivers/dma/pxa_dma.c                              |   3 +-
 drivers/dma/qcom/bam_dma.c                         |   3 +-
 drivers/dma/qcom/gpi.c                             |  16 +-
 drivers/dma/qcom/qcom_adm.c                        |   3 +-
 drivers/dma/sh/rcar-dmac.c                         |   3 +-
 drivers/dma/sh/rz-dmac.c                           |   3 +-
 drivers/dma/sh/usb-dmac.c                          |   3 +-
 drivers/dma/st_fdma.c                              |   3 +-
 drivers/dma/ste_dma40.c                            |   3 +-
 drivers/dma/stm32/stm32-dma.c                      |   3 +-
 drivers/dma/stm32/stm32-dma3.c                     |   4 +-
 drivers/dma/stm32/stm32-mdma.c                     |   3 +-
 drivers/dma/sun4i-dma.c                            |   3 +-
 drivers/dma/sun6i-dma.c                            |   3 +-
 drivers/dma/tegra186-gpc-dma.c                     |   3 +-
 drivers/dma/tegra20-apb-dma.c                      |   3 +-
 drivers/dma/tegra210-adma.c                        |   3 +-
 drivers/dma/ti/cppi41.c                            |   3 +-
 drivers/dma/ti/edma.c                              |   3 +-
 drivers/dma/ti/k3-udma.c                           |   3 +-
 drivers/dma/uniphier-xdmac.c                       |   3 +-
 drivers/dma/xilinx/xilinx_dma.c                    |   3 +-
 drivers/dma/xilinx/xilinx_dpdma.c                  |   3 +-
 drivers/dma/xilinx/zynqmp_dma.c                    |   3 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   4 +-
 drivers/spi/spi-geni-qcom.c                        |   4 +-
 include/linux/dmaengine.h                          |   7 +
 include/linux/of_dma.h                             |  16 +-
 sound/soc/apple/mca.c                              |   2 +-
 sound/soc/renesas/rcar/dma.c                       |   2 +-
 56 files changed, 261 insertions(+), 177 deletions(-)
---
base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
change-id: 20250714-topic-dma_genise_cookie-66dcb07f3fd9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


