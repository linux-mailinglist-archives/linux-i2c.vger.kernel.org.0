Return-Path: <linux-i2c+bounces-393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067F7F5628
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 02:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB18028174A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 01:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82931FC6;
	Thu, 23 Nov 2023 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="irgZQpRQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2069.outbound.protection.outlook.com [40.107.255.69])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58252D56;
	Wed, 22 Nov 2023 17:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9X5YbkkLCjjp1X00G9FJqt9cGa1Tcjf90EUo8+cNPQLtDHtVHHsO31BQPnx+EkC/C4s8URh+YgGOaQHvH9vjZoyNENHR3f9gsKhEfYvM8N+ArVtijmKtp2knwvGBO6j0qGyRfJ2+vU3VOQPTwD0kppQa7tT+of/zLDQWpCNUMgsluohvug3JoAEdPAxqsc5hYuTKa6KYhV0tQ8z1lxob/TtjWPasm73Ag38P0IYGLMfgyTRKo6bOTuPBJYEf75ZlhOSeYTqp7Tq4yhBPjak1x9u6wdakImiC5AWWbPrOiclGt+M9bFv75wYtUAMAb4kh5LGrHpgbNgN/vwto0fGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gtp+egWvpC3LFbem15ChKiN9/KynGDIQMpOC1tKE6JI=;
 b=ZKv4nZ5ZcKFE5iNeYDV+c39dLjHbsS60sUs16a67ZwGR/hc/qleZ7v/7iraRQlJh6vQoqaGVpscsUC4gUjoPxQ9e/kNuvz0SH66dXuQ5V8uBYNcfmLmAQJsei2yqPol4mNRg2SD/rxosr7yNKxubM+kvCsBpyNWwpN/5EQ0diaTDH/SeznxVqOMjaO4yr7eYs0VkdxGmgj/zOnWT0jvEfT4OVJZFvdGXBno1EpElWr9o+jEs/9xXW1tG/XDlUtI9A8jYJ3WTcpB4E+ecqkDbAJ1YRpnUAdXhiVYllX0yjSfkijKxEPb/sdS3GUHotLNvNkNe+Gva572t2Ur00zNHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gtp+egWvpC3LFbem15ChKiN9/KynGDIQMpOC1tKE6JI=;
 b=irgZQpRQM57lpr9sov+LrCqzsV7qBq98Kjo7Q9YVacY1zz681cnJUMAkK7AVXJJyO/JQC2QlRQHbt/jxUmcaVdg22AItoq3xPN2j8N2UgLJi+tss9YHmY3TWo/pVgsxrxPkvcE9ecVkYa5zcwkAtWchOY8JhB0gJXIq63s5tC/i/BMeOrHcfByy+5kSnYa4QO7fG35tfdr7wqx8dZnsy44BlGG9UjAPefQhRrR5mDUs4dKL2wceUBh5ZRkc6KFzwV7NVcFLpK6w0NQHtUPNT9RPWaOAxnjX6Swkgw2PuY3S8idyzW+s2TLYtTDv8ABT7XDgaocYsXlnHxiLLFqNoyg==
Received: from SG2PR02CA0016.apcprd02.prod.outlook.com (2603:1096:3:17::28) by
 TYZPR04MB6834.apcprd04.prod.outlook.com (2603:1096:400:340::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.18; Thu, 23 Nov 2023 01:54:56 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:3:17:cafe::85) by SG2PR02CA0016.outlook.office365.com
 (2603:1096:3:17::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 01:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023
 01:54:55 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 2/2] hwmon: pmbus: Add ltc4286 driver
