Return-Path: <linux-i2c+bounces-8287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51329DFEEE
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 11:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7618F282179
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 10:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7921FDE1D;
	Mon,  2 Dec 2024 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kAxv2/Iq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF521FCF68
	for <linux-i2c@vger.kernel.org>; Mon,  2 Dec 2024 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135307; cv=none; b=F6dbJAUJj9cdOfFNU7nJszAi0qfG/iM9aTvwr9YZ0xJd8JH6q18y91nNF+mJJhIt7o5XeuEI6UwS60z6zQVwANU9sJUwq/y6AClqUziAWd3aE+xCU5XmoPR5mCU8HtgUVOLVPiIsLGm9jMeQ/SXfNE+5TefWpfdVB4u84qKT+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135307; c=relaxed/simple;
	bh=Mp4JaGDf8RIfZ2gITbOuevUVlePbK4AAdidvZXTBG3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ot2BLLn0nBu6Jz45R2PUeZHAui3EiSHr6ZHVJSNbF+/qWoVCdCJClk1kl4EuDuJ8xOWQftQgxtLgz0WUu1KFeJ2ZJevPSeV9FAZjdDWjWWubsMGTrm/JGrSDrrm4wj/jMam9Qc1OC6GoEbHX9hwk6cS2L1QwFWLLlOJvyuZtT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kAxv2/Iq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so37344995e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 02 Dec 2024 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733135303; x=1733740103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9YBWMzhNECWhLMniTz+avyvLm5Y5kVBMt6bG/hgoTs=;
        b=kAxv2/Iq6lCwj07bQhAjjMGuKh7cAkCQiewnrwk4UNryVxufaWbTq6BqNzdTQBNu4y
         3Q7K4F5CmdxivLXvtpUV611d6d8kCzC73bl7FI2YeKGkhd9dDdof818ZIUIkxyD4rdri
         3q0dHO9A3S0jdl+eqD4JtCUGGU3TJHvHsLlkgAlfyOpAsbI8uNmZc7t/UcX8Y8js1Rg+
         5vCs7gusKPx8W7xgbudTviDgDST9vjiqXEr3PEGoWJwvSorNU24B3hGJ8RYF6cR1YXCG
         KcU9j70X+B6ERqclNAl6ySUtZ1EmI7qPwl01JW6QoE1d/wd3yMZs2+btw7nxDs5dLdCa
         +sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135303; x=1733740103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9YBWMzhNECWhLMniTz+avyvLm5Y5kVBMt6bG/hgoTs=;
        b=aaEVoQBkyZF8ivUfkI67T1G/e4b4GYxGIXF0Deqrx3itfo2/8WUJBv6hNSWqIK56en
         unfGnW0uwa9FaBe4+k0OPpWVP/nmK6HjVkqyIFtQK4P0JdLji7XjSwvNfjNe6WayyA0F
         2Wggrk4YEVjrSYoyOy/xx5S/MT2qGXwgY2ve6a8TyfHQQTNO+eQqWAIIBPS2p1l3d/Yw
         WpBI648FAMkC4IqReWFmEyh/84cmyf0VcU7BnBTRF2KN8KswlqLAVZbIjcKom+usNLWX
         cJ56n5aqeKjELoFEKkwwvD2oGM1l9Kb+2XtjuysOYk5FNS61Q3RPenfc2yIHiQ3zBnch
         oRyA==
X-Forwarded-Encrypted: i=1; AJvYcCXkOM2Vy4cMXDzv79r9kkhoWVrK/MbhYiW7E7nGYwnKg5wOz6gP9DYbAqstAYidB6xmjONsZoFSmJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhgv1d6HodwWdyCloPVgpZJSEn75wzhJmI5U6qUAoifWif33mp
	aF/Hb+UE08euNmk4HjOsywRZJzPqHIY/Ecm4fEIFYv9ekeDUy2UYdzZHLLQtMxE=
