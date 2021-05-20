Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDD038B163
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236832AbhETONm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237559AbhETOMm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BB8C061373;
        Thu, 20 May 2021 07:09:53 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d11so17800287wrw.8;
        Thu, 20 May 2021 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjDsyccgx95yt9RzzidTLsNAX8yZMrQ+XHQIqoQUo80=;
        b=Zj84UjEuUFeFLrtOfNkQTUHfM7f+NonQZMp8l4yuQfBjn9qaWTRDmwH7BQTbrNG7WC
         RDFdLRCQ4sPsxDySU1L9uJcPFVfISjaMMDQY2tjOM0AFP7yMPEdGWLqul1DW+z9csRxa
         6lsJ3P5Eu5A/RmFN1gtZTzMUei2GeVVnXyXhfSEal2Ob3rvR/lWAqQ90BRmeIiT/bP6M
         MN+Mc3yQVG53rrUxnkTsX+8jiDAu8iZhVKtbylsCu/W5WTeNqx6XVxSuK2yQLGPYOGr6
         BJkK/4nKJ6Gwzt0/V7oI4+650AvQVga7JPmNhWgiU16GFoXWBydCLqOxKKF2uCajjOdA
         G2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjDsyccgx95yt9RzzidTLsNAX8yZMrQ+XHQIqoQUo80=;
        b=FJPT/w4yuNMVZf4B9Ns7R4OF84hUReaY0/Hl3LoolxKTAlugRgOZdkMbDMWBatrfco
         HAq5haJhg5GLqt5X2gUrUclaIMWEAfU3Zo5m6BLpkvMSn0pKw3R6Tod78cBcS2vSZFqa
         goP5NjCCrIA5+jb0MSmPL3+7NKhCMeuxAzwh0BiKpkN3/sWBJvfoYkghWL+vzTAWz49T
         iLmLqrgbtZT/P8W7JGaImtvEgS3eARfTuygRIdSaGQ+pecw7avvr/bwwmkAiFTLqAQCK
         KndxrKRYRO6IAwdnmAE5gm9tWCvJ7W1oQK5D+bkZPJmSoogiH4mUpo5aTRT0cBTh1Gik
         FRRg==
X-Gm-Message-State: AOAM531q0FcnOYbbaNvlUejV3KOEF+IeKIBGmEaSz70a4GEoCaVkr7kz
        CCrtJGdSfVoFZrLqUDqkZKg=
X-Google-Smtp-Source: ABdhPJyKS8Yj0VhuVVnqYHumuHPCARTH05E8Qok5qkhQwihhA1SnL5SE5L1yjyFyfA2az0wfBRNeyA==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr4596854wrq.356.1621519790002;
        Thu, 20 May 2021 07:09:50 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:49 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 8/8] mfd: tps68470: Remove tps68470 MFD driver
Date:   Thu, 20 May 2021 15:09:28 +0100
Message-Id: <20210520140928.3252671-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520140928.3252671-1-djrscally@gmail.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
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
Changes since v3:

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

