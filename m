Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BB56B1C0B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjCIHLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 02:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjCIHLn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:11:43 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EB0BCFD8;
        Wed,  8 Mar 2023 23:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678345901; x=1709881901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sb1lJJRqj5PUKDmn5bWt9QLZUxjq25a+Y0VMzskXuGk=;
  b=X8zMNqhyxcGyl1kI3V0+U3WZ9ovpNe+BAHUYG36IhhXZOsqNd3RyDQQI
   W4pD96iUZ7B6EUO2QYcQ4pTWZaq4oEMFth10xO5m5L5j1fG2BEpe5a9Dd
   ef0anj4+ZgKCDlY8A3kUjtodG7Ad+Pze6my6KU3n8XaAPXPSV3nyDtM+R
   5olscQFgTpnqB1YDHmtwJCj28RenDdhGOKBm+NQ1ke8JAHiQrmkMW468V
   xR3Mz0SlNkBkKm1uou+NQBxXyYlXrgwRPHzo+cMRJ0FjuqvIKEiJvwQHI
   FklNhjDlc3iUo2m+IALHj4Zu3ACSVQbw8g9Cogx4+6jEG6y7h3g2PeP1b
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316767779"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316767779"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923126412"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="923126412"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 23:11:23 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Date:   Thu,  9 Mar 2023 15:10:57 +0800
Message-Id: <20230309071100.2856899-3-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309071100.2856899-1-xiang.ye@intel.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
GPIO module with specific protocol through interfaces exported by LJCA USB
driver.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig     |  12 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-ljca.c | 454 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 467 insertions(+)
 create mode 100644 drivers/gpio/gpio-ljca.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 13be729710f2..8be697f9f621 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1253,6 +1253,18 @@ config GPIO_KEMPLD
 	  This driver can also be built as a module. If so, the module will be
 	  called gpio-kempld.
 
+config GPIO_LJCA
+	tristate "INTEL La Jolla Cove Adapter GPIO support"
+	depends on MFD_LJCA
+	select GPIOLIB_IRQCHIP
+	default MFD_LJCA
+	help
+	  Select this option to enable GPIO driver for the INTEL
+	  La Jolla Cove Adapter (LJCA) board.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gpio-ljca.
+
 config GPIO_LP3943
 	tristate "TI/National Semiconductor LP3943 GPIO expander"
 	depends on MFD_LP3943
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c048ba003367..eb59524d18c0 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
 obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
+obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
 obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
