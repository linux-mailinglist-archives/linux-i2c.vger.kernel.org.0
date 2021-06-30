Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AD03B84D1
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 16:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235271AbhF3OPt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 10:15:49 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:49320 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235088AbhF3OPl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Jun 2021 10:15:41 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15UEAY0h002860;
        Wed, 30 Jun 2021 16:12:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2vk0SM1w1rYwBoKsGyRqoKEvl040SvG0KTlIbUrKgsc=;
 b=Z1d9v2V2HDrqhk0MZUnAz3mbRajKOrOhUStToRb4SFG4plLLFkABzrzbvm3vF6p2ZJkQ
 8mAL1QZXGXVJerZ4E94/hRGdgTANjyqGNo1RgAfvE+24aa92S3mMwmuTizzuiIcXAttR
 Q2zBtFHhBxr1OliAftxJELttwA7le6qd6X/vNKKoww+qhcHkChQXm8FX2ldCrORgh8l1
 nJiW3SRWXnHeZThK3CD184V/9oQNUwSnCeeFpye+x+HmhpoPJ951VWP+fQ/RPFmcSFHu
 cngiVrGseXFTM0rryX7Y7yi2sHLNmdoPama/w4SJaeuSZve1zKvxtJtVhB3AVMMIgU5l Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39g4kpy7f2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Jun 2021 16:12:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF43810003A;
        Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E465F23151D;
        Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:57
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 3/3] i2c: stm32f7: prevent calling slave handling if no slave running
Date:   Wed, 30 Jun 2021 16:11:43 +0200
Message-ID: <1625062303-15327-4-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_06:2021-06-29,2021-06-30 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Slave interrupt handler should only be called if there is actually
a slave registered and running to avoid accessing an invalid pointer.

Without this commit, an OOPS can be generated due to a NULL ptr dereference
while receiving an IT when there is no master transfer and no slave
running:
  - stm32f7_i2c_isr_event
  - no master_mode hence calling stm32f7_i2c_slave_isr_event
  - access to i2c_dev->slave_running leading to oops due to
slave_running being NULL.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0d99c075deb2..2cc9bb0f6d7f 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1497,10 +1497,14 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 	u32 status, mask;
 	int ret = IRQ_HANDLED;
 
-	/* Check if the interrupt if for a slave device */
+	/* Check if the interrupt is for a slave device */
 	if (!i2c_dev->master_mode) {
-		ret = stm32f7_i2c_slave_isr_event(i2c_dev);
-		return ret;
+		if (i2c_dev->slave_running)
+			return stm32f7_i2c_slave_isr_event(i2c_dev);
+
+		dev_warn_ratelimited(i2c_dev->dev,
+				"Unexpected IT received: ISR:0x%x\n",
+				readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR));
 	}
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
-- 
2.25.1

