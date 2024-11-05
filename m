Return-Path: <linux-i2c+bounces-7799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F49BD3FF
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 19:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3AD51F21CFC
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 18:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74F21EF921;
	Tue,  5 Nov 2024 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UOnx50Za"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B561EABDB
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829556; cv=none; b=Q/bAb6er7ALgAu4ITa7BmbiGnAreBEHq4yGlrD4TMgCtsNUNTfAutvC9BVge0b2mEbW6X9iv3rlIMOaWqt+NGZTsNP37+R/5TscV0bxyOJAcYk06UbMTvuWM0YtDUgh9ySdR3D9Aq36B7itx91UUDZMGxakNCGZkXfsb840Kgw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829556; c=relaxed/simple;
	bh=RLB3sVstsPZOl4NYHaKvOo3xvDvLATBWGLDO+8mfWN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kq7dkKvMlHskShhguOMnlLzPICyS5i/ypNSZwIlJ+I4RhUOYAnLrwxMl5deKTrBW9IKP1DO3+Lll1ru/4RID8Ed+rM3NdhJmk+kP7JKicltFMTMgn/rSuzoH7Pqy7fzqhfSGCJvUyXuqUMJJY/gFgZGLVCEOMVvCgTXik+jWR2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UOnx50Za; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d41894a32so22093f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730829552; x=1731434352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YT0EQzs6P4/HctmFJsuP9gW/Gn1w3oISR3VGG1uCMZs=;
        b=UOnx50ZaZmFwypeT1eDPylrTUw4NxG8KIcCUCuoa6gaDKfG7XAUCkwTInW+8xMd7G3
         OokWBoqn3OI+8vGPrnmoe4FtivJCDSezepSSkeqyYjcAcN+zQzuASXB9Jbo3269bbvwc
         vzswcIUw8577+EZHdo4QY9E488NXKmboenfrraoaMBiWape7h86pYmwsKMUkZ6ORdzv5
         w003tTgcTM+WZv6AAwGC2bpm5iAzyXe4jdLxUb+eiz0JS/JWPDjnzGvGLohnAzGN1g1i
         p/3u/OoTOxzx58JDkwSGfUsjA7sSiyvShH73h99Si1rXxcCwWkyPnxSwR9q0QxZleNgF
         J1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829552; x=1731434352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YT0EQzs6P4/HctmFJsuP9gW/Gn1w3oISR3VGG1uCMZs=;
        b=GiUb9hBIghk1d4blBUz3NL87fcJSpp9wejckwd6L+LU/89xu0YPCWnnrvrUTGG1ZU2
         GdhqsR9IuD6Z1PFxH3gMMVQcxYprV+s8vmzuS94iv9R97yUINJRb2BbO0ChiEENAJw8h
         uJNemAdRy4kJmQeHdpLAt4WJILNc90FBAatqj7pQi8YbOcZxp1b8XvE9Gjb9kYqg7XcW
         um1dLl9VWVhQm21BWzTUSHAMrMIdGOgE8+L09wMJy6VjJ7FPA01GOPdmj6lUIz1WMSt3
         7E+IbMAy92bK7G7m4u8v+hLx09949aFwPgRC2KHa+z2FCFfJFE4LhJ4vlch3VGVnru+V
         ZQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCWFIpH27+XZBaLz16ukuXNdy+LNrUHH2p2aJ0pLe22EDdKuYiLFXsrLugRPHuzqX5xHDRqXyaQvIU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz96E4o7Vs6HXZTs8EC/FAjzmtfTJvsfUB1mlnoTlk5CvPb6pgw
	BiEehNHp5CG34X85fVZeTRKQUgPQLcz3yJSFsHERP1J/SKbR/Cx35wiAcG+qAkw=
