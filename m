Return-Path: <linux-i2c+bounces-8574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E79F5478
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 18:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A7AF7A42AF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 17:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411CB1FA270;
	Tue, 17 Dec 2024 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HJOJCmSk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D51F8666;
	Tue, 17 Dec 2024 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456987; cv=none; b=ZkQX+PbqI2klJ9bjXMI9rF3xjl2V2EXvhhRb/KpPZQVtPrYWj6+xltfo/c5eCZDxcFEU5tRJVm5RxGU8nHGzGG1POX9Yk9yZ1hhwTKSR2WUWr6xKzx5gmTSU1dFenN0yfibtW4v2KNGAWIGlHXJT6JxhxAx1p8SD65jH0JnTS6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456987; c=relaxed/simple;
	bh=/+9yVMQ7uVJIPzA48WZm/mQkju3OayZ93rYp0WlrIFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnDdtA2IkzHbTQ3ohaD6bTUWuI6SjYBKj/oPJMjaJaCkZvP9cNBrErmnwiWO+8CRa3z05J5npO0AP71gNWlTOrphjhiB1QjkH7koy4OFZJ8hQsEQiuIhYFlvXDnaBIWwLMpQLQ/IUOyneK/A5W6GCf0zwdmQVtw2gV3Pl2EcxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HJOJCmSk; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDZ2GT029104;
	Tue, 17 Dec 2024 17:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=yIuFXKMjlt2eqMXCg
	MM0MpSNKB+FCQyk+A1j47l3HY8=; b=HJOJCmSk9tZ3toXkRLi5G5HUr4sOFuPDm
	yV4/2Xc4mbTfKP7oRDSnqv12s/DjxNVJ5/5h9hk1Ccq+jEHgvIeLXbTDUkTLo5je
	1NB0i0H1CQmirm68PQPzVbtNNI3N38lT/ZNdB+kJ2Rl7DxzguQwcKivSXOzcVnod
	ZFpeyXy9T+Dz57b7zMDxlBK3fymCmh/sCzAnYrSDgX2vYTYgmbjfOPwaeYVAseGF
	c9dTUwzjhK860NwW5lXBlVgQil+GPlKTBt0DbmNj96VN+4zFlAZTUBdRLqrmeuaj
	V0hvATDSCJ6FwPGfGbLP+ia88lzkKDbCq7RfHRpsB1o7mNsrjzUNQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh4b1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:47 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BHHXfvi002867;
	Tue, 17 Dec 2024 17:35:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh4b1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHG1tWA024026;
	Tue, 17 Dec 2024 17:35:45 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnukbsm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:45 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BHHZiOj16319070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 17:35:44 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0582658061;
	Tue, 17 Dec 2024 17:35:44 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A46925805C;
	Tue, 17 Dec 2024 17:35:42 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 17:35:42 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v4 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Date: Tue, 17 Dec 2024 11:35:33 -0600
Message-ID: <20241217173537.192331-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217173537.192331-1-ninad@linux.ibm.com>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4861KNYL1vPao7r-oQ86zFTqLl9aHwSh
X-Proofpoint-ORIG-GUID: lfgROJj7AyvjdMVWOMAAcpbR2pHrrHbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170134

Add the driver to monitor Intel common redundant power supply (crps185)
with hwmon over pmbus.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/hwmon/crps.rst  | 97 +++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst |  1 +
 MAINTAINERS                   |  7 +++
 drivers/hwmon/pmbus/Kconfig   |  9 ++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/crps.c    | 74 ++++++++++++++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

