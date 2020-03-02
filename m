Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37690175999
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 12:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgCBLdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 06:33:23 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35914 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725996AbgCBLdX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Mar 2020 06:33:23 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022BNSR4012757;
        Mon, 2 Mar 2020 12:33:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=u/3EhNUAqwCWTExaWSBfRQATTiR3E5D/Mz6MD04Bw6g=;
 b=hroE/SB9DqDFrKs9iZAYGAth3FHpPCSF2PwHBTCDXKs6bKcFTYxxZy3HgE9vlH37iJWJ
 q3oZhfIcf0AIj/hdDLM8IVeHWwDZosAL7Y1wLaSUkuHTHWpmVBU9iNYhtfsAX1i2MIxw
 Z+obZ34ju/0lt+Eoxo/fFFRbB1dCSDIA8xpQ8e8eSDJ0Dtf2Jl8p3H4pV4XEF9kfBj4G
 5b35NZFozO9eYthzqX+CivTHoJYcERlrdyJoWj5e8/hSl5+zLouWUR06hYK3/8BAN1YM
 xfw5lEd/S2wmKCbJi/T8esYF8mzxM+rtZcaMFJzWpeFJvWJ1IyP4f/pntGSQB92urKe0 Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yffqpk3w1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 12:33:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BBDF100034;
        Mon,  2 Mar 2020 12:33:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C8DA2BEC69;
        Mon,  2 Mar 2020 12:33:08 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar 2020 12:33:07
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCHv2 1/5] i2c: i2c-stm32f7: disable/restore Fast Mode Plus bits in low power modes
Date:   Mon, 2 Mar 2020 12:33:07 +0100
Message-ID: <1583148787-24236-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-02-28,2020-03-02 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Defer the initial enabling of the Fast Mode Plus bits after the
stm32f7_i2c_setup_timing call in probe function in order to avoid
enabling them if speed is downgraded.
Clear & restore the Fast Mode Plus bits in the suspend/resume
handlers of the driver.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

----
v2: rename struct stm32f7_i2c_msg regmap_reg/regmap_mask into fmp_reg/fmp_mask
    remove useless brackets
    remove useless if (ret) ... return 0 
    use true/false in stm32f7_i2c_write_fm_plus_bits calls
---
 drivers/i2c/busses/i2c-stm32f7.c | 52 ++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 378956ac6d1d..cfe6d790a8fc 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -303,6 +303,8 @@ struct stm32f7_i2c_msg {
  * @dma: dma data
  * @use_dma: boolean to know if dma is used in the current transfer
  * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
+ * @fmp_reg: register address for setting Fast Mode Plus bits
+ * @fmp_mask: mask for Fast Mode Plus bits in set register
  * @wakeup_src: boolean to know if the device is a wakeup source
  */
 struct stm32f7_i2c_dev {
@@ -326,6 +328,8 @@ struct stm32f7_i2c_dev {
 	struct stm32_i2c_dma *dma;
 	bool use_dma;
 	struct regmap *regmap;
+	u32 fmp_reg;
+	u32 fmp_mask;
 	bool wakeup_src;
 };
 
@@ -1830,28 +1834,37 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 	return 0;
 }
 
+static int stm32f7_i2c_write_fm_plus_bits(struct stm32f7_i2c_dev *i2c_dev,
+					  bool enable)
+{
+	if (i2c_dev->speed != STM32_I2C_SPEED_FAST_PLUS ||
+	    IS_ERR_OR_NULL(i2c_dev->regmap))
+		/* Optional */
+		return 0;
+
+	return regmap_update_bits(i2c_dev->regmap, i2c_dev->fmp_reg,
+				  i2c_dev->fmp_mask,
+				  enable ? i2c_dev->fmp_mask : 0);
+}
+
 static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
 					  struct stm32f7_i2c_dev *i2c_dev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	int ret;
-	u32 reg, mask;
 
 	i2c_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg-fmp");
-	if (IS_ERR(i2c_dev->regmap)) {
+	if (IS_ERR(i2c_dev->regmap))
 		/* Optional */
 		return 0;
-	}
-
-	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 1, &reg);
-	if (ret)
-		return ret;
 
-	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 2, &mask);
+	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 1,
+					 &i2c_dev->fmp_reg);
 	if (ret)
 		return ret;
 
-	return regmap_update_bits(i2c_dev->regmap, reg, mask, mask);
+	return of_property_read_u32_index(np, "st,syscfg-fmp", 2,
+					  &i2c_dev->fmp_mask);
 }
 
 static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
@@ -1929,9 +1942,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 				       &clk_rate);
 	if (!ret && clk_rate >= 1000000) {
 		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
-		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
-		if (ret)
-			goto clk_free;
 	} else if (!ret && clk_rate >= 400000) {
 		i2c_dev->speed = STM32_I2C_SPEED_FAST;
 	} else if (!ret && clk_rate >= 100000) {
@@ -1991,6 +2001,15 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto clk_free;
 
+	if (i2c_dev->speed == STM32_I2C_SPEED_FAST_PLUS) {
+		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
+		if (ret)
+			goto clk_free;
+		ret = stm32f7_i2c_write_fm_plus_bits(i2c_dev, true);
+		if (ret)
+			goto clk_free;
+	}
+
 	adap = &i2c_dev->adap;
 	i2c_set_adapdata(adap, i2c_dev);
 	snprintf(adap->name, sizeof(adap->name), "STM32F7 I2C(%pa)",
@@ -2015,7 +2034,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev,
 				"Failed to request dma error %i\n", ret);
-		goto clk_free;
+		goto fmp_clear;
 	}
 
 	if (i2c_dev->wakeup_src) {
@@ -2069,6 +2088,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		i2c_dev->dma = NULL;
 	}
 
+fmp_clear:
+	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
+
 clk_free:
 	clk_disable_unprepare(i2c_dev->clk);
 
@@ -2101,6 +2123,8 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
 		i2c_dev->dma = NULL;
 	}
 
+	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
+
 	clk_disable_unprepare(i2c_dev->clk);
 
 	return 0;
@@ -2148,6 +2172,7 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 	backup_regs->oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
 	backup_regs->pecr = readl_relaxed(i2c_dev->base + STM32F7_I2C_PECR);
 	backup_regs->tmgr = readl_relaxed(i2c_dev->base + STM32F7_I2C_TIMINGR);
+	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
 
 	pm_runtime_put_sync(i2c_dev->dev);
 
@@ -2179,6 +2204,7 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
 	writel_relaxed(backup_regs->oar1, i2c_dev->base + STM32F7_I2C_OAR1);
 	writel_relaxed(backup_regs->oar2, i2c_dev->base + STM32F7_I2C_OAR2);
 	writel_relaxed(backup_regs->pecr, i2c_dev->base + STM32F7_I2C_PECR);
+	stm32f7_i2c_write_fm_plus_bits(i2c_dev, true);
 
 	pm_runtime_put_sync(i2c_dev->dev);
 
-- 
2.7.4

