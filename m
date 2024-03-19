Return-Path: <linux-i2c+bounces-2401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B087FCE8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 12:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54FFD1C21ED2
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 11:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881F17F471;
	Tue, 19 Mar 2024 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xqmJ2fXP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C517E787;
	Tue, 19 Mar 2024 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710847990; cv=none; b=VwR29N+2b9AZ5rpsXwmUsZn0csXiKYbNk7Qr6J98Gw1wKHOkXf/Uu8UzJsKX/I7trGZr6Lb/ma2jJ6CiguRtpLbm53NEWFg5tzHPRWxPDfX6x1tcLVHIyCRn86NdxiBl43kgcTQQcrm0BLIaJL+Qmyr6HUo9YNHujk3qbtQ6cOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710847990; c=relaxed/simple;
	bh=8uFZCpgvTgwI780POvs5radpceMq/Eh4xdhGM+6uZ+c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q0UV9gjpzz8JVDQ0TkbpHNUFDan9CeTnBKNd/IOAf/GbtXnTPb5hZBFg/e+Wfz0YhrxiEXrQH1W6+O4h7kJakmukIJw4cYaw9FK8vxxW2mrhlo4pZbnDWwIdPe9LfoUK5UKSpPYWFNxr9Boq56SbgU16ubYVl5UPpRtqRwdRbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xqmJ2fXP; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J7a7VV013952;
	Tue, 19 Mar 2024 07:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=DKIM; bh=OGpMmVgBSeRB
	xvRFq/PxBh5zdn/+WOiZc9zpHvbT4So=; b=xqmJ2fXPOQX93HmHAVNKERhHu070
	VP9BIBaZjrRL0T4wmSTQy9OL26nF54O5GPooHkXCwCsMUTCgXOMPNh0bp+rmWhw8
	X1S8mwgRjwM1vVcQsjAghVCQybv7ReKp/B+bFi+x8zzATSyUDxZ+NrnhqMIG6AYk
	nK7Yay/BC3wAL6VEJP25jmWVnauaLOcEnJ+S97uWvrXEV794/W6J2/c+L/knZ/j0
	VIUd6ap2gpghP1dZ0DFdWiorqcGqxuIB8vQjxrqkprC9KdWh3zASiofqTDLzDfX+
	VXK8GCZs9bNfEF8jAcbYmRs1A0FRY/2tKPjYaaltd4yg5qwEihErVDH3jw==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wy6f1rr25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 07:32:40 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 42JBWdOO012950
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 07:32:39 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Mar 2024 07:32:38 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Mar 2024 07:32:38 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 19 Mar 2024 07:32:38 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42JBWKUQ020586;
	Tue, 19 Mar 2024 07:32:22 -0400
From: Radu Sabau <radu.sabau@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Radu Sabau <radu.sabau@analog.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: adp1050 : add bindings
Date: Tue, 19 Mar 2024 13:32:02 +0200
Message-ID: <20240319113213.19083-1-radu.sabau@analog.com>
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
X-Proofpoint-GUID: bEAsKWDI0zcDQh3eTmMeGmXUW_SeQsB5
X-Proofpoint-ORIG-GUID: bEAsKWDI0zcDQh3eTmMeGmXUW_SeQsB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_01,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190089

Add dt-bindings for adp1050 digital controller for isolated power supply
with pmbus interface voltage, current and temperature monitor.

Signed-off-by: Radu Sabau <radu.sabau@analog.com>
---
 .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 52 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
new file mode 100644
index 000000000000..1a94b715c1f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: https://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
+$schema: https://devicetree.org/meta-schemes/core.yaml#
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
+        #adress-cells = <1>;
+        #size-cells = <0>;
+        clock-frequency = <100000>;
+        adp1050@70 {
+            #adress-cells = <1>;
+            #size-cells = <0>;
+            compatible = "adi,adp1050";
+            reg = <0x70>;
+            vcc-supply = <&vcc>;
+        };
+    };
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 1339918df52a..90b8e64e1f6a 100644
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


