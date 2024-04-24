Return-Path: <linux-i2c+bounces-3097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC058B06A8
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 11:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1069285586
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 09:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF57D15920C;
	Wed, 24 Apr 2024 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7Iwlxog"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305E158D9C;
	Wed, 24 Apr 2024 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952582; cv=none; b=ujP4JUjTtsKJOt9XZdee6BKYN0ogg5LgcV7idjVC/kGpdZZ2l9/AJRD00MmhyyyToIFW4wONbXOKMUn4fatFQBxAZt3zPd0sk9COE7VNPwPaMfXIXZ0WEFVksjyut9WgbiLPKq8cuPwbG0UxtBF73jor/R0P3IdmCbaEO1z9xsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952582; c=relaxed/simple;
	bh=kR9d0v/gm6d2o7AuomAmnJwB+zXQHcAh7ya8jOFQr+M=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FFIc/R5rype9puFQ5VnF9CuE22aE5HQ6ykxziW2+qYw9KKXWW3Zgkgl6INWxWEGEuRsr6Y536f8rKs1WRy2hZZvXGefNsZ0hbW4NnZYqOzJsT0Y450ZM7MurxuFlRmBvZ/HMbH8P8bQ8tADgBevjswAnrxib8epjoiM8I1jNk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7Iwlxog; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c70a55988dso3694772b6e.0;
        Wed, 24 Apr 2024 02:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713952580; x=1714557380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtzaetZ2A2XG/RgyiPPy1hUBmHC1EMIQ5TN+/Eje5fM=;
        b=R7IwlxogmPCdEx12UlHtdFrntOOkPlnENmEmd+DEEWopu5JRfHVNHACqlF1Te2rD41
         r2WW7dzMJwpWfkJ3orYyYoQTzrRSw/2HQfnFT4j48rRu83nGbZW8N6FluF9wBz79yyPr
         2A5assP1+jq24bG4QfCsQjzFdlASVptcLrBqEc+x7IvVuR/8ZrE/enXyy9PKryAQMHRg
         +006nikODF33KsGAdzG75V2Wgb/woyFXapsQ+V7R45ya8uMpLGumXYa855sHJKuQszHt
         GmVNhWnHcY9BLwUoYc7VQ4eCaj+b6njmXQjJt0yqawGK3Q1/Qrvy/mEIfHq5ugK85VZ2
         CauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952580; x=1714557380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtzaetZ2A2XG/RgyiPPy1hUBmHC1EMIQ5TN+/Eje5fM=;
        b=NtdpB3Bv4h54/C86reXAlT2dks+MFsKBVpWdVVNl8dK8HXhM+3unIqBKt/ASEFHLq9
         j6M2oDL4Rx6zfQFOaXteNRyTZK9rSDnc2aoJ/E9lOKx+PQzom6c4K6Af/CIdKBcvgSo/
         1PFrnUk7mKis0Wij6kwrqmjGV0XEIQ41fKjyQ5nMr6rlNut0A+Cn5ftEqzCFaIO/Jj0G
         1+/FH7AdSONXeWD3F+ek2KiGBbWamwmQt1MpVUFpnp3Yt9B8VKjDC3+exl3FYDTevJMX
         X99yI4mlk/cjt5kusWY2c4pbcYlCEmJi30cbWUd0AftvLPp2NGB1a1ysUWm6xMoqmpNv
         cb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlSxayP+MVoQm9ybe1a08+lLJinTZwWxDYb6smKPqGVwMRHKy+hW8M8I73xEjLGjNOvR6pYiwRyRwZRwskZpevhkUq8uVAc+fzSI47zXopYx4OjBH9HAUZ1gs4QzLFOBvZrsbjEO18dWCRIkEA6XNiV/b9AXghreVw/WDR9ZWI0JF+FXfjj0s3fHkFWz2Mp1Cyy3tQHI9p5sstl7gaXdiCLM1NLBnd7fJUJYxa+jAfLDQj1234vmFUZwO6
X-Gm-Message-State: AOJu0Yzhlct8zVfKxyBcB9pkAp9BiAcvcI/0NiTp7UmGA+qHbGzR/iIZ
	nu+ujuBnYh8ockp1T7CtyrFWbp2O9/8keTWJGtzRABZbZPi2Lg7c
