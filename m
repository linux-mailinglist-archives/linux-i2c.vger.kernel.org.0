Return-Path: <linux-i2c+bounces-12080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561CB15C01
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B1D3A4BFF
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 09:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A2A293B75;
	Wed, 30 Jul 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3Cze1Sx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE700275861;
	Wed, 30 Jul 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868173; cv=none; b=Eeulju9TaBm6ehnI4VhPHCCWyUwf1ryjX5dZqaunseb1B/HdIFb0JjZyuGTCrwiirLhtjzIFBxP8AqUJdR7qIoulATlCr7YJzxBo3zmLVYCkHAxMkyNa6sXV64Lh8oRaAJ7cgcsFtsDAobibWAiTqPZ2zRwSRzdc//IJULBhAOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868173; c=relaxed/simple;
	bh=U7eQoDwMZXfDwuwVea0w+jYJ1TMWNsXv/5d12PtqCK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubiH8ej7ul88+8CzDevhwZXDjOnzPYcv4m8+6+11+9TM3fo36D2cQe2GMX6LdVm+rKbaW3BGTKImsieJh668T8yRiwZFdc5BUkxDFMHn10Gwq8u3fuN8kbdY+3diuqzMbY8CJxG5Jc33kYhJMIYDu2jS8WHxqlIssakksdoK5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3Cze1Sx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77134C4CEFB;
	Wed, 30 Jul 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868172;
	bh=U7eQoDwMZXfDwuwVea0w+jYJ1TMWNsXv/5d12PtqCK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P3Cze1SxwkLKbJLG1vfxsWJMSu7uughnp8h8z/jfcLSusC7y2lNnWpwXYSYKof/RI
	 pgw5X2hvPr3vpshyjAg/8KUszmUzrSDqQyU2nzBL0pa8fd1NyQmM2vLnJDW0aiL+6+
	 bGecyZDOoFtJ2sP0ZoYIV2SZYn5HV1MGiLAdUvBFgrO4m5dcRjK613/Cw+nWCimvDx
	 FL44Q4jW691/RrI0rcDoXytLvMAiIpuARGWDUePZM4GKk2w3vu0gZLKGX4ko774PIW
	 AhQJCP+JzuaiFfueMW+88Y5kZM0abgIUeY26ug1ZfW+RCf6O8hXTEnChataQmCOT3F
	 UHPFgP1QhJTmg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:33 +0200
Subject: [PATCH RFC 6/6] arm64: dts: qcom: x1e80100: Remove GENI protocol
 ID from DMA cells
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-topic-dma_genise_cookie-v1-6-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=18562;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eDOVFQ3sSBau28xDU0M0uPPUVN4g8jr8B0d8rvg5egs=;
 b=xH4jh5rJF8B145J7w0kFZHTYYTom25yvk5j1qw11KTCOGB0+ZcbC18dRuZ105iOgHDfhfDxBn
 cEAuRlJPY88DvQulmsLTFg0yEf8bqDuTx1ByVsle1gQfPH4q1Ggpi4H
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

