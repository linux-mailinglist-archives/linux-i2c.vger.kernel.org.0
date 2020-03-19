Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB21418BF45
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 19:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgCSSWJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 14:22:09 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:43060 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726663AbgCSSWJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 14:22:09 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02JID3dP016634;
        Thu, 19 Mar 2020 19:22:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=G+/E9/Q9sLbpBhTh4T0w7AaQd0y57u80iKpFj5VnKPA=;
 b=RE7PHEwNRdJyshNH4hQX/2coCEg5//W3GTf9pzPbMZgs64CW+02LOCS242X/YHsuTvUa
 muuZBZ6ukbpvD4yWINz7B/Y3IQbeqprqTFgL/3IjOqgUEmeYASt29rs2yJEKErq/Vp9e
 PuujjVPtjSbpBpdS/99LqzCC9HXaePgMA9/vr2SkxBRAMhSIh6EaWAjGou9WNkN5qZw8
 X5NzlEzXoXibXXX6Valn5X4LCCYvDNxpyl0uAOnXHlfZAMLlyrIknz/K4GBxjqXuuFhc
 lD4u2fk2ojKxlctogJ1QElDm9eKk+xMzRL+t2tXvhIaYs2DV4GS6i7oWj3kLp94mAnjQ aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yu95uu59b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Mar 2020 19:22:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8CC710002A;
        Thu, 19 Mar 2020 19:21:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B10522190E;
        Thu, 19 Mar 2020 19:21:55 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 19 Mar 2020 19:21:55
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: i2c-stm32f7: improve nack debug message
Date:   Thu, 19 Mar 2020 19:21:55 +0100
Message-ID: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-19_07:2020-03-19,2020-03-19 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Fabrice Gasnier <fabrice.gasnier@st.com>

Add information on slave addr in the nack debug message.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 378956ac6d1d..78d40a4cc282 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1431,7 +1431,8 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 
 	/* NACK received */
 	if (status & STM32F7_I2C_ISR_NACKF) {
-		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK\n", __func__);
+		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
+			__func__, f7_msg->addr);
 		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
 		f7_msg->result = -ENXIO;
 	}
-- 
2.7.4

