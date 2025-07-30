Return-Path: <linux-i2c+bounces-12078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32642B15BE6
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D16318C2291
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 09:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D896D292B2C;
	Wed, 30 Jul 2025 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUey1day"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272A269806;
	Wed, 30 Jul 2025 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753868139; cv=none; b=I+lmfC4eNcVKms/sGXVlyRnnXbaV+AyKLof1FmZSHu+zfLW/d4bM+AEvmjiAnj1viNfcPLT+EqxCczhDGWrLYTY4CX0c1GixRLEwH8ptBWLPHFo+onuyptjnEKTNM9vTXTusPOAAubWeJFf20/2BNEfvj4r3lr5ofjjFzUPr4X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753868139; c=relaxed/simple;
	bh=gPmFOCUj56gB0mgUUsKxqdENITaoV8SNoAcVzVDUVXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VHUr5TjMlA8fwkCUt6WW0K6k+QsCsjeio5BkpZ8uSumJvogzdb/G3qiDmfDuNRxO4+MWkzgdajFjy4YvNWFEMekuymlANWsJHf/CGPWyxTpsUZptF+IHJz2LcjNvQLXvUteJrsMeXtTkAHdkuJVwk9S1+98p39ZuELoCKHE4+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUey1day; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B0C4CEF6;
	Wed, 30 Jul 2025 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753868137;
	bh=gPmFOCUj56gB0mgUUsKxqdENITaoV8SNoAcVzVDUVXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gUey1daysHX4CjFYuMEGjnbmPolvDXae9NnSIwYiFjcedOZLw+Z1H91EszY3i9Bc+
	 RQb/4FH768f4vRWIXstiydvBg+lsjMHIYvVN+AQ0Luf2kvzaT/+ifGBQ7GjMRHFqct
	 tLb1O8mFe9RIBntuWpGyZY+EnmBlnKZdEPAXnHzfDreCdthUu7eGCtl3xQ1/l1Kxe5
	 AYTdZjvbTKquJpRVroXwWZ5ko5AHCLbaAde97Nidc33PwK9Cmfdm7LwL1SMxNmoOhU
	 UCe10rrtQlM4Jt4MzH4+scSeEZXRR7w5bPsNNJosKHQPaDrtTYSR9/fDH1RhxNM6ij
	 rZmNU67Z9qVvw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:31 +0200
Subject: [PATCH RFC 4/6] i2c: qcom-geni: Hint GENI protocol ID to GPI DMA
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-topic-dma_genise_cookie-v1-4-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=1290;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=I3VYNNnaYUUJT+yNxJu2LDKZ0p5QFLebL1fPwM6iQcU=;
 b=r8aKTBYPiwfltdkmnV7Jw0zxdzT1E+Hq8RSvGglxlhd/28VcOh7CqbzzK2Fs5vifRSyZ6bAiZ
 4ZgyjRNT4cvDIvkGt7EnjNhvpWuKR/4k4cVpRwSghCBSCh7hc6aFGyn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the API in place, request the correct protocol ID with the GPI DMA
to avoid having to hardcode this obvious information in the device
tree.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ff2289b52c84ccf9ef786c2618bd869453c5f611..4c702ee728d6cc9282688bc278bd401f3de3266a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -754,14 +754,14 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	int ret;
 
 	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
-	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
+	gi2c->tx_c = dma_request_chan_w_data(gi2c->se.dev, "tx", (void *)GENI_SE_I2C);
 	if (IS_ERR(gi2c->tx_c)) {
 		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->tx_c),
 				    "Failed to get tx DMA ch\n");
 		goto err_tx;
 	}
 
-	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
+	gi2c->rx_c = dma_request_chan_w_data(gi2c->se.dev, "rx", (void *)GENI_SE_I2C);
 	if (IS_ERR(gi2c->rx_c)) {
 		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->rx_c),
 				    "Failed to get rx DMA ch\n");

-- 
2.50.1


