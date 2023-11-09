Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E2D7E61E5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 02:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjKIBuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 20:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbjKIBuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 20:50:12 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2073.outbound.protection.outlook.com [40.107.117.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773FA269E;
        Wed,  8 Nov 2023 17:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fve2InbtGOq9oSlu0G59eaIY8xpgCR4pIH+PoqVH31WjuW06YDruX0V8bqx5UHKkZ3jmPQsZl4MX13TWA8uqOdEj0w+vxd3HD9RpNm/eF1JkyARIE9mXjVIMuXOXxHa26xr5KiV6W+/CNPLxBpWToXv0CbdEjLkm2BYmDcWq9HiRFHHJUMaqPAG/mJGpX5skdDntlbGOeuQe2lc8N58Z1tZUCcYzU5rgzq76DErBrcm1ZXkIi5wUkcfzsMAOyHIHmcxCseywMM+o+vpOfJ8rp40+PYtHwKRL7h+zjU1e2Au8bVwSv5fQ56ob5d7A3YC5IgIAA7VcqCOTnnEZLvmsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xAJoqXTjp7anwVoo3/HbsH7rYkryE3zap6wVl4dunk=;
 b=PE/sq4MDdaTRnBmfokBGaVCJU33qvhDSm6EADNP1ZXSY1z1z2t/+997Ynf487vmC3w8LK2VcEvn8cycDltbmohZc9RJGgGmcQu/CUX/j4y8GnhLhGtA6KcfeYiemNt5MOvYd+SXjTIvACbwHtzFhRb+duMYqnmJbZYVGktN4ox1roPqc6rVkvsJXVvRkPNBI1DZqgq4AQeoz/oA3rghL7l2WhMVHr4YSNL1HkAco2UZ0TPrigWrkTxCI9LNauvyZIUZChp4t+m/2X9X3V1N0JydXsQmWu2Rkf8rKfJhimaz8gv6qUV/iZ7lTVTods6/AJlxBJSZYvUeykQ0M4FvChw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xAJoqXTjp7anwVoo3/HbsH7rYkryE3zap6wVl4dunk=;
 b=JARd55ThX0MlRJ3zElhhE47n4mQveG7AdXFK4V/DDKYNtYu9QOm5yHX2sSSZ3s5ROk0XcshuyqN7pdy+In+dnP/K+VNELSj3B5iOl102FmciDxxtl7PifFTFIupR7Kyj6axDtXEdVPSRtC5ca5vXiBFTvJEm8YLxi5K5kYG6P8afN/rTftYntpuE4JpwVc5FO2wCLaorfjj/n98M/ItNbPJofSQsI6p4QWK9w/bnBb46w1CRCX+dXLaMhRqkimDMhle5DAf1nk0fSkpin3lrkHyQwHCen7SY4SbbPIzEUTV5YagsLUTEiMn3FaQQBwv6aZ1deBAWX+wDleme5JaquQ==
Received: from PS2PR02CA0056.apcprd02.prod.outlook.com (2603:1096:300:5a::20)
 by KL1PR0401MB6586.apcprd04.prod.outlook.com (2603:1096:820:b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 01:50:05 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::c4) by PS2PR02CA0056.outlook.office365.com
 (2603:1096:300:5a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 01:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server id 15.20.6977.18 via Frontend Transport; Thu, 9 Nov 2023 01:50:04
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v4 2/2] hwmon: pmbus: Add ltc4286 driver
Date:   Thu,  9 Nov 2023 09:49:46 +0800
Message-Id: <20231109014948.2334465-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|KL1PR0401MB6586:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f45e3f51-0c5a-4515-f054-08dbe0c63195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0478kSZXyu6m6Bge5TEFTSsBFb3cOnSWooYHw1vno1+mIAPZykGleK/ET4OSAKvXAFw0N5WjDavWm6rhJ5Gbv55WD+z+pcr2rmtxHu5XJ7rDLGQCzIhHiHlCTyczwCrgD2sDDFfZUsMgeZW+NHpbmes/WLzX+j+HEIyj+AwRt7qfVUYD8lQlDctaoWdDhQpmMQGp+2zGUSh1OLtasZSHG0nEtFLUf6d1+B0qJSe/p/vtGlSc2y2GfpQOZHC6ydSwgqMhIwlTaxodZCPjcZkuGy0ImZ69tsLqVdE8Odv+q0/DPr5WkIfT3ZBoG5Ye+rPT9e+RFE0rR5dodgdDNcCh/PGGFizGB6e3yZCjTFLWx1c4fsUp5UmVJ6RUH222qO1w2je9JaVr52VZV4uqWw3cuU6/0vgDTyInzbsDJxGMoULXlc3X8/Hu1KoAoA0FrrsnF3MFBj3bAV6ayYb6NgmZrTZVpxmiY4UdCKGTwccRXcXs48DsbCiGxSQfJOcaPyKcI0fObnO4S9XysppGRVzVTV6N2wcbPGWojhAnjfR0xKBxh+OU0Yh2e15QOjAB87CiIUz3kYfZBC19YsM4a9wk9YR3+SoQYvpb8Dnglto49mOvpE5Ya2yUmdd1hUzctId7pY4sJAQy0q+ckElSJGi5A7zcXA2xSqpTnQ344FiZzqGD4W0b8+7mws874Zel+70wzAaxg7As093Y8gelHvJ9lQ==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(46966006)(36840700001)(36860700001)(9316004)(30864003)(2906002)(966005)(5660300002)(41300700001)(316002)(36736006)(478600001)(70206006)(36756003)(54906003)(110136005)(8936002)(8676002)(4326008)(70586007)(47076005)(40480700001)(7049001)(86362001)(7416002)(1076003)(6486002)(356005)(81166007)(83380400001)(66574015)(336012)(82740400003)(6506007)(2616005)(956004)(6666004)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:50:04.0457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f45e3f51-0c5a-4515-f054-08dbe0c63195
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6586
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
  v4 - Add empty line before "config SENSORS_LTC4286" in Kconfig
     - Add ltc4286 to Documentation/hwmon/index.rst
     - Revise comment typo
     - Use devm_kmemdup instead of memcpy
     - Check MBR value before writting into
  v3 - Use dev_err_probe() instead of dev_err()
     - The VRANGE_SELECT bit only be written if it actually changed
     - Avoid the info pointer being overwritten
     - Check the MBR value range to avoid overflow
     - Revise ltc4286.rst to corrcet description
  v2 - Revise Linear Technologies LTC4286 to
       Analog Devices LTC4286 in Kconfig
     - Add more description for this driver in Kconfig
     - Add some comments for MBR setting in ltc4286.c
     - Add ltc4286.rst
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/ltc4286.rst |  95 +++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |  10 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ltc4286.c   | 177 ++++++++++++++++++++++++++++++++
 5 files changed, 284 insertions(+)
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 72f4e6065bae..080827cc4c34 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -128,6 +128,7 @@ Hardware Monitoring Kernel Drivers
    ltc4245
    ltc4260
    ltc4261
+   ltc4286
    max127
    max15301
    max16064
diff --git a/Documentation/hwmon/ltc4286.rst b/Documentation/hwmon/ltc4286.rst
new file mode 100644
index 000000000000..2cd149676d86
--- /dev/null
+++ b/Documentation/hwmon/ltc4286.rst
@@ -0,0 +1,95 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver ltc4286
+=====================
+
+Supported chips:
+
+  * Analog Devices LTC4286
+
+    Prefix: 'ltc4286'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4286.pdf
+
+  * Analog Devices LTC4287
+
+    Prefix: 'ltc4287'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4287.pdf
+
+Author: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for Analog Devices LTC4286
+and LTC4287 Hot-Swap Controller and Digital Power Monitors.
+
+LTC4286 and LTC4287 are hot-swap controllers that allow a circuit board
+to be removed from or inserted into a live backplane. They also feature
+current and voltage readback via an integrated 12 bit analog-to-digital
+converter (ADC), accessed using a PMBus interface.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+The shunt value in micro-ohms can be set via device tree at compile-time. Please
+refer to the Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml for bindings
+if the device tree is used.
+
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data. Please see
+Documentation/hwmon/pmbus.rst for details.
+
+
+Sysfs entries
+-------------
+
+The following attributes are supported. Limits are read-write, history reset
+attributes are write-only, all other attributes are read-only.
+
+======================= =======================================================
+in1_label		"vin"
+in1_input		Measured voltage.
+in1_alarm		Input voltage alarm.
+in1_min 		Minimum input voltage.
+in1_max 		Maximum input voltage.
+
+in2_label		"vout1"
+in2_input		Measured voltage.
+in2_alarm		Output voltage alarm.
+in2_min 		Minimum output voltage.
+in2_max 		Maximum output voltage.
+
+curr1_label		"iout1"
+curr1_input		Measured current.
+curr1_alarm		Output current alarm.
+curr1_max		Maximum current.
+
+power1_label		"pin"
+power1_input		Input power.
+power1_alarm		Input power alarm.
+power1_max		Maximum poewr.
+
+temp1_input		Chip temperature.
+temp1_min		Minimum chip temperature.
+temp1_max		Maximum chip temperature.
+temp1_crit		Critical chip temperature.
+temp1_alarm		Chip temperature alarm.
+======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index b4e93bd5835e..2d4f972e5a65 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -227,6 +227,16 @@ config SENSORS_LTC3815
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc3815.
 
+config SENSORS_LTC4286
+	bool "Analog Devices LTC4286"
+	help
+	  LTC4286 is an integrated solution for hot swap applications that
+	  allows a board to be safely inserted and removed from a live
+	  backplane.
+	  This chip could be used to monitor voltage, current, ...etc.
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices LTC4286.
+
 config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 84ee960a6c2d..94e28f6d6a61 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
+obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
 obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
 obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
new file mode 100644
index 000000000000..e6690b38349a
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+/* LTC4286 register */
+#define LTC4286_MFR_CONFIG1	0xF2
+
+/* LTC4286 configuration */
+#define VRANGE_SELECT_BIT	BIT(1)
+
+#define LTC4286_MFR_ID_SIZE	3
+#define VRANGE_25P6		0
+
+/*
+ * Initialize the MBR as default settings which is referred to LTC4286 datasheet
+ * (March 22, 2022 version) table 3 page 16
+ */
+static struct pmbus_driver_info ltc4286_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 32,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 1,
+	.m[PSC_VOLTAGE_OUT] = 32,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 1,
+	.m[PSC_CURRENT_OUT] = 1024,
+	.b[PSC_CURRENT_OUT] = 0,
+	/*
+	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
+	 * However, the rsense value that user input is micro ohm.
+	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
+	 */
+	.R[PSC_CURRENT_OUT] = 3 - 6,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	/*
+	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
+	 * However, the rsense value that user input is micro ohm.
+	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
+	 */
+	.R[PSC_POWER] = 4 - 6,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 273,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", 0 },
+						   { "ltc4287", 1 },
+						   {} };
+MODULE_DEVICE_TABLE(i2c, ltc4286_id);
+
+static int ltc4286_probe(struct i2c_client *client)
+{
+	int ret;
+	int temp_setting;
+	const struct i2c_device_id *mid;
+	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	struct pmbus_driver_info *info;
+	u32 rsense;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+	if (ret < 0) {
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read manufacturer id\n");
+	}
+
+	/*
+	 * Refer to ltc4286 datasheet page 20
+	 * the manufacturer id is LTC
+	 */
+	if (ret != LTC4286_MFR_ID_SIZE ||
+	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
+		return dev_err_probe(&client->dev, ret,
+				     "Manufacturer id mismatch\n");
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	if (ret < 0) {
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read manufacturer model\n");
+	}
+
+	for (mid = ltc4286_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0])
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device\n");
+
+	ret = of_property_read_u32(client->dev.of_node,
+				   "shunt-resistor-micro-ohms", &rsense);
+	if (ret < 0)
+		return ret;
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	if (rsense > INT_MAX)
+		return -ERANGE;
+
+	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Default of VRANGE_SELECT = 1, 102.4V */
+	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
+		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+		if (ret < 0)
+			return dev_err_probe(
+				&client->dev, ret,
+				"Failed to read manufacturer configuration one\n");
+
+		ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
+		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
+						ret);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					     "Failed to set vrange\n");
+
+		info->m[PSC_VOLTAGE_IN] = 128;
+		info->m[PSC_VOLTAGE_OUT] = 128;
+
+		temp_setting = 4 * rsense;
+		if (temp_setting > INT_MAX)
+			return dev_err_probe(&client->dev, -ERANGE,
+					     "Power coefficient overflow\n");
+		info->m[PSC_POWER] = temp_setting;
+	} else {
+		info->m[PSC_POWER] = rsense;
+	}
+
+	temp_setting = 1024 * rsense;
+	if (temp_setting > INT_MAX)
+		return dev_err_probe(&client->dev, -ERANGE,
+				     "Current coefficient overflow\n");
+	info->m[PSC_CURRENT_OUT] = temp_setting;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id ltc4286_of_match[] = {
+	{ .compatible = "lltc,ltc4286" },
+	{ .compatible = "lltc,ltc4287" },
+	{}
+};
+
+static struct i2c_driver ltc4286_driver = {
+	.driver = {
+		.name = "ltc4286",
+		.of_match_table = ltc4286_of_match,
+	},
+	.probe = ltc4286_probe,
+	.id_table = ltc4286_id,
+};
+
+module_i2c_driver(ltc4286_driver);
+
+MODULE_AUTHOR("Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>");
+MODULE_DESCRIPTION("PMBUS driver for LTC4286 and compatibles");
+MODULE_LICENSE("GPL");
-- 
2.25.1

