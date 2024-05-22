Return-Path: <linux-i2c+bounces-3635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D18CC703
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64D31F22823
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167F7149C41;
	Wed, 22 May 2024 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="M616WA6s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8611487D6;
	Wed, 22 May 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406007; cv=none; b=Dtxo72YnDTGF/kk0UGYPvR1qXLKPrFlv3X+SOGPOj9aNQdwTia9HN8lckqfupZ6OAxxqI9sTR7c5fbsMJaUEqYZsuoYlBMezhXk8W6q8cwqxaSEI81xtgYBiFu9xHc3uLHplP102n9MpysUKjsMlUfpzHTekOnwOTULmbJfvh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406007; c=relaxed/simple;
	bh=35r5P5wI/E9K9q2NHx5+rnohvXe2Dw4imTz+2u6VaY8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTluhrn3xS6uosYFYiDN/JmVHGp6nb5TAcG5kZjEvP0Pimx/mjj8URQWPLWtKPPXY9Lf+iNhIhyySnFspbt7SlTsc6RJWKhZtr7eXT52PaIFzoMJHzYJK6Nf1gFpsjhjyNWmZ1x9Zq2bAOo4oVSg6worxbi5OiDh17t7emTSu7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=M616WA6s; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJL6O4009061;
	Wed, 22 May 2024 19:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=i4+zDu4/gsd8sacO6bFpAQ1PXpoNexEqoWkaudefhUM=;
 b=M616WA6s4o5XKk3VmdegqyzHBY7gdJCDZDBMYAjfcKidWO6FtUpN1IPlWmjK5YOJ0X3q
 jio4f8odtM8tutZOF2oS+0RC5ANIR9bt48U6/hShaYQt0Npi1YdYVkhJshRA1tV1Lf7O
 WmVXmZfDflL3n/q0wku9RKp1qnSSisFIQz6RqsCju4AugML96yKCJKYoFu88hIPNVESL
 jBlXQth5xKTY04ndTkxbQsaKpaiUET1NU2of4pT9cD0NEpi1LklpXCn5Q2cqMQQnqcA4
 Kf+Lm7j2VfHhu7LbNwghShozOwcnmLWzqFx5IwR94KMXv0GNSOdp+ylLMcEWKcL2oIA4 XQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9mrx09k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MGCISU022119;
	Wed, 22 May 2024 19:25:31 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y76ntwyfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:31 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPS9M44695874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1E3858059;
	Wed, 22 May 2024 19:25:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8481358065;
	Wed, 22 May 2024 19:25:26 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:26 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 05/20] dt-bindings: fsi: Document the IBM SBEFIFO engine
Date: Wed, 22 May 2024 14:25:09 -0500
Message-Id: <20240522192524.3286237-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lYk2wF3-L6Ewwoh1rm43rzNKLJya5eB4
X-Proofpoint-ORIG-GUID: lYk2wF3-L6Ewwoh1rm43rzNKLJya5eB4
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

The SBEFIFO engine provides an interface to the POWER processor
Self Boot Engine (SBE).

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../bindings/fsi/ibm,p9-sbefifo.yaml          | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
new file mode 100644
index 0000000000000..3cd966fb3c0df
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
@@ -0,0 +1,46 @@
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
+  occ:
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
+        };
+    };
-- 
2.39.3


