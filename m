Return-Path: <linux-i2c+bounces-3165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900308B2AEE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45AFD284D48
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CFD156677;
	Thu, 25 Apr 2024 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EXcbBOo3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5EF155A24;
	Thu, 25 Apr 2024 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081045; cv=none; b=UucExhksq6S7Lmr6ywEC+tVs0A34o9m1omV5q1MrUC7rxZ4vsa0r8xxRE07wGbiwIaATnuH7p9PEpxmtnvk0X2tXtWpWustiTVVF8qsAC+uxX1b3nCgejxYKQnT2BuvV/UW4SImLymukkV7wnXJ4hBhsa4NCNUg/ImCf/AWYX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081045; c=relaxed/simple;
	bh=BXcEGdLtvi6elV3ZjVtcjuKnENmXUnChcpAfwbEB8Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBTni1QdWxFqnI9P4nJtPukxlU7k9cP2SctJsTSOBgHZLcFJKEB4xLuZoSF7HURjL8DwyYCiWKMVcFZ0MUeD+vBH1+34w88zoATXVuVVEGS/6JMhTQbPwOk6rW8FihH3TvypVjvWz/YhBJlBtTS7/XcPqyX3NJiFjLLQspsvq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EXcbBOo3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLX3T4027826;
	Thu, 25 Apr 2024 21:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=MjArwXFA5Y3VTursczASCGdSuY2vAsRjeXdOgMBprFM=;
 b=EXcbBOo3xnxbWSoK8WT968ENsuLV7lfHWqaazbpt2pxeL0aOEeelWaUHAXDkzZosJO8L
 2+0/dXiYDvfleClQ0BC0QIKLHfghef5QK9sWzOC9PZyYAaPu6+KiQhhpk+ECaAkIeAms
 pgelahQKwEsJqvRxhwcFlxsQRBSti+8rp0ZdxvwXgkHJAK/wCPIqhun4qx2pUS7w92uu
 aUAHQ+S28g4ha0/rRYLRkwTSi8aLO2/584jUGgeoDtE1zUXCIhy7wuBErDgFIv77yMVQ
 ycyo6MNkxq5WEhYVDlvf/fNZO3UvSA2JeWB13cmg2JzgenfAhRpY7TYFEnskq8a4q1ac sA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy67006e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:11 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PJUcTh028763;
	Thu, 25 Apr 2024 21:37:10 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2upjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:10 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb63w18416368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:09 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CED4F5805E;
	Thu, 25 Apr 2024 21:37:06 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 288E858045;
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
Subject: [PATCH v3 05/14] dt-bindings: fsi: Document the IBM SBEFIFO engine
Date: Thu, 25 Apr 2024 16:36:52 -0500
Message-Id: <20240425213701.655540-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ke0NAJKC7E3pKazASKmbGqamvpnvfDtG
X-Proofpoint-ORIG-GUID: ke0NAJKC7E3pKazASKmbGqamvpnvfDtG
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157

The SBEFIFO engine provides an interface to the POWER processor
Self Boot Engine (SBE).

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes since v1:
 - Chance "ody" to "odyssey"
 - Fix typo in commit message
 - Reword description to describe the hardware only

Changes since v2:
 - Rename file
 - Remove '|' after description
 - Change generic node name to match fsi.txt

Changes since sending in the Odyssey SBEFIFO series:
 - Add occ child node documentation

 .../bindings/fsi/ibm,p9-sbefifo.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
new file mode 100644
index 000000000000..72569147db2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.yaml
@@ -0,0 +1,50 @@
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
+  of an FSI CFAM node; see fsi.txt for details on FSI slave and CFAM
+  nodes.
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^occ(@.*)?":
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
+    };
-- 
2.39.3


