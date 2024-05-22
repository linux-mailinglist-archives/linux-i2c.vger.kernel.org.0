Return-Path: <linux-i2c+bounces-3632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89C8CC6F8
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539A5283AA1
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844C51487F0;
	Wed, 22 May 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qbQLiOVl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47AD1474CD;
	Wed, 22 May 2024 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406006; cv=none; b=MSbn/zByVvY3OlCNk2ddJqDdxYbsqBsvfREET8GOTf4A/BbOAUlxnMUjZRL/PawbyTonw21Bd3FU1JZgwsi2H1gKLqI3jCGwwraOAwVbBIAlWzixnR8KtFObgjEtAQ65eR0GSEV3+YpHS9FHCuyE7oMFbwE+jk4zsnl/3jZXDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406006; c=relaxed/simple;
	bh=8kUer7HSwKbfomtcBU4A9axf14aauS6aSiNkP8NcR6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYXwKUSICDz6ZqTHs8V2cKZwLFcPppgLvjoHDT7sgMxHSU69tC5srbisCBKXZ8xNaS+XrZi7Qd6SAjKD6pNwFrFwv+iidS0CcJXXAqCQoX7gs+uTZZfUoargogFoLUzUel5lNPct5tQWRsdWdtgAQkmyXyZbDNSURq7TbKpvstg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qbQLiOVl; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHWGgJ025789;
	Wed, 22 May 2024 19:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=XjgnUZWmeVjWGk6G9DJaRRfibUtUKh+By+McotnzT7A=;
 b=qbQLiOVl0e9PJvD1GW1Aj+uaU477CBzu6C4nZq8FBRsYtVt9pKJjiToEBvREYnng0uKR
 QJTcnZ8T5zLHAVb95k8W/htOsbJMQy9KqOzYsILXCfHdEulsHnRa2NSLR1YckzSkIXML
 vcG+3sf8T2jxl2xxxBWv2TzxhnFYseps/20qa5oyUyzakIa0+i8cfZtOIxQLiI44hrNH
 6YEAR1maNnT7o9g2kYTD5qsl52ELhIRsC4pAYpbgwv/aW9a+bvCw2ROb4g8YsmkzE2bz
 HiCAQF6RmhMIZ4mNYpBDCZ52h8OdJ/TGz3E3Z2Dw8cb2uccM07mkM5zatsqjy5qWxQJE Mg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9k7tgkpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MGhrQe022240;
	Wed, 22 May 2024 19:25:31 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y76ntwyfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:31 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPSRn24314622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB94B58064;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D01D58061;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 08/20] dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
Date: Wed, 22 May 2024 14:25:12 -0500
Message-Id: <20240522192524.3286237-9-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y1UFs4LTdzlugRx2_gCNsTxQC_lQzS6l
X-Proofpoint-GUID: y1UFs4LTdzlugRx2_gCNsTxQC_lQzS6l
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

Convert to json-schema for the AST2600 FSI master documentation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../fsi/aspeed,ast2600-fsi-master.yaml        | 80 +++++++++++++++++++
 .../bindings/fsi/fsi-master-aspeed.txt        | 36 ---------
 2 files changed, 80 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt

diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
new file mode 100644
index 0000000000000..2f531c47994bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed FSI master
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The AST2600 and later contain two identical FSI masters. They share a
+  clock and have a separate interrupt line and output pins.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-fsi-master
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  cfam-reset-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin for CFAM reset
+
+  fsi-routing-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin for setting the FSI mux (internal or cabled)
+
+  fsi-mux-gpios:
+    maxItems: 1
+    description:
+      Input GPIO pin for detecting the desired FSI mux state
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+allOf:
+  - $ref: fsi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    #include <dt-bindings/gpio/aspeed-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    fsi-master@1e79b000 {
+        compatible = "aspeed,ast2600-fsi-master";
+        reg = <0x1e79b000 0x94>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_fsi1_default>;
+        clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
+        fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+        fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
+        cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
+
+        cfam@0,0 {
+            reg = <0 0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            chip-id = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
deleted file mode 100644
index 9853fefff5d83..0000000000000
--- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Device-tree bindings for AST2600 FSI master
--------------------------------------------
-
-The AST2600 contains two identical FSI masters. They share a clock and have a
-separate interrupt line and output pins.
-
-Required properties:
- - compatible: "aspeed,ast2600-fsi-master"
- - reg: base address and length
- - clocks: phandle and clock number
- - interrupts: platform dependent interrupt description
- - pinctrl-0: phandle to pinctrl node
- - pinctrl-names: pinctrl state
-
-Optional properties:
- - cfam-reset-gpios: GPIO for CFAM reset
-
- - fsi-routing-gpios: GPIO for setting the FSI mux (internal or cabled)
- - fsi-mux-gpios: GPIO for detecting the desired FSI mux state
-
-
-Examples:
-
-    fsi-master {
-        compatible = "aspeed,ast2600-fsi-master", "fsi-master";
-        reg = <0x1e79b000 0x94>;
-	interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_fsi1_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_FSICLK>;
-
-	fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
-
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
-    };
-- 
2.39.3


