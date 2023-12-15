Return-Path: <linux-i2c+bounces-840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98855814DF1
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 18:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12BEA1F254DB
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8983FB1A;
	Fri, 15 Dec 2023 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6PYZeb4m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EEC41857;
	Fri, 15 Dec 2023 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BFFI6IN006661;
	Fri, 15 Dec 2023 18:07:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=wy7wgUsJaX5XQsgjxRGUwCP4v90sJL58dgNnlCma76Q=; b=6P
	YZeb4mAFTmJbCRGgpyG+2KxgLiLOKS3xn6He9DB0C1O8DAgTjaBb6Vh/UmzAmChg
	O7QPL4SMRhQtEr7rgAw7iVhjGOI5/YgJYSzgkWxjAYTgrQ9isQguNRvQP3lJx/H+
	zKluCX9d8DsD37xYceCftveaXf4BrHrqFugwa1OYEUGDOX3zYVn1iJsipAUvprxU
	P0npu8PBlMgiEr9MA6VcNqWFR6tm/KicmigpYP3ZjcdMBOuQ+AbHb6juoYpx8N5p
	nn/5CnOXQgOgJdFdl6lCb+71duxH5cW3HcQvKzvT1AKxShXB3IBiiM4bvCzZLxXX
	n2v/CugSUAzFE6eatjFw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0hagea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:07:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88F13100052;
	Fri, 15 Dec 2023 18:07:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FC6623BDFD;
	Fri, 15 Dec 2023 18:07:37 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:07:37 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>
CC: Conor Dooley <conor@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/9] i2c: stm32f7: perform most of irq job in threaded handler
Date: Fri, 15 Dec 2023 18:06:06 +0100
Message-ID: <20231215170617.95868-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02

The irq handling is currently split between the irq handler
and the threaded irq handler.  Some of the handling (such as
dma related stuffs) done within the irq handler might sleep or
take some time leading to issues if the kernel is built with
realtime constraints.  In order to fix that, perform an overall
rework to perform most of the job within the threaded handler
and only keep fifo access in the non threaded handler.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-stm32f7.c | 126 ++++++++++++++-----------------
 1 file changed, 56 insertions(+), 70 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d99f152ac727..dde70e7ec722 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1497,17 +1497,11 @@ static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
 static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
-	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
-	struct stm32_i2c_dma *dma = i2c_dev->dma;
-	void __iomem *base = i2c_dev->base;
-	u32 status, mask;
-	int ret = IRQ_HANDLED;
+	u32 status;
 
-	/* Check if the interrupt if for a slave device */
-	if (!i2c_dev->master_mode) {
-		ret = stm32f7_i2c_slave_isr_event(i2c_dev);
-		return ret;
-	}
+	/* Check if the interrupt is for a slave device */
+	if (!i2c_dev->master_mode)
+		return IRQ_WAKE_THREAD;
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
@@ -1519,6 +1513,29 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 	if (status & STM32F7_I2C_ISR_RXNE)
 		stm32f7_i2c_read_rx_data(i2c_dev);
 
