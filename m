Return-Path: <linux-i2c+bounces-4537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D991E2F0
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146B6283BFE
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E100B16D317;
	Mon,  1 Jul 2024 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRYZ8+ac"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF716CD2E;
	Mon,  1 Jul 2024 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845776; cv=none; b=UeOopwWSOVCCUN6nwUXP7YdaH3eVeh1KaKBEz89tEq8YkQdZj40Sc/Sk9QL/fu1wVyzSiqp72mYg3fFAsr629P2wKCcMwGk+MYYYCtwKyAoajKAargn9WjylaAS6YomSGPhmnGH2ywF9CRpEUJpWHvA+l20g0hXIeeaZDBD9b7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845776; c=relaxed/simple;
	bh=gBMp/PxmvM1WAqWQ+GtcENuSn/zEL9TSEWi+GMZwuPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+k/PORufcbRA3oBQhKT16JR7XmRkvIxR7p4VNexlr2vTCDmBHb9RL7xcJNLb5XxCGjuPk3E7SCvVSFaK/YJLpXzG+Q36WuAptGERnrp1wgf08g/9G0OnT/wZ/v/2pPDk4vdNUyVKD1V7zlclgAdmR96Mj+171Bn0ww2IKL5QlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRYZ8+ac; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so36978791fa.1;
        Mon, 01 Jul 2024 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719845773; x=1720450573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYXQ5Vwep1QA2wqyR9aUILZNVydy2NjxjT8QG7DEG9Y=;
        b=ZRYZ8+acZE0TDnCWYrc83eVR8NnZI6FO4G1lQkAhI7Hk4wfOnXAlMMrndlv/GOzRDp
         xMIcG/K/NTugOQkScTgqVEWR2WQ3DGw7REVTaMHWyxfRN+nDsDOZM3XpYEiWdtcCw2uv
         0P1KaMiaFriXodhPgmzE4zg9ZH9Gr8fzmmlTwzbxO39aQ0q22mNIRDj4VDtAxjuyuSSJ
         vrYqR7XYhY1rPUDpZGr4ToRAvXJAGDdVrgqe+DGr0Vu2LZ+smEfv++ierBGzukddAsHa
         GPsUnzN8BB9q+FyA1kXrYaS7JkmKz2l4tGel1pM0mP7vipx6NvE6XcVi9VCOI1ScoXRw
         HwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845773; x=1720450573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYXQ5Vwep1QA2wqyR9aUILZNVydy2NjxjT8QG7DEG9Y=;
        b=w+aHEWia5d/V1+Z3OGRVNr8xudWujYwLn82q6v/XZ1dgZroi3Lj8mFSUUNzzvKy4Hm
         JWvZ32oQhgwoVR+v04lSiu5Y/zzWSUf9wEhM3iUGBzoE30H1TQ5ZCavoaLu5z3NCOSZx
         Ugy7Nf/RPwuJb7i21MgP32JMPa9JwF+rgfF7RQ+PvwiPz0jlH4SsjTSkn75LKmg7OqfD
         iMJbEbRGe/DGFWBsHkIPRWt3FXDHQl5sRw3CHDC1huVYCWRXlMnFLucZw3bseQ+PVrc8
         fNhVU2nbuxv4zuHyFbJtgC0H1NiRnQEoDLLqyrChvotjPxtBq9lXOBlH6FAj1Dfc84H0
         8LZw==
X-Forwarded-Encrypted: i=1; AJvYcCXil0msD76xZ+ELqj0aWe1EKlfuTJWOfEZ1amv6QS/koPwrMJsUHacImCMlv5pgdo0/vzguDVJDlg16gRzLZSl81rxoL/RLnT69GOps7Aq7M0q02AEloPPDkp5n+lpEWIPf135Syi+NHr8vSa7pvSOAJVrQCnpO8xV5ypWv8UwkONhsQmMQ3NSAyxwUSQQ4IeQihCL//NFfPthy9t3JhKU=
X-Gm-Message-State: AOJu0YxOZSjwQ5Ph10palaDTv+yYc0ERVFWOTZSo6PZxxWEj/RpJ9xkP
	IzDh7YY/2fvU03VLxMifQpksc92vchbgFACnAEzxdnkIzA6AozoL
X-Google-Smtp-Source: AGHT+IFJzt6vmmdi2euM4slOolCPhKomNUImlIlGLiInVPNBJaaKijvf5Or46Ak+qF/PNdBYn/wnAw==
X-Received: by 2002:a05:6512:519:b0:52c:d639:dd4b with SMTP id 2adb3069b0e04-52e8266eab5mr3411004e87.23.1719845772859;
        Mon, 01 Jul 2024 07:56:12 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b1dbsm1450044e87.253.2024.07.01.07.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 07:56:12 -0700 (PDT)
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
Subject: [PATCH v3 2/2] hwmon: add MP5920 driver
Date: Mon,  1 Jul 2024 17:56:01 +0300
Message-ID: <20240701145603.1507516-3-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701145603.1507516-1-xzeol@yahoo.com>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
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
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5920.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5920_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 2266,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -1,
+	.m[PSC_VOLTAGE_OUT] = 2266,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -1,
+	.m[PSC_CURRENT_OUT] = 546,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -2,
+	.m[PSC_POWER] = 5840,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -3,
+	.m[PSC_TEMPERATURE] = 1067,
+	.b[PSC_TEMPERATURE] = 20500,
+	.R[PSC_TEMPERATURE] = -2,
+	.func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
+		PMBUS_HAVE_TEMP,
+};
+
+static int mp5920_probe(struct i2c_client *client)
+{
+	struct device *dev =  &client->dev;
+	int ret;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
+		return ret;
+	}
+	if (ret != 6 || strncmp(buf, "MP5920", 6)) {
+		buf[ret] = '\0';
+		dev_err(dev, "Model '%s' not supported\n", buf);
+		return -ENODEV;
+	}
+
+	return pmbus_do_probe(client, &mp5920_info);
+}
+
+static const struct of_device_id mp5920_of_match[] = {
+	{ .compatible = "mps,mp5920" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, mp5920_of_match);
+
+static const struct i2c_device_id mp5920_id[] = {
+	{ "mp5920" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, mp5920_id);
+
+static struct i2c_driver mp5920_driver = {
+	.driver = {
+			.name = "mp5920",
+			},
+	.probe = mp5920_probe,
+	.id_table = mp5920_id,
+};
+
+module_i2c_driver(mp5920_driver);
+
+MODULE_AUTHOR("Tony Ao <tony_ao@wiwynn.com>");
+MODULE_AUTHOR("Alex Vdovydchenko <xzeol@yahoo.com>");
+MODULE_DESCRIPTION("PMBus driver for MP5920 HSC");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.43.0


