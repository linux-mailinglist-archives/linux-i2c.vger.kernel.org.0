Return-Path: <linux-i2c+bounces-8538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A9F9F37FD
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E0E188470F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375A2208984;
	Mon, 16 Dec 2024 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D2hjXuR+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E215207E01;
	Mon, 16 Dec 2024 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371494; cv=none; b=M4hsWhxFA/AwuNH9/WrwquC9S6zv6P9GOb4IZMGHgdmii8wEcw671GXszt0FN5tNJMcte02+chVEshjQcmQJMvQ+bHDoTFaVlU5w0zbIod5nceAfRaana2hw2VQEGpZp32zsCME7EcdH/gQ0FSbL7+xS/Hp1SW7/NPQ/sBL3WQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371494; c=relaxed/simple;
	bh=tj9vM5lhVlFWG7afrdFapRdnnBKjvvWOc1+YkZHu/Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1T1AnnGD568d61MFkiXer8gE5MMRtVcp77Upti4Sgd3MfaqQ6R1HySycGhclgqFP3UpBtBZbe/4gnmpAn3F9eH9KN+9LV1hLJKJl78zfh3FBvzfFY1J/7M8pio4OHvTlrsbF0GcTREKA1tgEcNgdsU6CjPwJJ4DIB8TOaDuq9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D2hjXuR+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGE6GUM011290;
	Mon, 16 Dec 2024 17:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oC8gWCVRWd7t3zyrx
	qyuKPb2pXvaqF9RbBIlxbK+iVs=; b=D2hjXuR+5A4J3fHTWRkirxn1DvrEr2rOR
	Z++OccL3QNvCG1Ceo6juxunNtzq8J0iiVtVVrOaVx/Csx8ebCvScwE/trHBed3AS
	GqPQV9voJPtNC+4Y8GFyTaAK5FlAZw6R9o9WikZ+L+DgTMn4nMi/Rh73fhRe3lMR
	i3/VlIpzjXBuC710U5jIzilZzQHbC/zYqEyMzYABWtTfOui7cs65OOa8tti4b0DY
	a5Z2fH1Q4Rr/nBzQ17QKZIdQJtED+qf6QyF2jJaayINWAUCEA6j1rbKV+J/aBsxI
	LfANswusG8pKzxUY5+MFwx4g27f7Id6G80ZsDZi9bgr8srL+Q6VHQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4h627-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGHlsAQ014520;
	Mon, 16 Dec 2024 17:50:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4h624-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEM1t6024044;
	Mon, 16 Dec 2024 17:50:49 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnuk6y7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:49 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGHolKb13697640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 17:50:48 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3CE458056;
	Mon, 16 Dec 2024 17:50:47 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AAE258063;
	Mon, 16 Dec 2024 17:50:47 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 17:50:47 +0000 (GMT)
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
Subject: [PATCH v2 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Date: Mon, 16 Dec 2024 11:50:40 -0600
Message-ID: <20241216175044.4144442-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216175044.4144442-1-ninad@linux.ibm.com>
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RIdgxiWY9x8mGG75KEXd_cI2H51-3DCA
X-Proofpoint-ORIG-GUID: hPVHz1BCbW9CKnieVuuRKJybKZhN7iR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160146

Add the driver to monitor Intel common redundant power supply (crps185)
with hwmon over pmbus.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/hwmon/crps.rst  | 97 +++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst |  1 +
 MAINTAINERS                   |  7 +++
 drivers/hwmon/pmbus/Kconfig   |  9 ++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/crps.c    | 79 ++++++++++++++++++++++++++++
 6 files changed, 194 insertions(+)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

diff --git a/Documentation/hwmon/crps.rst b/Documentation/hwmon/crps.rst
new file mode 100644
index 000000000000..74570ed1e978
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
+    Datasheet: Publicly not available.
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
+curr1_max_alarm         Input maximum current high alarm
+curr1_crit              Critial high input current
+curr1_crit_alarm        Input critical current high alarm
+curr1_rated_max		Maximum rated input current
+
+curr2_label		"iout1"
+curr2_input		Measured output current
+curr2_max		Maximum output current
+curr2_max_alarm         Output maximum current high alarm
+curr2_crit	        Critial high output current
+curr2_crit_alarm        Output critical current high alarm
+curr2_rated_max		Maximum rated output current
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit                Critical input over voltage
+in1_crit_alarm          Critical input over voltage alarm
+in1_max                 Maximum input over voltage
+in1_max_alarm           Maximum input over voltage alarm
+in1_rated_min		Minimum rated input voltage
+in1_rated_max		Maximum rated input voltage
+
+in2_label		"vout1"
+in2_input		Measured input voltage
+in2_crit                Critical input over voltage
+in2_crit_alarm          Critical input over voltage alarm
+in2_lcrit               Critical input under voltage fault
+in2_lcrit_alarm         Critical input under voltage fault alarm
+in2_max                 Maximum input over voltage
+in2_max_alarm           Maximum input over voltage alarm
+in2_min                 Minimum input under voltage warning
+in2_min_alarm           Minimum input under voltage warning alarm
+in2_rated_min		Minimum rated input voltage
+in2_rated_max		Maximum rated input voltage
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+power1_max  		Maximum input power
+power1_rated_max        Maximum rated input power
+
+temp[1-2]_input		Measured temperature
+temp[1-2]_crit 		Critical temperature
+temp[1-2]_crit_alarm    Critical temperature alarm
+temp[1-2]_max  		Maximum temperature
+temp[1-2]_max_alarm     Maximum temperature alarm
+temp[1-2]_rated_max     Maximum rated temperature
+
+fan1_alarm		Fan 1 warning.
+fan1_fault		Fan 1 fault.
+fan1_input		Fan 1 speed in RPM.
+fan1_target             Fan 1 target.
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
index 637ddd44245f..e99f26f75733 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6100,6 +6100,13 @@ L:	linux-input@vger.kernel.org
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
index 000000000000..09425c404fc8
--- /dev/null
+++ b/drivers/hwmon/pmbus/crps.c
@@ -0,0 +1,79 @@
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
+	if (rc < 0) {
+		dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_MODEL\n");
+		return rc;
+	}
+
+	if (strncmp(buf, "03NK260", 7) == 7) {
+		buf[rc] = '\0';
+		dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n", buf);
+		return -ENODEV;
+	}
+
+	rc = pmbus_do_probe(client, &crps_info);
+	if (rc) {
+		dev_err_probe(dev, rc, "Failed to probe %d\n", rc);
+		return rc;
+	}
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


