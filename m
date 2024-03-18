Return-Path: <linux-i2c+bounces-2383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426087E88D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 12:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB63281A5A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 11:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369C364B1;
	Mon, 18 Mar 2024 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="il4MznEJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC4374F5;
	Mon, 18 Mar 2024 11:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710761178; cv=none; b=m10qUpuLO48Y7MXJMVaFP6g56v/JT+w62tlCS1aN+z6bylNlMF00MkRgXDR7qoL4A4zxztgNdyqoErMLL/IX8G5CglusMTp7W7mEYYQa6abEGHh1J8XHf4ApaAkTHc0RQfM3GYKOuOgeTjAjeMM3I+x9/xvm5T1KB85AB/0zrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710761178; c=relaxed/simple;
	bh=8a1nCeDjqC804GfswWli2fkpfB47VHrVBxuSJr2BE8I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbKI00JsQqsnC3aNvOx4gvs4RV2Iuik/MkVUYROeKnrmlYAZ4AOAJvQ7Ew719SHr5XKX6JqmU2yTOTypKB0ZJLHKySrqO3GUmnfCIbKHv6S7tvtpHNgTExKOWEQ9jlJIkTh9HKDo+3tcXWlH/zo4hN+85LC16OioiHNWVtckoC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=il4MznEJ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42IB1KXa010682;
	Mon, 18 Mar 2024 07:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=DKIM;
	 bh=T1PJyZSoX4E14pQrG3QMpVlK7FB+sxJRC2YYYfUFwDg=; b=il4MznEJ1ntP
	DebEDS5OF44M/3RRjAiVwN22rH/IAP7BE2q5lF4GUaTjcATxRbLB2qYQStzE/aeI
	UuhU+hGhQJugHsSKz96COScszUnvR5Fd+XBO92Mzo/4uVV6anlARaOFAZ9mnqR6C
	vqh6R0AqgaKv5dzPhez+iuBg0X4Se946XShhtItLsF1BmhNHwRYqUzJncFfaYR1O
	2fs1pMwf/vudsGH3njHFqvVvaVoCAFNqq3aW4toc2PGnz4MqUs5IkJkIstPdNAXI
	tGaV06SPQss3khVhJwNqbqG1inOARmOM9U6tmYnY3HCuZj3ukZCXScRfWvzU1eRr
	Pt7B346MVg==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wxecys6v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 07:23:19 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 42IBNIVi030106
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Mar 2024 07:23:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Mar 2024 07:23:17 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Mar 2024 07:23:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 18 Mar 2024 07:23:16 -0400
Received: from radu.ad.analog.com ([10.48.65.243])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 42IBMkMe030326;
	Mon, 18 Mar 2024 07:23:09 -0400
From: Radu Sabau <radu.sabau@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Radu Sabau <radu.sabau@analog.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Date: Mon, 18 Mar 2024 13:21:35 +0200
Message-ID: <20240318112140.385244-3-radu.sabau@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318112140.385244-1-radu.sabau@analog.com>
References: <20240318112140.385244-1-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: L6z5Vj1GKpuRP24LYMw0XTwe7RcxZssI
X-Proofpoint-GUID: L6z5Vj1GKpuRP24LYMw0XTwe7RcxZssI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_02,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180085

Add support for ADP1050 Digital Controller for Isolated Power Supplies
with PMBus interface Voltage, Current and Temperature Monitor.

The ADP1050 implements several features to enable a robust
system of parallel and redundant operation for customers who
require high availability. The device can measure voltage,
current and temperature that can be used in different
techniques to identify and safely shut down an erroneous
power supply in parallel operation mode.

Signed-off-by: Radu Sabau <radu.sabau@analog.com>
---
 Documentation/hwmon/adp1050.rst |  69 ++++++++++++++++++++
 Documentation/hwmon/index.rst   |   1 +
 drivers/hwmon/pmbus/Kconfig     |  10 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/adp1050.c   | 111 ++++++++++++++++++++++++++++++++
 5 files changed, 192 insertions(+)
 create mode 100644 Documentation/hwmon/adp1050.rst
 create mode 100644 drivers/hwmon/pmbus/adp1050.c