+	/* Wake up the thread if other flags are raised */
+	if (status &
+	    (STM32F7_I2C_ISR_NACKF | STM32F7_I2C_ISR_STOPF |
+	     STM32F7_I2C_ISR_TC | STM32F7_I2C_ISR_TCR))
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
+{
+	struct stm32f7_i2c_dev *i2c_dev = data;
+	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
+	struct stm32_i2c_dma *dma = i2c_dev->dma;
+	void __iomem *base = i2c_dev->base;
+	u32 status, mask;
+	int ret;
+
+	if (!i2c_dev->master_mode)
+		return stm32f7_i2c_slave_isr_event(i2c_dev);
+
+	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
+
 	/* NACK received */
 	if (status & STM32F7_I2C_ISR_NACKF) {
 		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
@@ -1531,33 +1548,28 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 		f7_msg->result = -ENXIO;
 	}
 
-	/* STOP detection flag */
-	if (status & STM32F7_I2C_ISR_STOPF) {
-		/* Disable interrupts */
-		if (stm32f7_i2c_is_slave_registered(i2c_dev))
-			mask = STM32F7_I2C_XFER_IRQ_MASK;
+	if (status & STM32F7_I2C_ISR_TCR) {
+		if (f7_msg->smbus)
+			stm32f7_i2c_smbus_reload(i2c_dev);
 		else
-			mask = STM32F7_I2C_ALL_IRQ_MASK;
-		stm32f7_i2c_disable_irq(i2c_dev, mask);
-
-		/* Clear STOP flag */
-		writel_relaxed(STM32F7_I2C_ICR_STOPCF, base + STM32F7_I2C_ICR);
-
-		if (i2c_dev->use_dma && !f7_msg->result) {
-			ret = IRQ_WAKE_THREAD;
-		} else {
-			i2c_dev->master_mode = false;
-			complete(&i2c_dev->complete);
-		}
+			stm32f7_i2c_reload(i2c_dev);
 	}
 
 	/* Transfer complete */
 	if (status & STM32F7_I2C_ISR_TC) {
+		/* Wait for dma transfer completion before sending next message */
+		if (i2c_dev->use_dma && !f7_msg->result) {
+			ret = wait_for_completion_timeout(&i2c_dev->dma->dma_complete, HZ);
+			if (!ret) {
+				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
+				stm32f7_i2c_disable_dma_req(i2c_dev);
+				dmaengine_terminate_async(dma->chan_using);
+				f7_msg->result = -ETIMEDOUT;
+			}
+		}
 		if (f7_msg->stop) {
 			mask = STM32F7_I2C_CR2_STOP;
 			stm32f7_i2c_set_bits(base + STM32F7_I2C_CR2, mask);
-		} else if (i2c_dev->use_dma && !f7_msg->result) {
-			ret = IRQ_WAKE_THREAD;
 		} else if (f7_msg->smbus) {
 			stm32f7_i2c_smbus_rep_start(i2c_dev);
 		} else {
@@ -1567,47 +1579,18 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 		}
 	}
 
-	if (status & STM32F7_I2C_ISR_TCR) {
-		if (f7_msg->smbus)
-			stm32f7_i2c_smbus_reload(i2c_dev);
+	/* STOP detection flag */
+	if (status & STM32F7_I2C_ISR_STOPF) {
+		/* Disable interrupts */
+		if (stm32f7_i2c_is_slave_registered(i2c_dev))
+			mask = STM32F7_I2C_XFER_IRQ_MASK;
 		else
-			stm32f7_i2c_reload(i2c_dev);
-	}
-
-	return ret;
-}
-
-static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
-{
-	struct stm32f7_i2c_dev *i2c_dev = data;
-	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
-	struct stm32_i2c_dma *dma = i2c_dev->dma;
-	u32 status;
-	int ret;
-
-	/*
-	 * Wait for dma transfer completion before sending next message or
-	 * notity the end of xfer to the client
-	 */
-	ret = wait_for_completion_timeout(&i2c_dev->dma->dma_complete, HZ);
-	if (!ret) {
-		dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
-		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_async(dma->chan_using);
-		f7_msg->result = -ETIMEDOUT;
-	}
+			mask = STM32F7_I2C_ALL_IRQ_MASK;
+		stm32f7_i2c_disable_irq(i2c_dev, mask);
 
-	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
+		/* Clear STOP flag */
+		writel_relaxed(STM32F7_I2C_ICR_STOPCF, base + STM32F7_I2C_ICR);
 
-	if (status & STM32F7_I2C_ISR_TC) {
-		if (f7_msg->smbus) {
-			stm32f7_i2c_smbus_rep_start(i2c_dev);
-		} else {
-			i2c_dev->msg_id++;
-			i2c_dev->msg++;
-			stm32f7_i2c_xfer_msg(i2c_dev, i2c_dev->msg);
-		}
-	} else {
 		i2c_dev->master_mode = false;
 		complete(&i2c_dev->complete);
 	}
@@ -1615,7 +1598,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
+static irqreturn_t stm32f7_i2c_isr_error_thread(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
@@ -2202,8 +2185,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request irq event\n");
 
-	ret = devm_request_irq(&pdev->dev, irq_error, stm32f7_i2c_isr_error, 0,
-			       pdev->name, i2c_dev);
+	ret = devm_request_threaded_irq(&pdev->dev, irq_error,
+					NULL,
+					stm32f7_i2c_isr_error_thread,
+					IRQF_ONESHOT,
+					pdev->name, i2c_dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request irq error\n");
 
-- 
2.25.1


