Return-Path: <linux-i2c+bounces-9581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08836A44009
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 14:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E0F189A9C8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 13:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C700F26981E;
	Tue, 25 Feb 2025 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="EiwBCsS3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D626980F;
	Tue, 25 Feb 2025 13:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488535; cv=none; b=q6vJqq9h9RA1wcI8JktU3CHRpNdveaV+MrGf5DTuEwywQhSGb38PRhZr7sPv7MPRJK8d/vjSCOJvcStMpe1QzxLv9fKElP15PSfnHzMxs8Z0NyRUgNRs9y3XQJz/Q2wRJglKwX8ryu9nYTdLqyFJAttsc4/tz/OOdISEBlLYZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488535; c=relaxed/simple;
	bh=cw4Sf8/z3PQjcTvY8TiUhKwNXxp/XRVM8wT6iEU8bsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Uw/iVWNtud0iZxbH5SDA2VIqUBViVVx9tvQRiDt5Mt6lQJB92s5vkPDCgKKyIWuuqOpNv42AD4zzJSsmi9UAo5By/S3XpVu3aUPEYDk2lvXtuHp8k44oz9i0j2Z4d/FSgzHHNXdVy/A46aw8irMDbSJ0jp/cpenDsjzMjfDZLD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=EiwBCsS3; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PAHLPd032310;
	Tue, 25 Feb 2025 08:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ep+wu
	zrL130MidAt9/Q5e/9uJw+gYh41pQb4FipikFg=; b=EiwBCsS3XjUvLiGlKIO13
	Mn4y63SF/ivvJO0CgOVvxY0c03eOI6+oD5Ge7sZWrNKFzxATaFAXpLuPyriQvl2C
	MA7gLKz+WMi9TyT6CO1fHrslEx8A1LGGenOHd1ThL/5Vt7jRBFfKtym8IKCcFwu7
	s/d0FqwoG2r67JcYBvSivBDrAysTYpoJJ9OFG99uTspekxlRQXYqDz01WG65v7GS
	AwXr90DFEGcLmPcJlhhKXjNj1XQdq9cGuMrRLxwDEL7QsK7xyOx/OD5jLE1p0sHj
	RTFKhTJX4oGPTLQufkvKw+Y+1seSp2ZWmIcHPG0iRZGEHi/ie/b8m4AggGw20PM6
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44yccapswm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 08:01:57 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 51PD1u2j015513
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 08:01:56 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 25 Feb 2025 08:01:56 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 25 Feb 2025 08:01:56 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 25 Feb 2025 08:01:56 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.88])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51PD1VXV020999;
	Tue, 25 Feb 2025 08:01:48 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Date: Tue, 25 Feb 2025 21:01:14 +0800
Subject: [PATCH v2 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250225-upstream-lt3074-v2-2-18ad10ba542e@analog.com>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
In-Reply-To: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC Chiu" <Delphine_CC_Chiu@Wiwynn.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740488492; l=9737;
 i=cedricjustine.encarnacion@analog.com; s=20250124;
 h=from:subject:message-id; bh=cw4Sf8/z3PQjcTvY8TiUhKwNXxp/XRVM8wT6iEU8bsM=;
 b=rQGG/Gr8f0o8A1DgOM6QjDIS7kp/18Jj/mHf9B9NjEK5huvIlXstdzLVtrFNoIlHH22fexQ16
 WcEMjxTNKGKB2e831ak8PMa6/hX74rsfXl0hU/Xah/DAtC/vnaFKUH0
X-Developer-Key: i=cedricjustine.encarnacion@analog.com; a=ed25519;
 pk=ZsngY3B4sfltPVR5j8+IO2Sr8Db8Ck+fVCs+Qta+Wlc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: Y55xhiQdnnys8S8gsSil5yPSVtajyXN5
X-Authority-Analysis: v=2.4 cv=SPa4VPvH c=1 sm=1 tr=0 ts=67bdbf45 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=YXy7gRrCG489l9pt98cA:9
 a=QEXdDO2ut3YA:10 a=feVPlwq_TaIA:10 a=tI3wEBspppMA:10 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-ORIG-GUID: Y55xhiQdnnys8S8gsSil5yPSVtajyXN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250090

Add hardware monitoring and regulator support for LT3074. The LT3074 is an
ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
serial interface allows telemetry for input/output voltage, bias voltage,
output current, and die temperature.

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
index 874f8fd2632520d3be489154ddd0eb7ca24fc405..54b14f571db4d3b3e0b74a12b41cf8cf0d6fe8a7 100644
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
index 4a59ee6a03919af6a48717a0ddddabc7241a9e63..be9372cf020c246586646ad240a0c0c7880800f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13693,6 +13693,8 @@ L:	linux-hwmon@vger.kernel.org
 S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
+F:	Documentation/hwmon/lt3074.rst
+F:	drivers/hwmon/pmbus/lt3074.c
 
 LTC1660 DAC DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 675b0d4703d87c9d5654489d0d770661ff0dba11..3edad8d7476cf78f4c2dfc94294013b33f2d8cae 100644
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
index c7eb7739b7f861c5c105582b57ad16937649d4cf..5ef388c105811e73d5ea943648fb2f7a7ca59010 100644
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
index 0000000000000000000000000000000000000000..a84bc5bddee7c4ae646b4fc7c5a57ed1eb233ab8
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


