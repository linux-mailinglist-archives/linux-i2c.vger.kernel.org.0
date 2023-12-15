Return-Path: <linux-i2c+bounces-842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D0814DFA
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 18:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85AD1B232AD
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 17:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B373EA74;
	Fri, 15 Dec 2023 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kPoF3h3x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D03F8FE;
	Fri, 15 Dec 2023 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BFFQa55018518;
	Fri, 15 Dec 2023 18:09:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=ZhQnoLndiNgHf2h98P5umfXr2QWvDYCgOy4qHz2gT8U=; b=kP
	oF3h3xsm6iJKtmBWWOF/YtO1gi4lAmTnqyQVWiJg5bawfLClP6hK/P999W0B7uoV
	mPh39MSwcBwyM9kPjFEgrKpP+wygf9OW5UdWLXdLx/qyxS31EFy8oJNZAX0Me+Ls
	LdilNM0HSlKb+8qedZRU+Ul4xMvalZ71IqpTpdKKviUnTxlcwzFpNuv35xhgJRBA
	c07lHSR1tCbQJ5krOpmfjGGkovYRZZX/S4dV+MuKIp2GBHdr+lXcOP/8zQc539vS
	sx8ZtWiprpmgZtNzeLwW1QHVqYfFFO7CHDu62JpSb49o+DWRfoG3sWeiM2QASjKj
	LtomMRbfY8179H+rGLxA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uyb2kapm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 18:09:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A4D7100052;
	Fri, 15 Dec 2023 18:09:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C21723BE05;
	Fri, 15 Dec 2023 18:09:00 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:08:59 +0100
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
CC: Conor Dooley <conor@kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/9] dt-bindings: i2c: document st,stm32mp25-i2c compatible
Date: Fri, 15 Dec 2023 18:06:08 +0100
Message-ID: <20231215170617.95868-5-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
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
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02

Add a new compatible st,stm32mp25-i2c for the STM32MP25 series which
has only one interrupt line for both events and errors and differs in
term of handling of FastModePlus.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 94b75d9f66cd..1b31b87c1800 100644
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
@@ -41,6 +42,30 @@ allOf:
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
+          minItems: 2
+
+        interrupt-names:
+          minItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        interrupt-names:
+          maxItems: 1
+
 properties:
   compatible:
     enum:
@@ -48,6 +73,7 @@ properties:
       - st,stm32f7-i2c
       - st,stm32mp13-i2c
       - st,stm32mp15-i2c
+      - st,stm32mp25-i2c
 
   reg:
     maxItems: 1
@@ -56,11 +82,13 @@ properties:
     items:
       - description: interrupt ID for I2C event
       - description: interrupt ID for I2C error
+    minItems: 1
 
   interrupt-names:
     items:
       - const: event
       - const: error
+    minItems: 1
 
   resets:
     maxItems: 1
-- 
2.25.1


