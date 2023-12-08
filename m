Return-Path: <linux-i2c+bounces-690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B580A9B0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 17:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0871C209E0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2C73064B;
	Fri,  8 Dec 2023 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="exKdg3LQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F48219A5;
	Fri,  8 Dec 2023 08:49:09 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3B8G2YXv008014;
	Fri, 8 Dec 2023 17:48:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=O1RmGoqBD1VYg6nCbPnSeZ5wq7KCCHnIBSQMcdR+Dh8=; b=ex
	Kdg3LQHGWlVUbjeARKqxSKG6kH31RylLf5hoMwB+kdgWK8oDF8NVHoB54OpkeC4Y
	nKti/16BozMSH5+GdmUzB56Fnx+o2bk8Tl68z4HH+JW8h0HG0LEsh0+FRZWgPUzH
	5fb4gaYp8eVoQflZAQ6Ax08kAquYibLIEpXAxJp2NCxPg1PPQXeS14aHM6bCmDdQ
	hdhsTPoc+K+A0C+hswr+Yzk9URRVVRMhqn3YKfFDbkg/WvrA6Hzr0uRGgd+UQrsn
	Vx5udhhEVGHd4FcMVSqhTmrqLEb29X6SsOr7gtatOw7nBJ6A1GdJg5vqqTUMc5Z+
	6X3j+HbdfRy4JnIZW8Zw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2pnf33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 17:48:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B540100058;
	Fri,  8 Dec 2023 17:48:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 726B623693C;
	Fri,  8 Dec 2023 17:48:43 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 17:48:43 +0100
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
        Valentin
 Caron <valentin.caron@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/7] i2c: stm32f7: add support for stm32mp25 soc
Date: Fri, 8 Dec 2023 17:47:13 +0100
Message-ID: <20231208164719.3584028-5-alain.volmat@foss.st.com>
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

The stm32mp25 has only a single interrupt line used for both
events and errors. In order to cope with that, reorganise the
error handling code so that it can be called either from the
common handler (used in case of SoC having only a single IT line)
and the error handler for others.
The CR1 register also embeds a new FMP bit, necessary when running
at Fast Mode Plus frequency. This bit should be used instead of
the SYSCFG bit used on other platforms.
Add a new compatible to distinguish between the SoCs and two
boolean within the setup structure in order to know if the
platform has a single/multiple IT lines and if the FMP bit
within CR1 is available or not.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 230 ++++++++++++++++++-------------
 1 file changed, 133 insertions(+), 97 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 2a011deec3c5..5634332900fb 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -50,6 +50,7 @@
 #define STM32F7_I2C_TXDR			0x28
 
 /* STM32F7 I2C control 1 */
+#define STM32_I2C_CR1_FMP			BIT(24)
 #define STM32F7_I2C_CR1_PECEN			BIT(23)
 #define STM32F7_I2C_CR1_ALERTEN			BIT(22)
 #define STM32F7_I2C_CR1_SMBHEN			BIT(20)
