Return-Path: <linux-i2c+bounces-6416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAD971E45
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1857EB2334B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9AA139D05;
	Mon,  9 Sep 2024 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uEq1gNe3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484D25589C
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896365; cv=none; b=i1TMaU1KzVL2F0iM+J2vC+3F5jjxmCYaXMsigQrHk9XgPOdMK+tUP7EHkyva6VPTih962s6YgLWkeihfa2LNraAUQKHILP8RqINcA/6EX1LNPTyYHCW/TG4VAQC8Fmg7nY5XyLWnU2kCRFblSH4ii5Ew7n9gVp4z+DMlCpWhSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896365; c=relaxed/simple;
	bh=3cxZUkMWB3bWChq69hrIXMPl+uSIw7UJ+pAYSdFQZ4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ktCDeEOpcYfXJVSaYZ1C6p2g5TM/JzN59DQAkBoJqu0zlow/CbdA+46TQEC4D5PFGAzCC6Gdn8KSXuuwPv3KbkxYgtQSEHw4mlUK1VJgAUlmkDbTodFwgp68a3vXrpC/3TMVDU4SGP/ySPA7IjUm9vGEfAgC81o5Np27NlXiQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uEq1gNe3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-371941bbfb0so2716549f8f.0
        for <linux-i2c@vger.kernel.org>; Mon, 09 Sep 2024 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725896360; x=1726501160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkiOCELnHFizmB6BxFn0pXWtV/LlXwXBPgn4A4PXdjU=;
        b=uEq1gNe3kSbm7U/rQwZuqzh+gU5jXLMxFEFTpQKi2hShVh8AIL2pOlXwvKSFp7HWew
         MyJ/YXRZXHtw1oPoU7GYNZG0jGYBf7ugcV1ed4xE7Gp18KjaV6rSo5zigNAxLYMl+T1O
         txJDDypEF2LXxyqJtZwx7AqNLD09OduUiu5MAlsBUr7IGPG//eaD9flFUUGQqQnqBe1o
         OhRag+5PJcNmo0qFDDs09hI89op+PvQUMt+CEctmHlAagAELR8vFAaob+MrmJO4e0PLv
         PzC4huz8Ko0nwaIpY38D4GWbB6CQNbttrBvMUEptjuZYA7HRM6FM+dgPPXsxK2WzEMme
         lskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896360; x=1726501160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkiOCELnHFizmB6BxFn0pXWtV/LlXwXBPgn4A4PXdjU=;
        b=u6SFaHl6MQ9jBjmBNRj3RerPcFfmym0a9FFNFbIlqCVVUww5HhCuMeWR1H7Qvaz98r
         shCNuZxS9W+x0t1KbC7yf5oWX1MT4PwirdbgLTN6o7r3QiLTPn5LgsQ9qCKO12VZcDGu
         ZOOaIeGtRJloW0ZEQosno8Rav6F1CKYppH+tSK5FHweNWuumimUkQjsW3UQONWG0uTJA
         VYr29PVRZqNYWckgVcKVngu37JYoVikR3AGhsubdsbh2L2pVmrquqoOKD1d/OoKw08mf
         VC7JsIwTGBMzuTdwN7QIQ6EwBUZoImk6WFuurspXLwBywyqiTy7CHQjO9LaUNsYbNg3x
         Eizg==
X-Forwarded-Encrypted: i=1; AJvYcCVKmceR/VvkmzeEasMso7cDzgp0CR2J94dKgs8E/tExPO5wleySWeUFzBF+T6EL7jpRBX1bAmWl8h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZUhO9M56hutU68zMlOWHj4jD3O2qCSwknF2CJT3ZeWFzLXM41
	ZKL1y91nF+6ZRZiBnnYYPtfPRh/QIPfGCETkGfsf+9oe0rZWQTHfOmBLaYrosbwVE1DSeb9Jhf+
	t