diff --git a/Documentation/hwmon/crps.rst b/Documentation/hwmon/crps.rst
new file mode 100644
index 000000000000..87380b496558
--- /dev/null
+++ b/Documentation/hwmon/crps.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver crps
+==================
+
+Supported chips:
+
+  * Intel CRPS185
+
+    Prefix: 'crps185'
+
+    Addresses scanned: -
+
+    Datasheet: Only available under NDA.
+
+Authors:
+    Ninad Palsule <ninad@linux.ibm.com>
+
+
+Description
+-----------
+
+This driver implements support for Intel Common Redundant Power supply with
+PMBus support.
+
+The driver is a client driver to the core PMBus driver.
+Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+
+Sysfs entries
+-------------
+
+======================= ======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_max		Maximum input current
+curr1_max_alarm		Input maximum current high alarm
+curr1_crit		Critial high input current
+curr1_crit_alarm	Input critical current high alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm		Output maximum current high alarm
+curr2_crit		Critial high output current
+curr2_crit_alarm	Output critical current high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Critical input over voltage
+in1_crit_alarm		Critical input over voltage alarm
+in1_max			Maximum input over voltage
+in1_max_alarm		Maximum input over voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured input voltage
+in2_crit		Critical input over voltage
+in2_crit_alarm		Critical input over voltage alarm
+in2_lcrit		Critical input under voltage fault
+in2_lcrit_alarm		Critical input under voltage fault alarm
+in2_max			Maximum input over voltage
+in2_max_alarm		Maximum input over voltage alarm
+in2_min			Minimum input under voltage warning
+in2_min_alarm		Minimum input under voltage warning alarm
+in2_rated_min		Minimum rated input voltage
+in2_rated_max		Maximum rated input voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+power1_max  		Maximum input power
+power1_rated_max	Maximum rated input power
+
+temp[1-2]_input		Measured temperature
+temp[1-2]_crit 		Critical temperature
+temp[1-2]_crit_alarm	Critical temperature alarm
+temp[1-2]_max		Maximum temperature
+temp[1-2]_max_alarm	Maximum temperature alarm
+temp[1-2]_rated_max	Maximum rated temperature
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan1_target		Fan 1 target.
+======================= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1a3cb0a59f72..b1ea445479b0 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -58,6 +58,7 @@ Hardware Monitoring Kernel Drivers
    corsair-cpro
    corsair-psu
    cros_ec_hwmon
+   crps
    da9052
    da9055
    dell-smm-hwmon
diff --git a/MAINTAINERS b/MAINTAINERS
index 7523a456fd6f..e194478ecc55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6118,6 +6118,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
 
+INTEL CRPS COMMON REDUNDANT PSU DRIVER
+M:	Ninad Palsule <ninad@linux.ibm.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/crps.rst
+F:	drivers/hwmon/pmbus/crps.c
+
 CRYPTO API
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 M:	"David S. Miller" <davem@davemloft.net>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 22418a05ced0..43b6df04e0f9 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -85,6 +85,15 @@ config SENSORS_BPA_RS600
 	  This driver can also be built as a module. If so, the module will
 	  be called bpa-rs600.
 
+config SENSORS_CRPS
+	tristate "Intel Common Redundant Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the Intel
+	  Common Redundant Power Supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called crps.
+
 config SENSORS_DELTA_AHE50DC_FAN
 	tristate "Delta AHE-50DC fan control module"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 3d3183f8d2a7..c7eb7739b7f8 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -62,3 +62,4 @@ obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
+obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
diff --git a/drivers/hwmon/pmbus/crps.c b/drivers/hwmon/pmbus/crps.c
new file mode 100644
index 000000000000..164b33fed312
--- /dev/null
+++ b/drivers/hwmon/pmbus/crps.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 IBM Corp.
+ */
+
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+static const struct i2c_device_id crps_id[] = {
+	{ "intel_crps185" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, crps_id);
+
+static struct pmbus_driver_info crps_info = {
+	.pages = 1,
+	/* PSU uses default linear data format. */
+	.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_IIN |
+		PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+		PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+};
+
+static int crps_probe(struct i2c_client *client)
+{
+	int rc;
+	struct device *dev = &client->dev;
+	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_MODEL\n");
+
+	if (rc != 7 || strncmp(buf, "03NK260", 7)) {
+		buf[rc] = '\0';
+		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n", buf);
+	}
+
+	rc = pmbus_do_probe(client, &crps_info);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to probe\n");
+
+	return 0;
+}
+
+static const struct of_device_id crps_of_match[] = {
+	{
+		.compatible = "intel,crps185",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, crps_of_match);
+
+static struct i2c_driver crps_driver = {
+	.driver = {
+		.name = "crps",
+		.of_match_table = crps_of_match,
+	},
+	.probe = crps_probe,
+	.id_table = crps_id,
+};
+
+module_i2c_driver(crps_driver);
+
+MODULE_AUTHOR("Ninad Palsule");
+MODULE_DESCRIPTION("PMBus driver for Intel Common Redundant power supplies");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


