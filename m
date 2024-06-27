Return-Path: <linux-i2c+bounces-4388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65691A214
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1361F21A14
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 09:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF5113AD07;
	Thu, 27 Jun 2024 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFSO6v0s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511C13AA2F;
	Thu, 27 Jun 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478889; cv=none; b=LVq22KHXC7lJOR3+zeXpaRSIKLBoO14srdNSa3xmmKN8BRdZHBYu+alPsWzKNdzeFPhVj/3WLzh8ZzLW1p+Z+ZvHixz6TEE/AIfrL8PgELRT9ExtqI0zGriDc7cmtlCyZHehvYAcf3d5EobUoNGSStHlufNi2SUSZ4BS0dhacqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478889; c=relaxed/simple;
	bh=OmTbuuFtOIzIyRzsvJ3rs71Lk7NLoK9j/9fo00ltDSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvGfS+P3Uk5rQPLdoQpb3LX7MiX6qFRKqv/5H+D5sIz22kQ0YiGcGxWn/u5RjRofab7CBlxTxrfM3e9gVwyi3N6g6J1STY+qVJwaREQDYZM++MVHHghZzDp1xTFyBr8BCIATniaeLjt3eGteh5+jDn0r0D01/+nhtAGFftyU3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFSO6v0s; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52ce01403f6so5012309e87.0;
        Thu, 27 Jun 2024 02:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719478886; x=1720083686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiikccnaeroWfkyLRAKZeXmDn8B5B0eYsT+LfDCNerg=;
        b=bFSO6v0sLuZonC9fJVRM0QTBspzbBD99KB2DkinOJuJtfMHJM5LQhWGaqwBPd3vruM
         LWmRfFDitK2KPKKYN/ZnHGJuqfv4i+QgUClRpiO9tZe1gS9UVo/5pHalEauR9gwTu4Aw
         zmEI7PxtMWMFsT/Au+NDRD8c7+Jm/IJV4HNbjh/lV1X1G/yvpEFStuDI3mfePODtqYsU
         YVhP9GvYO833kPjzkWWzJWjLPuYCF7vTE312RzepbFCy9VlZGfspfv3ri+w0gTSrOZ5f
         9fnVusuQtnBqfJnBoy6DeZ2v/cD9qPqiGM0NuYbCvydRz/PO4EPlUbzsNtE+6qDlQy06
         pyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719478886; x=1720083686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiikccnaeroWfkyLRAKZeXmDn8B5B0eYsT+LfDCNerg=;
        b=XRpwqTRnMEoFbxekZG7KG4oHjVM5bCX+x4OgPT3CyynanqVH0N1k5FLfFde/uy6tsM
         sKTkVm0wCxLtwkYaQT+1WkNCx4ToE0gordH0FgUUbM5R5GwPaFdrZax5cbtd0UZd7DCn
         ahJBp3AHVmlYfqaT7yII1i6YfO+di51C1/Gfx2BkXkvMbDUdqqaIdFXEovjmTT4xlKNZ
         90mMiL0TvWVTvdUrBNf0Le+VZVzdfump2cUZ3KD6jMUaH9hcPsATqnrlN1jkPEeEKc1A
         Llw8Jg49svH8zlVTvnwUa8sn1blC1LK+AeXs/rBPFWZDexqHXndmEcNfQT3iC9MFWHsQ
         SJjw==
X-Forwarded-Encrypted: i=1; AJvYcCWEBVBfA2HleqtrUUEfVhmDFQZswUk5RFv5cQifFEvKGp3RgMYtWntUz8ilc1MuEDDkqMUM7GJeSrCctlwwFlA0OWl5NWCDFtARlruUH3THi6DiMRoh2HJ9K3aqFVqBUf1ai7RkE3hUo7x8v16zMATpeRq07lKo2yP3ZxvG7ieXZe5BhSderW1fpJQvYJt131MLNrilI9D/hFWqnHngAvg=
X-Gm-Message-State: AOJu0Yy1wrLKL0bpkqVqwA5ekEYjlcWO5O4j0EPfguwPfFi7FQUslgwL
	a+mvrCh9egQS8rbVitG17JFBBD0B/Mx6ISwjmTjHQ2tPJMLv3AKL
X-Google-Smtp-Source: AGHT+IEjRJH+DwFbhf5flo/q75ICWVTR93zXZKymITwE7tK9NTqly0cwBX1nfG5s0wn6O36PTFUYaw==
X-Received: by 2002:a05:6512:78e:b0:52c:caa6:13b4 with SMTP id 2adb3069b0e04-52ce1832de1mr7903922e87.3.1719478885497;
        Thu, 27 Jun 2024 02:01:25 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e712a75cbsm128557e87.38.2024.06.27.02.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 02:01:25 -0700 (PDT)
