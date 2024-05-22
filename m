Return-Path: <linux-i2c+bounces-3622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6D8CC6D3
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29FB51F22680
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AD414658A;
	Wed, 22 May 2024 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ejSKahD2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E11422B7;
	Wed, 22 May 2024 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716405959; cv=none; b=p1rv6v5A+fX1oIcXyuxytM+Psi2paaA0c2MtPNAcLhoi++C86GszmvQioEQquSso8REU13iqq39uo5ZO5mSDVBXxTJsjkzBMsGTetHpLJb8U0cO7Fy3c3iHiE8j/Nxs6OFLyRoAKEQta1EbnbgXl0MkA3M7kf8vhpDdyw+XgeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716405959; c=relaxed/simple;
	bh=uDU5ELBTf8zySUhNXHrvPqNK4kQ+x2w+KGk4ZslrO0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3qocJl0o6hw5fH0fXAK1WagnyJNgUSBhuk2Fi6IUVUTWIKzQRptlOb0LAXVbblSwoRoWM6l4t3N8dz2aHcTOIW5bzCvPjjAlj+zJiGakLOpRggjje+/wxhllpkEZm3WqOFWHdTkmUGL5jIHNm8kSywphp55IAbuknde6Oq2Iqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ejSKahD2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJJv7h021712;
	Wed, 22 May 2024 19:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=zoTnKXLL2Skz2o8iAXlb0tVFZAdIXzU3Pr1JzFRMJhY=;
 b=ejSKahD2YMaT6CQ5rI8pneeFyKOo59spPZFKuNucKdNMuEoo6ErQr2hxtu/s62ON70+/
 teTjnEM0SVw6AN42p5yRCxZW7+xtIVhs89MPlaROPaTeLchyWOP8tWMq5hMfO5pspOFE
 qsAgxhlOZf4+p+2yXWyuoFH0P6FF9bd/evgO9LdkqXIWkZU1A5OySp5RtCDs1Xfgeloo
 bbGZiTBAU+w+cYf9veBk8dUcEK7tF1leh2ItdIIxNsL4cbtSbhFrAKWmrLmuR5I3oS1e
 DKiJQydGaW8WWg017kD14eSjE/bho/dNfloUSEcq+930/eU0weutwa0u9RjZBKIgt5O4 OA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9mp70bhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:29 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MIKLQO008188;
	Wed, 22 May 2024 19:25:28 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y78vm5a5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:28 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPP0V13566510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:27 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A79158058;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A45E58063;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 01/20] spi: dt-bindings: Document the IBM FSI-attached SPI controller
Date: Wed, 22 May 2024 14:25:05 -0500
Message-Id: <20240522192524.3286237-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5mz-mYk2MD67nVTPLgFP443_FJ6nuRhR
X-Proofpoint-GUID: 5mz-mYk2MD67nVTPLgFP443_FJ6nuRhR
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

IBM Power processors have a SPI controller that can be accessed
over FSI from a service processor. Document it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/spi/ibm,spi-fsi.yaml  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml

diff --git a/Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml b/Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml
new file mode 100644
index 0000000000000..d7fec4c3a8016
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/ibm,spi-fsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM FSI-attached SPI Controller
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  A SPI controller found on IBM Power processors, accessed over FSI from a
+  service processor. This node will always be a child node of an ibm,fsi2spi
+  node.
+
+properties:
+  compatible:
+    enum:
+      - ibm,spi-fsi
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        spi@0 {
+            compatible = "ibm,spi-fsi";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eeprom@0 {
+                compatible = "atmel,at25";
+                reg = <0>;
+                size = <0x80000>;
+                address-width = <24>;
+                pagesize = <256>;
+                spi-max-frequency = <1000000>;
+            };
+        };
+    };
-- 
2.39.3