X-Google-Smtp-Source: AGHT+IFejZJpWJETvIXC9VrPpTMlMtUeGrugQIoK4LKK+EqxwDPZEw6jjr1aKKu5513jvcSZOAZRog==
X-Received: by 2002:a05:6808:a85:b0:3c8:2b71:97 with SMTP id q5-20020a0568080a8500b003c82b710097mr1811766oij.12.1713952579856;
        Wed, 24 Apr 2024 02:56:19 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e380-6057-c341-626e-0f0b-b82d.emome-ip6.hinet.net. [2001:b400:e380:6057:c341:626e:f0b:b82d])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm11042932pfl.31.2024.04.24.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:56:19 -0700 (PDT)
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
	Michal Simek <michal.simek@amd.com>,
	Marek Vasut <marex@denx.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v1 1/3] hwmon: (pmbus) Add support for Infineon XDP710
Date: Wed, 24 Apr 2024 17:55:57 +0800
Message-Id: <20240424095604.3425857-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
References: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for xdp710 device from Infineon vendor.
This is a Hot-Swap Controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig  |   9 ++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/xdp710.c | 155 +++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/xdp710.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 557ae0c414b0..d72bdecf758a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -511,6 +511,15 @@ config SENSORS_UCD9200
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9200.
 
+config SENSORS_XDP710
+	tristate "Infineon XDP710 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDP710 device.
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
index 000000000000..3ed324bd0db6
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Infineon XDP710 Hot-Swap Controller
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/bitops.h>
+#include "pmbus.h"
+
+#define XDP710_REG_CFG		(0xD3)
+#define XDP710_V_SNS_CFG	(0xD4)
+#define XDP710_CS_RNG		(0xD5)
+
+struct xdp710_data {
+	struct pmbus_driver_info info;
+	u8 cs_rng;
+	u8 vtlm_rng;
+	int rsense;
+};
+
+/*
+ * 0x00 to 0x09
+ * 0x0A to 0x13
+ * 0x14 to 0x1D
+ * 0x1E to 0x27
+ * 0x28 to 0x32
+ * 0x33 to 0x3F
+ */
+const int microOhmRsense[] = {
+	200, 250, 300, 330, 400, 470, 500, 600, 670, 700,
+	750, 800, 900, 1000, 1100, 1200, 1250, 1300, 1400, 1500,
+	1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2400, 2500,
+	2600, 2700, 2800, 3000, 3100, 3200, 3300, 3400, 3500, 3600,
+	3800, 3900, 4000, 4200, 4300, 4500, 4700, 4800, 4900, 5000,
+	5500, 6000, 6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000
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
+	struct xdp710_data *data;
+	int ret;
+	int m = 0;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct xdp710_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &xdp710_info, sizeof(*info));
+	info = &data->info;
+
+	/*
+	 * Read CS_RNG Value
+	 */
+	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Can't get CS_RNG. Setting the CS_RNG to 0");
+		ret = 0;
+	}
+	data->cs_rng = (ret >> 6) & GENMASK(1, 0);
+
+	/*
+	 * Read V_SNS_CFG Value
+	 */
+	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Can't get V_SNS_CFG. Setting the V_SNS_CFG to 0");
+		ret = 0;
+	}
+	data->vtlm_rng = ret & GENMASK(1, 0);
+
+	/*
+	 * Read RSNS_CFG Value
+	 */
+	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Can't get REG_CFG, Setting the Rsense to 0.33mohm");
+		ret = 3;
+	}
+	ret &= GENMASK(5, 0);
+	data->rsense = microOhmRsense[(u8)ret];
+
+	info->m[PSC_VOLTAGE_IN] <<= data->vtlm_rng;
+	info->m[PSC_VOLTAGE_OUT] <<= data->vtlm_rng;
+
+	m = info->m[PSC_CURRENT_OUT];
+	info->m[PSC_CURRENT_OUT] = ((m >> (data->cs_rng)) *
+				   (data->rsense)) / 1000;
+
+	m = info->m[PSC_POWER];
+	info->m[PSC_POWER] = ((m >> (data->cs_rng)) *
+			     (data->rsense)) / 1000;
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


