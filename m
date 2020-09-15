Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BE526A1C9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 11:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgIOJMW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 05:12:22 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7320 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726357AbgIOJLv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 05:11:51 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08F98V8l023596;
        Tue, 15 Sep 2020 11:11:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=g4kST7SsfaViCNlFfZ08siUj72Yl/Jmwp5npYZfdOOc=;
 b=KscuE9KcDMkqxGs6xutCqIVOYdI42kni92TwIIURoiWVp5BKT7Q0q2QmcRk9JZb7qbwn
 0IYMs22AIsmRaCNw3Mwu4BuT871ZxF4CL+jXkNZXGnBINA1RuWaCrSElBb/dB10nv7VA
 ID/xEOw0osqoKk07lDbLlGGJjj/Ppt8IPnUgIqFyV3H4A86OUsUrvbweCU1lZX6QnykZ
 2HRKyzGFxj8I9ZlN6hqncw6aywc2EtirGMDB1TN95gtAQ/i/ePxjfUub+wdXL65V086I
 rHOct/T3DB8SFFjwXnqZiGFOxFgk0P/doRRsTTtgDKZCrrKgPfsduWKNVNn6CJSfldcq oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33gkf9f1rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 11:11:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3127910002A;
        Tue, 15 Sep 2020 11:11:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D1732A4483;
        Tue, 15 Sep 2020 11:11:42 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep 2020 11:11:41
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH 2/2] i2c: stm32: name slave slot to ease maintenance
Date:   Tue, 15 Sep 2020 11:11:41 +0200
Message-ID: <1600161101-9941-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_05:2020-09-15,2020-09-15 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Name slave slots in order to ease code maintenance.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0880f6a4cd44..a7432ec7d992 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -155,7 +155,12 @@
 
 #define STM32F7_I2C_MAX_LEN			0xff
 #define STM32F7_I2C_DMA_LEN_MIN			0x16
-#define STM32F7_I2C_MAX_SLAVE			0x3
+enum {
+	STM32F7_SLAVE_HOSTNOTIFY,
+	STM32F7_SLAVE_7_10_BITS_ADDR,
+	STM32F7_SLAVE_7_BITS_ADDR,
+	STM32F7_I2C_MAX_SLAVE
+};
 
 #define STM32F7_I2C_DNF_DEFAULT			0
 #define STM32F7_I2C_DNF_MAX			16
@@ -1343,19 +1348,20 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 	int i;
 
 	/*
-	 * slave[0] support only SMBus Host address (0x8)
-	 * slave[1] supports 7-bit and 10-bit slave address
-	 * slave[2] supports 7-bit slave address only
+	 * slave[STM32F7_SLAVE_HOSTNOTIFY] support only SMBus Host address (0x8)
+	 * slave[STM32F7_SLAVE_7_10_BITS_ADDR] supports 7-bit and 10-bit slave address
+	 * slave[STM32F7_SLAVE_7_BITS_ADDR] supports 7-bit slave address only
 	 */
 	if (i2c_dev->smbus_mode && (slave->addr == 0x08)) {
-		if (i2c_dev->slave[0])
+		if (i2c_dev->slave[STM32F7_SLAVE_HOSTNOTIFY])
 			goto fail;
-		*id = 0;
+		*id = STM32F7_SLAVE_HOSTNOTIFY;
 		return 0;
 	}
 
-	for (i = STM32F7_I2C_MAX_SLAVE - 1; i > 0; i--) {
-		if (i == 2 && (slave->flags & I2C_CLIENT_TEN))
+	for (i = STM32F7_I2C_MAX_SLAVE - 1; i > STM32F7_SLAVE_HOSTNOTIFY; i--) {
+		if ((i == STM32F7_SLAVE_7_BITS_ADDR) &&
+		    (slave->flags & I2C_CLIENT_TEN))
 			continue;
 		if (!i2c_dev->slave[i]) {
 			*id = i;
-- 
2.7.4

