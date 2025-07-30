Return-Path: <linux-i2c+bounces-12079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF370B15BF3
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EA553A6C90
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 09:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD4D292B3E;
	Wed, 30 Jul 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noqZGFAg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F726D4F9;
	Wed, 30 Jul 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868155; cv=none; b=nJdxWS5SHD4oTs4+93vgSAgfTCP0UQgeyoBCbxlq2j9enHy8mriFL2+Yu1cHdrNXKDpP8RJ78g80v1yait61JbziVCRa1NJtqX2lYwgTH8EGbZvuoPheKEvpD8JCaTaT6P1SQw6zBCcLMUk9KZdRB4b2u5dD5I4OKREFjgfE8V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868155; c=relaxed/simple;
	bh=N00UN43mM8ni3MxsfDldCEpbhEFJB1eKWpki3YYPYWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkBJkGlrR14QpkASWSYxGAAwqUWc2sG5efmIDG3l94Kkme5X5BZrvph5I80bK06wWFbhjLltZvfBfpPQ5nNl/DAhq++8i+YheDWjBOybZ8rzktoQCW3WyKozr5im6i+BD9N00+bycixhhbC680zmLHSwxPO0O6juyxNM6EWW488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noqZGFAg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE23C4CEF5;
	Wed, 30 Jul 2025 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868155;
	bh=N00UN43mM8ni3MxsfDldCEpbhEFJB1eKWpki3YYPYWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=noqZGFAgIK4mo6I1FeATvcM2ik9vQma41t4JUvtFkKPX2Zyetn8mtfxVbZd45yE/l
	 U1Y7mJtuU7SJ7CnstPsB9K/3qhjUv1e7CgSaHl0J3j/ea3QCIEAkIqNTLELSBwDe8I
	 skZfM0x2hjLgrbULs/BH/jFJJPXLUcH/woib6J09xkCPOzz4f3nW4fUwsJqGElA1rN
	 C7eOoveWThhAUrn9GaIC+eUJQKFKxUe8xiu3UMeUP8xalqL+GLbOclrk1AaQgpePos
	 AeZ3QIghSLLNWwhAzXVCWOcVbFBTZ5AqTwazkUJgoNOyvosM2ZHoaMGIraYa5LXHU2
	 S5rwqKIyuCchA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:32 +0200
Subject: [PATCH RFC 5/6] spi: geni-qcom: Hint GENI protocol ID to GPI DMA
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-topic-dma_genise_cookie-v1-5-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=1173;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3qGrKkb0vUuJZdQ+qYHRcWxsslKGyEP5yydY522z8YA=;
 b=aICFJMG7AM48jTVVIFcvL8HDUChGXUjvlcmEfMfL9VNkZkzvMxo+3E1Pz4CGquWLPcm5h3n8G
 X5nW37uxlajC9Yv3uV+k462eLSjMMB00KSWeicS1u5fh7SmWNRlnhIs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the API in place, request the correct protocol ID with the GPI DMA
to avoid having to hardcode this obvious information in the device
tree.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 768d7482102adec9b7178077724dc3976a2760c8..0ea157ac06e12012e1a36218bf3a4058a9db6048 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -623,14 +623,14 @@ static int spi_geni_grab_gpi_chan(struct spi_geni_master *mas)
 {
 	int ret;
 
-	mas->tx = dma_request_chan(mas->dev, "tx");
+	mas->tx = dma_request_chan_w_data(mas->dev, "tx", (void *)GENI_SE_SPI);
 	if (IS_ERR(mas->tx)) {
 		ret = dev_err_probe(mas->dev, PTR_ERR(mas->tx),
 				    "Failed to get tx DMA ch\n");
 		goto err_tx;
 	}
 
-	mas->rx = dma_request_chan(mas->dev, "rx");
+	mas->rx = dma_request_chan_w_data(mas->dev, "rx", (void *)GENI_SE_SPI);
 	if (IS_ERR(mas->rx)) {
 		ret = dev_err_probe(mas->dev, PTR_ERR(mas->rx),
 				    "Failed to get rx DMA ch\n");

-- 
2.50.1


