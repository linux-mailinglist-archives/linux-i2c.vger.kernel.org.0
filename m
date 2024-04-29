Return-Path: <linux-i2c+bounces-3314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B48B6422
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3EE1F21F91
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C821417F38B;
	Mon, 29 Apr 2024 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i5nuHHSs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009D17BB0E;
	Mon, 29 Apr 2024 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424517; cv=none; b=ktRdikw4Ln+K8yHk0H8zN+O7MOW96ZAeb53MzklldY0srJeQ2bJKr01lU71MMERap+Cso49fwQAGiEtBli7YDtAuNXF/U441ZtjqfSFTu/TEwsV3QlmguLoS1Lz/NcbXYiWWeJ5Je8uM3BJem2+uaenZ+I4YjeqZbFiHZoc9IwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424517; c=relaxed/simple;
	bh=NOfQKKbXh3hPbitQwvCqwfPUjAWmUVGcUvxn0IJnhEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t665XxO4qSqpM4sQMLBGQRyRQVR4OSWkx9TVxzexaRehrOuagilTIApXy5MNqoWH7H/GF71iP/4Mavy4HfM5W4PxxAwJzMSZX6g/60kiA/VJQ+umuZ0t6FZRV8SegDqJfufFeOXpD8Uk8sden5aEvKq+SS3cBop/c3fY3QuPQuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i5nuHHSs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKkukl011206;
	Mon, 29 Apr 2024 21:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Y6olMhWiDvxwLs8itsV7iQwiePD24ra/T38XnX9FnlE=;
 b=i5nuHHSsr+Vn17KJcb9ttCWbBcsdQVcGZMBhLPLLrhgseBRQ4RkdWkF3f3aaBbyIbMtB
 yFQniryTpGp3Ly6u+HBU0u6zGb9QkFnXIItVyDRX2I56L8RH49E+gDZShlFnOMRhwAUf
 lEGj9Mb+jz5x+iBF5lYRZu2ubTmhX6woT6z1YHnPXyXEsiBiE9jVwijqKhyvjHdWpbpg
 /71BTdHkZhkKC5rXwkDqiU7v2Wda1OLCzqO7Y0dJlyLL2KoA5mZbFCvkuetIzCmp96LO
 0SGZ9PB/ZV7aihM5BMmQOqID4rqBmz1c4TBtKGU/NnQ1usvQdwou/sd69UXvL7m4Bbph 5A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtj87845c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:44 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKUDk2001443;
	Mon, 29 Apr 2024 21:01:43 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsbptsqyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:43 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1eaE10158752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:42 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E807058066;
	Mon, 29 Apr 2024 21:01:39 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 308D75805B;
	Mon, 29 Apr 2024 21:01:39 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 08/17] dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
Date: Mon, 29 Apr 2024 16:01:22 -0500
Message-Id: <20240429210131.373487-9-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zGjiEIUpwAnEh6gqL66iZZXmi_eRj5K1
X-Proofpoint-ORIG-GUID: zGjiEIUpwAnEh6gqL66iZZXmi_eRj5K1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Convert to json-schema for the AST2600 FSI master documentation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Remove quotes around compatible strings
 - Re-order allOf to below required
 - Add child node in the example
 - Change commit message to match similar commits

 .../fsi/aspeed,ast2600-fsi-master.yaml        | 81 +++++++++++++++++++
 .../bindings/fsi/fsi-master-aspeed.txt        | 36 ---------
 2 files changed, 81 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
 delete mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt

diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
new file mode 100644
index 000000000000..fcf7c4b93b78
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2600-fsi-master.yaml
@@ -0,0 +1,81 @@
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
+      - aspeed,ast2700-fsi-master
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
index 9853fefff5d8..000000000000
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