new file mode 100644
index 000000000000..87863f0230f5
--- /dev/null
+++ b/drivers/gpio/gpio-ljca.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel La Jolla Cove Adapter USB-GPIO driver
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/dev_printk.h>
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/mfd/ljca.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/* GPIO commands */
+#define LJCA_GPIO_CONFIG	1
+#define LJCA_GPIO_READ		2
+#define LJCA_GPIO_WRITE		3
+#define LJCA_GPIO_INT_EVENT	4
+#define LJCA_GPIO_INT_MASK	5
+#define LJCA_GPIO_INT_UNMASK	6
+
+#define LJCA_GPIO_CONF_DISABLE		BIT(0)
+#define LJCA_GPIO_CONF_INPUT		BIT(1)
+#define LJCA_GPIO_CONF_OUTPUT		BIT(2)
+#define LJCA_GPIO_CONF_PULLUP		BIT(3)
+#define LJCA_GPIO_CONF_PULLDOWN		BIT(4)
+#define LJCA_GPIO_CONF_DEFAULT		BIT(5)
+#define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
+#define LJCA_GPIO_INT_TYPE		BIT(7)
+
+#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
+#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
+
+/* Intentional overlap with PULLUP / PULLDOWN */
+#define LJCA_GPIO_CONF_SET	BIT(3)
+#define LJCA_GPIO_CONF_CLR	BIT(4)
+
+struct gpio_op {
+	u8 index;
+	u8 value;
+} __packed;
+
+struct gpio_packet {
+	u8 num;
+	struct gpio_op item[];
+} __packed;
+
+#define LJCA_GPIO_BUF_SIZE 60
+struct ljca_gpio_dev {
+	struct platform_device *pdev;
+	struct gpio_chip gc;
+	struct ljca_gpio_info *gpio_info;
+	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
+	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
+	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
+	u8 *connect_mode;
+	/* mutex to protect irq bus */
+	struct mutex irq_lock;
+	struct work_struct work;
+	/* lock to protect package transfer to Hardware */
+	struct mutex trans_lock;
+
+	u8 obuf[LJCA_GPIO_BUF_SIZE];
+	u8 ibuf[LJCA_GPIO_BUF_SIZE];
+};
+
+static int gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id, u8 config)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->item[0].index = gpio_id;
+	packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
+	packet->num = 1;
+
+	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_CONFIG, packet,
+			    struct_size(packet, item, packet->num), NULL, NULL);
+	mutex_unlock(&ljca_gpio->trans_lock);
+	return ret;
+}
+
+static int ljca_gpio_read(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	struct gpio_packet *ack_packet = (struct gpio_packet *)ljca_gpio->ibuf;
+	unsigned int ibuf_len = LJCA_GPIO_BUF_SIZE;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
+	packet->item[0].index = gpio_id;
+	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_READ, packet,
+			    struct_size(packet, item, packet->num), ljca_gpio->ibuf, &ibuf_len);
+	if (ret)
+		goto out_unlock;
+
+	if (!ibuf_len || ack_packet->num != packet->num) {
+		dev_err(&ljca_gpio->pdev->dev, "failed gpio_id:%u %u", gpio_id, ack_packet->num);
+		ret = -EIO;
+	}
+
+out_unlock:
+	mutex_unlock(&ljca_gpio->trans_lock);
+	if (ret)
+		return ret;
+	return ack_packet->item[0].value > 0;
+}
+
+static int ljca_gpio_write(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
+			   int value)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
+	packet->item[0].index = gpio_id;
+	packet->item[0].value = value & 1;
+
+	ret = ljca_transfer(ljca_gpio->gpio_info->ljca, LJCA_GPIO_WRITE, packet,
+			    struct_size(packet, item, packet->num), NULL, NULL);
+	mutex_unlock(&ljca_gpio->trans_lock);
+	return ret;
+}
+
+static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	return ljca_gpio_read(ljca_gpio, offset);
+}
+
+static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+				int val)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+	int ret;
+
+	ret = ljca_gpio_write(ljca_gpio, offset, val);
+	if (ret)
+		dev_err(chip->parent, "offset:%u val:%d set value failed %d\n", offset, val, ret);
+}
+
+static int ljca_gpio_direction_input(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+	u8 config = LJCA_GPIO_CONF_INPUT | LJCA_GPIO_CONF_CLR;
+
+	return gpio_config(ljca_gpio, offset, config);
+}
+
+static int ljca_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int offset, int val)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+	u8 config = LJCA_GPIO_CONF_OUTPUT | LJCA_GPIO_CONF_CLR;
+	int ret;
+
+	ret = gpio_config(ljca_gpio, offset, config);
+	if (ret)
+		return ret;
+
+	ljca_gpio_set_value(chip, offset, val);
+	return 0;
+}
+
+static int ljca_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				unsigned long config)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	ljca_gpio->connect_mode[offset] = 0;
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		ljca_gpio->connect_mode[offset] |= LJCA_GPIO_CONF_PULLUP;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ljca_gpio->connect_mode[offset] |= LJCA_GPIO_CONF_PULLDOWN;
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_PERSIST_STATE:
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int ljca_gpio_init_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+				     unsigned int ngpios)
+{
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
+
+	WARN_ON_ONCE(ngpios != ljca_gpio->gpio_info->num);
+	bitmap_copy(valid_mask, ljca_gpio->gpio_info->valid_pin_map, ngpios);
+
+	return 0;
+}
+
+static void ljca_gpio_irq_init_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+					  unsigned int ngpios)
+{
+	ljca_gpio_init_valid_mask(chip, valid_mask, ngpios);
+}
+
+static int ljca_enable_irq(struct ljca_gpio_dev *ljca_gpio, int gpio_id, bool enable)
+{
+	struct gpio_packet *packet = (struct gpio_packet *)ljca_gpio->obuf;
+	int ret;
+
+	mutex_lock(&ljca_gpio->trans_lock);
+	packet->num = 1;
+	packet->item[0].index = gpio_id;
+	packet->item[0].value = 0;
+
+	ret = ljca_transfer(ljca_gpio->gpio_info->ljca,
+			    enable ? LJCA_GPIO_INT_UNMASK : LJCA_GPIO_INT_MASK, packet,
+			    struct_size(packet, item, packet->num), NULL, NULL);
+	mutex_unlock(&ljca_gpio->trans_lock);
+	return ret;
+}
+
+static void ljca_gpio_async(struct work_struct *work)
+{
+	struct ljca_gpio_dev *ljca_gpio = container_of(work, struct ljca_gpio_dev, work);
+	int gpio_id;
+	int unmasked;
+
+	for_each_set_bit(gpio_id, ljca_gpio->reenable_irqs, ljca_gpio->gc.ngpio) {
+		clear_bit(gpio_id, ljca_gpio->reenable_irqs);
+		unmasked = test_bit(gpio_id, ljca_gpio->unmasked_irqs);
+		if (unmasked)
+			ljca_enable_irq(ljca_gpio, gpio_id, true);
+	}
+}
+
+static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data, int len)
+{
+	const struct gpio_packet *packet = evt_data;
+	struct ljca_gpio_dev *ljca_gpio = context;
+	int i;
+	int irq;
+
+	if (cmd != LJCA_GPIO_INT_EVENT)
+		return;
+
+	for (i = 0; i < packet->num; i++) {
+		irq = irq_find_mapping(ljca_gpio->gc.irq.domain, packet->item[i].index);
+		if (!irq) {
+			dev_err(ljca_gpio->gc.parent, "gpio_id %u does not mapped to IRQ yet\n",
+				packet->item[i].index);
+			return;
+		}
+
+		generic_handle_domain_irq(ljca_gpio->gc.irq.domain, irq);
+		set_bit(packet->item[i].index, ljca_gpio->reenable_irqs);
+	}
+
+	schedule_work(&ljca_gpio->work);
+}
+
+static void ljca_irq_unmask(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+
+	gpiochip_enable_irq(gc, gpio_id);
+	set_bit(gpio_id, ljca_gpio->unmasked_irqs);
+}
+
+static void ljca_irq_mask(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+
+	clear_bit(gpio_id, ljca_gpio->unmasked_irqs);
+	gpiochip_disable_irq(gc, gpio_id);
+}
+
+static int ljca_irq_set_type(struct irq_data *irqd, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+
+	ljca_gpio->connect_mode[gpio_id] = LJCA_GPIO_CONF_INTERRUPT;
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLUP);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_LEVEL | LJCA_GPIO_CONF_PULLDOWN);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLUP);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ljca_gpio->connect_mode[gpio_id] |= (LJCA_GPIO_CONF_EDGE | LJCA_GPIO_CONF_PULLDOWN);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void ljca_irq_bus_lock(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+
+	mutex_lock(&ljca_gpio->irq_lock);
+}
+
+static void ljca_irq_bus_unlock(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(gc);
+	int gpio_id = irqd_to_hwirq(irqd);
+	int enabled;
+	int unmasked;
+
+	enabled = test_bit(gpio_id, ljca_gpio->enabled_irqs);
+	unmasked = test_bit(gpio_id, ljca_gpio->unmasked_irqs);
+
+	if (enabled != unmasked) {
+		if (unmasked) {
+			gpio_config(ljca_gpio, gpio_id, 0);
+			ljca_enable_irq(ljca_gpio, gpio_id, true);
+			set_bit(gpio_id, ljca_gpio->enabled_irqs);
+		} else {
+			ljca_enable_irq(ljca_gpio, gpio_id, false);
+			clear_bit(gpio_id, ljca_gpio->enabled_irqs);
+		}
+	}
+
+	mutex_unlock(&ljca_gpio->irq_lock);
+}
+
+static const struct irq_chip ljca_gpio_irqchip = {
+	.name = "ljca-irq",
+	.irq_mask = ljca_irq_mask,
+	.irq_unmask = ljca_irq_unmask,
+	.irq_set_type = ljca_irq_set_type,
+	.irq_bus_lock = ljca_irq_bus_lock,
+	.irq_bus_sync_unlock = ljca_irq_bus_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int ljca_gpio_probe(struct platform_device *pdev)
+{
+	struct ljca_gpio_dev *ljca_gpio;
+	struct gpio_irq_chip *girq;
+	int ret;
+
+	ljca_gpio = devm_kzalloc(&pdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
+	if (!ljca_gpio)
+		return -ENOMEM;
+
+	ljca_gpio->gpio_info = dev_get_platdata(&pdev->dev);
+	ljca_gpio->connect_mode = devm_kcalloc(&pdev->dev, ljca_gpio->gpio_info->num,
+					       sizeof(*ljca_gpio->connect_mode), GFP_KERNEL);
+	if (!ljca_gpio->connect_mode)
+		return -ENOMEM;
+
+	mutex_init(&ljca_gpio->irq_lock);
+	mutex_init(&ljca_gpio->trans_lock);
+	ljca_gpio->pdev = pdev;
+	ljca_gpio->gc.direction_input = ljca_gpio_direction_input;
+	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
+	ljca_gpio->gc.get = ljca_gpio_get_value;
+	ljca_gpio->gc.set = ljca_gpio_set_value;
+	ljca_gpio->gc.set_config = ljca_gpio_set_config;
+	ljca_gpio->gc.init_valid_mask = ljca_gpio_init_valid_mask;
+	ljca_gpio->gc.can_sleep = true;
+	ljca_gpio->gc.parent = &pdev->dev;
+
+	ljca_gpio->gc.base = -1;
+	ljca_gpio->gc.ngpio = ljca_gpio->gpio_info->num;
+	ljca_gpio->gc.label = ACPI_COMPANION(&pdev->dev) ?
+			      acpi_dev_name(ACPI_COMPANION(&pdev->dev)) :
+			      dev_name(&pdev->dev);
+	ljca_gpio->gc.owner = THIS_MODULE;
+
+	platform_set_drvdata(pdev, ljca_gpio);
+	ljca_register_event_cb(ljca_gpio->gpio_info->ljca, ljca_gpio_event_cb, ljca_gpio);
+
+	girq = &ljca_gpio->gc.irq;
+	gpio_irq_chip_set_chip(girq, &ljca_gpio_irqchip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+	girq->init_valid_mask = ljca_gpio_irq_init_valid_mask;
+
+	INIT_WORK(&ljca_gpio->work, ljca_gpio_async);
+	ret = gpiochip_add_data(&ljca_gpio->gc, ljca_gpio);
+	if (ret) {
+		ljca_unregister_event_cb(ljca_gpio->gpio_info->ljca);
+		mutex_destroy(&ljca_gpio->irq_lock);
+		mutex_destroy(&ljca_gpio->trans_lock);
+	}
+
+	return ret;
+}
+
+static int ljca_gpio_remove(struct platform_device *pdev)
+{
+	struct ljca_gpio_dev *ljca_gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&ljca_gpio->gc);
+	ljca_unregister_event_cb(ljca_gpio->gpio_info->ljca);
+	mutex_destroy(&ljca_gpio->irq_lock);
+	mutex_destroy(&ljca_gpio->trans_lock);
+	return 0;
+}
+
+#define LJCA_GPIO_DRV_NAME "ljca-gpio"
+static const struct platform_device_id ljca_gpio_id[] = {
+	{ LJCA_GPIO_DRV_NAME, 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, ljca_gpio_id);
+
+static struct platform_driver ljca_gpio_driver = {
+	.driver.name = LJCA_GPIO_DRV_NAME,
+	.probe = ljca_gpio_probe,
+	.remove = ljca_gpio_remove,
+};
+module_platform_driver(ljca_gpio_driver);
+
+MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
+MODULE_AUTHOR("Wang Zhifeng <zhifeng.wang@intel.com>");
+MODULE_AUTHOR("Zhang Lixu <lixu.zhang@intel.com>");
+MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(LJCA);
-- 
2.34.1

