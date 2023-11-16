Return-Path: <linux-i2c+bounces-187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B727ED98B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 03:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69783281031
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 02:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2350E53A4;
	Thu, 16 Nov 2023 02:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="NX/d8CaX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061.outbound.protection.outlook.com [40.107.255.61])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A829C1A4;
	Wed, 15 Nov 2023 18:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icsooh8LOZGRg0wVmXGaPqT071CgDF+kj8s52ysRFHh3+vqok4lqRqoivT+Lb2bXYV8eR5dHHZvkuRg6zFb6j1/r/H0GgQa9q5tyn+WQOxO81vJothe+XBqwqMkFzwphyPJwaQxiVND4DPVhwgpbL8LWXE1onHwECRhy4BXQeJVPtdd3uAIZmUfwm4RubWBvVWSEjYBddeRt485wOauHaqRJ6I4S4sQG9ln81TgKxiwzImn/Fnrgi1lkL2rReyPafme8NuhpxNevVdyBACjLp2wJTXp5FsJd5Shz6jXALrlhgOjtWky1urHvWxAUPC44g/sfi1RSm14hf3ZPVqa8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6Vq4M9C7BMFlXUt1UWR1Nw+gi2crz8Y/9uyASo5CQU=;
 b=dJxMZJEcylUiRGd6OEHgxZ9BC/MO5TuVMmgzK+uF6PK2pPpXfGHqzH/P7cUKr/R3noIGwaVsARdUi8ZZtS3KR4azVkW2C2kqeNzsEWbkd5RPnus541ZMPkoVdO4H9fvmrBgWK61z1etac6fy6JRPLnOydsC4cJwB/68UOdC9JsgmJJS7sV077mNCexvATKwJ4f6J8MTV2F7aDgBRsGP1BJMgdF6k24eNLkbb1ix+eaQ+Tzhqv/tpwtnHkCCUa5bQAmIhcncgvAAbA6JIacSUOAuAX3xKfTRoV9VZS+0gRnxdTY1ySou4FGFQeWsF0hSzYOLjaZ2jTdreXnqTAg32lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6Vq4M9C7BMFlXUt1UWR1Nw+gi2crz8Y/9uyASo5CQU=;
 b=NX/d8CaXNu8OP3lc+tPj7Awlnz/jmGtF1QPxWycYCOXVpiBxvbTq721rZjyrTi492l9Vx5kq5a1NAwYY24Gn931bYR16Ah5eA2cm9eoAa9aT0vGiM3mz0UhPgAuQjyvt/99aZWKJ5yQzJ/5LKASJgqltWDFhbRAf9jXQG0UrHw3xxS9kjPOeThcxVZs/OBka2MhKVMFqW5hnH7hgkJtzO7vKpN7dtxZHhEXtPc61LJI1ZpmoBcNsLASw2xEPXB5oBmQJzMBhntUxsjJ93kKjhUwZjYvXjNyyXuLPCT2YbcFxru/gWsws/dOp3fSq0j4LzHJHZLAe+HVzblp4hLeU2g==
Received: from PS2PR02CA0071.apcprd02.prod.outlook.com (2603:1096:300:5a::35)
 by SEZPR04MB6337.apcprd04.prod.outlook.com (2603:1096:101:cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 02:30:38 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:5a:cafe::e1) by PS2PR02CA0071.outlook.office365.com
 (2603:1096:300:5a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20 via Frontend
 Transport; Thu, 16 Nov 2023 02:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 02:30:37
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date: Thu, 16 Nov 2023 10:30:24 +0800
Message-Id: <20231116023027.24855-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEZPR04MB6337:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cbcc18bc-54bc-42df-9801-08dbe64c04c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vdEfpcudzowRT6aEkMi/8WzLXcHIVOxCC0DjxvVWlJx2S3/sVoOl7KTrQXnF611eIE1Ij2d6pDlGoI/7eI8cwf6ltkfvC6uS0lWYBpyt6S39s3vYXmrkCzAW1Uksx/dsLr9hLhmAhY9QbHMtcv2uGmGj5k15mZ6l/UyynzRJO2oYikmuC7AMj/16ocjqWNwMvx1bkYrqdlJRbiyRrs4mAAlPPzJ8fW2m4yQWXjV2cASA6ZFHCrp08oeXGjGKE6OXcP3rLz5bK1RUceJMziEfdz0Mt1qD2UMAYuDmREXb2g8kE81LLiNIlHewmGqJ98vsOvTcLd9j5khofkKOO8UoM+EpRkTbLNmc8d5LH0f/LLLEje4C9SS3aOpDDsqvUG2uSmqIzQb7Bcemuo1DUP+AQ8SyqzNmB+YxTh69glY88XaQFkEZdrq6nGd3tIuoH6zHyVkvZZuMEVL1TcTHXKzY6oJ8gj88DaEprBz2IH6Qbw5v2iswHsQsupg0XARhLSS7lB8vM3BUGFbX6a4KVan9RjZDEON3M9Q5FMJ/3wzexG26xadBqiWKpbKJlZjnq2nv9bNzHOHBLKbNiqHavMNynnazJy+JuxLg6rN1304D6PfMHOahMZKG0XAVzAhQd5+nEHeq+lUxk7LMGMUvXx81CRGB8eeiyEVq7b6W3RwMsX87REbTRVwvrDCUAu/q8v0acLVle4jhwVxex1HhFjZdDhoo6x54aPRo8YwTJkMzmm4=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(46966006)(956004)(1076003)(2616005)(336012)(110136005)(83380400001)(26005)(82740400003)(478600001)(9316004)(6666004)(6512007)(6506007)(966005)(86362001)(6486002)(5660300002)(36860700001)(7416002)(8676002)(8936002)(47076005)(4326008)(2906002)(41300700001)(316002)(356005)(36756003)(40480700001)(81166007)(70586007)(70206006)(36736006);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 02:30:37.2296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcc18bc-54bc-42df-9801-08dbe64c04c4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6337

Add a device tree bindings for ltc4286 device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

-------------------------------------------------------------
Changelog:
  v5 - Add hyphen under "Changelog" in commit message
  v4 - Revise some inappropriate writing in yaml file
  v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
  v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
     - Add type for adi,vrange-select-25p6
     - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 51 +++++++++++++++++++
 MAINTAINERS                                   | 10 ++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 000000000000..d26f34fb7ea7
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,51 @@
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
+        power-monitor@40 {
+            compatible = "lltc,ltc4286";
+            reg = <0x40>;
+            adi,vrange-low-enable;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c9f868e13b6..2a73a7c0f160 100644
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


