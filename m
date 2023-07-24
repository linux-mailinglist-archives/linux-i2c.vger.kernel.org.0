Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E464875F269
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 12:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232775AbjGXKNq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 06:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbjGXKND (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 06:13:03 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::616])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3584A3A9D;
        Mon, 24 Jul 2023 03:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCc36QMwa1aagVwFX+a3oOpaWCyLK7+qoitcT6bSaVoSiMY1InthxPHhJXF3xA84GLbxEAPrTc3hcVIgJgBJqfnWYMzgqGUslkg99SGl9ld3M6baBFAlZsDUOl8kpmym+2IMvB994NFjAh+o/alrve+qof6nlKrfkbVUVqjb5IzorK/3WBU9UJIw3QK3Zxuvy1LqBjPCLUrBomx7QCzS6dvxdQ/ZZZyIczCfEaFSxvwZWgMFl7+ceX3izGMbw9k0W2dlf47HCHk9R6iGW+tYL64dEW/jjFq6/8dDZYmWJU54sf8dpTxTW9iwwlixVFmLv+ovByfUI8yj+u9HTOL6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqrZmnOWPD/wzqSzm8Vs5iuVS1GO4FouTc4H76ITF0s=;
 b=jGSUsqlPqCJv3gMX1H1xEK2TT5zzdIDZuViLGK8XJ0i9ioecrzHPRt2Av/Qt9g+B+OGBXUgOSzyhUEiOrFW+FbcTOkQ5eeHT500B+mw/2k6p9gsayTZ/xDvWlaUqSYCQ13mNujZgfBGBKncD74AXi3LaGl5jf0e4PnCOPXbQ19G6utk549Al58IxiRE8XJ9p7DLdpgTKvyFbw9yEDGVEJapDCZLHCRGwP4Bv/4V1c2oHyG7REF/GFyrklbnt37GV7To+Sq2FNyPtZ0TLVZV2BTm74pRpoH1xC3026oyvCDnPHWSaIgjs6i2Cpqqtrpq9MK0rQQY/vkEu24uacpeixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqrZmnOWPD/wzqSzm8Vs5iuVS1GO4FouTc4H76ITF0s=;
 b=uHWILuS/m6jQsQTYd82KxZEO+qNWwpUatUJph3daXUbprxwG8zX+4ktn+3V3oYAZUrncQSZWqrw0k9bfX9ovu5JBBPykPBhuWQyG00wbRnJrSDnSpV9fg3SvUA5BVRwdcDQ3iN1MsYfPh/0lI1QS/77g1b7j7s6+DKNhKqkN1J2J+Z3mswzbwSd9N3IXN3LqyvkeubwhMPWWSNNCQNWJ5e6UEElx0/3iVLprwsvFYYUTXImvc2a2inW+RakmFsXXQ2StMZCKUFheggvBBr8UYb1olB76TCnVFPjVUksNem0idZ5gzTAhxrBfLc7T7JaEf6r0SKr2meUHvYcm+PnueA==
Received: from PU1PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::19) by JH0PR04MB7022.apcprd04.prod.outlook.com
 (2603:1096:990:38::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:05:25 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:803:15:cafe::4d) by PU1PR01CA0007.outlook.office365.com
 (2603:1096:803:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32 via Frontend
 Transport; Mon, 24 Jul 2023 10:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.6631.22 via Frontend Transport; Mon, 24 Jul 2023 10:05:24
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: pmbus: Add ltc4286 driver
Date:   Mon, 24 Jul 2023 18:05:12 +0800
Message-Id: <20230724100514.1028061-2-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|JH0PR04MB7022:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a2ab3769-bfc8-43ff-6b0e-08db8c2d7f7b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47XahZNgS9oTMxBvZ8u0dR1WIvDgCxChj3OOPxCGilxkElE8dHgJB1Ird0F4euDhoxIZzrAaXZx4ZZYkPX+6BHY8r0gDmUbK6rIy/wm4kTlEfaeTHKsxnGp0d8dFycoWBlpI3eom1i6TtiyXYTxGqmJPOuclVstcyZUsTxt4DxwlEfzfG1a8H9H0enFbO4KjkqmcmbtyWWbfOXD06io7XSayIN/ZQSsKgDF08Sy6/4J284SzJnkeAFo5my3ychiFMpEqnlj8SZZms+PLpPj7cTzlvJF/ZVVYCEpsugew/Z5nsByq7Ty+2qlf71W1zOtF6fyWqRMr93eFHUaC3iJf0fHa8nWmMcjU7JUnEub9QxR6eqLK0EXSEBBXgD943jeqcuyihVRFgl4rmGDoA8Hu+AKYKsloWIV0HvVRnDVsTZbUm1RRm+EqjV4Pk5V0MTix1S6Ui2PZv2aLzWgVgj61qk4lCoHgrqGS13lrgwJEYkYRlAsVRAurpMTEt41i9LpOXYMj2ighxpPCKjhmrXyoC/wQBxyExxJp1c0s+4pjYd65+WyhCOY78tQ6sS6Kjje/mi74Yh6Kg/5Avd93eSWVIuO3hFcW4TTO68EL7+mHFTcxSa3g6A9vFoZVahOT9Ohjjpd4qpl3yuO1buyhjHJsfm+paZV8E0HusNQM+8TlvFRoKFYU0z3KdKTQqxs8Ae6UvXrbiSKBjnvMvetgtPpa+g==
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(396003)(136003)(376002)(39860400002)(346002)(82310400008)(451199021)(46966006)(36840700001)(36756003)(5660300002)(186003)(1076003)(6506007)(336012)(26005)(4326008)(316002)(70586007)(70206006)(41300700001)(36736006)(6486002)(47076005)(2616005)(66574015)(956004)(2906002)(6512007)(6666004)(36860700001)(54906003)(110136005)(478600001)(7416002)(8676002)(8936002)(83380400001)(82740400003)(86362001)(356005)(40480700001)(81166007)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:05:24.0925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ab3769-bfc8-43ff-6b0e-08db8c2d7f7b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7022
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 drivers/hwmon/pmbus/Kconfig   |   9 +++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/ltc4286.c | 147 ++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 270b6336b76d..7cb9cbff587d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -226,6 +226,15 @@ config SENSORS_LTC3815
 
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc3815.
+config SENSORS_LTC4286
+	bool "Analog Devices LTC4286"
+	help
+	  LTC4286 is an integrated solution for hot swap applications that
+	  allows a board to be safely inserted and removed from a
+	  live backplane.
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
index 000000000000..b86bf31cfbae
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,147 @@
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
+	.R[PSC_CURRENT_OUT] = 3 - 6, /* To support small shunt resistor value */
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 4 - 6, /* To support small shunt resistor value */
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
+		return dev_err_probe(&client->dev, err,
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
+	if (device_property_read_bool(client->dev, "vrange_select_25p6")) {
+		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+		if (ret < 0) {
+			dev_err(&client->dev,
+				"failed to read manufacturer configuration one\n");
+			return ret;
+		}
+
+		ret &= ~VRANGE_SELECT; /* VRANGE_SELECT = 0, 25.6V */
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

