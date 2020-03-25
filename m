Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E706119307B
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 19:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgCYSg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 14:36:27 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56300 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727027AbgCYSg0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Mar 2020 14:36:26 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02PINxBN028146;
        Wed, 25 Mar 2020 19:36:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yzLGGuVlSt0I73Fh9RExQePxW20ZdZu6hbmfVVeMKVY=;
 b=KyhnQZJG+xwUvOeqGqNXid4+uOImL0CvPMwRCkYXIPTD9PQXRqW2dRDL3lCg9iZsZcgE
 dPn/PlF0+y+cgno+8BzJMw5ADpr7DXpcKKBxLUQQlf9pA6DQOnuUNTsJ9Yoe4amjGgXM
 qEMPIwCxNNBYQHjvsXCN5na9jVHGKM0Pt06SaMxdSz0v4u4V8GRZ8FemsAIIqt+4fImM
 HJQZSkOWfv1CdnN5RAkkF4F28alNG0Azd76MeDSpT51QBW5e8XUtSVdLdiGDHs/YmG9W
 lrcDt5VMMFPNS4SbbwqCAfYLEoP8Nc9lqCtxu3sPmmXBtPvQfk91HReSDfbBX/Vk9UJI SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ywapp72t2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Mar 2020 19:36:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 278FF100034;
        Wed, 25 Mar 2020 19:36:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B3E42AD2DB;
        Wed, 25 Mar 2020 19:36:11 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 25 Mar 2020 19:36:10
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH 1/2] dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
Date:   Wed, 25 Mar 2020 19:36:00 +0100
Message-ID: <1585161361-3408-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
References: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-25_09:2020-03-24,2020-03-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
match, the bus clock frequency can be from 1Hz to 1MHz.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 900ec1ab6a47..b50a2f420b36 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -80,11 +80,11 @@ properties:
   clock-frequency:
     description: Desired I2C bus clock frequency in Hz. If not specified,
                  the default 100 kHz frequency will be used.
-                 For STM32F7, STM32H7 and STM32MP1 SoCs, Standard-mode,
-                 Fast-mode and Fast-mode Plus are supported, possible
-                 values are 100000, 400000 and 1000000.
+                 For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
+                 match, the bus clock frequency can be from 1Hz to 1MHz.
     default: 100000
-    enum: [100000, 400000, 1000000]
+    minimum: 1
+    maximum: 1000000
 
 required:
   - compatible
-- 
2.17.1

