Return-Path: <linux-i2c+bounces-8480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D269EFEBF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 22:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C654188CB82
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 21:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389891DDC32;
	Thu, 12 Dec 2024 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OQICRPiN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C491D88DB;
	Thu, 12 Dec 2024 21:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734040216; cv=none; b=rCAk7R6b7QHqvhZzcNqZi+aN7jg1Ca5xD28yNT34BA2sOY/FRqpB0wh4ZN0KPH4an4R6regvbT7sO9r10FAFcsvPSIHTC7ZUWFMzrZzPNUQp17GyAYhxql5IX6EpJ3z6hsklC3X5UVZQY+OHjZ2L4kPAx+mKG6CWWAk+pQUhGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734040216; c=relaxed/simple;
	bh=wRgYNPlaDav+i78RTFQXtx0jj4a9VgEImgtDfkbsHKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U3V4uoWG2hVmfQERPG4UfQyx2/CoKL7p+Lr20+BkElGCBveG4jIlpD8BxOd8zcHcx2DooKT9f8creKUQeIEiJav8xKO2EdvhoascBui5qA6lFUw+WILyycHYMjmtYCLZTYa63nAkim2OZur8JuLEjC4n2jBL0nT0POCyIWI03K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OQICRPiN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCDUuBa031246;
	Thu, 12 Dec 2024 21:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=moPxuRvUKwlLFDxDQ
	A0cr7XKF2KHSXt5Qn639JL7DkI=; b=OQICRPiNYc+6Ly6gZHlbOBqw7xaHla6s2
	RtNH1CMqZg0LPSPQGMNi4crmDyoJXQUGmUobq4+s2ybQonHG7yszHIy2PGeGvO//
	Ldt82VQLo6N+oaN5C9RjcOGHHFdlDkgNoxUKk+sDikyl5xN3T1j8ao+J1bTik4SP
	Ytl6NMxaaSA80auVUIO5Cj9MdjxATxXnGqyPxmtU7I/l7qMB9/ikkMzOIpxlEnrD
	ZJBgJogQBOYhSBpYNPW+bVnpEY2YzFjZGE8ECnRlWJnjOvbVXz1gUEUeN7rJOwRj
	a/B6ZGE4dzLH/tU8WponNcdPyN7z0CHYOz6NAn88Qn/T68SqWuIpA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43g0sbjkgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BCLncTd008798;
	Thu, 12 Dec 2024 21:49:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43g0sbjkgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCIdRdK007873;
	Thu, 12 Dec 2024 21:49:36 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ft11v63j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:49:36 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BCLnZcQ30999176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:49:35 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C074058054;
	Thu, 12 Dec 2024 21:49:35 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ED595803F;
	Thu, 12 Dec 2024 21:49:34 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Dec 2024 21:49:34 +0000 (GMT)
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
Subject: [PATCH v1 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Date: Thu, 12 Dec 2024 15:49:01 -0600
Message-ID: <20241212214927.3586509-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212214927.3586509-1-ninad@linux.ibm.com>
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TGZJao1Nvmr5IT3954N42LlZCd32IxOh
X-Proofpoint-ORIG-GUID: sAKqn42Pv96gjHVSxC_0l2jjVg12plju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412120156

Add the driver to monitor Intel common redundant power supply (crps185)
with hwmon over pmbus.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/hwmon/crps.rst |  95 +++++++++++
 MAINTAINERS                  |   7 +
 drivers/hwmon/pmbus/Kconfig  |   9 ++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/crps.c   | 299 +++++++++++++++++++++++++++++++++++
 5 files changed, 411 insertions(+)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

diff --git a/Documentation/hwmon/crps.rst b/Documentation/hwmon/crps.rst
new file mode 100644
index 000000000000..81d5dfd68a46
--- /dev/null
+++ b/Documentation/hwmon/crps.rst
@@ -0,0 +1,95 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver crps
+========================
+
+Supported chips:
+
+  * Intel CRPS185
+
+    Prefix: 'crps185'
+
+    Addresses scanned: -
+
+Authors:
+    Ninad Palsule <ninad@linux.ibm.com>
+
+
+Description
+-----------
+
+This driver implements support for Common Redundant Power supply with PMBus
+support.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 637ddd44245f..6b31d545f0f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6100,6 +6100,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
 
+CRPS COMMON REDUNDANT PSU DRIVER
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
index 22418a05ced0..56c4eb4b846e 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -85,6 +85,15 @@ config SENSORS_BPA_RS600
 	  This driver can also be built as a module. If so, the module will
 	  be called bpa-rs600.
 
+config SENSORS_CRPS
+	tristate "Common Redundant Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the Common
+	  Redundant Power Supply.
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
index 000000000000..44d309f81803
--- /dev/null
+++ b/drivers/hwmon/pmbus/crps.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 IBM Corp.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+/* Intel crps185 specific commands. */
+#define CRPS185_MFR_IOUT_MAX		0xA6
+#define CRPS185_MFR_POUT_MAX		0xA7
+
+enum {
+	CRPS_DEBUGFS_PMBUS_REVISION = 0,
+	CRPS_DEBUGFS_MAX_POWER_OUT,
+	CRPS_DEBUGFS_MAX_CURRENT_OUT,
+	CRPS_DEBUGFS_NUM_ENTRIES
+};
+
+enum models { crps185 = 1, crps_unknown };
+
+struct crps {
+	enum models version;
+	struct i2c_client *client;
+
+	int debugfs_entries[CRPS_DEBUGFS_NUM_ENTRIES];
+};
+
+#define to_psu(x, y) container_of((x), struct crps, debugfs_entries[(y)])
+
+static struct pmbus_platform_data crps_pdata = {
+	.flags = PMBUS_SKIP_STATUS_CHECK,
+};
+
+static const struct i2c_device_id crps_id[] = {
+	{ "intel_crps185", crps185 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, crps_id);
+
+/*
+ * Convert linear format word to machine format. 11 LSB side bits are two's
+ * complement integer mantissa and 5 MSB side bits are two's complement
+ * exponent
+ */
+static int crps_convert_linear(int rc)
+{
+	s16 exponent;
+	s32 mantissa;
+	s64 val;
+
+	exponent = ((s16)rc) >> 11;
+	mantissa = ((s16)((rc & 0x7ff) << 5)) >> 5;
+
+	val = mantissa;
+	if (exponent >= 0)
+		val <<= exponent;
+	else
+		val >>= -exponent;
+
+	return (int)val;
+}
+
+static ssize_t crps_debugfs_read(struct file *file, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	int rc;
+	int *idxp = file->private_data;
+	int idx = *idxp;
+	struct crps *psu = to_psu(idxp, idx);
+	char data[2 * I2C_SMBUS_BLOCK_MAX] = { 0 };
+
+	rc = pmbus_lock_interruptible(psu->client);
+	if (rc)
+		return rc;
+
+	rc = pmbus_set_page(psu->client, 0, 0xff);
+	if (rc)
+		goto unlock;
+
+	switch (idx) {
+	case CRPS_DEBUGFS_PMBUS_REVISION:
+		rc = i2c_smbus_read_byte_data(psu->client, PMBUS_REVISION);
+		if (rc >= 0) {
+			if (psu->version == crps185) {
+				if (rc == 0)
+					rc = sprintf(data, "%s", "1.0");
+				else if (rc == 0x11)
+					rc = sprintf(data, "%s", "1.1");
+				else if (rc == 0x22)
+					rc = sprintf(data, "%s", "1.2");
+				else
+					rc = snprintf(data, 3, "0x%02x", rc);
+			} else {
+				rc = snprintf(data, 3, "%02x", rc);
+			}
+		}
+		break;
+	case CRPS_DEBUGFS_MAX_POWER_OUT:
+		rc = i2c_smbus_read_word_data(psu->client, PMBUS_MFR_POUT_MAX);
+		if (rc >= 0) {
+			rc = crps_convert_linear(rc);
+			rc = snprintf(data, I2C_SMBUS_BLOCK_MAX, "%d", rc);
+		}
+		break;
+	case CRPS_DEBUGFS_MAX_CURRENT_OUT:
+		rc = i2c_smbus_read_word_data(psu->client, PMBUS_MFR_IOUT_MAX);
+		if (rc >= 0) {
+			rc = crps_convert_linear(rc);
+			rc = snprintf(data, I2C_SMBUS_BLOCK_MAX, "%d", rc);
+		}
+		break;
+	default:
+		rc = -EINVAL;
+		break;
+	}
+
+unlock:
+	pmbus_unlock(psu->client);
+	if (rc < 0)
+		return rc;
+
+	data[rc] = '\n';
+	rc += 2;
+
+	return simple_read_from_buffer(buf, count, ppos, data, rc);
+}
+
+static const struct file_operations crps_debugfs_fops = {
+	.llseek = noop_llseek,
+	.read = crps_debugfs_read,
+	.open = simple_open,
+};
+
+static int crps_read_word_data(struct i2c_client *client, int page,
+				int phase, int reg)
+{
+	int rc;
+
+	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		rc = pmbus_read_word_data(client, page, phase, reg);
+		if (rc < 0)
+			return rc;
+		break;
+	case PMBUS_OT_WARN_LIMIT:
+		rc = pmbus_read_word_data(client, page, phase,
+					  PMBUS_MFR_MAX_TEMP_1);
+		if (rc < 0)
+			return rc;
+		break;
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		rc = pmbus_read_word_data(client, page, phase,
+					  CRPS185_MFR_IOUT_MAX);
+		if (rc < 0)
+			return rc;
+		break;
+	case PMBUS_POUT_OP_WARN_LIMIT:
+		rc = pmbus_read_word_data(client, page, phase,
+					  CRPS185_MFR_POUT_MAX);
+		if (rc < 0)
+			return rc;
+		break;
+	default:
+		rc = -ENODATA;
+		break;
+	}
+
+	return rc;
+}
+
+static struct pmbus_driver_info crps_info[] = {
+	[crps185] = {
+		.pages = 1,
+		/* PSU uses default linear data format. */
+		.func[0] = PMBUS_HAVE_PIN | PMBUS_HAVE_IOUT |
+			PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_IIN |
+			PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+			PMBUS_HAVE_STATUS_TEMP |
+			PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12,
+		.read_word_data = crps_read_word_data,
+	},
+};
+
+#define to_psu(x, y) container_of((x), struct crps, debugfs_entries[(y)])
+
+static void crps_init_debugfs(struct crps *psu)
+{
+	struct i2c_client *client = psu->client;
+	struct dentry *debugfs;
+	int i;
+
+	/* Don't fail the probe if we can't create debugfs */
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return;
+
+	for (i = 0; i < CRPS_DEBUGFS_NUM_ENTRIES; ++i)
+		psu->debugfs_entries[i] = i;
+
+	debugfs_create_file("pmbus_revision", 0444, debugfs,
+			    &psu->debugfs_entries[CRPS_DEBUGFS_PMBUS_REVISION],
+			    &crps_debugfs_fops);
+	debugfs_create_file("max_power_out", 0444, debugfs,
+			    &psu->debugfs_entries[CRPS_DEBUGFS_MAX_POWER_OUT],
+			    &crps_debugfs_fops);
+	debugfs_create_file("max_current_out", 0444, debugfs,
+			    &psu->debugfs_entries[CRPS_DEBUGFS_MAX_CURRENT_OUT],
+			    &crps_debugfs_fops);
+}
+
+static int crps_probe(struct i2c_client *client)
+{
+	int rc;
+	struct device *dev = &client->dev;
+	enum models vs = crps_unknown;
+	struct crps *psu;
+	const void *md = of_device_get_match_data(&client->dev);
+	const struct i2c_device_id *id = NULL;
+	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+
+	if (md) {
+		vs = (uintptr_t)md;
+	} else {
+		id = i2c_match_id(crps_id, client);
+		if (id)
+			vs = (enum models)id->driver_data;
+	}
+
+	if (!vs || vs >= crps_unknown) {
+		dev_err(dev, "Version %d not supported\n", vs);
+		return -EINVAL;
+	}
+
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rc < 0) {
+		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
+		return rc;
+	}
+	if (strncmp(buf, "03NK260", 7)) {
+		buf[rc] = '\0';
+		dev_err(dev, "Model '%s' not supported\n", buf);
+		return -ENODEV;
+	}
+
+	client->dev.platform_data = &crps_pdata;
+	rc = pmbus_do_probe(client, &crps_info[vs]);
+	if (rc) {
+		dev_err(dev, "Failed to probe %d\n", rc);
+		return rc;
+	}
+
+	/*
+	 * Don't fail the probe if there isn't enough memory for debugfs.
+	 */
+	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu) {
+		dev_warn(dev, "Failed to allocate memory. debugfs are not supported.\n");
+		return 0;
+	}
+
+	psu->version = vs;
+	psu->client = client;
+
+	crps_init_debugfs(psu);
+
+	return 0;
+}
+
+static const struct of_device_id crps_of_match[] = {
+	{
+		.compatible = "intel,crps185",
+		.data = (void *)crps185
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
+MODULE_DESCRIPTION("PMBus driver for Common Redundant power supplies");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


