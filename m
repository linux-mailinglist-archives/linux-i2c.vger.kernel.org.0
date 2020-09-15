Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CF026A1C3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 11:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgIOJMI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 05:12:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:60358 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726130AbgIOJLv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 05:11:51 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08F98H9f022258;
        Tue, 15 Sep 2020 11:11:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=a2n/VyvPL5cAo3F9MDe6vyiMgotrwIrVTK+SWyJLDSw=;
 b=KVJs7BeeDzxet4I8mZSqnmowPgBQk6tXj46ILQIpe4DZ8lC++wmMx/jOK3mbJLA6z5oq
 Hjzg7j/vJfJBm1PRQiaeVC2xvom049KRmzsHzHqqqCT9U50qfMlrM7nmB76i4wlZUSxm
 wQPzCjp9tir9Bjj8115ZYgPqasuUiVhq7Om5OyJTF5MM4sFuH3qukIVfJ5enkQrbXv3F
 zCiGbYWMsoV5BKQyRS/jS9pS6eqFco/h/g8D6BSVM297Ei2Ij/hWG0QXI/mYFc0BDBAQ
 Fvwr0PgCPdXs2gsCUNHXCie/5/S81VkYiYjR7onHGquXbAEnWaSQCdzSCxrfmIIFocJu vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33gn7gxnpv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 11:11:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CEEEB10002A;
        Tue, 15 Sep 2020 11:11:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FA592A447E;
        Tue, 15 Sep 2020 11:11:31 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep 2020 11:11:30
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH 1/2] i2c: stm32: fix slot id after introduction of host-notify support
Date:   Tue, 15 Sep 2020 11:11:30 +0200
Message-ID: <1600161090-9899-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_05:2020-09-15,2020-09-15 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit 68302245720a ("i2c: stm32f7: Add SMBus Host-Notify protocol support")
added a new slot specific for handling host-notify however failed
to update the previous slot ID leading to having the 7bit address
only slot with the wrong number.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b401940c5580..0880f6a4cd44 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1355,7 +1355,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	for (i = STM32F7_I2C_MAX_SLAVE - 1; i > 0; i--) {
-		if (i == 1 && (slave->flags & I2C_CLIENT_TEN))
+		if (i == 2 && (slave->flags & I2C_CLIENT_TEN))
 			continue;
 		if (!i2c_dev->slave[i]) {
 			*id = i;
-- 
2.7.4