X-Google-Smtp-Source: AGHT+IGcWTwDRTDcw+ZO+JsxGMS6nwNXouWNDdJqSPfri6MQKA9BBdXmjhQTuqf0gapKLFsd3WJRTQ==
X-Received: by 2002:a05:6000:1f8f:b0:37c:ce3c:e15d with SMTP id ffacd0b85a97d-381c149bdf0mr16994455f8f.14.1730829551852;
        Tue, 05 Nov 2024 09:59:11 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5b9b:df02:2761:7a57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm16959481f8f.70.2024.11.05.09.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:11 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 05 Nov 2024 18:58:44 +0100
Subject: [PATCH v4 7/7] hwmon: (pmbus/tps25990): add initial support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-tps25990-v4-7-0e312ac70b62@baylibre.com>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
In-Reply-To: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18211; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RLB3sVstsPZOl4NYHaKvOo3xvDvLATBWGLDO+8mfWN8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnKlznwjVbCdtnyQQmQFSzVpygXTVy3nBGl5+Gi
 +7uSPnQcXeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZypc5wAKCRDm/A8cN/La
 hbm+D/0ZvxwT8z2zyoHzPzHsYxwcaCPF0K2RN+2T/tmK8qD+oY6QCwVOkuavpZi7v803bHzElc5
 1foIhGAeIYRHUbGYKUmaQELJOioFtlg7bO3cx/o4YXRHgrqlMV4awm868hdgtvH5kYUiX2xwuav
 qHAbSup6JwRCnyPXmJppWEX4jOTucHIuE3GSrSSFdQt8L7tlsjhKsN3kzbvtmtP+XFXlTAKtAHK
 nZtGYPF4kgDry32wJKFmO1ezfDzGpOIFbt1Ee3HDZ39IgvA8H/GU4uDs7AfSetLAfexHEHElQGy
 xRVjFq+eACAtTbPds31Wb4HLb7sMUv4szVkN51We6URaGxCU7oiex6fBdJbLav/sbl+P4hjLESJ
 4aBj16OWxr2Ld+3AdIgj0zUBkKFDKAE9RYJvvf2ATQ6xjH9+4XU+EO9vDTZmsspF8IZCtiF8eOO
 gF6IKuX4RjrPv/pmNAD1aStQmR1/sVDZUQiMmnDh770J2hl15JLi7n47VXHKVeVnXqY3JHvTXMh
 c8Zd+uzKYn5Q1tGX2Oj4PrW7rWsY03Mx+YkpFYNIuIQ08SPI5lfdzsFiUSXBIZXRrR9qfeA6Acf
 Bi559TN3nMbLlBQLR4KoR8EAoJKa8p2IDF8DJRi7drzc5tAXjMzautK2P6+JIhx7m4BgqF8CNDx
 7N+KQruqpRNBmDg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add initial support for the Texas Instruments TPS25990 eFuse.
This adds the basic PMBUS telemetry support for the device.

Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/tps25990.rst | 148 ++++++++++++++
 MAINTAINERS                      |   2 +
 drivers/hwmon/pmbus/Kconfig      |  17 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/tps25990.c   | 428 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 597 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 55f1111594b2e9ada4a881e5d4d8884f33256d1f..1a3cb0a59f7210b8a5e972a8015658b983834cd2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -236,6 +236,7 @@ Hardware Monitoring Kernel Drivers
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 4f21d7d2ce992f14d8c533f0c8742edb22a0db3f..10a65cd5c84e56cf876ee5eb06336b5bc8ff991c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22816,6 +22816,8 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+F:	Documentation/hwmon/tps25990.rst
+F:	drivers/hwmon/pmbus/tps25990.c
 
 TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
 M:	Robert Marko <robert.marko@sartura.hr>
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index f6d3528419536a68011d67a4a239c0cba1bbf475..22418a05ced0c4d7025a243134f231c54c741371 100644
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
index 0000000000000000000000000000000000000000..db59638f6c626f2467b859f023523276cfb6c3a5
--- /dev/null
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2024 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/bitfield.h>
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
+					  TPS25990_IIN_OCF_NUM);
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


