Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408161174B1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 19:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfLISnk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 13:43:40 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34226 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbfLISmx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 13:42:53 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id BD5552E5CED;
        Mon,  9 Dec 2019 18:29:14 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 08/10] gpio: Add driver for AD242x GPIO controllers
Date:   Mon,  9 Dec 2019 19:35:09 +0100
Message-Id: <20191209183511.3576038-10-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver makes the 8 GPIOs on AD242x nodes available to consumers.

Apart from that, it also allows putting the GPIO lines in a 'gpio over
distance' mode. This mirrors the state of several GPIOs in the topology
without further interaction by any driver. For instance, when a GPIO pin
on the master node is put in input mode, and another one on a slave node
is in output mode, they can be linked together through virtual ports.
Then, the pin on the slave node will reflect the logical level on
whatever is applied to the respective pin on the master node.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/gpio/Kconfig       |   6 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-ad242x.c | 229 +++++++++++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 drivers/gpio/gpio-ad242x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..c8af1159a585 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -845,6 +845,12 @@ endmenu
 menu "I2C GPIO expanders"
 	depends on I2C
 
+config GPIO_AD242X
+	tristate "AD242x A2B GPIO controller"
+	depends on MFD_AD242X
+	help
+	  This option enables support for GPIOs on AD242x A2B nodes.
+
 config GPIO_ADP5588
 	tristate "ADP5588 I2C GPIO expander"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..2490ce6e6905 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AD242X)		+= gpio-ad242x.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)		+= gpio-adp5588.o
