Return-Path: <linux-i2c+bounces-6828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9297B348
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 19:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B30B7B22E63
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 17:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C14C187FE6;
	Tue, 17 Sep 2024 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jruX6Aew"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7885E17B425;
	Tue, 17 Sep 2024 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726592467; cv=none; b=fUxDQ+6WNiZF/LHzx4cFr1XnfcCrTPyx79RJ3BfbSu2CgNcOfxK+A0v4iUqi4mbfYWnky6hkK69m373WYU0TOIBhJNWfYN3o2aU7bgaCwNLVkjohsqI0f1rdX3Am/FelH2IWCOCVLM1tpPLghoZiv8OPXUpeB/aDXzwo8Sw3Zs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726592467; c=relaxed/simple;
	bh=BrX6iC0X2tUYn07m1atSIspTgza4tmkWeDchYD34d0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODRIBLM9I4f+FDo4wZ41tZo8/04gWtoAo+e6jr63hD2yTDET0TT4WsVbsltEVyW9qH5W/cdaQTZoRQLcQZ/SoYbKjH4EKDK8p2HFRL3vR4N9/MiIOO9alvumkj7ONNn/ralb5ieS6nYHS+gr+YnrzVlCJLUerTdwuk5IW9JqIQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jruX6Aew; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFC54FF80A;
	Tue, 17 Sep 2024 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726592457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0yQu9pDDnPyDQDkGXG+4FLvjOIFwjQz02Sl9KeBS80=;
	b=jruX6AeweMQx/Azgiz+WmJ+8pBOGeVmbsbC9jNY3U5rHyiiY3l3RGKIlZs9KCDJe9Z+hqX
	6Q5bULs1v8WxBa7b+w9W/2RJCzBi1WirOYo4clJzzV/Em03PzKtGxQcxRl5R0fBzCGw3Fz
	zxcYt+IoRyIPGFdK90/kk6SNxTPcUCuanCd8pyRdAUifSm9Cq9xuIcx4lrZyonAOGtiPqb
	Grgpm7HgCbCNt2zjvqE1iIlGkDcY7bNqb+QfhPQx9yciJuOtzQCtL2jwqZ7IECeNeCdKqS
	AKfrAM20cbJjGzuiwBkTubrsziBqCytpjr5kelm84JANn0uySMyORzVcLaLhjA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 17 Sep 2024 19:00:48 +0200
Subject: [PATCH v2 2/5] gpio: Congatec Board Controller gpio driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-congatec-board-controller-v2-2-681511a01c8f@bootlin.com>
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com>
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
 drivers/gpio/gpio-cgbc.c | 196 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)

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
index 000000000000..bdd747cd7250
--- /dev/null
+++ b/drivers/gpio/gpio-cgbc.c
@@ -0,0 +1,196 @@
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
+	scoped_guard(mutex, &gpio->lock)
+		ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 : 0, 0, &val);
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
+	scoped_guard(mutex, &gpio->lock)
+		__cgbc_gpio_set(chip, offset, value);
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
+
+	guard(mutex)(&gpio->lock);
+	return cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION_IN);
+}
+
+static int cgbc_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int offset, int value)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+
+	guard(mutex)(&gpio->lock);
+
+	__cgbc_gpio_set(chip, offset, value);
+	return cgbc_gpio_direction_set(chip, offset, GPIO_LINE_DIRECTION_OUT);
+}
+
+static int cgbc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct cgbc_gpio_data *gpio = gpiochip_get_data(chip);
+	struct cgbc_device_data *cgbc = gpio->cgbc;
+	int ret;
+	u8 val;
+
+	scoped_guard(mutex, &gpio->lock)
+		ret = cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_DIR_GET, (offset > 7) ? 1 : 0, 0, &val);
+
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
+	ret = devm_mutex_init(dev, &gpio->lock);
+	if (ret)
+		return ret;
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
2.39.5


