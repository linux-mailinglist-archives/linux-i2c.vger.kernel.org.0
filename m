Return-Path: <linux-i2c+bounces-2386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62287E945
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 13:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D2E1C21318
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 12:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289E8381BB;
	Mon, 18 Mar 2024 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="q1Zto9MX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EB36AE0;
	Mon, 18 Mar 2024 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710764657; cv=none; b=DM8O7N2XqvPfQ67oshB9UhQFCEH4G/bw0VSERWxkM3LNl5Gagu3OizfQ3qO+qRaAbv1YdTA6LGizW6RPwANijCNO2qNPUEtjnhlx8wMMH6JVY0u/3/cBy7Z1QDQRmL1xeM9cnFKEzpRsmZfuC5MzDw8Yv8eVS7C160WHXZYFDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710764657; c=relaxed/simple;
	bh=hm25JLQRk4b9nIvhGD2XV22OWciSUqnxr63zD7Z7OAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RKe2OaFHiFYyU+zNdikBGcu6AdkeVb01vOvDdNKVMMuuzK+TdyNzEVNVxrbiq4fU8sLXCeZoHSAIaa1/3qJRBq4ViDi0g4LRh29pVdxSoI90ARqF0zTATTtXWkNZrL2/d2th83UKZ/iTvPXfnOMMlRETt6CuY5qcRWDWDZ/XCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=q1Zto9MX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I6jcvh026351;
	Mon, 18 Mar 2024 07:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=DKIM;
	 bh=ov94P7YYE6mAmZpON4rV2d7snBWomJwhbOaXateDNnE=; b=q1Zto9MXrFH2
	O5hI/lgtTvzk1YQUl0Brtflu4Opo8EvAjxbJtWudYWhhIASms4sCsh/k9LHhQBZK
	AUyZLYEr8llyBRQXg6trUEPO5Zx4rQEOL+VNDxGli8EJR4SRny0CjmvxvlPNLCHv
	IcH0srrrUbcYe+dNvv71of0otEe4hGZ38Qu+BvEcSMp8e4oCIX4f5+rOZhRjYIZ7
	S1us/4fB0afxOYLN7NmB9ZIRL1TaV6uKtKtvsDG1LFvvYAWHpVk4lBFv1b3uE/tr
	VneL5cbVZgFtYfYAeQbtAdhASxKwj0CgtxJWQn0uv+Tk4VQxTc2axnQW+8EoDNiU
	c5A5CbUblQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wwragc6rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 07:23:13 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 42IBNCqS024987
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Mar 2024 07:23:12 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 18 Mar
 2024 07:23:11 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 18 Mar 2024 07:23:11 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42IBMkMd030326;
	Mon, 18 Mar 2024 07:23:02 -0400
From: Radu Sabau <radu.sabau@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Radu Sabau <radu.sabau@analog.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: adp1050 : add bindings
Date: Mon, 18 Mar 2024 13:21:34 +0200
Message-ID: <20240318112140.385244-2-radu.sabau@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318112140.385244-1-radu.sabau@analog.com>
References: <20240318112140.385244-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: IOrR5SXYbuvbIk1lYZ-YRmoR3yDQ3IZN
X-Proofpoint-ORIG-GUID: IOrR5SXYbuvbIk1lYZ-YRmoR3yDQ3IZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_02,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180085

Add dt-bindings for adp1050 digital controller for isolated power supply
with pmbus interface voltage, current and temperature monitor.

Signed-off-by: Radu Sabau <radu.sabau@analog.com>
---
 .../bindings/hwmon/pmbus/adi,adp1050.yaml     | 65 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
new file mode 100644
index 000000000000..e3162d0df0e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: htpps://devicetree.org/schemas/hwmon/pmbus/adi,adp1050.yaml#
+$schema: htpps://devicetree.org/meta-schemes/core.yaml#
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
+properties:
+  compatbile:
+    const: adi,adp1050
+
+  reg:
+    maxItems: 1
+
+  vcc-supply: true
+
+  adi,vin-scale-monitor:
+    description:
+      The value of the input voltage scale used by the internal ADP1050 ADC in
+      order to read correct voltage values.
+    $ref: /schemas/typees.yaml#/definitions/uint16
+  adi,iin-scale-monitor:
+    description:
+      The value of the input current scale used by the internal ADP1050 ADC in
+      order to read carrect current values.
+    $ref: /schemas/typees.yaml#/definitions/uint16
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - adi,vin-scale-monitor
+  - adi,iin-scale-monitor
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+             #adress-cells = <1>;
+             #size-cells = <0>;
+             clock-frequency = <100000>;
+            adp1050@70 {
+                   #adress-cells = <1>;
+                   #size-cells = <0>;
+                   compatible = "adi,adp1050";
+                   reg = <0x70>;
+                   adi,vin-scale-monitor = <0xB030>;
+                   adi,iin-scale-monitor = <0x1>;
+                   vcc-supply = <&vcc>;
+          };
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index f4d7f7cb7577..c90140859988 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -479,6 +479,14 @@ L:	linux-wireless@vger.kernel.org
 S:	Orphan
 F:	drivers/net/wireless/admtek/adm8211.*
 
+ADP1050 HARDWARE MONITOR DRIVER
+M:	Radu Sabau <radu.sabau@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Dcumentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
+F:	drivers/hwmon/pmbus/adp1050.c
+
 ADP1653 FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
-- 
2.34.1


