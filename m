Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05ECC2F48
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 10:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733200AbfJAIvw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 04:51:52 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37450 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727361AbfJAIvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Oct 2019 04:51:52 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x918aqa3032721;
        Tue, 1 Oct 2019 10:51:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pHr2o+ZAoiEIH4WNUEwd9qYwlYMRQA1EuZfFQPwwXFA=;
 b=ceANKyQriGj7GYQEv1c9rHo45HNQobCG6YZP3AMFOBN4o92ul8CSv0d45ZdJFwOxI4cY
 JV3RL1c5NH45gyU3xjew5P1QGeL9kZa1O0MgDEkLw5TON/KZKyu/xA8ssDScji3uyjGy
 jwP/z7AUu+dDYvkJjxw2y30rg4l9UyQ30b2iG3/S9lVbfkWm6X7r93V9NmgskjhCkwkG
 P3h4drbVxw9czQUNqxQmnBdKX+Wc4pAHIKCd3EvyXY6A1K9C+3CnjWc+IuL1aaWoZAW8
 6I2Mf+siPsU53Fu4w/dtbXOmaM+W2HtLW5Df1K+UG2ZiYPo8wpRcOCGrPsRBvjHVf6Ag sQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx08-00178001.pphosted.com with ESMTP id 2v9xdgqmf4-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 01 Oct 2019 10:51:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6063523;
        Tue,  1 Oct 2019 08:51:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B97C42B2FF9;
        Tue,  1 Oct 2019 10:51:39 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 1 Oct 2019
 10:51:39 +0200
Received: from localhost (10.48.0.192) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 1 Oct 2019 10:51:39 +0200
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: i2c-stm32f7: fix a race in slave mode with arbitration loss irq
Date:   Tue, 1 Oct 2019 10:51:09 +0200
Message-ID: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-01_04:2019-10-01,2019-10-01 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When in slave mode, an arbitration loss (ARLO) may be detected before the
slave had a chance to detect the stop condition (STOPF in ISR).
This is seen when two master + slave adapters switch their roles. It
provokes the i2c bus to be stuck, busy as SCL line is stretched.
- the I2C_SLAVE_STOP event is never generated due to STOPF flag is set but
  don't generate an irq (race with ARLO irq, STOPIE is masked). STOPF flag
  remains set until next master xfer (e.g. when STOPIE irq get unmasked).
  In this case, completion is generated too early: immediately upon new
  transfer request (then it doesn't send all data).
- Some data get stuck in TXDR register. As a consequence, the controller
  stretches the SCL line: the bus gets busy until a future master transfer
  triggers the bus busy / recovery mechanism (this can take time... and
  may never happen at all)

So choice is to let the STOPF being detected by the slave isr handler,
to properly handle this stop condition. E.g. don't mask IRQs in error
handler, when the slave is running.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 266d1c2..3a8ab0c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1501,7 +1501,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	void __iomem *base = i2c_dev->base;
 	struct device *dev = i2c_dev->dev;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
-	u32 mask, status;
+	u32 status;
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
@@ -1526,12 +1526,15 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 		f7_msg->result = -EINVAL;
 	}
 
-	/* Disable interrupts */
-	if (stm32f7_i2c_is_slave_registered(i2c_dev))
-		mask = STM32F7_I2C_XFER_IRQ_MASK;
-	else
-		mask = STM32F7_I2C_ALL_IRQ_MASK;
-	stm32f7_i2c_disable_irq(i2c_dev, mask);
+	if (!i2c_dev->slave_running) {
+		u32 mask;
+		/* Disable interrupts */
+		if (stm32f7_i2c_is_slave_registered(i2c_dev))
+			mask = STM32F7_I2C_XFER_IRQ_MASK;
+		else
+			mask = STM32F7_I2C_ALL_IRQ_MASK;
+		stm32f7_i2c_disable_irq(i2c_dev, mask);
+	}
 
 	/* Disable dma */
 	if (i2c_dev->use_dma) {
-- 
2.7.4

