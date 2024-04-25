Return-Path: <linux-i2c+bounces-3150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8968B2543
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 17:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25154B27C05
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8C714BFB1;
	Thu, 25 Apr 2024 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp2pw7iT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F514BF99;
	Thu, 25 Apr 2024 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059401; cv=none; b=lmrSAg+wEKJW6DGaEkzSQ+SLPjRc1oniUZOVKyAlu7wjYZgyuyllFMfUwjddngE9tlP1V4Woy6iOGXKcM2/xHAIzZnIyEyV1X6AAAAJcrpUgMD8VcL8GcCFMhck1u5qe3w70ouyLIwhQWbmx8nRCCJn/yn5EfxRT43qMgK2hWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059401; c=relaxed/simple;
	bh=84lw7lQaadXufIXwbjxHVlkFaVwzTT/KqQ64yTwBhMk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ssnkRzWBFi4Ucqnq5rRFbPzRP+Vjdlj2DtYgEG1HhIZGFGBK6Ba3umNWgTVyvTm7TIrkpJSlEHLcdzbxx8Fq0R6+vMBBPm+rWesqvg7YXL/fwZbgjgF0uRi+nsfkSBbh54yBInnbuTBkpCs8zIYicogwC0uQcHdoQosu63Yk6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vp2pw7iT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e3e84a302eso8972825ad.0;
        Thu, 25 Apr 2024 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714059399; x=1714664199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tp9CsTU/yjIwF+Llrgyw4A0r1sW+S9kaLrIY6cp5I18=;
        b=Vp2pw7iTWhqN7bmX2HKaLzkc97TsTlJq/NUI0JfcmkYATq4UOA62qo16823JN5S23y
         s9H9Lhar+1ZV7pOauNTF5KavOQMXenOeTXjHNO7ZtN39da593A+SF9VJ1u5mAjyu9Vpu
         Zr6n/pUop5/V9gh8vmXyEP/F3LWLcCPvVwVx5joymRViJeRxMp6RaQFU0GpJSBL6de/g
         oJ0jxt0oTrUzr/Euw6jXz3gm87kxvE2Iwm5WiO2cYJuwwAJ6b3hgyHLjn+FrQNb6nQhY
         aQQ/YU0FYMwqvOI7Z8sisZs5IIfF5MBqxpTXAsQo69y0fuN82mTpJJGYq+9Z3sjbCSL8
         O1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714059399; x=1714664199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp9CsTU/yjIwF+Llrgyw4A0r1sW+S9kaLrIY6cp5I18=;
        b=RpNVMoU8I3jgcHnEYTj2E6E3ayJDCzKV2bVbVAn0rlfb7uPkVVB3mfT1Yw56Qs5Aau
         5HJhHJl1AVCQRU0HBoasMrDXtcKYu6L6UIZRW57kihYBozKAkXGv5RVU/NW2GZOdZpN5
         3ZHx50OS6gAcYNlPEBZejc99T+ETItv6nb6hgCTacK/mNm/sNXl6BxSJrslgZk9m0s/4
         U4hKp5ArW9Vp7nxFa7lLDT0IN1sRbWFl+eXT7msui2ybgrpsh4iZQv4h0jkHs6bphML/
         YNsMIHYNzcWuRURMz73l91PFjiXJCaqX8DQiMJnlCDuNKr9X4zoYYtX+brhuygrKjENb
         rRgg==
X-Forwarded-Encrypted: i=1; AJvYcCUTaqITR+h8KwZnrTtxb30LY/1fH6JNq3YnS2ijKeoV3sKVp+im+CfwZ4dbCC1ypbRs7rzVZ8TCMVAfbl++qWnNxRnervSzv+zp2QGQ2Ih+D6RUz+HOGGwKLK+244LEpTQmG9u+wSqvyoUsVk4hC35FNbip8wGtvUwTd2ty8cxYr9+6zK3axmib4sZMDZMmSGhJOurHYVNi3wp7R0I4o6t6N9ZwwIH4NiSFdMLUjEaKNQpbslQ8Id1b+/qD
X-Gm-Message-State: AOJu0YymcZCt3uh5SJN8mtwDwNTgPMn02Upf3i/U26KlCP4c1cQvI0AM
	XWyzAh4xS4KLHbqUVHWs7Wd+sH7CnjLiqN2teRgcJkri19MhBPA2
X-Google-Smtp-Source: AGHT+IFSKAKQIhddXUU2gvjdsX2FUghUCC0N0669erPEK5V3RYWw6H+uRDdrDXIlZC1mPgQCtrG9RQ==
X-Received: by 2002:a17:902:d4cc:b0:1e4:3535:a85 with SMTP id o12-20020a170902d4cc00b001e435350a85mr7708122plg.7.1714059398875;
        Thu, 25 Apr 2024 08:36:38 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm13852586plb.281.2024.04.25.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 08:36:38 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Fabio Estevam <festevam@denx.de>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (pmbus) Add support for Infineon XDP710
