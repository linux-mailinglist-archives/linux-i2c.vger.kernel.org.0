Return-Path: <linux-i2c+bounces-3167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3348B2AFB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2DB1F222F9
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6017E158A17;
	Thu, 25 Apr 2024 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sUotYd49"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD98156255;
	Thu, 25 Apr 2024 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081046; cv=none; b=W4uWvmFvKZZK1VTu83viqJbomiRnSZuR6jbdv3aQUk5ZriPzoLIFGLBtGDVptv2CfErbsuz7QAjN5iv5BLFkgXN+fFrtmEzkogNO4U0cSnYp9iBEVqS1FYcUfylIiNaaRazf/KaXrve9+djocy/oFsF+7YH5l0b5iyl/3iSoTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081046; c=relaxed/simple;
	bh=+VS7Pko+XUTWlrgbQJM3OxyaaIDDKdbqZYaTUvTdr2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NvrSABLjx5waEHdvJ7ebmYeWWEDyLj+YvJBLXkYj8hYJa6ADlwcQCAMckif5zdOPpLuVhyGJtyMRONg7QpMvXVPG+LivuVA05P0o4M/XLNsC0DMdHhouwbmzzdQf1mz2aBmO9pGTuYIrq2T7hrfgZSht6dpPjChFRCruQtJXCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sUotYd49; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLTF8q023436;
	Thu, 25 Apr 2024 21:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=e019qJxWGd+7tgOXf2N9kmlaOBludFeBpLUYHpyQtHc=;
 b=sUotYd49OvZ9qZpUVDQ7R2T84LzpDfYLNpcTPHZj+Hyivy7K3mFDDOTXXySQz0LaOo0c
 lRyoqIbHnzQKl+l8NxT72tiE8ftlmTzfbmPJBg2JAWdrLfcprexxZ4cG+iunumy/O5Q5
 +PO3qU3ZBeGFOsQZ0Q0yGBDOY3MT6FJILfxSHpPiKaZwAXE8ngcTipeGxXvu+c20LXru
 lKLXW5syaZ1kTdxC904K2vbiz4ONai1oWN18Meyi2eNIIksPYFoIOP3nraq+7tFxvvoM
 GpC5b377bn5iuuTNFYdmRWgf5ndOya78gRbWibpeXaohCuu53qepxwfWI/wOiWi66xtR Dg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy3q80gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:15 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PKfQ2A029873;
	Thu, 25 Apr 2024 21:37:14 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmr1tvckk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:14 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLbAvT62587214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:12 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7D858056;
	Thu, 25 Apr 2024 21:37:10 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0621258045;
	Thu, 25 Apr 2024 21:37:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 10/14] dt-bindings: i2c: i2c-fsi: Switch to yaml format
Date: Thu, 25 Apr 2024 16:36:57 -0500
Message-Id: <20240425213701.655540-11-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N7PnNbDrtAQvnbUeJNl16DrgEq-Iy9SF
X-Proofpoint-GUID: N7PnNbDrtAQvnbUeJNl16DrgEq-Iy9SF
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
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157

Switch to yaml for the FSI-attached I2C controller.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 -------------
 .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-fsi.txt b/Documentation/devicetree/bindings/i2c/i2c-fsi.txt
deleted file mode 100644
index b1be2ceb7e69..000000000000
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
index 000000000000..473a45de1b6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml
@@ -0,0 +1,59 @@
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
+  I2C busses. Therefore this node will always be a child of an FSI CFAM node;
+  see fsi.txt for details on FSI slave and CFAM nodes.
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
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
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
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0>;
+        };
+
+        i2c-bus@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+
+            eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+            };
+        };
+    };
-- 
2.39.3


