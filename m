Return-Path: <linux-i2c+bounces-3159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B048B2ACE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704101C21A61
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F3155758;
	Thu, 25 Apr 2024 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eyxHIgjy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A922773C;
	Thu, 25 Apr 2024 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081042; cv=none; b=T3+zbL82t6nppFWXBXKWM5mo79tAyByFor/UxWzRmJYmzT15+L7An/qO331UOxR9S2IBtWGsumBMjYfem0ipum9TBHqRTqAK+zWiS2FBqu7HJJXDrsAclrVMyzqHji8OK8WJkOvNhnRd0iUVy7Ean5IUxz3bVfoavTsYPaUcRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081042; c=relaxed/simple;
	bh=AdrzoqKPN4RP0il9nDX1O4yS/5reXKrTPa5K17RHazM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KOKP2Q1/z43E52zsPFWYA8wTsNALgCPFOoFS+sPZuNMP3JWf7KmBGjincZQcKKIBPjC6PwfVrgEmqMYz3td68YooEorwzuCHe2jPsNuylqoXxEGaH8je3iUZiSHE8F4s9J/YK7Wt7hX44Hr4t/VrOMvkWnagtHClv7oOMh2ml+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eyxHIgjy; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLS90l025680;
	Thu, 25 Apr 2024 21:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=JyabUK1mNnNA8JMPYj/be1jhpJEd0MeRmp5EnyVnktk=;
 b=eyxHIgjyCkAVsV5Eihlpb3RvkLbACIdhp1f3UCBoW7OieJ8RukgpThRCqwQRHrjOID22
 SbLwSHewpQFEDPOTI47ckv/QqSY4dt5CvLb7SPQ8lYqrcAzY3K5YbvCaXTbv1U5F0byO
 sLBr2WrXmeGhSDmK/9slXmdP3hPoLr8x3cSKNvE7MmAYA2gkbaVMxrPVojOtNrrzeLuj
 EIJjgx/tawFK/sXNntTAv54cu8C00Vyt/4f54RTvUp4UaTh1yDROxfmI67sKDP/w0qZR
 sw9X5BkW3cIqxwSNf3k3Q8LgpBKtZr6veVf9ZLUPDpZRYisWlEDFeZT3IKr9ZGIdXHUw bg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy3qg0gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:12 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PKfltr028341;
	Thu, 25 Apr 2024 21:37:11 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2upju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:11 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb7Z728836522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:09 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 958A358060;
	Thu, 25 Apr 2024 21:37:07 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3A4D58045;
	Thu, 25 Apr 2024 21:37:06 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 06/14] dt-bindings: fsi: Document the FSI controller common properties
Date: Thu, 25 Apr 2024 16:36:53 -0500
Message-Id: <20240425213701.655540-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5TDr2M2OzFukzCAhHnaCDew7u399F6f1
X-Proofpoint-GUID: 5TDr2M2OzFukzCAhHnaCDew7u399F6f1
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157

Since there are multiple FSI controllers documented, the common
properties should be documented separately and then referenced
from the specific controller documentation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../bindings/fsi/fsi-controller.yaml          | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/fsi/fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/fsi-controller.yaml
new file mode 100644
index 000000000000..9e917295996d
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-controller.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/fsi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FSI Controller Common Properties
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  FSI (FRU (Field Replaceable Unit) Service Interface) is a two wire bus. The
+  FSI bus is connected to a CFAM (Common FRU Access Macro) which contains
+  various engines such as I2C controllers, SPI controllers, etc.
+
+properties:
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+  no-scan-on-init:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The FSI controller cannot scan the bus during initialization.
+
+patternProperties:
+  "cfam@[0-9a-f],[0-9a-f]":
+    type: object
+    properties:
+      chip-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      reg:
+        maxItems: 1
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 1
+
+    required:
+      - reg
+
+    additionalProperties: true
+
+additionalProperties: true
+
+examples:
+  - |
+    fsi@3400 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "fsi-controller";
+        reg = <0x3400 0x400>;
+
+        cfam@0,0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            reg = <0 0>;
+        };
+    };
-- 
2.39.3


