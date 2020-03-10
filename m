Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E3917F6ED
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJL65 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:58:57 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:17096 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726269AbgCJL65 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 07:58:57 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02ABqhBb001980;
        Tue, 10 Mar 2020 12:58:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=7PdSQP9uKR51iNtYVitiCEnAIHdj8uJHoRAAyMFEF+A=;
 b=PA6Bxm1MH9uoNGVpvd0UA0ZOnLLatTfG6cCHVl/4/GduExtCzgdJD+SBQyg4DgQs8ikl
 hwnd04UPk1Oi22YgTPhNlqLJ4xvc1EbZa17RFknl/k8xl0nS0f+SGtwsWQrCE+96GBnS
 ssckaewO5YiLVWLmI2aaPA+vAASQsdsH1Kk6dNjnzdrAE8OETgs5QBm0L8A1BASKzldH
 yHjP6Zzk+Y3OQTHPz0+t6SV0k57UPmPA48h60Ovkj2Fk72wKvGR1y3O2ZLhqJmLFcv5v
 P55JJOMOS3C2RjdfZr4tDJ/LK+2R+QHrjR4kQo15kJIRxMW3CI4tB9l0ei4E8/lkBCI/ PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ym292b4eh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Mar 2020 12:58:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14ED9100038;
        Tue, 10 Mar 2020 12:58:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D42302A971D;
        Tue, 10 Mar 2020 12:58:41 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Mar 2020 12:58:41
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH v2] i2c: stm32f7: do not backup read-only PECR register
Date:   Tue, 10 Mar 2020 12:58:41 +0100
Message-ID: <1583841521-27897-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-10_06:2020-03-10,2020-03-10 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PECR register provides received packet computed PEC value. 
It makes no sense restoring its value after a reset, and anyway,
as read-only register it cannot be restored.

Fixes: ea6dd25deeb5 ("i2c: stm32f7: add PM_SLEEP suspend/resume support")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
v2: rebase on top of other i2c-stm32f7 patches integrated within i2c-next

 drivers/i2c/busses/i2c-stm32f7.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 8fe7f8caf91b..6418f5982894 100644
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
 
@@ -2196,7 +2194,6 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
 	backup_regs->oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
 	backup_regs->oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
-	backup_regs->pecr = readl_relaxed(i2c_dev->base + STM32F7_I2C_PECR);
 	backup_regs->tmgr = readl_relaxed(i2c_dev->base + STM32F7_I2C_TIMINGR);
 	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
 
@@ -2229,7 +2226,6 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
 	writel_relaxed(backup_regs->cr2, i2c_dev->base + STM32F7_I2C_CR2);
 	writel_relaxed(backup_regs->oar1, i2c_dev->base + STM32F7_I2C_OAR1);
 	writel_relaxed(backup_regs->oar2, i2c_dev->base + STM32F7_I2C_OAR2);
-	writel_relaxed(backup_regs->pecr, i2c_dev->base + STM32F7_I2C_PECR);
 	stm32f7_i2c_write_fm_plus_bits(i2c_dev, true);
 
 	pm_runtime_put_sync(i2c_dev->dev);
-- 
2.7.4

