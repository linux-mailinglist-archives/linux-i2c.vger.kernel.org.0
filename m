Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70369373C2B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 15:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhEENSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 09:18:34 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:50208 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231265AbhEENSd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 09:18:33 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 145DGkIV011934;
        Wed, 5 May 2021 15:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=MQTZxYDV16ztBDB126pWN/m/7nOz9QM2k/Fh46U45vs=;
 b=xuhqFovH0A2/NDZ/G/6A5pY74WBd4Ofsdc+BFufiD+JQXOmupfhEdcOnrW6xV6IURVU4
 +1hluCexB83d77qToT0uloRo1V1M6i7yBGhxOF7kgtlC60AnUUvLGqG7j5nVOvPJKza5
 qfUBccm1U1Aqc/ur7n4GKsvAgRe1KyfesEZjr/Tfb/OGY5RHXenBNd8AhSViDSuWq+Zm
 2VJv1/NoSzW+6ORag5xCFvdHmgLeNIjBddpOYEdClYFw0UIuOXWOuYLLSbDNEq1c89v2
 fWWEywNA50mzwkWDg0gl1+ty1NFRBHC3VqRKC9c4KeF273Af/ge5+mZz/zI+IGUfZH72 eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38be9svcqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 May 2021 15:17:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93E63100039;
        Wed,  5 May 2021 15:17:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 854F32C4206;
        Wed,  5 May 2021 15:17:22 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May 2021 15:17:22
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH v4 2/2] i2c: stm32f7: add SMBus-Alert support
Date:   Wed, 5 May 2021 15:14:39 +0200
Message-ID: <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-05_07:2021-05-05,2021-05-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the SMBus-Alert protocol to the STM32F7 that has
dedicated control and status logic.

If SMBus-Alert is used, the SMBALERT# pin must be configured as alternate
function for I2C Alert.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v4: - check for smbus-alert property
v2: - rely on st,smbus-alert binding instead of smbus
---
 drivers/i2c/busses/i2c-stm32f7.c | 73 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0138317ea600..b9b19a2a2ffa 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -51,6 +51,7 @@
 
 /* STM32F7 I2C control 1 */
 #define STM32F7_I2C_CR1_PECEN			BIT(23)
+#define STM32F7_I2C_CR1_ALERTEN			BIT(22)
 #define STM32F7_I2C_CR1_SMBHEN			BIT(20)
 #define STM32F7_I2C_CR1_WUPEN			BIT(18)
 #define STM32F7_I2C_CR1_SBC			BIT(16)
@@ -125,6 +126,7 @@
 				(((n) & STM32F7_I2C_ISR_ADDCODE_MASK) >> 17)
 #define STM32F7_I2C_ISR_DIR			BIT(16)
 #define STM32F7_I2C_ISR_BUSY			BIT(15)
+#define STM32F7_I2C_ISR_ALERT			BIT(13)
 #define STM32F7_I2C_ISR_PECERR			BIT(11)
 #define STM32F7_I2C_ISR_ARLO			BIT(9)
 #define STM32F7_I2C_ISR_BERR			BIT(8)
@@ -138,6 +140,7 @@
 #define STM32F7_I2C_ISR_TXE			BIT(0)
 
 /* STM32F7 I2C Interrupt Clear */
+#define STM32F7_I2C_ICR_ALERTCF			BIT(13)
 #define STM32F7_I2C_ICR_PECCF			BIT(11)
 #define STM32F7_I2C_ICR_ARLOCF			BIT(9)
 #define STM32F7_I2C_ICR_BERRCF			BIT(8)
@@ -279,6 +282,17 @@ struct stm32f7_i2c_msg {
 };
 
 /**
+ * struct stm32f7_i2c_alert - SMBus alert specific data
+ * @setup: platform data for the smbus_alert i2c client
+ * @ara: I2C slave device used to respond to the SMBus Alert with Alert
+ * Response Address
+ */
+struct stm32f7_i2c_alert {
+	struct i2c_smbus_alert_setup setup;
+	struct i2c_client *ara;
+};
+
+/**
  * struct stm32f7_i2c_dev - private data of the controller
  * @adap: I2C adapter for this controller
  * @dev: device for this controller
@@ -310,6 +324,7 @@ struct stm32f7_i2c_msg {
  * @analog_filter: boolean to indicate enabling of the analog filter
  * @dnf_dt: value of digital filter requested via dt
  * @dnf: value of digital filter to apply
+ * @alert: SMBus alert specific data
  */
 struct stm32f7_i2c_dev {
 	struct i2c_adapter adap;
@@ -341,6 +356,7 @@ struct stm32f7_i2c_dev {
 	bool analog_filter;
 	u32 dnf_dt;
 	u32 dnf;
+	struct stm32f7_i2c_alert *alert;
 };
 
 /*
@@ -1624,6 +1640,13 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 		f7_msg->result = -EINVAL;
 	}
 
+	if (status & STM32F7_I2C_ISR_ALERT) {
+		dev_dbg(dev, "<%s>: SMBus alert received\n", __func__);
+		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
+		i2c_handle_smbus_alert(i2c_dev->alert->ara);
+		return IRQ_HANDLED;
+	}
+
 	if (!i2c_dev->slave_running) {
 		u32 mask;
 		/* Disable interrupts */
@@ -1990,6 +2013,42 @@ static void stm32f7_i2c_disable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
 	}
 }
 
+static int stm32f7_i2c_enable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
+{
+	struct stm32f7_i2c_alert *alert;
+	struct i2c_adapter *adap = &i2c_dev->adap;
+	struct device *dev = i2c_dev->dev;
+	void __iomem *base = i2c_dev->base;
+
+	alert = devm_kzalloc(dev, sizeof(*alert), GFP_KERNEL);
+	if (!alert)
+		return -ENOMEM;
+
+	alert->ara = i2c_new_smbus_alert_device(adap, &alert->setup);
+	if (IS_ERR(alert->ara))
+		return PTR_ERR(alert->ara);
+
+	i2c_dev->alert = alert;
+
+	/* Enable SMBus Alert */
+	stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, STM32F7_I2C_CR1_ALERTEN);
+
+	return 0;
+}
+
+static void stm32f7_i2c_disable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
+{
+	struct stm32f7_i2c_alert *alert = i2c_dev->alert;
+	void __iomem *base = i2c_dev->base;
+
+	if (alert) {
+		/* Disable SMBus Alert */
+		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
+				     STM32F7_I2C_CR1_ALERTEN);
+		i2c_unregister_device(alert->ara);
+	}
+}
+
 static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
@@ -2173,6 +2232,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
+		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
+		if (ret) {
+			dev_err(i2c_dev->dev,
+				"failed to enable SMBus alert protocol (%d)\n",
+				ret);
+			goto i2c_disable_smbus_host;
+		}
+	}
+
 	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
 
 	pm_runtime_mark_last_busy(i2c_dev->dev);
@@ -2180,6 +2249,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	return 0;
 
+i2c_disable_smbus_host:
+	stm32f7_i2c_disable_smbus_host(i2c_dev);
+
 i2c_adapter_remove:
 	i2c_del_adapter(adap);
 
@@ -2214,6 +2286,7 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
+	stm32f7_i2c_disable_smbus_alert(i2c_dev);
 	stm32f7_i2c_disable_smbus_host(i2c_dev);
 
 	i2c_del_adapter(&i2c_dev->adap);
-- 
2.7.4