@@ -226,6 +227,8 @@ struct stm32f7_i2c_spec {
  * @rise_time: Rise time (ns)
  * @fall_time: Fall time (ns)
  * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
+ * @single_it_line: Only a single IT line is used for both events/errors
+ * @fmp_cr1_bit: Fast Mode Plus control is done via a bit in CR1
  */
 struct stm32f7_i2c_setup {
 	u32 speed_freq;
@@ -233,6 +236,8 @@ struct stm32f7_i2c_setup {
 	u32 rise_time;
 	u32 fall_time;
 	u32 fmp_clr_offset;
+	bool single_it_line;
+	bool fmp_cr1_bit;
 };
 
 /**
@@ -418,6 +423,13 @@ static const struct stm32f7_i2c_setup stm32mp13_setup = {
 	.fmp_clr_offset = 0x4,
 };
 
+static const struct stm32f7_i2c_setup stm32mp25_setup = {
+	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
+	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
+	.single_it_line = true,
+	.fmp_cr1_bit = true,
+};
+
 static inline void stm32f7_i2c_set_bits(void __iomem *reg, u32 mask)
 {
 	writel_relaxed(readl_relaxed(reg) | mask, reg);
@@ -1419,15 +1431,13 @@ static bool stm32f7_i2c_is_slave_busy(struct stm32f7_i2c_dev *i2c_dev)
 	return i == busy;
 }
 
-static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
+static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev, u32 status)
 {
 	void __iomem *base = i2c_dev->base;
-	u32 cr2, status, mask;
+	u32 cr2, mask;
 	u8 val;
 	int ret;
 
-	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
-
 	/* Slave transmitter mode */
 	if (status & STM32F7_I2C_ISR_TXIS) {
 		i2c_slave_event(i2c_dev->slave_running,
@@ -1494,17 +1504,81 @@ static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev, u32 status)
+{
+	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
+	u16 addr = f7_msg->addr;
+	void __iomem *base = i2c_dev->base;
+	struct device *dev = i2c_dev->dev;
+	struct stm32_i2c_dma *dma = i2c_dev->dma;
+
+	/* Bus error */
+	if (status & STM32F7_I2C_ISR_BERR) {
+		dev_err(dev, "Bus error accessing addr 0x%x\n", addr);
+		writel_relaxed(STM32F7_I2C_ICR_BERRCF, base + STM32F7_I2C_ICR);
+		stm32f7_i2c_release_bus(&i2c_dev->adap);
+		f7_msg->result = -EIO;
+	}
+
+	/* Arbitration loss */
+	if (status & STM32F7_I2C_ISR_ARLO) {
+		dev_dbg(dev, "Arbitration loss accessing addr 0x%x\n", addr);
+		writel_relaxed(STM32F7_I2C_ICR_ARLOCF, base + STM32F7_I2C_ICR);
+		f7_msg->result = -EAGAIN;
+	}
+
+	if (status & STM32F7_I2C_ISR_PECERR) {
+		dev_err(dev, "PEC error in reception accessing addr 0x%x\n", addr);
+		writel_relaxed(STM32F7_I2C_ICR_PECCF, base + STM32F7_I2C_ICR);
+		f7_msg->result = -EINVAL;
+	}
+
+	if (status & STM32F7_I2C_ISR_ALERT) {
+		dev_dbg(dev, "SMBus alert received\n");
+		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
+		i2c_handle_smbus_alert(i2c_dev->alert->ara);
+		return IRQ_HANDLED;
+	}
+
+	if (!i2c_dev->slave_running) {
+		u32 mask;
+		/* Disable interrupts */
+		if (stm32f7_i2c_is_slave_registered(i2c_dev))
+			mask = STM32F7_I2C_XFER_IRQ_MASK;
+		else
+			mask = STM32F7_I2C_ALL_IRQ_MASK;
+		stm32f7_i2c_disable_irq(i2c_dev, mask);
+	}
+
+	/* Disable dma */
+	if (i2c_dev->use_dma) {
+		stm32f7_i2c_disable_dma_req(i2c_dev);
+		dmaengine_terminate_async(dma->chan_using);
+	}
+
+	i2c_dev->master_mode = false;
+	complete(&i2c_dev->complete);
+
+	return IRQ_HANDLED;
+}
+
+#define STM32F7_ERR_EVENTS (STM32F7_I2C_ISR_BERR | STM32F7_I2C_ISR_ARLO |\
+			    STM32F7_I2C_ISR_PECERR | STM32F7_I2C_ISR_ALERT)
 static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
 	u32 status;
 
-	/* Check if the interrupt is for a slave device */
-	if (!i2c_dev->master_mode)
-		return IRQ_WAKE_THREAD;
-
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
+	/*
+	 * Check if the interrupt is for a slave device or related
+	 * to errors flags (in case of single it line mode)
+	 */
+	if (!i2c_dev->master_mode ||
+	    (i2c_dev->setup.single_it_line && (status & STM32F7_ERR_EVENTS)))
+		return IRQ_WAKE_THREAD;
+
 	/* Tx empty */
 	if (status & STM32F7_I2C_ISR_TXIS)
 		stm32f7_i2c_write_tx_data(i2c_dev);
@@ -1531,10 +1605,14 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 	u32 status, mask;
 	int ret;
 
+	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
+
 	if (!i2c_dev->master_mode)
-		return stm32f7_i2c_slave_isr_event(i2c_dev);
+		return stm32f7_i2c_slave_isr_event(i2c_dev, status);
 
-	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
+	/* Handle errors in case of this handler is used for events/errors */
+	if (i2c_dev->setup.single_it_line && (status & STM32F7_ERR_EVENTS))
+		return stm32f7_i2c_handle_isr_errs(i2c_dev, status);
 
 	/* NACK received */
 	if (status & STM32F7_I2C_ISR_NACKF) {
@@ -1601,63 +1679,11 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 static irqreturn_t stm32f7_i2c_isr_error_thread(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
-	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
-	u16 addr = f7_msg->addr;
-	void __iomem *base = i2c_dev->base;
-	struct device *dev = i2c_dev->dev;
-	struct stm32_i2c_dma *dma = i2c_dev->dma;
 	u32 status;
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
-	/* Bus error */
-	if (status & STM32F7_I2C_ISR_BERR) {
-		dev_err(dev, "Bus error accessing addr 0x%x\n", addr);
-		writel_relaxed(STM32F7_I2C_ICR_BERRCF, base + STM32F7_I2C_ICR);
-		stm32f7_i2c_release_bus(&i2c_dev->adap);
-		f7_msg->result = -EIO;
-	}
-
-	/* Arbitration loss */
-	if (status & STM32F7_I2C_ISR_ARLO) {
-		dev_dbg(dev, "Arbitration loss accessing addr 0x%x\n", addr);
-		writel_relaxed(STM32F7_I2C_ICR_ARLOCF, base + STM32F7_I2C_ICR);
-		f7_msg->result = -EAGAIN;
-	}
-
-	if (status & STM32F7_I2C_ISR_PECERR) {
-		dev_err(dev, "PEC error in reception accessing addr 0x%x\n", addr);
-		writel_relaxed(STM32F7_I2C_ICR_PECCF, base + STM32F7_I2C_ICR);
-		f7_msg->result = -EINVAL;
-	}
-
-	if (status & STM32F7_I2C_ISR_ALERT) {
-		dev_dbg(dev, "SMBus alert received\n");
-		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
-		i2c_handle_smbus_alert(i2c_dev->alert->ara);
-		return IRQ_HANDLED;
-	}
-
-	if (!i2c_dev->slave_running) {
-		u32 mask;
-		/* Disable interrupts */
-		if (stm32f7_i2c_is_slave_registered(i2c_dev))
-			mask = STM32F7_I2C_XFER_IRQ_MASK;
-		else
-			mask = STM32F7_I2C_ALL_IRQ_MASK;
-		stm32f7_i2c_disable_irq(i2c_dev, mask);
-	}
-
-	/* Disable dma */
-	if (i2c_dev->use_dma) {
-		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_async(dma->chan_using);
-	}
-
-	i2c_dev->master_mode = false;
-	complete(&i2c_dev->complete);
-
-	return IRQ_HANDLED;
+	return stm32f7_i2c_handle_isr_errs(i2c_dev, status);
 }
 
 static int stm32f7_i2c_wait_polling(struct stm32f7_i2c_dev *i2c_dev)
@@ -1993,23 +2019,27 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 static int stm32f7_i2c_write_fm_plus_bits(struct stm32f7_i2c_dev *i2c_dev,
 					  bool enable)
 {
-	int ret;
+	int ret = 0;
 
 	if (i2c_dev->bus_rate <= I2C_MAX_FAST_MODE_FREQ ||
-	    IS_ERR_OR_NULL(i2c_dev->regmap))
+	    (!i2c_dev->setup.fmp_cr1_bit && IS_ERR_OR_NULL(i2c_dev->regmap)))
 		/* Optional */
 		return 0;
 
-	if (i2c_dev->fmp_sreg == i2c_dev->fmp_creg)
-		ret = regmap_update_bits(i2c_dev->regmap,
-					 i2c_dev->fmp_sreg,
-					 i2c_dev->fmp_mask,
-					 enable ? i2c_dev->fmp_mask : 0);
-	else
-		ret = regmap_write(i2c_dev->regmap,
-				   enable ? i2c_dev->fmp_sreg :
-					    i2c_dev->fmp_creg,
-				   i2c_dev->fmp_mask);
+	if (i2c_dev->setup.fmp_cr1_bit) {
+		if (enable)
+			stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1, STM32_I2C_CR1_FMP);
+		else
+			stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1, STM32_I2C_CR1_FMP);
+	} else {
+		if (i2c_dev->fmp_sreg == i2c_dev->fmp_creg)
+			ret = regmap_update_bits(i2c_dev->regmap, i2c_dev->fmp_sreg,
+						 i2c_dev->fmp_mask, enable ? i2c_dev->fmp_mask : 0);
+		else
+			ret = regmap_write(i2c_dev->regmap,
+					   enable ? i2c_dev->fmp_sreg : i2c_dev->fmp_creg,
+					   i2c_dev->fmp_mask);
+	}
 
 	return ret;
 }
