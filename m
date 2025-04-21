Return-Path: <linux-i2c+bounces-10510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408AA950BD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 14:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 219C07A48FC
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 12:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A25264FBC;
	Mon, 21 Apr 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vAXODFl8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFE1258CC2;
	Mon, 21 Apr 2025 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745237948; cv=none; b=hIDb0JFMU/2GtjtDCxIeRqdqRM5Wyi9IWJlGJ2J2EESbQiRI/RgK1yZgvBNMJzdNqzDBrctyu/l99NOcoySs8/HHAg9aLZOD61xs/hn95xqvVLAbfoH8ybcEbac8prsK+qkX7xWVwpO9elqO2mzrTDdJEiuAINJyOy3k5V2NqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745237948; c=relaxed/simple;
	bh=UB+OF2gk6D2kPK7QaRmaFcBbAk39xam92S7b3o13lvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oxJyeSXfsFr5T8UISbh08IPMWG3e6xmVxXQTl6BucLcOWqDEzspjxuEzSgrnL50McYkZGVptrMZJ0F2qw6HFESvb7uFkf74zhnX08hjOCQ6UcDS1l150kEvV/9qgKf74AMLlcsZP7B59pHZhheTtuWh16/1D3egRvmSrufMK+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vAXODFl8; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8YrSj029121;
	Mon, 21 Apr 2025 08:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GYNYU
	3Qic9w7fTK6cl9iviBdzvIpkw3ukqrS/5TyI7Y=; b=vAXODFl8dTTtO/XOdZSnS
	7EzQcECRuRKa7Vck+SR4ZmjscpbkcpbCabMjfV095cDF+P1VyE5BapgMoohe1u1+
	2vYQiHwKLUM8rNXZJwnPgKx66c5M8lxyy1BVhQp1qwc6eVhSsdGVPcPk43nLXP1g
	mOttaj8IOQMQRAnY/3kr6LHwIcTPY8BDXJ0KyWl9/l2dOPYqkbFalrEmck2ZHtdW
	zG54gCRzmqxIPSC4KraHpOSQQ/DwTJAQNySQoEm8ssLf/zGL8D0NrmsskJtxGeBA
	ttpWvme2gKPHBnBBUMedBB0Qc5NQImsjG1cvra+3dWSuOBRx8B98wR+qxbz93Y19
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 464t5gd6tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 08:18:48 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 53LCIlME057769
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 08:18:47 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Apr
 2025 08:18:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Apr 2025 08:18:46 -0400
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.222.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 53LCIO2R013389;
	Mon, 21 Apr 2025 08:18:41 -0400
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Mon, 21 Apr 2025 20:18:19 +0800
Subject: [PATCH v3 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250421-upstream-lt3074-v3-2-71636322f9fe@analog.com>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
In-Reply-To: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745237904; l=9791;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=UB+OF2gk6D2kPK7QaRmaFcBbAk39xam92S7b3o13lvM=;
 b=OvJ8oIcsWt7UHzzEIctasDYJKQ9lT/wWXD26KSEoHoBUchiX9x4/wQWidkYW3CNxqo2F+KqU3
 gnzFY9tiqH/C2f6JJvbMnnOCsN0lr4ezNBMcvCfUtlsTBGVmyImWu1n
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=RaiQC0tv c=1 sm=1 tr=0 ts=680637a8 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=YXy7gRrCG489l9pt98cA:9 a=QEXdDO2ut3YA:10 a=feVPlwq_TaIA:10 a=tI3wEBspppMA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: 617BJS_3yrjYQ1-Nfl09YNDifHcS1cYG
X-Proofpoint-ORIG-GUID: 617BJS_3yrjYQ1-Nfl09YNDifHcS1cYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210095

Add hardware monitoring and regulator support for LT3074. The LT3074 is an
ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
serial interface allows telemetry for input/output voltage, bias voltage,
output current, and die temperature.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/lt3074.rst |  72 ++++++++++++++++++++++++
 MAINTAINERS                    |   2 +
 drivers/hwmon/pmbus/Kconfig    |  18 ++++++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/lt3074.c   | 122 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 216 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index da5895115724df35416b88fcd6edb13c2d5b07f2..d17f942d8535359e942ae6359374431c1976afef 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -126,6 +126,7 @@ Hardware Monitoring Kernel Drivers
    lm95234
    lm95245
    lochnagar
+   lt3074
    lt7182s
    ltc2992
    ltc2945
diff --git a/Documentation/hwmon/lt3074.rst b/Documentation/hwmon/lt3074.rst
new file mode 100644
index 0000000000000000000000000000000000000000..234f369153cf1374b8c7eaa2ed93358ac141fdf9
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
diff --git a/MAINTAINERS b/MAINTAINERS
index cfbf4dca400e03fcfa34ac78051fdcd815477799..cc61b2dfa0bee28a35bb9e0200095f549b557a73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13989,6 +13989,8 @@ L:	linux-hwmon@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
+F:	Documentation/hwmon/lt3074.rst
+F:	drivers/hwmon/pmbus/lt3074.c
 
 LTC1660 DAC DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index c9b3c314998234e639db1770c18c6f75fa037d25..441f984a859dd935e5248793f1bf54204ce2c371 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -218,6 +218,24 @@ config SENSORS_LM25066_REGULATOR
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
index 56f128c4653e3087ecd3c2fd859bb0bd9ff10a3d..29cd8a3317d29f85113b6a79904d0d8cb48fc61b 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
 obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
+obj-$(CONFIG_SENSORS_LT3074)	+= lt3074.o
 obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/lt3074.c b/drivers/hwmon/pmbus/lt3074.c
new file mode 100644
index 0000000000000000000000000000000000000000..3704dbe7b54ab8beaf0965463fe6400207d0bb98
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
+	PMBUS_REGULATOR_ONE("regulator"),
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
+static const struct of_device_id __maybe_unused lt3074_of_match[] = {
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


