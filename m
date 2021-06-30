Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077453B84CF
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 16:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234851AbhF3OPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 10:15:43 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38192 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235116AbhF3OPk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Jun 2021 10:15:40 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15UEClFe019668;
        Wed, 30 Jun 2021 16:12:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vwmnhmTHKfjU0Z6OnQKzznj0YzS9IAT39KjKpR8LzIE=;
 b=WYTNDmsfCzL/d7MHJKqishFkpACc0qMLpR2ZaXvqw2vMsyNoNfW7LrCsBzEJScTPmqie
 wjx/rLtgq9xTWyi58xMp7RJZ1GzFEaHyYl+8TCmrZXB9CZfqQZAPwPM9Tzo2p21Jsb5V
 pbvqx+Pg7louPI2JzsI0Z5uwsPKisbE4ayw1M8mwQKIt1vo098h0qFO2Wow1sNoujCHj
 NRpngEOr1XHAjBOZnjnh0ltokYKV98icUHRT6UiFJcGuAjg2ytlpVX17DmENYM2SrQL5
 IHXHvPs4ZR0UhCTlsPdxk3Whr2pYCvSEs6e3AX0xiF/jGT76QxbeWFIuothuyJBQwQWU hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39gnbpjpf3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Jun 2021 16:12:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88C93100039;
        Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B22923151F;
        Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:56
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 2/3] i2c: stm32f7: flush TX FIFO upon transfer errors
Date:   Wed, 30 Jun 2021 16:11:42 +0200
Message-ID: <1625062303-15327-3-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_06:2021-06-29,2021-06-30 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While handling an error during transfer (ex: NACK), it could
happen that the driver has already written data into the TX Fifo
before the transfer get stopped.
This commit add FIFO Flush after end of transfer in case of error to
avoid sending a wrong data on any other slave upon next transfer.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d596733136c3..0d99c075deb2 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1696,6 +1696,15 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 	time_left = wait_for_completion_timeout(&i2c_dev->complete,
 						i2c_dev->adap.timeout);
 	ret = f7_msg->result;
+	if (ret) {
+		/*
+		 * It is possible that some unsent data have already been
+		 * written in the TX Fifo. To avoid sending old data in a
+		 * further transfer, flush FIFO in case of any error
+		 */
+		writel_relaxed(STM32F7_I2C_ISR_TXE,
+			       i2c_dev->base + STM32F7_I2C_ISR);
+	}
 
 	if (!time_left) {
 		dev_dbg(i2c_dev->dev, "Access to slave 0x%x timed out\n",
@@ -1745,8 +1754,16 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	timeout = wait_for_completion_timeout(&i2c_dev->complete,
 					      i2c_dev->adap.timeout);
 	ret = f7_msg->result;
-	if (ret)
+	if (ret) {
+		/*
+		 * It is possible that some unsent data have already been
+		 * written in the TX Fifo. To avoid sending old data in a
+		 * further transfer, flush FIFO in case of any error
+		 */
+		writel_relaxed(STM32F7_I2C_ISR_TXE,
+			       i2c_dev->base + STM32F7_I2C_ISR);
 		goto pm_free;
+	}
 
 	if (!timeout) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
-- 
2.25.1

