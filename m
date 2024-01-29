Return-Path: <linux-i2c+bounces-1507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BEF840074
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 09:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1748DB21DFA
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 08:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1BF60B9F;
	Mon, 29 Jan 2024 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht43Nctn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D75FEED;
	Mon, 29 Jan 2024 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706517205; cv=none; b=UNRPObDLKEf7Yrt6S6b9c3CKXem9y5GX06iUR3LPiUCa2HIXTmtf43HpZJ7CXO1XT+YthmqiisnDYu8tPMbLBaLvSFHdB29y4lngifGvwM+OucYzRTuBvLxz3Q1ukPDkcAPb1bsO/LdIU/yZRsf7rWK8KXkXGJyJs+5zcbd4MQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706517205; c=relaxed/simple;
	bh=gPpx/D0AFFX1KG5syJb7H8q92DHqMNH5spjAbdTRFKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QJZrAwc7N7iXgrRvMOtZGWLEZ/p8UartO1DG2i6RAszV8MI9cOd+Cvt5yUEc/y5zHJqX7at2gljjG93TRlIiYBsfokJ1rMfELgpcfFG2iWg7BOhq2/pALGaJNUD6PglzDIkfItcBkx1Y63P94uOxYBWqI5PxKMVg3bKwQP0RZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht43Nctn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d7232dcb3eso9728495ad.2;
        Mon, 29 Jan 2024 00:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706517202; x=1707122002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8rvCs0CTengdVMrYR436oClLvAgG0ieZs9mk2u2MpA=;
        b=Ht43NctnnNQ1xdphfGQ4jhjWoIjuz5DYoQxTfX+BinDX4v1nzzQSOv+gWaWW0JWcIX
         ToBb9gt3RviaD/Y3h3xM7vOvVQhZl8W//5sjax45rNXX4R4bkwuaIbhymvvc45HehGuT
         lTddrnEdwr3QdgNGqnPyQG55CXEUDwN1PU8N2kNCgbSh2USuhACV4y2jFu0Lfs5wl8lf
         TSWweQ0fEe9ofH95GDrZOEwP21raItZdLHw89UqKq1SdT2pyGES/bkD6ul7nAQgsgqOd
         IRAERr0ThQAuqi15yfjOvP+UWtpQur/Sz/otSn8rewP6SMuVwcnX+yJgDLJ85EzAcwD+
         QKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706517202; x=1707122002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8rvCs0CTengdVMrYR436oClLvAgG0ieZs9mk2u2MpA=;
        b=wNaub1diJjE26Nbi/7G1r2PYbPSVe4cw8GhhDIgpIgzqaW+vvlCSUCcR4+A54UxzZQ
         EWmTwfJ6IBSeTnav+bB+J60qmQYG54ye/KznbdUUFcYVniTaNPOQTk3pXm50LAiUWJ/P
         QOBkV6Q4jdfGUboaiCaGSmUuHASA1q7cY7/FdBAaLbJryFMIlU65CmHNePxoWifAEgk0
         px/CvaVMnnhClPtDOQWbUrXjs2A4zx2BA290gAt/eXPDPcw9K/ScuOO2Px5V+ptlfslK
         zarDBy0V9yNVN+pjrlnxQVffyziZT+KCaI0D15qjxKSMtzD+JtdsG2+rLgbQwSXLAKyF
         G4Yg==
X-Gm-Message-State: AOJu0YzlAIlhEwUNqBd9Me18YIRPGVmnNi8lPfTY9iT7CwsgpR8D+WgK
	UorR+BRxw//CBVjyJFda0VRxV11xU0R0GnhHAX/BrEgBykycDOeN
X-Google-Smtp-Source: AGHT+IHRbMIKxO3A3x41zkurSgi/UviAUp4JFNFrOSe6P/sbdsT8o4QgZGTE3UZ9cHGnhjfJipJ7Sw==
X-Received: by 2002:a17:902:db12:b0:1d7:44f8:4aab with SMTP id m18-20020a170902db1200b001d744f84aabmr2123516plx.25.1706517202231;
        Mon, 29 Jan 2024 00:33:22 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id v19-20020a170902d09300b001d8d0487edbsm2001878plv.223.2024.01.29.00.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 00:33:21 -0800 (PST)
From: Charles Hsu <ythsu0511@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	Delphine_CC_Chiu@Wiwynn.com,
	naresh.solanki@9elements.com,
	peteryin.openbmc@gmail.com,
	patrick.rudolph@9elements.com,
	alexander.stein@ew.tq-group.com,
	lakshmiy@us.ibm.com,
	bhelgaas@google.com,
	michal.simek@amd.com,
	lukas@wunner.de,
	festevam@denx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	ytshu0511@gmail.com,
	Charles Hsu <ythsu0511@gmail.com>
