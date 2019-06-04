Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 712FF34886
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 15:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfFDNVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 09:21:39 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:15850 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727093AbfFDNVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 09:21:39 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x54DHe5h015265;
        Tue, 4 Jun 2019 15:21:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Z2wZnvXgH6bB09YHyNfYI32IlYynHCA1Xqq9/7lFTwg=;
 b=H+I7whk9sG8h4A89ycMv5XHr1o7DazjFe9o/suKueQljc0gCwHkcZKiPP8ZO72HqyO9N
 KsELv+j+c8gXO+WvAhhb4FDUdC+5kljDnqeqS0uceyHzFlDHuditRub05LqtzFLCAF3L
 aIrIYywGTIzQ0D/uHBHrn4syzqPkmMqUG2PmkfYnLO8Ld/pfiVdX/yJiv8iUUa52BeNN
 7guXsQ9Mpk74TSDAjHEKoIhtxYkN9i+WjgEYaMa8/rjlyHR5Kt7onZftDkoWJgFZP8je
 MOmDmRVeqkFF2sFS6TPsuOZHuyQl0DSXGGBCObvpLydJ2KNxGtkZN3RRGeHTplD0eomE jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sunmegvxm-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 04 Jun 2019 15:21:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BB0F34;
        Tue,  4 Jun 2019 13:21:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF6662A65;
        Tue,  4 Jun 2019 13:21:10 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Jun 2019 15:21:10
 +0200
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: i2c-stm32f7: Add I2C_SMBUS_I2C_BLOCK_DATA support
Date:   Tue, 4 Jun 2019 15:20:51 +0200
Message-ID: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_09:,,
 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
for the stm32f7 SMBUS Controller.
Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
Emulated transfer will fall back calling i2c transfer method where there's
already support for DMAs for example.
So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
for such a case.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 48337be..68a751e 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -953,6 +953,9 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 		cr2 &= ~STM32F7_I2C_CR2_RD_WRN;
 		f7_msg->read_write = I2C_SMBUS_READ;
 		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		/* Rely on emulated i2c transfer (through master_xfer) */
+		return -EOPNOTSUPP;
 	default:
 		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
 		return -EOPNOTSUPP;
@@ -1803,7 +1806,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
 		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
-		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC;
+		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
+		I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
 static struct i2c_algorithm stm32f7_i2c_algo = {
-- 
2.7.4

