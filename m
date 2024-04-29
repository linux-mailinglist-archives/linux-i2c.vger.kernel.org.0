Return-Path: <linux-i2c+bounces-3306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AC8B63F6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44D15B21873
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC61178CEA;
	Mon, 29 Apr 2024 21:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jXhggTGH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799911779AB;
	Mon, 29 Apr 2024 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424513; cv=none; b=QGRHhHtlJfRApH35dw7bfrv05lphm9PC3XoCO7UGs8m/gDAiyT9J8SvUiP/+Md+SXrB8klxaG/aWir2+H1jFWYTjY5txksD9N16MitAjy9MbaklIGRTI+El82n13Nmul6lHj4xkoitDKznY4ZEPjtVRYO8tfxoW/hmnSpe23MZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424513; c=relaxed/simple;
	bh=tJtT6SJcxygZJigtjXGpaCTFihPswhU54KabrqX2zI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWRLLd7KQ/+nyzg3C73B4VGlZB4gem5Ep2DBsIjHN1IL/xxN+d3Ix5NOTkFmLHH1O04G54n0efnHQMjHqSIf+nOU4nIu5oQTUMw2F+rbxREFTCF9sITYSmuZRnGYwegsHXR0y1CeiHq3lTDkP2XD/Gl0PyYumiEOfdT08d9UCRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jXhggTGH; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TL0j3I007565;
	Mon, 29 Apr 2024 21:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Y6BfD87dhIahpAAn0fI2lxisJ1uEIS/kOaJdXV3TE6A=;
 b=jXhggTGHMMfndlCju8KyX8GgE7Ut4brvYk/qVtxXPlIB54pi+EWolflc53XP+6ET1aix
 l6rBpFSFjU1IczGHuMa3EubYtzN0dM2OlKenBPSJYM42JcQp8tmWksE7s27jctniwgTw
 xZZYUtSlXdj++tZY0btibR3bElHX0tZFFTj/xMGhZvE2RFN7EZ8LBzdYRAoegslw9s0L
 fXbdQ/NG/ihj//gAZ0jw4MOlDYhjVIFx6GQDOWqeejV5QLRSPDDs95uOGhHymJwc7TCG
 Ms6qnbYuxjjBJi68eHKIX1QuoCNMQQIIw2UetEcbMxEGS/wOon9km0077sA32rv19qBU nQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjy9g0fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:40 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TIWu7f022271;
	Mon, 29 Apr 2024 21:01:38 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsd6mhceu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:38 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1ZgM32703022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:37 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6C2F58074;
	Mon, 29 Apr 2024 21:01:33 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D03758065;
	Mon, 29 Apr 2024 21:01:33 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 01/17] spi: dt-bindings: Document the IBM FSI-attached SPI controller
Date: Mon, 29 Apr 2024 16:01:15 -0500
Message-Id: <20240429210131.373487-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 56vcOkUhOyuUK9TIxydtPRgtIcKh6eEV
X-Proofpoint-GUID: 56vcOkUhOyuUK9TIxydtPRgtIcKh6eEV
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

IBM Power processors have a SPI controller that can be accessed
over FSI from a service processor. Document it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2: 
 - Change name from ibm,p10-spi to ibm,spi-fsi for two reasons. One, this
   matches the I2C controller binding (ibm,i2c-fsi), and two, this binding
   is specifically for the FSI-attached SPI controllers on the P10 but
   accessed from the service processor. P10 SPI controllers accessed from
   the P10 would have different bindings.
 - Fix warnings by using generic FSI parent node
 - Fix prefix

 .../devicetree/bindings/spi/ibm,spi-fsi.yaml  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml

diff --git a/Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml b/Documentation/devicetree/bindings/spi/ibm,spi-fsi.yaml
new file mode 100644
index 000000000000..d7fec4c3a801
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


