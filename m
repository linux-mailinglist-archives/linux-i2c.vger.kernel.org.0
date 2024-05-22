Return-Path: <linux-i2c+bounces-3623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0C8CC6D7
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FA211C20C52
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E7B1465B2;
	Wed, 22 May 2024 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="cMksKs1C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886FC145B1F;
	Wed, 22 May 2024 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406002; cv=none; b=a8J68mBAg4VEIKORKkwQ1KWKdJKRZmH+krnmeH9ju2A4j/tZ3wI4D+XnFJD57D0PYtK0pRUok2OcZ6fr4yCnpc3jO1w1bV1ui+pawzsuB8uLw8lXgs3tVCxU4HmY9q4HSgJ0HnU2d8bCVSZhVzjUI9HPrXtPgEdKZExPgmBjOgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406002; c=relaxed/simple;
	bh=wdN0qcX4GOtD/L6kzvrvPX7TsEMKv1p1pgP+PyEDc3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PqAXTZpx/Bqi/DeH1a/NYgjxO1LVVMKVVMAokA6OzbXaChMowTnWXLMNisfTpGamGEiyG/v61ym1hKse5EvLNI+bjpOCHYXTYueBR6jA9a/5YeMta2CsPY7yhp1U2QlkRE5Gd5+TbqioHUFdUtrgAp2fzeKTQwn/frOwvmQlT9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=cMksKs1C; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MHq8K1032103;
	Wed, 22 May 2024 19:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=5/P5I3r0HtCrWN/Tm0eKLRakv2Z5/M+3szaCrZDETAI=;
 b=cMksKs1CjqAJ33sWGpRtsOvp0PktUDBmXb0HIo+0HuMMvnaH3wUdqL0jSV6fO0wjQvia
 wyZ0R07v8j6YgGUrEaBe85NH10AyDmYM2+1NMQGv6Bl42rmaBVBl9gfLH39682dLrR6w
 36rV6Q4k1v2XbV542hUC6L0YM1Y8ZUZBL9HrLS1Iai+ixtImQhaQxx+fyWMx0p83IKlZ
 O7lWsoRD3W0q85LSNjwKtmS7YykZperh3tlwZcociroyLKCMxNhP2fXnnRcwPbBm4eOc
 DNb8JT6D7BH2HOqh5ItTjminNU6sEEiWgVhi8feFSra+z9O0FbhI4jT9qxlGAMUlF/pm gw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9n4888qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MGaLIQ000967;
	Wed, 22 May 2024 19:25:29 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y7720dvam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:29 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPQ5D38601144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:28 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D6115805D;
	Wed, 22 May 2024 19:25:26 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E27558067;
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
Subject: [PATCH v6 04/20] dt-bindings: fsi: p9-occ: Convert to json-schema
Date: Wed, 22 May 2024 14:25:08 -0500
Message-Id: <20240522192524.3286237-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hjvotV3zW-ZvF-wCN4Udzmgf-6kiElBt
X-Proofpoint-ORIG-GUID: hjvotV3zW-ZvF-wCN4Udzmgf-6kiElBt
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

Conver to json-schema for the OCC documentation. Also document the fact
that the OCC "bridge" device will often have the hwmon node as a
child.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
 .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
deleted file mode 100644
index e73358075a903..0000000000000
--- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
------------------------------------------------------------------------------
-
-This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
-a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
-nodes. The OCC is not an FSI slave device itself, rather it is accessed
-through the SBE FIFO.
-
-Required properties:
- - compatible = "ibm,p9-occ" or "ibm,p10-occ"
-
-Examples:
-
-    occ {
-        compatible = "ibm,p9-occ";
-    };
diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
new file mode 100644
index 0000000000000..537eac70447c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached On-Chip Controller (OCC)
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The POWER processor On-Chip Controller (OCC) helps manage power and
+  thermals for the system, accessed through the FSI-attached SBEFIFO
+  from a service processor.
+
+properties:
+  compatible:
+    enum:
+      - ibm,p9-occ
+      - ibm,p10-occ
+
+  hwmon:
+    type: object
+    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    occ {
+        compatible = "ibm,p9-occ";
+
+        hwmon {
+            compatible = "ibm,p9-occ-hwmon";
+        };
+    };
-- 
2.39.3