In preparation for coalescing the duplicate nodes referring to the same
GENI serial engines running different protocol firmware, remove the no
longer necessary protocol IDs from each of the GPI DMA consumers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 198 ++++++++++++++++-----------------
 1 file changed, 99 insertions(+), 99 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..0dc055c9660501f3e5e3ba87e1560125eba67730 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -844,7 +844,7 @@ gpi_dma2: dma-controller@800000 {
 
 			dma-channels = <12>;
 			dma-channel-mask = <0x3e>;
-			#dma-cells = <3>;
+			#dma-cells = <2>;
 
 			iommus = <&apps_smmu 0x436 0x0>;
 
@@ -890,8 +890,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 0>,
+				       <&gpi_dma2 1 0>;
 				dma-names = "tx",
 					    "rx";
 
@@ -926,8 +926,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_120mhz>;
 
-				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 0>,
+				       <&gpi_dma2 1 0>;
 				dma-names = "tx",
 					    "rx";
 
@@ -962,8 +962,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 1>,
+				       <&gpi_dma2 1 1>;
 				dma-names = "tx",
 					    "rx";
 
@@ -998,8 +998,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_120mhz>;
 
-				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 1>,
+				       <&gpi_dma2 1 1>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1034,8 +1034,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 2>,
+				       <&gpi_dma2 1 2>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1070,8 +1070,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 2>,
+				       <&gpi_dma2 1 2>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1106,8 +1106,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 3>,
+				       <&gpi_dma2 1 3>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1142,8 +1142,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 3>,
+				       <&gpi_dma2 1 3>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1178,8 +1178,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 4>,
+				       <&gpi_dma2 1 4>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1214,8 +1214,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 4>,
+				       <&gpi_dma2 1 4>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1250,8 +1250,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 5>,
+				       <&gpi_dma2 1 5>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1286,8 +1286,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 5>,
+				       <&gpi_dma2 1 5>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1347,8 +1347,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 6>,
+				       <&gpi_dma2 1 6>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1383,8 +1383,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 6>,
+				       <&gpi_dma2 1 6>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1419,8 +1419,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 7>,
+				       <&gpi_dma2 1 7>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1455,8 +1455,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 7>,
+				       <&gpi_dma2 1 7>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1489,7 +1489,7 @@ gpi_dma1: dma-controller@a00000 {
 
 			dma-channels = <12>;
 			dma-channel-mask = <0x3e>;
-			#dma-cells = <3>;
+			#dma-cells = <2>;
 
 			iommus = <&apps_smmu 0x136 0x0>;
 
@@ -1535,8 +1535,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 0>,
+				       <&gpi_dma1 1 0>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1571,8 +1571,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_120mhz>;
 
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 0>,
+				       <&gpi_dma1 1 0>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1607,8 +1607,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 1>,
+				       <&gpi_dma1 1 1>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1643,8 +1643,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_120mhz>;
 
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 1>,
+				       <&gpi_dma1 1 1>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1679,8 +1679,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 2>,
+				       <&gpi_dma1 1 2>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1715,8 +1715,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 2>,
+				       <&gpi_dma1 1 2>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1751,8 +1751,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 3>,
+				       <&gpi_dma1 1 3>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1787,8 +1787,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 3>,
+				       <&gpi_dma1 1 3>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1823,8 +1823,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 4>,
+				       <&gpi_dma1 1 4>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1859,8 +1859,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 4>,
+				       <&gpi_dma1 1 4>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1895,8 +1895,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 5>,
+				       <&gpi_dma1 1 5>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1931,8 +1931,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 5>,
+				       <&gpi_dma1 1 5>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1967,8 +1967,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 6>,
+				       <&gpi_dma1 1 6>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2003,8 +2003,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 6>,
+				       <&gpi_dma1 1 6>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2064,8 +2064,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 7>,
+				       <&gpi_dma1 1 7>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2100,8 +2100,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 7>,
+				       <&gpi_dma1 1 7>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2134,7 +2134,7 @@ gpi_dma0: dma-controller@b00000  {
 
 			dma-channels = <12>;
 			dma-channel-mask = <0x3e>;
-			#dma-cells = <3>;
+			#dma-cells = <2>;
 
 			iommus = <&apps_smmu 0x456 0x0>;
 
@@ -2179,8 +2179,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 0>,
+				       <&gpi_dma0 1 0>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2215,8 +2215,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_120mhz>;
 
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 0>,
+				       <&gpi_dma0 1 0>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2251,8 +2251,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 1>,
+				       <&gpi_dma0 1 1>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2287,8 +2287,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_120mhz>;
 
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 1>,
+				       <&gpi_dma0 1 1>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2323,8 +2323,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 2>,
+				       <&gpi_dma0 1 2>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2384,8 +2384,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 2>,
+				       <&gpi_dma0 1 2>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2420,8 +2420,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 3>,
+				       <&gpi_dma0 1 3>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2456,8 +2456,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 3>,
+				       <&gpi_dma0 1 3>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2492,8 +2492,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 4>,
+				       <&gpi_dma0 1 4>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2528,8 +2528,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 4>,
+				       <&gpi_dma0 1 4>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2564,8 +2564,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 5>,
+				       <&gpi_dma0 1 5>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2600,8 +2600,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 5>,
+				       <&gpi_dma0 1 5>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2636,8 +2636,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 6>,
+				       <&gpi_dma0 1 6>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2672,8 +2672,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 6>,
+				       <&gpi_dma0 1 6>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2708,8 +2708,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 
-				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 7>,
+				       <&gpi_dma0 1 7>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2744,8 +2744,8 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table_100mhz>;
 
-				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 7>,
+				       <&gpi_dma0 1 7>;
 				dma-names = "tx",
 					    "rx";
 

-- 
2.50.1


