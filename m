Return-Path: <linux-i2c+bounces-8072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E29D32D5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 04:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901EC284139
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 03:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5212157485;
	Wed, 20 Nov 2024 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="m0+L+/wt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97728EC;
	Wed, 20 Nov 2024 03:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732075177; cv=none; b=GjH02s3yKrqazn+9Vs7w/RVSIrvBU8jIcNUN2duXN4j5PfCARB/LeanHQCsoPYz/fP6gDOTK0s2MQsDOUupcu+NQq951uEaLolzrxAy3ZeHm7UgBSsYKmFdAJtBVzH8972c9MXUplF14eOIuQ9xKLNbP4iVkxcvjc5X9x3Soei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732075177; c=relaxed/simple;
	bh=L4BQOlXzuhvBlV5KoHAUaNDGvnI3BSXwS4K7465biDo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ds1O8zeUOwMvSwxRyA11vk0NtCKny+ia2CehcaDrkOPqu2VC5oysJs7KJNKQIAI8NWnV4oeVk9N8GGCUCIWO6MkbzZ4ypNDpLcLvgsabc0rG2ARStuqJTHXW9nS6cKM4YrR+McWZZMiJm+B/IsDxZZuG2zB8mToZ7MDpmJMvfx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=m0+L+/wt; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK2RDe3015514;
	Tue, 19 Nov 2024 22:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=51j9P
	F4GSrv8m/Vt1BlPJYx3NPN6VSLCHBiJOrzh6hY=; b=m0+L+/wtmQ/nCP6IhtNZc
	qGIF2+GHHsewA6YDjLei+U+NpbHLaxmZKyNoPB57ccKr2FphD1yMGCO/OJGREnln
	FU/v/cQXgdRUswcVtW1w9Doc2fSByru76ROf1vU0Ab7A29/T6gOx/XrUCmiJGbJS
	29GyfacxwurnQyBIyyhsP6zsdxBGg4HqE0NKdC40TWOBeMhZPiz6uOW3vGFe2ClS
	VaA8GH2OFjprAuvJ9CQ0gMxl7DknGKvUT5lkBUYdr9KF4mTrFFBykheZIXcX9Aml
	/CWiGIwNUzzb5tTfH7tTMVVn7TaWKQQV4nEXN6NxkgwbMAj4SvMLmsh3xf8uN+U/
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 43170framm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 22:59:10 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4AK3x9jQ029657
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Nov 2024 22:59:09 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Nov 2024 22:59:09 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 19 Nov 2024 22:59:09 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 19 Nov 2024 22:59:09 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.116.39.203])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4AK3wWZl027365;
	Tue, 19 Nov 2024 22:58:59 -0500
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
        "Radu
 Sabau" <radu.sabau@analog.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051, adp1055 and ltp8800
Date: Wed, 20 Nov 2024 11:58:26 +0800
Message-ID: <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: lcKxszCKuCocugpeOefSo9PcNzemEhXb
X-Proofpoint-ORIG-GUID: lcKxszCKuCocugpeOefSo9PcNzemEhXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200028

    ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
    ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
    LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator

The LTP8800 is a family of step-down μModule regulators that provides
microprocessor core voltage from 54V power distribution architecture.
LTP8800 features telemetry monitoring of input/output voltage, input
current, output power, and temperature over PMBus.

Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/adp1050.rst | 63 +++++++++++++++++++++++++++--
 drivers/hwmon/pmbus/Kconfig     |  9 +++++
 drivers/hwmon/pmbus/adp1050.c   | 72 +++++++++++++++++++++++++++++++--
 3 files changed, 137 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/adp1050.rst b/Documentation/hwmon/adp1050.rst
index 8fa937064886..1692373ee5af 100644
--- a/Documentation/hwmon/adp1050.rst
+++ b/Documentation/hwmon/adp1050.rst
@@ -13,18 +13,43 @@ Supported chips:
 
     Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADP1050.pdf
 
+  * Analog Devices ADP1051
+
+    Prefix: 'adp1051'
+
+    Addresses scanned: I2C 0x70 - 0x77
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADP1051.pdf
+
+  * Analog Devices ADP1055
+
+    Prefix: 'adp1055'
+
+    Addresses scanned: I2C 0x4B - 0x77
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADP1055.pdf
+
+  * Analog Devices LTP8800-1A/-2/-4A
+
+    Prefix: 'ltp8800'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/LTP8800-1A.pdf
+         https://www.analog.com/media/en/technical-documentation/data-sheets/LTP8800-2.pdf
+         https://www.analog.com/media/en/technical-documentation/data-sheets/LTP8800-4A.pdf
+
 Authors:
 
   - Radu Sabau <radu.sabau@analog.com>
 
-
 Description
 -----------
 
-This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
-Controller for Isolated Power Supply with PMBus interface.
+This driver supports hardware monitoring for Analog Devices ADP1050, ADP1051, and
+ADP1055 Digital Controller for Isolated Power Supply with PMBus interface.
 
-The ADP1050 is an advanced digital controller with a PMBus™
+The ADP105X is an advanced digital controller with a PMBus™
 interface targeting high density, high efficiency dc-to-dc power
 conversion used to monitor system temperatures, voltages and currents.
 Through the PMBus interface, the device can monitor input/output voltages,
@@ -49,16 +74,46 @@ Sysfs Attributes
 in1_label         "vin"
 in1_input         Measured input voltage
 in1_alarm	  Input voltage alarm
