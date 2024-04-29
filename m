Return-Path: <linux-i2c+bounces-3311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E088B640F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 472981F21FCF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A3617B500;
	Mon, 29 Apr 2024 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P9DxeVIZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960371791ED;
	Mon, 29 Apr 2024 21:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424515; cv=none; b=LvhaBmigTFYertZucilQA4I7v/Sk3j/MZ0c5TdNqK7PGnHwSq7qLWDAFcQ/psRj58PD8ytt4om9m9SNaKK01xeE4Kf4Ym1aWqJ3v2KpC9yHsiVnhfJrg73T3XEbhTIgdXBzOa3fffOVL6y/rpla5fjg3YDA2oxcXx+L4YXZMgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424515; c=relaxed/simple;
	bh=fdagL69QjEvyUmW4qGHPHB7wqUvnvm2wx+GPtu5/siM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PLtqyZL+7wH5uLBlfnBb2tMjMJoSsQQsBas0K22pjh7c5pHKNvQgkRRbGXa4GggIvNDdPBb9pItEPaPAdan/2jb5KDnp6RnyoQoTq8yRms8JRT7Kqebi1KNnKO3VdGZfHlQ4eK0aZIxCkcaNrBPADgx7Gt2YtCsCw4orePhC3yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P9DxeVIZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKs6MR019885;
	Mon, 29 Apr 2024 21:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=8TIk2brL1Ms7e3ju+fp90mqmERPaTNV0nfhxKKVNKc0=;
 b=P9DxeVIZ/P94qfueAFgcyZy1P7Hj33tCP5U0lnK+O7cF6m2bY61CfuSkT4Sfzv76+cQp
 jDC7A64q2WVQ5E/1yqBI2F6unoMnw4a2UIX53hPCNrHmU24c0vZ8TtUr+/ezMx5GhQkN
 IKIpZFAkGwdupWEHkj4VFZf0iYsE1N/wMNoZaM4Sypy9MOVJgrJTZHIjbCsNcGUZhife
 bvsJP/PwNN/K2XWvY4e+EQmi5SuSUKPLXkndq414w6mGKcv0iOfp4jIATh39yKGYpPp4
 PmpKcY/3Xw3SVSoBBlpyUTpR+bzXI//ebjTMj3FIXeJ1lHYYgep7znkrKZTZ+tp/JPdl iA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjyj01ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:41 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKeXoF001433;
	Mon, 29 Apr 2024 21:01:40 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsbptsqxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:40 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1bj427918884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:39 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D81958055;
	Mon, 29 Apr 2024 21:01:37 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98CEA5805B;
	Mon, 29 Apr 2024 21:01:36 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 05/17] dt-bindings: fsi: Document the IBM SBEFIFO engine
Date: Mon, 29 Apr 2024 16:01:19 -0500
Message-Id: <20240429210131.373487-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OA0XMnPZvgN6W4FgJEY5QiINwmN0hI6N
X-Proofpoint-GUID: OA0XMnPZvgN6W4FgJEY5QiINwmN0hI6N
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

The SBEFIFO engine provides an interface to the POWER processor
Self Boot Engine (SBE).

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes since v3:
 - Drop occ unit address

 .../bindings/fsi/ibm,p9-sbefifo.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
new file mode 100644
index 000000000000..24903829fca1
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached SBEFIFO engine
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The SBEFIFO is an FSI CFAM engine that provides an interface to the
+  POWER processor Self Boot Engine (SBE). This node will always be a child
+  of an FSI CFAM node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,p9-sbefifo
+      - ibm,odyssey-sbefifo
+
+  reg:
+    items:
+      - description: FSI slave address
+
+patternProperties:
+  "^occ":
+    type: object
+    $ref: ibm,p9-occ.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    fsi-slave-engine@2400 {
+        compatible = "ibm,p9-sbefifo";
+        reg = <0x2400 0x400>;
+
+        occ {
+            compatible = "ibm,p9-occ";
+
+            hwmon {
+                compatible = "ibm,p9-occ-hwmon";
+            };
+        };
+    };
-- 
2.39.3


