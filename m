Return-Path: <linux-i2c+bounces-4379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D39183EE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 16:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F0A1F242D0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B8D1862AC;
	Wed, 26 Jun 2024 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZsUVX8W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297718629C;
	Wed, 26 Jun 2024 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719411899; cv=none; b=BoN7n8V0+RLfPxSxweR4UkfYW+jNWbd9ni0Ds1i2J8lBHBk7U0VAXXpKpxQS8r7/T+KZ2XDKPBMAcBNalnKzMGOrq2WTPnFFGBmwSwOYEsCOOJVdBD/wdh9zMO+J9ANnsHscY03RelD4IxKNShOxOhteyD5qHtPAhQ3pm3+8ifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719411899; c=relaxed/simple;
	bh=LY3O0wyzOO4ZZUjTNY0ik3V8d3QYy42Ys12z6P4sDMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tX19MQTdPfvAFQmU3zOAEYlY73hXTiVbiHaUghgXoZeR9djqbhf9frfSghYQZ1BnjtFlXqlqhEZGAqlQOMx0smLEnubKJLrjX9QqaibdrG5l59gb3miVnBaGv68yrNq+7IPAdfZN0+GtyeuPlr5o2+CLkuRBju0PuNMX8UCpAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZsUVX8W; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cdfb69724so4865810e87.1;
        Wed, 26 Jun 2024 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719411895; x=1720016695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljVB1XBgItVGRvkSmQ9UaPN/JmF21Go3KK/z7Y69xCA=;
        b=AZsUVX8WgHeWhCJtwH3w+grBab3R9lPgqoPu180ShsIKnbrvCJLVYHs8vRcoFAoJY6
         iE39w9Jl26C+mz8bjWoWUbxyZTa8r4Z3mCGOtj9MyJ+JDujvBjEIOCB8KPcLmh1rV90m
         22PpHjMWuwbY4pqpObdZkrzoI1LESBPFUQr2C//O5D++s4/Z6+zNErAbLh0fLG419z8k
         rEJI3uz+b0WVrKpJU5RVhxr/9tuwZ0PEWYejfE0Vuaz6KERTB1G/DeC3Z1/RLnM5Se+k
         cNQb1KJj5XEIvfQYIGkBURSRBIv+/AZFBs4G6rI962p2bpoCsCPDzfcerlhwa3Pqzmq0
         o8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411895; x=1720016695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljVB1XBgItVGRvkSmQ9UaPN/JmF21Go3KK/z7Y69xCA=;
        b=KkeSpRiwVZGG2Dcma7ktp3M3u2/yx+saaa8YrEMtQvedvnBzD0XR2XLAXEnhV/WuLb
         yAIlUxyCH34O/6GuvJXKKC34wGhkOJSTXGVKh03ozhg1llUXlQBwiVY+WyAL5w8vWE1Z
         NUnhWB1s17OFftNhs6jHO0wXDRDcuZWkNoKR0QC33hL0eQXgktYRs/WiPQFUJNShvoKt
         bFlILID75s3IUrHtxiCKrP6f8CzXs+BO5HZGAGwXCjMOK2IpE1HxpUZVR5RjwOJ4ot3H
         YblFmw+lZKFFnAansHdaV9X9AKWetqs7JGBU3dSzv6MN+YgG0PMB3S0YNgOWdxQbobrb
         EwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd3/akefzCgWhRmUANHLhrRb14bZ3DftCZGeeM+jl5u6iUozUY57rChgYntqhIm6ov4iSuzW+69LFMFzKdmrsYw1utXV+Rxgwhj8EQ+rWktbXzauo6fHZnZKYU8MCRp46NMGo/clq/xXXJ4k9vuQ1dPqy8ag3UkkZw785NE3NjshSgDd8jt0bFhwFT+l405vkynZGkKz763NgYlsELus0=
X-Gm-Message-State: AOJu0YyVVPT2R657c1OAR7zlYyGLsoYrIukiW8+a2KGXxb6AVmosX1vP
	PE3fRYp3+V9rd6txljozGjSZgV838TpN+oRENhLaq6JZiJqxVNaW/QAkISkT
X-Google-Smtp-Source: AGHT+IHTAQcNp5YYs54BdIdaQJj4RqgXe5l9b6vOR/BXji2N9RKcowKQKcnJW/uHP6GOmlNCDpNkVg==
X-Received: by 2002:ac2:598e:0:b0:52c:e159:a998 with SMTP id 2adb3069b0e04-52ce183b3c3mr5566341e87.29.1719411895014;
        Wed, 26 Jun 2024 07:24:55 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cda72b401sm1496705e87.136.2024.06.26.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:24:54 -0700 (PDT)
From: Alex Vdovydchenko <keromvp@gmail.com>
X-Google-Original-From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: Alex Vdovydchenko <xzeol@yahoo.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] hwmon: add MP5920 driver
Date: Wed, 26 Jun 2024 17:24:34 +0300
Message-ID: <20240626142439.1407175-3-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626142439.1407175-1-xzeol@yahoo.com>
References: <20240626142439.1407175-1-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MPS Hot-Swap controller mp5920. This driver exposes
telemetry and limits value readings and writtings.

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