diff --git a/Documentation/hwmon/adp1050.rst b/Documentation/hwmon/adp1050.rst
new file mode 100644
index 000000000000..e3e5bb650a51
--- /dev/null
+++ b/Documentation/hwmon/adp1050.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver adp1050
+=====================
+
+Supported chips:
+
+  * Analog Devices ADP1050
+
+    Prefix: 'adp1050'
+
+    Addresses scanned: I2C 0x70 - 0x77
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-
+sheets/ADP1050.pdf
+
+Authors:
+
+  - Radu Sabau <radu.sabau@analog.com>
+
+
+Description
+-----------
+
+This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
+Controller for Isolated Power Supply with PMBus interface.
+
+The ADP1050 is an advanced digital controller with a PMBus™
+interface targeting high density, high efficiency dc-to-dc power
+conversion used to monitor system temperatures, voltages and currents.
+Through the PMBus interface, the device can monitor input/output voltages,
+input current and temperature.
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate
+the devices explicitly.
+Please see Documentation/i2c/instantiating-devices.rst for details.
+
+The vin scale monitor value and iin scale monitor value can be
+configured by a device tree property;see
+Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml for details
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+Sysfs Attributes
+----------------
+
+================= ========================================
+in1_label         "vin"
+in1_input         Measured input voltage
+in1_alarm	  Input voltage alarm
+in2_label	  "vout1"
+in2_input	  Measured output voltage
+in2_crit	  Critical maximum output voltage
+in2_crit_alarm    Output voltage high alarm
+in2_lcrit	  Critical minimum output voltage
+in2_lcrit_alarm	  Output voltage critical low alarm
+curr1_label	  "iin"
+curr1_input	  Measured input current.
+curr1_alarm	  Input current alarm
+temp1_input       Measured temperature
+temp1_crit	  Critical high temperature
+temp1_crit_alarm  Chip temperature critical high alarm
+================= ========================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1ca7a4fe1f8f..9a4fd576e6f6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -33,6 +33,7 @@ Hardware Monitoring Kernel Drivers
    adm1266
    adm1275
    adm9240
+   adp1050
    ads7828
    adt7410
    adt7411
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 557ae0c414b0..38e794d83cc3 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -57,6 +57,16 @@ config SENSORS_ADM1275
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
 
+config SENSORS_ADP1050
+	tristate "Analog Devices ADP1050 digital controller for Power Supplies"
+	help
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices ADP1050 digital controller for isolated power supply with
+	  PMBus interface.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called adp1050.
+
 config SENSORS_BEL_PFE
 	tristate "Bel PFE Compatible Power Supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f14ecf03ad77..95a8dea5e5ed 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ACBEL_FSG032) += acbel-fsg032.o
 obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+obj-$(CONFIG_SENSORS_ADP1050)	+= adp1050.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
 obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
new file mode 100644
index 000000000000..53198d858156
--- /dev/null
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for Analog Devices ADP1050
+ *
+ * Copyright (C) 2024 Analog Devices, Inc.
+ */
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include "pmbus.h"
+
+#define ADP1050_CHIP_PASSWORD		0xD7
+
+#define ADP1050_VIN_SCALE_MONITOR	0xD8
+#define ADP1050_IIN_SCALE_MONITOR	0xD9
+
+static struct pmbus_driver_info adp1050_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_IIN | PMBUS_HAVE_TEMP
+		| PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int adp1050_probe(struct i2c_client *client)
+{
+	u32 vin_scale_monitor, iin_scale_monitor;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_WRITE_WORD_DATA))
+		return -ENODEV;
+
+	/* Unlock CHIP's password in order to be able to read/write to it's
+	 * VIN_SCALE and IIN_SCALE registers.
+	*/
+	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
+	if (ret < 0) {
+		dev_err_probe(&client->dev, "Device can't be unlocked.\n");
+		return ret;
+	}
+
+	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
+	if (ret < 0) {
+		dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
+		return ret;
+	}
+
+	/* If adi,vin-scale-monitor isn't set or is set to 0 means that the
+	 * VIN monitor isn't used, therefore 0 is used as scale in order
+	 * for the readings to return 0.
+	*/
+	if (device_property_read_u32(&client->dev, "adi,vin-scale-monitor",
+				     &vin_scale_monitor))
+		vin_scale_monitor = 0;
+
+	/* If adi,iin-scale-monitor isn't set or is set to 0 means that the
+	 * IIN monitor isn't used, therefore 0 is used as scale in order
+	 * for the readings to return 0.
+	*/
+	if (device_property_read_u32(&client->dev, "adi,iin-scale-monitor",
+				     &iin_scale_monitor))
+		iin_scale_monitor = 0;
+
+	ret = i2c_smbus_write_word_data(client, ADP1050_VIN_SCALE_MONITOR,
+					vin_scale_monitor);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_word_data(client, ADP1050_IIN_SCALE_MONITOR,
+					iin_scale_monitor);
+	if (ret < 0)
+		return ret;
+
+	return pmbus_do_probe(client, &adp1050_info);
+}
+
+static const struct i2c_device_id adp1050_id[] = {
+	{"adp1050", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, adp1050_id);
+
+static const struct of_device_id adp1050_of_match[] = {
+	{ .compatible = "adi,adp1050"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, adp1050_of_match);
+
+static struct i2c_driver adp1050_driver = {
+	.driver = {
+		.name = "adp1050",
+		.of_match_table = of_match_ptr(adp1050_of_match),
+	},
+	.probe = adp1050_probe,
+	.id_table = adp1050_id,
+};
+module_i2c_driver(adp1050_driver);
+
+MODULE_AUTHOR("Radu Sabau <radu.sabau@analog.com>");
+MODULE_DESCRIPTION("Analog Devices ADP1050 HWMON PMBus Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.34.1


