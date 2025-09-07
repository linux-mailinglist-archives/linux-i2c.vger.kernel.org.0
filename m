Return-Path: <linux-i2c+bounces-12721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A699B47CA9
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 19:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43F8E189EB44
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 17:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E9D28935C;
	Sun,  7 Sep 2025 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqFy9qXb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC83C465;
	Sun,  7 Sep 2025 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757267468; cv=none; b=PNFwCjhx4xFWZqg+F6ruwglHfw/Z0MaUSVVjguuJcXMy7NZeaN3edloip7YlD4nbXF80r6220wIG+nbFSc25UeOacsmnpqH3+9c8/MkHrLZfJnK9gKlUfhQ0KLHtzD1YRwwicYVj+rapQF70Z/2gSAoKYkLFJiTe7IyLeeYvYGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757267468; c=relaxed/simple;
	bh=A6b9iJXmhJx3VFKgN5HYyFt+x0M1QKdLrBGQe+drbJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvnyJCyOtEWu/EAo0od08Ol+HuEACJx6bNca+JVixr3kPZTEb8G4TzjT1E4QWopMaba5HQYmfLTNKvJ/ciWuRwhbINVLmNxLPPHv2ruurzqMRg6D06/bcOiNvOv11MUVaZBp20R3MAc7YGzBy93fnl7jwGE5juoBWSwg3fNqHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqFy9qXb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7932CC4CEF5;
	Sun,  7 Sep 2025 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757267468;
	bh=A6b9iJXmhJx3VFKgN5HYyFt+x0M1QKdLrBGQe+drbJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LqFy9qXba2ZFxBThRITvTxrsx9dOmXdQSYqpOFEgMuor9FTIl4fsyA88KNvDR75LC
	 CMnj53v493auYIghPcRlOmQ/Vq4i7Lc1iAPAm02G1up7Iuc120lq60c6J7EIiB62rn
	 CJOvLbfCpGTsepaqoUsDCSQH1cMVXt9V92F6j18AqVQfZadr28h4ZljR/vRsKDGdeC
	 5HdEMss0GcvDY7Xr3hjbcAk/43TDMjt8lBxtotbQHPurg27XCvgyYf5c0jUy0/neY0
	 jMhlD75VndCHMy5G3dTbqJtTQFyTRP6pR3KYEbhqLcp3DJ+kIB+ZwNb65vX1R5DkmE
	 EL+AfG+3z+0lA==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Richard Hughes <rhughes@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/3] gpio: Add Intel USBIO GPIO driver
Date: Sun,  7 Sep 2025 19:50:55 +0200
Message-ID: <20250907175056.47314-3-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907175056.47314-1-hansg@kernel.org>
References: <20250907175056.47314-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
IO-expander used by the MIPI cameras on various new (Meteor Lake and
later) Intel laptops.

Co-developed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
---
Changes in v2:
- Add a config_mutex protect usbio_gpio_update_config() calls, which
  read-modify-write banks[x].config, racing with each other
- Adjust usbio_gpio_get() to have an int return value and propagate the
  usbio_control_msg() return value
- Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
- Some small style fixes from Sakari's review
---
 MAINTAINERS               |   1 +
 drivers/gpio/Kconfig      |  11 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-usbio.c | 267 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 280 insertions(+)
 create mode 100644 drivers/gpio/gpio-usbio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3410699ad0b2..53694bd91861 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12699,6 +12699,7 @@ M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
 M:	Hans de Goede <hansg@kernel.org>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
+F:	drivers/gpio/gpio-usbio.c
 F:	drivers/usb/misc/usbio.c
 F:	include/linux/usb/usbio.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6..5d3ca3dd2687 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1448,6 +1448,17 @@ config GPIO_LJCA
 	  This driver can also be built as a module. If so, the module
 	  will be called gpio-ljca.
 
+config GPIO_USBIO
+	tristate "Intel USBIO GPIO support"
+	depends on USB_USBIO
+	default USB_USBIO
+	help
+	  Select this option to enable GPIO driver for the INTEL
+	  USBIO driver stack.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio_usbio.
+
 config GPIO_LP3943
 	tristate "TI/National Semiconductor LP3943 GPIO expander"
 	depends on MFD_LP3943
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..8c55e2d5de42 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
 obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
 obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
+obj-$(CONFIG_GPIO_USBIO) 		+= gpio-usbio.o
 obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
