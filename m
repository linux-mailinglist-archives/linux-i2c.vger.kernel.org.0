Return-Path: <linux-i2c+bounces-9189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB7A1B980
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD0116B89B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFDC15853A;
	Fri, 24 Jan 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NlS64fkx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B817108A;
	Fri, 24 Jan 2025 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737733203; cv=none; b=P8M31CsOrNqMU5c9vcL3YOdwlh0iWwf1ed4CLTc1xAnyjYbPMLWT/wk8nfdy2pGWd1uA874euOHI+CLJ4XNtvvE4IPWOzbs3Es8FYNodIeaHcorI4u5MGKo8RmLkz35bJmAGtyTXXfKdoavhF4nMYeKdQzHuysXjGijnJxnZInc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737733203; c=relaxed/simple;
	bh=f/P749+UDDApRyM1x+XcilYWBzKdzOfQfr6qHqDzJSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=s8/CrjtakMCeY9iNrHcsEMgqvAlakQ6EH3qg5BnSBqwqD9mXrp/lVNoWRpBMWECWEB7OWkG86J7STvPWFOQGC1th9u1XQpZh8xTFM1lAIczMQiHucivWSasBRzANpbMd6wXG5O03MoVLa5Z7hgW7+hSXZzE3ZE16pHObVxmXkMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NlS64fkx; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OEn2HN007140;
	Fri, 24 Jan 2025 10:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZN3jx
	oSze07lwtFGxknwI8VdNscu3oFFasPRFs8Iuos=; b=NlS64fkxaNyLwIOLIzfJj
	ywRKWMa2dTxcPJvbmYPrCNxOY0XBaXnuriU03GyffS9NybynR3mG2l3K5G1Qus33
	Sq3PqM1nL7xPudTDfNHWZj0btN7mJOG75BnDhlBGequbIBc31YQaG0zkZnmtYr2G
	GUIWbqJH+lonx1L4kHTEkW5ZNhP4/XbaHuAtzpj/58WOcy2lLQpDz3ef8MR+EMSq
	uLvfTGMlE2QiDHVRScwnye4FAraC29kMqHeAQmn/bC344awNI5MUUVN8+GkcIoo1
	W4mZ6kiUtduPo2GVC6X0gwr/JvSopi//J08FGt+e3Tui3kA1BBxq+xYFDwA9MlgH
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ccxx0771-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:39:46 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFdik0035849
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:39:45 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:39:44 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:39:44 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:39:44 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFdFBC032412;
	Fri, 24 Jan 2025 10:39:36 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Fri, 24 Jan 2025 23:39:07 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-upstream-lt3074-v1-2-7603f346433e@analog.com>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
In-Reply-To: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC Chiu" <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737733156; l=8893;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=f/P749+UDDApRyM1x+XcilYWBzKdzOfQfr6qHqDzJSA=;
 b=ZwyiEiGhAgNr9ZrzA946EFi5pAYUKdPcIwvkyG7TUFkWAtNeHFDiRBnFru69urOL9TqQTUhvY
 fMnuroHKvvvCaB2JDbdXQ1fTF4P4BDYs9n/ZawIIdN8dDMSG9J/tQXz
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: UeMCOAQaiwfGlh_rgpVn-JLF8IZPFr5P
X-Proofpoint-ORIG-GUID: UeMCOAQaiwfGlh_rgpVn-JLF8IZPFr5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240110

Add hardware monitoring and regulator support for LT3074. The LT3074 is an
ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
serial interface allows telemetry for input/output voltage, bias voltage,
output current, and die temperature.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/lt3074.rst |  72 ++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  18 ++++++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/lt3074.c   | 122 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 214 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index b1ea445479b0..5be511506d50 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -122,6 +122,7 @@ Hardware Monitoring Kernel Drivers
    lm95234
    lm95245
    lochnagar
+   lt3074
    lt7182s
    ltc2992
    ltc2945
diff --git a/Documentation/hwmon/lt3074.rst b/Documentation/hwmon/lt3074.rst
new file mode 100644
index 000000000000..234f369153cf
--- /dev/null
+++ b/Documentation/hwmon/lt3074.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver lt3074
+====================
+
+Supported chips:
+
+  * Analog Devices LT3074
+
+    Prefix: 'lt3074'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt3074.html
+
+Authors: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for Analog Devices LT3074 Linear
+Regulator with PMBus interface.
+
+The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
+response linear regulator with PMBus serial interface. PMBus telemetry
+feature provides information regarding the output voltage and current,
+input voltage, bias voltage and die temperature.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate
+the devices explicitly. Please see Documentation/i2c/instantiating-devices.rst
+for details.
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+Sysfs entries
+-------------
+
+======================= =======================================================
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_max			Input overvoltage warning limit
+in1_max_alarm		Input overvoltage warning status
+in1_min			Input undervoltage warning limit
+in1_min_alarm		Input undervoltage warning status
+in2_label		"vmon"
+in2_input		Measured bias voltage
+in2_max			Bias overvoltage warning limit
+in2_min			Bias undervoltage warning limit
+in3_label		"vout1"
+in3_input		Measured output voltage
+in3_max			Output overvoltage warning limit
+in3_max_alarm		Output overvoltage warning status
+in3_min			Output undervoltage warning limit
+in3_min_alarm		Output undervoltage warning status
+curr1_label		"iout1"
+curr1_input		Measured output current.
+curr1_crit		Output overcurrent fault limit
+curr1_crit_alarm	Output overcurrent fault status
+temp1_input		Measured temperature
+temp1_max		Maximum temperature limit
+temp1_max_alarm		Overtemperature warning status
+======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 419469f40ba0..32564a64e225 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -209,6 +209,24 @@ config SENSORS_LM25066_REGULATOR
 	  If you say yes here you get regulator support for National
 	  Semiconductor LM25066, LM5064, and LM5066.
 
