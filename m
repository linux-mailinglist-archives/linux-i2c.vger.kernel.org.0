Return-Path: <linux-i2c+bounces-7650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3F9B4A88
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 14:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF0EA1C20BE4
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FEC206942;
	Tue, 29 Oct 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HIunJIS5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928FE567;
	Tue, 29 Oct 2024 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206968; cv=none; b=G/S4b4TlwJcUv/ExCvbYPhGh0QV/SL62O/s9CfhlFlGz7qqBFaJo6FgXHPGc3mTIKZei+jwpyDx9yN0vlXGvwBYACG6skc4x1CwfI2Ehv3vXDRE9nfJRyMlCruu2Q4yOLOjN9VDj+b0D/oGUJNKbssSbxwqJ+kLYK7hhpxvYGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206968; c=relaxed/simple;
	bh=N1gJA/dpHr4t/PH3Y2x4CvPcqruek0d8/FGA2eBb3gg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvdnZltbDXS2rVsYXu6KiXZtN/NzwpmsU6nf/X/1ZJYBHvcClckbG53oM5x70erhS54ZDgd9GpiSd1y5rXTkZOsbCxiGzcTvHGT9RmN1tt8ICgqrxuOq59IrEACqOcjd4MSwZ20Xn7fyOS0IDZkdhDbPA10E98TqgaDP9y6CcTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HIunJIS5; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T8FScA008270;
	Tue, 29 Oct 2024 09:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Zfupk
	bLZLubG9XhWIi41UGU+dVBGzGjBp3p4nbAM28s=; b=HIunJIS5lVZ9/bm28omc2
	Z3Nkl0yQhuAMtKowuKfVTTmG/Yi7lVqmtObfApOgSCR5yI+7BcxcBIB9rBscCzxM
	IaLwIU03ADrmvMahAZeR6j/Za96rFKymv8s+z7PnXN3d+YKO/Tl+8eE/43Ad8ZXl
	xrGGESls1up6KqPxT0czcJoTEMdYHwDX1X3uvb3z7Lm4xGI3Urdaur0XYocx+UL9
	nb0crx925BERGrJlRmRgatnmJgBsOrlX+rrqxkuOss1eXNxbGWmFUdYnDQ+hOClR
	z6AehkHXzNB+tXNiQylJRd+iECz05ctrXGHCkQVEf0DkNrKJUX5xTtGxoj3zNec0
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42jv1p96ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 09:02:16 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49TD2Fr3016581
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 09:02:15 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 29 Oct 2024 09:02:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 29 Oct 2024 09:02:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 29 Oct 2024 09:02:14 -0400
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.108])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49TD1hWZ019740;
	Tue, 29 Oct 2024 09:02:06 -0400
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter
 Yin <peteryin.openbmc@gmail.com>,
        Noah Wang <noahwang.wang@outlook.com>, "Marek Vasut" <marex@denx.de>,
        Lukas Wunner <lukas@wunner.de>,
        Cedric
 Encarnacion <cedricjustine.encarnacion@analog.com>
Subject: [PATCH 2/2] hwmon: pmbus: add driver for ltp8800-1a, ltp8800-4a, and ltp8800-2
Date: Tue, 29 Oct 2024 21:01:37 +0800
Message-ID: <20241029130137.31284-3-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029130137.31284-1-cedricjustine.encarnacion@analog.com>
References: <20241029130137.31284-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: kp-sNMqLvtnLaqzw3sIb8mUe5Dgxo0-q
X-Proofpoint-ORIG-GUID: kp-sNMqLvtnLaqzw3sIb8mUe5Dgxo0-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290099

LTP8800-1A 54V, 150A DC/DC µModule Regulator with PMBus Interface
LTP8800-4A 54V, 200A DC/DC µModule Regulator with PMBus Interface
LTP8800-2 54V, 135A DC/DC μModule Regulator with PMBus Interface

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/ltp8800.rst | 103 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   2 +
 drivers/hwmon/pmbus/Kconfig     |  18 ++++++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ltp8800.c   |  74 +++++++++++++++++++++++
 6 files changed, 199 insertions(+)
 create mode 100644 Documentation/hwmon/ltp8800.rst
 create mode 100644 drivers/hwmon/pmbus/ltp8800.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 4d15664bc41e..d51960f58e43 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -136,6 +136,7 @@ Hardware Monitoring Kernel Drivers
    ltc4261
    ltc4282
    ltc4286
+   ltp8800
    max127
    max15301
    max16064