Date: Thu, 23 Nov 2023 09:54:37 +0800
Message-Id: <20231123015440.199822-3-Delphine_CC_Chiu@Wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TYZPR04MB6834:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 94d72fe7-205b-441a-3144-08dbebc7313b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fyOjFSIGhVu25s1nScVM9byLZ/UtSHAbyYSoFPr+uQZMhJ6SDMRma5eC3CZLsR+REBuYP4l0w0GORCe4YSwxANeJ7mlZzZCxC19K10JvHPo2l+JAtfeDucGn85T8pnWOTdh04BWfnLulpxoZHb+KfvH977OggzRzFWNUkmPLfgGAf8jAe5/Poyzzl2EE6cTf0j6K651P4Yt14US8f1leCuU6COnZP3lpXvgsTSRYgUv4Ruo+Ln0QgSYV6rIB9qga2cRXTzQB+ajJ41TM2oimccJskYqwRlINyXH/OhWvKPvkMcb2wy7tS9zl9ZNb7v38NWS0IjohRYw2AhOlyjIHynzfXVgChe6b4rA4+smRCDQlxqVuujHXlzNqomTsgN/us/y4VycKiB0lf3Iz0iA1k+crU3d3SjqsfrvsJ7dhJOwLyD/25DqGja07BtYS9nlBsamJn5qsVKU0CmVj8WsPIhmy00jLBVke/UE6oS0hrp6M9aGNNdYzGwbTMJVGkeo/AcPgYd1QwBqDrimWJKWUgxgDzlDK4ftgy5zk/8eXnNdWAvDO/S/Dzr2KSdkYm0ZDaTTRqNzLQQtpcdG5/m7aPlHGKKndeabH00VJcWLPayPpNplTqPCVr3vGyIbR1PPa8RyzQwtjBnZPDM3+GDI+xU1B7VR0HHvbFOftNi8KQQZmA9cacP+bqOreUOLeOHXEoX8TzU90XVQ+vY6iFbI1CA==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39850400004)(136003)(346002)(376002)(230922051799003)(186009)(82310400011)(1800799012)(64100799003)(451199024)(46966006)(36840700001)(5660300002)(26005)(336012)(47076005)(2616005)(956004)(1076003)(86362001)(83380400001)(36860700001)(7416002)(2906002)(8936002)(110136005)(8676002)(40480700001)(30864003)(36756003)(41300700001)(82740400003)(7049001)(66574015)(6666004)(6512007)(6506007)(6486002)(478600001)(966005)(70586007)(4326008)(9316004)(70206006)(356005)(54906003)(36736006)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 01:54:55.1132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d72fe7-205b-441a-3144-08dbebc7313b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6834

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
Changelog:
  v7 - Check VRANGE_SELECT bit instead of entire register
  v6 - Check VRANGE_SELECT before driver loading
  v5 - Check the overflow when reading rsense
     - Set default rsense value
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
 drivers/hwmon/pmbus/ltc4286.c   | 176 ++++++++++++++++++++++++++++++++
 5 files changed, 283 insertions(+)
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
index 000000000000..5c122d5d0f7d
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,176 @@
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
+static const struct i2c_device_id ltc4286_id[] = {
+	{ "ltc4286", 0 },
+	{ "ltc4287", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ltc4286_id);
+
+static int ltc4286_probe(struct i2c_client *client)
+{
+	int ret;
+	const struct i2c_device_id *mid;
+	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	struct pmbus_driver_info *info;
+	u32 rsense;
+	int vrange_nval, vrange_oval;
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
+	if (of_property_read_u32(client->dev.of_node,
+				 "shunt-resistor-micro-ohms", &rsense))
+		rsense = 300; /* 0.3 mOhm if not set via DT */
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	/* Check for the latter MBR value won't overflow */
+	if (rsense > (INT_MAX / 1024))
+		return -EINVAL;
+
+	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Check MFR1 CONFIG register bit 1 VRANGE_SELECT before driver loading */
+	vrange_oval = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+	if (vrange_oval < 0)
+		return dev_err_probe(
+			&client->dev, vrange_oval,
+			"Failed to read manufacturer configuration one\n");
+	vrange_nval = vrange_oval;
+
+	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
+		vrange_nval &=
+			~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6 volts */
+
+		info->m[PSC_VOLTAGE_IN] = 128;
+		info->m[PSC_VOLTAGE_OUT] = 128;
+		info->m[PSC_POWER] = 4 * rsense;
+	} else {
+		vrange_nval |=
+			VRANGE_SELECT_BIT; /* VRANGE_SELECT = 1, 102.4 volts */
+
+		info->m[PSC_POWER] = rsense;
+	}
+	if (vrange_nval != vrange_oval) {
+		/* Set MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
+						vrange_nval);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					     "Failed to set vrange\n");
+	}
+
+	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
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


