Return-Path: <linux-i2c+bounces-188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630667ED990
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 03:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 531ACB20C39
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 02:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C912117;
	Thu, 16 Nov 2023 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="pAxPvQzy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2067.outbound.protection.outlook.com [40.107.215.67])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E47127;
	Wed, 15 Nov 2023 18:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3AThsbdlygE9YSu7vEYpLSbpFvk/opuDjKbBsnjJffhj+xqE8+aa+fhh/tl4O8rcVI42m7vHKpCEhR5/QORztAiMx6yZv3WsygvvSARL+VsFrVq8lv+EGHVyUKdkhGgNG/RO/9+cZOiC2+ayZ07ifGrcrA8z7jthcthc0VErfAVcAFcGryYLy7zy5vV8/tM6vWTxF7rTKhtaVII3LYzzaGDKauVgxuSQ5evzJ1XHU/H8Xr3cCBuvWCaZCWXzHeaOzt17XhIshxG0qBm89MuhC6jgEYaI3ljAJpODZP8ZSW9qu3JNPN/TPeAEMdoLweO2L1C/wsYioTdnPQ5CCwZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiXtSiVCp1dFSMF0RldhuUNVZGviaZPuyLwakJY7kNw=;
 b=JySRjEB1EQzovbhvxBkbeZH4QWFDsB9HD6Dmm/mOYgUNUgplUNBILM7aOweypoL3zKj86totMbvvIU1xVO5cs9b0CBDOTum7cSixOZXOVLlGuO/UOzIhzg6Gi0L+9l/DOgVyCqWpz9AIuRrx+WIxBTVCuy4gMdaNYuog3HyAoPcCcY+KO+kMlkZgBkUhH2iK3u6ao/v8Hyj0PzK9b33Yz1dYIekGF9AFnfcAZ78r3RwrcpGOY3NvnMNwz3SGm5cL3iWkTFv3PDU9wtylo5WzXIZMtMHzAD3wSZP7b7Y1r1stBvwCBjNXMjL4IdDvv+DLj499QcYu4ArcW0PrnLeRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiXtSiVCp1dFSMF0RldhuUNVZGviaZPuyLwakJY7kNw=;
 b=pAxPvQzyKToL+KMGu6GKWsFKaeUt3sHAn6/mmUc+3g1arfebJE2wtXhOOrqlY/mho35T5IlMCgIcriltuNofEeA1a3weqbqlUoYpysvrM8q4sKcNT90XIdNi2iGNpWqLGY4pGmoLMxSFXoqqcHTKVfyr0EsqPEcUMbw4oTERwKL+o9EJIZ0OHJgz2SbnG1ASAEfdXvUo4tWsROoSuih6rt/n/yscpP3CD2ZHGv3jhi624RkgCVTRzVxlEKZliz94dAYYDuT5+626BAr/95SJsfyBiMLG9krQhv/ZzYj9I+4MVZr67bmg4LvmIqftAkey37aFQnj0fd9dnTvow01B/g==
Received: from PS2PR02CA0058.apcprd02.prod.outlook.com (2603:1096:300:5a::22)
 by SEYPR04MB7689.apcprd04.prod.outlook.com (2603:1096:101:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 16 Nov
 2023 02:30:44 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:300:5a:cafe::88) by PS2PR02CA0058.outlook.office365.com
 (2603:1096:300:5a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 02:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 02:30:43
 +0000
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
Subject: [PATCH v5 2/2] hwmon: pmbus: Add ltc4286 driver
Date: Thu, 16 Nov 2023 10:30:25 +0800
Message-Id: <20231116023027.24855-3-Delphine_CC_Chiu@Wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|SEYPR04MB7689:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f4ae2b9-7067-4f19-bbc7-08dbe64c0893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gV6BZU1RK5RJ9ZyJH2ai0TSJ8oXcbR84OPLy4CiW4JhK+pHFxBVW788QqSXdehsx8Cw4Ogs7GH5TE44VkNfhGQ5gGLZeGiMxzFQ7dWvAJxgPL8MRSon6vzFm0V3gUcA1QojvAW0/b7EkPgxikufrclDtk9duKcxgEnKLxMF+o0fY+TG7UHV3jjvyrpFZ30yAglbjh7AhosyWXf1Db3/i4o8ajzXdf0wwO811/MonlXlteMohVs/yJaDP7XUtOVT99udEfhfGPPVwTit/dkI25pEaYHwQKZ5ArjRJXGJX/kjvtdZcSm4x9qqV51KIIsrGVmiaYZ05F1PqoH0varMcYm9rXaNvbWgKHycNULFjiAjvZCnXNFYZYTLMOtkXYdVFystlIxq8Ukp0Kfbw6JFt9/zMdd85CsDg+3i2Jq8yDscMP/Wj6x9RUAUmVn7artQ9X8gPTiyjaJRFhYnzJpuPJdjAGoCv0fwxEmTwg505I1FYXPAWNjZ22+13QMd/7tzmKPvISW22IUo//cUin7aZrT2F14tWa0mEKShd+dYBLaaFf17+rQUcnxdm3erDmS0X1W0247vrPloqLDk0UU+Fx06cpJrdougX4b04ycCsWkkF5fnojZC8gSSZe0e6+Y0LUgYopyBRt3A3kcaKmxrtfsydUZcPAWTfDi7H4/F9pkiOX8CoZpqmGmqMh2Dsyzo2EFpJJTVxPACjoPIpPHIloiU2X2mMr3KZ5dSMRH/3EME=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(46966006)(36840700001)(40480700001)(7049001)(6486002)(966005)(478600001)(956004)(316002)(6512007)(47076005)(70586007)(82740400003)(83380400001)(356005)(41300700001)(6506007)(70206006)(336012)(54906003)(6666004)(7416002)(26005)(66574015)(86362001)(4326008)(81166007)(36756003)(30864003)(1076003)(36736006)(110136005)(5660300002)(36860700001)(8676002)(9316004)(2616005)(2906002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 02:30:43.6047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4ae2b9-7067-4f19-bbc7-08dbe64c0893
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7689

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

-------------------------------------------------------------
Changelog:
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
 Documentation/hwmon/ltc4286.rst |  95 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |  10 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ltc4286.c   | 169 ++++++++++++++++++++++++++++++++
 5 files changed, 276 insertions(+)
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
index 000000000000..32cf3946388e
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,169 @@
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
+		info->m[PSC_POWER] = 4 * rsense;
+	} else {
+		info->m[PSC_POWER] = rsense;
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


