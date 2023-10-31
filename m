Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40847DC721
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 08:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343614AbjJaHVo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 03:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343611AbjJaHVn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 03:21:43 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2076.outbound.protection.outlook.com [40.107.215.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E14C1;
        Tue, 31 Oct 2023 00:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv4kZ4I/Vh2dWmlk5IoLuI9PhCQ3PynGkB+M1unG9f3Pt31a+K7i0rkrh/xWXSRavghyVxUc4l3EJc8Sopw3ZtXyltgl2uaV8Ux89cYYSJO1VqhiBb4o0JcDbBO235zDURekyTDEOeCUhEzdVvWCAHZW2n2pz9kRcbldNq+pV1riIgpwjpsWs4E1NF+6yUwQDgwZegUY+502CrFyiGt6Vfg+b0Vv0iiCqb6wU7WzoRFNOO8djf5iAhhaRm+1krbdWv9TNQKB4tDWXNsQbVFpSOV1+++AZumq/iHFdw19KPM3piBPW+ULfGpGDs5AsmTqk1A3Eat292Y410p+zBbhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlgnY9/Z+9UrP8s6ngkle4v92QpAgRMGHmsrRWh0Lj4=;
 b=KQZ8gkApmyAAziZzttOAT8oAxlnnHxBWSLjiJKwjWrRh5eEbr78qWBf8UwNH86ULzm325RBeVGk/Ui2tCA8ih5yC2XYZvdQQAZi6CW1b9dUlsV/UV2MtM0RjL7BSFJdk3ZVdh1yMEW8Nf52n3Ijj7i+ThvfGeY9tZaHjV4rZD6Sxc+SuNVlJqfL95XuVgYP2KDXSSthJrMQRgp7U3kdFwXNESq74XmicIhiUPFBJV3JC4X69I7YLkixav1Dg9pPSLCqdx3Z0iJmkehdE1gVY3BPY3k1Z4BWxZR/zMqwMldx0rJNK0w7oABaoJLblc+8PAbC3cvig39XLC3r4fYXK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlgnY9/Z+9UrP8s6ngkle4v92QpAgRMGHmsrRWh0Lj4=;
 b=GfoJSHOWW1Af/xhHQzY1w71kxXkTkJlf3icteGyuDr4YERCcAok7FdPHppl7mPpBehGLT3JBia/lXfisfcRav2eZiTDdSQxdqTtN2Ir6ZbjdtFq6Ii9K9aAe4z1yd/3qODfbuxfbaswDq+EnLnDQSclXs5bPtTKOvoynaxfyrEZrpDy8a1RLzEK5gGGCVxkJkmMe3JAPbvuKj8IXXnw1g2TPD7UySgf0rkSnLXZKuKvHmzWTzNJPw6IVX4cOKOcG+TYTuU1M+mgLHIpJrI/7Zr26Vfk/uDpbvVIkpQT+e0bdLeBFRDiVnMBjNgJHwkrnvLOy40V40dlbGghRzAWNnw==
Received: from PU1PR04CA0006.apcprd04.prod.outlook.com (2603:1096:803:29::18)
 by SI2PR04MB4315.apcprd04.prod.outlook.com (2603:1096:4:fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 07:21:35 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:803:29:cafe::cf) by PU1PR04CA0006.outlook.office365.com
 (2603:1096:803:29::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 07:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Tue, 31 Oct 2023 07:21:34
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
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date:   Tue, 31 Oct 2023 15:21:21 +0800
Message-Id: <20231031072124.201181-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|SI2PR04MB4315:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cbea636c-9fea-4c1a-7fcb-08dbd9e20334
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtmV0o9RkWENOe2BPsNBvlmWkoTb9lNMLBIQk+ulNAl9JHlCIzLBqKeGJyaLYjar7cFfR6lPhA3cPXYQJpoMM4S3DMPjdbHnNujTZTSHNGDxLLki/Y1Gaf1aatGif1ou6DkTtoHXP699CbCF7KnkKZzGL7CXYfR5RoY07mgyFa8i6+vh7zLckL1lEKB7QL80rmrbkdNskrhaCnm9R0evpiHcJnIsFsfYFAyMfHeFVWi0TWX8o71O6n/vh3DMFR42r5GwF7gjRMx9eMJgCfy8H9bxgoTMuifqwjnRmDznGga5UP/aviT9WBFcueKjOnmSuhM5OnypUnCfZefD9j7HlHoxntgQZB4m9XCYkWGCqoMdubMsEfyjWmFUDH6xCthWAVED2scg8zeKeu9YCA7f2reua7IyTzw1NkiCuxgZNy9pDrI61e91eh5noZQCd/iwW8uMfB7bg+9/88Q8BJjLyiDqn7x/+2uwX72Vn7QnU0Blok76SxgRscg0Dd+GpXSHRoWarQ7zTAtQX25SaD5faE63Jy+PU8kvwknD1ksA93nvQ02eoT+na1NQUhG1NUIsQIV6fjPbqaAkzodJ+SW6DqK0IcCC9/Uu/r5hzbDMZFGuJunFa8DQpEK+T/N05/gEEls+5kHH16WqTNxB7ndMYhzfsWODMyPqPAMgn28cJVTCA6qlFRNgc0CS/6pSO7qZlrzFuxozno6dLJtTJXceuw==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(396003)(376002)(136003)(346002)(64100799003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(86362001)(2906002)(41300700001)(8676002)(8936002)(4326008)(7416002)(5660300002)(110136005)(478600001)(9316004)(36756003)(966005)(6486002)(6512007)(6506007)(40480700001)(47076005)(6666004)(1076003)(81166007)(36736006)(26005)(70206006)(336012)(70586007)(82740400003)(36860700001)(956004)(316002)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 07:21:34.0009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbea636c-9fea-4c1a-7fcb-08dbd9e20334
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4315
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a device tree bindings for ltc4286 device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
  v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
  v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
     - Add type for adi,vrange-select-25p6
     - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 52 +++++++++++++++++++
 MAINTAINERS                                   | 10 ++++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 000000000000..4695bca77c05
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,52 @@
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
+  adi,vrange-low-enable:
+    description:
+      This property is a bool parameter to represent the
+      voltage range is 25.6 volts or 102.4 volts for
+      this chip.
+      The default is 102.4 volts.
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
+            adi,vrange-low-enable;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 55d9d860f1a7..c60e29dc04ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12489,6 +12489,16 @@ S:	Maintained
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

