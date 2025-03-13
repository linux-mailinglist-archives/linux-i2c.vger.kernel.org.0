Return-Path: <linux-i2c+bounces-9824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBEFA5F901
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791531889300
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 14:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DADC2686BD;
	Thu, 13 Mar 2025 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="uAVbXm9K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F9267F4E;
	Thu, 13 Mar 2025 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741877437; cv=none; b=rttXvGSIuT9a5UgcWuU/sy+Zi4PGdMavTFnDz385/FIbFyH+pHXgpvrsPghZL6BV4kexjQDi31WbNbi00DzkMBTA+FXv/UtWjV+QcQNdsrta57LhiQd7+8DTl1lCQV6gxNnjSolbtlPtsY5dBB4MOhxmq4RmGBTY5v8bpsZVWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741877437; c=relaxed/simple;
	bh=DYH8mWP/uN3km4ih67jjOC5+KKiOCx4dt/AnPwkGK2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OSriR+mSIhQXSYC8yXdK+ECjTYPg8hSxpDX4ea7qIlPptqAznbGSSkhS0aKl9jGBtV8G0BQzF7O9l/MDmKAKSmvnoxSGx6SI4XUKtDwlFqE3lIh7oUOsrc96n9+CGlCLTOhDuVV6lVCztPAizRp8As74cGj5f52UE0w4QJrt6cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=uAVbXm9K; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A05251FDF5;
	Thu, 13 Mar 2025 15:43:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1741877017;
	bh=QIeoyNI/Bl3f0J8dwVu4JRPZtINHSBcSBhcO5FHDDoc=; h=From:To:Subject;
	b=uAVbXm9KIB4cNxKmrxWPEPRtFwrn8//o56yDJXm0yjKWXpc8A32TqgM49g1jLK0f4
	 QiXkktqwnMEwcM4Wng93EkmFcZh0rlqL1lnW7J+WIYnCShAUmL6Qd4/FGpI121LUX2
	 mE33VGp5saBkA6E0R9JRESJxCns1Mr4D/6bZY7HuyspOSRt1abUl5Gbeo1gkI82mnq
	 PUlpCXbCe99sTMysRQCpOT4NhwFiGvxk6Y8MXBjONVNjxkSi65v0YevazieS9iTqkU
	 j+30HKJM6fADr4NlLI0KHUJyWQKJ9+S0zF5IJfOw+JuNKhpLXS6dg2AG3aBMqQL5nv
	 pXjxG6C22Aybw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 2/2] platform: toradex: add preliminary support for Embedded Controller
Date: Thu, 13 Mar 2025 15:43:31 +0100
Message-Id: <20250313144331.70591-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313144331.70591-1-francesco@dolcini.it>
References: <20250313144331.70591-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add new platform driver for the Embedded Controller currently used
in Toradex SMARC iMX8MP and SMARC iMX95.
It currently provides power-off and restart (reset) handlers.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 MAINTAINERS                           |   1 +
 drivers/platform/Kconfig              |   2 +
 drivers/platform/Makefile             |   1 +
 drivers/platform/toradex/Kconfig      |  18 +++
 drivers/platform/toradex/Makefile     |   1 +
 drivers/platform/toradex/toradex-ec.c | 155 ++++++++++++++++++++++++++
 6 files changed, 178 insertions(+)
 create mode 100644 drivers/platform/toradex/Kconfig
 create mode 100644 drivers/platform/toradex/Makefile
 create mode 100644 drivers/platform/toradex/toradex-ec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 19d7c17c0115..fa1630f0f725 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23977,6 +23977,7 @@ M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
 M:	Francesco Dolcini <francesco@dolcini.it>
 S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/toradex,embedded-controller.yaml
+F:	drivers/platform/toradex/toradex-ec.c
 
 TORTURE-TEST MODULES
 M:	Davidlohr Bueso <dave@stgolabs.net>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 960fd6a82450..84aabb88fb4a 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/toradex/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
 
 source "drivers/platform/arm64/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 19ac54648586..2d849a8f3ccf 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
