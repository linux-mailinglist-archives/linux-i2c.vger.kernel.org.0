Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126F0268986
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 12:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgINKpm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 06:45:42 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:12438 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726483AbgINKlZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 06:41:25 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08EAcDVl028106;
        Mon, 14 Sep 2020 12:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=40lzEAJIU9I2PCQ82HQqHHwVR/q3ttFyrdmiDpZtab0=;
 b=dhHKZeA0SvDUaNMrhuRN2OG4PEK/ONw/vSndNDTZzic7kJHb7ZcT7MBr4eaTTSaUy3dU
 3J1qQ+28NTTkyaRxFNuKvGCZYiJwZjM6vzlQzxyiMQI/2gB/wWuTfgzhqEIz9UrBXrKW
 blb59tkltas7IxnCdfQ++khVRySUtVwhodZumcqUZ5D0vKBcBMd/fbPRbqLY3v538XpY
 PnYP2SxoyNmwiN0b09LoZXw9vRuz/3axEXA5bEsMPSBTUMIBYPDgSyZ9vymIV7haJMkK
 cJxbDEsRPuIz47mW+jaV+9E5u1wYs2l+4PFVuz3RMWgLT53KBgoPokh1KrUAOPh/pnVH bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33gkf99xae-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Sep 2020 12:40:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BD45100034;
        Mon, 14 Sep 2020 12:40:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 081CE2ADA04;
        Mon, 14 Sep 2020 12:40:55 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Sep 2020 12:40:54
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <krzk@kernel.org>, <h.assmann@pengutronix.de>,
        <alain.volmat@st.com>
Subject: [PATCH 1/2] i2c: stm32: fix error message on upon dma_request_chan & defer handling
Date:   Mon, 14 Sep 2020 12:40:33 +0200
Message-ID: <1600080034-2050-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600080034-2050-1-git-send-email-alain.volmat@st.com>
References: <1600080034-2050-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-14_02:2020-09-10,2020-09-14 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DMA usage is optional for the I2C driver. check for the -ENODEV
error in order to avoid displaying an error when no DMA
has been requested.
Cleaning up the error messages during probe, remove the additional
-EPROBE_DEFER within probe function since additional error message
doesn't give much more information than what is already reported
within the stm32_i2c_dma_request function.

CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Holger Assmann <h.assmann@pengutronix.de>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
This patch replaces the patch [i2c: stm32: do not display error when DMA is not requested]
previously sent on the mailing list.
---
 drivers/i2c/busses/i2c-stm32.c   |  6 ++----
 drivers/i2c/busses/i2c-stm32f7.c | 13 ++++++-------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 3f69a3bb6119..468620db9ea5 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -26,7 +26,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
 		ret = PTR_ERR(dma->chan_tx);
-		if (ret != -EPROBE_DEFER)
+		if ((ret != -ENODEV) && (ret != -EPROBE_DEFER))
 			dev_err(dev, "can't request DMA tx channel\n");
 		goto fail_al;
 	}
@@ -46,7 +46,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
 		ret = PTR_ERR(dma->chan_rx);
-		if (ret != -EPROBE_DEFER)
+		if ((ret != -ENODEV) && (ret != -EPROBE_DEFER))
 			dev_err(dev, "can't request DMA rx channel\n");
 
 		goto fail_tx;
@@ -76,8 +76,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
-	if (ret != -EPROBE_DEFER)
-		dev_info(dev, "can't use DMA\n");
 
 	return ERR_PTR(ret);
 }
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index bff3479fe122..8a61320a9cb9 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2052,14 +2052,13 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	i2c_dev->dma = stm32_i2c_dma_request(i2c_dev->dev, phy_addr,
 					     STM32F7_I2C_TXDR,
 					     STM32F7_I2C_RXDR);
-	if (PTR_ERR(i2c_dev->dma) == -ENODEV)
-		i2c_dev->dma = NULL;
-	else if (IS_ERR(i2c_dev->dma)) {
+	if (IS_ERR(i2c_dev->dma)) {
 		ret = PTR_ERR(i2c_dev->dma);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Failed to request dma error %i\n", ret);
-		goto fmp_clear;
+		/* DMA support is optional, only report other errors */
+		if (ret != -ENODEV)
+			goto fmp_clear;
+		dev_dbg(i2c_dev->dev, "No DMA option: fallback using interrupts\n");
+		i2c_dev->dma = NULL;
 	}
 
 	if (i2c_dev->wakeup_src) {
-- 
2.7.4

