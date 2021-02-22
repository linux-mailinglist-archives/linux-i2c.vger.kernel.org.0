Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42A6321824
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhBVNLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbhBVNIm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:08:42 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC7FC061794;
        Mon, 22 Feb 2021 05:07:57 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id v62so14261054wmg.4;
        Mon, 22 Feb 2021 05:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lNQEF/e7HRtFmBF7/uDejBBe9+Y0iuGhAtdZ8+fnUk4=;
        b=mZ/MV4GMOcL9JxgczXB43ck2r9ILCHKlQI3FR592gf0PDVAoC6u7VJF/qhB3nNWqbd
         stkpFcVCDZLHsqNCDRzQG0rlRYju3+kO1nZ8cimWlW9BrngqHTnT1rzIdrEKk5zfh/2l
         4OHXTHDXfLyAIOzRVObrqZQEGKvqIn8Op4/VcSB1oEq7ugr7eIQV6gfyLxOa8W2+dNb5
         6EM0fKC/01itCPWLJECVHSjWWYt7Vm2VwPQ0g4gutV9i/37JqGChcEm/qEiAgZiDfpVP
         kWxsy7u4KLkZ0II7q4m6Y8e+Hjvy+vO2Db3GGNSVHW7hiao4W1aI2ODc69qtB6dwrC9z
         5HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lNQEF/e7HRtFmBF7/uDejBBe9+Y0iuGhAtdZ8+fnUk4=;
        b=MUtKLFwcpgLEW7lOLCLcZ/liJGbD4t05LVWvf2FBt3c3Ya76oAmD7HQP5VdznIuEsB
         RZl2UfKG6xvmPLA/dxujeLJwmoUZQspnelCTfPq1vLqNniU76m40UhZ5Rp76/tSrjvEm
         elO/Y2ofnxsjt3J3QGTl3XBy7TeZ4zGOdCjRJ1XZBy8LL8rlEtaacQdrf+wFB8zLHfWW
         Wna1yAm2QwVDBNoFLQkzkGTsZxanKMT/gXtImVHthoTuxIIN1mOtckfxhiZg04iOO0rT
         6N52mwctDQVn6qCOFzhCf06/3LOFMABNhtkzvm7AeYIeANwP16pIZo8Hh8KuKsrzk2CX
         Qs6g==
X-Gm-Message-State: AOAM532VAPjrjfqz932X8sU0kdgQbutgKZp6rXXdluWRLE8XCC1yw+eF
        I2EJ7KIfPqkduP+MRtthN84=
X-Google-Smtp-Source: ABdhPJyp5Xs5yRL1lbCR9pgk0gDVkj1/AmIccsEzvwkAAfKXkBQ5GyrQkiLqTaqqAhdR67FioY6gVw==
X-Received: by 2002:a1c:1dcc:: with SMTP id d195mr20632901wmd.42.1613999276320;
        Mon, 22 Feb 2021 05:07:56 -0800 (PST)
Received: from valhalla.home ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id t198sm26575828wmt.7.2021.02.22.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:07:55 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Subject: [PATCH v3 6/6] mfd: tps68470: Remove tps68470 MFD driver
Date:   Mon, 22 Feb 2021 13:07:35 +0000
Message-Id: <20210222130735.1313443-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
References: <20210222130735.1313443-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver only covered one scenario in which ACPI devices with _HID
INT3472 are found, and its functionality has been taken over by the
intel-skl-int3472 module, so remove it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:
	- Replaced Kconfig dependencies with INTEL_SKL_INT3472 for the tps68470
	  OpRegion and GPIO drivers.

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
index c70f46e80a3b..998898c72af8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1343,7 +1343,7 @@ config GPIO_TPS65912
 
 config GPIO_TPS68470
 	bool "TPS68470 GPIO"
-	depends on MFD_TPS68470
+	depends on INTEL_SKL_INT3472
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

