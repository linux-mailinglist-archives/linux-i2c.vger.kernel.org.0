Return-Path: <linux-i2c+bounces-7140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E308498BB8E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8081C22131
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B261C2334;
	Tue,  1 Oct 2024 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="egqqN3U3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75FC1BFE0A;
	Tue,  1 Oct 2024 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783650; cv=none; b=gOvnVW4u/TfK/FTDux5nks/vAXgQkV5E59LbWpZ3UJ1DitJCRHoKmHl8+xV20bc2gQ5tM191BhqmdLa5MnwNfMTrpiS71km+Y7z+Evd0axxUtMu26lmu8+QpmuJcpcNWVdtOz51GyyaXLzMVRn1AIkSBKdaF9m7fgKUz4Kw/Q8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783650; c=relaxed/simple;
	bh=sAU0JGn4oxRcxUN2k2A15vqxMG5uAZf3+WlzGygjskg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oHrVGWIbyS5K0cm3Rrc+MqTGqLqY5l5IBqQBwisI5ONj62GlWO6l5eyhF8LT8PHGc0+pHmZgbHqParrGPeWi32e1kMSXS/EPmzJOprLf33oCPuCkdf6KOOL83CI9nXVrZqhfItdwqyx8PLpPeaoH1r6FWN9Ql2qs3FZNqf15/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=egqqN3U3; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B23E540007;
	Tue,  1 Oct 2024 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727783646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wg6aT0cToJYPBpB9g7QT6rvBfE/afokp+J651VeHAsA=;
	b=egqqN3U3fH7ByO6xZqxfqeRUOpq1KDDq4KOLbJR0zB97ps/EGvv5xdnsYqZ1pAppMpF31x
	8/tAwwhPccUJshWZGT/NWoOmjpl1cwUjwGhuAAz/4h4mr8tHNFf7GGR6dcF71tJUe9NcHk
	3+YraVAxuJnLkpo1LzjkXXODgXzQ8vjFVEeR5Y89E0Ei3dAG5N5CrkE890inx20A3+8KEl
	y9hfMW7XRaHb1FVceuNMIPlY3ofXbs/PRO86bJX8M89pmAptRpYEGsZtWsY768u24CuIbS
	kh0OJ1NnQ6VHuzrZDzBN+2gI4Bd1atI9nOeLF9BQboCPCEpesrcGPMrF92uOnw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 01 Oct 2024 13:53:28 +0200
Subject: [PATCH v3 2/5] gpio: Congatec Board Controller gpio driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-congatec-board-controller-v3-2-39ceceed5c47@bootlin.com>
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
In-Reply-To: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

Add gpio support for the Congatec Board Controller.
This Board Controller has 14 GPIO pins.

The driver is probed by the Congatec Board Controller MFD driver.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/gpio/Kconfig     |  10 +++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-cgbc.c | 196 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 207 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..29d037c6083b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1287,6 +1287,16 @@ config GPIO_BD9571MWV
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio-bd9571mwv.
 
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
 config GPIO_CROS_EC
 	tristate "ChromeOS EC GPIO support"
 	depends on CROS_EC
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1429e8c0229b..3cdfa927ed98 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
+obj-$(CONFIG_GPIO_CGBC)			+= gpio-cgbc.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_CROS_EC)		+= gpio-cros-ec.o
diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
new file mode 100644
index 000000000000..9213faa11522
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
+		val &= ~(BIT(offset % 8));
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
+		val &= ~(BIT(offset % 8));
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


