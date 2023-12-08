Return-Path: <linux-i2c+bounces-688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C813A80A9A5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 17:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050681C20C01
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 16:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8F51DFE1;
	Fri,  8 Dec 2023 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="utfM1lWd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0F0198C;
	Fri,  8 Dec 2023 08:48:06 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3B8GBAPi008023;
	Fri, 8 Dec 2023 17:47:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=5dNPirvASkdcY7pOymXDVq0mD0jqbY8yDoyX0nISUyg=; b=ut
	fM1lWd/LM2IYHP0BS3cKcqWQ2Caqg1LOiW6ZpuI4XqE/I8EU7M5SvGhzvpK43YtY
	r2YeUT7LxCVghDJC+jB/+1DYE+ZrQvoZi8iwioFw66NbeZfl+Sei4UOTSao6R7ru
	QYPDHR8BXqMmhgLpc+lFZt46MEfhk4ROwm+Fm+GB7C5aZdN21evCUyzzYDj/gbdk
	z8oZ/ynWSbA1EkDYlfQMAzvcs3OBSf7p6eReQqSjKdRhbmFX2XcltG0Z0tDnP1QY
	gUi661tmaZIYevfrTwYwaCHUilbiWmzKUaXn+ngHe+tS0MldR5fRnvVoexH9W+lx
	7673DnQY3Wi98lNNrv6g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3utd2pnf16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 17:47:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55985100056;
	Fri,  8 Dec 2023 17:47:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B851236932;
	Fri,  8 Dec 2023 17:47:56 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Dec
 2023 17:47:56 +0100
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
Subject: [PATCH v2 2/7] i2c: stm32f7: simplify status messages in case of errors
Date: Fri, 8 Dec 2023 17:47:11 +0100
Message-ID: <20231208164719.3584028-3-alain.volmat@foss.st.com>
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

Avoid usage of __func__ when reporting an error message
since dev_err/dev_dbg are already providing enough details
to identify the source of the message.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 34dcc370e615..2a011deec3c5 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1602,6 +1602,7 @@ static irqreturn_t stm32f7_i2c_isr_error_thread(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
+	u16 addr = f7_msg->addr;
 	void __iomem *base = i2c_dev->base;
 	struct device *dev = i2c_dev->dev;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
@@ -1611,8 +1612,7 @@ static irqreturn_t stm32f7_i2c_isr_error_thread(int irq, void *data)
 
 	/* Bus error */
 	if (status & STM32F7_I2C_ISR_BERR) {
-		dev_err(dev, "<%s>: Bus error accessing addr 0x%x\n",
-			__func__, f7_msg->addr);
+		dev_err(dev, "Bus error accessing addr 0x%x\n", addr);
 		writel_relaxed(STM32F7_I2C_ICR_BERRCF, base + STM32F7_I2C_ICR);
 		stm32f7_i2c_release_bus(&i2c_dev->adap);
 		f7_msg->result = -EIO;
@@ -1620,21 +1620,19 @@ static irqreturn_t stm32f7_i2c_isr_error_thread(int irq, void *data)
 
 	/* Arbitration loss */
 	if (status & STM32F7_I2C_ISR_ARLO) {
-		dev_dbg(dev, "<%s>: Arbitration loss accessing addr 0x%x\n",
-			__func__, f7_msg->addr);
+		dev_dbg(dev, "Arbitration loss accessing addr 0x%x\n", addr);
 		writel_relaxed(STM32F7_I2C_ICR_ARLOCF, base + STM32F7_I2C_ICR);
 		f7_msg->result = -EAGAIN;
 	}
 
 	if (status & STM32F7_I2C_ISR_PECERR) {
-		dev_err(dev, "<%s>: PEC error in reception accessing addr 0x%x\n",
-			__func__, f7_msg->addr);
+		dev_err(dev, "PEC error in reception accessing addr 0x%x\n", addr);
 		writel_relaxed(STM32F7_I2C_ICR_PECCF, base + STM32F7_I2C_ICR);
 		f7_msg->result = -EINVAL;
 	}
 
 	if (status & STM32F7_I2C_ISR_ALERT) {
-		dev_dbg(dev, "<%s>: SMBus alert received\n", __func__);
+		dev_dbg(dev, "SMBus alert received\n");
 		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
 		i2c_handle_smbus_alert(i2c_dev->alert->ara);
 		return IRQ_HANDLED;
-- 
2.25.1


