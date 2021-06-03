Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263D739AE46
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 00:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCWnY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 18:43:24 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:55991 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhFCWnW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 18:43:22 -0400
Received: by mail-wm1-f45.google.com with SMTP id g204so4271026wmf.5;
        Thu, 03 Jun 2021 15:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3QfIydZGkGipcvDZNw73YLVb3iWu6audWMrUd8HLug=;
        b=IE850zi5NfWVjbNQqLKrNXQ2B8+A3QkwxfHQBdv8nNEJ/QDlymbFB315ixIMLQzkkt
         J4KqT0dA1h6s10vve/AhkxEX4Y8UhbvNn7bdlwkFaZiHZoOMLtxV77frOVYQBrR70c7z
         FlazxVAuZ3ujJtp8EZlkvPuOYiAs2m9tE3SISGT6IG1T4pwE5wkgxw8PpLnPuBAS8keP
         UUOjGyomlg1w1+VYdGXt0nCK/IBIdswNkNbJ/Bw6RKuyoTR0b3klEVnKQ2JJuqR6eWut
         uv6ZRm8lBff1D/ul/L/Bboywd0tg2LubR7ftIhxhHIuKsG9OYBrZsmPxXGvH+4MT8O2N
         Iaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3QfIydZGkGipcvDZNw73YLVb3iWu6audWMrUd8HLug=;
        b=dTDRj4Gckji7KTX/mYGyC89IrzqjwpyMNuEhwC7kK9Z0HhdXl82+jfX7I3bgD8RDgR
         sYO1tICL47ZJimESSz36iXjPru2XuDe8kAW6AZi45HHkLm8Tb+YRgwLeF+g9zWKg/LjD
         I2LUqhpt2rryLYWh9tURyUsr6BJ1cAvPpRDKYGgd22RNkvNYc1qBu82MTOHlcD3D9GzT
         bG8/bVCC6d9W6TRPuLS9zxlI40HyF6nrMycYUpS0v4ypRVj6i0dPhT7eaFjKxdAE6UsO
         2OJAHWmIeHwv5RZO4TIxjP1setlvidoLju1EvW8/8BLBn1i5OxJiBPiFDzdYc3PRhQxX
         GOHQ==
X-Gm-Message-State: AOAM532d8Iac3WP5N0HYjQKlnAmKhiiE5tJHac6sUwCSPYgG/FuhlAIY
        6ecRfizcxNDeapjrSoRr+XqEL0vQmb8qog==
X-Google-Smtp-Source: ABdhPJxPO6qYV4aBDuJ2N+E77H1Tpas2++/lXEthBQmgenFk+Okdeo/bakVyhKXtLO1m9BVKU7N0kw==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr567314wmm.113.1622760027280;
        Thu, 03 Jun 2021 15:40:27 -0700 (PDT)
Received: from valhalla.home ([91.110.88.218])
        by smtp.gmail.com with ESMTPSA id f14sm4612103wry.40.2021.06.03.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:40:26 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 6/6] mfd: tps68470: Remove tps68470 MFD driver
Date:   Thu,  3 Jun 2021 23:40:07 +0100
Message-Id: <20210603224007.120560-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603224007.120560-1-djrscally@gmail.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver only covered one scenario in which ACPI devices with _HID
INT3472 are found, and its functionality has been taken over by the
intel-skl-int3472 module, so remove it.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v4:
	- None

 drivers/acpi/pmic/Kconfig |  2 +-
 drivers/gpio/Kconfig      |  2 +-
 drivers/mfd/Kconfig       | 18 --------
 drivers/mfd/Makefile      |  1 -
 drivers/mfd/tps68470.c    | 97 ---------------------------------------
 5 files changed, 2 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/mfd/tps68470.c

diff --git a/drivers/acpi/pmic/Kconfig b/drivers/acpi/pmic/Kconfig
index 56bbcb2ce61b..f84b8f6038dc 100644
--- a/drivers/acpi/pmic/Kconfig
+++ b/drivers/acpi/pmic/Kconfig
@@ -52,7 +52,7 @@ endif	# PMIC_OPREGION
 
 config TPS68470_PMIC_OPREGION
 	bool "ACPI operation region support for TPS68470 PMIC"
