Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B245213968
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 13:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgGCLgl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 07:36:41 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42130 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726283AbgGCLgk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jul 2020 07:36:40 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 063BZAtA004072;
        Fri, 3 Jul 2020 13:36:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6KPrrlVsST7NlCz4Rw2QjMKQtlwi7m2rHj6upRcLSII=;
 b=GPiI+O7ZBzfL2EToI5E4L1MpMQ01+0vaEKUPg5e18x7p+AF5tiigGBqE4KNPorWjiG0J
 aeFS/LQSg9yasmi06+vU/vkJRx8cHKX7/0lyVZ+mB9uPvk9AcnSf47DOgdPuEiJK6zsw
 Vpj9qLkm8CAJXXJEBQfX/nGbbiRaImXlj2hq/uB1CUSfWrxlx8WLzAej36BYIiZHURDm
 9cnBlOGrkPK2qMbN92xqo6C7/O2QE99U+bKqL94JjPlw5oif2TpM6tSMnXHqCCghT/oi
 Bj/65IcMUpV9gY0bopZ20HXp0yhgswm6Ukt+XFNgWEK+vk+qocajrEvySgyeR0KD0HIc Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31ww0gpfsp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Jul 2020 13:36:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E9ED10002A;
        Fri,  3 Jul 2020 13:36:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8304B2C750E;
        Fri,  3 Jul 2020 13:36:27 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul 2020 13:36:27
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v2 2/2] i2c: stm32f7: Add SMBus Host-Notify protocol support
Date:   Fri, 3 Jul 2020 13:36:08 +0200
Message-ID: <1593776168-17867-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-03_06:2020-07-02,2020-07-03 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rely on the core functions to implement the host-notify
protocol via the a I2C slave device.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 v2: fix slot #0 usage condition within stm32f7_i2c_get_free_slave_id

 drivers/i2c/busses/Kconfig       |   1 +
 drivers/i2c/busses/i2c-stm32f7.c | 110 +++++++++++++++++++++++++++++++++------
 2 files changed, 96 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 735bf31a3fdf..ae8671727a4c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1036,6 +1036,7 @@ config I2C_STM32F7
 	tristate "STMicroelectronics STM32F7 I2C support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	select I2C_SLAVE
+	select I2C_SMBUS
 	help
 	  Enable this option to add support for STM32 I2C controller embedded
 	  in STM32F7 SoCs.
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index bff3479fe122..223c238c3c09 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -50,6 +51,7 @@
 
 /* STM32F7 I2C control 1 */
 #define STM32F7_I2C_CR1_PECEN			BIT(23)
+#define STM32F7_I2C_CR1_SMBHEN			BIT(20)
 #define STM32F7_I2C_CR1_WUPEN			BIT(18)
 #define STM32F7_I2C_CR1_SBC			BIT(16)
 #define STM32F7_I2C_CR1_RXDMAEN			BIT(15)
@@ -150,7 +152,7 @@
 
 #define STM32F7_I2C_MAX_LEN			0xff
 #define STM32F7_I2C_DMA_LEN_MIN			0x16
-#define STM32F7_I2C_MAX_SLAVE			0x2
+#define STM32F7_I2C_MAX_SLAVE			0x3
 
 #define STM32F7_I2C_DNF_DEFAULT			0
 #define STM32F7_I2C_DNF_MAX			16
