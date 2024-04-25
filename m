Return-Path: <linux-i2c+bounces-3161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68C8B2AD8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFC831C21C59
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2450C155A59;
	Thu, 25 Apr 2024 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HG2vGyqF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0720DFF;
	Thu, 25 Apr 2024 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081043; cv=none; b=nWNSQXVXnM2Mi8WutCQ6CXioU1FY57c9U+mY5f5+b/TTRFpNPPBIuy93MnAYUXAnlpDcIPdOlTI7Aa2TJ8lXip66f9yw1Wzd9giVh88EK0khdweV67CNQAS47pudw/CGaK3UH3s4iYEhquyFZIlE0uKwouzERhyWyObbHgtxzAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081043; c=relaxed/simple;
	bh=+wZ+VzD3dmWeXjbKojPzixUcIgtILdkkzmaj/tNAG3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cGqnvibTly5Aoej0pOr+U4eAJGMyIHJksDUqF7slCH1tfAqpjY9sivPWIXMWFRtftcDmuHz1SG5HBS0Y2/ILDfk6v9y2oOmZnKIX5soplD0SuP8lxMKHQaxNkgduE9uXoOHQIWDOjlL8zttJGlm+nhTVXHuEeN9L3k7fTlMgDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HG2vGyqF; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLRRRS007381;
	Thu, 25 Apr 2024 21:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=iAWgrh6W0eGtZtBpGY2dF1+6n8Uaj0Ms2ae10andzkw=;
 b=HG2vGyqFx342hYqsNI5nck94tZPcvknHWbAqJmGtmrFyfeGZgPZHWMaHhVa+wS7/lCIl
 yHvCYvnnBqywui0F7mSRZMTpwPueWQhQqbXBBi98koMH5OF9ma00nbNfc0ULqH4Ksray
 z4Dxv1H/MrQJdE7Wzds4zXsvFTCgt/nJ4UJ/ayf03p2xuSq5ww58AVg6IvKi0nB7szCo
 5ctBAgGstovELIvyvBFsVt9hBPEbsumctUiU0Q3D7RhPbid0Jy/ivl1clNgvxA0E233V
 vS4cu6DVnvLRDfL8Q4tGb1RIKMctM2akvy94LiS+WuvzOzcLJwundv2PaNyx44gLhR+f NQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy3rg0g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:10 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PJHR6I015302;
	Thu, 25 Apr 2024 21:37:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshmm10b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:09 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb6nt19595908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:08 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 136BD58054;
	Thu, 25 Apr 2024 21:37:06 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61FBD58045;
	Thu, 25 Apr 2024 21:37:05 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 04/14] dt-bindings: fsi: p9-occ: Switch to yaml format
Date: Thu, 25 Apr 2024 16:36:51 -0500
Message-Id: <20240425213701.655540-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7RjQOGc4CYPCApzw7ZL6o2P1S9fnH7oD
X-Proofpoint-ORIG-GUID: 7RjQOGc4CYPCApzw7ZL6o2P1S9fnH7oD
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 malwarescore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250157

Switch to yaml for the OCC documentation. Also document the fact
that the OCC "bridge" device will often have the hwmon node as a
child.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,p9-occ.txt    | 16 --------
 .../devicetree/bindings/fsi/ibm,p9-occ.yaml   | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
deleted file mode 100644
index e73358075a90..000000000000
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
index 000000000000..1fa87d452489
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.yaml
@@ -0,0 +1,41 @@
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
+  reg:
+    items:
+      - description: Processor index
+
+required:
+  - compatible
+
+patternProperties:
+  "^occ-hwmon(@.*)?":
+    type: object
+    $ref: /schemas/hwmon/ibm,occ-hwmon.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    occ {
+        compatible = "ibm,p9-occ";
+    };
-- 
2.39.3


