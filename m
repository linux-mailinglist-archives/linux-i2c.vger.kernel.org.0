Return-Path: <linux-i2c+bounces-12889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F4B53B21
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 20:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E3AC5647E5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 18:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90CA369320;
	Thu, 11 Sep 2025 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyyL1/5w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036B1917F1;
	Thu, 11 Sep 2025 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614434; cv=none; b=aXRzSfq3RiOKBihjrBdHRK/bLyhI9H2GDT7MQ6l9tqNZpljh97R/0OGnQbIPqP/8Kzh8e787QL0Qdov+5FE0Zh7G8EPpx0JtkdPWOlqyy/SI5TefTPfy80DvtzWZl/pEyhQOEpY+jX635OdaJDMpu2bTUKyejR+xzk157mb8+Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614434; c=relaxed/simple;
	bh=cowhWrPBSLHwkPnVEdpkF5Hebhci4X7iMGQuik8VsHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cduvn2RrkPp/XEHpfjtZyj3neMfND9+dZpLiPB4/z88d/MwEvrQyCzpJJxrWNIC2p0CI4vFUmIVRqaoj4G2rNxqfGz2r8pQ4NP59oYy4tjVkGI0wlp0RIGOK2ippu65aKiVKJt1eMOReBQGH3oL4uuWngdI1nKCU2tQxi5C620Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyyL1/5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AA9C4CEF9;
	Thu, 11 Sep 2025 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757614434;
	bh=cowhWrPBSLHwkPnVEdpkF5Hebhci4X7iMGQuik8VsHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iyyL1/5wPB6h2EE/Jj03dZdI9CphuO8PStanUt4ICs8CINLU1pp6W8JN3gISPiJfk
	 Yiup1dUnYDztF3epxTp9UjVHHysc6DMZyewc/q+xGRQFuRJZsWowX+ZXdJ/SBoYFcv
	 01PRAh8fZmgYqZNPTLCv0DYDtwgoBlaPLQ6TD2rP5nXaE7ZWkAxCxsux1pWa8hr1yG
	 MK//QttzbKDpQk6eS+E5cG8aWyZXBKGTa5JB4PuBPY1HD+9iA6fPuS/gt9b0NUaO7p
	 s8Cpks92eJ1s7b2dXRVOYkKZlSCNZ/q0l0rmehLAPAyFlnh0vSfkLnFYLDCcFkRsPT
	 lIeCCcuuCjCuw==
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
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 2/3] gpio: Add Intel USBIO GPIO driver
Date: Thu, 11 Sep 2025 20:13:42 +0200
Message-ID: <20250911181343.77398-3-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911181343.77398-1-hansg@kernel.org>
References: <20250911181343.77398-1-hansg@kernel.org>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Co-developed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
---
Changes in v5:
- Move GPIO_USBIO Kconfig option under 'menu "USB GPIO expanders"'

Changes in v4:
- Drop include <linux/dev_printk.h>, unneeded auxiliary_set_drvdata()

Changes in v3:
- Drop (offset >= gc->ngpio) check and make usbio_gpio_get_bank_and_pin()
  return void
- Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
- Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callback

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
 drivers/gpio/gpio-usbio.c | 247 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 260 insertions(+)
 create mode 100644 drivers/gpio/gpio-usbio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 72689972d669..8189bd88dd7e 100644
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
index d8ac40d0eb6f..efd72c72ad40 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1923,6 +1923,17 @@ config GPIO_MPSSE
 	  GPIO driver for FTDI's MPSSE interface. These can do input and
 	  output. Each MPSSE provides 16 IO pins.
 
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
 endmenu
 
 menu "Virtual GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..b1593ce92ebe 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -192,6 +192,7 @@ obj-$(CONFIG_GPIO_TS5500)		+= gpio-ts5500.o
 obj-$(CONFIG_GPIO_TWL4030)		+= gpio-twl4030.o
 obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
+obj-$(CONFIG_GPIO_USBIO) 		+= gpio-usbio.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
new file mode 100644
index 000000000000..e13c120824e3
--- /dev/null
+++ b/drivers/gpio/gpio-usbio.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Intel Corporation.
+ * Copyright (c) 2025 Red Hat, Inc.
+ */
+
+#include <linux/acpi.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
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
+static void usbio_gpio_get_bank_and_pin(struct gpio_chip *gc, unsigned int offset,
+					struct usbio_gpio_bank **bank_ret,
+					unsigned int *pin_ret)
+{
+	struct usbio_gpio *gpio = gpiochip_get_data(gc);
+	struct device *dev = &gpio->adev->dev;
+	struct usbio_gpio_bank *bank;
+	unsigned int pin;
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
+}
+
+static int usbio_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usbio_gpio_bank *bank;
+	unsigned int pin;
+	u8 cfg;
+
+	usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin);
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
+	usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin);
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
+	usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin);
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
+	usbio_gpio_get_bank_and_pin(gc, offset, &bank, &pin);
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
+	return usbio_gpio_set(gc, offset, value);
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
+	ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+	if (ret)
+		return ret;
+
+	if (has_acpi_companion(dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+
+	return 0;
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


