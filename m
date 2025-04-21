Return-Path: <linux-i2c+bounces-10509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CDA950B6
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 14:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E0E03B3B18
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 12:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD26426462A;
	Mon, 21 Apr 2025 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yad4W76Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06120264A7C;
	Mon, 21 Apr 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745237942; cv=none; b=idvhqo0Z0hg8oL/B6kSIcl9pRP0E7kkgUQYUs1bBVv+I4O/379zPxhY1/IdKFmv/vXi/GYBj5NDBG5HniXHjIthkPAMtsvakaAR0R4XRquMpU6GCrTs+JJ73tH8JCzk4MfbgYJ5qlwaltLnRDsbngECTXFEM5264J/kI2lPaW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745237942; c=relaxed/simple;
	bh=xiSnY8EfqC1RudGHTTa8EsfF/dQrFj4KtKv1PLC1lf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CbCpH/4V19yFO3UlpYoWn8EvAQiwoVLdi2Bhjdxz+4mjKNWGfRsJdjeeLe0ifrwYhLiUbQ01+tru4Ctiso2qgDgFpdTJT5+RqHS3BbuVwzGloUxvItt4Q5KTyxvWYKqj4Bfmc+vk7Q2kqkm4Ee2xNDd5WBjaYxlM8aXhAUQGKsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yad4W76Y; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA0LuP026182;
	Mon, 21 Apr 2025 08:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ROb7a
	9H+BtzUXduvcEixo+/SV+cqIHnR/itK85L4AoA=; b=yad4W76YF+IIaARhzAiB0
	JMZOvqvaj1q+7E8SD9i7/jPUbslYk1tODeTPgTADexXWomKb+WwCBTJKWvouRW3n
	USIxpx1dgCop5XuknUNb01v4t1i/8x0qBewH6pIj7zQvCAlweNteeQ2uty7lcTvH
	Bj6l+BwSqEYbL6KqLu7p21qz+TZZm0Z37Pn3dlQZEMjWSiRbGJ/+PF+siPzf/+DA
	68eC0AapxZw+FfXeVVx4QdylaWA3wtdKEsGT6x1F7vp/e29nv1ubD+axAJ0N9Ipc
	eeGSSUyZxOOZ9Q9QykIb6cMvCn5P+HxFMKlopBYccYmk4n9zjRFYPypcrSyysL4o
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4648r67w6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:18:44 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 53LCIgCp045299
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 08:18:43 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 21 Apr 2025 08:18:42 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 21 Apr 2025 08:18:42 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Apr 2025 08:18:42 -0400
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.222.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 53LCIO2Q013389;
	Mon, 21 Apr 2025 08:18:37 -0400
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Mon, 21 Apr 2025 20:18:18 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: add lt3074
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250421-upstream-lt3074-v3-1-71636322f9fe@analog.com>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
In-Reply-To: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC Chiu" <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745237904; l=2594;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=xiSnY8EfqC1RudGHTTa8EsfF/dQrFj4KtKv1PLC1lf4=;
 b=Ml6i2dJatQBs+CGW6QG1uSrzCuQM26AB+Aj8v1tbvlEaAamd8T3W+g6rCL4oJDSzVXCUU1irL
 8mEg8mWJVd+BlJJvprzynaFD1pyO1Ez3EVKEIAs7tuuMqrRC2FtzlAD
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: md5JUmaqXXZBZh0_JKdM4_9-i3XDSluv
X-Proofpoint-ORIG-GUID: md5JUmaqXXZBZh0_JKdM4_9-i3XDSluv
X-Authority-Analysis: v=2.4 cv=d6z1yQjE c=1 sm=1 tr=0 ts=680637a4 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=RNqdUYXd8PtXJ_VvvYgA:9 a=QEXdDO2ut3YA:10 a=feVPlwq_TaIA:10 a=tI3wEBspppMA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210095

Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
Regulator.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 50 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bf028a8718f16618a3e7e6ab6d04242667a94173
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,lt3074.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LT3074 voltage regulator
+
+maintainers:
+  - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
+
+description: |
+  The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
+  response linear regulator. It allows telemetry for input/output voltage,
+  output current and temperature through the PMBus serial interface.
+
+  Datasheet:
+    https://www.analog.com/en/products/lt3074.html
+
+allOf:
+  - $ref: /schemas/regulator/regulator.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,lt3074
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@6d {
+            compatible = "adi,lt3074";
+            reg = <0x6d>;
+            regulator-name = "vout";
+            regulator-max-microvolt = <1250000>;
+            regulator-min-microvolt = <1150000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f8feacf9628fd1065ed551c4250d5..cfbf4dca400e03fcfa34ac78051fdcd815477799 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13983,6 +13983,13 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/scsi/sym53c8xx_2/
 
+LT3074 HARDWARE MONITOR DRIVER
+M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
+
 LTC1660 DAC DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-iio@vger.kernel.org

-- 
2.39.5


