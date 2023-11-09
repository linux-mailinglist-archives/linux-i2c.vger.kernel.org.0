Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806BF7E61E0
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 02:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjKIBuG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 20:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbjKIBuF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 20:50:05 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2085.outbound.protection.outlook.com [40.107.117.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39611268F;
        Wed,  8 Nov 2023 17:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGewGCdJt35VaM96oH0WMfsY6BOjx187lap3G2GhjyaeM3/SiQFcDJFY67MOavO/bfLAVXDpTtmAeW08wMZU0Daj2cY/hiPkczrASA4IbLNDnwrvKdUU6IPMf4hAUg3z5qOI67IUyhLacCuTBV8PC2n7pHGpK7hQc3AlaKJ3tFAfq6qRxy//DOpM0Bo7dUUMwsGwj9I0zqSVt2a/7T4Qy1Yik22WTKjTaGc82uejMuxm+uRVsFOA8dtWeTCko85BDiSNmqUFlRSUujK/UHh5PTaw6yYaPZ8JPiXq/qy0ytsp6VzKzdE03afGWyOUb7r2CcLDzAhwxDxsSwoW1JidxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qsFm8Ma58T4PAuj06pU98qcDYMYEsDOHtN1vT7m8rA=;
 b=ZH3qGnv6ecOCkTy4L54cB4Zi5HMYgPizhz/ajRjKOHB9Thvj9DSXx8FOcD6HGlXCQZGuflY3u6zu1X47LU7DeId0t1veApYqi4AdjYtV+d3Zg4vkC0snWsd5vA53kO0oQQy2szWcY9b1B7wtdp66nSgsCIhZ2X+NZfOnOFIfhKYgegb77p0b6Gf9uNNBnff2p4G/P/ujjDCR7lr1gSW3awR8xMU1Ndk6HEHckK5zt8GHmj3i3gCE+BcGVGm8RFPCiMNw8YKq2sD4S6lEgoVVHqqthItQM/pLOLZQ5FyLRyD5XHAX+C9sUM1/U8ePP5qqlMIkSw9ZVdx3AhWv0LPXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qsFm8Ma58T4PAuj06pU98qcDYMYEsDOHtN1vT7m8rA=;
 b=y8wK+HgxlfmpSxVVMuZMk+zqYwwKv213PPrkbfh+A5tyBw6ed4nhb2hNDPdX7eYqNQiED0C8ZfOm87JYVWkmoN7YivLcZh+Zu4QHaqk1/Wd33XOA/N5C3ilcVznG97cXk4VLV647PcmD0bcrfs9pGmcIV53HcMaReyAwb13bsYOeKnjKfmII3fCi5ScY6dVTB1BYykc9at9hQS1gLlmK1qRR4YZsdb1gqQPIe6ym8zAXe0gNOJpSD8lATxO/7MFmjIK7yglsEmNAtEm/mt/eXji00JnMNAYE+WNz33vu3pOes5FOS3Ed6oEFxrr8dm3ky0atwPls4hPAVcIqayBDyg==
Received: from PS2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:300:5a::13)
 by SI2PR04MB4281.apcprd04.prod.outlook.com (2603:1096:4:f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Thu, 9 Nov 2023 01:49:58 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::d4) by PS2PR02CA0049.outlook.office365.com
 (2603:1096:300:5a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 01:49:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server id 15.20.6977.18 via Frontend Transport; Thu, 9 Nov 2023 01:49:57
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
Subject: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date:   Thu,  9 Nov 2023 09:49:45 +0800
Message-Id: <20231109014948.2334465-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|SI2PR04MB4281:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dc2ec606-58b5-4bb4-9399-08dbe0c62d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2xdvyAjOE9vzG9bT7PTi9fZ2QzUGucNRkcdkFu0G7tqBUYfC8br4lz+07e8zhL8CgAxs2cxa/oep60CIf0404Q0gsNh+XRH12AMWzlVhdsvvS8yz8OteCuvwkN2yvqPjr2jGdy0pjtMU3ncoU8lsrVUO6DgmSHc/mqGDI5Pi8RvGnwB7Ez/CyBqo2r+vAQxhnoxxTkomoyEdPQ1/tS29IcUKL/dZi6ay/TaMVn5YZ0HwlU6bBhGXKaN7CLE7sldMIH7GMD/WzfKa2/jKPCL2wq/JmJLEBVKvtNmWZho75toBoK8l/BfBlo3utG4O04tU/2tzB0LxM0rLya6PI+cEwFEiBBenbNYaREizLUvj5HxfOl7JpxHxCGVac68iDNGGjBb5mBkc/gxUButZFrMBptJz6Ci+cKAu/b4FfhFWW8bHJ+S0N/aMkzHigwOL2uGSFOdnmOud3khmHe7BZcc3dl0d7CHMasdb4k57zY90WXkOdT2gAazqX1zUfjgEDpz2bbYje2UhMb5rJaSsHwqfU+VD0FGqhCPWhwa9A4bxVk/rVZbz0csXsMrRKdQ/AKbDFrA/7qXX4IDgL9QJZ9AqCoQddfVJf9EdPFKQ6fIwrWK1GguW9iio39su/dy8Rr5cvloDz243UCscYB8ZYqAIBVOFtGLNIzfJNn1vbuIptiWUnYSUtuJYruh4BlYDZ32cF8igXSGzjPBiEfr0HjIiimEY9F1JfVVPYjiB6CDFLg=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(36756003)(86362001)(9316004)(5660300002)(6512007)(40480700001)(8936002)(41300700001)(6666004)(2616005)(956004)(4326008)(6506007)(47076005)(26005)(2906002)(336012)(1076003)(316002)(70586007)(966005)(36736006)(70206006)(110136005)(7416002)(478600001)(8676002)(6486002)(82740400003)(356005)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:49:57.2800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2ec606-58b5-4bb4-9399-08dbe0c62d8d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4281
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a device tree bindings for ltc4286 device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
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
index 0b275b8d6bd2..5d439cd64ecb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12609,6 +12609,16 @@ S:	Maintained
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

