Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 768DFC2449
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 17:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731885AbfI3P21 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Sep 2019 11:28:27 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:12236 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731127AbfI3P21 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Sep 2019 11:28:27 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8UFLau3016398;
        Mon, 30 Sep 2019 17:28:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yJpZfBWTDJMl1ZC5M8BD9X2h5CbjAxaL+Z0ej4FdTgo=;
 b=up9SvLA/BcQdNv6vMRe8ST2ZUnCZveKCUpa54cYfijgR7ucJcyTJtlPK+oO5WNL7C9YO
 G2qVmMc4jHQgfjF8zp4UD9JEEDHZ4ZA4HCgMF1Aa918Tf5TQMQsfNWIc0ctbOR5ocVe3
 b6Bji8Db8sqOIf5atNQW0dsFzuYC3HWt9e+bctpQG8QU0T4zInsGX1EigYogKTo3TT/T
 QXMPkxJNNRRzWUNTZbz2exF2B6XuxFUhw8w7Eqf3YPSeok0EW9lIVB6qME2HOLjro5oS
 07qU5tThzJwDsWmKc92H/fQrjMi2BVJ6kHPVBu4unrsu1I7vfR7pG+Wcz/ob9KE836dD wg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx07-00178001.pphosted.com with ESMTP id 2v9w00v119-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 30 Sep 2019 17:28:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7331922;
        Mon, 30 Sep 2019 15:28:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29BB62B3BF9;
        Mon, 30 Sep 2019 17:28:14 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 17:28:14 +0200
Received: from localhost (10.48.0.192) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 17:28:12 +0200
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: i2c-stm32f7: fix first byte to send in slave mode
Date:   Mon, 30 Sep 2019 17:28:01 +0200
Message-ID: <1569857281-19419-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-30,2019-09-30 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The slave-interface documentation [1] states "the bus driver should
transmit the first byte" upon I2C_SLAVE_READ_REQUESTED slave event:
- 'val': backend returns first byte to be sent
The driver currently ignores the 1st byte to send on this event.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")

[1] https://www.kernel.org/doc/Documentation/i2c/slave-interface

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 266d1c2..0af9219 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1192,6 +1192,8 @@ static void stm32f7_i2c_slave_start(struct stm32f7_i2c_dev *i2c_dev)
 			STM32F7_I2C_CR1_TXIE;
 		stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, mask);
 
+		/* Write 1st data byte */
+		writel_relaxed(value, base + STM32F7_I2C_TXDR);
 	} else {
 		/* Notify i2c slave that new write transfer is starting */
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
-- 
2.7.4

