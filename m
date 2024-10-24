Return-Path: <linux-i2c+bounces-7558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 198329AEF6B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 20:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3BC2825F6
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 18:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6D82071E8;
	Thu, 24 Oct 2024 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q3IrSMpK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E2204090
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793478; cv=none; b=cILNuSqTbB4mPtHXoHu/LJVqOSxp6ngYBmb1qFQMBHySkJQA4omSsJTK2Zr0Vj0I4ElEXXBp1PuIVIO/YwybTI/Asa6yGZO9IB+sWhmkNzXcgYC55NuiXpdqVN+qTWrtjqZgL4Zg5BD+xTfkE3VShPK5QZLkW3YuE2ZL62qfVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793478; c=relaxed/simple;
	bh=dnVmdKGfMttMrhnLQqDF6zBl6BlDDz2flspxyvtR8h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uo6E2+0Acq+/wtWb1bk5wuxDimCnjLb7IUM1GvKfjhUkjRnf1d7MUzF71NxndnFexm4jNtXIrjKCc/iagaX5zC4RQY1MrV3LniyOZGEwzbPW1QKUYXpLcbVnlrKHbTsP1dK+0AFaqrN229XWTWAzUbrlQfckRhaPdM9rI68+2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q3IrSMpK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so12241045e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 11:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793471; x=1730398271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fBlSDoY+5BLQB4T9iJPW3gISJHh53NPyolTJhArp4s=;
        b=q3IrSMpKBq2LwCMBviEYnWXYJkec9eumRGQThZwqVkj9JCB8/KrRa9DrmPYLm0aFgS
         Rsqfxpkgq4sspjZq5CNgHddlBTuf74pu0ofXF9PQiiQbWrjkqZR2p54BfMVl/Y/COyL0
         fE+nCiSZEvUiP/kbfpon6NSbcEFgit3N1pCcm6Xownelvjv1c7Y8qQeVcgwq8Y6oZzi8
         ozPShtqxi9dfqcUPx27RCmVuQvvTAqmLAoBWCYq39cEvrls6KHOPL4YbUtyaZHQaxu8L
         MpAmknCM0+KpplIyuLXh1HrG6MDoRRkOzzNUAkuIFL6O93KpiOZ/ccWSrR/rp+e7pmxL
         iGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793471; x=1730398271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fBlSDoY+5BLQB4T9iJPW3gISJHh53NPyolTJhArp4s=;
        b=ezKnqFrh8J8UOVsqtGg/bdEISpl+6Eyo/K2fIkFIxyVS1DAUFd9ulBwHX66gWytmRM
         Ksx1lI3X0HlKxFzvNu0RGWlr7nUAJNVYi82fjzuM6oEiNKRCCgI6CP2z7q5/rGWwb4ud
         IXs3bUzp02Web4Arw78iWrCPsvcVMvWyAmt0rW7QTiAERKHP3tB7OIjCeT2CgIXffa8G
         q3ZSBUBquGV6YvqcNhoP1KiqMPVMyTbLjCk+3jqgFBm9Ne+iB2o25tyLwGvxKTJqypMs
         WvZBUiZkSEo0BEyEPIkk3oIICR6txyB9cERlkrQWjZjsNiuWWaKpzeCAeJwqkwwiuMDk
         4jwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGSSBglAGX6vCo0uvTHrb4Ywyotiobe+6Dhfzui9ZfW+c5sy8QirKI07tbFWhXRwQAgItKEBj3Xcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6XfpdsH0lBFSNbYWgG/JLKWemDRRKAqAW9hB43m5fZ+4Rjx5
	a26cnmN7kIswHzYtIx/mTO8Mg7CnmyLNeGap4RWNDHKAR4TGkLyF5hc5m8OwvTU=
X-Google-Smtp-Source: AGHT+IGnJ7UXHQSQv9VwCwcuhJCbOBSacO9Xjqh6fDmXVVextwa7v9crkMuTvZCttaMnsxO+9KKUNw==
X-Received: by 2002:a05:600c:4750:b0:431:60ec:7a91 with SMTP id 5b1f17b1804b1-43184130160mr58600405e9.2.1729793471465;
        Thu, 24 Oct 2024 11:11:11 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Oct 2024 20:10:40 +0200
