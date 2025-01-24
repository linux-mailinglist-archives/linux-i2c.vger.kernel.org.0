Return-Path: <linux-i2c+bounces-9182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71EA1B931
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E855416ED30
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0FA225A30;
	Fri, 24 Jan 2025 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="w32XjBug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA301C232D;
	Fri, 24 Jan 2025 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731936; cv=none; b=AfvS44xBJAJfuBb+0wF+Md1e7eqeHHZWo3NVn2De0Qncv9nmmqoIuJvkOFk8HXPEUlpd+ESxB7oX4avTDWuNXDUMj20TdrV9aTiVSxbnUcfu2dAQJ6TeHH9CvmxnXgYng/b8IN4zyJhpK+BZtYObnSyD0afBVGmWwatohEDFyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731936; c=relaxed/simple;
	bh=32buumSOVK80UIpE/XqrStqBKVF25meDcK1+mtrllnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VNOq0OSey0rtLA64JEztdDe4GxTPqFJELgg9PVNKdsqfYdlDr3CQ8HgZuJWD5LMAim5k4ukSDmUIGFUDv6CVrJr8mp76cRmYF8VdWSGg7fmtoqehNogu7muoB0sJFps2dyhOrEVuAESWdqd7wvvIBzAjNjfL+YtumxdgVPBpddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=w32XjBug; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O9xI63025494;
	Fri, 24 Jan 2025 10:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GuzlZ
	yCfPtIcZYtr5JNSkXXkuh3eI4INJket3FDhdmw=; b=w32XjBugLaJ3Wvjrm0qT4
	w5EFnyw6dGj7XTVZ4WNHk3mEscpLUG/3vij10Kw78B3G/P0vFpSXWSBrd5JMxZjr
	JfrCe8FYOIPryiWp2kybzmiINQO0wk2kSKJBQipGRLL47P12iBHnBhVgr6/TuYVL
	8VEGch2y49jjUr5FxzkQ82eCLWj5/8/9BcS1eDzQv0XBtcVx3uHpnnyyshEPxWDw
	x85geOjVpenunvDzej4CK5BmCB9VusWl7V5lETrhbadCo55gCuAzloMKSnZu5dw/
	x5PlyjUtz/s2ZhchsWVvkS/lLCPWlAhV3GLPcf8GVP24Nu6jhJNtzAzoVEaVmnpe
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44c8qcs6sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:18:26 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 50OFIPYZ063307
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:18:25 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:18:25 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:18:25 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:18:25 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFHp0O031715;
	Fri, 24 Jan 2025 10:18:16 -0500
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
Subject: [PATCH v4 2/3] hwmon: (pmbus/adp1050): Add support for adp1051, adp1055 and ltp8800
Date: Fri, 24 Jan 2025 23:17:45 +0800
Message-ID: <20250124151746.1130-3-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
References: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: j3R_RhhOMlLTotQzKscOA71t2gSg_hZd
X-Proofpoint-ORIG-GUID: j3R_RhhOMlLTotQzKscOA71t2gSg_hZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

Introduce hardware monitoring support for the following devices:

    ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
    ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
    LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator

The ADP1051 and ADP1055 are similar digital controllers for high
efficiency DC-DC power conversion while the LTP8800 is a family of
step-down μModule regulators that provides microprocessor core voltage
from 54V power distribution architecture. All of the above components
features telemetry monitoring of input/output voltage, input current,
output power, and temperature over PMBus.

Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 Documentation/hwmon/adp1050.rst | 71 ++++++++++++++++++++++++++++++---
 drivers/hwmon/pmbus/adp1050.c   | 62 ++++++++++++++++++++++++++--
 2 files changed, 124 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/adp1050.rst b/Documentation/hwmon/adp1050.rst
index 8fa937064886..32514084fbdc 100644
--- a/Documentation/hwmon/adp1050.rst
+++ b/Documentation/hwmon/adp1050.rst
@@ -13,6 +13,32 @@ Supported chips:
 
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
@@ -21,14 +47,17 @@ Authors:
 Description
 -----------
 
-This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
-Controller for Isolated Power Supply with PMBus interface.
+This driver supports hardware monitoring for Analog Devices ADP1050, ADP1051,
+and ADP1055 Digital Controller for Isolated Power Supply with PMBus interface,
+and the LTP8800 step-down μModule regulators.
 
-The ADP1050 is an advanced digital controller with a PMBus™
+The ADP1050, ADP1051, and ADP1055 are advanced digital controllers with PMBus™
 interface targeting high density, high efficiency dc-to-dc power
-conversion used to monitor system temperatures, voltages and currents.
-Through the PMBus interface, the device can monitor input/output voltages,
-input current and temperature.
+conversion used to monitor system temperatures, voltages and currents. The
+LTP8800 is a family of step-down μModule regulators that provides microprocessor
+core voltage from 54V power distribution architecture. Through the PMBus
+interface, the device can monitor input/output voltages, input current and
+temperature.
 
 Usage Notes
 -----------
@@ -49,16 +78,46 @@ Sysfs Attributes
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
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
index ef46c880b168..2f75e8f1424d 100644
--- a/drivers/hwmon/pmbus/adp1050.c
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -23,19 +23,75 @@ static struct pmbus_driver_info adp1050_info = {
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
+};
+
 static int adp1050_probe(struct i2c_client *client)
 {
-	return pmbus_do_probe(client, &adp1050_info);
+	struct pmbus_driver_info *info;
+
+	info = i2c_get_match_data(client);
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