Date: Thu, 25 Apr 2024 23:36:01 +0800
Message-Id: <20240425153608.4003782-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Infineon XDP710.This is a Hot-Swap Controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/xdp710.rst |  83 +++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |   9 +++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/xdp710.c   | 132 +++++++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+)
 create mode 100644 Documentation/hwmon/xdp710.rst
 create mode 100644 drivers/hwmon/pmbus/xdp710.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1ca7a4fe1f8f..b2546925fb15 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -250,6 +250,7 @@ Hardware Monitoring Kernel Drivers
    wm831x
    wm8350
    xgene-hwmon
+   xdp710
    xdpe12284
    xdpe152c4
    zl6100
diff --git a/Documentation/hwmon/xdp710.rst b/Documentation/hwmon/xdp710.rst
new file mode 100644
index 000000000000..083891f27818
--- /dev/null
+++ b/Documentation/hwmon/xdp710.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver xdp710
+====================
+
+Supported chips:
+
+  * Infineon XDP710
+
+    Prefix: 'xdp710'
+
+  * Datasheet
+
+    Publicly available at the Infineon website : https://www.infineon.com/dgdl/Infineon-XDP710-001-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c8412f8d301848a5316290b97
+
+Author:
+
+	Peter Yin <peteryin.openbmc@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Infineon XDP710 Hot-Swap Controller.
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
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
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
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
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
index 557ae0c414b0..c775128c2ea7 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -511,6 +511,15 @@ config SENSORS_UCD9200
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9200.
 
+config SENSORS_XDP710
+	tristate "Infineon XDP710 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDP710.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdp710.
+
 config SENSORS_XDPE152
 	tristate "Infineon XDPE152 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f14ecf03ad77..4fe630793721 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
+obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
new file mode 100644
index 000000000000..a00f79cda5e5
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Infineon XDP710 Hot-Swap Controller
+ */
+
+#include <linux/bitops.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+#define XDP710_REG_CFG		0xD3
+#define XDP710_V_SNS_CFG	0xD4
+#define XDP710_CS_RNG		0xD5
+
+/*
+ * The table to map configuration register values
+ * to sense resistor values
+ */
+const int microOhmRsense[] = {
+	200, 250, 300, 330, 400, 470, 500, 600,
+	670, 700, 750, 800, 900, 1000, 1100, 1200,
+	1250, 1300, 1400, 1500, 1600, 1700, 1800, 1900,
+	2000, 2100, 2200, 2300, 2400, 2500, 2600, 2700,
+	2800, 3000, 3100, 3200, 3300, 3400, 3500, 3600,
+	3700, 3800, 3900, 4000, 4100, 4200, 4300, 4400,
+	4500, 4600, 4700, 4800, 4900, 5000, 5500, 6000,
+	6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000
+};
+
+static struct pmbus_driver_info xdp710_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 4653,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.m[PSC_VOLTAGE_OUT] = 4653,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.m[PSC_CURRENT_OUT] = 23165,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -2,
+	.m[PSC_POWER] = 4211,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -2,
+	.m[PSC_TEMPERATURE] = 52,
+	.b[PSC_TEMPERATURE] = 14321,
+	.R[PSC_TEMPERATURE] = -1,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int xdp710_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	u8 cs_rng;
+	u8 vtlm_rng;
+	int rsense;
+	int ret;
+	int m = 0;
+
+	info = devm_kmemdup(&client->dev, &xdp710_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get CS_RNG");
+		return ret;
+	}
+	cs_rng = (ret >> 6) & GENMASK(1, 0);
+
+	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get V_SNS_CFG");
+		return ret;
+	}
+	vtlm_rng = ret & GENMASK(1, 0);
+
+	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get REG_CFG");
+		return ret;
+	}
+	ret &= GENMASK(5, 0);
+	rsense = microOhmRsense[ret];
+
+	info->m[PSC_VOLTAGE_IN] <<= vtlm_rng;
+	info->m[PSC_VOLTAGE_OUT] <<= vtlm_rng;
+
+	m = info->m[PSC_CURRENT_OUT];
+	info->m[PSC_CURRENT_OUT] = DIV_ROUND_CLOSEST(m * rsense >> cs_rng,
+						     1000);
+
+	m = info->m[PSC_POWER];
+	info->m[PSC_POWER] = DIV_ROUND_CLOSEST(m * rsense >> cs_rng, 1000);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id xdp710_of_match[] = {
+	{ .compatible = "infineon,xdp710" },
+	{}
+};
+
+static const struct i2c_device_id xdp710_id[] = {
+	{"xdp710", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, xdp710_id);
+
+static struct i2c_driver xdp710_driver = {
+	.driver = {
+		   .name = "xdp710",
+		   .of_match_table = xdp710_of_match,
+	},
+	.probe = xdp710_probe,
+	.id_table = xdp710_id,
+};
+module_i2c_driver(xdp710_driver);
+
+MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for XDP710 HSC");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.25.1


