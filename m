Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF1C428305
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 20:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbhJJS7j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 14:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29394 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232954AbhJJS7g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 14:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633892257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rC4qYhpsM2/cVQc8g3dIQfmz5YhNwfFf2sVOIrKUjUc=;
        b=cICeOqXnK/nEmUsmpMVbu/EscnAJIC7Qvrn1x7OfowZhjiQr2kKKhNdRXb+Xye08QGpGAI
        YFjx5KnqXvFz3m9wlJO4S7MJQ/wgWaoQInQgbcXcCKYECUvsJtRKK/KFSwhsRQNGWNM23s
        64YlLPphAJE8WfcVYaUyfEtBgwHAqoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-gs5HWwsIMAyzi7rNNaiaBw-1; Sun, 10 Oct 2021 14:57:31 -0400
X-MC-Unique: gs5HWwsIMAyzi7rNNaiaBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B94362FD;
        Sun, 10 Oct 2021 18:57:29 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.6])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B6F0B5F4E1;
        Sun, 10 Oct 2021 18:57:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 04/11] regulator: Introduce tps68470-regulator driver
Date:   Sun, 10 Oct 2021 20:57:00 +0200
Message-Id: <20211010185707.195883-5-hdegoede@redhat.com>
In-Reply-To: <20211010185707.195883-1-hdegoede@redhat.com>
References: <20211010185707.195883-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
the kernel the Regulators and Clocks are controlled by an OpRegion
driver designed to work with power control methods defined in ACPI, but
some platforms lack those methods, meaning drivers need to be able to
consume the resources of these chips through the usual frameworks.

This commit adds a driver for the regulators provided by the tps68470,
and is designed to bind to the platform_device registered by the
intel_skl_int3472 module.

This is based on this out of tree driver written by Intel:
https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
with various cleanups added.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Update the comment on why a subsys_initcall is used to register the drv
- Make struct regulator_ops const
---
 drivers/regulator/Kconfig              |   9 ++
 drivers/regulator/Makefile             |   1 +
 drivers/regulator/tps68470-regulator.c | 193 +++++++++++++++++++++++++
 3 files changed, 203 insertions(+)
 create mode 100644 drivers/regulator/tps68470-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 4fd13b06231f..d107af5bff6c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1339,6 +1339,15 @@ config REGULATOR_TPS65912
 	help
 	    This driver supports TPS65912 voltage regulator chip.
 
+config REGULATOR_TPS68470
+	tristate "TI TPS68370 PMIC Regulators Driver"
+	depends on INTEL_SKL_INT3472
+	help
+	  This driver adds support for the TPS68470 PMIC to register
+	  regulators against the usual framework.
+
+	  The module will be called "tps68470-regulator"
+
 config REGULATOR_TPS80031
 	tristate "TI TPS80031/TPS80032 power regulator driver"
 	depends on MFD_TPS80031
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 9e382b50a5ef..03c318110986 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_REGULATOR_TPS6524X) += tps6524x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS6586X) += tps6586x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65910) += tps65910-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65912) += tps65912-regulator.o
+obj-$(CONFIG_REGULATOR_TPS68470) += tps68470-regulator.o
 obj-$(CONFIG_REGULATOR_TPS80031) += tps80031-regulator.o
 obj-$(CONFIG_REGULATOR_TPS65132) += tps65132-regulator.o
 obj-$(CONFIG_REGULATOR_TWL4030) += twl-regulator.o twl6030-regulator.o
