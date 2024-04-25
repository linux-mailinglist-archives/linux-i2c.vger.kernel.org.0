Return-Path: <linux-i2c+bounces-3168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66A68B2B01
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403D01F212D9
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE1C15E5D2;
	Thu, 25 Apr 2024 21:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CrLK4kTT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1C158DA7;
	Thu, 25 Apr 2024 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081048; cv=none; b=o1ZIyjG0BMmzYMY6M+TfAa6+ceilrY2loNy5yxAM1qZHt4vctUxMo7nv9lhWlYiIjytdEvd6z9PJSolKR1rpHrmtTn6x9cuW2a5IpwjMgLSVKCg7/wNPpvjCPPP6g1oz8cK84MaQAqfoXe4V8w3uGEXyRPMnnQbjyzZURutQJQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081048; c=relaxed/simple;
	bh=lQ/9+DXlmICDUXzXh/HJBapCJLLsu9aXbcvGXgsmUb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fFrwTuhlpgHxYu6OMuDsLnAMbQlJPlks7i3du2BskHZagx1HkLxQRO6i7zP7Ta5t7KDUlAHRTy5GhlmZq8ke5+Bf7JYP7l6sDqkMIIPp7JQGrL15rRgqQtqd+R/AyGxx0hbrUUDLIElF3tAEm3WdkRNL5BZJWRRqqku/92mKTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CrLK4kTT; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLXRYK021292;
	Thu, 25 Apr 2024 21:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=IV4ptqaik0l/OCopguJ6uRDDYvBPfw1P1RAeUjJr97E=;
 b=CrLK4kTT1sWdXao0YqGUlUgBkiuSTLFngA4cRLBXC+a+VHKoQujIeznFIEd0y93fiIaA
 BSYBnTt05s5FgURbtzEFi9jHpiJF+TeX0YcYLVQevl7mjQ0mNMtTQiKEBrWMLf2GZ5M0
 jvopi69D67eA6HCIcYZzQmHBEKRRtcBq6AKcnbqHKxbm84O+2Q/EL8RafM3cE2tkEAnD
 jsb3Kk125az+E3NXxqPh+Bw65A0xsKHolc/rq15nHx9jwm0Q85ifztzXtiuLAx409dPj
 JV7pN3yk+4Oj4UPB8Is7sbYa7ZBnjb5uT/0X854IoHTmLZRKn+5O2vsESxFU0VqVe16M OQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy6ag05n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PK1Yeu005736;
	Thu, 25 Apr 2024 21:37:14 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3ctwv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:14 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLbBYN18940508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E55D258064;
	Thu, 25 Apr 2024 21:37:09 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40E2558045;
	Thu, 25 Apr 2024 21:37:09 +0000 (GMT)
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
Subject: [PATCH v3 09/14] dt-bindings: fsi: Document the FSI Hub Controller
Date: Thu, 25 Apr 2024 16:36:56 -0500
Message-Id: <20240425213701.655540-10-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CWAvWVwxg-Yv_LEFFkq0mnVx-G0Wpt45
X-Proofpoint-ORIG-GUID: CWAvWVwxg-Yv_LEFFkq0mnVx-G0Wpt45
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157

Document the FSI Hub Controller CFAM engine.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../bindings/fsi/ibm,hub-fsi-controller.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
new file mode 100644
index 000000000000..d96d777d4d9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,hub-fsi-controller.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/ibm,hub-fsi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached FSI Hub Controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description: |
+  The FSI Hub Controller is an FSI controller, providing a number of FSI links,
+  located on a CFAM. Therefore this node will always be a child of an FSI CFAM
+  node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,hub-fsi-controller
+
+  reg:
+    items:
+      - description: FSI slave address
+
+allOf:
+  - $ref: fsi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   fsi@3400 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "ibm,hub-fsi-controller";
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


