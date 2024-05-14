Return-Path: <linux-i2c+bounces-3491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D6C8C5C88
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2024 22:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43A721F229BD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 May 2024 20:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C4A37141;
	Tue, 14 May 2024 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CT17wuo2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396C1DFD1;
	Tue, 14 May 2024 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715720105; cv=none; b=bl/YwLIbM+FL8jNqDhgww10jRF8WRdz3m0dmGWsDQP8HWJpkHSnnxMWSZVgOFBlvj1Xu2Y/Re9vMgwP94jCVnWcUZOPhATnqoCu3Ki/UOWMo5Ku41DwscsUkFYLLIM6HpePFUz46aZKQ3H8HIVm1GLMAP13NXseIQM9GKae8FR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715720105; c=relaxed/simple;
	bh=7v/bVjsePiglsRUfkVi81JD5l8PJ6pE/YvALtxqA0Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OhvjUUlCKjqdJLBbWNCkZljMvxvtk/9FTzYcUu574oA5jiZxLNaQ31CBV33Vhfjoty1DM/vsJ2G5BdD5KpPe2mSEy605U13ehdD8eH8ONmnKKFECeihUqJgF9NWvRE0SLe6hi7GNlW3Z22trtGKoXOITUIFm5dk2BdkF6QF2r9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CT17wuo2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EKrBqJ031386;
	Tue, 14 May 2024 20:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=93rGCrwcTBFV8zElPM3lXUtYbTSn32BTScf2EBDSl9E=;
 b=CT17wuo2c5yLTtmvTZ8g5/oG1duwOQybaNolGmbCRc+urZgZbGDREyrY/v5fef9uMfng
 boHPnv5olLiigF8u0FoUjwhqmXXRab3bnC/G3BdWn/onbZn/mCI0lCP5NOf8PqKH7bUR
 WRKpfUYlTQG8VLq5u7kmGxXoluAq8jfwoDOM5PY8QCKnWjHzrKOhXlPDliqHRYZuWYEt
 NIFHg07BAqUaOyPina0C1v1SIfgAkJR2rWBkfjBks6W0QMSJMf28xoiAEHKtPfjco/xY
 j22VPf2iYxJkBdCzyixkfgPKl2Pvw2amoRBWFRTz9+hUhdEzfh3TTymzB0U9SNSvtxTd rA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4fch009b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 20:54:57 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44EITO8M002298;
	Tue, 14 May 2024 20:54:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0p7k0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 20:54:57 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EKst8W27263666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 20:54:57 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2E225805B;
	Tue, 14 May 2024 20:54:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64AAD5805F;
	Tue, 14 May 2024 20:54:54 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 20:54:54 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        eajames@linux.ibm.com, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, andi.shyti@kernel.org
Subject: [PATCH v5] dt-bindings: i2c: i2c-fsi: Convert to json-schema
Date: Tue, 14 May 2024 15:54:54 -0500
Message-Id: <20240514205454.158157-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nSJIpjoyYvuBLtxfgpRJnK3Hu1AQ36BK
X-Proofpoint-ORIG-GUID: nSJIpjoyYvuBLtxfgpRJnK3Hu1AQ36BK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_12,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405140150

Convert to json-schema for the FSI-attached I2C controller.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
This patch was previously included in
https://lore.kernel.org/all/20240429210131.373487-1-eajames@linux.ibm.com/

Changes since v4:
 - Add patternProperties for the busses that will reference the i2c-controller
   schema, since the root node provides multiple i2c busses.

Changes since v3:
 - Update MAINTAINERS
 - Change commit message to match similar commits

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
index 0000000000000..62e70aaea9d56
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
+  "^i2c(@.*)?":
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
index b2df2cc60dc78..86c1c8dd86093 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8976,7 +8976,7 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-i2c@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-fsi.txt
+F:	Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
 F:	drivers/i2c/busses/i2c-fsi.c
 
 FSI-ATTACHED SPI DRIVER
-- 
2.39.3


