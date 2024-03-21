Return-Path: <linux-i2c+bounces-2470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90723885A94
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 15:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3616A282DF3
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487EB85279;
	Thu, 21 Mar 2024 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FBaOWFsv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6634484A5A;
	Thu, 21 Mar 2024 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711031009; cv=none; b=FzNlc1RA6Y7vMeWAENQfuTuZ8PyuV8gx23/jO14itO0ZXZ+TEje/67s92CYf/21R+YcOfOFlKhGL0kkGTHxgKYpV1v7pSm5M+SxdlDvj7zQsQxhMOwNvcjl5Nh3wwJiVqrSYguaWNxOWmLJbaVbg5O/b6yg55e00hN8cCYnVI6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711031009; c=relaxed/simple;
	bh=i3k8D2smcuGUV4zTuQXD6d2NhakJ/CGMge0aDELRsnE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=etkXpkzKVeqkJLwRr50ySzB1/V7NmTtUPvZIrccWvlahZbRAMudsPHggIf3v6tZeIbjpvQ6nbNi//NVWLfUmmdp+IrqroIhA4dI71oVgVxHe94vk5lnHmRKzMz28K7hgCwJ3n0/ozv2oW8QKiFRhhQihbxF99kTFPp6coqaVH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FBaOWFsv; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LDJwZD012506;
	Thu, 21 Mar 2024 10:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=DKIM; bh=Vp84VOTUBzRN
	rg+9EBiIB86THBzBhgqxHNyRGEzeUZs=; b=FBaOWFsvHGDRDzPBqza+z9hYKXYm
	1belL/9dwLg6HgBL3vB0QzLSv8WF/IJRYMi5v6VAAUoxHKCJqmy67P9ivX4A5MHp
	jupkSPqJHyGzJQXkBPAy/aKVHPiSQSl9yThlHDRj9I73fip/fkVGYL3YwPveBPvv
	XkOHsMyawINN66/Ajjlilz/30IzoOi+qx+z7T0Z38PusxlHUddBOsKUzntj5xe8M
	lZyaOIyXY8r9N5LPNFsLKDju4H05iyXvbLfYjR6hlLxTHoZThXB829WhAV5A129a
	oGECOT+FIH2GjGcOH+AG2N21ZkKRKsEIk3kkMtUiESRqs5JQ8g6Kk9pLVw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wwr8njx1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 10:23:11 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 42LENACi034186
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Mar 2024 10:23:10 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 21 Mar
 2024 10:23:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 21 Mar 2024 10:23:09 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42LEMqp8014288;
	Thu, 21 Mar 2024 10:22:55 -0400
From: Radu Sabau <radu.sabau@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Radu Sabau <radu.sabau@analog.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Date: Thu, 21 Mar 2024 16:21:42 +0200
Message-ID: <20240321142201.10330-1-radu.sabau@analog.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: tL-Alckf2BwH53rQv9qeyXDUN_2aMS7l
X-Proofpoint-GUID: tL-Alckf2BwH53rQv9qeyXDUN_2aMS7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_10,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210103

Add dt-bindings for adp1050 digital controller for isolated power supply
with pmbus interface voltage, current and temperature monitor.

Signed-off-by: Radu Sabau <radu.sabau@analog.com>
---
v4:
 *Fix typo in schema link causing warnings at build.
v3:
 *Remove extra line before '$id'.
 *Remove 'address-cells' and 'size-cells' from adp1050 node.
 *Rename adp1050 node to generic name.
 *Fix typo from 'adress-cells' to 'address-cells' causing errors in the
  dt-bindings build.
v2:
 *Fix identation for example.
 *Remove 'adi,vin-scale-monitor' and 'iin-scale-monitor' since they are not used
  anymore.
 *Fix typo for 'compatbile' to 'compatible'.
 *Add blank line under datasheet link.
---
 .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 49 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
new file mode 100644
index 000000000000..10c2204bc3df
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADP1050 digital controller with PMBus interface
+
+maintainers:
+  - Radu Sabau <radu.sabau@analog.com>
+
+description: |
+   The ADP1050 is used to monitor system voltages, currents and temperatures.
+   Through the PMBus interface, the ADP1050 targets isolated power supplies
+   and has four individual monitors for input/output voltage, input current
+   and temperature.
+   Datasheet:
+     https://www.analog.com/en/products/adp1050.html
+
+properties:
+  compatible:
+    const: adi,adp1050
+
+  reg:
+    maxItems: 1
+
+  vcc-supply: true
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clock-frequency = <100000>;
+
+        hwmon@70 {
+            compatible = "adi,adp1050";
+            reg = <0x70>;
+            vcc-supply = <&vcc>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 43b39956694a..b45753e94756 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -479,6 +479,13 @@ L:	linux-wireless@vger.kernel.org
 S:	Orphan
 F:	drivers/net/wireless/admtek/adm8211.*
 
+ADP1050 HARDWARE MONITOR DRIVER
+M:	Radu Sabau <radu.sabau@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Dcumentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
+
 ADP1653 FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
-- 
2.34.1


