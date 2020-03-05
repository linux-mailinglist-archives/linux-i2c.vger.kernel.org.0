Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E17617A5DA
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 13:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgCEM7U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 07:59:20 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:28648 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726079AbgCEM7U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 07:59:20 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025Cs3FF003395;
        Thu, 5 Mar 2020 13:59:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=kbeBInStQhKprtBz37U6vPmYbsT1Uo2/O0T4DgkAcNY=;
 b=GTfuLgWr+dR73eql1QKTbZLeG6eq6ns1Iv5DiF9uX2hDbRCKWqwjlBDVfb+/teeEG7PJ
 ZyRLcDGXykZoZrgi3thbNAxS6LyIescWGoQ794VRudExN/1Z43VaQdxgntPrb/SYYm8s
 aMZlzlL2MLBjShwgdeGCQXxoGd4TrrY57F4Ut+8EPR/LdOD6Uwf1LWasQY27kiaNvpe2
 GCyLkwJGcUmk8kCVX5/fa1LYGP9Tlo5wjFmduBAmNzfEQy//TGjDJu12XyOOcHsDmdXQ
 XpVGQjNZO03SXMFFk9+jvCAIvBEkjImqwpdJzOlg43lZoUmSgvLSdVerN31cIxf3bVdj bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfem17xvs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Mar 2020 13:59:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98F6710002A;
        Thu,  5 Mar 2020 13:59:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A33152ADD8F;
        Thu,  5 Mar 2020 13:59:01 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 5 Mar 2020 13:59:00
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: stm32f7: do not backup read-only PECR register
Date:   Thu, 5 Mar 2020 13:59:01 +0100
Message-ID: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_03:2020-03-05,2020-03-05 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PECR register provides received packet computed PEC value. 
It makes no sense restoring its value after a reset, and anyway,
as read-only register it cannot be restored.

Fixes: ea6dd25deeb5 ("i2c: stm32f7: add PM_SLEEP suspend/resume support")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 378956ac6d1d..4d7401d62b71 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -176,7 +176,6 @@
  * @cr2: Control register 2
  * @oar1: Own address 1 register
  * @oar2: Own address 2 register
- * @pecr: PEC register
  * @tmgr: Timing register
  */
 struct stm32f7_i2c_regs {
@@ -184,7 +183,6 @@ struct stm32f7_i2c_regs {
 	u32 cr2;
 	u32 oar1;
 	u32 oar2;
-	u32 pecr;
 	u32 tmgr;
 };
 
@@ -2146,7 +2144,6 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
 	backup_regs->oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
 	backup_regs->oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
-	backup_regs->pecr = readl_relaxed(i2c_dev->base + STM32F7_I2C_PECR);
 	backup_regs->tmgr = readl_relaxed(i2c_dev->base + STM32F7_I2C_TIMINGR);
 
 	pm_runtime_put_sync(i2c_dev->dev);
@@ -2178,7 +2175,6 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
 	writel_relaxed(backup_regs->cr2, i2c_dev->base + STM32F7_I2C_CR2);
 	writel_relaxed(backup_regs->oar1, i2c_dev->base + STM32F7_I2C_OAR1);
 	writel_relaxed(backup_regs->oar2, i2c_dev->base + STM32F7_I2C_OAR2);
-	writel_relaxed(backup_regs->pecr, i2c_dev->base + STM32F7_I2C_PECR);
 
 	pm_runtime_put_sync(i2c_dev->dev);
 
-- 
2.7.4