+obj-$(CONFIG_TORADEX_PLATFORMS)	+= toradex/
diff --git a/drivers/platform/toradex/Kconfig b/drivers/platform/toradex/Kconfig
new file mode 100644
index 000000000000..635d955df79d
--- /dev/null
+++ b/drivers/platform/toradex/Kconfig
@@ -0,0 +1,18 @@
+menuconfig TORADEX_PLATFORMS
+	bool "Platform support for Toradex hardware"
+	help
+	  Say Y here to be able to choose driver support for Toradex
+	  devices. This option alone does not add any kernel code.
+
+if TORADEX_PLATFORMS
+config TORADEX_EC
+	tristate "Toradex Embedded Controller driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y here to add support for the features implemented by the
+	  Embedded Controller on the Toradex Modules.
+	  To compile this driver as a module, choose M here; the module will be
+	  called toradex-ec.
+
+endif # TORADEX_PLATFORMS
diff --git a/drivers/platform/toradex/Makefile b/drivers/platform/toradex/Makefile
new file mode 100644
index 000000000000..eb918819ad35
--- /dev/null
+++ b/drivers/platform/toradex/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_TORADEX_EC)			+= toradex-ec.o
diff --git a/drivers/platform/toradex/toradex-ec.c b/drivers/platform/toradex/toradex-ec.c
new file mode 100644
index 000000000000..f01addf2a0a6
--- /dev/null
+++ b/drivers/platform/toradex/toradex-ec.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Toradex Embedded Controller driver
+ *
+ * Copyright (C) 2025 Toradex
+ *
+ * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+
+#define EC_CHIP_ID_REG                  0x00
+#define EC_VERSION_REG_MAJOR            0x01
+#define EC_VERSION_REG_MINOR            0x02
+#define EC_CMD_REG                      0xD0
+#define EC_REG_MAX                      0xD0
+
+#define EC_CHIP_ID_SMARC_IMX95          0x11
+#define EC_CHIP_ID_SMARC_IMX8MP         0x12
+
+#define EC_POWEROFF_CMD                 0x01
+#define EC_RESET_CMD                    0x02
+
+#define EC_ID_VERSION_LEN               3
+
+struct tdx_ec {
+	struct i2c_client *client;
+	struct regmap *regmap;
+};
+
+static const struct regmap_range volatile_ranges[] = {
+	regmap_reg_range(EC_CMD_REG, EC_CMD_REG),
+};
+
+static const struct regmap_access_table volatile_table = {
+	.yes_ranges	= volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(volatile_ranges),
+};
+
+static const struct regmap_range read_ranges[] = {
+	regmap_reg_range(EC_CHIP_ID_REG, EC_VERSION_REG_MINOR),
+};
+
+static const struct regmap_access_table read_table = {
+	.yes_ranges	= read_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(read_ranges),
+};
+
+static const struct regmap_config regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= EC_REG_MAX,
+	.cache_type	= REGCACHE_RBTREE,
+	.rd_table	= &read_table,
+	.volatile_table = &volatile_table,
+};
+
+static int tdx_ec_cmd(struct tdx_ec *ec, u8 cmd)
+{
+	int err = regmap_write(ec->regmap, EC_CMD_REG, cmd);
+
+	if (err)
+		dev_err(&ec->client->dev, "Failed to send command 0x%02X: %d\n", cmd, err);
+	return err;
+}
+
+static int tdx_ec_power_off(struct sys_off_data *data)
+{
+	struct tdx_ec *ec = data->cb_data;
+	int err;
+
+	err = tdx_ec_cmd(ec, EC_POWEROFF_CMD);
+	return err ? NOTIFY_BAD : NOTIFY_DONE;
+}
+
+static int tdx_ec_restart(struct sys_off_data *data)
+{
+	struct tdx_ec *ec = data->cb_data;
+	int err;
+
+	err = tdx_ec_cmd(ec, EC_RESET_CMD);
+	return err ? NOTIFY_BAD : NOTIFY_DONE;
+}
+
+static int tdx_ec_register_power_off_restart(struct device *dev, struct tdx_ec *ec)
+{
+	int err;
+
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART,
+					    SYS_OFF_PRIO_FIRMWARE,
+					    tdx_ec_restart, ec);
+	if (err)
+		return err;
+
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_FIRMWARE,
+					    tdx_ec_power_off, ec);
+	return err;
+}
+
+static int tdx_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	u8 reg_val[EC_ID_VERSION_LEN];
+	struct tdx_ec *ec;
+	int err;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+	i2c_set_clientdata(client, ec);
+
+	ec->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(ec->regmap))
+		return PTR_ERR(ec->regmap);
+
+	err = regmap_bulk_read(ec->regmap, EC_CHIP_ID_REG, &reg_val, EC_ID_VERSION_LEN);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot read id and version registers\n");
+
+	dev_info(dev, "Toradex Embedded Controller id %x - Firmware %d.%d\n",
+		 reg_val[0], reg_val[1], reg_val[2]);
+
+	err = tdx_ec_register_power_off_restart(dev, ec);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot register system restart handler\n");
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused of_tdx_ec_match[] = {
+	{ .compatible = "toradex,embedded-controller" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_tdx_ec_match);
+
+static struct i2c_driver toradex_ec_driver = {
+	.probe			= tdx_ec_probe,
+	.driver			= {
+		.name		= "toradex-ec",
+		.of_match_table = of_tdx_ec_match,
+	},
+};
+module_i2c_driver(toradex_ec_driver);
+
+MODULE_AUTHOR("Emanuele Ghidoli <emanuele.ghidoli@toradex.com>");
+MODULE_DESCRIPTION("Toradex Embedded Controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


