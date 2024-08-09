Return-Path: <linux-i2c+bounces-5260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81094D29B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 16:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C082B221CC
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 14:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EA2198845;
	Fri,  9 Aug 2024 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SHvNo+Cr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93482197512;
	Fri,  9 Aug 2024 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215166; cv=none; b=uYfSCin+QyvABPQW9MQIjsFHT+HH8xotH/owaBgbJMEpqOPXSpWfN3P18FQvPdXGsz1TCUyMDSehKTch2uWvhMo9SrCnLykGapv2p6Ej6q+z2UqMRNmCFkcVwGM1hKdSAyZHuV4Ao2mbwy2GUQpbiavVGo5Hg5anxbI0/cg4Q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215166; c=relaxed/simple;
	bh=MgX4Y9doq3nduiqv3nXn3S/Sl6ElRTZrwO72vQB8sv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NH/aelJWq8GHgmIyoWCv5KnbGxbV6kQEPzqzpHx1pTlBs7hzcyuHQr1VW1JhvVE1+OUnHkvKKiZvAWBNXKECrGLihJ3+UF70t+RdYval7iGDUiSNKywBRAyhYYuE8g8iTVa7Lja37nsbtd6UfhYuxRzFEFct23uonM8xBKzmH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SHvNo+Cr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AE6B40004;
	Fri,  9 Aug 2024 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723215156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEe5eWxop6igHf93vf56/fh3/U5CavtxVjxV45rsRGU=;
	b=SHvNo+Crih9WvCXb8V+Ys95YA9X7D5AMbdPcyF97lk16FxPnlP4tohPKDDxmQk9bqZAJ8E
	QUbRUHNnpx4dkyBU7ZF2m1+yXCR0iuPpO0Xw508a3PbOMFG81tTbHpU6xIDHhO5OgDVkzN
	W+F7ojJZvsV7Qj0zpNMR21BGsk1gzshNMU5tLhprFOifsp92m9g3viPVIjLYqBFOKPqgMa
	gsoIEE3uKVwdH7Rgs4fb9aYlR0vwVFEOINVxaFEHJyTtSWUrNSgzuQieRJJ3j3VrJNJDnL
	FqW4K+weWxiEPkTD5wZuBiqRnROKroXCQDsHHxL4SdTYEHDRhTxktrbOa67bcA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 09 Aug 2024 16:52:06 +0200
Subject: [PATCH 2/5] gpio: Congatec Board Controller gpio driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-congatec-board-controller-v1-2-fec5236270e7@bootlin.com>
References: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Add gpio support for the Congatec Board Controller.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/Kconfig     |  10 +++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-cgbc.c | 203 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c..ce77bad40087 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -233,6 +233,16 @@ config GPIO_CADENCE
 	help
 	  Say yes here to enable support for Cadence GPIO controller.
 
+config GPIO_CGBC
+	tristate "Congatec Board Controller GPIO support"
+	depends on MFD_CGBC
+	help
+	  Select this option to enable GPIO support for the Congatec Board
+	  Controller.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-cgbc.
+
 config GPIO_CLPS711X
 	tristate "CLPS711X GPIO support"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d..3a96e3c27a2d 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
+obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_CROS_EC)		+= gpio-cros-ec.o
diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
new file mode 100644
index 000000000000..6da50c794872
--- /dev/null
+++ b/drivers/gpio/gpio-cgbc.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Congatec Board Controller GPIO driver
+ *
+ * Copyright (C) 2024 Bootlin
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/mfd/cgbc.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+#define CGBC_GPIO_NGPIO	14
+
+#define CGBC_GPIO_CMD_GET	0x64
+#define CGBC_GPIO_CMD_SET	0x65
+#define CGBC_GPIO_CMD_DIR_GET	0x66
+#define CGBC_GPIO_CMD_DIR_SET	0x67
+
+struct cgbc_gpio_data {
+	struct gpio_chip	chip;
+	struct cgbc_device_data	*cgbc;
+	struct mutex lock;
+};
+
+static int cgbc_gpio_cmd(struct cgbc_device_data *cgbc,
+			 u8 cmd0, u8 cmd1, u8 cmd2, u8 *value)
+{
+	u8 cmd[3] = {cmd0, cmd1, cmd2};
+
+	return cgbc_command(cgbc, cmd, sizeof(cmd), value, 1, NULL);
+}
+
+static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	struct cgbc_device_data *cgbc = gpio->cgbc;
+	int ret;
+	u8 val;
+
+	mutex_lock(&gpio->lock);
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 : 0, 0, &val);
+
+	mutex_unlock(&gpio->lock);
+
+	offset %= 8;
+
+	if (ret)
+		return ret;
+	else
+		return (int)(val & (u8)BIT(offset));
+}
+
+static void __cgbc_gpio_set(struct gpio_chip *chip,
+			    unsigned int offset, int value)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	struct cgbc_device_data *cgbc = gpio->cgbc;
+	u8 val;
+	int ret;
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 : 0, 0, &val);
+	if (ret)
+		return;
+
+	if (value)
+		val |= BIT(offset % 8);
+	else
+		val &= ~((u8)BIT(offset % 8));
+
+	cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_SET, (offset > 7) ? 1 : 0, val, &val);
+}
+
+static void cgbc_gpio_set(struct gpio_chip *chip,
+			  unsigned int offset, int value)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+
+	mutex_lock(&gpio->lock);
+	__cgbc_gpio_set(chip, offset, value);
+	mutex_unlock(&gpio->lock);
+}
+
+static int cgbc_gpio_direction_set(struct gpio_chip *chip,
+				   unsigned int offset, int direction)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	struct cgbc_device_data *cgbc = gpio->cgbc;
+	int ret;
+	u8 val;
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_GET, (offset > 7) ? 1 : 0, 0, &val);
+	if (ret)
+		goto end;
+
+	if (direction == GPIO_LINE_DIRECTION_IN)
+		val &= ~((u8)BIT(offset % 8));
+	else
+		val |= BIT(offset % 8);
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_SET, (offset > 7) ? 1 : 0, val, &val);
+
+end:
+	return ret;
+}
+
+static int cgbc_gpio_direction_input(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	mutex_lock(&gpio->lock);
+	ret = cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION_IN);
+	mutex_unlock(&gpio->lock);
+
+	return ret;
+}
+
+static int cgbc_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int offset, int value)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	mutex_lock(&gpio->lock);
+	__cgbc_gpio_set(chip, offset, value);
+	ret = cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION_OUT);
+	mutex_unlock(&gpio->lock);
+
+	return ret;
+}
+
+static int cgbc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	struct cgbc_device_data *cgbc = gpio->cgbc;
+	int ret;
+	u8 val;
+
+	ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_GET, (offset > 7) ? 1 : 0, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val & BIT(offset % 8))
+		return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_IN;
+}
+
+static int cgbc_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cgbc_device_data *cgbc = dev_get_drvdata(dev->parent);
+	struct cgbc_gpio_data *gpio;
+	struct gpio_chip *chip;
+	int ret;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->cgbc = cgbc;
+
+	platform_set_drvdata(pdev, gpio);
+
+	chip = &gpio->chip;
+	chip->label = dev_name(&pdev->dev);
+	chip->owner = THIS_MODULE;
+	chip->parent = dev;
+	chip->base = -1;
+	chip->direction_input = cgbc_gpio_direction_input;
+	chip->direction_output = cgbc_gpio_direction_output;
+	chip->get_direction = cgbc_gpio_get_direction;
+	chip->get = cgbc_gpio_get;
+	chip->set = cgbc_gpio_set;
+	chip->ngpio = CGBC_GPIO_NGPIO;
+
+	mutex_init(&gpio->lock);
+
+	ret = devm_gpiochip_add_data(dev, chip, gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "Could not register GPIO chip\n");
+
+	return 0;
+}
+
+static struct platform_driver cgbc_gpio_driver = {
+	.driver = {
+		.name = "cgbc-gpio",
+	},
+	.probe	= cgbc_gpio_probe,
+};
+
+module_platform_driver(cgbc_gpio_driver);
+
+MODULE_DESCRIPTION("Congatec Board Controller GPIO Driver");
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cgbc-gpio");

-- 
2.39.2