new file mode 100644
index 000000000000..1df32105cf51
--- /dev/null
+++ b/drivers/gpio/gpio-usbio.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Intel Corporation.
+ * Copyright (c) 2025 Red Hat, Inc.
+ */
+
+#include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/usb/usbio.h>
+
+struct usbio_gpio_bank {
+	u8 config[USBIO_GPIOSPERBANK];
+	u32 bitmap;
+};
+
+struct usbio_gpio {
+	struct mutex config_mutex; /* Protects banks[x].config */
+	struct usbio_gpio_bank banks[USBIO_MAX_GPIOBANKS];
+	struct gpio_chip gc;
+	struct auxiliary_device *adev;
+};
+
+static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
+	{ "INTC1007" }, /* MTL */
+	{ "INTC10B2" }, /* ARL */
+	{ "INTC10B5" }, /* LNL */
+	{ "INTC10E2" }, /* PTL */
+	{ }
+};
+
+static bool usbio_gpio_get_bank_and_pin(struct gpio_chip *gc, unsigned int offset,
+					struct usbio_gpio_bank **bank_ret,
+					unsigned int *pin_ret)
+{
+	struct usbio_gpio *gpio = gpiochip_get_data(gc);
+	struct device *dev = &gpio->adev->dev;
+	struct usbio_gpio_bank *bank;
+	unsigned int pin;
+
+	if (offset >= gc->ngpio)
+		return false;
+
+	bank = &gpio->banks[offset / USBIO_GPIOSPERBANK];
+	pin = offset % USBIO_GPIOSPERBANK;
+	if (~bank->bitmap & BIT(pin)) {
+		/* The FW bitmap sometimes is invalid, warn and continue */
+		dev_warn_once(dev, FW_BUG "GPIO %u is not in FW pins bitmap\n", offset);
+	}
+
+	*bank_ret = bank;
+	*pin_ret = pin;
+	return true;
+}
+
+static int usbio_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usbio_gpio_bank *bank;
+	unsigned int pin;
+	u8 cfg;
+
+	if (!usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin))
+		return -EINVAL;
+
+	cfg = bank->config[pin] & USBIO_GPIO_PINMOD_MASK;
+
+	return (cfg == USBIO_GPIO_PINMOD_OUTPUT) ?
+		GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int usbio_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usbio_gpio *gpio = gpiochip_get_data(gc);
+	struct usbio_gpio_bank *bank;
+	struct usbio_gpio_rw gbuf;
+	unsigned int pin;
+	int ret;
+
+	if (!usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin))
+		return -EINVAL;
+
+	gbuf.bankid = offset / USBIO_GPIOSPERBANK;
+	gbuf.pincount  = 1;
+	gbuf.pin = pin;
+
+	ret = usbio_control_msg(gpio->adev, USBIO_PKTTYPE_GPIO, USBIO_GPIOCMD_READ,
+				&gbuf, sizeof(gbuf) - sizeof(gbuf.value),
+				&gbuf, sizeof(gbuf));
+	if (ret != sizeof(gbuf))
+		return (ret < 0) ? ret : -EPROTO;
+
+	return (le32_to_cpu(gbuf.value) >> pin) & 1;
+}
+
+static int usbio_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct usbio_gpio *gpio = gpiochip_get_data(gc);
+	struct usbio_gpio_bank *bank;
+	struct usbio_gpio_rw gbuf;
+	unsigned int pin;
+
+	if (!usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin))
+		return -EINVAL;
+
+	gbuf.bankid = offset / USBIO_GPIOSPERBANK;
+	gbuf.pincount  = 1;
+	gbuf.pin = pin;
+	gbuf.value = cpu_to_le32(value << pin);
+
+	return usbio_control_msg(gpio->adev, USBIO_PKTTYPE_GPIO, USBIO_GPIOCMD_WRITE,
+				 &gbuf, sizeof(gbuf), NULL, 0);
+}
+
+static int usbio_gpio_update_config(struct gpio_chip *gc, unsigned int offset,
+				    u8 mask, u8 value)
+{
+	struct usbio_gpio *gpio = gpiochip_get_data(gc);
+	struct usbio_gpio_bank *bank;
+	struct usbio_gpio_init gbuf;
+	unsigned int pin;
+
+	if (!usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin))
+		return -EINVAL;
+
+	guard(mutex)(&gpio->config_mutex);
+
+	bank->config[pin] &= ~mask;
+	bank->config[pin] |= value;
+
+	gbuf.bankid = offset / USBIO_GPIOSPERBANK;
+	gbuf.config = bank->config[pin];
+	gbuf.pincount  = 1;
+	gbuf.pin = pin;
+
+	return usbio_control_msg(gpio->adev, USBIO_PKTTYPE_GPIO, USBIO_GPIOCMD_INIT,
+				 &gbuf, sizeof(gbuf), NULL, 0);
+}
+
+static int usbio_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	return usbio_gpio_update_config(gc, offset, USBIO_GPIO_PINMOD_MASK,
+					USBIO_GPIO_SET_PINMOD(USBIO_GPIO_PINMOD_INPUT));
+}
+
+static int usbio_gpio_direction_output(struct gpio_chip *gc,
+		unsigned int offset, int value)
+{
+	int ret;
+
+	ret = usbio_gpio_update_config(gc, offset, USBIO_GPIO_PINMOD_MASK,
+				       USBIO_GPIO_SET_PINMOD(USBIO_GPIO_PINMOD_OUTPUT));
+	if (ret)
+		return ret;
+
+	usbio_gpio_set(gc, offset, value);
+	return 0;
+}
+
+static int usbio_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+		unsigned long config)
+{
+	u8 value;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+		value = USBIO_GPIO_SET_PINCFG(USBIO_GPIO_PINCFG_DEFAULT);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		value = USBIO_GPIO_SET_PINCFG(USBIO_GPIO_PINCFG_PULLUP);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		value = USBIO_GPIO_SET_PINCFG(USBIO_GPIO_PINCFG_PULLDOWN);
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		value = USBIO_GPIO_SET_PINCFG(USBIO_GPIO_PINCFG_PUSHPULL);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return usbio_gpio_update_config(gc, offset, USBIO_GPIO_PINCFG_MASK, value);
+}
+
+static int usbio_gpio_probe(struct auxiliary_device *adev,
+		const struct auxiliary_device_id *adev_id)
+{
+	struct usbio_gpio_bank_desc *bank_desc;
+	struct device *dev = &adev->dev;
+	struct usbio_gpio *gpio;
+	int bank, ret;
+
+	bank_desc = dev_get_platdata(dev);
+	if (!bank_desc)
+		return -EINVAL;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &gpio->config_mutex);
+	if (ret)
+		return ret;
+
+	gpio->adev = adev;
+
+	usbio_acpi_bind(gpio->adev, usbio_gpio_acpi_hids);
+
+	for (bank = 0; bank < USBIO_MAX_GPIOBANKS && bank_desc[bank].bmap; bank++)
+		gpio->banks[bank].bitmap = le32_to_cpu(bank_desc[bank].bmap);
+
+	gpio->gc.label = ACPI_COMPANION(dev) ?
+					acpi_dev_name(ACPI_COMPANION(dev)) : dev_name(dev);
+	gpio->gc.parent = dev;
+	gpio->gc.owner = THIS_MODULE;
+	gpio->gc.get_direction = usbio_gpio_get_direction;
+	gpio->gc.direction_input = usbio_gpio_direction_input;
+	gpio->gc.direction_output = usbio_gpio_direction_output;
+	gpio->gc.get = usbio_gpio_get;
+	gpio->gc.set = usbio_gpio_set;
+	gpio->gc.set_config = usbio_gpio_set_config;
+	gpio->gc.base = -1;
+	gpio->gc.ngpio = bank * USBIO_GPIOSPERBANK;
+	gpio->gc.can_sleep = true;
+
+	auxiliary_set_drvdata(adev, gpio);
+
+	ret = gpiochip_add_data(&gpio->gc, gpio);
+	if (ret)
+		return ret;
+
+	if (has_acpi_companion(dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+
+	return 0;
+}
+
+static void usbio_gpio_remove(struct auxiliary_device *adev)
+{
+	struct usbio_gpio *gpio = auxiliary_get_drvdata(adev);
+
+	gpiochip_remove(&gpio->gc);
+}
+
+static const struct auxiliary_device_id usbio_gpio_id_table[] = {
+	{ "usbio.usbio-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, usbio_gpio_id_table);
+
+static struct auxiliary_driver usbio_gpio_driver = {
+	.name = USBIO_GPIO_CLIENT,
+	.probe = usbio_gpio_probe,
+	.remove = usbio_gpio_remove,
+	.id_table = usbio_gpio_id_table
+};
+module_auxiliary_driver(usbio_gpio_driver);
+
+MODULE_DESCRIPTION("Intel USBIO GPIO driver");
+MODULE_AUTHOR("Israel Cepeda <israel.a.cepeda.lopez@intel.com>");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("USBIO");
-- 
2.51.0


