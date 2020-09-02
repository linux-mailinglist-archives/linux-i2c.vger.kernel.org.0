Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBC525AE9C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 17:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgIBPRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 11:17:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:43806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727842AbgIBPGz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 11:06:55 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D58920773;
        Wed,  2 Sep 2020 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599059214;
        bh=5IrQM4zaWaI46iMLqvoLFQL1xUrFrBFsc04JUwsbfdc=;
        h=From:To:Cc:Subject:Date:From;
        b=z3DPtyJpm5wBhKasevREMy5GD7UXAoh+kvi2/+R3Qwd1ZBJwh0NWDq1IE7SZdzxep
         aZJ3ZX3DySSwZ5ws8RPm5NzbxX3NYTbNBB2ugRhEPM5BdaCC66EGXXR7NGiflRpfl7
         /lh8zD3aes02nzAVbZNXUlIGB3nybWAhdvuT0IfA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michal Simek <michal.simek@xilinx.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/9] i2c: stm32: Simplify with dev_err_probe()
Date:   Wed,  2 Sep 2020 17:06:35 +0200
Message-Id: <20200902150643.14839-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/i2c-stm32.c   | 11 ++++-------
 drivers/i2c/busses/i2c-stm32f4.c |  6 ++----
 drivers/i2c/busses/i2c-stm32f7.c | 24 +++++++++---------------
 3 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 3f69a3bb6119..198f848b7be9 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -25,9 +25,8 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C TX dma channel */
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
-		ret = PTR_ERR(dma->chan_tx);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "can't request DMA tx channel\n");
+		ret = dev_err_probe(dev, PTR_ERR(dma->chan_tx),
+				    "can't request DMA tx channel\n");
 		goto fail_al;
 	}
 
@@ -45,10 +44,8 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C RX dma channel */
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
-		ret = PTR_ERR(dma->chan_rx);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "can't request DMA rx channel\n");
-
+		ret = dev_err_probe(dev, PTR_ERR(dma->chan_rx),
+				    "can't request DMA rx channel\n");
 		goto fail_tx;
 	}
 
diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 48e269284369..937c2c8fd349 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -797,10 +797,8 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		ret = PTR_ERR(rst);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
-
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				    "Error: Missing reset ctrl\n");
 		goto clk_free;
 	}
 	reset_control_assert(rst);
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index bff3479fe122..a8f1758e4c5b 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1968,11 +1968,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 						    "wakeup-source");
 
 	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(i2c_dev->clk)) {
-		if (PTR_ERR(i2c_dev->clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get controller clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Failed to get controller clock\n");
 
 	ret = clk_prepare_enable(i2c_dev->clk);
 	if (ret) {
@@ -1982,10 +1980,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		ret = PTR_ERR(rst);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
-
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				    "Error: Missing reset ctrl\n");
 		goto clk_free;
 	}
 	reset_control_assert(rst);
@@ -2052,13 +2048,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	i2c_dev->dma = stm32_i2c_dma_request(i2c_dev->dev, phy_addr,
 					     STM32F7_I2C_TXDR,
 					     STM32F7_I2C_RXDR);
-	if (PTR_ERR(i2c_dev->dma) == -ENODEV)
+	if (PTR_ERR(i2c_dev->dma) == -ENODEV) {
 		i2c_dev->dma = NULL;
-	else if (IS_ERR(i2c_dev->dma)) {
-		ret = PTR_ERR(i2c_dev->dma);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Failed to request dma error %i\n", ret);
+	} else if (IS_ERR(i2c_dev->dma)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->dma),
+				    "Failed to request dma error\n");
 		goto fmp_clear;
 	}
 
-- 
2.17.1