diff --git a/drivers/regulator/tps68470-regulator.c b/drivers/regulator/tps68470-regulator.c
new file mode 100644
index 000000000000..3129fa13a122
--- /dev/null
+++ b/drivers/regulator/tps68470-regulator.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Regulator driver for TPS68470 PMIC
+ *
+ * Copyright (C) 2018 Intel Corporation
+ *
+ * Authors:
+ *	Zaikuo Wang <zaikuo.wang@intel.com>
+ *	Tianshu Qiu <tian.shu.qiu@intel.com>
+ *	Jian Xu Zheng <jian.xu.zheng@intel.com>
+ *	Yuning Pu <yuning.pu@intel.com>
+ *	Rajmohan Mani <rajmohan.mani@intel.com>
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps68470.h>
+#include <linux/module.h>
+#include <linux/platform_data/tps68470.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+
+#define TPS68470_REGULATOR(_name, _id, _ops, _n, _vr,			\
+			   _vm, _er, _em, _t, _lr, _nlr)		\
+	[TPS68470_ ## _name] = {					\
+		.name			= # _name,			\
+		.id			= _id,				\
+		.ops			= &_ops,			\
+		.n_voltages		= _n,				\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.vsel_reg		= _vr,				\
+		.vsel_mask		= _vm,				\
+		.enable_reg		= _er,				\
+		.enable_mask		= _em,				\
+		.volt_table		= _t,				\
+		.linear_ranges		= _lr,				\
+		.n_linear_ranges	= _nlr,				\
+	}
+
+static const struct linear_range tps68470_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(875000, 0, 125, 17800),
+};
+
+static const struct linear_range tps68470_core_ranges[] = {
+	REGULATOR_LINEAR_RANGE(900000, 0, 42, 25000),
+};
+
+/* Operations permitted on DCDCx, LDO2, LDO3 and LDO4 */
+static const struct regulator_ops tps68470_regulator_ops = {
+	.is_enabled		= regulator_is_enabled_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_desc regulators[] = {
+	TPS68470_REGULATOR(CORE, TPS68470_CORE,
+			   tps68470_regulator_ops, 43, TPS68470_REG_VDVAL,
+			   TPS68470_VDVAL_DVOLT_MASK, TPS68470_REG_VDCTL,
+			   TPS68470_VDCTL_EN_MASK,
+			   NULL, tps68470_core_ranges,
+			   ARRAY_SIZE(tps68470_core_ranges)),
+	TPS68470_REGULATOR(ANA, TPS68470_ANA,
+			   tps68470_regulator_ops, 126, TPS68470_REG_VAVAL,
+			   TPS68470_VAVAL_AVOLT_MASK, TPS68470_REG_VACTL,
+			   TPS68470_VACTL_EN_MASK,
+			   NULL, tps68470_ldo_ranges,
+			   ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(VCM, TPS68470_VCM,
+			   tps68470_regulator_ops, 126, TPS68470_REG_VCMVAL,
+			   TPS68470_VCMVAL_VCVOLT_MASK, TPS68470_REG_VCMCTL,
+			   TPS68470_VCMCTL_EN_MASK,
+			   NULL, tps68470_ldo_ranges,
+			   ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(VIO, TPS68470_VIO,
+			   tps68470_regulator_ops, 126, TPS68470_REG_VIOVAL,
+			   TPS68470_VIOVAL_IOVOLT_MASK, TPS68470_REG_S_I2C_CTL,
+			   TPS68470_S_I2C_CTL_EN_MASK,
+			   NULL, tps68470_ldo_ranges,
+			   ARRAY_SIZE(tps68470_ldo_ranges)),
+
+/*
+ * (1) This register must have same setting as VIOVAL if S_IO LDO is used to
+ *     power daisy chained IOs in the receive side.
+ * (2) If there is no I2C daisy chain it can be set freely.
+ *
+ */
+	TPS68470_REGULATOR(VSIO, TPS68470_VSIO,
+			   tps68470_regulator_ops, 126, TPS68470_REG_VSIOVAL,
+			   TPS68470_VSIOVAL_IOVOLT_MASK, TPS68470_REG_S_I2C_CTL,
+			   TPS68470_S_I2C_CTL_EN_MASK,
+			   NULL, tps68470_ldo_ranges,
+			   ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(AUX1, TPS68470_AUX1,
+			   tps68470_regulator_ops, 126, TPS68470_REG_VAUX1VAL,
+			   TPS68470_VAUX1VAL_AUX1VOLT_MASK,
+			   TPS68470_REG_VAUX1CTL,
+			   TPS68470_VAUX1CTL_EN_MASK,
+			   NULL, tps68470_ldo_ranges,
+			   ARRAY_SIZE(tps68470_ldo_ranges)),
+	TPS68470_REGULATOR(AUX2, TPS68470_AUX2,
+			   tps68470_regulator_ops, 126, TPS68470_REG_VAUX2VAL,
+			   TPS68470_VAUX2VAL_AUX2VOLT_MASK,
+			   TPS68470_REG_VAUX2CTL,
+			   TPS68470_VAUX2CTL_EN_MASK,
+			   NULL, tps68470_ldo_ranges,
+			   ARRAY_SIZE(tps68470_ldo_ranges)),
+};
+
+#define TPS68470_REG_INIT_DATA(_name, _min_uV, _max_uV)			\
+	[TPS68470_ ## _name] = {					\
+		.constraints = {					\
+			.name = # _name,				\
+			.valid_ops_mask = REGULATOR_CHANGE_VOLTAGE |	\
+					  REGULATOR_CHANGE_STATUS,	\
+			.min_uV = _min_uV,				\
+			.max_uV = _max_uV,				\
+		},							\
+	}
+
+struct regulator_init_data tps68470_init[] = {
+	TPS68470_REG_INIT_DATA(CORE, 900000, 1950000),
+	TPS68470_REG_INIT_DATA(ANA, 875000, 3100000),
+	TPS68470_REG_INIT_DATA(VCM, 875000, 3100000),
+	TPS68470_REG_INIT_DATA(VIO, 875000, 3100000),
+	TPS68470_REG_INIT_DATA(VSIO, 875000, 3100000),
+	TPS68470_REG_INIT_DATA(AUX1, 875000, 3100000),
+	TPS68470_REG_INIT_DATA(AUX2, 875000, 3100000),
+};
+
+static int tps68470_regulator_probe(struct platform_device *pdev)
+{
+	struct tps68470_regulator_platform_data *pdata = pdev->dev.platform_data;
+	struct regulator_config config = { };
+	struct regmap *tps68470_regmap;
+	struct regulator_dev *rdev;
+	int i;
+
+	tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
+
+	for (i = 0; i < TPS68470_NUM_REGULATORS; i++) {
+		config.dev = pdev->dev.parent;
+		config.regmap = tps68470_regmap;
+		if (pdata && pdata->reg_init_data[i])
+			config.init_data = pdata->reg_init_data[i];
+		else
+			config.init_data = &tps68470_init[i];
+
+		rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s regulator\n",
+				regulators[i].name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver tps68470_regulator_driver = {
+	.driver = {
+		.name = "tps68470-regulator",
+	},
+	.probe = tps68470_regulator_probe,
+};
+
+/*
+ * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
+ * registering before the drivers for the camera-sensors which use them bind.
+ * subsys_initcall() ensures this when the drivers are builtin.
+ */
+static int __init tps68470_regulator_init(void)
+{
+	return platform_driver_register(&tps68470_regulator_driver);
+}
+subsys_initcall(tps68470_regulator_init);
+
+static void __exit tps68470_regulator_exit(void)
+{
+	platform_driver_unregister(&tps68470_regulator_driver);
+}
+module_exit(tps68470_regulator_exit);
+
+MODULE_ALIAS("platform:tps68470-regulator");
+MODULE_DESCRIPTION("TPS68470 voltage regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

