Return-Path: <linux-i2c+bounces-3628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74F8CC6E9
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 065F51F22338
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5801474B2;
	Wed, 22 May 2024 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="McRSw0HI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6BE146588;
	Wed, 22 May 2024 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406004; cv=none; b=YbysdXzHl3sWrsFusAilTBqb6Caq1YTIMN5e+pPxwJcZRg5knkvu/qHgNR6axOQaqjxH5JFK9wDAZCQFyZxyJ3wNs34qWWh3RPgfBBebKIuDDuF7EkS5ViLphwFPbf2pFvphBUZh3Crc7R9Ii8Tsttz7mYBZQYnl1nzso1e5PV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406004; c=relaxed/simple;
	bh=ZkYbp4XiGnj4eq+TJW/stOGDLEO9iasJfS9fwlJJpZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=phj08NysvXcZie1iCmnWcoeUgXzjlTPuI5SwBXydfThml6KhOM9rjwxyBMjl2bAXglQFOhVHKrRch2XPAMhrb29I5hxYX4Wj/z/aN0B3Wz21sOoRvuKP++0+CH/BA9gkTN9+xvy3z2m31BrXz29CZf6KIO1To5DPNbUCaFMUE8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=McRSw0HI; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MIu97H027609;
	Wed, 22 May 2024 19:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=fTplWdbZWsj5+rkXpXdZvDB7V+6OdJwKkV/KrdcySf4=;
 b=McRSw0HIRWYGUDLk1hAxFP5r2tP36+/zVF+qjPJ60H7BjCzxYHfbtEMiqjqHFgt63om0
 DkkbQK0cgnj8XiWQTPle13LA5jhn+5dcVo+7811pQJn5kvcLvzf9cBqQMmnCLO6oj4Il
 xJDswB72W482e+81VkKVBO+QCj2qh/XLakf3aRlW5/pA1/IGPcXoEurdz/q8l9fe7oxk
 wvqPCdpfw0j2nVkmwamAUUzDGYFV8sLPvCqFyzKIWQ/GQZsbd2fUrPf9vhJZygqVErge
 qzbdoB3qxl/C0aaWZkvHljl/x/ua03BKrStazZv8B64s2w0uzrYDUdx03RPEm7TejiFK Bw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9p4x83vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:33 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJ0loa008421;
	Wed, 22 May 2024 19:25:33 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y79c359ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:32 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPTTk21299852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:31 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0792658063;
	Wed, 22 May 2024 19:25:29 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD70858068;
	Wed, 22 May 2024 19:25:28 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:28 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 11/20] dt-bindings: i2c: i2c-fsi: Convert to json-schema
Date: Wed, 22 May 2024 14:25:15 -0500
Message-Id: <20240522192524.3286237-12-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ySb9oB95HcX1mE1LAXGrVBBSqaEXkItE
X-Proofpoint-GUID: ySb9oB95HcX1mE1LAXGrVBBSqaEXkItE
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

Convert to json-schema for the FSI-attached I2C controller.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v5:
 - Use more specific regex for node names

 .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 ----------
 .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 76 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 77 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-fsi.txt b/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
deleted file mode 100644
index b1be2ceb7e696..0000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Device-tree bindings for FSI-attached I2C master and busses
------------------------------------------------------------
-
-Required properties:
- - compatible = "ibm,i2c-fsi";
- - reg = < address size >;		: The FSI CFAM address and address
-					  space size.
- - #address-cells = <1>;		: Number of address cells in child
-					  nodes.
- - #size-cells = <0>;			: Number of size cells in child nodes.
- - child nodes				: Nodes to describe busses off the I2C
-					  master.
-
-Child node required properties:
- - reg = < port number >		: The port number on the I2C master.
-
-Child node optional properties:
- - child nodes				: Nodes to describe devices on the I2C
-					  bus.
-
-Examples:
-
-    i2c@1800 {
-        compatible = "ibm,i2c-fsi";
-        reg = < 0x1800 0x400 >;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        i2c-bus@0 {
-            reg = <0>;
-        };
-
-        i2c-bus@1 {
-            reg = <1>;
-
-            eeprom@50 {
-                compatible = "vendor,dev-name";
-            };
-        };
-    };
diff --git a/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
new file mode 100644
index 0000000000000..40ea82942e4d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ibm,i2c-fsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached I2C controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  This I2C controller is an FSI CFAM engine, providing access to a number of
+  I2C busses. Therefore this node will always be a child of an FSI CFAM node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,i2c-fsi
+
+  reg:
+    items:
+      - description: FSI slave address
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^i2c-bus@[0-9a-f]+$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    allOf:
+      - $ref: /schemas/i2c/i2c-controller.yaml#
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c@1800 {
+        compatible = "ibm,i2c-fsi";
+        reg = <0x1800 0x400>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-bus@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        i2c-bus@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f0fe6b2032a21..7884dbe2374c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8977,7 +8977,7 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-i2c@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-fsi.txt
+F:	Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
 F:	drivers/i2c/busses/i2c-fsi.c
 
 FSI-ATTACHED SPI DRIVER
-- 
2.39.3


