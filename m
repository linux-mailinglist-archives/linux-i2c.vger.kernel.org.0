Return-Path: <linux-i2c+bounces-6641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C43977077
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7134D1F2614E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5718D1C2301;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8mHMuSY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D51C174C;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165216; cv=none; b=VOBPkWDxIm6anwz6ybLzHyTEMlC6wBYh3C6rzvlwtmS9G1tDG+6otkKpXqpUGun0cm37jUQmp0VVPSZo6grt1sw6N8p1dtnprmydipBXsj0Gw/r2vJeUc7NEwXV4eJFQsGauN8uYAzsn8PdpOKdyUsjVBgzkjW3iETkLo4S/QI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165216; c=relaxed/simple;
	bh=wVb2LXhtvUg6DF3hJthXlyWEU5vK2OELZFVCqaVVgRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JuTiifHBctgWjdc5Ou/pnVlirOnSiJH9g0Bf8tN8GhVUfBj3J2kUjWni/j3thfk7ncNH0ROPQiFR78CJ+xrdTxTQERNmY3erdZdztIgelYVfQnR64ixUUe9BYN2keMRueLcCN97GSxGgT2bhSY8T29FRIDOaPlvnrMhpZt83yIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8mHMuSY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA6E7C32782;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=wVb2LXhtvUg6DF3hJthXlyWEU5vK2OELZFVCqaVVgRI=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=j8mHMuSYOT3KXGkGEZfLlOTlBmqcPVgpmPUhppUnVq5UlLobi7NWGDN/d1yH8y2II
	 656n4eIJyaRPZk/oZMQM0pipEPkXSqm+EFi+b7BppMf0wki79NP4reYLItx8++XYcS
	 96HtshdV7bIbtoBt3jaIAkYTJiiDgJ9iReLruAzKZiCOO4Wm1mVwuP3EL2JWggDix7
	 O5cRsP7I7WjaSb8LmXvjEx/hyKK66gcSpOHARMzg5LUwzIh22KsPlPD9m/65ulhEb4
	 7DEO2VFjonMr5CSUyaOCn8z+oAf5Tdpn8jOVgQFrulgD39kAGz5w0pEk6S8WipvtJA
	 CZIHTNiDKu/zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FA7EEE258;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:56 +0100
Subject: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-11-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=10414;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=kfES6vjl8NkFU8R7RYQVCofDuP57K6JhH4VbJu5VdjU=;
 b=GZAR3QoQnY/atWwNsrGN30hsZ3O6rcojIz2qEwsg1/6LiolmjTGdLKJ2tumZqv0eTZ0XfMGri
 j/MKGX10ejkCylAEIgL27zdVsR3W273JUnxIVmTLSJPeqMoJJdgK8l/
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Support seting extra indepdendent interrupt on pin activity.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/irqchip/Kconfig        |   9 ++
 drivers/irqchip/Makefile       |   2 +
 drivers/irqchip/irq-adi-adsp.c | 310 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 321 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d078bdc48c38f13af9a129974f3b637dfee0e40f..1bc8f1bd45b3d2f69d2d0e6c8fa01b17b12ce241 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -91,6 +91,15 @@ config ALPINE_MSI
 	select PCI_MSI
 	select GENERIC_IRQ_CHIP
 
+config ADI_ADSP_IRQ
+	bool "ADI PORT PINT Driver"
+	depends on OF
+	depends on (ARCH_SC59X_64 || ARCH_SC59X)
+	select IRQ_DOMAIN
+	help
+	  Say Y to enable the PORT-based PINT interrupt controller for
+	  Analog Devices ADSP devices.
+
 config AL_FIC
 	bool "Amazon's Annapurna Labs Fabric Interrupt Controller"
 	depends on OF
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 15635812b2d6605a2dd3bb0e5fb3170ab2cb0f77..258a188676fd97e713f3cebe16e3d563add095f3 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IRQCHIP)			+= irqchip.o
 
+
+obj-$(CONFIG_ADI_ADSP_IRQ)		+= irq-adi-adsp.o
 obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
 obj-$(CONFIG_ATH79)			+= irq-ath79-cpu.o
