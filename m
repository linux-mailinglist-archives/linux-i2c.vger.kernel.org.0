Return-Path: <linux-i2c+bounces-687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB980A99F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 17:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 958AD2819C5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5950E35285;
	Fri,  8 Dec 2023 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iqrEFpzT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E974198C;
	Fri,  8 Dec 2023 08:47:54 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3B8F1Sf8015608;
	Fri, 8 Dec 2023 17:47:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=JtOvQS+6evVSFOg4x1qpS4jVWP7j9KTB9w21qfsiDm4=; b=iq
	rEFpzTt8M2Ry33IZgKc2j5xnKYYhlDgTBgGPRQZ9R40niuCWejU4STSQNci8UVJe
	Uef1/JY2WfiM+ZXO6MNTUryCO85xdFvoAfAAoQp7DXuEwdAQc3m4q6tfnP3VBfgt
	mptRpotrOzdjz5uWA3nDjeRkMw7Spi4UKkcqVdhTKif85rM8r8SxpZe8fozBQMGl
	5rssETWK3/lQNded0a2u1k9HIXVWAiQhDKFDcO2ZyC5JGrr6eeexpoGCQCEO1cgb
	bZ5mUezkVuuYLtpAYC6TE9vMkzjx8wEWj34ZOWoRBi2i47d1yRQCY0Q9Nl8EDg0j
	+otFd735pPFXBJnwINKA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2gnfrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 17:47:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B637E100056;
	Fri,  8 Dec 2023 17:47:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA79223692D;
	Fri,  8 Dec 2023 17:47:42 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 17:47:42 +0100
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
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/7] i2c: stm32f7: perform most of irq job in threaded handler
Date: Fri, 8 Dec 2023 17:47:10 +0100
Message-ID: <20231208164719.3584028-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208164719.3584028-1-alain.volmat@foss.st.com>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
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
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02

The irq handling is currently split between the irq handler
and the threaded irq handler.  Some of the handling (such as
dma related stuffs) done within the irq handler might sleep or
take some time leading to issues if the kernel is built with
realtime constraints.  In order to fix that, perform an overall
rework to perform most of the job within the threaded handler
and only keep fifo access in the non threaded handler.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 126 ++++++++++++++-----------------
 1 file changed, 56 insertions(+), 70 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 983509936727..34dcc370e615 100644
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
@@ -2205,8 +2188,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_irq(&pdev->dev, irq_error, stm32f7_i2c_isr_error, 0,
-			       pdev->name, i2c_dev);
+	ret = devm_request_threaded_irq(&pdev->dev, irq_error,
+					NULL,
+					stm32f7_i2c_isr_error_thread,
+					IRQF_ONESHOT,
+					pdev->name, i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq error %i\n",
 			irq_error);
-- 
2.25.1