X-Google-Smtp-Source: AGHT+IFVbo8ijk5oT9KYsYnpWCU4bxAYBABqwUuRrMkySBYEGnpvzzRCmHlnNm1qY9hSLsU2quh1yw==
X-Received: by 2002:a5d:4145:0:b0:376:27b7:da81 with SMTP id ffacd0b85a97d-3789268f0b1mr4879745f8f.22.1725896360103;
        Mon, 09 Sep 2024 08:39:20 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm6305145f8f.18.2024.09.09.08.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:39:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 09 Sep 2024 17:39:05 +0200
Subject: [PATCH 3/3] hwmon: (pmbus/tps25990): add initial support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-tps25990-v1-3-39b37e43e795@baylibre.com>
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
In-Reply-To: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=18094; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3cxZUkMWB3bWChq69hrIXMPl+uSIw7UJ+pAYSdFQZ4I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm3xajcVfsdJeOvsgNEqArovAPg4f8v/N/6AKWW
 BS8VGfc8yWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZt8WowAKCRDm/A8cN/La
 hdijD/4paWJye299vD6SIKS0R8Dj39eW9h1CeQZPmV2NOWzKCVTjOaGZ672pAxinyXMwdY4Rday
 dMcsrqjrjYxXH46vB18tZkDyRJiR5saR3xs+CRfxg818ReedyoXaMJD4hLDl7uyiU4AABSrATKj
 +4hUX9Q4hgAyhLLZZA6mqYXrulox/shamITjF8fPqSgtG/R0NjQmtQVsjDx1kDKql5K/lnhkAfm
 Z1HmmJrXMOlJri0/6cU2i3afpHnylbom+7Sj8mUw6k10mOS4qz+sNFy/LOreFloja5eyYsTgdbg
 5oOjA2a4HfyY9zHSu5r0YlnQf+jISNXjIWIhkNASPNjc18ile0u+IOmwQGRySaUF9CLqVgnjogz
 mOUMb++/n/CNRHou2DyOiP6ajZnWmFHnU6Oqt587AxdZiquqpa6PcEXWWXMl+KVcKqjT2vEB9UZ
 s0JNzGNIVk/gyvlx10qgSVWS54OcqjjvCXqnO+GyRYL2JOQxUeeywxKp9ffcweJUM/XIapqCjNy
 lPbOdCiDtsVzIyFmdgEmvBTFFLiPV4SrpAlM9x0G1IENhgOEVwbdKYMo5G5kiXHUwUu/TX3pt/R
 9feCEVnxgkqaMphODgau1qTBdpc153G2rVqSnDPZfVw2JcT6JbIlWvvgGPAO/ufTmHc/Bb1qb3q
 91ZP8xDu1Koh+Gg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add initial support for the Texas Instruments TPS25990 eFuse.
This adds the basic PMBUS telemetry support for the device.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 141 ++++++++++++
 drivers/hwmon/pmbus/Kconfig      |  17 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/tps25990.c   | 474 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 633 insertions(+)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
new file mode 100644
index 000000000000..7b3ef724008a
--- /dev/null
+++ b/Documentation/hwmon/tps25990.rst
@@ -0,0 +1,141 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver tps25990
+======================
+
+Supported chips:
+
+  * TI TPS25990
+
+    Prefix: 'tps25990'
+
+  * Datasheet
+
+    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+
+Author:
+
+	Jerome Brunet <jbrunet@baylibre.com>
+
+Description
+-----------
+
+This driver implements support for TI TPS25990 eFuse.
+This is an integrated, high-current circuit protection and power
+management device with PMBUS interface
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading input voltages,
+output voltage, input current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input current:
+
+**curr1_average**
+
+**curr1_crit**
+
+**curr1_crit_alarm**
+
+**curr1_highest**
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for main input voltage:
+
+**in1_average**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+**in1_highest**
+
+**in1_input**
+
+**in1_label**
+
+**in1_lcrit**
+
+**in1_lcrit_alarm**
+
+**in1_lowest**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for auxiliary input voltage:
+
+**in2_input**
+
+**in2_label**
+
+The driver provides the following attributes for output voltage:
+
+**in3_average**
+
+**in3_good_off**
+
+**in3_input**
+
+**in3_label**
+
+**in3_lowest**
+
+**in3_min**
+
+**in3_min_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_alarm**
+
+**power1_average**
+
+**power1_input**
+
+**power1_input_highest**
+
+**power1_label**
+
+**power1_max**
+
+The driver provides the following attributes for temperature:
+
+**temp1_average**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_highest**
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+The driver provides the following attributes for history:
+
+**samples**
+
+**average_history_reset**
+
+**highest_history_reset**
+
+**lowest_history_reset**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a4f02cad92fd..3559864e232d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -510,6 +510,23 @@ config SENSORS_TDA38640_REGULATOR
 	  If you say yes here you get regulator support for Infineon
 	  TDA38640 as regulator.
 