@@ -2143,6 +2173,13 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
+	setup = of_device_get_match_data(&pdev->dev);
+	if (!setup) {
+		dev_err(&pdev->dev, "Can't get device data\n");
+		return -ENODEV;
+	}
+	i2c_dev->setup = *setup;
+
 	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
@@ -2152,10 +2189,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (irq_event < 0)
 		return irq_event;
 
-	irq_error = platform_get_irq(pdev, 1);
-	if (irq_error < 0)
-		return irq_error;
-
 	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
 						    "wakeup-source");
 
@@ -2186,23 +2219,22 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq_error,
-					NULL,
-					stm32f7_i2c_isr_error_thread,
-					IRQF_ONESHOT,
-					pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq error %i\n",
-			irq_error);
-		return ret;
-	}
+	if (!i2c_dev->setup.single_it_line) {
+		irq_error = platform_get_irq(pdev, 1);
+		if (irq_error < 0)
+			return irq_error;
 
-	setup = of_device_get_match_data(&pdev->dev);
-	if (!setup) {
-		dev_err(&pdev->dev, "Can't get device data\n");
-		return -ENODEV;
+		ret = devm_request_threaded_irq(&pdev->dev, irq_error,
+						NULL,
+						stm32f7_i2c_isr_error_thread,
+						IRQF_ONESHOT,
+						pdev->name, i2c_dev);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to request irq error %i\n",
+				irq_error);
+			return ret;
+		}
 	}
-	i2c_dev->setup = *setup;
 
 	ret = stm32f7_i2c_setup_timing(i2c_dev, &i2c_dev->setup);
 	if (ret)
@@ -2210,9 +2242,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	/* Setup Fast mode plus if necessary */
 	if (i2c_dev->bus_rate > I2C_MAX_FAST_MODE_FREQ) {
-		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
-		if (ret)
-			return ret;
+		if (!i2c_dev->setup.fmp_cr1_bit) {
+			ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
+			if (ret)
+				return ret;
+		}
+
 		ret = stm32f7_i2c_write_fm_plus_bits(i2c_dev, true);
 		if (ret)
 			return ret;
@@ -2491,6 +2526,7 @@ static const struct of_device_id stm32f7_i2c_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
 	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
 	{ .compatible = "st,stm32mp13-i2c", .data = &stm32mp13_setup},
+	{ .compatible = "st,stm32mp25-i2c", .data = &stm32mp25_setup},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);
-- 
2.25.1


