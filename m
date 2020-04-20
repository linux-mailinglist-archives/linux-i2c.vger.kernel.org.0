Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C4C1B0F0F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 16:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbgDTO6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 10:58:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13364 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727992AbgDTO6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 10:58:21 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03KEvxFv029858;
        Mon, 20 Apr 2020 16:58:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Htm7G4c6nkASZiIJZ/72en4USFOHh63A0jmfPAbpGcE=;
 b=lbzfMJvC0hdjd51qM0TvtqWrIQeW8Bfm+tXgkqUytf3dwovbM4MFB474qWFvvBghWKno
 0DcGmNH0HGbkRXK7YL+LbWO0NDUMW28NffODK1jd3npkMNMg+hn8Qh4iBcnWnUL0Ztb6
 OBNCvQFeSYdpLwf1WW3azGdtZAU4o5yVrMg+9puhGlR12hijfFbzQ5xEhkDL7uUOy6H0
 nERzqNc47snopvzJEKq1TCkVjCFnvQjkmz9qjofmuIB9+rFj3E0D0b3PRchAoDC31UKQ
 D8N6d4bq2ien8d0bHHZkZ3hyFHXQLfL04+KvrIHO2ItO91nYKnGkZPZKKfEz3M1N8j55 +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30fpp8k280-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Apr 2020 16:58:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A008100034;
        Mon, 20 Apr 2020 16:58:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25A612C1F79;
        Mon, 20 Apr 2020 16:58:07 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr 2020 16:58:06
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
Date:   Mon, 20 Apr 2020 16:57:56 +0200
Message-ID: <1587394677-6872-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587394677-6872-1-git-send-email-alain.volmat@st.com>
References: <1587394677-6872-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-20_05:2020-04-20,2020-04-20 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For STM32F7, STM32H7 and STM32MP1 SoCs, if timing parameters
match, the bus clock frequency can be from 1Hz to 1MHz.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3: identical to v1 & v2

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
2.7.4

