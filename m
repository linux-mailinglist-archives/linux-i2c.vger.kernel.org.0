Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5182F18BF4A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 19:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgCSSW3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 14:22:29 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:18772 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726663AbgCSSW3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 14:22:29 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02JIE6KQ006369;
        Thu, 19 Mar 2020 19:22:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=V1W1ZPAPMrHQt1KYv4hQ0NVBS3G0SeGs+MGIuDlSv+M=;
 b=0L6vrc0LKZikLUpVVK2vnLb7nwoHF+e8cUtc2U4X83wexv222/XYkKS7bxEbnCvB/Z81
 2gSMItsO9LRkjg/mWCLT4a2UUPOuosQuN0qkCnfYqIZXlcjzqJ36kdr+3mKOBXHLo4Ud
 /7VM876MUv0PrHyW0F75yFVxayg4heBKxcrPwrsUTmOVVk4vxmn9kBN9aDIi8mDDlPbO
 4GdwjDDY+58jXUBO4YChgQml4eV+pK9+yLu9N059mE/oI2GhVaZLuX5QVa6jy5QgcJqW
 7asIhySdnOQ7wpr8JQ3f9/f/OeSi938VzNGSC0r2T6MYQQBnpjsa8BrLZBY2aq9h+jvc jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yu8etkcdq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Mar 2020 19:22:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA7BB10002A;
        Thu, 19 Mar 2020 19:22:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE66F22190E;
        Thu, 19 Mar 2020 19:22:16 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 19 Mar 2020 19:22:16
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: stm32: don't print an error on probe deferral
Date:   Thu, 19 Mar 2020 19:22:16 +0100
Message-ID: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-19_07:2020-03-19,2020-03-19 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Do not print an error trace when deferring probe for some resource.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32.c   | 10 +++++++---
 drivers/i2c/busses/i2c-stm32f4.c |  4 +++-
 drivers/i2c/busses/i2c-stm32f7.c |  7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 1da347e6a358..7be559858402 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -25,8 +25,9 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C TX dma channel */
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
-		dev_dbg(dev, "can't request DMA tx channel\n");
 		ret = PTR_ERR(dma->chan_tx);
+		if (ret != -EPROBE_DEFER)
+			dev_dbg(dev, "can't request DMA tx channel\n");
 		goto fail_al;
 	}
 
@@ -44,8 +45,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C RX dma channel */
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
-		dev_err(dev, "can't request DMA rx channel\n");
 		ret = PTR_ERR(dma->chan_rx);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA rx channel\n");
+
 		goto fail_tx;
 	}
 
@@ -73,7 +76,8 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
-	dev_info(dev, "can't use DMA\n");
+	if (ret != -EPROBE_DEFER)
+		dev_info(dev, "can't use DMA\n");
 
 	return ERR_PTR(ret);
 }
diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index ba600d77a3f8..1b8cad506ad7 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -797,8 +797,10 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		dev_err(&pdev->dev, "Error: Missing controller reset\n");
 		ret = PTR_ERR(rst);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
+
 		goto clk_free;
 	}
 	reset_control_assert(rst);
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 78d40a4cc282..ab95ed52a7dc 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1915,7 +1915,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Error: Missing controller clock\n");
+		if (PTR_ERR(i2c_dev->clk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get controller clock\n");
 		return PTR_ERR(i2c_dev->clk);
 	}
 
@@ -1941,8 +1942,10 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
-		dev_err(&pdev->dev, "Error: Missing controller reset\n");
 		ret = PTR_ERR(rst);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Error: Missing reset ctrl\n");
+
 		goto clk_free;
 	}
 	reset_control_assert(rst);
-- 
2.7.4

