Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8301312F3
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgAFNa1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:30:27 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:60623 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726383AbgAFN35 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 08:29:57 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 006DRNnY015657;
        Mon, 6 Jan 2020 14:29:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=fcQwQK7DhsbJHsH4iVjG86araMbU8oHNqCR0+zSFh5g=;
 b=Hlg+3+62gXswrbVmCJ/sddrHKt3p/9wz2FijIPGNpL10UAlpwlWAL0rr4QbraDNG/tl7
 URGMqwtxRpGmZKBseVhI1aDA5TiN3xvhVOsm9lmrW8vfPNUuqQZHWvdFXVtCj0s4zzQF
 RFxt8l5BrXdo3pdi1tVUDQff+gEimL2l92GSdmhhnwwEeWh1sky8Y0VoDyAHcybQzkII
 EW3Ej/ctyreKaZyL41VrGYDeXGggmmbd8usWKNKVO4pg+ALSNRALEo7QhPizRxU5/Up+
 zR76UqQhN7K47xViRpBtCB5udqnV31POwPUEl3HcTC+WnduaY+eZl8has1hnSofs977y rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakuqg3qp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jan 2020 14:29:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B4DF10002A;
        Mon,  6 Jan 2020 14:29:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EBD42D378B;
        Mon,  6 Jan 2020 14:29:43 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jan 2020 14:29:43
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH 4/6] i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support
Date:   Mon, 6 Jan 2020 14:28:32 +0100
Message-ID: <1578317314-17197-5-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Backup/restore I2C registers as part of the suspend/resume
handlers. The device is marked as suspended to ensure that
transfers are rejected during the suspended period.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 117 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b2634afe066d..5c3e8ac6ad92 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -169,6 +169,24 @@
 #define STM32F7_AUTOSUSPEND_DELAY		(HZ / 100)
 
 /**
+ * struct stm32f7_i2c_regs - i2c f7 registers backup
+ * @cr1: Control register 1
+ * @cr2: Control register 2
+ * @oar1: Own address 1 register
+ * @oar2: Own address 2 register
+ * @pecr: PEC register
+ * @tmgr: Timing register
+ */
+struct stm32f7_i2c_regs {
+	u32 cr1;
+	u32 cr2;
+	u32 oar1;
+	u32 oar2;
+	u32 pecr;
+	u32 tmgr;
+};
+
+/**
  * struct stm32f7_i2c_spec - private i2c specification timing
  * @rate: I2C bus speed (Hz)
  * @rate_min: 80% of I2C bus speed (Hz)
@@ -276,6 +294,7 @@ struct stm32f7_i2c_msg {
  * @timing: I2C computed timings
  * @slave: list of slave devices registered on the I2C bus
  * @slave_running: slave device currently used
+ * @backup_regs: backup of i2c controller registers (for suspend/resume)
  * @slave_dir: transfer direction for the current slave device
  * @master_mode: boolean to know in which mode the I2C is running (master or
  * slave)
@@ -298,6 +317,7 @@ struct stm32f7_i2c_dev {
 	struct stm32f7_i2c_timings timing;
 	struct i2c_client *slave[STM32F7_I2C_MAX_SLAVE];
 	struct i2c_client *slave_running;
+	struct stm32f7_i2c_regs backup_regs;
 	u32 slave_dir;
 	bool master_mode;
 	struct stm32_i2c_dma *dma;
@@ -2027,8 +2047,7 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int stm32f7_i2c_runtime_suspend(struct device *dev)
+static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
@@ -2038,7 +2057,7 @@ static int stm32f7_i2c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int stm32f7_i2c_runtime_resume(struct device *dev)
+static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int ret;
@@ -2053,11 +2072,101 @@ static int stm32f7_i2c_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
+
+static int __maybe_unused
+stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
+{
+	int ret;
+	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
+
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0)
+		return ret;
+
+	backup_regs->cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
+	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
+	backup_regs->oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
+	backup_regs->oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
+	backup_regs->pecr = readl_relaxed(i2c_dev->base + STM32F7_I2C_PECR);
+	backup_regs->tmgr = readl_relaxed(i2c_dev->base + STM32F7_I2C_TIMINGR);
+
+	pm_runtime_put_sync(i2c_dev->dev);
+
+	return ret;
+}
+
+static int __maybe_unused
+stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
+{
+	u32 cr1;
+	int ret;
+	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
+
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0)
+		return ret;
+
+	cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
+	if (cr1 & STM32F7_I2C_CR1_PE)
+		stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
+				     STM32F7_I2C_CR1_PE);
+
+	writel_relaxed(backup_regs->tmgr, i2c_dev->base + STM32F7_I2C_TIMINGR);
+	writel_relaxed(backup_regs->cr1 & ~STM32F7_I2C_CR1_PE,
+		       i2c_dev->base + STM32F7_I2C_CR1);
+	if (backup_regs->cr1 & STM32F7_I2C_CR1_PE)
+		stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
+				     STM32F7_I2C_CR1_PE);
+	writel_relaxed(backup_regs->cr2, i2c_dev->base + STM32F7_I2C_CR2);
+	writel_relaxed(backup_regs->oar1, i2c_dev->base + STM32F7_I2C_OAR1);
+	writel_relaxed(backup_regs->oar2, i2c_dev->base + STM32F7_I2C_OAR2);
+	writel_relaxed(backup_regs->pecr, i2c_dev->base + STM32F7_I2C_PECR);
+
+	pm_runtime_put_sync(i2c_dev->dev);
+
+	return ret;
+}
+
+static int __maybe_unused stm32f7_i2c_suspend(struct device *dev)
+{
+	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int ret;
+
+	i2c_mark_adapter_suspended(&i2c_dev->adap);
+	ret = stm32f7_i2c_regs_backup(i2c_dev);
+	if (ret < 0) {
+		i2c_mark_adapter_resumed(&i2c_dev->adap);
+		return ret;
+	}
+
+	pinctrl_pm_select_sleep_state(dev);
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int __maybe_unused stm32f7_i2c_resume(struct device *dev)
+{
+	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+	pinctrl_pm_select_default_state(dev);
+
+	ret = stm32f7_i2c_regs_restore(i2c_dev);
+	if (ret < 0)
+		return ret;
+	i2c_mark_adapter_resumed(&i2c_dev->adap);
+
+	return 0;
+}
 
 static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
 			   stm32f7_i2c_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(stm32f7_i2c_suspend, stm32f7_i2c_resume)
 };
 
 static const struct of_device_id stm32f7_i2c_match[] = {
-- 
2.7.4