+config SENSORS_TPS25990
+	tristate "TI TPS25990"
+	help
+	  If you say yes here you get hardware monitoring support for TI
+	  TPS25990.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called tps25990.
+
+config SENSORS_TPS25990_REGULATOR
+	bool "Regulator support for TPS25990 and compatibles"
+	depends on SENSORS_TPS25990 && REGULATOR
+	default SENSORS_TPS2599
+	help
+	  If you say yes here you get regulator support for Texas Instruments
+	  TPS25990.
+
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d00bcc758b97..3d3183f8d2a7 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
 obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
 obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
+obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
new file mode 100644
index 000000000000..14290c4c71dd
--- /dev/null
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2024 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+#define TPS25990_READ_VAUX		0xd0
+#define TPS25990_READ_VIN_MIN		0xd1
+#define TPS25990_READ_VIN_PEAK		0xd2
+#define TPS25990_READ_IIN_PEAK		0xd4
+#define TPS25990_READ_PIN_PEAK		0xd5
+#define TPS25990_READ_TEMP_AVG		0xd6
+#define TPS25990_READ_TEMP_PEAK		0xd7
+#define TPS25990_READ_VOUT_MIN		0xda
+#define TPS25990_READ_VIN_AVG		0xdc
+#define TPS25990_READ_VOUT_AVG		0xdd
+#define TPS25990_READ_IIN_AVG		0xde
+#define TPS25990_READ_PIN_AVG		0xdf
+#define TPS25990_VIREF			0xe0
+#define TPS25990_PK_MIN_AVG		0xea
+#define  PK_MIN_AVG_RST_PEAK		BIT(7)
+#define  PK_MIN_AVG_RST_AVG		BIT(6)
+#define  PK_MIN_AVG_RST_MIN		BIT(5)
+#define  PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
+#define TPS25990_MFR_WRITE_PROTECT	0xf8
+#define  TPS25990_UNLOCKED		BIT(7)
+
+#define TPS25990_8B_SHIFT		2
+#define TPS25990_VIN_OVF_NUM		525100
+#define TPS25990_VIN_OVF_DIV		10163
+#define TPS25990_VIN_OVF_OFF		155
+#define TPS25990_IIN_OCF_NUM		953800
+#define TPS25990_IIN_OCF_DIV		129278
+#define TPS25990_IIN_OCF_OFF		157
+
+#define TPS25990_DEFAULT_RIMON		910000
+
+static int tps25990_mfr_write_protect(struct i2c_client *client, bool protect)
+{
+	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
+				     protect ? 0x0 : 0xa2);
+}
+
+static int tps25990_mfr_write_protect_active(struct i2c_client *client)
+{
+	int ret = pmbus_read_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT);
+
+	if (ret < 0)
+		return ret;
+
+	return !(ret & TPS25990_UNLOCKED);
+}
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int tps25990_write_protect_get(void *data, u64 *val)
+{
+	struct i2c_client *client = data;
+
+	return tps25990_mfr_write_protect_active(client);
+}
+
+static int tps25990_write_protect_set(void *data, u64 val)
+{
+	struct i2c_client *client = data;
+
+	if (val > 1)
+		return -EINVAL;
+
+	return tps25990_mfr_write_protect(client, val);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(tps25990_write_protect_fops,
+			 tps25990_write_protect_get,
+			 tps25990_write_protect_set,
+			 "%llu\n");
+
+static int tps25990_init_debugfs(struct i2c_client *client)
+{
+	struct dentry *dir;
+
+	dir = pmbus_get_debugfs_dir(client);
+	if (!dir)
+		return -ENOENT;
+
+	debugfs_create_file("write_protect", 0644, dir,
+			    client, &tps25990_write_protect_fops);
+
+	return 0;
+}
+
+#else
+static inline int tps25990_init_debugfs(struct i2c_client *client)
+{
+	return 0;
+}
+#endif
+
+/*
+ * TPS25990 has history reset based on MIN/AVG/PEAK instead of per sensor type
+ * Emulate the behaviour a pmbus limit_attr would have for consistency
+ *  - Read: Do nothing and emit 0
+ *  - Write: Check the input is a number and reset
+ */
+static ssize_t tps25990_history_reset_show(struct device *dev,
+					   struct device_attribute *devattr,
+					   char *buf)
+{
+	return sysfs_emit(buf, "0\n");
+}
+
+static ssize_t tps25990_history_reset_store(struct device *dev,
+					    struct device_attribute *devattr,
+					    const char *buf, size_t count)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	s64 val;
+	int ret;
+
+	if (kstrtos64(buf, 10, &val) < 0)
+		return -EINVAL;
+
+	ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
+				     BIT(attr->index), BIT(attr->index));
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_RW(highest_history_reset, tps25990_history_reset, 7);
+static SENSOR_DEVICE_ATTR_RW(average_history_reset, tps25990_history_reset, 6);
+static SENSOR_DEVICE_ATTR_RW(lowest_history_reset,  tps25990_history_reset, 5);
+
+static struct attribute *tps25990_attrs[] = {
+	&sensor_dev_attr_highest_history_reset.dev_attr.attr,
+	&sensor_dev_attr_average_history_reset.dev_attr.attr,
+	&sensor_dev_attr_lowest_history_reset.dev_attr.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(tps25990);
+
+static int tps25990_get_addr(int reg)
+{
+	switch (reg) {
+	case PMBUS_SMBALERT_MASK:
+		/*
+		 * Note: PMBUS_SMBALERT_MASK is not implemented on this chip
+		 * Writing to this address raises CML errors.
+		 * Instead it provides ALERT_MASK which allows to set the mask
+		 * for each of the status registers, but not the specific bits
+		 * in them.
+		 * The default setup assert SMBA# if any bit is set in any of the
+		 * status registers the chip has. This is as close as we can get
+		 * to what pmbus_irq_setup() would set, sooo ... do nothing.
+		 */
+		return -ENXIO;
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		/*
+		 * VIREF directly sets the over-current limit at which the eFuse
+		 * will turn the FET off and trigger a fault. Expose it through
+		 * this generic property instead of a manufacturer specific one.
+		 */
+		return TPS25990_VIREF;
+	case PMBUS_VIRT_READ_VIN_MAX:
+		return TPS25990_READ_VIN_PEAK;
+	case PMBUS_VIRT_READ_VIN_MIN:
+		return TPS25990_READ_VIN_MIN;
+	case PMBUS_VIRT_READ_VIN_AVG:
+		return TPS25990_READ_VIN_AVG;
+	case PMBUS_VIRT_READ_VOUT_MIN:
+		return TPS25990_READ_VOUT_MIN;
+	case PMBUS_VIRT_READ_VOUT_AVG:
+		return TPS25990_READ_VOUT_AVG;
+	case PMBUS_VIRT_READ_IIN_AVG:
+		return TPS25990_READ_IIN_AVG;
+	case PMBUS_VIRT_READ_IIN_MAX:
+		return TPS25990_READ_IIN_PEAK;
+	case PMBUS_VIRT_READ_TEMP_AVG:
+		return TPS25990_READ_TEMP_AVG;
+	case PMBUS_VIRT_READ_TEMP_MAX:
+		return TPS25990_READ_TEMP_PEAK;
+	case PMBUS_VIRT_READ_PIN_AVG:
+		return TPS25990_READ_PIN_AVG;
+	case PMBUS_VIRT_READ_PIN_MAX:
+		return TPS25990_READ_PIN_PEAK;
+	case PMBUS_VIRT_READ_VMON:
+		return TPS25990_READ_VAUX;
+	case PMBUS_VIRT_SAMPLES:
+		return TPS25990_PK_MIN_AVG;
+	}
+
+	/* Let the register check do its job */
+	if (reg < PMBUS_VIRT_BASE)
+		return reg;
+
+	return -ENXIO;
+}
+
+/*
+ * Some registers use a different scale than the one registered with
+ * pmbus_driver_info. An extra conversion step is necessary to adapt
+ * the register value to the conversion on the sensor type
+ */
+static int tps25990_read_adapt_value(int reg, int val)
+{
+	switch (reg) {
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_POWER_GOOD_OFF:
+		/*
+		 * These registers provide an 8 bits value instead of a
+		 * 10bits one. Just shifting twice the register value is
+		 * enough to make the sensor type conversion work, even
+		 * if the datasheet provides different m, b and R for
+		 * those.
+		 */
+		val <<= TPS25990_8B_SHIFT;
+		break;
+
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_NUM, TPS25990_VIN_OVF_DIV);
+		val += TPS25990_VIN_OVF_OFF;
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_NUM, TPS25990_IIN_OCF_DIV);
+		val += TPS25990_IIN_OCF_OFF;
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		val = 1 << val;
+		break;
+	}
+
+	return val;
+}
+
+static int tps25990_read_word(struct i2c_client *client,
+			      int page, int phase, int reg)
+{
+	int ret, addr;
+
+	addr = tps25990_get_addr(reg);
+	if (addr < 0)
+		return addr;
+
+	switch (reg) {
+	case PMBUS_VIRT_SAMPLES:
+		ret = pmbus_read_byte_data(client, page, addr);
+		ret = FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		ret = pmbus_read_byte_data(client, page, addr);
+		break;
+
+	default:
+		ret = pmbus_read_word_data(client, page, -1, addr);
+		break;
+	}
+
+	if (ret >= 0)
+		ret = tps25990_read_adapt_value(reg, ret);
+
+	return ret;
+}
+
+static int tps25990_write_adapt_value(int reg, int val)
+{
+	switch (reg) {
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+	case PMBUS_POWER_GOOD_OFF:
+		val >>= TPS25990_8B_SHIFT;
+		val = clamp(val, 0, 0xff);
+		break;
+
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		val -= TPS25990_VIN_OVF_OFF;
+		val = DIV_ROUND_CLOSEST(val * TPS25990_VIN_OVF_DIV, TPS25990_VIN_OVF_NUM);
+		val = clamp_val(val, 0, 0xf);
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		val -= TPS25990_IIN_OCF_OFF;
+		val = DIV_ROUND_CLOSEST(val * TPS25990_IIN_OCF_DIV, TPS25990_IIN_OCF_NUM);
+		val = clamp_val(val, 0, 0x3f);
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		val = clamp_val(val, 1, 1 << PK_MIN_AVG_AVG_CNT);
+		val = ilog2(val);
+		break;
+	}
+
+	return val;
+}
+
+static int tps25990_write_word(struct i2c_client *client,
+			       int page, int reg, u16 value)
+{
+	int addr, ret;
+
+	addr = tps25990_get_addr(reg);
+	if (addr < 0)
+		return addr;
+
+	value = tps25990_write_adapt_value(reg, value);
+
+	switch (reg) {
+	case PMBUS_VIRT_SAMPLES:
+		ret = pmbus_update_byte_data(client, page, addr,
+					     PK_MIN_AVG_AVG_CNT,
+					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		ret = pmbus_write_byte_data(client, page, addr,
+					    value);
+		break;
+
+	default:
+		ret = pmbus_write_word_data(client, page, addr, value);
+		break;
+	}
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+static const struct regulator_desc tps25990_reg_desc[] = {
+	PMBUS_REGULATOR_ONE("vout"),
+};
+#endif
+
+static const struct pmbus_driver_info tps25990_base_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_VOLTAGE_IN] = 5251,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.m[PSC_VOLTAGE_OUT] = 5251,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_TEMPERATURE] = 140,
+	.b[PSC_TEMPERATURE] = 32100,
+	.R[PSC_TEMPERATURE] = -2,
+	/*
+	 * Current and Power measurement depends on the ohm value
+	 * of Rimon. m is multiplied by 1000 below to have an integer
+	 * and -3 is added to R to compensate.
+	 */
+	.format[PSC_CURRENT_IN] = direct,
+	.m[PSC_CURRENT_IN] = 9538,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = -6,
+	.format[PSC_POWER] = direct,
+	.m[PSC_POWER] = 4901,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -7,
+	.func[0] = (PMBUS_HAVE_VIN |
+		    PMBUS_HAVE_VOUT |
+		    PMBUS_HAVE_VMON |
+		    PMBUS_HAVE_IIN |
+		    PMBUS_HAVE_PIN |
+		    PMBUS_HAVE_TEMP |
+		    PMBUS_HAVE_STATUS_VOUT |
+		    PMBUS_HAVE_STATUS_IOUT |
+		    PMBUS_HAVE_STATUS_INPUT |
+		    PMBUS_HAVE_STATUS_TEMP |
+		    PMBUS_HAVE_SAMPLES),
+	.read_word_data = tps25990_read_word,
+	.write_word_data = tps25990_write_word,
+	.groups = tps25990_groups,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+	.reg_desc = tps25990_reg_desc,
+	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+};
+
+static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ "tps25990" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
+
+static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps25990" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tps25990_of_match);
+
+static int tps25990_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct pmbus_driver_info *info;
+	u32 rimon = TPS25990_DEFAULT_RIMON;
+	int ret;
+
+	ret = device_property_read_u32(dev, "ti,rimon-milli-ohms", &rimon);
+	if (ret == -EINVAL) {
+		dev_warn(dev,
+			 "using default rimon: current and power scale possibly wrong\n");
+	} else if (ret < 0) {
+		return dev_err_probe(dev, ret, "failed get rimon\n");
+	}
+
+	/*
+	 * TPS25990 may be stacked with several TPS25895, allowing a higher
+	 * current. The higher the allowed current is, the lower rimon
+	 * will be. How low it can realistically get is unknown.
+	 * To avoid problems with precision later on, rimon is provided in
+	 * milli Ohms. This is a precaution to keep a stable ABI.
+	 * At the moment, doing the calculation with rimon in milli Ohms
+	 * would overflow the s32 'm' in the direct conversion. Convert it
+	 * back to Ohms until greater precision is actually needed.
+	 */
+	rimon /= 1000;
+
+	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Adapt the current and power scale for each instance */
+	info->m[PSC_CURRENT_IN] *= rimon;
+	info->m[PSC_POWER] *= rimon;
+
+	ret = pmbus_do_probe(client, info);
+	if (ret < 0)
+		return ret;
+
+	return tps25990_init_debugfs(client);
+}
+
+static struct i2c_driver tps25990_driver = {
+	.driver = {
+		.name = "tps25990",
+		.of_match_table = tps25990_of_match,
+	},
+	.probe = tps25990_probe,
+	.id_table = tps25990_i2c_id,
+};
+module_i2c_driver(tps25990_driver);
+
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_DESCRIPTION("PMBUS driver for TPS25990 eFuse");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);

-- 
2.45.2


