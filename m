Return-Path: <linux-i2c+bounces-3558-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D788C86CE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0690B1F241AD
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 12:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270624F1F9;
	Fri, 17 May 2024 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="t+hKGjVy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C508052F8C
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950736; cv=none; b=QGk6j44jyT95wnCwoXYM82JJ7peAFu2JUgaaPozfkntuRHDAfoMzEhwzVHbECoJ8Qch7Ddsb5S1DRmiZxaG1mS5qBSD6ZGyeUcovJOsdTdmgZSAvmaLYBewXfd5AaBs25QbUOXC0TVVc1+FVvjf11uhSXwYQ1Pbg9qJtoDRwARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950736; c=relaxed/simple;
	bh=0XOMm+ge0CG1rMR477UJBe3byaxH6SnO+N8jfBfoTS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TV29b8QM7CB5DqUYNd9QkkJZcdOphMu59ZKJHYbhxZbxu+8x5t+OGnZkbjwXEYQp91DgtkiOwg6mlUBvVvNtkMl7uw27NAmLe/kh1ZnS2FECmo6AFfhAsZTC+XjjLP+fkoA9u2W7gEhcbCNqzkxaGpTqX9fvMJwfW6FLE3cBGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=t+hKGjVy; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: linux-i2c@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715950730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKi9dQbr0T+uVxmbTMIarChYf6vJF2b8+XfTd+iLTkI=;
	b=t+hKGjVy72mnGQfVQXGD2Ss4kQdbuvoKZ3LkaVJJ13ZBKIqKH7WJqRNu6/AhgLJ0aFQcWv
	/dOzAdAZOO4pstDh3a1PLPzzv+QEOuzuphNU0NalyGPOCSGUov2cD9yny9IFVWsoyBwv0W
	PIQi2eljSfZqvMIaEDLvb4CTWp/q8dahR8n1s0fjV1G1o3QD62Wdkf3phMsUNOSeONdsWq
	Px07v9/e5I9TSYJfPRf1yhRPnkfEyJrt01W/iacidEQPvZTAX6Jfao+DKfC3MvV9R/5lao
	LKVvunhbIn3a2YvQ+JPDl4ed9L/PEsaijBnFaeOtl5j5XhMWR1POGSqkx/2yAQ==
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: perex@perex.cz
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: alsi@bang-olufsen.dk
X-Envelope-To: rafael@kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: tiwai@suse.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: brgl@bgdev.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 14:58:04 +0200
Subject: [PATCH 06/13] gpio: add AD24xx GPIO driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-6-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

This driver adds GPIO function support for AD24xx A2B transceiver chips.
When a GPIO is requested, the relevant pin is automatically muxed to
GPIO mode. The device tree property gpio-reserved-ranges can be used to
protect certain pins which are reserved for other functionality such as
I2S/TDM data.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/a2b/Kconfig        |   1 +
 drivers/gpio/Kconfig       |   6 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-ad24xx.c | 302 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 310 insertions(+)

diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
index 1f6d836463f3..8c894579e2fc 100644
--- a/drivers/a2b/Kconfig
+++ b/drivers/a2b/Kconfig
@@ -32,6 +32,7 @@ config A2B_AD24XX_I2C
 config A2B_AD24XX_NODE
        tristate "Analog Devices Inc. AD24xx node support"
        select REGMAP_A2B
+       imply GPIO_AD24XX
        help
          Say Y here to enable support for AD24xx A2B transceiver nodes. This
          applies to both main nodes and subordinate nodes. Supported models
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3dbddec07028..72bd0d88d6b3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1241,6 +1241,12 @@ config GPIO_ALTERA_A10SR
 	  includes reads of pushbuttons and DIP switches as well
 	  as writes to LEDs.
 
+config GPIO_AD24XX
+	tristate "Analog Devies Inc. AD24xx GPIO support"
+	depends on A2B_AD24XX_NODE
+	help
+	  Say Y here to enable GPIO support for AD24xx A2B transceivers.
+
 config GPIO_ARIZONA
 	tristate "Wolfson Microelectronics Arizona class devices"
 	depends on MFD_ARIZONA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e2a53013780e..f625bb140143 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AD24XX)		+= gpio-ad24xx.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_AGGREGATOR)		+= gpio-aggregator.o
