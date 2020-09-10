Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C8B26421E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 11:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIJJdD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 05:33:03 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:12144 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730718AbgIJJcl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 05:32:41 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08A9QfoN032717;
        Thu, 10 Sep 2020 11:32:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+COKLz+6WybyodfwHJziasnDtJLeiuO/fCZoNZW0ReY=;
 b=qhQd43AVtcAtVe1yYjZgrjJKsZeHIsn1fMqBGqkh+uy30fFquTmT/YHAAL1uGSygckVw
 J7GZh0ITHhQ1o0Grnr2Mz/GrSIWVo8cDQzyUFEmOdptjbUpQBxUmO36gpqiCCIofoDaq
 qI4Tq3/x5tgZfSrvhIP1TejKWVHFsVjUdzxYmUnwie6MGn1YweQrgtMhfqbCcX3YUFUY
 vLvcQk63RKwJUMrTnNGbHUXBSx2SGM6MX7iP0T6zQL3iPXIc40IMcumcPhURaDx/Ls1t
 X+6t92qT2TPCZni9udW0lPvH8lKdoSunFHLFeD+CtL6vbsnZpEZ5XEbM5rPWtcDEof0L Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33c0ev27vd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 11:32:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F34C10002A;
        Thu, 10 Sep 2020 11:32:29 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 756DB21CA68;
        Thu, 10 Sep 2020 11:32:29 +0200 (CEST)
Received: from localhost (10.75.127.50) by GPXDAG3NODE5.st.com (10.75.127.72)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep 2020 11:32:28
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH] i2c: stm32: do not display error when DMA is not requested
Date:   Thu, 10 Sep 2020 11:32:29 +0200
Message-ID: <1599730349-2160-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-10_01:2020-09-10,2020-09-10 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DMA usage is optional for the I2C driver. check for the -ENODEV
error in order to avoid displaying an error when no DMA
has been requested.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
This patch should be applied on top of the patch [i2c: stm32: Simplify with dev_err_probe()]
---
 drivers/i2c/busses/i2c-stm32.c   | 16 ++++++++++------
 drivers/i2c/busses/i2c-stm32f7.c |  5 +++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 198f848b7be9..91767156d63d 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -25,8 +25,11 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C TX dma channel */
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->chan_tx),
-				    "can't request DMA tx channel\n");
+		if (PTR_ERR(dma->chan_tx) == -ENODEV)
+			ret = PTR_ERR(dma->chan_tx);
+		else
+			ret = dev_err_probe(dev, PTR_ERR(dma->chan_tx),
+					    "can't request DMA tx channel\n");
 		goto fail_al;
 	}
 
@@ -44,8 +47,11 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	/* Request and configure I2C RX dma channel */
 	dma->chan_rx = dma_request_chan(dev, "rx");
 	if (IS_ERR(dma->chan_rx)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->chan_rx),
-				    "can't request DMA rx channel\n");
+		if (PTR_ERR(dma->chan_tx) == -ENODEV)
+			ret = PTR_ERR(dma->chan_tx);
+		else
+			ret = dev_err_probe(dev, PTR_ERR(dma->chan_rx),
+					    "can't request DMA rx channel\n");
 		goto fail_tx;
 	}
 
@@ -73,8 +79,6 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
-	if (ret != -EPROBE_DEFER)
-		dev_info(dev, "can't use DMA\n");
 
 	return ERR_PTR(ret);
 }
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index a8f1758e4c5b..58f342aea3c1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2049,6 +2049,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 					     STM32F7_I2C_TXDR,
 					     STM32F7_I2C_RXDR);
 	if (PTR_ERR(i2c_dev->dma) == -ENODEV) {
+		/*
+		 * DMA usage is not mandatory for the I2C, it is not an error
+		 * to receive -ENODEV
+		 */
+		dev_dbg(i2c_dev->dev, "not using DMA\n");
 		i2c_dev->dma = NULL;
 	} else if (IS_ERR(i2c_dev->dma)) {
 		ret = dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->dma),
-- 
2.7.4

