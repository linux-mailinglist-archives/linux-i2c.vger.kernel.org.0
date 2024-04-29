Return-Path: <linux-i2c+bounces-3282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CBE8B4FE4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 05:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E96921C211A8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 03:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A1EDDA8;
	Mon, 29 Apr 2024 03:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkbR3fl/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF6DDB1;
	Mon, 29 Apr 2024 03:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714361937; cv=none; b=YdSdThF1//AD8+JA+GcbC8Fg8n80PdVcWuN6sVkSBlZLuEhWGIRTlky0mXWCM+axOy9OjVoiTk+1hHgc8RUV0q1sJBqgszCJRVcz9mDliBuunIaEsrQ1k9xxd242MO09t+0rezx5mZPfEjD8270AY4IgQCCHwwE5g7IN810+RpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714361937; c=relaxed/simple;
	bh=r814HZU727uw5VpF3+eqf46Ue4MN1yT0GSx7wB8yVoA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LxLi5xHpCA3A3UmNgFKoJCqVwihwsMfM5PuHW9e8OLKWtkmURfr4coHq5gEoow88RPklPoHzVwxJjaok1WP8d3znSo7epVlhmhguD+9zkPeR+eHPKLdMPmaTVwUasdKFOGgAjzW8kZvURakx5yZYlcXyiAjubqLEzbHl9wzMkfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkbR3fl/; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c74ff209f6so2778614b6e.0;
        Sun, 28 Apr 2024 20:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714361934; x=1714966734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10mfu4ttUvuh6EHI5b+iXWndc27sFkN2OOMRBjB4xKs=;
        b=hkbR3fl/fxKzEPh5x+5KtIP/idH4vT+8imfFpHaBjbmMJ+fFjLbdCxhTw48T4N0On7
         9qFr56Tz9D/L+o9F1DZzq3y3R71DeQqxGVlj5G8J7ZXgYF7M9DIWihh4EbxUh+ygfNka
         gaguiZEIRTmGRxxe29hVSB9gD5r8oN+YpLolaSbusvWwRerHcqnAxV+5ftT0TC7RdFcO
         DS/umP8QzhuF5SpMUfoJXdfRvl048uFXXVdxEBE02J0k+eNC7lTskOoV/zVnj82Hw/Ca
         h5lU8xmxoTndUNWamjPiXONTCU2I9Q30V69g6siFkctGfgiSYdNmXoayLgvL5SoIk6kz
         fZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361934; x=1714966734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10mfu4ttUvuh6EHI5b+iXWndc27sFkN2OOMRBjB4xKs=;
        b=iDays40+XW0OQ368tA+VQYSP2RwdS2KfaO26hosfbpp4grlVam/WDQT42+F0W+Di1q
         DgMjBsfS2BnDYVeISbiFmlU+/Lq+bwlxnHaBfP32ORys5g4p6Vs+/sBKqMrZoym6uNCN
         4YZO7oWZBErLordESiPbHZR4m5XO+Wc1NTw4lmwHvin00SOySB0CnppS7SNL/6ILDTae
         UUWKdwMDdKsWmb2Qye1gYVT6aeXhumz59lGbeWsVNjlhgS3J0tQDKkXB0C0SiPDAmcRq
         hzKNObv0NwPIAzT8xSLNFRTF6l4xJn2HZNkOj8HHvIfJs7na4lBPwUWFHr4FpT91MY/x
         hNnw==
X-Forwarded-Encrypted: i=1; AJvYcCV8xChuhZKbD0Z+BL4lJwAudcj4QWeeNyEnJ+ZIX0loLjFIHkqrw9IIjNXZMdHtg41I9RJlQSuBhfSm+RgJNwlpNBTZo/OOWLTV1JRR8i0kJE+rpnPc5zCJte05PoMFSwcvKNZaKCmmHIr/oyAnBbr1s9Lg67kha3RkyF4p5dG7pKUtJIkuRRd6Yd6yXSXE056h005m3rkn509skBqHVPSImesnmFGPhm9GShOqAdI+y4K7rr5w+Pwy2HEH
X-Gm-Message-State: AOJu0YxvV4w3wGfApWeQyxDZXZhQ3M8HyllMxUoXFrIyGG3K/HkxnTee
	YPAAvx91h1SDZnvzHa0GKAjtvgrVFgEi0abQF7edkPaedyrPXIRm
X-Google-Smtp-Source: AGHT+IHxPLs28ZwT7FYgmK44KZ2aKFo4KAeQxqkTRA0aj9S+WdCE4NvQKViEw87pAGsvvpR/AmbftQ==
X-Received: by 2002:a05:6808:5c4:b0:3c8:4aff:b4f3 with SMTP id d4-20020a05680805c400b003c84affb4f3mr11330796oij.43.1714361934310;
        Sun, 28 Apr 2024 20:38:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e2aa-928c-7bf0-01bb-028d-772b.emome-ip6.hinet.net. [2001:b400:e2aa:928c:7bf0:1bb:28d:772b])
        by smtp.gmail.com with ESMTPSA id i28-20020a63585c000000b005d5445349edsm17835424pgm.19.2024.04.28.20.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:38:53 -0700 (PDT)
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
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andre Werner <andre.werner@systec-electronic.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: (pmbus) Add support for Infineon XDP710
Date: Mon, 29 Apr 2024 11:38:25 +0800
Message-Id: <20240429033833.895122-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
References: <20240429033833.895122-1-peteryin.openbmc@gmail.com>
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
index 000000000000..4f858eafc5e8
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
+const int micro_ohm_rsense[] = {
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
+	rsense = micro_ohm_rsense[ret];
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


