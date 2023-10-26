Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41EFB7D7E3B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 10:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344475AbjJZIPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 04:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344490AbjJZIPd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 04:15:33 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2074.outbound.protection.outlook.com [40.107.255.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E8DDE;
        Thu, 26 Oct 2023 01:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAzpJo4rxYM8smCh+h4575R7r2pAye8XMzewLyNeVTfloU7Gc4ihC/b8flNXrwLKhVGX733VyuhIKRTvndF/LaGN2FiExQwb4cRP8CmEslgArsM4GJ//bO3YgxmOa03yPfCjFtmWLKE0iXlnurEWqeOwNGgV5dSnLOQlEB4qFrfjQ4QSzBg2oy0qOKJKrcGW1QAveeZ0AbpoFD8laR8CpqMSEohJ/DZ9GidKaSGBJa+i5eka0k5cbvVNh1usZhq+QEyIvw60QC4zCbSbda2bthSBn+fncfdbmzv0E7v+p/DEsz9h3xr9412RljjTqj+S3QSOWd0gybrr9lFPorYZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu1kH+s04gH8m5YD7GMUEKbURDMiPBqqqxutgBogaIE=;
 b=MtkYlWDzfuyayC73nqj26yWoeIvGkeCuGt0soLwsf+nKXvon67vGXrNzV243l4wq6BfYDuIsfncwgL1iujhVcbFCyHKehy6+54veQay1zScXb87yP8WRXx3+KpP6+Oa+wY0gxO+cFlavFajAdC0nt4P5umXbxLJo6VFkrf8c+XdqfOUJ9u6za0qM3DGig7wts+pSxmKgzCJLJteCnGJM35EdeTtGBs5QHGczVAbKvA4r/ZExJeEpkTZoGq9CCofcqrn5TatANIXIc76jikaWF4DxEAn6h9Rcm1gZ+opaKNgOPVMp3c2G+p/w9+LKdsVtCAe8DVM7FzLmIh5O0ym+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu1kH+s04gH8m5YD7GMUEKbURDMiPBqqqxutgBogaIE=;
 b=Jl3RDHHnd02qcDxzoeMH8PzgeQr42CV8zXuzbHlnqpuqFcoErsQtwUDvDgEI7fIr9AkzqxfyzfVIWK13Rk7X62R0ohAiwFyG7o5GFNZwZ5jKgIgnMlxuHUehNHMX5BG9qf4FGpfdLEAvgK/ZQ2r2XYBMvyHdD2yqBX5xskADUk/WBHMMNKQwbf2UJ+G79vw63MOd/yCved5YmuEEwvZThm+7ZR/V9bG0bsOlcDsiDpE1dr27r8iC7qB0JgFXFqQoJjp+gKpz9DLLFHZcbLPxXTbq94OtU9siC2lTtcEHwWH89aLzODgPxyGUfVoQj+ZJl+jclqNAoz3BnF31kd3Khw==
Received: from KL1PR0401CA0019.apcprd04.prod.outlook.com (2603:1096:820:e::6)
 by JH0PR04MB7310.apcprd04.prod.outlook.com (2603:1096:990:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 08:15:27 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:820:e:cafe::8f) by KL1PR0401CA0019.outlook.office365.com
 (2603:1096:820:e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22 via Frontend
 Transport; Thu, 26 Oct 2023 08:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 26 Oct 2023 08:15:26
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date:   Thu, 26 Oct 2023 16:15:11 +0800
Message-Id: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|JH0PR04MB7310:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ee681f8f-6081-409a-28bc-08dbd5fbb61e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jp2nct819GHNdoSVZQyprYKOtpBrdHGQDVeKdfrIIt4MojofqXtPrjBNtIsRgExkulTagFQLzT9Wyjp0CVC7hwJboXmkj1udRljtSezpCXMXEIvkBLLkcTo33jdqKc0xcAGf5QQ4V7Hg7b0dQA18X4A1SOYSb/B2IaqHWwMZfJD8Rdv4LHcPM/ZAZZGFTKSdJPlqem0T9yQxOJ6OAG0LwzlwBSH1KlltNYU9MjyAgqUdmcFNAzQE0a5swEpcnImEw9TEw+nqSH0WU46tMr7Gcl8evobECj0q/G1lq4kHYZpAFzusH2Z63N2cuLTw7eqzlt9mquuVeMOatua6WFD/ocw44XPDTCRDNKvZjZH3NN22jpE4hxscevCKSQrnMDyJefcmJcU9pdOxKB7FsWg6+qjTjPacanaLMSW6W+DNDgvS5T03twvHV7mBFw1o9eFccfdn2QmD8WIedot0FyyZ82rfomvDNoRiKXLHmDLxD+agIUxM6A3FEA1MVdyq/imrMp4jrSVCyff58UhHb60sbkB+HVvZ4PqsNYZRRm1n4FW22M3M334mGgaHEIZhXqUvU9RE4hkV6Wn/q8RKfW5s8Kk4Y/tlX1MkJzPvsRyfUhyGLJI3iMaD/kPL2BQjYaTILnmOK2blUkjGc9KGorza4JYxq33sFKav+mvJzBq+uEFZM2hpzmxDLnVXI0vt3HYK
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(39860400002)(376002)(346002)(64100799003)(1800799009)(451199024)(82310400011)(186009)(46966006)(36840700001)(2906002)(82740400003)(6506007)(5660300002)(316002)(356005)(70586007)(110136005)(81166007)(478600001)(6666004)(1076003)(41300700001)(36736006)(70206006)(6486002)(47076005)(6512007)(966005)(40480700001)(2616005)(86362001)(336012)(36860700001)(36756003)(7416002)(4326008)(956004)(8676002)(8936002)(26005)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:15:26.9338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee681f8f-6081-409a-28bc-08dbd5fbb61e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7310
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a device tree bindings for ltc4286 driver.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
  v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
     - Add type for adi,vrange-select-25p6
     - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 50 +++++++++++++++++++
 MAINTAINERS                                   | 10 ++++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 000000000000..17022de657bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,50 @@
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
+  adi,vrange-select-25p6:
+    description:
+      This property is a bool parameter to represent the
+      voltage range is 25.6 or not for this chip.
+    type: boolean
+
+  shunt-resistor-micro-ohms:
+    description:
+      Resistor value in micro-Ohm
+
+required:
+  - compatible
+  - reg
+  - shunt-resistor-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@40 {
+            compatible = "lltc,ltc4286";
+            reg = <0x40>;
+            adi,vrange-select-25p6;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 668d1e24452d..89e5fff4bba9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12466,6 +12466,16 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4286 HARDWARE MONITOR DRIVER
+M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
+F:	Documentation/devicetree/bindings/hwmon/ltc4286.rst
+F:	drivers/hwmon/pmbus/Kconfig
+F:	drivers/hwmon/pmbus/Makefile
+F:	drivers/hwmon/pmbus/ltc4286.c
+
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

