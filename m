Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A8F7D7E3E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 10:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344605AbjJZIPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 04:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344565AbjJZIPt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 04:15:49 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2066.outbound.protection.outlook.com [40.107.215.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44CD1AD;
        Thu, 26 Oct 2023 01:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPuSGPo/D3COBjathZDYigeciDctLLJxzCSBhJuA7hRK3bjSz88XCO/j+EmMftl3ilVRmSdoirn8RYuKmws9jcn4Q8j+BIHc6BjMs/E+tO5bAIUdODRp4M9ZWsbm6c7LlCPKyM5JuOGjVxOhpCZhEzB+NbxX8loD71gg4/3QQzF+sp6r9pYPl4D0a8awJUVGcQk1rBNp+lffWPAXY7+9TjgHrgN9vyaTUXv590ThpCrjQPOSUPl3trPNV2/pfFP6+bsjviR6zrFTqd/Dj/v5H7M8eHxhd16fPfdkVGLTBLglr70jErJmqCpilq7fs6e1hPYd9rpA0Kf7Wz9sotgT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBhCActUbsHpPlHX8Tjd8bX/IAC3leV3emLJHxMRWNU=;
 b=RfcVApdPpIlCCT7fBK3rWJ6HUYHSJFZ4Ns+KO7B7HGR2aBYZ0wq1TQ9o3Vl3rL0j2r2jX2SsQw/urcQVFZsUOgYC/wtJObtWwWfDWU63CFyAijWALLQxaZj9gZ155LbLCeTus/UCekDHWuB8jdeezIGZdtxr1ob7N2hoqm2+bY0A2Fqogj6QuIorp1u7DQ0dvVAmI7CqD7hPNtqPsnzkDcM/HJ/8+odWqC14U8E5RY8azDECuFREjSCiM/A/A+VKLxkawDWVBU1x5i/fCrWb5GfyLGmT7Kq2J2IhaxTMuF49TWEr1n0n3s1N8WLfTNuqsd7YQnwtnor3wXLqkUQDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBhCActUbsHpPlHX8Tjd8bX/IAC3leV3emLJHxMRWNU=;
 b=ikgTZQwZ2ar7yG3xQTef4EcrQ2WHGrHQ907z8zMD+6yeYMA9GkoJx6cFFLgW5lt+pvmGwZbHUyHYcfY/E0Vs5Q/WgbiVpIHBPQyzXckJWYfAjX0Zv5Nb30NniY7uI7AUK/VYxqeyzmnxFLUIJ5AL1qzVZnmV4o+In0fzwTPs6nBedvJrLhiUiVQYF7jsc6ITWQwhbsVJUUaeDgnyM1D+aU9AKJcoumjiwMsAQsgXR83u398Jey5oDNK+2mOltwADZppFsvR1HCFpHI+sr6nSCkbf8J0H/GQOrVsTrsh9bQvbWQskGynNpX5CVLxO7UaJlxekCKn8vMmOOekILbgj+g==
Received: from KL1PR0401CA0026.apcprd04.prod.outlook.com (2603:1096:820:e::13)
 by PUZPR04MB6916.apcprd04.prod.outlook.com (2603:1096:301:11e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 08:15:35 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:820:e:cafe::6a) by KL1PR0401CA0026.outlook.office365.com
 (2603:1096:820:e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Thu, 26 Oct 2023 08:15:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.6838.22 via Frontend Transport; Thu, 26 Oct 2023 08:15:34
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
Subject: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Date:   Thu, 26 Oct 2023 16:15:12 +0800
Message-Id: <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|PUZPR04MB6916:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9a2b1238-939d-443d-96a8-08dbd5fbba58
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXDd12igWkUT3rP3pjT7SNxmncsmU/iidFOe0LJrL+S5/P3AjnJq4nRbnzi3kdKN3ilDrTaSJhRnVdIsoTfrDxM9c8/R9eJagpncNMW9ZBExweqID3xQIVgApYZEdK1uzBix5np3NcrDBD+zQOoel+sQXkiaz6LwDIQmSK/c5dv2TXnFpFHsTeiiwtQm49t976LvxKd8rXyGjixB5hpG3NupnI+xqh/R0qFY2iZtUqUxx7zjHHVP8lTnS7zKjuKRTCgxVb6RSH9i2gWimVQurceT9UKp+bUc52HjSU0+cC19i+MYqjIwm6qPzjZVXhJ5N3mSkFqkBGsBybGmJMMHy25cROggyIPZdmraW2X3PtJJmbKe+u1edJ5guTJ/eRgRpBqgJNdVGgcdOdFCmRsIqJDGNO6a2kv4hg07rLJiwe7b2iDUos8GSGphNPV5+VnWM1YDkRALtsvrzerZUVZgeJcualFHCgo6KQhpSKovc3W1Sc3cnQVi9ALRUkRpEmRO/cqF7+owBOLXa5PzsjnZuQjB6YCRgokMcHa84R/H4rf1zvUcrI/EnZWS/1a7aYTm0RwuvV2YUTMHl5JgfBTtU2AGNealIp/BwiyL5aEV78QNjfiB0w0AXOKUUP9D3hx4rvraW6EvH2ByOy7tg8RIUVUtwbsQYO7essLuJ5JeV0XOuw2T6EEkOAKTvcTRWsKE7CvRVZWH61C7k0aIvsAbTw==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(346002)(396003)(39860400002)(136003)(1800799009)(64100799003)(451199024)(186009)(82310400011)(36840700001)(46966006)(41300700001)(2906002)(7416002)(5660300002)(8936002)(316002)(36736006)(70206006)(70586007)(54906003)(4326008)(8676002)(110136005)(478600001)(966005)(6486002)(6666004)(6506007)(6512007)(7049001)(2616005)(336012)(956004)(1076003)(26005)(66574015)(40480700001)(83380400001)(86362001)(82740400003)(356005)(47076005)(81166007)(9316004)(36860700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:15:34.0276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2b1238-939d-443d-96a8-08dbd5fbba58
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6916
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
  v2 - Revise Linear Technologies LTC4286 to
       Analog Devices LTC4286 in Kconfig
     - Add more description for this driver in Kconfig
     - Add some comments for MBR setting in ltc4286.c
     - Add ltc4286.rst
---
 Documentation/hwmon/ltc4286.rst |  79 ++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |   9 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ltc4286.c   | 160 ++++++++++++++++++++++++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

diff --git a/Documentation/hwmon/ltc4286.rst b/Documentation/hwmon/ltc4286.rst
new file mode 100644
index 000000000000..9cae50b7478d
--- /dev/null
+++ b/Documentation/hwmon/ltc4286.rst
@@ -0,0 +1,79 @@
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
+inX_label               "vin1" or "vout1" depending on chip variant and
+                        configuration.
+inX_input               Measured voltage.
+
+curr1_label             "iout1"
+curr1_input             Measured current.
+
+power1_label            "pin1"
+power1_input            Input power.
+
+temp1_input             Chip temperature.
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
index 000000000000..e1d72fe9587c
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,160 @@
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
+		dev_err(&client->dev, "failed to read manufacturer id\n");
+		return ret;
+	}
+
+	/*
+	 * Refer to ltc4286 datasheet page 20
+	 * the manufacturer id is LTC
+	 */
+	if (ret != LTC4286_MFR_ID_SIZE ||
+	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read manufacturer id\n");
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read manufacturer model\n");
+		return ret;
+	}
+
+	for (mid = ltc4286_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
+			break;
+	}
+
+	ret = of_property_read_u32(client->dev.of_node,
+				   "shunt-resistor-micro-ohms", &rsense);
+	if (ret < 0)
+		return ret;
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	info = &ltc4286_info;
+
+	/* Default of VRANGE_SELECT = 1, 102.4V */
+	if (device_property_read_bool(&client->dev, "adi,vrange-select-25p6")) {
+		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"failed to read manufacturer configuration one\n");
+			return ret;
+		}
+
+		ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
+		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
+						ret);
+		if (ret < 0) {
+			dev_err(&client->dev, "failed to set vrange\n");
+			return ret;
+		}
+
+		info->m[PSC_VOLTAGE_IN] = 128;
+		info->m[PSC_VOLTAGE_OUT] = 128;
+		info->m[PSC_POWER] = 4 * rsense;
+	} else
+		info->m[PSC_POWER] = rsense;
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