@@ -301,6 +303,8 @@ struct stm32f7_i2c_msg {
  * @fmp_creg: register address for clearing Fast Mode Plus bits
  * @fmp_mask: mask for Fast Mode Plus bits in set register
  * @wakeup_src: boolean to know if the device is a wakeup source
+ * @smbus_mode: states that the controller is configured in SMBus mode
+ * @host_notify_client: SMBus host-notify client
  */
 struct stm32f7_i2c_dev {
 	struct i2c_adapter adap;
@@ -327,6 +331,8 @@ struct stm32f7_i2c_dev {
 	u32 fmp_creg;
 	u32 fmp_mask;
 	bool wakeup_src;
+	bool smbus_mode;
+	struct i2c_client *host_notify_client;
 };
 
 /*
@@ -1321,10 +1327,18 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 	int i;
 
 	/*
-	 * slave[0] supports 7-bit and 10-bit slave address
-	 * slave[1] supports 7-bit slave address only
+	 * slave[0] support only SMBus Host address (0x8)
+	 * slave[1] supports 7-bit and 10-bit slave address
+	 * slave[2] supports 7-bit slave address only
 	 */
-	for (i = STM32F7_I2C_MAX_SLAVE - 1; i >= 0; i--) {
+	if (i2c_dev->smbus_mode && (slave->addr == 0x08)) {
+		if (i2c_dev->slave[0])
+			goto fail;
+		*id = 0;
+		return 0;
+	}
+
+	for (i = STM32F7_I2C_MAX_SLAVE - 1; i > 0; i--) {
 		if (i == 1 && (slave->flags & I2C_CLIENT_TEN))
 			continue;
 		if (!i2c_dev->slave[i]) {
@@ -1333,6 +1347,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 		}
 	}
 
+fail:
 	dev_err(dev, "Slave 0x%x could not be registered\n", slave->addr);
 
 	return -EINVAL;
@@ -1776,7 +1791,13 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
 		stm32f7_i2c_enable_wakeup(i2c_dev, true);
 
-	if (id == 0) {
+	switch (id) {
+	case 0:
+		/* Slave SMBus Host */
+		i2c_dev->slave[id] = slave;
+		break;
+
+	case 1:
 		/* Configure Own Address 1 */
 		oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
 		oar1 &= ~STM32F7_I2C_OAR1_MASK;
@@ -1789,7 +1810,9 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 		oar1 |= STM32F7_I2C_OAR1_OA1EN;
 		i2c_dev->slave[id] = slave;
 		writel_relaxed(oar1, i2c_dev->base + STM32F7_I2C_OAR1);
-	} else if (id == 1) {
+		break;
+
+	case 2:
 		/* Configure Own Address 2 */
 		oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
 		oar2 &= ~STM32F7_I2C_OAR2_MASK;
@@ -1802,7 +1825,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 		oar2 |= STM32F7_I2C_OAR2_OA2EN;
 		i2c_dev->slave[id] = slave;
 		writel_relaxed(oar2, i2c_dev->base + STM32F7_I2C_OAR2);
-	} else {
+		break;
+
+	default:
+		dev_err(dev, "I2C slave id not supported\n");
 		ret = -ENODEV;
 		goto pm_free;
 	}
@@ -1843,10 +1869,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 	if (ret < 0)
 		return ret;
 
-	if (id == 0) {
+	if (id == 1) {
 		mask = STM32F7_I2C_OAR1_OA1EN;
 		stm32f7_i2c_clr_bits(base + STM32F7_I2C_OAR1, mask);
-	} else {
+	} else if (id == 2) {
 		mask = STM32F7_I2C_OAR2_OA2EN;
 		stm32f7_i2c_clr_bits(base + STM32F7_I2C_OAR2, mask);
 	}
@@ -1911,14 +1937,51 @@ static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
 					  &i2c_dev->fmp_mask);
 }
 
+static int stm32f7_i2c_enable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
+{
+	struct i2c_adapter *adap = &i2c_dev->adap;
+	void __iomem *base = i2c_dev->base;
+	struct i2c_client *client;
+
+	client = i2c_new_slave_host_notify_device(adap);
+	if (IS_ERR(client))
+		return PTR_ERR(client);
+
+	i2c_dev->host_notify_client = client;
+
+	/* Enable SMBus Host address */
+	stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, STM32F7_I2C_CR1_SMBHEN);
+
+	return 0;
+}
+
+static void stm32f7_i2c_disable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
+{
+	void __iomem *base = i2c_dev->base;
+
+	if (i2c_dev->host_notify_client) {
+		/* Disable SMBus Host address */
+		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
+				     STM32F7_I2C_CR1_SMBHEN);
+		i2c_free_slave_host_notify_device(i2c_dev->host_notify_client);
+	}
+}
+
 static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SLAVE |
-		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
-		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
-		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
-		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
-		I2C_FUNC_SMBUS_I2C_BLOCK;
+	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+
+	u32 func = I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SLAVE |
+		   I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
+		   I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+		   I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
+		   I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
+		   I2C_FUNC_SMBUS_I2C_BLOCK;
+
+	if (i2c_dev->smbus_mode)
+		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
+
+	return func;
 }
 
 static const struct i2c_algorithm stm32f7_i2c_algo = {
@@ -2084,10 +2147,22 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	stm32f7_i2c_hw_config(i2c_dev);
 
+	i2c_dev->smbus_mode = of_property_read_bool(pdev->dev.of_node, "smbus");
+
 	ret = i2c_add_adapter(adap);
 	if (ret)
 		goto pm_disable;
 
+	if (i2c_dev->smbus_mode) {
+		ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
+		if (ret) {
+			dev_err(i2c_dev->dev,
+				"failed to enable SMBus Host-Notify protocol (%d)\n",
+				ret);
+			goto i2c_adapter_remove;
+		}
+	}
+
 	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
 
 	pm_runtime_mark_last_busy(i2c_dev->dev);
@@ -2095,6 +2170,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	return 0;
 
+i2c_adapter_remove:
+	i2c_del_adapter(adap);
+
 pm_disable:
 	pm_runtime_put_noidle(i2c_dev->dev);
 	pm_runtime_disable(i2c_dev->dev);
@@ -2126,6 +2204,8 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
+	stm32f7_i2c_disable_smbus_host(i2c_dev);
+
 	i2c_del_adapter(&i2c_dev->adap);
 	pm_runtime_get_sync(i2c_dev->dev);
 
-- 
2.7.4

