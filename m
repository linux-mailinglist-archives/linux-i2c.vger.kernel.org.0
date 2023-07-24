Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6AA875F265
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjGXKNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbjGXKNB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:13:01 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::60d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D9A3A8F;
        Mon, 24 Jul 2023 03:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hz7y73/m3q2GuqjLomgOA07CwykmOTe35BLY/X13CDa1bc06q/VHDdNzNDBUp0rxoxQUEDDatWkbYijYUtYDcOzhymzzsgy5S/1RRVW5hjjLMafJM4MIhaitF7dnn8lFLqD7Pe2TOZ9oBFc6h2Zfqhh4iqyJJkrrAFH+MC2umnt4jk0DIt1QkwFLNJY1dz6IHRjABvdxePgsX9qL4ps1RF5FHlqBDyihBAxlzXp/T1825RNoAcuu1Fsq3uCZFmHpxhU4UoJDJRa0VrpqFDlwvTiIrhjXiSM37qN7Gir33mI5uZ91q6Rxt/GprimBtIOVEtZ0Pc/EMFcewOb++VyMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgtaTGJTGGDEWVPGuXCbtqSZt939gq+qKbfx+/9idvY=;
 b=hT5cGuykYf+etY8Iz54jn7hklM0t/0+cdLqT3uM0Cn1UkkzYOmazeAPz+JZGRqC+rzj/StJTyKBslLnOgtIN18rAiobLRslfHQ6aeLy96P2TA1PONk5MscXOzS+HSE7GrhUQN7Qn/NXrfUEvdaF8udwdQhyupwaKAP5CGOls4z6eSyZLm9ds16RLeGya7VrPc3n+VrFugW4JEWBY/G4DY/s5lP8d1BOXIr3YCIefcRyiInIJrz89TZybbXCFjNxPzmxmog1sc/M2QJ2PrITiOncUY0vKqVKiOVC4z2ATpGJjOLw7goy1n8dPfhfm03wby1TquKiLxuFRZSptC57UbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgtaTGJTGGDEWVPGuXCbtqSZt939gq+qKbfx+/9idvY=;
 b=iROe70+Y3yeFrWPxoh/Ksy8fxVVLc1TaU+lLmgejK8FgBDqBoqL/5Kxer4Nt18gG3vthU5d304MPXr3AzIhBsZqkFCeXXX6xxIIHjU+rIZ/MTlnFOpo7p806Z84U3KCV/ZuoLyNCaWs70WwcFiNUBJt89yoGVzIbAXxbmgKxul992wGot+oIdJ7UOGgQBMaLCfBY3vOgr8GuEvBmet9dU2d7oanqEIP3jaYQJ+b/ukJDI+86ZAfZyLqYldDx6i6TXLF2cZ+cRroYIzZgfpuwLOcQgbaDhxdu4L+XDw2M/nxKEXMufIMjCjTGpztFH/gl0inHrRzVlaNLv1EpDDV2wg==
Received: from PU1PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::22) by PUZPR04MB6650.apcprd04.prod.outlook.com
 (2603:1096:301:11c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 10:05:19 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::16) by PU1PR01CA0010.outlook.office365.com
 (2603:1096:803:15::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32 via Frontend
 Transport; Mon, 24 Jul 2023 10:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.6631.22 via Frontend Transport; Mon, 24 Jul 2023 10:05:18
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date:   Mon, 24 Jul 2023 18:05:11 +0800
Message-Id: <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|PUZPR04MB6650:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e83d5d8b-ffc1-4fb0-ca9c-08db8c2d7c50
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGTlxN18OufeHpvaeBpd4ktS7BXavgdvjk5oNv1hmiDP0yt/X7q6goLCi83wBfgbko+LEpmATP0PagYZ9PAuyNcCRtpIxKZ4vvw0s7Ou9XomN9HzUzrGiPGZor8VJlIXzu6l/XQD2mahuY48wmFB/f3m4HWlMBpa5hvtRe1PHccCm4Cbzht/llSuLnogb6NqEp6LIF1PuhVj5Xnyr+eyHuSLosJVM8TJKPSCiASM1cy7eCwySOeGatfgxBviQ1fsXLkeZwRa10vBmacz+K4L5THuYZh4eJKGbGrB4GZhJZkKrWyQ4otOK/oqWXkzztI2XEADMnWkoMyeSP24gKq9wlsUPTsHQ3tXa8Nh9R8hluX+uxLn0dFGqOsA306Jfi0vrEI168vhv9LJNt8AOYSc5o757BkXmw/iPKb0rD181ioC1rZACHOs7cl3pAvYb2t8zxGjd8fL51vJBRIYO4CZjzaXLUGXtGro76uYm8RTUOu8VQRlNdGYfApbpP4LCK+/a2iYzoEjXA1BzYyIy2iDCNIAeilEGU82fpYRy/6M+X+yVIVfft3+aW2h3wM4PATdtsfNaYCPNZaRnkM7YB2+OYOXZ3Lu1gFKe4rZYNtyqncQspU4/pEi+xSkKjP/zxJdt1MwD1HWUACWhYNfWZrwOcM8ncMQoiaHeYkpPlPF9eosIUCpiQAnHUs3InbEjINkQLMqNO+7SCdEg9hwWUXemg==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(82310400008)(46966006)(36840700001)(2906002)(40480700001)(478600001)(8676002)(966005)(6512007)(81166007)(356005)(47076005)(82740400003)(186003)(6506007)(336012)(26005)(956004)(2616005)(1076003)(36860700001)(86362001)(8936002)(5660300002)(9316004)(7416002)(36756003)(6666004)(6486002)(70586007)(70206006)(316002)(36736006)(110136005)(41300700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:05:18.7487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e83d5d8b-ffc1-4fb0-ca9c-08db8c2d7c50
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6650
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a device tree bindings for ltc4286 driver.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 49 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 000000000000..ad7f6ad888e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,49 @@
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
+            vrange_select_25p6;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d516295978a4..7c1cb9bd4f45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12344,6 +12344,15 @@ S:	Maintained
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
2.25.1

