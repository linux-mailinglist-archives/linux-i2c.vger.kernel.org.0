Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5883113F931
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 20:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgAPTX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jan 2020 14:23:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730546AbgAPQxK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jan 2020 11:53:10 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34D792073A;
        Thu, 16 Jan 2020 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579193589;
        bh=OEnWGrgvNT9GZVvzp8phpkWRl3yWQ6tbihlsEPw0Iro=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wl77zXH6Rt0yOHyUvXXjRyPqln1kwY8Vrmkam4XPKHR9AbcFPMryWM9QkCZEhV0vf
         YL7gqy7ZPlncSb1u/fpIvW70GxahkQylu+7iEehoo4N7CoTFE+7PJoFR+zPhQ+gHk9
         m9d7HkzEKVXxAuj9nS6+O5N34nz0NJUwdyB7wc1g=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 129/205] i2c: stm32f7: report dma error during probe
Date:   Thu, 16 Jan 2020 11:41:44 -0500
Message-Id: <20200116164300.6705-129-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Alain Volmat <alain.volmat@st.com>

[ Upstream commit d77eceb2de99f5d7e0c645bad15511fe1af59e09 ]

Distinguish between the case where dma information is not provided
within the DT and the case of an error during the dma init.
Exit the probe with error in case of an error during dma init.

Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-stm32.c   | 16 ++++++++--------
 drivers/i2c/busses/i2c-stm32f7.c |  9 +++++++++
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 07d5dfce68d4..1da347e6a358 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -20,13 +20,13 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Request and configure I2C TX dma channel */
-	dma->chan_tx = dma_request_slave_channel(dev, "tx");
-	if (!dma->chan_tx) {
+	dma->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(dma->chan_tx)) {
 		dev_dbg(dev, "can't request DMA tx channel\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(dma->chan_tx);
 		goto fail_al;
 	}
 
@@ -42,10 +42,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	}
 
 	/* Request and configure I2C RX dma channel */
-	dma->chan_rx = dma_request_slave_channel(dev, "rx");
-	if (!dma->chan_rx) {
+	dma->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->chan_rx)) {
 		dev_err(dev, "can't request DMA rx channel\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(dma->chan_rx);
 		goto fail_tx;
 	}
 
@@ -75,7 +75,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	devm_kfree(dev, dma);
 	dev_info(dev, "can't use DMA\n");
 
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 void stm32_i2c_dma_free(struct stm32_i2c_dma *dma)
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 84cfed17ff4f..37a76516e203 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1955,6 +1955,15 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	i2c_dev->dma = stm32_i2c_dma_request(i2c_dev->dev, phy_addr,
 					     STM32F7_I2C_TXDR,
 					     STM32F7_I2C_RXDR);
+	if (PTR_ERR(i2c_dev->dma) == -ENODEV)
+		i2c_dev->dma = NULL;
+	else if (IS_ERR(i2c_dev->dma)) {
+		ret = PTR_ERR(i2c_dev->dma);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to request dma error %i\n", ret);
+		goto clk_free;
+	}
 
 	platform_set_drvdata(pdev, i2c_dev);
 
-- 
2.20.1

