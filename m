Return-Path: <linux-i2c+bounces-7816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC19BDD77
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 04:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266C41F21BBF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 03:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B25190054;
	Wed,  6 Nov 2024 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="MUeqXu0i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31B18FDC9;
	Wed,  6 Nov 2024 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730862624; cv=none; b=poub4bxtwbwOwbTlHmtF8B+5o0c5CBmvUPNiyRzvUqh8FttnkxKMPIx71ZZ1zuSEwcnDWtjO2NL3JcSrKiROb+bhEZjQDPyqgnPcb0I6TUTYdNFftLFYIcaNHNvusVHJ/TBltinqnqHqvAciyU5fM1EILNQM5yt5JoW5y/nXi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730862624; c=relaxed/simple;
	bh=z4gRBfeqNQhlG/Y72GYPgIzaTCuNNUTS0gnD6RalmdY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRa2wDsQf8lbljHdm1FbAYiWi8lpEzEZJ5A9FN70herxuRZoCaNuevPfH4HrlosiY8lI8yDda3n/v5YY7RmzhYvxquvqjcJGy5B6VjggIlb0iDtPHXS6gxyQACZOcvNEiyq4w6xpYfP21ImrV7u9MVhiV+4sJvCd4QH80V1O2LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=MUeqXu0i; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A60fj6v032302;
	Tue, 5 Nov 2024 22:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=sDRtF
	DfsWzEuR2JUjzWIJxszo2LAZaNghdBg0hwVPbc=; b=MUeqXu0iCtJrYIhneQLZK
	FAVUFinuXvSssiBM1ydOo6yGZTptjOTJku0noAlUBgt+xIXNI7xOLdjkyccT9l7L
	iOP/jc51IfJccoIMKFYJH4VLdyjdCU6ZwenQa225GRrneAGLvjoGt+VG14bA7t2H
	3NLSbONRsMzguO0iPLloDXvWJ/00QoPxsHIxAOINI9EvipjV9tZTCsrh1uIU3VxS
	VJpeborxFj++Pe0clfBgx8wcklZlPBcFb+2JldtA9dy/2CR6/TMkqnzybKevWUFn
	WF0u+yZOwxJn50MYoYm0bOOIv8SGk5A6hMG00K264jsPtWOFJg/6BgVw/2UdN3IB
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42qf1dceg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 22:10:02 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 4A63A0Ya012178
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 22:10:00 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 5 Nov 2024
 22:10:00 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 5 Nov 2024 22:10:00 -0500
Received: from CENCARNA-L02.ad.analog.com ([10.117.116.147])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4A639R2w010682;
	Tue, 5 Nov 2024 22:09:50 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Yin
	<peteryin.openbmc@gmail.com>,
        Noah Wang <noahwang.wang@outlook.com>, Marek
 Vasut <marex@denx.de>,
        Lukas Wunner <lukas@wunner.de>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>
Subject: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a, ltp8800-4a, and ltp8800-2
Date: Wed, 6 Nov 2024 11:09:18 +0800
Message-ID: <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: RwnWN_ZMVJWd6_SKJJ0PLZF5xt-45zud
X-Proofpoint-GUID: RwnWN_ZMVJWd6_SKJJ0PLZF5xt-45zud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060023

LTP8800-1A 54V, 150A DC/DC µModule Regulator with PMBus Interface
LTP8800-4A 54V, 200A DC/DC µModule Regulator with PMBus Interface
LTP8800-2 54V, 135A DC/DC μModule Regulator with PMBus Interface

The LTP8800 is a family of step-down μModule regulators that provides
microprocessor core voltage from 54V power distribution architecture. It
features telemetry monitoring of input/output voltage, input current,
output power, and temperature over PMBus.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/ltp8800.rst | 91 +++++++++++++++++++++++++++++++++
 MAINTAINERS                     |  2 +
 drivers/hwmon/pmbus/Kconfig     | 18 +++++++
 drivers/hwmon/pmbus/Makefile    |  1 +
 drivers/hwmon/pmbus/ltp8800.c   | 63 +++++++++++++++++++++++
 6 files changed, 176 insertions(+)
 create mode 100644 Documentation/hwmon/ltp8800.rst
 create mode 100644 drivers/hwmon/pmbus/ltp8800.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 55f1111594b2..8e6799824859 100644
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
index 000000000000..bbe1b4a7c827
--- /dev/null
+++ b/Documentation/hwmon/ltp8800.rst
@@ -0,0 +1,91 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver ltp8800
+=====================
+
+Supported chips:
+
+  * Analog Devices LTP8800-1A, LTP8800-2, LTP8800-4A
+
+    Prefix: 'ltp8800'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-1a.pdf
+
+         https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-2.pdf
+
+         https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-4a.pdf
+
+Authors:
+    - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
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
index 6ca691500fb7..a5d1bd61fc2c 100644
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
index f6d352841953..264c73275d86 100644
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
index 000000000000..d57f8c058a89
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltp8800.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for Analog Devices LTP8800
+ *
+ * Copyright (C) 2024 Analog Devices, Inc.
+ */
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
+#if IS_ENABLED(CONFIG_SENSORS_LTP8800_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = ltp8800_reg_desc,
+#endif
+};
+
+static int ltp8800_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &ltp8800_info);
+}
+
+static const struct i2c_device_id ltp8800_id[] = {
+	{"ltp8800", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ltp8800_id);
+
+static const struct of_device_id ltp8800_of_match[] = {
+	{ .compatible = "adi,ltp8800"},
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
2.39.5


