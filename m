Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0C1411816
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Sep 2021 17:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241386AbhITPX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 11:23:29 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:34314 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235365AbhITPX2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 11:23:28 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KAV2Bx031532;
        Mon, 20 Sep 2021 17:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=59qcHB1kF9PMeMXhh/v3Yee2c2CN5Mky8y5HqhJtLso=;
 b=PPt0E2vuS+kU4Akd0kjN8nIC+/drHoClbzPszutOtLDBgwOe32SoxF70puZ8M6oEjUy9
 R4fHvCnd/1XLywkXrDer+egW08LXIkf3wc27iGkZlaLyI47SQuu9AbcdXht/yaNMlNba
 lJz2/eSvgqNu1OXgF4DmP7K0MTbpNE0vIXNbXLuoceSows4pLjy+OibJroqOqHi+UJ/u
 3U01jdPlbWMaYgOIAxx6i/qMlpq/FCgVlXQkqAGugHv4xzJkF1hUMGlgvdTrqH/fHSF3
 XO5N7JV67EZVdHJ1yzizk/qvdO7X5uEbGq8XFqTGOXqsh1FNqMtpVigYsi1FapBVLo/K HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3b6h723ajh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Sep 2021 17:21:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BABC10002A;
        Mon, 20 Sep 2021 17:21:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4383922F7B7;
        Mon, 20 Sep 2021 17:21:47 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:21:47
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 4/4] i2c: stm32f7: use proper DMAENGINE API for termination
Date:   Mon, 20 Sep 2021 17:21:32 +0200
Message-ID: <1632151292-18503-5-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async.  Here, we use dmaengine_terminate_sync in
i2c_xfer and i2c_smbus_xfer handlers and rely on
dmaengine_terminate_async within interrupt handlers
(transmission error cases).
dmaengine_synchronize is added within i2c_xfer and i2c_smbus_xfer handler
to finalize terminate started in interrupt handlers.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 50d5ae81d227..66145d2b9b55 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1521,7 +1521,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
 		if (i2c_dev->use_dma) {
 			stm32f7_i2c_disable_dma_req(i2c_dev);
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_async(dma->chan_using);
 		}
 		f7_msg->result = -ENXIO;
 	}
@@ -1588,7 +1588,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 	if (!ret) {
 		dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
 		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_async(dma->chan_using);
 		f7_msg->result = -ETIMEDOUT;
 	}
 
@@ -1665,7 +1665,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	/* Disable dma */
 	if (i2c_dev->use_dma) {
 		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_async(dma->chan_using);
 	}
 
 	i2c_dev->master_mode = false;
@@ -1702,6 +1702,9 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 						i2c_dev->adap.timeout);
 	ret = f7_msg->result;
 	if (ret) {
+		if (i2c_dev->use_dma)
+			dmaengine_synchronize(dma->chan_using);
+
 		/*
 		 * It is possible that some unsent data have already been
 		 * written into TXDR. To avoid sending old data in a
@@ -1716,7 +1719,7 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 		dev_dbg(i2c_dev->dev, "Access to slave 0x%x timed out\n",
 			i2c_dev->msg->addr);
 		if (i2c_dev->use_dma)
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_sync(dma->chan_using);
 		stm32f7_i2c_wait_free_bus(i2c_dev);
 		ret = -ETIMEDOUT;
 	}
@@ -1761,6 +1764,9 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 					      i2c_dev->adap.timeout);
 	ret = f7_msg->result;
 	if (ret) {
+		if (i2c_dev->use_dma)
+			dmaengine_synchronize(dma->chan_using);
+
 		/*
 		 * It is possible that some unsent data have already been
 		 * written into TXDR. To avoid sending old data in a
@@ -1774,7 +1780,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	if (!timeout) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_sync(dma->chan_using);
 		stm32f7_i2c_wait_free_bus(i2c_dev);
 		ret = -ETIMEDOUT;
 		goto pm_free;
-- 
2.25.1

