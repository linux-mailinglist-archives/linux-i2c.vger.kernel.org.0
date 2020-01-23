Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6CF5146E0A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 17:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAWQNd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 11:13:33 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21420 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727847AbgAWQNc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 11:13:32 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00NGCTX7000776;
        Thu, 23 Jan 2020 17:13:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JTPct5LXQA3mJqzeacuXKjIY3sMmY9QNN0YZLD+ZEtM=;
 b=aJcUKlUwf2HwFFMQY2VHifs0MxGqv1BKr4F//QKKToFss5sjmQkP0KXXHPfCcWTlaika
 3f0qvXtMD61qW50TjkHKWjknZ7BOfQaSYNayjnHxN5AKg5aWW6FMX6bqlJ643SsOt/Vg
 c8IYePwcOziA8Bkgd17O3ULrzID4Rxm8k7cPF4bycNXxyWUJvG3QHZRGcRBITgNx2202
 +gl7hza7K5uKZj48fPl/8wccj7Rvcku/0eba3PPKiMs2cGb0Uy4QYFoNsAeX6UYw+g7z
 eFxExpBkArNWrDEvte8NawBBAGmiQPM5cKE89cg3p7KNN0QOouoftJfYTR26s0YpFL2M TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkr1ebay8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jan 2020 17:13:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98B9F100040;
        Thu, 23 Jan 2020 17:13:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8868F2BC7D6;
        Thu, 23 Jan 2020 17:13:17 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 17:13:17
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH 3/5] i2c: i2c-stm32f7: add a new st,stm32mp15-i2c compatible
Date:   Thu, 23 Jan 2020 17:12:48 +0100
Message-ID: <1579795970-22319-4-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-23_08:2020-01-23,2020-01-23 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new stm32mp15 specific compatible to handle FastMode+
registers handling which is different on the stm32mp15 compared
to the stm32f7 or stm32h7.
Indeed, on the stm32mp15, the FastMode+ set and clear registers
are separated while on the other platforms (F7 or H7) the control
is done in a unique register.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 41 +++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 1a3b3fa582ff..6bee9eca789f 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -223,6 +223,7 @@ struct stm32f7_i2c_spec {
  * @fall_time: Fall time (ns)
  * @dnf: Digital filter coefficient (0-16)
  * @analog_filter: Analog filter delay (On/Off)
+ * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
  */
 struct stm32f7_i2c_setup {
 	enum stm32_i2c_speed speed;
@@ -232,6 +233,7 @@ struct stm32f7_i2c_setup {
 	u32 fall_time;
 	u8 dnf;
 	bool analog_filter;
+	u32 fmp_clr_offset;
 };
 
 /**
@@ -303,8 +305,9 @@ struct stm32f7_i2c_msg {
  * @dma: dma data
  * @use_dma: boolean to know if dma is used in the current transfer
  * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
- * @regmap_reg: register address for setting Fast Mode Plus bits
- * @regmap_mask: mask for Fast Mode Plus bits in set register
+ * @regmap_sreg: register address for setting Fast Mode Plus bits
+ * @regmap_creg: register address for clearing Fast Mode Plus bits
+ * @regmap_mask: mask for Fast Mode Plus bits
  * @wakeup_src: boolean to know if the device is a wakeup source
  */
 struct stm32f7_i2c_dev {
@@ -328,7 +331,8 @@ struct stm32f7_i2c_dev {
 	struct stm32_i2c_dma *dma;
 	bool use_dma;
 	struct regmap *regmap;
-	u32 regmap_reg;
+	u32 regmap_sreg;
+	u32 regmap_creg;
 	u32 regmap_mask;
 	bool wakeup_src;
 };
@@ -386,6 +390,14 @@ static const struct stm32f7_i2c_setup stm32f7_setup = {
 	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
 };
 
+static const struct stm32f7_i2c_setup stm32mp15_setup = {
+	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
+	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
+	.dnf = STM32F7_I2C_DNF_DEFAULT,
+	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
+	.fmp_clr_offset = 0x40,
+};
+
 static inline void stm32f7_i2c_set_bits(void __iomem *reg, u32 mask)
 {
 	writel_relaxed(readl_relaxed(reg) | mask, reg);
@@ -1822,15 +1834,26 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 static int stm32f7_i2c_write_fm_plus_bits(struct stm32f7_i2c_dev *i2c_dev,
 					  bool enable)
 {
+	int ret;
+
 	if (i2c_dev->speed != STM32_I2C_SPEED_FAST_PLUS ||
 	    IS_ERR_OR_NULL(i2c_dev->regmap)) {
 		/* Optional */
 		return 0;
 	}
 
-	return regmap_update_bits(i2c_dev->regmap, i2c_dev->regmap_reg,
-				  i2c_dev->regmap_mask,
-				  enable ? i2c_dev->regmap_mask : 0);
+	if (i2c_dev->regmap_sreg == i2c_dev->regmap_creg)
+		ret = regmap_update_bits(i2c_dev->regmap,
+					 i2c_dev->regmap_sreg,
+					 i2c_dev->regmap_mask,
+					 enable ? i2c_dev->regmap_mask : 0);
+	else
+		ret = regmap_write(i2c_dev->regmap,
+				   enable ? i2c_dev->regmap_sreg :
+					    i2c_dev->regmap_creg,
+				   i2c_dev->regmap_mask);
+
+	return ret;
 }
 
 static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
@@ -1846,10 +1869,13 @@ static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
 	}
 
 	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 1,
-					 &i2c_dev->regmap_reg);
+					 &i2c_dev->regmap_sreg);
 	if (ret)
 		return ret;
 
+	i2c_dev->regmap_creg = i2c_dev->regmap_sreg +
+			       i2c_dev->setup.fmp_clr_offset;
+
 	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 2,
 					 &i2c_dev->regmap_mask);
 	if (ret)
@@ -2271,6 +2297,7 @@ static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 
 static const struct of_device_id stm32f7_i2c_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
+	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);
-- 
2.7.4