From: Alex Vdovydchenko <keromvp@gmail.com>
X-Google-Original-From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: [PATCH v2 2/2] hwmon: add MP5920 driver
Date: Thu, 27 Jun 2024 12:01:08 +0300
Message-ID: <20240627090113.391730-3-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627090113.391730-1-xzeol@yahoo.com>
References: <20240627090113.391730-1-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MPS Hot-Swap controller mp5920. This driver exposes
telemetry and limit value readings and writings.

Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/hwmon/mp5920.rst
 create mode 100644 drivers/hwmon/pmbus/mp5920.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index e92a3d5c7..9eba7e402 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
    mp2975
    mp2993
    mp5023
+   mp5920
    mp5990
    mp9941
    mpq8785
diff --git a/Documentation/hwmon/mp5920.rst b/Documentation/hwmon/mp5920.rst
new file mode 100644
--- /dev/null
+++ b/Documentation/hwmon/mp5920.rst
@@ -0,0 +1,91 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5920
+====================
+
+Supported chips:
+
+  * MPS MP5920
+
+    Prefix: 'mp5920'
+
+  * Datasheet
+
+    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5920.html
+
+Authors:
+
+	Tony Ao <tony_ao@wiwynn.com>
+	Alex Vdovydchenko <xzeol@yahoo.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5920 Hot-Swap Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct and linear format for reading input voltage,
+output voltage, output current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_rated_max**
+
+**in1_rated_min**
+
+**in1_crit**
+
+**in1_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_rated_max**
+
+**in2_rated_min**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_crit**
+
+**curr1_alarm**
+
+**curr1_rated_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_max**
+
+**power1_rated_max**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_crit**
+
+**temp1_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -371,6 +371,15 @@ config SENSORS_MP5023
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5023.
 
+config SENSORS_MP5920
+	tristate "MPS MP5920"
+	help
+	  If you say yes here you get hardware monitoring support for Monolithic
+	  MP5920.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5920.
+
 config SENSORS_MP5990
 	tristate "MPS MP5990"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
+obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
diff --git a/drivers/hwmon/pmbus/mp5920.c b/drivers/hwmon/pmbus/mp5920.c
new file mode 100644
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5920.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MP5920 and compatible chips.
+ *
+ * Copyright (c) 2019 Facebook Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5920_info = {
+	pages = 1,
+	format[PSC_VOLTAGE_IN] = direct,
+	format[PSC_VOLTAGE_OUT] = direct,
+	format[PSC_CURRENT_OUT] = direct,
+	format[PSC_POWER] = direct,
+	format[PSC_TEMPERATURE] = direct,
+	m[PSC_VOLTAGE_IN] = 2266,
+	b[PSC_VOLTAGE_IN] = 0,
+	R[PSC_VOLTAGE_IN] = -1,
+	m[PSC_VOLTAGE_OUT] = 2266,
+	b[PSC_VOLTAGE_OUT] = 0,
+	R[PSC_VOLTAGE_OUT] = -1,
+	m[PSC_CURRENT_OUT] = 546,
+	b[PSC_CURRENT_OUT] = 0,
+	R[PSC_CURRENT_OUT] = -2,
+	m[PSC_POWER] = 5840,
+	b[PSC_POWER] = 0,
+	R[PSC_POWER] = -3,
+	m[PSC_TEMPERATURE] = 1067,
+	b[PSC_TEMPERATURE] = 20500,
+	R[PSC_TEMPERATURE] = -2,
+	func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP,
+};
+
+static int mp5920_probe(struct i2c_client *client)
+{
+	struct device *dev =  &client->dev;
+	int chip_id;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_WORD_DATA))
+		return -ENODEV;
+
+	chip_id = i2c_smbus_read_word_data(client, PMBUS_MFR_ID);
+	if (chip_id < 0) {
+		dev_err(dev, "Failed to read MFR ID");
+		return chip_id;
+	}
+
+	return pmbus_do_probe(client, &mp5920_info);
+}
+
+static const struct of_device_id mp5920_of_match[] = {
+	{ .compatible = "mps,mp5920" },
+	{}
+};
+
+static const struct i2c_device_id mp5920_id[] = {
+	{"mp5920", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp5920_id);
+
+static struct i2c_driver mp5920_driver = {
+	.driver = {
+		.name = "mp5920",
+		.of_match_table = mp5920_of_match,
+	},
+	.probe = mp5920_probe,
+	.id_table = mp5920_id,
+};
+module_i2c_driver(mp5920_driver);
+
+MODULE_AUTHOR("Tony Ao <tony_ao@wiwynn.com>");
+MODULE_AUTHOR("Alex Vdovydchenko <xzeol@yahoo.com>");
+MODULE_DESCRIPTION("PMBus driver for MP5920 HSC");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.43.0


