Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D50204F55
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 12:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732323AbgFWKkM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 06:40:12 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:11113 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732341AbgFWKkC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jun 2020 06:40:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592908800; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5WFzB6GD/oML5LfTkg7aBaRO3tq1egTpCbAmeSuTlJ4=; b=Z0R8HjT1zrDMewyG60SF6DOM5uZyyveSxMsDbYzkwYwfO8qTKXuy+e9aqUt6ok8pkJUeW9oT
 Exabwtjr+iEsnsfZzO4lbsY5D5vUYomaXtTixhnR8xENIQ6rlF1cdvs4li4x6NaTq3dFxaB3
 MRIwZnJFflI3Dga1jzhv0IZL36A=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ef1dbee567385e8e70bb8b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 10:39:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A39FBC433B2; Tue, 23 Jun 2020 10:39:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 738FCC433A0;
        Tue, 23 Jun 2020 10:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 738FCC433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V8 5/8] spi: spi-geni-qcom: Combine the clock setting code
Date:   Tue, 23 Jun 2020 16:08:54 +0530
Message-Id: <1592908737-7068-6-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
References: <1592908737-7068-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

There is code for adjusting the clock both in setup_fifo_params()
(called from prepare_message()) and in setup_fifo_xfer() (called from
transfer_one()).  The code is the same.  Abstract it out to a shared
function.

This is a no-op cleanup patch.  The only change is to the error string
if we fail to set the clock.  Since the two paths has marginally
different error messages I picked the clean one.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
This patch is introduced in V8 of the series.

 drivers/spi/spi-geni-qcom.c | 70 ++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 0c534d1..f186906 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -192,14 +192,42 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
+static int geni_spi_set_clock(struct spi_geni_master *mas, unsigned long clk_hz)
+{
+	u32 clk_sel, m_clk_cfg, idx, div;
+	struct geni_se *se = &mas->se;
+	int ret;
+
+	ret = get_spi_clk_cfg(clk_hz, mas, &idx, &div);
+	if (ret) {
+		dev_err(mas->dev, "Err setting clk to %lu: %d\n", clk_hz, ret);
+		return ret;
+	}
+
+	/*
+	 * SPI core clock gets configured with the requested frequency
+	 * or the frequency closer to the requested frequency.
+	 * For that reason requested frequency is stored in the
+	 * cur_speed_hz and referred in the consecutive transfer instead
+	 * of calling clk_get_rate() API.
+	 */
+	mas->cur_speed_hz = clk_hz;
+
+	clk_sel = idx & CLK_SEL_MSK;
+	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
+	writel(clk_sel, se->base + SE_GENI_CLK_SEL);
+	writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
+
+	return 0;
+}
+
 static int setup_fifo_params(struct spi_device *spi_slv,
 					struct spi_master *spi)
 {
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
 	struct geni_se *se = &mas->se;
 	u32 loopback_cfg, cpol, cpha, demux_output_inv;
-	u32 demux_sel, clk_sel, m_clk_cfg, idx, div;
-	int ret;
+	u32 demux_sel;
 
 	loopback_cfg = readl(se->base + SE_SPI_LOOPBACK);
 	cpol = readl(se->base + SE_SPI_CPOL);
@@ -222,27 +250,16 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 		demux_output_inv = BIT(spi_slv->chip_select);
 
 	demux_sel = spi_slv->chip_select;
-	mas->cur_speed_hz = spi_slv->max_speed_hz;
 	mas->cur_bits_per_word = spi_slv->bits_per_word;
 
-	ret = get_spi_clk_cfg(mas->cur_speed_hz, mas, &idx, &div);
-	if (ret) {
-		dev_err(mas->dev, "Err setting clks ret(%d) for %ld\n",
-							ret, mas->cur_speed_hz);
-		return ret;
-	}
-
-	clk_sel = idx & CLK_SEL_MSK;
-	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
 	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
 	writel(loopback_cfg, se->base + SE_SPI_LOOPBACK);
 	writel(demux_sel, se->base + SE_SPI_DEMUX_SEL);
 	writel(cpha, se->base + SE_SPI_CPHA);
 	writel(cpol, se->base + SE_SPI_CPOL);
 	writel(demux_output_inv, se->base + SE_SPI_DEMUX_OUTPUT_INV);
-	writel(clk_sel, se->base + SE_GENI_CLK_SEL);
-	writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
-	return 0;
+
+	return geni_spi_set_clock(mas, spi_slv->max_speed_hz);
 }
 
 static int spi_geni_prepare_message(struct spi_master *spi,
@@ -304,6 +321,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 	u32 m_cmd = 0;
 	u32 spi_tx_cfg, len;
 	struct geni_se *se = &mas->se;
+	int ret;
 
 	/*
 	 * Ensure that our interrupt handler isn't still running from some
@@ -328,27 +346,9 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 
 	/* Speed and bits per word can be overridden per transfer */
 	if (xfer->speed_hz != mas->cur_speed_hz) {
-		int ret;
-		u32 clk_sel, m_clk_cfg;
-		unsigned int idx, div;
-
-		ret = get_spi_clk_cfg(xfer->speed_hz, mas, &idx, &div);
-		if (ret) {
-			dev_err(mas->dev, "Err setting clks:%d\n", ret);
+		ret = geni_spi_set_clock(mas, xfer->speed_hz);
+		if (ret)
 			return;
-		}
-		/*
-		 * SPI core clock gets configured with the requested frequency
-		 * or the frequency closer to the requested frequency.
-		 * For that reason requested frequency is stored in the
-		 * cur_speed_hz and referred in the consecutive transfer instead
-		 * of calling clk_get_rate() API.
-		 */
-		mas->cur_speed_hz = xfer->speed_hz;
-		clk_sel = idx & CLK_SEL_MSK;
-		m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
-		writel(clk_sel, se->base + SE_GENI_CLK_SEL);
-		writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
 	}
 
 	mas->tx_rem_bytes = 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

