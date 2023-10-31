Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21BFA7DC727
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 08:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343634AbjJaHV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 03:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343613AbjJaHVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 03:21:54 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2045.outbound.protection.outlook.com [40.107.215.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDC5FD;
        Tue, 31 Oct 2023 00:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2MyTmtD+I4OFLxoUTRrwO1V3VEE0/6jnT8qceIZ15/h4iia90/wRdcuUS/wGUvnaxYDKluYmNhB7DtVOiSAVDqhL04wBE/dJ2oxguENuvpWRp85h1foPJuTOzOATywg6g9LtWqYCG07hrDOqAfwmXX9aHNxmn6PDDJu/RkN97gADFUmYxCyrGpl7zqap0G3yFZpw0sYLpFBRixnJEvbzRmpBeB85g76pIhnQGTJWDjmVRiSrUPGVgRnR7G8fwhFdYethXJx9/H30fMdItI5awtPPhMc2c/5uLTlP3DO/ZMa5XzcqQfIkz1XchKNMlhg8mBdU3q4lw4HwWDGuPJxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oynassvg2g1aspTgB+Qlr38pd31Qui1WPJmW46rQY0g=;
 b=LNxHiEQ9Q1HsRbfHAqMb219B9OtAKzxCpc5kO0hg4TzeaIaF9NNErCxC3H18JJjD2f+3LujUicpoWK5Xm16lXYpaeZqv3UkxXaZC4hxA2MIIm5UJfYY9nNHeUEwTLul7oD7paom3UqNBpy1BQb2iV5bmUl7fXddO1kvAvUSZ+ctca611mibgnqBWzQtEntpyAGXQFuq8xiFaYLsp4Hk+79Xk32gazFBEgnm0rXOryaq94SWUOSQKw2DjBshlS/pAWJv1tOWkO+sYUXWmaT4u8GZR6e7/RZPzR5ySx7BpX2TBszEShjRyNNlwyNvns3Pd5y3t0F/itY696NLp0UCAtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oynassvg2g1aspTgB+Qlr38pd31Qui1WPJmW46rQY0g=;
 b=3T+RW2b1Hr7GzklMwd2UYWWdPaytyEkI+JiV3+UbhSdKrfm3lChu9VVW64b1995/F9C9e7yklkAxDM03YlUdKR7WU1q/cDup4tn9qpLGeJEyJ1EekufVoivHnRMxbVpx4DhDgxclPC1z40tY2galPGpnuQuSIzeMizszOAF0Td+QKkrhYiRvQQvUis6qqLYHAeQomufLS1vE4dgOB+CF30UipyrhkBWOulY0GYFuAN+/Lj9myx2aFqa815tBC0dIYFhEqCESZFnkInyvdLQ8J/uV8ci6iFEyzUAsUALxd0lpa8Zah/sR3zhVbWUp/b/wjt8af86F5Guwi5olJa7m0A==
Received: from PU1PR04CA0023.apcprd04.prod.outlook.com (2603:1096:803:29::35)
 by TYZPR04MB6497.apcprd04.prod.outlook.com (2603:1096:400:283::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 07:21:40 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:803:29:cafe::99) by PU1PR04CA0023.outlook.office365.com
 (2603:1096:803:29::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 07:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Tue, 31 Oct 2023 07:21:40
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
Subject: [PATCH v3 2/2] hwmon: pmbus: Add ltc4286 driver
Date:   Tue, 31 Oct 2023 15:21:22 +0800
Message-Id: <20231031072124.201181-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TYZPR04MB6497:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 811e7be7-cb77-4b64-54d2-08dbd9e206f5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FvUj4XzBPj3Kbp4wgE1WviD+tq8l37o0WauLxhO02GF874vpPKgxd/MOjtK/9gmgn/RqWH3Yn8mg99eNrl03ii72ogjJhOnbnzeIywhZkyhWuIewh6mNTU520yR4shTNyPwaXlx88hzSvcr2P6yMIsGs8wZYVWduci1TdZBQ2Ug+joEVC4d4fgvjUqDFvWPOA528ezeNZ/VWJfsmOWXi/SUzmmUaJS/7xftKB1hxgFH7NiSuUoGF5UZ+VrhUNDW7ccUex3XL+gnet4Ii4JZcF58J+rCLMyPbtXrnRf2s2XJ+Q/NqT7eo6SXGLrcZ9uz7b9EY8aitldbTQt1n5iDFo66rJ+Y14UbpgvR6eIIllC7sLTAzaNuCLiULBFSNIEdV/8iTG6KPQFOoYlbTxiUK3s2xCN6PZAOR+egVUES2C+6BePOfNhAeYpGkIuk8z9o/ldj6Zm4yrVi8s4UQRP1be9BFZqkVYiq4FIL4Y9WeaUSB+H2ycsjvUWfrzUUI04zw5eF/dzL0ZX3fokEqaeU7/r3wExEy3i8XZavHWmc8oFHF9pcVs1Xz3l+nHzlKxx457fvw9grWux8bO59oe83qdWrNeDxfyyIhS/SQndnAvboWeRZcUeJprvOT88y34dWQ6lbNn32XkKb1dag/WyAAEx6pYLhBAMDG0Hwvgy+7aZAb3xNOyYMA4eDr3eOgvHLYgXkxY/vFNjVYGUxJbWiFIg==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199024)(64100799003)(82310400011)(1800799009)(186009)(46966006)(36840700001)(2906002)(7049001)(36860700001)(6666004)(54906003)(70586007)(36736006)(70206006)(356005)(81166007)(47076005)(82740400003)(316002)(9316004)(966005)(6512007)(6486002)(478600001)(6506007)(66574015)(110136005)(83380400001)(1076003)(956004)(336012)(2616005)(26005)(7416002)(41300700001)(5660300002)(30864003)(8936002)(8676002)(4326008)(40480700001)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 07:21:40.2978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811e7be7-cb77-4b64-54d2-08dbd9e206f5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6497
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
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
 Documentation/hwmon/ltc4286.rst |  95 +++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |   9 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ltc4286.c   | 178 ++++++++++++++++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

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
index b4e93bd5835e..f2b53e8abc3c 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -226,6 +226,15 @@ config SENSORS_LTC3815
 
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
 
 config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
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
index 000000000000..042d3af99489
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,178 @@
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
+enum chips { ltc4286, ltc4287 };
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
+	 * However, the rsense value that user input is mirco ohm.
+	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
+	 */
+	.R[PSC_CURRENT_OUT] = 3 - 6,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	/*
+	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
+	 * However, the rsense value that user input is mirco ohm.
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
+static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", ltc4286 },
+						   { "ltc4287", ltc4287 },
+						   {} };
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
+	ret = of_property_read_u32(client->dev.of_node,
+				   "shunt-resistor-micro-ohms", &rsense);
+	if (ret < 0)
+		return ret;
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+	memcpy(info, &ltc4286_info, sizeof(*info));
+
+	/* Default of VRANGE_SELECT = 1, 102.4V */
+	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
+		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+		if (ret < 0) {
+			return dev_err_probe(
+				&client->dev, ret,
+				"Failed to read manufacturer configuration one\n");
+		}
+
+		if ((ret & VRANGE_SELECT_BIT) != VRANGE_25P6) {
+			ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
+			ret = i2c_smbus_write_word_data(
+				client, LTC4286_MFR_CONFIG1, ret);
+			if (ret < 0)
+				return dev_err_probe(&client->dev, ret,
+						     "Failed to set vrange\n");
+		}
+
+		info->m[PSC_VOLTAGE_IN] = 128;
+		info->m[PSC_VOLTAGE_OUT] = 128;
+		info->m[PSC_POWER] = 4 * rsense;
+		if (info->m[PSC_POWER] > INT_MAX)
+			return dev_err_probe(&client->dev, -ERANGE,
+					     "Power coefficient overflow\n");
+	} else {
+		info->m[PSC_POWER] = rsense;
+		if (info->m[PSC_POWER] > INT_MAX)
+			return dev_err_probe(&client->dev, -ERANGE,
+					     "Power coefficient overflow\n");
+	}
+
+	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
+	if (info->m[PSC_CURRENT_OUT] > INT_MAX)
+		return dev_err_probe(&client->dev, -ERANGE,
+				     "Current coefficient overflow\n");
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

