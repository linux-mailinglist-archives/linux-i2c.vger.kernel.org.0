Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75816EC9F4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjDXKOR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbjDXKOL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:14:11 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2085.outbound.protection.outlook.com [40.107.117.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044173598;
        Mon, 24 Apr 2023 03:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVNSeLwS4JxRKBMzVKONQ4T874drGg4tcJXOmokAyEL2YkzhGtu15oxzGdwedkjZEkV0uZaCkzEz9bp4p7KoxpocitbgTu0OIXXOX+/IfzKXcoX/tNlMWJj9/YaTEweuY3DHkZ31MlUS/xdQOAW8k6priLorrsRaEc0jaDs3rDlRFiUAXYVOGVIzdYOBjPKKpGCb507Zjr6BwErMuy0kTQo4OzKvCdXgn8JNLyanp4cv/wcZJTGvUuttYxQPD0Ql8rt5G/MG/cKBhoPbaLYhzIC0AZMP6CChhZo5Fiz7dG7EzU5F0LBMzZcsx2RKGckbFWkSjH4L+tWVJfMmxg233Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+jVyIJzHHk0P1FeplsZTZ0r2cd3RE/FBIpR2p+4C3c=;
 b=Sfw9cmhGltotkAY6xtKSKEi5PDrnEJrtfiF69h6hyeQbxeQjv8fDCNUyLSPdELVEdPYcB8CHqcu9Zo6+nUHLCrMlvtQf6SzKysUusHphykBksO4GM79a9gqEWzmXCcDKc9BDPPnl6OY0Hw7GJ/gbokYin7smEG5JA3IXbIkvY0Quz05ud03mw7P36QiKVc/3BHAM3PZkYaHPncT29Zcrg7WncJgZlf1A5v/bqDu2pjZ2gOg1Xlf/rC228iuleyLd9CfySBOaRrGKFPLVlmPJ3LjdAbuVkpKSjIXrZhvFiViJGEH18UEGYagViMCSql9uZBx9DKH+2bqx5RuexNcqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+jVyIJzHHk0P1FeplsZTZ0r2cd3RE/FBIpR2p+4C3c=;
 b=OoVLBWeFtY8iQQVjRB783Jce5kMe0W9XhzUFlPNy3Vu8xD2AiG9N9jq4Ivyp1U8Mr7MYXbTgnLnYmywWfHe7uYaWZlVDGk7yrWt4CQ4qXoPMXcSbz7uOnuPMQZ20PY5ybM+vWszuNigoL0+iGE7hw9YdPifXQB7ty624ELU6A4LXUjZV4vbuSkvnp9rXeu26kDMz65n3iTgW8QYIa9pRQzdhakCmPA78PJxmaMEQJoKqQWS00lua2HobjAzgeE+Vt3Ahn+Mhu1eqRdZM2YGc0hO7whj4XEN/TDVbWdqDF9vbEEFw84P6E84JdIFx7E9v3Q5n8t9Z4q0S/IL50wvJRw==
Received: from PS2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::29) by TYUPR04MB6639.apcprd04.prod.outlook.com
 (2603:1096:400:35a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Mon, 24 Apr
 2023 10:14:04 +0000
Received: from PSAAPC01FT059.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2d:cafe::69) by PS2PR01CA0017.outlook.office365.com
 (2603:1096:300:2d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 10:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 PSAAPC01FT059.mail.protection.outlook.com (10.13.38.139) with Microsoft SMTP
 Server id 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 10:14:03
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date:   Mon, 24 Apr 2023 18:13:49 +0800
Message-Id: <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT059:EE_|TYUPR04MB6639:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 458a3fb4-4339-4c97-e2ba-08db44aca193
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LIAayCjCqc/j5eOCUx0GZPdFM9yYXHCoWx13eRcedxyljpBK13r54jPa/aKLUouOkp1G1I4Qsskfvqgtk78xY5I4UDo8iwH7oGc/Kxw41/z5mNurA6vReWe9e50vrg2In9ZK1kj+2JpuqMaxVMHic0n312huHEj3mVcCqGGxFBaEgygocIlcYK9yKynhjSebQ2qcXkzjMhSUi9nK9czKi9Ki6hXTAP0Vbf6WF42jxeRPxUIcoPrgaOo8hjRDBzgIkcurh4pycLEWkK5lovfEQ91C8qEis7RPkCihwc79pp2J9Qr2p8gQC9I/EWBj1FIpXGlfwYwOssR9arYhjooWYKN9J5N/x/CLuWeRsrBipoq94nssHaiPSK+Z6CoCcffC1dt4InEb5ZvtFL9j+g/hBVUcaDon7ve4u6ixg13LJYvGuhAkx7zEjPfbFW7hgqsEJfw5AnszuMP/aEKRqzVkaroiTzloFEnaXzIPnTQt4BgsG3st8PBUJ04teXQyTsUbET8oqtNtOkFEES73coAWWDYD0irg4T2MOLU8O8/mpQo7nnA7m39NSN5eEpu4yiRWltTtwKiXc02z2dkhfNO1BuOVDd4zN5PJy8MVfMMnaREL+Iu0MnG9Ouv551sy7tj0ywrzmaHBuoGP3Ue/Ltr+q5BEEvBq4Nk/1ahwJcwBD8=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(36840700001)(46966006)(478600001)(356005)(81166007)(1076003)(82740400003)(956004)(82310400005)(6666004)(6506007)(186003)(6512007)(26005)(2616005)(966005)(336012)(6486002)(36860700001)(47076005)(86362001)(4326008)(9316004)(110136005)(40480700001)(70586007)(36756003)(8936002)(8676002)(41300700001)(70206006)(36736006)(316002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 10:14:03.2848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 458a3fb4-4339-4c97-e2ba-08db44aca193
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6639
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a device tree bindings for ltc4286 driver.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 47 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 000000000000..c1c8e310f9c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC4286 power monitors
+
+maintainers:
+  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+
+properties:
+  compatible:
+    enum:
+      - lltc,ltc4286
+      - lltc,ltc4287
+
+  reg:
+    maxItems: 1
+
+  vrange_select_25p6:
+    description:
+      This property is a bool parameter to represent the
+      voltage range is 25.6 or not for this chip.
+
+  rsense-micro-ohms:
+    description:
+      Resistor value in micro-Ohm
+
+required:
+  - compatible
+  - reg
+  - rsense-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        status = "okay";
+        ltc4286@40 {
+            compatible = "lltc,ltc4286";
+            reg = <0x40>;
+            vrange_select_25p6;
+            rsense-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c6545eb54104..930bdba0f73c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12183,6 +12183,15 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4286 HARDWARE MONITOR DRIVER
+M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
+F:	drivers/hwmon/pmbus/Kconfig
+F:	drivers/hwmon/pmbus/Makefile
+F:	drivers/hwmon/pmbus/ltc4286.c
+
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.17.1