diff --git a/Documentation/hwmon/ltp8800.rst b/Documentation/hwmon/ltp8800.rst
new file mode 100644
index 000000000000..dea73f60c3d7
--- /dev/null
+++ b/Documentation/hwmon/ltp8800.rst
@@ -0,0 +1,103 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver ltp8800
+=====================
+
+Supported chips:
+
+	* Analog Devices LTP8800-1A
+
+		Prefix: 'ltp8800-1a'
+
+		Addresses scanned: I2C 0x40 - 0x4F
+
+		Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-1a.pdf
+
+	* Analog Devices LTP8800-4A
+
+		Prefix: 'ltp8800-4a'
+
+		Addresses scanned: I2C 0x40 - 0x4F
+
+		Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-4a.pdf
+
+	* Analog Devices LTP8800-2
+
+		Prefix: 'ltp8800-2'
+
+		Addresses scanned: I2C 0x40 - 0x4F
+
+		Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-2.pdf
+
+Authors:
+		- Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
+
+
+Description
+-----------
+
+The LTP8800 is a family of step-down μModule regulators that provides
+microprocessor core voltage from 54V power distribution architecture. LTP8800
+features telemetry monitoring of input/output voltage, input current, output
+power, and temperature over PMBus.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data. Please see
+Documentation/hwmon/pmbus.rst for details.
+
+Sysfs Attributes
+----------------
+
+======================= ===========================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_crit		Critical maximum current
+curr1_crit_alarm	Current critical high alarm
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_lcrit		Critical minimum current
+curr2_crit		Critical maximum current
+curr2_max		Maximum output current
+curr2_alarm		Current alarm
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_lcrit		Critical minimum input voltage
+in1_lcrit_alarm		Input voltage critical low alarm
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in2_label		"vout1"
+in2_input		Measured output voltage
+in2_lcrit		Critical minimum output voltage
+in2_lcrit_alarm		Output voltage critical low alarm
+in2_crit		Critical maximum output voltage
+in2_crit_alarm		Output voltage critical high alarm
+in2_max			Maximum output voltage
+in2_max_alarm		Output voltage high alarm
+in2_min			Minimum output voltage
+in2_min_alarm		Output voltage low alarm
+
+power1_label		"pout1"
+power1_input		Measured output power
+power1_crit		Critical maximum output power
+
+temp1_input		Measured temperature
+temp1_lcrit		Critical low temperature
+temp1_lcrit_alarm		Chip temperature critical low alarm
+temp1_crit		Critical high temperature
+temp1_crit_alarm		Chip temperature critical high alarm
+======================= ===========================
diff --git a/MAINTAINERS b/MAINTAINERS
index a6abf7243b94..5e7df53eb4a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13559,6 +13559,8 @@ LTP8800 HARDWARE MONITOR DRIVER
 M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
+F:	Documentation/hwmon/ltp8800.rst
+F:	drivers/hwmon/pmbus/ltp8800.c
 
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a4f02cad92fd..33e6da249ac8 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -247,6 +247,24 @@ config SENSORS_LTC4286
 	  If you say yes here you get hardware monitoring support for Analog
 	  Devices LTC4286.
 
+config SENSORS_LTP8800
+	tristate "Analog Devices LTP8800 and compatibles"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices LTP8800-1A, LTP8800-4A, and LTP8800-2.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ltp8800.
+
+config SENSORS_LTP8800_REGULATOR
+	bool "Regulator support for LTP8800 and compatibles"
+	depends on SENSORS_LTP8800 && REGULATOR
+	help
+	  If you say yes here you get regulator support for Analog Devices
+	  LTP8800-1A, LTP8800-4A, and LTP8800-2. LTP8800 is a family of DC/DC
+	  µModule regulators that can provide microprocessor power from 54V
+	  power distribution architecture.
+
 config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d00bcc758b97..aa5bbdb4a806 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
 obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
+obj-$(CONFIG_SENSORS_LTP8800)	+= ltp8800.o
 obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
 obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
diff --git a/drivers/hwmon/pmbus/ltp8800.c b/drivers/hwmon/pmbus/ltp8800.c
new file mode 100644
index 000000000000..a377f2e2b001
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltp8800.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for Analog Devices LTP8800
+ *
+ * Copyright (C) 2024 Analog Devices, Inc.
+ */
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include "pmbus.h"
+
+static const struct regulator_desc ltp8800_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+
+static struct pmbus_driver_info ltp8800_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		   PMBUS_HAVE_POUT,
+};
+
+static int ltp8800_probe(struct i2c_client *client)
+{
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	if (IS_ENABLED(CONFIG_SENSORS_LTP8800_REGULATOR)) {
+		ltp8800_info.num_regulators = 1;
+		ltp8800_info.reg_desc = ltp8800_reg_desc;
+	}
+
+	return pmbus_do_probe(client, &ltp8800_info);
+}
+
+static const struct i2c_device_id ltp8800_id[] = {
+	{"ltp8800-1a", 0},
+	{"ltp8800-2", 0},
+	{"ltp8800-4a", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ltp8800_id);
+
+static const struct of_device_id ltp8800_of_match[] = {
+	{ .compatible = "adi,ltp8800-1a"},
+	{ .compatible = "adi,ltp8800-2"},
+	{ .compatible = "adi,ltp8800-4a"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, ltp8800_of_match);
+
+static struct i2c_driver ltp8800_driver = {
+	.driver = {
+		.name = "ltp8800",
+		.of_match_table = ltp8800_of_match,
+	},
+	.probe = ltp8800_probe,
+	.id_table = ltp8800_id,
+};
+module_i2c_driver(ltp8800_driver);
+
+MODULE_AUTHOR("Cedric Encarnacion <cedricjustine.encarnacion@analog.com>");
+MODULE_DESCRIPTION("Analog Devices LTP8800 HWMON PMBus Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.39.2


