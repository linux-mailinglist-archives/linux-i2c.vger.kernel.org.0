Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDBF017599E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 12:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgCBLdh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 06:33:37 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35988 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725996AbgCBLdg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Mar 2020 06:33:36 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022BXSbO002288;
        Mon, 2 Mar 2020 12:33:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LK5Rc8fBCqHr4BrNiCRui/DbI9k5MYuzFQ9Jui1JyFw=;
 b=sLI3Lp5o/9lux+MHY5cQrtsLRwzk8UtSEuOmUJR9jTL+3BcMaZv+FvP9jWer0XxJwBEa
 23mrkhjt1Pn43RrXHr29cvumJuI/c095CsOQ7LfFhVISkSnUYOf45hDgTVAM2WkpT242
 THaOk5W66Gs5eP5dMi4X0rJbMjNjnZlbM1MKBbc6SOlOpZpjHnfiYFRQ6K4tLKqVuwlc
 CIbDk/Zm9VlDnl7RqiVsmGUzuNENCbNLlrohj3kse3rpikFILCvfeCOsgsM+L/uDmApe
 d0j2RDOzrE5vyvX22Op4u16PqWHMmEMSqn/MtGc+f+KXmxgUdm8+84v6HP2ktq+rwQhF oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yffqpk3wf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 12:33:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09E99100034;
        Mon,  2 Mar 2020 12:33:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F252F2BEC69;
        Mon,  2 Mar 2020 12:33:16 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar 2020 12:33:16
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCHv2 3/5] i2c: i2c-stm32f7: add a new st,stm32mp15-i2c compatible
Date:   Mon, 2 Mar 2020 12:33:16 +0100
Message-ID: <1583148796-24285-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-02-28,2020-03-02 signatures=0
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
Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
----
v2: adapt struct stm32f7_i2c_dev fmp register variable naming (regmap_ -> fmp_)
---
 drivers/i2c/busses/i2c-stm32f7.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index cfe6d790a8fc..8fe7f8caf91b 100644
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
@@ -303,7 +305,8 @@ struct stm32f7_i2c_msg {
  * @dma: dma data
  * @use_dma: boolean to know if dma is used in the current transfer
  * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
- * @fmp_reg: register address for setting Fast Mode Plus bits
+ * @fmp_sreg: register address for setting Fast Mode Plus bits
+ * @fmp_creg: register address for clearing Fast Mode Plus bits
  * @fmp_mask: mask for Fast Mode Plus bits in set register
  * @wakeup_src: boolean to know if the device is a wakeup source
  */
@@ -328,7 +331,8 @@ struct stm32f7_i2c_dev {
 	struct stm32_i2c_dma *dma;
 	bool use_dma;
 	struct regmap *regmap;
-	u32 fmp_reg;
+	u32 fmp_sreg;
+	u32 fmp_creg;
 	u32 fmp_mask;
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
@@ -1837,14 +1849,25 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 static int stm32f7_i2c_write_fm_plus_bits(struct stm32f7_i2c_dev *i2c_dev,
 					  bool enable)
 {
+	int ret;
+
 	if (i2c_dev->speed != STM32_I2C_SPEED_FAST_PLUS ||
 	    IS_ERR_OR_NULL(i2c_dev->regmap))
 		/* Optional */
 		return 0;
 
-	return regmap_update_bits(i2c_dev->regmap, i2c_dev->fmp_reg,
-				  i2c_dev->fmp_mask,
-				  enable ? i2c_dev->fmp_mask : 0);
+	if (i2c_dev->fmp_sreg == i2c_dev->fmp_creg)
+		ret = regmap_update_bits(i2c_dev->regmap,
+					 i2c_dev->fmp_sreg,
+					 i2c_dev->fmp_mask,
+					 enable ? i2c_dev->fmp_mask : 0);
+	else
+		ret = regmap_write(i2c_dev->regmap,
+				   enable ? i2c_dev->fmp_sreg :
+					    i2c_dev->fmp_creg,
+				   i2c_dev->fmp_mask);
+
+	return ret;
 }
 
 static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
@@ -1859,10 +1882,13 @@ static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
 		return 0;
 
 	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 1,
-					 &i2c_dev->fmp_reg);
+					 &i2c_dev->fmp_sreg);
 	if (ret)
 		return ret;
 
+	i2c_dev->fmp_creg = i2c_dev->fmp_sreg +
+			       i2c_dev->setup.fmp_clr_offset;
+
 	return of_property_read_u32_index(np, "st,syscfg-fmp", 2,
 					  &i2c_dev->fmp_mask);
 }
@@ -2262,6 +2288,7 @@ static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 
 static const struct of_device_id stm32f7_i2c_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
+	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);
-- 
2.7.4
-
