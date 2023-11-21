Return-Path: <linux-i2c+bounces-363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC37F250B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 06:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D18F282993
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 05:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF661862A;
	Tue, 21 Nov 2023 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="zRxxyE5K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2041.outbound.protection.outlook.com [40.107.117.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D0FED;
	Mon, 20 Nov 2023 21:08:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5McJ5AGg8XjUr0wGg0bvJmuUyyolZ/ZrD9r84W/rV9e6sve+QvhgJO/iOOgIRjXPrtgIR0ZNJxBDj77guJsM5W94PTTDl9CKEj3BDvbaTbJ5lp+KZ/nC1rRAwaYsRpUOEjcVY5um7aqz/0430fJ4yzKGfXh8FhlkIjcPA9JbOyrTkjSX1R6k/ZnGJaH+RIbXaq5y0kUA+EyGRevs6/QKXUtn9SIIsmtFyxijs5oMkD9zPdcgJN1WEJnEhAj650v/Q/KGvL77c4OYWk52DAjLA5KITACkaXDXgwohO04ByuEaGnVS7OMqo653dDgbjdcMi8WeHRZv1q+Vg38++e5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+TeCMPvkU3QeH8uAyQV45LiZ/CtD8orB9kT85tTKoI=;
 b=OgQQVz4VpkyPInyVJEVZwvCygjomDD3otGOXs0sPdNdLUkgeV8QlxPi5CnUA3jIZ+ZRRDTeqgut7hQNs+9+rqxBKCowZnMtzmK32Vo6cRP9PgmUZJSVI4MIEHYUVhYpc75HgUiSUuv0lUl7cLx/9nz4V2u89v00VDcSDp4aIXystttQ4sUm2QXJmWCBjqGJyca881qErusRJECNYk/VKXG2vPtcHv3i5hAjagaCwAVAO8TF4zEZUFA6dFvKP/hhNnfu5WD+2RaBzWKcScRHInHfRUiZ7t2hXCxmu3WQPNHxvnuMOOOPstUzgq6wDql9J50Jsr63sjqI+S1aJfPHvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+TeCMPvkU3QeH8uAyQV45LiZ/CtD8orB9kT85tTKoI=;
 b=zRxxyE5KEq0QrsUTTd9I8200oj6kZ3XqlpcNFsIxeACpFgpq7qfcEL76YpsPzrfRCf21BQ3kTTNFXbTJEy4adzRaclqJlXPAuXjN5TdctX/T2HAU+mqyuCIPJ8nPxojv/AWTjCOMCZv+2PhyprTVQox+lh/5hkbjWXxdmguXxep3FMpNBCsvUv09CyZZy8JEyzQVPO+4tGMCawFWXm0AAsabQ6FQSHEh2pJGKNy+uiRZ0m1afLnjeJn2lFrWOObO+0pBUJoNQBGUJEjrUSaMYPV9ynEIGnOAeJqIaIHSOGCtpELQvNdpXGD1JxI2roiqhWaBNebkQZYm0Rh8tkmyQQ==
Received: from SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) by SI2PR04MB6147.apcprd04.prod.outlook.com
 (2603:1096:4:1f8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 05:08:07 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:40:cafe::44) by SG2PR01CA0126.outlook.office365.com
 (2603:1096:4:40::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 05:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server id 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023
 05:08:06 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date: Tue, 21 Nov 2023 13:07:54 +0800
Message-Id: <20231121050757.2108786-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121050757.2108786-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231121050757.2108786-1-Delphine_CC_Chiu@Wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SI2PR04MB6147:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6860b7a-f5eb-49ce-81b2-08dbea4fd9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ue+u8//FGMb7MVjL1zvC1WyDfjotv0YW1IcjGjvSqE0mHK9h542xVt0xn0dYuIoByU8RZDxP4+WlzlLEel41xJkyv5cILrOWXZXprYfbYA7FVGJFr7gM9z8kBL2E9Y3L4ViaQuHtAiIIdS+SzYwuAcRGkciWTbzkwJG8XDtw14n/UhBdBlD96E1uvwy0TazTtV5ksBhIYfvnZk86H1mD0oWINTUMu1lqA0V+lXCx7FmAvQVMF5zRhD7pew65OWvAXd50/jL3dtrhksK79rc81M5mPxWDd9L/b/21eRfUWXUGGntT62LgtZH6VOfLs9/x6OPsUM2ll+NrXn1ZZAYtqGslrCybaQbUPHVmzdXbQb9BdLH0jtVsnlQUsV/Hz8o7lG9sE5xOVs3K6WHainQoulTqLdFLTJdlH9Lt/AeyN+HXHQ9RDnOaSr//c/gDbxCnlijggFLf0NYu8DYlNirQbyO6gE8trti8FzCPFrmS8R/YZptcRzYFVDRIdVchudjGcWGPQYC+12Gly6wZJPy09axw6DU/jC3EngrxT4UnhFeLaLX8jUoJ+AAIZLJi+sfI5XSGaMGJR/CfA9PGF27TFoVPhA8x9Yt1R4lx2Wf8GKsaikWLiGdtrpgaB4hfkOFcTJr+oN9sWe/rcjjm7R1WRgV/D3nJ2A5qXZTgZGi/T4hlMfDO/97+GfCFBIbrO0mEtA8GZsmjeO9xTT/fwgWpKZ2VOfxCxmDdaqPD25tRj7I=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(36840700001)(7416002)(5660300002)(2906002)(6666004)(86362001)(6506007)(9316004)(478600001)(2616005)(956004)(1076003)(26005)(6512007)(316002)(54906003)(36736006)(8676002)(4326008)(8936002)(36756003)(70206006)(70586007)(6486002)(966005)(110136005)(36860700001)(47076005)(336012)(82740400003)(83380400001)(356005)(81166007)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:08:06.9186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6860b7a-f5eb-49ce-81b2-08dbea4fd9b9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB6147

Add a device tree bindings for ltc4286 device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog:
  v6 - Add "---" under "Changelog" in commit message
     - Remove "shunt-resistor-micro-ohms" from required
  v5 - Add hyphen under "Changelog" in commit message
  v4 - Revise some inappropriate writing in yaml file
  v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
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
index 000000000000..98ca163d3486
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
+  adi,vrange-low-enable:
+    description:
+      This property is a bool parameter to represent the
+      voltage range is 25.6 volts or 102.4 volts for this chip.
+      The default is 102.4 volts.
+    type: boolean
+
+  shunt-resistor-micro-ohms:
+    description:
+      Resistor value micro-ohms.
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
+        power-monitor@40 {
+            compatible = "lltc,ltc4286";
+            reg = <0x40>;
+            adi,vrange-low-enable;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..ff961f397e3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12628,6 +12628,16 @@ S:	Maintained
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


