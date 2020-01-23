Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F3B146E00
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 17:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgAWQNe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 11:13:34 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:50224 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728900AbgAWQNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 11:13:34 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00NFvfwU031446;
        Thu, 23 Jan 2020 17:13:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Z+ZWugU9zZd6hKhPnNDDZVEE+awHm4FXGbQ7fLxQnOM=;
 b=zhIt+aKOv0JaK+1p11aWSRLw84S98EugP/BIVPRAXDvXViE2MJnmC0dwD6Uwu12c3Ha3
 exCvxhJjVs+auKOgPxi2N0ZMdi6OTmneElaCXr4/aFb0wJ0gFNVDPv4qd0CnywNM2/sJ
 bZH4jBXNoqG1Kc9qnwkwBSe2WWC6Yb3Y96GFAE4Djg2RA2Q+Uf7WX6a5WfFMGuM+omlv
 +vt8NkuofIZKXAagxMAoyS6f6B8jZ8m2Os+ynOvT/Qc27o/gKN6HDZas1Y2Z0Rbblo0t
 ufSOB/WAffGs+sh6wVnRK0Xlg6DxCOX15k3nX1ZXOc/OeGHzq2/0wuWEh3ljOMg9qZ2s jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xksspaynw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jan 2020 17:13:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26BD010002A;
        Thu, 23 Jan 2020 17:13:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15CF52BC7D5;
        Thu, 23 Jan 2020 17:13:17 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 17:13:16
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
Subject: [PATCH 2/5] dt-bindings: i2c: i2c-stm32f7: add st,stm32mp15-i2c compatible
Date:   Thu, 23 Jan 2020 17:12:47 +0100
Message-ID: <1579795970-22319-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-23_08:2020-01-23,2020-01-23 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new stm32mp15 specific compatible to handle FastMode+
registers which are different on the stm32mp15 compared
to the stm32f7 or stm32h7.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 900ec1ab6a47..ffe00737446e 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -17,6 +17,7 @@ allOf:
           contains:
             enum:
               - st,stm32f7-i2c
+              - st,stm32mp15-i2c
     then:
       properties:
         i2c-scl-rising-time-ns:
@@ -52,6 +53,7 @@ properties:
     enum:
       - st,stm32f4-i2c
       - st,stm32f7-i2c
+      - st,stm32mp15-i2c
 
   reg:
     maxItems: 1
@@ -121,12 +123,12 @@ examples:
           clocks = <&rcc 1 CLK_I2C1>;
       };
 
-    //Example 3 (with st,stm32f7-i2c compatible on stm32mp)
+    //Example 3 (with st,stm32mp15-i2c compatible on stm32mp)
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/stm32mp1-clks.h>
     #include <dt-bindings/reset/stm32mp1-resets.h>
       i2c@40013000 {
-          compatible = "st,stm32f7-i2c";
+          compatible = "st,stm32mp15-i2c";
           #address-cells = <1>;
           #size-cells = <0>;
           reg = <0x40013000 0x400>;
-- 
2.7.4