X-Gm-Gg: ASbGncs8TtgML19qahqhjG0asptYuqA39xrV6AMg8i9TdKlA2zWq6SH3B1m33M2YXt9
	Vq4s65NKD8LjViIvUWKv8bHVs/kxfh08MWZpbsuj/vmdLib7eVvlSKwa0HtYaQ0pstrBVnK1Msl
	tWuwl1woOC7QLS2stfVQYxEOOjRtvjeN3BqYccTH/y4uIXCxezs2lKkmJZ75jxKTVo8mHwxXC+o
	3CuD/2qyxJN1yr1zpgoFV1c+l57BbWzpmG7fdp+tE/uKf93S58YiyaMdo3AoQ==
X-Google-Smtp-Source: AGHT+IEDPFaujkYdtoKhRpb7JaNkSu64S0VAdc2uPnYiwQbifMvKTluFclZa9LGlEH1tN1qYPAY9Lw==
X-Received: by 2002:a05:6000:1865:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-385c6edb1acmr18950942f8f.38.1733135301342;
        Mon, 02 Dec 2024 02:28:21 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2380:13:b62c:611c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-385e940fef3sm5757614f8f.42.2024.12.02.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:28:20 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 02 Dec 2024 11:28:02 +0100
Subject: [PATCH v4 3/3] hwmon: (pmbus/tps25990): add initial support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-tps25990-v4-3-bb50a99e0a03@baylibre.com>
References: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
In-Reply-To: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Vaishnav Achath <vaishnav.a@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18233; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Mp4JaGDf8RIfZ2gITbOuevUVlePbK4AAdidvZXTBG3M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnTYvAcZmAOr87NavavRvvzC2FVO4W/3PVMRME1
 1yqVLJtvVKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ02LwAAKCRDm/A8cN/La
 hQjuD/40BBwOWaBljfWuQGni2wKQBpRmxfQ0i5SpS+DvQVVh7ttCR62ABdWcuRWJu3WZY0E7frv
 KpwyFu2boAtMNJLBo277jRpjrpXbOnYnYRFUJenicNr/CMl2R3OmclD63aeHz0dWfJaOSab+Z8C
 wkoh9joD3DSwM/BgRuV/fDcypAyzpu/U442JJ4if1T9jyQWLAMRg8SDuARXCCB/wZTgGIv9gi2s
 EXIKo7rWrNHGxERDZRnMBJqGrL/QgZwFT8pl4pd0iW1+eUNpGO1UqLdCK72iKRjEgFNLkHjB101
 yqki+wYAmGPiDYL8/cbO57vzCbqInn1jbdWCxBjAn9TE5DPItZbQs/uuo3y1yZzmvsTim9X8gFF
 GFP8icCVD+AKikNusKrh7vtU6wv4AbbxcHoQ6B/yueIKKNv2VQwYUPM8Lar6TqrRh0DE6jChbNQ
 MM5L0/iguSzp7Y41KqdkfFBseW2z2okRnb1wIEXGCurvzWSplTP6f7ghyL53wC3xy4bZIMEtAR+
 fS2MRooPo++WhyUhv44t8nOpnu9N/xWikeywwflignPRYwtCq710yU15TUBrwbFFgoLCvtT0zG5
 l6TDl2ykML2scxY8NYOnGME7bD5W34GzYxHiPZO15s7FZ/wO6Fcxi2ReMlVowDNqTul/cNJB+Vp
 /5Iz54DhL9kw2jQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add initial support for the Texas Instruments TPS25990 eFuse.
This adds the basic PMBUS telemetry support for the device.

Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/tps25990.rst | 148 +++++++++++++
 MAINTAINERS                      |   2 +
 drivers/hwmon/pmbus/Kconfig      |  17 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/tps25990.c   | 437 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 606 insertions(+)

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
index 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..b49e48bd356d8717b11692117723f3caaa5417a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23215,6 +23215,8 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
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
index 0000000000000000000000000000000000000000..0a267014c88997fca5e83b2ec974a0d521808512
--- /dev/null
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -0,0 +1,437 @@
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
+	u8 val;
+
+	switch (protect) {
+	case 0:
+		val = 0xa2;
+		break;
+	case PB_WP_ALL:
+		val = 0x0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
+				     val);
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