diff --git a/drivers/gpio/gpio-ad24xx.c b/drivers/gpio/gpio-ad24xx.c
new file mode 100644
index 000000000000..097ea9e2d629
--- /dev/null
+++ b/drivers/gpio/gpio-ad24xx.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AD24xx GPIO driver
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ */
+
+#include <linux/a2b/a2b.h>
+#include <linux/a2b/ad24xx.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+
+struct ad24xx_gpio {
+	struct device *dev;
+	struct a2b_func *func;
+	struct a2b_node *node;
+	struct regmap *regmap;
+	int irqs[AD24XX_MAX_GPIOS];
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+	struct mutex mutex;
+	unsigned int irq_invert : AD24XX_MAX_GPIOS;
+	unsigned int irq_enable : AD24XX_MAX_GPIOS;
+};
+
+static int ad24xx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ad24xx_gpio *adg = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(adg->regmap, A2B_GPIOOEN, &val);
+	if (ret)
+		return ret;
+
+	if (val & BIT(offset))
+		return 0; /* output */
+
+	return 1; /* input */
+}
+
+static int ad24xx_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct ad24xx_gpio *adg = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(adg->regmap, A2B_GPIOIN, &val);
+	if (ret)
+		return ret;
+
+	if (val & BIT(offset))
+		return 1; /* high */
+
+	return 0; /* low */
+}
+
+static void ad24xx_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
+{
+	struct ad24xx_gpio *adg = gpiochip_get_data(gc);
+	unsigned int reg = value ? A2B_GPIODATSET : A2B_GPIODATCLR;
+
+	regmap_write(adg->regmap, reg, BIT(offset));
+}
+
+static int ad24xx_gpio_set_direction(struct ad24xx_gpio *adg,
+				     unsigned int offset,
+				     unsigned int direction)
+{
+	unsigned int mask = BIT(offset);
+	unsigned int ival = direction ? BIT(offset) : 0;
+	int ret;
+
+	ret = regmap_update_bits(adg->regmap, A2B_GPIOIEN, mask, ival);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(adg->regmap, A2B_GPIOOEN, mask, ~ival);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ad24xx_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int offset)
+{
+	struct ad24xx_gpio *adg = gpiochip_get_data(gc);
+
+	return ad24xx_gpio_set_direction(adg, offset, 1);
+}
+
+static int ad24xx_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int offset, int value)
+{
+	struct ad24xx_gpio *adg = gpiochip_get_data(gc);
+
+	/* For atomicity, write the output value before setting the direction */
+	ad24xx_gpio_set(gc, offset, value);
+
+	return ad24xx_gpio_set_direction(adg, offset, 0);
+}
+
+static int ad24xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					     unsigned int child,
+					     unsigned int child_type,
+					     unsigned int *parent,
+					     unsigned int *parent_type)
+{
+	*parent = child;
+	return 0;
+}
+
+static void ad24xx_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
+	struct ad24xx_gpio *adg = gpiochip_get_data(gpio_chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	adg->irq_enable &= ~BIT(hwirq);
+	gpiochip_disable_irq(gpio_chip, hwirq);
+}
+
+static void ad24xx_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
+	struct ad24xx_gpio *adg = gpiochip_get_data(gpio_chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_disable_irq(gpio_chip, hwirq);
+	adg->irq_enable |= BIT(hwirq);
+}
+
+static int ad24xx_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
+	struct ad24xx_gpio *adg = gpiochip_get_data(gpio_chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		adg->irq_invert &= ~BIT(hwirq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		adg->irq_invert |= BIT(hwirq);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void ad24xx_gpio_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
+	struct ad24xx_gpio *adg = gpiochip_get_data(gpio_chip);
+
+	mutex_lock(&adg->mutex);
+}
+
+static void ad24xx_gpio_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(d);
+	struct ad24xx_gpio *adg = gpiochip_get_data(gpio_chip);
+	int ret;
+
+	ret = regmap_write(adg->regmap, A2B_PINTINV, adg->irq_invert);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(adg->regmap, A2B_PINTEN, adg->irq_enable);
+	if (ret)
+		goto out;
+
+out:
+	mutex_unlock(&adg->mutex);
+
+	if (ret)
+		dev_err(adg->dev,
+			"failed to update interrupt configuration: %d\n", ret);
+}
+
+static const struct irq_chip ad24xx_gpio_irq_chip = {
+	.name = "ad24xx-gpio",
+	.flags = IRQCHIP_IMMUTABLE,
+	.irq_mask = ad24xx_gpio_irq_mask,
+	.irq_unmask = ad24xx_gpio_irq_unmask,
+	.irq_set_type = ad24xx_gpio_irq_set_type,
+	.irq_bus_lock = ad24xx_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = ad24xx_gpio_irq_bus_sync_unlock,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static const struct regmap_config ad24xx_gpio_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ad24xx_gpio_probe(struct device *dev)
+{
+	struct a2b_func *func = to_a2b_func(dev);
+	struct a2b_node *node = func->node;
+	struct fwnode_handle *fwnode = of_node_to_fwnode(dev->of_node);
+	struct gpio_chip *gpio_chip;
+	struct gpio_irq_chip *irq_chip;
+	struct irq_domain *parent_domain;
+	struct ad24xx_gpio *adg;
+	struct device_node *np;
+	int ret;
+
+	adg = devm_kzalloc(dev, sizeof(*adg), GFP_KERNEL);
+	if (!adg)
+		return -ENOMEM;
+
+	adg->regmap =
+		devm_regmap_init_a2b_func(func, &ad24xx_gpio_regmap_config);
+	if (IS_ERR(adg->regmap))
+		return PTR_ERR(adg->regmap);
+
+	adg->dev = dev;
+	adg->func = func;
+	adg->node = node;
+	mutex_init(&adg->mutex);
+
+	np = of_irq_find_parent(dev->of_node);
+	if (!np)
+		return -ENOENT;
+
+	parent_domain = irq_find_host(np);
+	of_node_put(np);
+	if (!parent_domain)
+		return -ENOENT;
+
+	gpio_chip = &adg->gpio_chip;
+	gpio_chip->label = dev_name(dev);
+	gpio_chip->parent = dev;
+	gpio_chip->fwnode = fwnode;
+	gpio_chip->owner = THIS_MODULE;
+	gpio_chip->get_direction = ad24xx_gpio_get_direction;
+	gpio_chip->direction_input = ad24xx_gpio_direction_input;
+	gpio_chip->direction_output = ad24xx_gpio_direction_output;
+	gpio_chip->get = ad24xx_gpio_get;
+	gpio_chip->set = ad24xx_gpio_set;
+	gpio_chip->base = -1;
+	gpio_chip->ngpio = node->chip_info->max_gpios;
+	gpio_chip->can_sleep = true;
+
+	irq_chip = &gpio_chip->irq;
+	gpio_irq_chip_set_chip(irq_chip, &ad24xx_gpio_irq_chip);
+	irq_chip->fwnode = fwnode;
+	irq_chip->parent_domain = parent_domain;
+	irq_chip->child_to_parent_hwirq = ad24xx_gpio_child_to_parent_hwirq;
+	irq_chip->handler = handle_bad_irq;
+	irq_chip->default_type = IRQ_TYPE_NONE;
+
+	/* Initialize all GPIOs as inputs for high impedance state */
+	ret = regmap_write(adg->regmap, A2B_GPIOIEN, 0xFF);
+	if (ret)
+		return ret;
+
+	ret = devm_gpiochip_add_data(dev, gpio_chip, adg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id ad24xx_gpio_of_match_table[] = {
+	{ .compatible = "adi,ad2401-gpio" },
+	{ .compatible = "adi,ad2402-gpio" },
+	{ .compatible = "adi,ad2403-gpio" },
+	{ .compatible = "adi,ad2410-gpio" },
+	{ .compatible = "adi,ad2420-gpio" },
+	{ .compatible = "adi,ad2421-gpio" },
+	{ .compatible = "adi,ad2422-gpio" },
+	{ .compatible = "adi,ad2425-gpio" },
+	{ .compatible = "adi,ad2426-gpio" },
+	{ .compatible = "adi,ad2427-gpio" },
+	{ .compatible = "adi,ad2428-gpio" },
+	{ .compatible = "adi,ad2429-gpio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ad24xx_gpio_of_match_table);
+
+static struct a2b_driver ad24xx_gpio_driver = {
+	.driver = {
+		.name = "ad24xx-gpio",
+		.of_match_table = ad24xx_gpio_of_match_table,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = ad24xx_gpio_probe,
+};
+module_a2b_driver(ad24xx_gpio_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("AD24xx GPIO driver");
+MODULE_LICENSE("GPL");

-- 
2.44.0


