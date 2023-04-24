Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595666EC9F7
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbjDXKO0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbjDXKOX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:14:23 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2049.outbound.protection.outlook.com [40.107.117.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519D740C5;
        Mon, 24 Apr 2023 03:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFGqq6AwlDyo5uSHLmSPNBl0k3aGyOIrZf69Ra7NLKLk8Hpgy9NO7YAz2rmeVCGQqBFSQMLcVAf4k8MTEJqHs9J+8iZ5yGN9vGQOR2yEWiLtUYyRQHvloCUjaW6lzQCuzzPyym9br6uH0vF5pHTj4rKIvKw2rc6c5evfkl6cLvCgMUTr6lRilA/U4LUVJtPgHvGxc7xeFCFAxBGLMYEGIdxL6kDb7bUOoUvDmGEorSnG01Ho6fdBg8IGKQAP3SYDZh5AN/EHDLGnel88S69tcQiS2dFBTCzdxUf/J2RtNeIgcuSPCDFke85ooR6owVIHuyg6ni0oLzb87RgFBTK/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf7AFk93plJGjm+CcW1hU/4HpFIClbcuMRZi1phwoh8=;
 b=DQqiSL58ZpCatPxlmrVXwnH9uV6I868bxIJbbBZ7qJWwuf0oxbX3T29JUZ3NwOY7uinjPm+aGtpZ6vn3mDOsfJzJt/iLCH0Dh0GrFhNudjgA1cOhRmi9NkvxWVmzs2i1GQarL6uBQAa9+nTSyld9t/+utPNv19DhYxLy2Xf2BfHZQm2OD8qHCD1LXMsHDMHILzKwhyx3zKZdxXllbah03fIzrOCDz/H8D9Thmph1f7LavZyADwQbuTYZ5eIS/oBvjBXvazzF1miWQtHi3mrmDWxtJncN45+nPQcqqMTMFATOrGpucFTBmMmbqT+JY4yt4sMp7LWSY5ajz7GuG7lNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf7AFk93plJGjm+CcW1hU/4HpFIClbcuMRZi1phwoh8=;
 b=pfHZb8TIA+HwvP49jQVxb6GeKf0VVZqRKkBx63pHovEi3LTLDPLDvSipRoCH51xFjyIcDMHrAOnY67hngK0WdzWg2OTL1/nUQ+v1du0VF/qbcjQSj/ncWqQ+u6JKR9fRKae4t/lWcy8SeGGvStTOp6RdSThOVBR6gp0wWz6Lo9xr0yDKwYCcAoB/Fec0nBuzErZwGPfSvEDzoC2HgR11x4S6hVPKdwb0OU4NoTeJTqfmDhvvx24SnzRznSk3qTmEk3DmaiQPDO+NkgKiuHeq5I7LHG3jybG+AMW0weT5iMicYUyl3Z9riwr+pTUYyz1qrTdsQjgCB+0GZcHtoZTArA==
Received: from PS2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::28) by KL1PR04MB6781.apcprd04.prod.outlook.com
 (2603:1096:820:d2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 10:14:09 +0000
Received: from PSAAPC01FT059.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2d:cafe::ea) by PS2PR01CA0016.outlook.office365.com
 (2603:1096:300:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 10:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 PSAAPC01FT059.mail.protection.outlook.com (10.13.38.139) with Microsoft SMTP
 Server id 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 10:14:08
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Date:   Mon, 24 Apr 2023 18:13:50 +0800
Message-Id: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT059:EE_|KL1PR04MB6781:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d07d1931-df8e-4df9-8684-08db44aca4d1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QB9O9xk1/aEsns41emaCDHBxDA7dR9zUftVTYUeXZVbkEESXflqMuIcUgu0Sx+28i3mfOovDylMsKlz8PY84AgCeEJa1zsH6maT9Oxs/oxYFHhaQ26pgYw/2AxFJqhAnKu/qGrz1O7EYPd/EZOhwxIL5TbLtqzz3YHSW2bWdLPyY4gU2DIv0L879siWCDeQRxArop43SE4UYKd8wyfpRFJ0WhQpvPIcZnXL+vP29tjl57jEoB6WDSVlwDhsuaaf2D+tqW8yyE35nvufTTwkcyYqnZG8J8TF/DePAW01PqZQ7bQJ/yqbnMrgEqj5aN30v5DWUCtT2njSHzoq2+nsgeuBJlfWo7K9QSjMS0ItixNy7mc54mpLued66U/HBwZc/xkUFsJ/R2uRPjFXPOI1xi0/wxPQiKM9GztMNce8bmuaiHQLGyU3exrhyPbmw7NGfyqqmVv2zi6MZ9+dgeT3VBrarhaWawK27sBh1u0ZCdJyf6HYVA8u0svtAqeYX5rnJ8+lH9CcQ6HSpLcfVlCxRoo7lrw+KdGKet9GCGV2Tuque3Ga4MPYqSB7u3uQGEu9uPRnVn7yjPvyp6YVAyl92A8uj0xK9HJlLCuXEKsfuFxDnDdgFEi8ejk0IpkRx6afmkVrhUZiE/QZ7KtjVQnC9/u0gvNyawn/t0a0A9ekYTbY=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(36840700001)(46966006)(81166007)(356005)(82740400003)(336012)(6506007)(6512007)(1076003)(26005)(2616005)(956004)(40480700001)(186003)(83380400001)(66574015)(47076005)(36860700001)(2906002)(8676002)(8936002)(5660300002)(9316004)(36756003)(54906003)(478600001)(6486002)(6666004)(110136005)(316002)(36736006)(4326008)(41300700001)(70206006)(70586007)(86362001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 10:14:08.7222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d07d1931-df8e-4df9-8684-08db44aca4d1
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6781
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for ltc4286 driver

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 drivers/hwmon/pmbus/Kconfig   |   9 +++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/ltc4286.c | 142 ++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 59d9a7430499..1230d910d681 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -218,6 +218,15 @@ config SENSORS_LTC3815
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc3815.
 
+config SENSORS_LTC4286
+	bool "Linear Technologies LTC4286"
+	help
+	  If you say yes here you get hardware monitoring support for Linear
+	  Technology LTC4286.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ltc4286.
+
 config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 3ae019916267..540265539580 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
+obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
 obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
 obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
new file mode 100644
index 000000000000..474f4ec9107c
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for LTC4286 Hot-Swap Controller
+ *
+ * Copyright (c) 2023 Linear Technology
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+// LTC4286 register
+#define LTC4286_MFR_CONFIG1 (0xF2)
+
+// LTC4286 configuration
+#define VRANGE_SELECT (1 << 1)
+
+#define LTC4286_MFR_ID_SIZE 3
+
+enum chips { ltc4286, ltc4287 };
+
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
+	.R[PSC_CURRENT_OUT] = 3 - 6,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 4 - 6,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 273.15,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP,
+};
+
+static int ltc4286_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	int ret;
+	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	u32 rsense;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read manufacturer id\n");
+		return ret;
+	}
+
+	/* Refer to ltc4286 datasheet page 20
+	 * the default manufacturer id is LTC
+	 */
+	if (ret != LTC4286_MFR_ID_SIZE ||
+	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
+		dev_err(&client->dev, "unsupported manufacturer id\n");
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read manufacturer model\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(client->dev.of_node, "rsense-micro-ohms",
+				   &rsense);
+	if (ret < 0)
+		return ret;
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	info = &ltc4286_info;
+
+	/* Default of VRANGE_SELECT = 1 */
+	if (device_property_read_bool(dev, "vrange_select_25p6")) {
+		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"failed to read manufacturer configuration one\n");
+			return ret;
+		}
+
+		ret &= ~VRANGE_SELECT; /* VRANGE_SELECT = 0, 25.6V */
+		i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1, ret);
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
+static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", ltc4286 },
+						   { "ltc4287", ltc4287 },
+						   {} };
+MODULE_DEVICE_TABLE(i2c, ltc4286_id);
+
+static const struct of_device_id ltc4286_of_match[] = {
+	{ .compatible = "lltc,ltc4286" },
+	{ .compatible = "lltc,ltc4287" },
+	{}
+};
+
+/* This is the driver that will be inserted */
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
2.17.1

