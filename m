Return-Path: <linux-i2c+bounces-392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0487F5625
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 02:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6278C1C20C3E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 01:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954DC4692;
	Thu, 23 Nov 2023 01:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="CtyGJufV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2075.outbound.protection.outlook.com [40.107.255.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87F01AB;
	Wed, 22 Nov 2023 17:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdxLFy6fvGslehE/iVrEoi1XWgtX4Qv2QOtIxTZ1xVGvz/SF5cT4zwshgkgOriM+f1pyzkjldOYE3o3+LEPS4txgvnK2Kh9v2E3EEfxe0OMZ6caEchvtyW/UmcaVPOZA4pEonPI25UzTa4YPwT7vyubJnmtWpmrLfBDp4wVvt3K0VoDWVAy9uTmRLfPHgTUpW+3M6/q0ZZ3j8wMk297HAxKplpBK/h6F9Dk0wkFEiCsPvd4GsSVPy6lG32Qo69R7pFfsHzE3rIHCpGGTf0DoVRcAAk+/B90G3UD3j/HR9Usr0zOyqX2yoSi5MtTxqwoUp3xEfGMexvLJJGH7QlVfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZix0rEbbh1WtDrMkthy/ANtdcZ7vmzbMchCQqM/tLs=;
 b=LOI4WYCG5vBjvm1q9Cx06rVh5ETOppytSo/bGzLM/E309mo5sbKQ4SJw40KQSkpOdtmw6mdOMA5CQn1TQdpIm8Kpsm84bapVMoCHQAE7vOLsFDCjgjqSJmWKBJ34RHrRAteyCDj6FJc9CM7Lcx90YY0zTo137LsycMlPln+4r5l3xVjZU4oLeHCNVH7vvKJGsDS/CIqRmHYqvQ1ECwFj9iBPFHqzGyaUSwcblUmCXMeVl8CtcObx7XXZn/AV3G+/aFGPCQwqOI1wM7g/O+EKFAQD+AJ0GFHWKS8UDC7/8MkU/HbNcpPJMKLET6c1rt6q8+QjRSOUZX+gcYj1LdriCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZix0rEbbh1WtDrMkthy/ANtdcZ7vmzbMchCQqM/tLs=;
 b=CtyGJufVNY5NXfP/Zo+m8/EmWK8u9CJ0aWAemwVmx2AIeBBv7BhVmcsIquqwgU/aoZj05aggnRNKf3mU41FPFmwXlbxIQzcUFvBcin/CfguWYH8SbeCdYOnQC9CdPP6mm4TjBTWFAxvHQt0h8BhBaP41TAU3cTfeJxRcMZ9nQVWWnUQmWHki35lZdx3Ll1dV5+n1uzS4iF4zCZNRTZG7uWyXA8A/PD+aA9uhgNAmFBN5O9qDz4Ki0CLmfgd1DFWVVOOQBPLw/WnVAncse9r3t0vJzPIncu0aG5EzpY42901USj/fPCo1v69Ko+7j3MtISTwQ96WLPAV2cbbxVlRNSA==
Received: from SG2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:3:17::15) by
 PUZPR04MB6536.apcprd04.prod.outlook.com (2603:1096:301:f3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Thu, 23 Nov 2023 01:54:50 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::74) by SG2PR02CA0003.outlook.office365.com
 (2603:1096:3:17::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 01:54:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023
 01:54:49 +0000
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
Subject: [PATCH v7 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date: Thu, 23 Nov 2023 09:54:36 +0800
Message-Id: <20231123015440.199822-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123015440.199822-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231123015440.199822-1-Delphine_CC_Chiu@Wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|PUZPR04MB6536:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2186950f-cab4-45bb-b9f7-08dbebc72dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HJMeHuKD464ywZG6rZr73Hj7206jasBnk4KPlcgw/Nd5hJfxtz4KbW4aAldLXsBAknwzGXfL4cydfMSsrsmXBl3F84z2ZWf6qhnWnO1Qavob/6drNFbBe5mOjLjKIpmaUH/eACQBH7yfzELjJ6pvBPYV7Itg77I4sCXCoDcyt1UQcRF4KEql0xFbFMk6DxrrF1GYcfdu+3DwrquVo/bHhXebOA5L9GL6QRo2kwiJ7tkTrSmjL/ryuTpMQotfxkADMCgQBOBGN8yFiowqFDt/WV7eBqpo+jfdPON3zFZIQuA/SHLO88cVGmE57fzuV1B/jQCwW/MH50CjukRH7trUrM/nSdjioHeVPFZoP7tOeiFLInmx7oTBUua2lF9WeZ87U0ROMtoheVDxmWES2WhBtz1nlaRjnCxeO/s3Qt8BAdFJPdJGftSixgV8xfhd+fotLat9bndbuHiOjl5pQWR3YDgPQidSaNXfVST3ubAHPAemIfi7DYSus1jk3e1I3cKQffm04Qcl3/+TRioMSRqzJ1WjCw3kt6nw+bfAS/bMG9Jjr2nTZR0mGz33kexUG780KLtzIsanJ8axAAo9Kh0dKz8xapmkUGe4C2MSrKFicSzPK9Gvn/TFrga/Ssl9mjJK3sbQYmfod3dHDj8/JLWkViOEAWZoCmXBHVfJ/zuR6078g8A0BmKS/2sUi7ve5sqRDYsqfxsK9BWynugo4nlb7g==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(356005)(6506007)(82740400003)(81166007)(26005)(6512007)(9316004)(47076005)(8676002)(54906003)(70586007)(36860700001)(110136005)(70206006)(4326008)(36736006)(316002)(40480700001)(1076003)(336012)(966005)(2616005)(956004)(478600001)(6486002)(83380400001)(6666004)(8936002)(7416002)(5660300002)(2906002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 01:54:49.1913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2186950f-cab4-45bb-b9f7-08dbebc72dba
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6536

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
index 0e79e24b6c96..33f005319c79 100644
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


