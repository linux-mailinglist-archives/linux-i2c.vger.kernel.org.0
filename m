Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92F63F8A62
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 09:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbfKLIT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 03:19:57 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:34048 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725811AbfKLIT5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Nov 2019 03:19:57 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAC8HbWf001225;
        Tue, 12 Nov 2019 09:19:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=v4gTBAxsgJ7NKkWijREg7mahBipp4rc6jcfGG/NsFI0=;
 b=CIiJnElyeqyya4SwztKSMIIb+ShthqGBFDvSx+z2/v7kGyurVxpqNeRJm3KC22Hgmek4
 UvA7WexYTj78WTwf9+aIHPtWbneFzDGWSAdUiuSUDsZAWB/c1eRyHCZDW5gmHQDyiVQF
 V90jQl5QYrr5hYCRXvIv8pS0zpdGO/NFJQ4JJrAmjZGZko5WtsKHcM0QtyvNdAbxbT5g
 aQLPU7ymC+pFU7gKPjIgoiay9TNuXNi5vVWSKnmCCUriGuX9ctpICERweNSDM1txx8cf
 pWMrZsVL9uhaKGKXD20GGnJF0mBlv8aONdLIa0ETu4b3MaLliSncGSNqTkKsgZNCrpD1 HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2w7pstrp5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Nov 2019 09:19:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4688510002A;
        Tue, 12 Nov 2019 09:19:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C20C2AA4E5;
        Tue, 12 Nov 2019 09:19:45 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 12 Nov 2019 09:19:44
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: i2c-stm32f7: fix 10-bits check in slave free id search loop
Date:   Tue, 12 Nov 2019 09:19:44 +0100
Message-ID: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix a typo in the free slave id search loop. Instead of I2C_CLIENT_PEC,
it should have been I2C_CLIENT_TEN. The slave id 1 can only handle 7-bit
addresses and thus is not eligible in case of 10-bit addresses.
As a matter of fact none of the slave id support I2C_CLIENT_PEC, overall
check is performed at the beginning of the stm32f7_i2c_reg_slave function.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b9a082f64d58..b2634afe066d 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1268,7 +1268,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 	 * slave[1] supports 7-bit slave address only
 	 */
 	for (i = STM32F7_I2C_MAX_SLAVE - 1; i >= 0; i--) {
-		if (i == 1 && (slave->flags & I2C_CLIENT_PEC))
+		if (i == 1 && (slave->flags & I2C_CLIENT_TEN))
 			continue;
 		if (!i2c_dev->slave[i]) {
 			*id = i;
-- 
2.7.4