Subject: [PATCH v3 6/6] hwmon: (pmbus/tps25990): add initial support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-tps25990-v3-6-b6a6e9d4b506@baylibre.com>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
In-Reply-To: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Vaishnav Achath <vaishnav.a@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17614; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dnVmdKGfMttMrhnLQqDF6zBl6BlDDz2flspxyvtR8h0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo20PyvNTjqqcXPBmS6F7j9CpNnxqycecokU4
 msjgcyRM3WJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNtAAKCRDm/A8cN/La
 ha0JD/wLII2AZhDufKeOzwaPF+VGMYlHQvkAADxMq7RsNe+s3bgozJL56t/DuBI8160blOA9YJB
 Ei4HRBQdXnlEHiPku7kv9X87yUubNOhG+SixqkFGiT4KtUO+4cl9bf1otlK5REt66NyetumDSnP
 bCwWbLzwe86MIXBbMBX/ydf2leuNHn7/Ojo63Hbyh4OIKmbHY+v1trSXrA+ckHJg1Zn75bGkrBi
 GaeogrTXXtFglBOk4FXDkDYPo9XHdaVjWpib8mQRuViELyPAJvJaghBvzFpToMeE6mGfPCShH6t
 PEyWdcRWXogPXzEXRhAPPPHeUeELK0viITmDQhp3Kqr2Qgb34wFxEKu6zURaZxZLEdnGiPXjadf
 zT8J6ItVCBfPDHymoHuNT9Fc6UWh8ibxAEhq31u7NfPd2s8bujzDsYN/cgj8mLI5Aioho6RtnjB
 F07Dwsye5yf9g/UhCRiDbpY6KJWc49Lr8nOZQ6RHnkWji+NAOzUXhi/iE7gP2lVyjcsxEaS9gmU
 O+0KLxS0eyYl5d6exvJMbRBS33yD9WKNKEasDJV/PNn2T58ct87m4+Y6bx2giI9UFOcm5hPLWMc
 kioUkdBbI/XhFW7RpZV9jJQeBxNQgLD41GXun5MCfyeL2rnrxU1oocarbeWIdA8Bcdp9rtU/0eB
 vwYMoxPlNwAGpXA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add initial support for the Texas Instruments TPS25990 eFuse.
This adds the basic PMBUS telemetry support for the device.

Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/tps25990.rst | 148 ++++++++++++++
 drivers/hwmon/pmbus/Kconfig      |  17 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/tps25990.c   | 427 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 594 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 4d15664bc41e3a675154d60759a73d827c5a0b67..7a59f3374439fe39949b46f73fb0f9a68fb168ef 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -235,6 +235,7 @@ Hardware Monitoring Kernel Drivers
    tmp464
    tmp513
    tps23861
+   tps25990
    tps40422
    tps53679
    tps546d24
diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
new file mode 100644
index 0000000000000000000000000000000000000000..ed9e74d43e2c2f070d3abe987d93bcdfcf2162ec
--- /dev/null
+++ b/Documentation/hwmon/tps25990.rst
@@ -0,0 +1,148 @@
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
+Due to the specificities of the chip, all history reset attributes
+are tied together. Resetting the history of a sensor, resets the
+history of all the sensors.
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
+**curr1_reset_history**
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
+**in1_reset_history**
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
+**in3_reset_history**
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
+**power1_reset_history**
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
+**temp1_reset_history**
+
+The driver provides the following attributes for sampling:
+
+**samples**
+
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a4f02cad92fdadaafb15bb8459bf56f8e1722568..a3fd442e02774bf3909bf348e471e04c4ab0043a 100644
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
+	default SENSORS_TPS25990
+	help
+	  If you say yes here you get regulator support for Texas Instruments
+	  TPS25990.
+
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index d00bcc758b97200b80158e33b0ac41e6e5ac3231..3d3183f8d2a7060eb513f54f4f0a78ba37c09393 100644
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
index 0000000000000000000000000000000000000000..03848d671c1014bdccabea62c2bce1b94e568df1
--- /dev/null
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -0,0 +1,427 @@
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
+#define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
+					 PK_MIN_AVG_RST_AVG  | \
+					 PK_MIN_AVG_RST_MIN)
+
+/*
+ * Arbitrary default Rimon value: 1kOhm
+ * This correspond to an overcurrent limit of 55A, close to the specified limit
+ * of un-stacked TPS25990 and makes further calculation easier to setup in
+ * sensor.conf, if necessary
+ */
+#define TPS25990_DEFAULT_RIMON		1000000000
+
+static void tps25990_set_m(int *m, u32 rimon)
+{
+	u64 val = ((u64)*m) * rimon;
+
+	/* Make sure m fits the s32 type */
+	*m = DIV_ROUND_CLOSEST_ULL(val, 1000000);
+}
+
+static int tps25990_mfr_write_protect_set(struct i2c_client *client,
+					  u8 protect)
+{
+	/*
+	 * The chip has a single protection mode, set it regardless of
+	 * the specific protection requested
+	 */
+	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
+				     protect ? 0x0 : 0xa2);
+}
+
+static int tps25990_mfr_write_protect_get(struct i2c_client *client)
+{
+	int ret = pmbus_read_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret & TPS25990_UNLOCKED) ? 0 : PB_WP_ALL;
+}
+
+static int tps25990_read_word_data(struct i2c_client *client,
+				   int page, int phase, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIRT_READ_VIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_VIN_MIN:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VIN_MIN);
+		break;
+
+	case PMBUS_VIRT_READ_VIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_VOUT_MIN:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VOUT_MIN);
+		break;
+
+	case PMBUS_VIRT_READ_VOUT_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VOUT_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_IIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_IIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_IIN_MAX:
+		return TPS25990_READ_IIN_PEAK;
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_IIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_TEMP_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_TEMP_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_TEMP_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_TEMP_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_PIN_AVG:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_PIN_AVG);
+		break;
+
+	case PMBUS_VIRT_READ_PIN_MAX:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_PIN_PEAK);
+		break;
+
+	case PMBUS_VIRT_READ_VMON:
+		ret = pmbus_read_word_data(client, page, phase,
+					   TPS25990_READ_VAUX);
+		break;
+
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		/*
+		 * These registers provide an 8 bits value instead of a
+		 * 10bits one. Just shifting twice the register value is
+		 * enough to make the sensor type conversion work, even
+		 * if the datasheet provides different m, b and R for
+		 * those.
+		 */
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			break;
+		ret <<= TPS25990_8B_SHIFT;
+		break;
+
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			break;
+		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
+					TPS25990_VIN_OVF_DIV);
+		ret += TPS25990_VIN_OVF_OFF;
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		/*
+		 * VIREF directly sets the over-current limit at which the eFuse
+		 * will turn the FET off and trigger a fault. Expose it through
+		 * this generic property instead of a manufacturer specific one.
+		 */
+		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
+		if (ret < 0)
+			break;
+		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
+					TPS25990_IIN_OCF_DIV);
+		ret += TPS25990_IIN_OCF_OFF;
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		ret = pmbus_read_byte_data(client, page, TPS25990_PK_MIN_AVG);
+		if (ret < 0)
+			break;
+		ret = 1 << FIELD_GET(PK_MIN_AVG_AVG_CNT, ret);
+		break;
+
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		ret = 0;
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int tps25990_write_word_data(struct i2c_client *client,
+				    int page, int reg, u16 value)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_IIN_OC_WARN_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_PIN_OP_WARN_LIMIT:
+		value >>= TPS25990_8B_SHIFT;
+		value = clamp_val(value, 0, 0xff);
+		ret = pmbus_write_word_data(client, page, reg, value);
+		break;
+
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+		value -= TPS25990_VIN_OVF_OFF;
+		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
+					  TPS25990_VIN_OVF_NUM);
+		value = clamp_val(value, 0, 0xf);
+		ret = pmbus_write_word_data(client, page, reg, value);
+		break;
+
+	case PMBUS_IIN_OC_FAULT_LIMIT:
+		value -= TPS25990_IIN_OCF_OFF;
+		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
+					TPS25990_IIN_OCF_NUM);
+		value = clamp_val(value, 0, 0x3f);
+		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
+		break;
+
+	case PMBUS_VIRT_SAMPLES:
+		value = clamp_val(value, 1, 1 << PK_MIN_AVG_AVG_CNT);
+		value = ilog2(value);
+		ret = pmbus_update_byte_data(client, page, TPS25990_PK_MIN_AVG,
+					     PK_MIN_AVG_AVG_CNT,
+					     FIELD_PREP(PK_MIN_AVG_AVG_CNT, value));
+		break;
+
+	case PMBUS_VIRT_RESET_TEMP_HISTORY:
+	case PMBUS_VIRT_RESET_VIN_HISTORY:
+	case PMBUS_VIRT_RESET_IIN_HISTORY:
+	case PMBUS_VIRT_RESET_PIN_HISTORY:
+	case PMBUS_VIRT_RESET_VOUT_HISTORY:
+		/*
+		 * TPS25990 has history resets based on MIN/AVG/PEAK instead of per
+		 * sensor type. Exposing this quirk in hwmon is not desirable so
+		 * reset MIN, AVG and PEAK together. Even is there effectively only
+		 * one reset, which resets everything, expose the 5 entries so
+		 * userspace is not required map a sensor type to another to trigger
+		 * a reset
+		 */
+		ret = pmbus_update_byte_data(client, 0, TPS25990_PK_MIN_AVG,
+					     PK_MIN_AVG_RST_MASK,
+					     PK_MIN_AVG_RST_MASK);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int tps25990_read_byte_data(struct i2c_client *client,
+				   int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_WRITE_PROTECT:
+		ret = tps25990_mfr_write_protect_get(client);
+		break;
+
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int tps25990_write_byte_data(struct i2c_client *client,
+				    int page, int reg, u8 byte)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_WRITE_PROTECT:
+		ret = tps25990_mfr_write_protect_set(client, byte);
+		break;
+
+	default:
+		ret = -ENODATA;
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
+	.read_word_data = tps25990_read_word_data,
+	.write_word_data = tps25990_write_word_data,
+	.read_byte_data = tps25990_read_byte_data,
+	.write_byte_data = tps25990_write_byte_data,
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
+	ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(dev, ret, "failed to get rimon\n");
+
+	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Adapt the current and power scale for each instance */
+	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&info->m[PSC_POWER], rimon);
+
+	return pmbus_do_probe(client, info);
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


