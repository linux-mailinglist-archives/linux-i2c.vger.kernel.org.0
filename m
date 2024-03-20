Return-Path: <linux-i2c+bounces-2449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 064638811F3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 13:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 870681F23A6C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A85C4084E;
	Wed, 20 Mar 2024 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FQoGkTpY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E3C3FB95;
	Wed, 20 Mar 2024 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710939550; cv=none; b=fTgA7PfdVaiZ9KpKOHtMx9lp1DkHGvi9CpPObUKoIGpGoSISPurZuOuhf+0CMdj2h1o2i7AHU4tvBCEcw74BOqM40RyaxGPohqv8qfz+CZLDeBSsLXmx2dPVj/+6szQhKqD5JLyziFOe4CvxR6plpIQvaulCNfTN/anPjlkRDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710939550; c=relaxed/simple;
	bh=3szIjYTN3iM0DfCCx1AY9klbxfdcTvCQ+thfnuGGKYU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OL3Mzti9f/YFcCWT9dHMW3Qzf2ccI4sbqhSOwbwFka2BH41kOZZK+XLQdZN3klMY5TvkQQG0DmTIiup9tZpZ9tM9R2mdrt1VJU3OeQvUUmfTmRjt1/3rbUkbXCx0O/I9tFVmgXchJyRFI+HCdZOTEKNC6wadvqQzrbzNAhhvgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FQoGkTpY; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KAAnTU026429;
	Wed, 20 Mar 2024 08:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=DKIM; bh=qtT3QihMz75U
	y3fqSwuYAon0fY2IFz2DuKRKO/YS//A=; b=FQoGkTpYnLS8SeSYcLs3uR91UsDm
	iUr4XR7sDzIWzvaat8krBiO4PSEh3Dbixdv6A+PcQjK14O6Gh79UCepxyau6fWf0
	63rJqvZEqAxM/IDRwlkM9GzSmxSmjTGl2AjhTAQzIfsabR3uVKIjpuMLCZ6B+F1g
	ZaHZRLx5vP6oKxeypSNbGqNw+QkoxinxKnbmmGcc4bengH7s0araBB8ZVnFzVFkt
	t/mKnWMv0kuoogdAL1SPTT+5kMdKUq+7gh+CdLqJY3eNCCrcQic+++mDRf+3xAZu
	hBu89meK4y9SzVSa20J9DM1ImbwpbJJ1+wyX9LCZvQcfEHhB2NghyJnsVQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wwragnfju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 08:58:40 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 42KCwcKm003388
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 08:58:38 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 20 Mar
 2024 08:58:37 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 20 Mar 2024 08:58:37 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42KCwLBw020197;
	Wed, 20 Mar 2024 08:58:24 -0400
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
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: adp1050: add bindings
Date: Wed, 20 Mar 2024 14:57:11 +0200
Message-ID: <20240320125727.5615-1-radu.sabau@analog.com>
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
X-Proofpoint-GUID: 3OJN21agpgRyfoxjEGvN-yxk5VZZD0-u
X-Proofpoint-ORIG-GUID: 3OJN21agpgRyfoxjEGvN-yxk5VZZD0-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200102

Add dt-bindings for adp1050 digital controller for isolated power supply
with pmbus interface voltage, current and temperature monitor.

Signed-off-by: Radu Sabau <radu.sabau@analog.com>
---
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
index 000000000000..42cafd8fec25
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
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