diff --git a/drivers/irqchip/irq-adi-adsp.c b/drivers/irqchip/irq-adi-adsp.c
new file mode 100644
index 0000000000000000000000000000000000000000..75e10575ca80216b8baf5cb8daf1f62efae5f23b
--- /dev/null
+++ b/drivers/irqchip/irq-adi-adsp.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * ADSP PINT PORT driver.
+ *
+ * The default mapping is used for all PINTs, refer to the HRM to identify
+ * PORT mapping to PINTs. For example, PINT0 has PORT B (0-15) and PORT A
+ * (16-31).
+ *
+ * Copyright (C) 2022-2024, Analog Devices, Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/soc/adi/adsp-gpio-port.h>
+
+#define ADSP_PINT_IRQS 32
+
+/* Register offsets in a single PINT */
+#define ADSP_PINT_REG_MASK_SET			0x00
+#define ADSP_PINT_REG_MASK_CLEAR		0x04
+#define ADSP_PINT_REG_REQUEST			0x08
+#define ADSP_PINT_REG_ASSIGN			0x0c
+#define ADSP_PINT_REG_EDGE_SET			0x10
+#define ADSP_PINT_REG_EDGE_CLEAR		0x14
+#define ADSP_PINT_REG_INVERT_SET		0x18
+#define ADSP_PINT_REG_INVERT_CLEAR		0x1c
+#define ADSP_PINT_REG_PINSTATE			0x20
+#define ADSP_PINT_REG_LATCH				0x24
+
+struct adsp_pint {
+	struct irq_chip chip;
+	void __iomem *regs;
+	struct irq_domain *domain;
+	unsigned int irq;
+};
+
+static struct adsp_pint *to_adsp_pint(struct irq_chip *chip)
+{
+	return container_of(chip, struct adsp_pint, chip);
+}
+
+/**
+ * Each gpio device should be connected to one of the two valid pints with an
+ * indicator of which half it is connected to:
+ *
+ * pint0 {
+ *   ...
+ * };
+ * gpa {
+ *   adi,pint = <&pint0 1>;
+ * };
+ * gpb {
+ *   adi,pint = <&pint0 0>;
+ * };
+ *
+ * This relies on the default configuration of the hardware, which we do not
+ * expose an interface to change.
+ */
+int adsp_attach_pint_to_gpio(struct adsp_gpio_port *port)
+{
+	struct platform_device *pint_pdev;
+	struct device_node *pint_node;
+	struct adsp_pint *pint;
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(port->dev->of_node, "adi,pint", 1, 0,
+		&args);
+	if (ret) {
+		dev_err(port->dev, "Missing or invalid adi,pint connection for %pOFn; "
+			"attach a pint instance with one argument for port assignment\n",
+			port->dev->of_node);
+		return ret;
+	}
+
+	pint_node = args.np;
+
+	pint_pdev = of_find_device_by_node(pint_node);
+	if (!pint_pdev) {
+		ret = -EPROBE_DEFER;
+		goto cleanup;
+	}
+
+	pint = dev_get_drvdata(&pint_pdev->dev);
+	if (!pint) {
+		ret = -EPROBE_DEFER;
+		goto cleanup;
+	}
+
+	port->irq_domain = pint->domain;
+
+	if (args.args[0])
+		port->irq_offset = 16;
+	else
+		port->irq_offset = 0;
+
+cleanup:
+	of_node_put(pint_node);
+	return ret;
+}
+
+static void adsp_pint_dispatch_irq(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct adsp_pint *pint = to_adsp_pint(chip);
+	unsigned int type = irqd_get_trigger_type(&desc->irq_data);
+	u32 pos = BIT(desc->irq_data.hwirq);
+
+	/* for both edge interrupt, toggle invert bit to catch next edge */
+	if (type == IRQ_TYPE_EDGE_BOTH) {
+		u32 invert = readl(pint->regs + ADSP_PINT_REG_INVERT_SET) & pos;
+
+		if (invert)
+			writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
+		else
+			writel(pos, pint->regs + ADSP_PINT_REG_INVERT_SET);
+	}
+
+	writel(pos, pint->regs + ADSP_PINT_REG_REQUEST);
+
+	/* either edge is set */
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		handle_edge_irq(desc);
+	else
+		handle_level_irq(desc);
+}
+
+static int adsp_pint_irq_map(struct irq_domain *domain, unsigned int irq,
+	irq_hw_number_t hwirq)
+{
+	struct adsp_pint *pint = domain->host_data;
+
+	irq_set_chip_data(irq, pint);
+	irq_set_chip_and_handler(irq, &pint->chip, adsp_pint_dispatch_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops adsp_irq_domain_ops = {
+	.map = adsp_pint_irq_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+/**
+ * This handles the GIC interrupt associated with this PINT being activated.
+ * It chains the interrupt associated with a particular pin
+ */
+static void adsp_pint_irq_handler(struct irq_desc *desc)
+{
+	struct adsp_pint *pint = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long req;
+	int pos;
+
+	chained_irq_enter(chip, desc);
+
+	req = readl(pint->regs + ADSP_PINT_REG_REQUEST);
+
+	for_each_set_bit(pos, &req, 32) {
+		unsigned int virq = irq_find_mapping(pint->domain, pos);
+
+		if (virq)
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void adsp_pint_irq_ack(struct irq_data *d)
+{
+	/* this is required for edge type irqs unconditionally */
+}
+
+static void adsp_pint_irq_mask(struct irq_data *d)
+{
+	struct adsp_pint *pint = irq_data_get_irq_chip_data(d);
+
+	writel(BIT(d->hwirq), pint->regs + ADSP_PINT_REG_MASK_CLEAR);
+}
+
+static void adsp_pint_irq_unmask(struct irq_data *d)
+{
+	struct adsp_pint *pint = irq_data_get_irq_chip_data(d);
+
+	writel(BIT(d->hwirq), pint->regs + ADSP_PINT_REG_MASK_SET);
+}
+
+static int adsp_pint_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct adsp_pint *pint = irq_data_get_irq_chip_data(d);
+	unsigned int pos = BIT(d->hwirq);
+
+	switch (type) {
+	case IRQ_TYPE_PROBE:
+		type = IRQ_TYPE_EDGE_BOTH;
+		fallthrough;
+	case IRQ_TYPE_EDGE_BOTH:
+		/* start by looking for rising edge */
+		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
+		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_SET);
+		return 0;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_SET);
+		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_SET);
+		return 0;
+
+	case IRQ_TYPE_EDGE_RISING:
+		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
+		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_SET);
+		return 0;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
+		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_CLEAR);
+		return 0;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_SET);
+		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_CLEAR);
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+
+}
+
+static int adsp_pint_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct adsp_pint *pint;
+
+	pint = devm_kzalloc(dev, sizeof(*pint), GFP_KERNEL);
+	if (!pint)
+		return -ENOMEM;
+
+	pint->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pint->regs))
+		return PTR_ERR(pint->regs);
+
+	pint->chip.name = "adsp-pint";
+	pint->chip.irq_ack = adsp_pint_irq_ack;
+	pint->chip.irq_mask = adsp_pint_irq_mask;
+	pint->chip.irq_unmask = adsp_pint_irq_unmask;
+	pint->chip.irq_set_type = adsp_pint_irq_set_type;
+	// @todo potentially only SEC supports wake options, not gic
+
+	// @todo determine if we actually need a raw spinlock
+
+	pint->domain = irq_domain_add_linear(np, ADSP_PINT_IRQS,
+		&adsp_irq_domain_ops, pint);
+	if (!pint->domain) {
+		dev_err(dev, "Could not create irq domain\n");
+		return -EINVAL;
+	}
+
+	pint->irq = platform_get_irq(pdev, 0);
+	if (!pint->irq) {
+		dev_err(dev, "Could not find parent interrupt for port\n");
+		return -EINVAL;
+	}
+
+	irq_set_chained_handler_and_data(pint->irq, adsp_pint_irq_handler, pint);
+	platform_set_drvdata(pdev, pint);
+
+	return 0;
+}
+
+static void adsp_pint_remove(struct platform_device *pdev)
+{
+	struct adsp_pint *pint = platform_get_drvdata(pdev);
+
+	irq_set_chained_handler_and_data(pint->irq, NULL, NULL);
+	irq_domain_remove(pint->domain);
+}
+
+static const struct of_device_id adsp_pint_of_match[] = {
+	{ .compatible = "adi,adsp-pint" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adsp_pint_of_match);
+
+static struct platform_driver adsp_pint_driver = {
+	.driver = {
+		.name = "adsp-port-pint",
+		.of_match_table = adsp_pint_of_match,
+	},
+	.probe = adsp_pint_probe,
+	.remove = adsp_pint_remove,
+};
+
+static int __init adsp_pint_init(void)
+{
+	return platform_driver_register(&adsp_pint_driver);
+}
+
+arch_initcall(adsp_pint_init);
+
+MODULE_DESCRIPTION("Analog Devices IRQChip driver");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
\ No newline at end of file

-- 
2.25.1



