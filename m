Return-Path: <linux-i2c+bounces-9580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4DA44013
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 14:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64540424265
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 13:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28952690F6;
	Tue, 25 Feb 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="kHSU9iYe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2972690ED;
	Tue, 25 Feb 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488532; cv=none; b=sslaJZ9XXfOby47jn7avKLAwlZPYhgkP1zjxkh8dujAiVQf2T4FffJd7wOn7eIuVTE6/hArRFGWv5Zwvhq7ZlDL6yl6JifXWjxneEb+7fgqE9JuMro0uxuV/fVXP+NZDP6oxh/vHCCs0aRFXsGRM80e5M02hkxo4nK/W+2ue3/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488532; c=relaxed/simple;
	bh=z8XEyYiCRBwvRG2SRyEWrykvLsfiZt9GP9CmBZQI1gQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tCTNvfFI52aoGoe0xZn9tLcF1KrijROXMu6YSTNj3N6M9+xetxnB/0o/FpaTUixl2Bz3cDP6j+7VghAJ3bS4mlK6QpFfKdJP4PCUHqzVWGvQA27EBiSjYeNv0tPbRvgOxYVs0RRl0ZbtZC+gvwckq56s2W/4wO55P4FghM3HMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kHSU9iYe; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCAsUq014783;
	Tue, 25 Feb 2025 08:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Vwi52
	4rzlFhgdbmnIanvz51keyXF7KmC6TsBUwejzBo=; b=kHSU9iYeUcfS8aqN0Eap7
	rVu0lEmA8xG/3RBw179lWTSS8Jj0J7QnI51R/svC21RCrcuBZjoW6aRwTDs+wVuZ
	XTJsaS0L8R9bbU09u3913zE/lTqQL8axaoukqZb2F3810pE5PeuGRcMD4bJIW/3L
	mMRbFPfTkE0c4ipap2U6osD6OLQtzYOpxeJ6phmXmHRfkljBJV2mPMddL7+BrK+h
	9MoTL98XTK71BM+fGFPs0C0FzGi6e3n1zh6/0Wd3hy1IxMVEsibMGMOGbn29FQL0
	Xsm26nXNXxJCQFM2cy0fiNgRO8Zm8NHUMnTJQpgaN+DZVzQjMGNhfNj5DzxC5Ymf
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 451a4ksayw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 08:01:51 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 51PD1oiC051729
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 08:01:50 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 25 Feb 2025 08:01:50 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 25 Feb 2025 08:01:50 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 25 Feb 2025 08:01:50 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.88])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51PD1VXU020999;
	Tue, 25 Feb 2025 08:01:44 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Tue, 25 Feb 2025 21:01:13 +0800
Subject: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
In-Reply-To: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488492; l=2848;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=z8XEyYiCRBwvRG2SRyEWrykvLsfiZt9GP9CmBZQI1gQ=;
 b=O1Z7HS9sgxlnd3MJmGjAy1EAxYFkBY8NgVz+v7QIdyJXgr4x8IuhHWKMTcZYX2wncfuCOg9r1
 dPjFiMRSYwBC40GJato0VyYZEh2WLZPPQOCQGOPuC1M9Z62zQTwNEM7
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 8Tix2mPG22MztakELvB_Hv-4O6Fux147
X-Authority-Analysis: v=2.4 cv=cK4askeN c=1 sm=1 tr=0 ts=67bdbf40 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=RNqdUYXd8PtXJ_VvvYgA:9 a=QEXdDO2ut3YA:10 a=feVPlwq_TaIA:10 a=tI3wEBspppMA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-GUID: 8Tix2mPG22MztakELvB_Hv-4O6Fux147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250090

Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
Regulator.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 64 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..714426fd655a8daa96e15e1f789743f36001ac7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
@@ -0,0 +1,64 @@
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
+properties:
+  compatible:
+    enum:
+      - adi,lt3074
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: |
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
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
+
+            regulators {
+                vcc_1v2: vout {
+                    regulator-name = "VCC_1V2";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa06545e2861abe46ea7029f9b4d3628e..4a59ee6a03919af6a48717a0ddddabc7241a9e63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13687,6 +13687,13 @@ L:	linux-scsi@vger.kernel.org
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