Subject: [PATCH v2] hwmon: Add driver for MPS MPQ8785 Synchronous Step-Down Converter
Date: Mon, 29 Jan 2024 16:31:15 +0800
Message-Id: <20240129083115.2107466-1-ythsu0511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for mpq8785 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is synchronous step-down controller.

Signed-off-by: Charles Hsu <ythsu0511@gmail.com>

---
Change in v1:
    Initial patchset.
Change in v2:
    1.Add pmbus support status registers.
    2.Add mpq8785 in trivial-devices.yaml.
    3.Remove format[PSC_VOLTAGE_OUT]
    4.Fix MODULE_DESCRIPTION
---
 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/mpq8785.rst               | 94 +++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/mpq8785.c                 | 62 ++++++++++++
 6 files changed, 169 insertions(+)
 create mode 100644 Documentation/hwmon/mpq8785.rst
 create mode 100644 drivers/hwmon/pmbus/mpq8785.c

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 79dcd92c4a43..088b23ed2ae6 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -129,6 +129,8 @@ properties:
           - mps,mp2975
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
+            # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
+          - mps,mpq8785
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
           - honeywell,hi6130
             # IBM Common Form Factor Power Supply Versions (all versions)
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c7ed1f73ac06..085ad6ca9b05 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -163,6 +163,7 @@ Hardware Monitoring Kernel Drivers
    mp2975
    mp5023
    mp5990
+   mpq8785
    nct6683
    nct6775
    nct7802
diff --git a/Documentation/hwmon/mpq8785.rst b/Documentation/hwmon/mpq8785.rst
new file mode 100644
index 000000000000..bf8176b87086
--- /dev/null
+++ b/Documentation/hwmon/mpq8785.rst
@@ -0,0 +1,94 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver mpq8785
+=======================
+
+Supported chips:
+
+  * MPS MPQ8785
+
+    Prefix: 'mpq8785'
+
+Author: Charles Hsu <ythsu0511@gmail.com>
+
+Description
+-----------
+
+The MPQ8785 is a fully integrated, PMBus-compatible, high-frequency, synchronous
+buck converter. The MPQ8785 offers a very compact solution that achieves up to
+40A output current per phase, with excellent load and line regulation over a
+wide input supply range. The MPQ8785 operates at high efficiency over a wide
+output current load range.
+
+The PMBus interface provides converter configurations and key parameters
+monitoring.
+
+The MPQ8785 adopts MPS's proprietary multi-phase digital constant-on-time (MCOT)
+control, which provides fast transient response and eases loop stabilization.
+The MCOT scheme also allows multiple MPQ8785 devices to be connected in parallel
+with excellent current sharing and phase interleaving for high-current
+applications.
+
+Fully integrated protection features include over-current protection (OCP),
+over-voltage protection (OVP), under-voltage protection (UVP), and
+over-temperature protection (OTP).
+
+The MPQ8785 requires a minimal number of readily available, standard external
+components, and is available in a TLGA (5mmx6mm) package.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+**curr1_crit**
+
+**curr1_crit_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 294808f5240a..557ae0c414b0 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -377,6 +377,15 @@ config SENSORS_MPQ7932
 	  This driver can also be built as a module. If so, the module will
 	  be called mpq7932.
 
+config SENSORS_MPQ8785
+	tristate "MPS MPQ8785"
+	help
+	  If you say yes here you get hardware monitoring functionality support
+	  for power management IC MPS MPQ8785.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mpq8785.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index cf8a76744545..f14ecf03ad77 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
+obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
new file mode 100644
index 000000000000..52c73e5f6a3e
--- /dev/null
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MPQ8785 Step-Down Converter
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mpq8785_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 4,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 1,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int mpq8785_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mpq8785_info);
+};
+
+static const struct i2c_device_id mpq8785_id[] = {
+	{ "mpq8785", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, mpq8785_id);
+
+static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
+	{ .compatible = "mps,mpq8785" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mpq8785_of_match);
+
+static struct i2c_driver mpq8785_driver = {
+	.driver = {
+		   .name = "mpq8785",
+		   .of_match_table = of_match_ptr(mpq8785_of_match),
+	},
+	.probe_new = mpq8785_probe,
+	.id_table = mpq8785_id,
+};
+
+module_i2c_driver(mpq8785_driver);
+
+MODULE_AUTHOR("Charles Hsu <ythsu0511@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MPQ8785");
+MODULE_LICENSE("GPL");
-- 
2.34.1


