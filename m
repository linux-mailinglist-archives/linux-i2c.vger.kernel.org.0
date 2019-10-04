Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B867CBE2A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 16:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389043AbfJDO4I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 10:56:08 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:57012 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388870AbfJDO4H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Oct 2019 10:56:07 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x94EklEK004895;
        Fri, 4 Oct 2019 16:55:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=C2L2NtjlwiLUFULq78CYy+ANWX8KvARrP/EK8PCiNyo=;
 b=z2PnPbFQtdklxQRQwWGz628eMZ5h4WVGqFc7SQUFydIqCrs5doQIAQ43lhiuVMJYY4yN
 o6+b35y9f+dg7R2/E6lXYPUqT+Rt/XfrT/21sei6zE+sP4iCTGIU5sqC6vzpAkU4SE1J
 kzIBRfPKHCprclV1EcYPSHdoVJfqnn68tRbU7SQcKQEfR2OI2NJ9xku/VDhDZHszkYmt
 auIzx0IAMUi9oBbfNb8zpiYV1UnD7W4PZOI0qdZTm362w+MPf/WRdD0fZlcpttxIGhAE
 wVGweKMRID6YHAxYIIqP77VYNBwyHPe93gRDPaMpxa+XSzVS4wfzlqUcPXVsCF5N9g/Z kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vcem3ggwv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Oct 2019 16:55:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AAED710002A;
        Fri,  4 Oct 2019 16:55:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0A2E2C9DF1;
        Fri,  4 Oct 2019 16:55:54 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 4 Oct 2019 16:55:54
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
CC:     <alain.volmat@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] i2c: i2c-stm32f7: remove warning when compiling with W=1
Date:   Fri, 4 Oct 2019 16:55:54 +0200
Message-ID: <1570200954-17919-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_07:2019-10-03,2019-10-04 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the following warning:

drivers/i2c/busses/i2c-stm32f7.c:315:
warning: cannot understand function prototype:
'struct stm32f7_i2c_spec i2c_specs[] =

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d36cf08..7aa4a47 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -305,7 +305,7 @@ struct stm32f7_i2c_dev {
 	struct regmap *regmap;
 };
 
-/**
+/*
  * All these values are coming from I2C Specification, Version 6.0, 4th of
  * April 2014.
  *
-- 
2.7.4