-	depends on MFD_TPS68470
+	depends on INTEL_SKL_INT3472
 	help
 	  This config adds ACPI operation region support for TI TPS68470 PMIC.
 	  TPS68470 device is an advanced power management unit that powers
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6727fd..10228abeee56 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1367,7 +1367,7 @@ config GPIO_TPS65912
 
 config GPIO_TPS68470
 	bool "TPS68470 GPIO"
-	depends on MFD_TPS68470
+	depends on INTEL_SKL_INT3472
 	help
 	  Select this option to enable GPIO driver for the TPS68470
 	  chip family.
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 5c7f2b100191..99c4e1a80ae0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1499,24 +1499,6 @@ config MFD_TPS65217
 	  This driver can also be built as a module.  If so, the module
 	  will be called tps65217.
 
-config MFD_TPS68470
-	bool "TI TPS68470 Power Management / LED chips"
-	depends on ACPI && PCI && I2C=y
-	depends on I2C_DESIGNWARE_PLATFORM=y
-	select MFD_CORE
-	select REGMAP_I2C
-	help
-	  If you say yes here you get support for the TPS68470 series of
-	  Power Management / LED chips.
-
-	  These include voltage regulators, LEDs and other features
-	  that are often used in portable devices.
-
-	  This option is a bool as it provides an ACPI operation
-	  region, which must be available before any of the devices
-	  using this are probed. This option also configures the
-	  designware-i2c driver to be built-in, for the same reason.
-
 config MFD_TI_LP873X
 	tristate "TI LP873X Power Management IC"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 4f6d2b8a5f76..8b322d89a0c5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -105,7 +105,6 @@ obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
 obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
 obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
 obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
-obj-$(CONFIG_MFD_TPS68470)	+= tps68470.o
 obj-$(CONFIG_MFD_TPS80031)	+= tps80031.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
diff --git a/drivers/mfd/tps68470.c b/drivers/mfd/tps68470.c
deleted file mode 100644
index 4a4df4ffd18c..000000000000
--- a/drivers/mfd/tps68470.c
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * TPS68470 chip Parent driver
- *
- * Copyright (C) 2017 Intel Corporation
- *
- * Authors:
- *	Rajmohan Mani <rajmohan.mani@intel.com>
- *	Tianshu Qiu <tian.shu.qiu@intel.com>
- *	Jian Xu Zheng <jian.xu.zheng@intel.com>
- *	Yuning Pu <yuning.pu@intel.com>
- */
-
-#include <linux/acpi.h>
-#include <linux/delay.h>
-#include <linux/i2c.h>
-#include <linux/init.h>
-#include <linux/mfd/core.h>
-#include <linux/mfd/tps68470.h>
-#include <linux/regmap.h>
-
-static const struct mfd_cell tps68470s[] = {
-	{ .name = "tps68470-gpio" },
-	{ .name = "tps68470_pmic_opregion" },
-};
-
-static const struct regmap_config tps68470_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.max_register = TPS68470_REG_MAX,
-};
-
-static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
-{
-	unsigned int version;
-	int ret;
-
-	/* Force software reset */
-	ret = regmap_write(regmap, TPS68470_REG_RESET, TPS68470_REG_RESET_MASK);
-	if (ret)
-		return ret;
-
-	ret = regmap_read(regmap, TPS68470_REG_REVID, &version);
-	if (ret) {
-		dev_err(dev, "Failed to read revision register: %d\n", ret);
-		return ret;
-	}
-
-	dev_info(dev, "TPS68470 REVID: 0x%x\n", version);
-
-	return 0;
-}
-
-static int tps68470_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-	struct regmap *regmap;
-	int ret;
-
-	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "devm_regmap_init_i2c Error %ld\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
-
-	i2c_set_clientdata(client, regmap);
-
-	ret = tps68470_chip_init(dev, regmap);
-	if (ret < 0) {
-		dev_err(dev, "TPS68470 Init Error %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, tps68470s,
-			      ARRAY_SIZE(tps68470s), NULL, 0, NULL);
-	if (ret < 0) {
-		dev_err(dev, "devm_mfd_add_devices failed: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct acpi_device_id tps68470_acpi_ids[] = {
-	{"INT3472"},
-	{},
-};
-
-static struct i2c_driver tps68470_driver = {
-	.driver = {
-		   .name = "tps68470",
-		   .acpi_match_table = tps68470_acpi_ids,
-	},
-	.probe_new = tps68470_probe,
-};
-builtin_i2c_driver(tps68470_driver);
-- 
2.25.1

