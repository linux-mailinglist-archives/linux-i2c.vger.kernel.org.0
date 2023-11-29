Return-Path: <linux-i2c+bounces-539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7137FD75E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 14:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA027282C1B
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 13:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77961DFE3;
	Wed, 29 Nov 2023 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Uq8tRhou"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7044E10D4;
	Wed, 29 Nov 2023 05:02:08 -0800 (PST)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ATBWfMR006277;
	Wed, 29 Nov 2023 14:01:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=B1gllxM07cZkFcyt3hFnW0r2ti4poMYoZdWOoNhH4I4=; b=Uq
	8tRhou14NhVqmvwP6VIocCm4i9lOH39XG6hNo5bqtKLp3UmDu1NWerj56pTypBb1
	vHWVfz54pz9CZ4dP2DGI7d/T8R7F4pq09a5HSGsHnlT5QBuNQl0xR5t2Ndau8RL6
	OxphFSGHIugVQPHxVcPilIclyE7k/qfIjgEuTpLbDIjLgI3AibHKnUeRXQhbf3fB
	KZFTM2v65LXowxYQMJwfkITBvy2uEjX+p1Jtx095EgIL5Vl+rkm5WYdmWcCcWFub
	32qxb42aygA6TU3gV/MCi3trFjklRYr2GR+ne66LF8PR88YBurNY+LE22QHAcNXy
	NVGKmqF9YJiZrIJrO2pw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3unffb522u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 14:01:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0C7110002A;
	Wed, 29 Nov 2023 14:01:55 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DF0221BF7C;
	Wed, 29 Nov 2023 14:01:56 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 29 Nov
 2023 14:01:56 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/7] dt-bindings: i2c: document st,stm32mp25-i2c compatible
Date: Wed, 29 Nov 2023 13:59:12 +0100
Message-ID: <20231129125920.1702497-4-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231129125920.1702497-1-alain.volmat@foss.st.com>
References: <20231129125920.1702497-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_09,2023-11-29_01,2023-05-22_02

Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
has only one interrupt line for both events and errors and differs in
term of handling of FastModePlus.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 49 +++++++++++++++----
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 94b75d9f66cd..6a69bb6de23e 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -19,6 +19,7 @@ allOf:
               - st,stm32f7-i2c
               - st,stm32mp13-i2c
               - st,stm32mp15-i2c
+              - st,stm32mp25-i2c
     then:
       properties:
         i2c-scl-rising-time-ns:
@@ -41,6 +42,43 @@ allOf:
         clock-frequency:
           enum: [100000, 400000]
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32f4-i2c
+              - st,stm32f7-i2c
+              - st,stm32mp13-i2c
+              - st,stm32mp15-i2c
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: interrupt ID for I2C event
+            - description: interrupt ID for I2C error
+
+        interrupt-names:
+          items:
+            - const: event
+            - const: error
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp25-i2c
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: common interrupt for events and errors
+
+        interrupt-names:
+          items:
+            - const: event
+
 properties:
   compatible:
     enum:
@@ -48,20 +86,11 @@ properties:
       - st,stm32f7-i2c
       - st,stm32mp13-i2c
       - st,stm32mp15-i2c
+      - st,stm32mp25-i2c
 
   reg:
     maxItems: 1
 
-  interrupts:
-    items:
-      - description: interrupt ID for I2C event
-      - description: interrupt ID for I2C error
-
-  interrupt-names:
-    items:
-      - const: event
-      - const: error
-
   resets:
     maxItems: 1
 
-- 
2.25.1