diff --git a/drivers/gpio/gpio-ad242x.c b/drivers/gpio/gpio-ad242x.c
new file mode 100644
index 000000000000..8970e434b56a
--- /dev/null
+++ b/drivers/gpio/gpio-ad242x.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/mfd/ad242x.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct ad242x_gpio {
+	struct gpio_chip chip;
+	struct ad242x_node *node;
+	u32 gpio_od_mask;
+};
+
+static int ad242x_gpio_request(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct ad242x_gpio *ad242x_gpio = gpiochip_get_data(chip);
+
+	if (gpio == 0 && ad242x_node_is_master(ad242x_gpio->node))
+		return -EBUSY;
+
+	if (ad242x_gpio->gpio_od_mask & BIT(gpio))
+		return -EBUSY;
+
+	return 0;
+}
+
+static int ad242x_gpio_get_value(struct gpio_chip *chip, unsigned int gpio)
+{
+	struct ad242x_gpio *ad242x_gpio = gpiochip_get_data(chip);
+	struct regmap *regmap = ad242x_gpio->node->regmap;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, AD242X_GPIODAT_IN, &val);
+	if (ret < 0)
+		return ret;
+
+	return !!(val & BIT(gpio));
+}
+
+static void ad242x_gpio_set_value(struct gpio_chip *chip,
+				  unsigned int gpio, int value)
+{
+	struct ad242x_gpio *ad242x_gpio = gpiochip_get_data(chip);
+	struct regmap *regmap = ad242x_gpio->node->regmap;
+	uint8_t bit = BIT(gpio);
+	int ret;
+
+	if (value)
+		ret = regmap_write(regmap, AD242X_GPIODAT_SET, bit);
+	else
+		ret = regmap_write(regmap, AD242X_GPIODAT_CLR, bit);
+
+	if (ret < 0)
+		dev_err(ad242x_gpio->node->dev,
+			"Unable to set GPIO #%d: %d\n", gpio, ret);
+}
+
+static int ad242x_gpio_direction_input(struct gpio_chip *chip,
+				       unsigned int gpio)
+{
+	struct ad242x_gpio *ad242x_gpio = gpiochip_get_data(chip);
+	struct regmap *regmap = ad242x_gpio->node->regmap;
+	uint8_t bit = BIT(gpio);
+	int ret;
+
+	ret = regmap_update_bits(regmap, AD242X_GPIOOEN, bit, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(regmap, AD242X_GPIOIEN, bit, bit);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(regmap, AD242X_INTMSK1, bit, bit);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ad242x_gpio_direction_output(struct gpio_chip *chip,
+					unsigned int gpio, int value)
+{
+	struct ad242x_gpio *ad242x_gpio = gpiochip_get_data(chip);
+	struct regmap *regmap = ad242x_gpio->node->regmap;
+	uint8_t bit = BIT(gpio);
+	int ret;
+
+	ret = regmap_update_bits(regmap, AD242X_GPIOIEN, bit, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(regmap, AD242X_GPIOOEN, bit, bit);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(regmap, AD242X_INTMSK1, bit, 0);
+	if (ret < 0)
+		return ret;
+
+	ad242x_gpio_set_value(chip, gpio, value);
+
+	return 0;
+}
+
+static int ad242x_gpio_over_distance_init(struct device *dev,
+					  struct ad242x_gpio *ad242x_gpio)
+{
+	struct regmap *regmap = ad242x_gpio->node->regmap;
+	struct device_node *np, *child_np;
+	int ret = 0;
+
+	np = of_get_child_by_name(dev->of_node, "gpio-over-distance");
+	if (!np)
+		return 0;
+
+	for_each_available_child_of_node(np, child_np) {
+		u32 reg, port_mask, bit;
+		bool output, inv;
+
+		ret = of_property_read_u32(child_np, "reg", &reg);
+		if (ret < 0)
+			continue;
+
+		ret = of_property_read_u32(child_np, "adi,virtual-port-mask",
+					   &port_mask);
+		if (ret < 0)
+			continue;
+
+		if (reg > 7) {
+			ret = -EINVAL;
+			break;
+		}
+
+		bit = BIT(reg);
+
+		ret = regmap_update_bits(regmap, AD242X_GPIODEN, bit, bit);
+		if (ret < 0)
+			break;
+
+		ret = regmap_write(regmap, AD242X_GPIOD_MSK(reg), port_mask);
+		if (ret < 0)
+			break;
+
+		output = of_property_read_bool(child_np, "adi,gpio-output");
+		ret = regmap_update_bits(regmap, AD242X_GPIOOEN,
+					 bit, output ? bit : 0);
+		if (ret < 0)
+			break;
+
+		inv = of_property_read_bool(child_np, "adi,gpio-inverted");
+		ret = regmap_update_bits(regmap, AD242X_GPIODINV,
+					 bit, inv ? bit : 0);
+		if (ret < 0)
+			break;
+
+		ad242x_gpio->gpio_od_mask |= bit;
+		dev_info(dev,
+			 "pin %d set up as gpio-over-distance, port mask 0x%02x\n",
+			 reg, port_mask);
+	}
+
+	of_node_put(np);
+
+	return ret;
+}
+
+static int ad242x_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ad242x_gpio *ad242x_gpio;
+	int ret;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	ad242x_gpio = devm_kzalloc(dev, sizeof(*ad242x_gpio), GFP_KERNEL);
+	if (!ad242x_gpio)
+		return -ENOMEM;
+
+	ad242x_gpio->node = dev_get_drvdata(dev->parent);
+
+	ad242x_gpio->chip.request = ad242x_gpio_request;
+	ad242x_gpio->chip.direction_input = ad242x_gpio_direction_input;
+	ad242x_gpio->chip.direction_output = ad242x_gpio_direction_output;
+	ad242x_gpio->chip.get = ad242x_gpio_get_value;
+	ad242x_gpio->chip.set = ad242x_gpio_set_value;
+	ad242x_gpio->chip.can_sleep = 1;
+	ad242x_gpio->chip.base = -1;
+	ad242x_gpio->chip.ngpio = 8;
+	ad242x_gpio->chip.label = "ad242x-gpio";
+	ad242x_gpio->chip.owner = THIS_MODULE;
+	ad242x_gpio->chip.parent = dev;
+
+	dev_info(dev, "A2B node ID %d\n", ad242x_gpio->node->id);
+
+	ret = ad242x_gpio_over_distance_init(dev, ad242x_gpio);
+	if (ret < 0) {
+		dev_err(dev, "GPIO over distance init failed: %d\n", ret);
+		return ret;
+	}
+
+	return devm_gpiochip_add_data(dev, &ad242x_gpio->chip, ad242x_gpio);
+}
+
+static const struct of_device_id ad242x_gpio_of_match[] = {
+	{ .compatible = "adi,ad2428w-gpio", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ad242x_gpio_of_match);
+
+static struct platform_driver ad242x_gpio_driver = {
+	.driver = {
+		.name = "ad242x-gpio",
+		.of_match_table = ad242x_gpio_of_match,
+	},
+	.probe = ad242x_gpio_probe,
+};
+module_platform_driver(ad242x_gpio_driver);
+
+MODULE_DESCRIPTION("AD242x GPIO driver");
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.23.0

