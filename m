Return-Path: <linux-i2c+bounces-3308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E48B63FC
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1811C2193F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4AA17966D;
	Mon, 29 Apr 2024 21:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WfYac4k4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41B178CC3;
	Mon, 29 Apr 2024 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424513; cv=none; b=MKvXz5PXeOhcN6BG8vsblP6BtHSpkWaKwCSft6YMnhV8ciljTMAAlOO0KFdXlYURbpZkQL9uGGiN68aSNYps5v48dinXwLSxJflT23Z98Vuc/kIF7rvFBYTTyRPur6TiMUcojXZbFhbSFwIkd8M+B2x54lsdv2z4L/+ZSj/uG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424513; c=relaxed/simple;
	bh=GtjEpD+LaB4853MyvznM6RAG65wmbXGSpTk6s+wp9R4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrgGO5m1KjffqO8pYsT8Ns9GwtNqG3vwx+iPESNrWisCZ+DMJpROxrrUbUzwPxLaXHzP3W1ox6fOGncIQxvkY004KoK9YUhwx0JGrCq5N6KLi6UajyIg/6cdnE9bnqQIPxRWVZeM75To7K3a3mzxZoLFfRvHrOQNYCfZzcsRTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WfYac4k4; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TL0j3J007565;
	Mon, 29 Apr 2024 21:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=zWTKLxmt6yOSwvuD28OrBhw1B8rpuY0O8+zTYnaHU+Y=;
 b=WfYac4k4Kmf2DUOmvhJ794KIjVYejrBMW9FfFFL2HCkWtu34Huu6ti8qjMFleUD9qfN9
 jwZ8RPAWGwjI0FDG3NIJmhdupf0z2S09MYdJ5jiYclLFw986M5OB8VYp9WvYEvLOcDrY
 jga7BJ0qik2NdXlQBD3iRhl4u69o+gltlvFLIKYKHCjQD6on4tRRy+ORRYvfvzAggB7t
 BGKOML31kUL4oJvH2uXh/NVHQStQ4gTihcrX8Ov7LjnGdc2bOThXioYbBbGOWr7gQlxA
 mZ6YCd9/wM6QsNEhC+WVaA4Zj6aT/G8H5kh05KWjSb8kPGYsfJA0Y8MdeTfXHFA2ZcsM CA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjy9g0g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:42 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TIBLtl003038;
	Mon, 29 Apr 2024 21:01:41 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscpp9gbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:41 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1cpK48234804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:40 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3813858059;
	Mon, 29 Apr 2024 21:01:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73EAF5805B;
	Mon, 29 Apr 2024 21:01:37 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 06/17] dt-bindings: fsi: Document the FSI controller common properties
Date: Mon, 29 Apr 2024 16:01:20 -0500
Message-Id: <20240429210131.373487-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Oh3joq_-j6frQsoUDGD4K8g1UnjUhdDA
X-Proofpoint-GUID: Oh3joq_-j6frQsoUDGD4K8g1UnjUhdDA
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Since there are multiple FSI controllers documented, the common
properties should be documented separately and then referenced
from the specific controller documentation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Add chip-id description
 - Use a real compatible
 - Re-order example properties

 .../bindings/fsi/fsi-controller.yaml          | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/fsi/fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/fsi-controller.yaml
new file mode 100644
index 000000000000..fd624181c030
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-controller.yaml
@@ -0,0 +1,66 @@
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
+        description:
+          Processor index
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
+    fsi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        cfam@0,0 {
+            reg = <0 0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            chip-id = <0>;
+        };
+    };
-- 
2.39.3


