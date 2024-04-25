Return-Path: <linux-i2c+bounces-3163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8278B2AE4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2539B22179
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBA3156643;
	Thu, 25 Apr 2024 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Nu+z8Aer"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898715573C;
	Thu, 25 Apr 2024 21:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081044; cv=none; b=kx6GuIyBZeVlyqjvAgPmTSb7zwCtwXHaXSzFvWsAuptPb/9ktj1OjeMX1fC2CP4s/+zkoFLnOyHOY1dT1SB2/BAV5ySqvcLtpXdGsQhkOP/GD8nMlahK1c+z/i6RfbvwuMi0LVzHYPXnSH44zdmL3AdbwAEwks9irLxwQMIoqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081044; c=relaxed/simple;
	bh=8pdKiEh37wtELfXL0XiAiFuk4Liv/XZx12PKvkG3Vac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uuzSGrRJd/GIvk6mab6FoLOD8fY34I3gyoqc3lbK4ajxKHMxe4pd8pV4uXOJ2LHoDtcKawbUAZPOqbFNuITwGCg7vGjSoqFZqcMj99CfDMg+5q83vUT+gWHyBZu5cPwr7tCUGudOPI0tuswfvZkzQ96WSu8ZmxgMZP/JHBvfXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Nu+z8Aer; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLWpNl027592;
	Thu, 25 Apr 2024 21:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=4ELnT7ygO2Xxy90aFpuMDgrL2AMoiFT7nszcZtP3vcg=;
 b=Nu+z8AerKGK0+TcJdzRHSDSwHOQbtqrtbgMQ6Np+9ioQStaa/TnLlWKQfTRIpZGWB4+T
 Cj6CV3YiicTJsRtF3JDd5DydiO6U9uYLgVlsfY7WQoGefrarF7YGvBNoLzrdbbjzKvJF
 pGf68TNLDpHFC8GGB/MtNdh4LYpGQB9WSUvs06CNws/yCFhy1sQhCaAKmPPaAiOJfmbf
 hQbdGlXUMR7ThpJDNPxmpbSGf+F698iFmRZV1nfK2Z9Kml32c7MIP99HbfctfnwybBaS
 NamfKjqUtvR+Gl1f7xRpUvsLB2+AV7j1B+bMssi04EUFUOfjeVKiRjdUoqEgoy5hV+mD Zg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy67r063-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PJhMtf005373;
	Thu, 25 Apr 2024 21:37:08 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3ctwut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:08 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb5d453150104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D0D05806B;
	Thu, 25 Apr 2024 21:37:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B59558045;
	Thu, 25 Apr 2024 21:37:04 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 03/14] dt-bindings: fsi: Document the FSI2PIB engine
Date: Thu, 25 Apr 2024 16:36:50 -0500
Message-Id: <20240425213701.655540-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z6UsLajO8Qej7DtcEViz5s7PHoxZ7How
X-Proofpoint-ORIG-GUID: Z6UsLajO8Qej7DtcEViz5s7PHoxZ7How
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157

The FSI2PIB or SCOM engine provides an interface to the POWER processor
PIB (Pervasive Interconnect Bus).

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,fsi2pib.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml

diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
new file mode 100644
index 000000000000..4d557150c2e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/ibm,fsi2pib.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached SCOM engine
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The SCOM engine is an interface to the POWER processor PIB (Pervasive
+  Interconnect Bus). This node will always be a child of an FSI CFAM node;
+  see fsi.txt for details on FSI slave and CFAM nodes.
+
+properties:
+  compatible:
+    enum:
+      - ibm,fsi2pib
+      - ibm,i2cr-scom
+
+  reg:
+    items:
+      - description: FSI slave address
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    scom@1000 {
+        compatible = "ibm,fsi2pib";
+        reg = <0x1000 0x400>;
+    };
-- 
2.39.3