+in1_crit          Critical maximum input voltage
+in1_crit_alarm    Input voltage high alarm
+in1_lcrit         Critical minimum input voltage
+in1_lcrit_alarm   Input voltage critical low alarm
 in2_label	  "vout1"
 in2_input	  Measured output voltage
 in2_crit	  Critical maximum output voltage
 in2_crit_alarm    Output voltage high alarm
 in2_lcrit	  Critical minimum output voltage
 in2_lcrit_alarm	  Output voltage critical low alarm
+in2_max           Critical maximum output voltage
+in2_max_alarm     Output voltage critical max alarm
+in2_min           Critical minimum output voltage
+in2_min_alarm     Output voltage critical min alarm
 curr1_label	  "iin"
 curr1_input	  Measured input current.
 curr1_alarm	  Input current alarm
+curr1_crit        Critical maximum input current
+curr1_crit_alarm  Input current high alarm
+curr2_label       "iout1"
+curr2_input       Measured output current
+curr2_alarm	  Output current alarm
+curr2_crit        Critical maximum output current
+curr2_crit_alarm  Output current high alarm
+curr2_lcrit       Critical minimum output current
+curr2_lcrit_alarm Output current critical low alarm
+curr2_max         Critical maximum output current
+curr2_max_alarm   Output current critical max alarm
+power1_label      "pout1"
+power1_input      Measured output power
+power1_crit       Critical maximum output power
+power1_crit_alarm Output power high alarm
 temp1_input       Measured temperature
 temp1_crit	  Critical high temperature
 temp1_crit_alarm  Chip temperature critical high alarm
+temp1_max         Critical maximum temperature
+temp1_max_alarm   Temperature critical max alarm
+temp2_input       Measured temperature
+temp2_crit        Critical high temperature
+temp2_crit_alarm  Chip temperature critical high alarm
+temp2_max         Critical maximum temperature
+temp2_max_alarm   Temperature critical max alarm
 ================= ========================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f6d352841953..5d03a307824e 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -67,6 +67,15 @@ config SENSORS_ADP1050
 	  This driver can also be built as a module. If so, the module will
 	  be called adp1050.
 
+config SENSORS_ADP1050_REGULATOR
+	bool "Regulator support for ADP1050 and compatibles"
+	depends on SENSORS_ADP1050 && REGULATOR
+	help
+	  If you say yes here you get regulator support for Analog Devices
+	  LTP8800-1A, LTP8800-4A, and LTP8800-2. LTP8800 is a family of DC/DC
+	  µModule regulators that can provide microprocessor power from 54V
+	  power distribution architecture.
+
 config SENSORS_BEL_PFE
 	tristate "Bel PFE Compatible Power Supplies"
 	help
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
index 20f22730fc01..46f2dda8adbb 100644
--- a/drivers/hwmon/pmbus/adp1050.c
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -11,6 +11,12 @@
 
 #include "pmbus.h"
 
+#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
+static const struct regulator_desc adp1050_reg_desc[] = {
+	PMBUS_REGULATOR_ONE("vout"),
+};
+#endif /* CONFIG_SENSORS_ADP1050_REGULATOR */
+
 static struct pmbus_driver_info adp1050_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -23,19 +29,79 @@ static struct pmbus_driver_info adp1050_info = {
 		| PMBUS_HAVE_STATUS_TEMP,
 };
 
+static struct pmbus_driver_info adp1051_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN
+		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT
+		| PMBUS_HAVE_TEMP
+		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_STATUS_TEMP,
+};
+
+static struct pmbus_driver_info adp1055_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN
+		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT
+		| PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3
+		| PMBUS_HAVE_POUT
+		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_STATUS_TEMP,
+};
+
+static struct pmbus_driver_info ltp8800_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN
+		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT
+		| PMBUS_HAVE_TEMP
+		| PMBUS_HAVE_POUT
+		| PMBUS_HAVE_STATUS_VOUT
+		| PMBUS_HAVE_STATUS_INPUT
+		| PMBUS_HAVE_STATUS_TEMP,
+#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = adp1050_reg_desc,
+#endif
+};
+
 static int adp1050_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, &adp1050_info);
+	const struct pmbus_driver_info *info;
+
+	info = device_get_match_data(&client->dev);
+	if (!info)
+		return -ENODEV;
+
+	return pmbus_do_probe(client, info);
 }
 
 static const struct i2c_device_id adp1050_id[] = {
-	{"adp1050"},
+	{ .name = "adp1050", .driver_data = (kernel_ulong_t)&adp1050_info},
+	{ .name = "adp1051", .driver_data = (kernel_ulong_t)&adp1051_info},
+	{ .name = "adp1055", .driver_data = (kernel_ulong_t)&adp1055_info},
+	{ .name = "ltp8800", .driver_data = (kernel_ulong_t)&ltp8800_info},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, adp1050_id);
 
 static const struct of_device_id adp1050_of_match[] = {
-	{ .compatible = "adi,adp1050"},
+	{ .compatible = "adi,adp1050", .data = &adp1050_info},
+	{ .compatible = "adi,adp1051", .data = &adp1051_info},
+	{ .compatible = "adi,adp1055", .data = &adp1055_info},
+	{ .compatible = "adi,ltp8800", .data = &ltp8800_info},
 	{}
 };
 MODULE_DEVICE_TABLE(of, adp1050_of_match);
-- 
2.39.5


