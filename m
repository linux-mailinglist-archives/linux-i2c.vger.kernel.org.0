Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC292F96AE
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbhARAgo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730626AbhARAgF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:36:05 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCCCC0613D6;
        Sun, 17 Jan 2021 16:34:50 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w5so14830373wrm.11;
        Sun, 17 Jan 2021 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I7uHwYNq+oq3Qo4LDfQKxz4Sys/YpiIugxE1gLa7uoM=;
        b=VrAfmWLT9ljjajymnJ+1h4KnGQfVkpnRpnmRXKy7nEcxcB7fLLYC38/g8BcOGztSPQ
         MHtgtiyEjFxput1wxQKPCawW5mzr2HZitqm+t/eLLND87xdOgZXAwjIzI4q37M6FeXmI
         4CDMNIshj59G4heHU3rxKLMYgImi/efUrg41QKHzSgKhMLppd0f/W6/K9ED/EQb/YfP0
         ZD84gHzRpnD2290+czvSIum1//E+M6g8ZWLyJZC7QSM0KqIHa+3DxpC0Vt/Ok6zxwfjk
         s72nLDF7zTACYRxa0jJ2aLswnZHbFPtB8C7oQe/Qqm6ZVXCwFtHUhLcqufnIdMKZ6pRF
         CE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I7uHwYNq+oq3Qo4LDfQKxz4Sys/YpiIugxE1gLa7uoM=;
        b=KLjalNa0jmwOjhAdJue8E1IlCc5NcPMTD2aAD03YTyTgPh0HO2b51MRTCZ9R1mIdzu
         3JZi3FJnG5qMsDLoI6OyKOZK+EHjTegV+VHkZyHB+Mk0bIy9r+B/dkjbuACCip2Z0XDx
         FAsYNLMzqHlvBRCF23SgYfUTCQBtHBwZ41sHclisbK5AC8JwdGklSR9mgiiyb6h1swFm
         1ThWDF43M9Bz/5ZK78B2WQDuP9dDCm1B/piancPQK49HbUAMuwDfiMoDOr0qNuMeTCeI
         CV1MBN3ewHEYNYc9bv4HC0XvhOgZKFbSQ0U7+NKHVf3/FNfyLKDEAcE01EAw9Uw7Ebli
         QC3Q==
X-Gm-Message-State: AOAM533WFnKcoSCemk5Cdmic5rSy7FWIhnylrVdTDQEUn6u9TzxhK+xh
        mrakoLpxk3j/Dpi7fRBGE0H4FPk5YtUE7A==
X-Google-Smtp-Source: ABdhPJyLd/H27HPqd9sv3qdz0VTNxUsAeofXHAZDj26T+BZkVnMy8WrsCi9zsX8ecrpXqDN1Q0RJcg==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr23756481wrr.9.1610930089201;
        Sun, 17 Jan 2021 16:34:49 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:48 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 7/7] mfd: Remove tps68470 MFD driver
Date:   Mon, 18 Jan 2021 00:34:28 +0000
Message-Id: <20210118003428.568892-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118003428.568892-1-djrscally@gmail.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver only covered one scenario in which ACPI devices with _HID
INT3472 are found, and its functionality has been taken over by the
intel-skl-int3472 module, so remove it.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Introduced

 drivers/acpi/pmic/Kconfig |  1 -
 drivers/gpio/Kconfig      |  1 -
 drivers/mfd/Kconfig       | 18 --------
 drivers/mfd/Makefile      |  1 -
 drivers/mfd/tps68470.c    | 97 ---------------------------------------
 5 files changed, 118 deletions(-)
 delete mode 100644 drivers/mfd/tps68470.c

diff --git a/drivers/acpi/pmic/Kconfig b/drivers/acpi/pmic/Kconfig
index 56bbcb2ce61b..e27d8ef3a32c 100644
--- a/drivers/acpi/pmic/Kconfig
+++ b/drivers/acpi/pmic/Kconfig
@@ -52,7 +52,6 @@ endif	# PMIC_OPREGION
 
 config TPS68470_PMIC_OPREGION
 	bool "ACPI operation region support for TPS68470 PMIC"
-	depends on MFD_TPS68470
 	help
 	  This config adds ACPI operation region support for TI TPS68470 PMIC.
 	  TPS68470 device is an advanced power management unit that powers
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..07ff8f24b0d9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1343,7 +1343,6 @@ config GPIO_TPS65912
 
 config GPIO_TPS68470
 	bool "TPS68470 GPIO"
-	depends on MFD_TPS68470
 	help
 	  Select this option to enable GPIO driver for the TPS68470
 	  chip family.
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index bdfce7b15621..9a1f648efde0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1520,24 +1520,6 @@ config MFD_TPS65217
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
index 14fdb188af02..5994e812f479 100644
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

