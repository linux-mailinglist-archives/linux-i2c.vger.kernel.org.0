Return-Path: <linux-i2c+bounces-12077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D9B15BDE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D4418C1FC6
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C89292B5C;
	Wed, 30 Jul 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X20Qu+oA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E91F1306;
	Wed, 30 Jul 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868121; cv=none; b=c1MXWSyA4qhBfKZwXjfYS1/8ejj5XqV1ygAqlRK3IKtxhimEIl16GT3iztZ8dxyhhCIQrytV3jqa0HJ0tfsFVTh1eLZ/WlMwb5hYaLUGmIWIkXpVepqM5hKhRdMczWUSgN6olREuGWhFAFc78TI5ig8gOl2wsaJdVnItjpJM+6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868121; c=relaxed/simple;
	bh=aA06HY/lOSd3mPr1XSqrpLr6Pd2WiKly7Q4jhNILr0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARfxm53/ZGwtb8zwJPGeJ42aNY1UebTixQcNcE/ZQXmSHA9899VXdQ0JQjsrakzQqKm9V3urLaHILzwaRUu0pN3nxhaVUZ0KMDq9i7dYyJecRQUIwA0Es/+x9VFvrCufssslDrtOYZ53J/IBfDJv5Y869YHRVzvb2L0wqzl19aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X20Qu+oA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26518C4CEFA;
	Wed, 30 Jul 2025 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868121;
	bh=aA06HY/lOSd3mPr1XSqrpLr6Pd2WiKly7Q4jhNILr0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X20Qu+oAGYALAZW8LlI1Jp8MQCufmMbh8UsHOAntPiRCfIo1vVPagWzlUeHRzM2ib
	 jT+xdrw78SNuwjwUb32cbcH3mgxpAoXOZ4Zg1j7NWUooGA/ZzGBOiH9W1L4GWjRWFE
	 B/+oPbMaoJ/wt9VhCc9QhlTLuuet2qAKY9aLNueH8qcl65h6W6ooJqVilX5yoB1mc8
	 zFhYhT2q7996B2D9NvA675YD22D615U/u5YdtI7LVxBEYGg2dY0FpjSl9cAboL4RVk
	 4+8DZ3a/6AahKCAFKmzPsmsdjdV/g3ZCQmkNFHI+3Z7iMJIgQJNyHvl7PPoaU4c/bH
	 BKWc4j/OR9R6Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:30 +0200
Subject: [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept protocol ID hints
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=2282;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hT9/eTcrm4TFika8xoyExyqhdwm/y3dhh9PjlVi8zDo=;
 b=rFCrLSTCp6a2Uf6sMUaFPcqvBgaQoklHtJ66/j+p46U6SPZphS90PFnkwzDJjknQfkSaPRA61
 hdswKqRCxQHBYk8hSzo3z4zQMrQXXMGPR2fTI1C8CqBTvD4QZfE497x
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Client drivers may now pass hints to dmaengine drivers. GPI DMA's only
consumers (GENI SEs) need to pass a protocol (I2C, I3C, SPI, etc.) ID
to the DMA engine driver, for it to take different actions.

Currently, that's done through passing that ID through device tree,
with each Serial Engine expressed NUM_PROTOCOL times, resulting in
terrible dt-bindings that are full of useless copypasta.

To help get rid of that, accept the driver cookie instead, while
keeping backwards compatibility.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 51d19494099dae09f4579ba8c3eddfa0487bf487..de9e564dc21b2230c9446dfb881135003721a750 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -17,6 +17,8 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+#include <linux/soc/qcom/geni-se.h>
+
 #define TRE_TYPE_DMA		0x10
 #define TRE_TYPE_IMMEDIATE_DMA	0x11
 #define TRE_TYPE_GO		0x20
@@ -2109,15 +2111,19 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
 /* gpi_of_dma_xlate: open client requested channel */
 static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 					 struct of_dma *of_dma,
-					 void *data)
+					 void *proto)
 {
 	struct gpi_dev *gpi_dev = (struct gpi_dev *)of_dma->of_dma_data;
 	u32 seid, chid;
 	int gpii;
 	struct gchan *gchan;
 
-	if (args->args_count < 3) {
-		dev_err(gpi_dev->dev, "gpii require minimum 2 args, client passed:%d args\n",
+	/* The protocol ID has been historically stored in the third cell */
+	if (!proto && args->args_count < 3)
+		return NULL;
+
+	if (args->args_count < 2) {
+		dev_err(gpi_dev->dev, "gpii requires minimum 2 args, client passed:%d args\n",
 			args->args_count);
 		return NULL;
 	}
@@ -2145,7 +2151,8 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 	}
 
 	gchan->seid = seid;
-	gchan->protocol = args->args[2];
+	/* The protocol ID is in the teens range, simply ignore the higher bits */
+	gchan->protocol = (u32)((u64)proto);
 
 	return dma_get_slave_channel(&gchan->vc.chan);
 }

-- 
2.50.1