+config SENSORS_LT3074
+	tristate "Analog Devices LT3074"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices LT3074.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called lt3074.
+
+config SENSORS_LT3074_REGULATOR
+	tristate "Regulator support for LT3074"
+	depends on SENSORS_LT3074 && REGULATOR
+	help
+	  If you say yes here you get regulator support for Analog Devices
+	  LT3074. The LT3074 is a low voltage, ultralow noise, high PSRR,
+	  dropout linear regulator. The device supplies up to 3A with a
+	  typical dropout voltage of 45mV.
+
 config SENSORS_LT7182S
 	tristate "Analog Devices LT7182S"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index c7eb7739b7f8..5ef388c10581 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
 obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
+obj-$(CONFIG_SENSORS_LT3074)	+= lt3074.o
 obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/lt3074.c b/drivers/hwmon/pmbus/lt3074.c
new file mode 100644
index 000000000000..430e3a0c0a5f
--- /dev/null
+++ b/drivers/hwmon/pmbus/lt3074.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for Analog Devices LT3074
+ *
+ * Copyright (C) 2025 Analog Devices, Inc.
+ */
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+#define LT3074_MFR_READ_VBIAS			0xc6
+#define LT3074_MFR_BIAS_OV_WARN_LIMIT		0xc7
+#define LT3074_MFR_BIAS_UV_WARN_LIMIT		0xc8
+#define LT3074_MFR_SPECIAL_ID			0xe7
+
+#define LT3074_SPECIAL_ID_VALUE			0x1c1d
+
+static const struct regulator_desc __maybe_unused lt3074_reg_desc[] = {
+	PMBUS_REGULATOR_ONE("vout"),
+};
+
+static int lt3074_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	switch (reg) {
+	case PMBUS_VIRT_READ_VMON:
+		return pmbus_read_word_data(client, page, phase,
+					   LT3074_MFR_READ_VBIAS);
+	case PMBUS_VIRT_VMON_UV_WARN_LIMIT:
+		return pmbus_read_word_data(client, page, phase,
+					   LT3074_MFR_BIAS_UV_WARN_LIMIT);
+	case PMBUS_VIRT_VMON_OV_WARN_LIMIT:
+		return pmbus_read_word_data(client, page, phase,
+					   LT3074_MFR_BIAS_OV_WARN_LIMIT);
+	default:
+		return -ENODATA;
+	}
+}
+
+static int lt3074_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	switch (reg) {
+	case PMBUS_VIRT_VMON_UV_WARN_LIMIT:
+		return pmbus_write_word_data(client, 0,
+					    LT3074_MFR_BIAS_UV_WARN_LIMIT,
+					    word);
+	case PMBUS_VIRT_VMON_OV_WARN_LIMIT:
+		return pmbus_write_word_data(client, 0,
+					    LT3074_MFR_BIAS_OV_WARN_LIMIT,
+					    word);
+	default:
+		return -ENODATA;
+	}
+}
+
+static struct pmbus_driver_info lt3074_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_VMON |
+		   PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_word_data = lt3074_read_word_data,
+	.write_word_data = lt3074_write_word_data,
+#if IS_ENABLED(CONFIG_SENSORS_LT3074_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = lt3074_reg_desc,
+#endif
+};
+
+static int lt3074_probe(struct i2c_client *client)
+{
+	int ret;
+	struct device *dev = &client->dev;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	ret = i2c_smbus_read_word_data(client, LT3074_MFR_SPECIAL_ID);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read ID\n");
+
+	if (ret != LT3074_SPECIAL_ID_VALUE)
+		return dev_err_probe(dev, -ENODEV, "ID mismatch\n");
+
+	return pmbus_do_probe(client, &lt3074_info);
+}
+
+static const struct i2c_device_id lt3074_id[] = {
+	{ "lt3074", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, lt3074_id);
+
+static const struct of_device_id lt3074_of_match[] = {
+	{ .compatible = "adi,lt3074" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lt3074_of_match);
+
+static struct i2c_driver lt3074_driver = {
+	.driver = {
+		.name = "lt3074",
+		.of_match_table = of_match_ptr(lt3074_of_match),
+	},
+	.probe = lt3074_probe,
+	.id_table = lt3074_id,
+};
+module_i2c_driver(lt3074_driver);
+
+MODULE_AUTHOR("Cedric Encarnacion <cedricjustine.encarnacion@analog.com>");
+MODULE_DESCRIPTION("PMBus driver for Analog Devices LT3074");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.39.5


