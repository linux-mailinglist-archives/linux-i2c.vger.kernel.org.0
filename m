Return-Path: <linux-i2c+bounces-6632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5D977048
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D6F22845BB
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923171C0DC0;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuS+NloU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CBE126BED;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=u1WVsgu1M0JAX/pV/HFrq7du7DzJD3+Sr+wbldRjg/Mfg1C4pAxbm30ZcSN8ign/EvSsIJKOqKHvY+jaisS3W2eGAzbX1vh017G6NYHXbQxWwMzwK1fp05BWotN1OY659KV+JTQndWhKHcnD7Y99MDJ9UnOTTdG/yV5/SNkIclM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=ptTHhO/RSXSVsdindc7EjYTMDmcxjcELqNQXSlU/WQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1Q77RIRS5ELqhS79oZk75hXVykYsVDgj1EpjinZd2qvzKqtCuCJGE+wzYYlTOAVD5j3L3pipxKUDzoTdQaY/gJmpeSdVE4EkSQ4hcadSTM1uZEkyWJ9AaC/Bz78nh5DGWH5Ds9pbexqnTgtj7ysrSSLjdfz/BwL0ajHVsMHWwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuS+NloU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB15AC4CEC6;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165214;
	bh=ptTHhO/RSXSVsdindc7EjYTMDmcxjcELqNQXSlU/WQA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=ZuS+NloUOWC1hdVfV3Hozm0tjAA1nB956c2hevr9vIm0C0ISQE9/cr2cbguNOR97M
	 M72BetG0IohcgdLKfKu4LJnx2+01ROhoc6NYkWiGjAfwTHIv1OuxMs7OEV3HFv8uAm
	 2+H9uYtpH4SAxsmFNzRzUtjmF7phFiziAarx7PfHxSE4xOKFDoovXyzLO4+TnC21Ci
	 tYrwOK2fukTG+gSpYIlXJE63yZCH8VE3XoNLxpGE0Wrqm56aY4n/0taXRagxdgO98+
	 XJcEp2oA8sgE8tGhVwMzwNEMvS3ZAxD1iGtSS1vo5sjp9N1h+H5Fwbb7LyLM/Y4OHi
	 jQH4eaJoVkeQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F5EED63A;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:46 +0100
Subject: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-1-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=26356;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=LYT5+VmMP/U1fC/g6+IzHvlKcGV3qIp7V9gWae5WAHA=;
 b=y0h1jzbMaKVmcovyu8O2NA2tLm9dnK2uobllgPapan8BjluS6i+jIWqUlo3UyhZwSaqoG6fdn
 jFKM8/BAoaCBalrpRKV9iaxzKqgX7NBMtyknkyJXwBijs693Fhn2kbL
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC598 platform.

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 arch/arm64/Kconfig.platforms           |  13 ++
 drivers/soc/Makefile                   |   1 +
 drivers/soc/adi/Makefile               |   5 +
 drivers/soc/adi/system.c               | 257 +++++++++++++++++++++++++++++++++
 include/linux/soc/adi/adsp-gpio-port.h |  85 +++++++++++
 include/linux/soc/adi/cpu.h            | 107 ++++++++++++++
 include/linux/soc/adi/rcu.h            |  55 +++++++
 include/linux/soc/adi/sc59x.h          | 147 +++++++++++++++++++
 include/linux/soc/adi/system_config.h  |  65 +++++++++
 9 files changed, 735 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42ec6e878db8d355c17994c2500d7b..b9ea22ecddfcbff98486a314143e52934f26df44 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -292,6 +292,19 @@ config ARCH_ROCKCHIP
 	  This enables support for the ARMv8 based Rockchip chipsets,
 	  like the RK3368.
 
+config ARCH_SC59X_64
+	bool "ADI 64-bit SC59X Platforms"
+	select TIMER_OF
+	select GPIOLIB
+	select PINCTRL
+	select COMMON_CLK_ADI_SC598
+	select PINCTRL_ADSP
+	select ADI_ADSP_IRQ
+	select COUNTER
+	help
+		This enables support for Analog Devices Incorporated's
+		Family of ARM64 DSP processors
+
 config ARCH_SEATTLE
 	bool "AMD Seattle SoC Family"
 	help
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index fb2bd31387d070387fcf8a579f618dc2b25bdc69..af518539185563a96e37a2d42ad5535e7366c5fa 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the Linux Kernel SOC specific device drivers.
 #
 
+obj-$(CONFIG_ARCH_SC59X_64)	+= adi/
 obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
diff --git a/drivers/soc/adi/Makefile b/drivers/soc/adi/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..113720192d462e833da69214ce91a7b84aec141b
--- /dev/null
+++ b/drivers/soc/adi/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# todo modularize; already depends on CONFIG_ARCH_SC59X_64 though
+
+obj-y += system.o
diff --git a/drivers/soc/adi/system.c b/drivers/soc/adi/system.c
new file mode 100644
index 0000000000000000000000000000000000000000..42cd157bc68af8819e2a2d2fc5be009b4753bd29
--- /dev/null
+++ b/drivers/soc/adi/system.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/soc/adi/system_config.h>
+
+#define ADI_SYSREG_BITS(_id, _offset, _width, _shift) \
+	{ \
+		.id = ADI_SYSTEM_REG_##_id, \
+		.offset = _offset, \
+		.mask = GENMASK(_width-1, 0) << _shift, \
+		.shift = _shift, \
+		.is_bits = true, \
+	}
+
+#define ADI_SYSREG(_id, _offset) \
+	{ \
+		.id = ADI_SYSTEM_REG_##_id, \
+		.offset = _offset, \
+		.is_bits = false, \
+	}
+
+#define devm_regmap_init_adi_system_config(dev, config) \
+	__regmap_lockdep_wrapper(__devm_regmap_init_adi_system_config, \
+	#config, dev, config)
+
+struct adi_system_context {
+	/* underlying regmap_mmio */
+	struct regmap *regmap;
+	/* tree of register definitions by index */
+	struct radix_tree_root tree;
+	/* configuration we were created with */
+	struct adi_system_config *config;
+};
+
+/*
+ * Fields in PADS CFG0 at offset +0x04
+ */
+static struct adi_system_register adi_pads_regs[] = {
+	ADI_SYSREG_BITS(EMAC0_PTPCLK0, 0x04, 2, 0),
+	ADI_SYSREG_BITS(EMAC0_EMACRESET, 0x04, 1, 2),
+	ADI_SYSREG_BITS(EMAC0_PHYISEL, 0x04, 2, 3),
+	ADI_SYSREG_BITS(CNT0UDSEL, 0x04, 2, 6),
+	ADI_SYSREG_BITS(CNT0DGSEL, 0x04, 2, 7),
+	ADI_SYSREG_BITS(PUTMS, 0x04, 2, 16),
+	ADI_SYSREG_BITS(EMAC0_AUXIE, 0x04, 1, 17),
+	ADI_SYSREG_BITS(FAULT_DIS, 0x04, 1, 18),
+	ADI_SYSREG_BITS(EMAC0_ENDIANNESS, 0x04, 1, 19),
+	ADI_SYSREG_BITS(EMAC1_ENDIANNESS, 0x04, 1, 20),
+	ADI_SYSREG_BITS(MSHC_CCLK_DIV_EN, 0x04, 1, 22),
+	ADI_SYSREG(DAI0_IE, 0x90),
+	ADI_SYSREG(DAI1_IE, 0x94),
+};
+
+static struct adi_system_config adi_pads_config = {
+	.registers = adi_pads_regs,
+	.len = ARRAY_SIZE(adi_pads_regs),
+	.max_register = __ADI_SYSTEM_REG_COUNT,
+};
+
+static int regmap_system_read(void *context, unsigned int reg,
+		unsigned int *val)
+{
+	struct adi_system_context *ctx = context;
+	struct adi_system_register *sreg =
+		radix_tree_lookup(&ctx->tree, reg);
+	int ret;
+
+	if (!sreg)
+		return -EIO;
+
+	if (sreg->is_bits) {
+		uint32_t tmp;
+
+		ret = regmap_read(ctx->regmap, sreg->offset, &tmp);
+		if (ret)
+			return ret;
+
+		tmp = (tmp & sreg->mask) >> sreg->shift;
+		*val = tmp;
+		return 0;
+	}
+
+	return regmap_read(ctx->regmap, sreg->offset, val);
+}
+
+static int regmap_system_write(void *context, unsigned int reg,
+		unsigned int val)
+{
+	struct adi_system_context *ctx = context;
+	struct adi_system_register *sreg = radix_tree_lookup(&ctx->tree, reg);
+
+	if (!sreg)
+		return -EIO;
+
+	if (sreg->is_bits) {
+		return regmap_update_bits(ctx->regmap, sreg->offset,
+				sreg->mask,
+			(val << sreg->shift) & sreg->mask);
+	}
+
+	return regmap_write(ctx->regmap, sreg->offset, val);
+}
+
+static struct adi_system_context *create_context
+(struct adi_system_config *config)
+{
+	struct regmap *regmap = config->mmio_regmap;
+	struct adi_system_context *ctx;
+	size_t i;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->regmap = regmap;
+	INIT_RADIX_TREE(&ctx->tree, GFP_KERNEL);
+
+	for (i = 0; i < config->len; ++i) {
+		struct adi_system_register *sreg = &config->registers[i];
+
+		ret = radix_tree_insert(&ctx->tree, sreg->id, sreg);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	config->config.max_register = config->max_register;
+	config->config.reg_bits = 8 * sizeof(uint32_t);
+	config->config.val_bits = 8 * sizeof(uint32_t);
+	config->config.reg_stride = 1;
+
+	return ctx;
+}
+
+static void regmap_system_free_context(void *context)
+{
+	struct adi_system_context *ctx = context;
+	unsigned int i;
+
+	for (i = 0; i < ctx->config->len; ++i)
+		radix_tree_delete(&ctx->tree,
+				ctx->config->registers[i].id);
+
+	kfree(ctx);
+}
+
+static const struct regmap_bus regmap_system_bus = {
+	.fast_io = true,
+	.reg_write = regmap_system_write,
+	.reg_read = regmap_system_read,
+	.free_context = regmap_system_free_context,
+	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
+};
+
+static struct regmap *__devm_regmap_init_adi_system_config(struct device *dev,
+	struct adi_system_config *config,
+	struct lock_class_key *lock_key, const char *lock_name)
+{
+	struct adi_system_context *ctx = create_context(config);
+
+	if (IS_ERR(ctx))
+		return ERR_PTR(PTR_ERR(ctx));
+
+	return __devm_regmap_init(dev, &regmap_system_bus, ctx,
+			&config->config,
+		lock_key, lock_name);
+}
+
+static DEFINE_SPINLOCK(adi_system_config_lock);
+static LIST_HEAD(adi_system_config_list);
+
+static int adi_system_config_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct adi_system_config *config = &adi_pads_config;
+	struct device_node *np = dev->of_node;
+	struct regmap *regmap_mmio;
+	struct regmap *regmap_system;
+	struct resource *res;
+	void __iomem *base;
+	unsigned long flags;
+
+	struct regmap_config mmio_config = {
+		.reg_bits = 8 * sizeof(uint32_t),
+		.val_bits = 8 * sizeof(uint32_t),
+		.reg_stride = sizeof(uint32_t),
+	};
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	mmio_config.name = dev_name(dev);
+	mmio_config.max_register = resource_size(res) - sizeof(uint32_t);
+
+	regmap_mmio = devm_regmap_init_mmio(dev, base, &mmio_config);
+	if (IS_ERR(regmap_mmio)) {
+		dev_err(dev, "mmio regmap initialization failed\n");
+		return PTR_ERR(regmap_mmio);
+	}
+
+	config->mmio_regmap = regmap_mmio;
+	regmap_system = devm_regmap_init_adi_system_config(dev, config);
+	if (IS_ERR(regmap_system)) {
+		dev_err(dev, "system config regmap initialization failed\n");
+		return PTR_ERR(regmap_system);
+	}
+
+	config->np = np;
+	config->system_regmap = regmap_system;
+	platform_set_drvdata(pdev, config);
+
+	spin_lock_irqsave(&adi_system_config_lock, flags);
+	list_add_tail(&config->list, &adi_system_config_list);
+	spin_unlock_irqrestore(&adi_system_config_lock, flags);
+	return 0;
+}
+
+static void adi_system_config_remove(struct platform_device *pdev)
+{
+	struct adi_system_config *config = platform_get_drvdata(pdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&adi_system_config_lock, flags);
+	list_del(&config->list);
+	spin_unlock_irqrestore(&adi_system_config_lock, flags);
+}
+
+/*
+ * PADs configuration registers are required to configure peripherals,
+ * and by extension the system. Hence the driver focuses on driving them while
+ * also setting up the remaining system.
+ */
+static const struct of_device_id pads_dt_ids[] = {
+	{ .compatible = "adi,pads-peripheral-config", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pads_dt_ids);
+
+static struct platform_driver pads_driver = {
+	.driver = {
+		.name = "adi-system-config",
+		.of_match_table = pads_dt_ids,
+	},
+	.probe = adi_system_config_probe,
+	.remove = adi_system_config_remove,
+};
+module_platform_driver(pads_driver);
+
+MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
+MODULE_DESCRIPTION("ADI ADSP PADS CFG-based System Configuration Driver");
+MODULE_LICENSE("GPL v2");
\ No newline at end of file
diff --git a/include/linux/soc/adi/adsp-gpio-port.h b/include/linux/soc/adi/adsp-gpio-port.h
new file mode 100644
index 0000000000000000000000000000000000000000..6466ded03ec6092149a2abfc56a305f9124ac695
--- /dev/null
+++ b/include/linux/soc/adi/adsp-gpio-port.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef GPIO_ADI_ADSP_PORT_H
+#define GPIO_ADI_ADSP_PORT_H
+
+#include <linux/gpio/driver.h>
+
+/* Number of GPIOs per port instance */
+#define ADSP_PORT_NGPIO 16
+
+/* PORT memory layout */
+#define ADSP_PORT_REG_FER		0x00
+#define ADSP_PORT_REG_FER_SET		0x04
+#define ADSP_PORT_REG_FER_CLEAR		0x08
+#define ADSP_PORT_REG_DATA		0x0c
+#define ADSP_PORT_REG_DATA_SET		0x10
+#define ADSP_PORT_REG_DATA_CLEAR	0x14
+#define ADSP_PORT_REG_DIR		0x18
+#define ADSP_PORT_REG_DIR_SET		0x1c
+#define ADSP_PORT_REG_DIR_CLEAR		0x20
+#define ADSP_PORT_REG_INEN		0x24
+#define ADSP_PORT_REG_INEN_SET		0x28
+#define ADSP_PORT_REG_INEN_CLEAR	0x2c
+#define ADSP_PORT_REG_PORT_MUX		0x30
+#define ADSP_PORT_REG_DATA_TGL		0x34
+#define ADSP_PORT_REG_POLAR		0x38
+#define ADSP_PORT_REG_POLAR_SET		0x3c
+#define ADSP_PORT_REG_POLAR_CLEAR	0x40
+#define ADSP_PORT_REG_LOCK		0x44
+#define ADSP_PORT_REG_TRIG_TGL		0x48
+
+/*
+ * One gpio instance per PORT instance in the hardware, provides the per-PORT
+ * interface to the hardware. Referenced in GPIO and PINCTRL drivers
+ */
+struct adsp_gpio_port {
+	struct device *dev;
+	void __iomem *regs;
+	struct gpio_chip gpio;
+	struct irq_domain *irq_domain;
+	uint32_t irq_offset;
+	uint32_t open_drain;
+	spinlock_t lock;
+};
+
+/* may need lock depending on register */
+static inline uint32_t __adsp_gpio_readl(struct adsp_gpio_port *port,
+				    size_t offset)
+{
+	return readl(port->regs + offset);
+}
+
+/* may need lock depending on register */
+static inline void __adsp_gpio_writel(struct adsp_gpio_port *port, uint32_t val,
+				      size_t offset)
+{
+	writel(val, port->regs + offset);
+}
+
+/* may need lock depending on register */
+static inline u16 __adsp_gpio_readw(struct adsp_gpio_port *port,
+				    size_t offset)
+{
+	return readw(port->regs + offset);
+}
+
+/* may need lock depending on register */
+static inline void __adsp_gpio_writew(struct adsp_gpio_port *port, u16 val,
+				      size_t offset)
+{
+	writew(val, port->regs + offset);
+}
+
+static inline struct adsp_gpio_port *to_adsp_gpio_port(struct gpio_chip
+						       *chip)
+{
+	return container_of(chip, struct adsp_gpio_port, gpio);
+}
+
+int adsp_attach_pint_to_gpio(struct adsp_gpio_port *port);
+
+#endif
diff --git a/include/linux/soc/adi/cpu.h b/include/linux/soc/adi/cpu.h
new file mode 100644
index 0000000000000000000000000000000000000000..0ddb30619b423ce70e9b8018ed6404cfd4ef6039
--- /dev/null
+++ b/include/linux/soc/adi/cpu.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef __MACH_CPU_H
+#define __MACH_CPU_H
+
+#define SYS_L2_START		0x20080000
+#define SYS_SRAM_BASE		(0x20080000 + SZ_16K)
+
+#define SYS_SRAM_SIZE		(SZ_16K + SZ_32K * 3)
+#define SYS_SRAM_ICC_SIZE	SZ_4K
+#define SYS_MMR_BASE		0x31000000
+#define SYS_MMR_SIZE		SZ_1M
+#define SYS_SMC_BANK1		0x44000000
+
+#define SC59X_GIC_PORT0		0x310B2000
+#define SC59X_GIC_PORT1		0x310B4000
+
+/*
+ * Timer Configuration Register Bits
+ */
+#define TIMER_EMU_RUN		0x8000
+#define TIMER_BPER_EN		0x4000
+#define TIMER_BWID_EN		0x2000
+#define TIMER_BDLY_EN		0x1000
+#define TIMER_OUT_DIS		0x0800
+#define TIMER_TIN_SEL		0x0400
+#define TIMER_CLK_SEL		0x0300
+#define TIMER_CLK_SCLK		0x0000
+#define TIMER_CLK_ALT_CLK0	0x0100
+#define TIMER_CLK_ALT_CLK1	0x0300
+#define TIMER_PULSE_HI		0x0080
+#define TIMER_SLAVE_TRIG	0x0040
+#define TIMER_IRQ_MODE		0x0030
+#define TIMER_IRQ_ACT_EDGE	0x0000
+#define TIMER_IRQ_DLY		0x0010
+#define TIMER_IRQ_WID_DLY	0x0020
+#define TIMER_IRQ_PER		0x0030
+#define TIMER_MODE		0x000f
+#define TIMER_MODE_WDOG_P	0x0008
+#define TIMER_MODE_WDOG_W	0x0009
+#define TIMER_MODE_PWM_CONT	0x000c
+#define TIMER_MODE_PWM		0x000d
+#define TIMER_MODE_WDTH		0x000a
+#define TIMER_MODE_WDTH_D	0x000b
+#define TIMER_MODE_EXT_CLK	0x000e
+#define TIMER_MODE_PININT	0x000f
+
+#define __BFP(m) u16 m; u16 __pad_##m
+
+struct gptimer3 {
+	__BFP(config);
+	uint32_t counter;
+	uint32_t period;
+	uint32_t width;
+	uint32_t delay;
+};
+
+struct sc5xx_gptimer {
+	int id;
+	int irq;
+	int reserved;
+	int int_enable;
+	void __iomem *io_base;
+	void __iomem *cgu0_ctl;
+	unsigned long isr_count;
+	struct platform_device *pdev;
+	struct list_head node;
+};
+
+struct gptimer3_group_regs {
+	__BFP(run);
+	__BFP(enable);
+	__BFP(disable);
+	__BFP(stop_cfg);
+	__BFP(stop_cfg_set);
+	__BFP(stop_cfg_clr);
+	__BFP(data_imsk);
+	__BFP(stat_imsk);
+	__BFP(tr_msk);
+	__BFP(tr_ie);
+	__BFP(data_ilat);
+	__BFP(stat_ilat);
+	__BFP(err_status);
+	__BFP(bcast_per);
+	__BFP(bcast_wid);
+	__BFP(bcast_dly);
+};
+
+/* The actual gptimer API */
+struct sc5xx_gptimer *gptimer_request(int id);
+int gptimer_free(struct sc5xx_gptimer *timer);
+void set_gptimer_pwidth(struct sc5xx_gptimer *timer, uint32_t width);
+void set_gptimer_period(struct sc5xx_gptimer *timer, uint32_t period);
+uint32_t get_gptimer_count(struct sc5xx_gptimer *timer);
+void set_gptimer_config(struct sc5xx_gptimer *timer, uint16_t config);
+void enable_gptimers(uint16_t mask);
+void disable_gptimers(uint16_t mask);
+void map_gptimers(void);
+uint16_t get_gptimer_status(void);
+void set_gptimer_status(uint16_t value);
+void set_spu_securep_msec(uint16_t n, bool msec);
+void platform_ipi_init(void);
+
+#endif				/* __MACH_CPU_H */
diff --git a/include/linux/soc/adi/rcu.h b/include/linux/soc/adi/rcu.h
new file mode 100644
index 0000000000000000000000000000000000000000..929989ff8f142609d5aecaffe0e8aa659875c47e
--- /dev/null
+++ b/include/linux/soc/adi/rcu.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef SOC_ADI_RCU_H
+#define SOC_ADI_RCU_H
+
+/* Register offsets */
+#define ADI_RCU_REG_CTL				0x00
+#define ADI_RCU_REG_STAT			0x04
+#define ADI_RCU_REG_CRCTL			0x08
+#define ADI_RCU_REG_CRSTAT			0x0c
+
+#ifdef CONFIG_ARCH_SC58X
+#define ADI_RCU_REG_SIDIS			0x10
+#define ADI_RCU_REG_SISTAT			0x14
+#define ADI_RCU_REG_SVECT_LCK			0x18
+#define ADI_RCU_REG_BCODE			0x1c
+#define ADI_RCU_REG_SVECT0			0x20
+#define ADI_RCU_REG_SVECT1			0x24
+#define ADI_RCU_REG_SVECT2			0x28
+#define ADI_RCU_REG_MSG				0x60
+#define ADI_RCU_REG_MSG_SET			0x64
+#define ADI_RCU_REG_MSG_CLR			0x68
+#else
+#define ADI_RCU_REG_SRRQSTAT			0x18
+#define ADI_RCU_REG_SIDIS			0x1c
+#define ADI_RCU_REG_SISTAT			0x20
+#define ADI_RCU_REG_BCODE			0x28
+#define ADI_RCU_REG_SVECT0			0x2c
+#define ADI_RCU_REG_SVECT1			0x30
+#define ADI_RCU_REG_SVECT2			0x34
+#define ADI_RCU_REG_MSG				0x6c
+#define ADI_RCU_REG_MSG_SET			0x70
+#define ADI_RCU_REG_MSG_CLR			0x74
+#endif
+
+
+/* Register bit definitions */
+#define ADI_RCU_CTL_SYSRST		BIT(0)
+
+/* Bit values for the RCU0_MSG register */
+#define RCU0_MSG_C0IDLE			0x00000100	/* Core 0 Idle */
+#define RCU0_MSG_C1IDLE			0x00000200	/* Core 1 Idle */
+#define RCU0_MSG_C2IDLE			0x00000400	/* Core 2 Idle */
+#define RCU0_MSG_CRR0			0x00001000	/* Core 0 reset request */
+#define RCU0_MSG_CRR1			0x00002000	/* Core 1 reset request */
+#define RCU0_MSG_CRR2			0x00004000	/* Core 2 reset request */
+#define RCU0_MSG_C1ACTIVATE		0x00080000	/* Core 1 Activated */
+#define RCU0_MSG_C2ACTIVATE		0x00100000	/* Core 2 Activated */
+
+struct adi_rcu;
+struct adi_sec;
+#endif
diff --git a/include/linux/soc/adi/sc59x.h b/include/linux/soc/adi/sc59x.h
new file mode 100644
index 0000000000000000000000000000000000000000..95655886478cda8cd6798a243781e39dc31baacf
--- /dev/null
+++ b/include/linux/soc/adi/sc59x.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef SOC_ADI_SC59X_H
+#define SOC_ADI_SC59X_H
+
+#define SC59x_SYSTEM_L2_VIRT_BASE	0xFF020000
+#define SC59x_SYSTEM_L2_SIZE		0x2C0000
+
+// General Purpose Timer Block Registers
+#define TIMER_GROUP			0x31018004
+
+// TIMER0
+#define TIMER0_CONFIG			0x31018060
+
+// CGU0
+#define REG_CGU0_CTL			0x3108D000	// CGU0 Control Register
+#define REG_CGU0_STAT			0x3108D008	// CGU0 Status Register
+#define REG_CGU0_DIV			0x3108D00C	// CGU0 Clocks Divisor Register
+
+// UART0
+#define UART0_REVID			0x31003000	// UART0 Revision ID Register
+
+// UART1
+#define UART1_REVID			0x31003400	// UART1 Revision ID Register
+
+// UART2
+#define UART2_REVID			0x31003800	// UART2 Revision ID Register
+
+// WDOG0
+#define REG_WDOG0_CTL			0x31008000	// WDOG0 Control Register
+
+// WDOG1
+#define REG_WDOG1_CTL			0x31008800	// WDOG1 Control Register
+
+// CRC0 MMR
+#define REG_CRC0_CTL			0x310A5000	// CRC0 Control Register
+#define REG_CRC0_DCNT			0x310A5004	// CRC0 Data Word Count Register
+#define REG_CRC0_FILLVAL		0x310A5018	// CRC0 Fill Value Register
+
+// DMA Channel Registers
+#define REG_DMA18_DSCPTR_NXT		0x310A7000	// DMA8 Pointer to Next Initial Descriptor
+#define REG_DMA8_CFG			0x310A7008	// DMA8 Configuration Register
+#define REG_DMA9_DSCPTR_NXT		0x310A7080	// DMA9 Pointer to Next Initial Descriptor
+#define REG_DMA9_CFG			0x310A7088	// DMA9 Configuration Register
+#define REG_DMA9_STAT			0x310A70B0	// DMA9 Status Register
+#define REG_DMA18_DSCPTR_NXT		0x310A7100	// DMA18 Pointer to Next Initial Descriptor
+#define REG_DMA18_CFG			0x310A7108	// DMA18 Configuration Register
+#define REG_DMA19_DSCPTR_NXT		0x310A7180	// DMA19 Pointer to Next Initial Descriptor
+#define REG_DMA19_CFG			0x310A7188	// DMA19 Configuration Register
+#define REG_DMA19_STAT			0x310A71B0	// DMA19 Status Register
+
+// L2CTL0
+#define L2CTL0_CTL			0x31080000	// L2CTL0 Control Register
+#define L2CTL0_STAT			0x31080010	// L2CTL0 Status Register
+#define L2CTL0_ERRADDR0			0x31080040	// L2CTL0 ECC Error Address 0 Register
+#define L2CTL0_ET0			0x31080080	// L2CTL0 Error Type 0 Register
+#define L2CTL0_EADDR0			0x31080084	// L2CTL0 Error Type 0 Address Register
+#define L2CTL0_ET1			0x31080088	// L2CTL0 Error Type 1 Register
+#define L2CTL0_EADDR1			0x3108008C	// L2CTL0 Error Type 1 Address Register
+
+// SEC Core Interface (SCI) Register Definitions
+#define SEC_COMMON_BASE			0x31089000
+#define SEC_SCI_BASE			0x31089440
+#define SEC_SSI_BASE			0x31089800
+
+#define SEC_SCI_OFF			0x00000040
+#define SEC_CCTL			0x00000000	// SEC Core Control Register n
+#define SEC_CSID			0x0000001C	// SEC Core IRQ Source ID Register n
+
+#define SEC_CCTL_EN			0x00000001	// SEC Core Control Register Enable bit
+
+// SEC Fault Management Interface (SFI) Register Definitions
+#define SEC_FCTL			0x00000010	// SEC Fault Control Register
+
+// SEC Global Register Definitions
+#define SEC_GCTL			0x00000000	// SEC Global Control Register
+#define SEC_RAISE			0x00000008	// SEC Global Raise Register
+#define SEC_END				0x0000000C	// SEC Global End Register
+
+// SEC_SCTL
+#define SEC_SCTL_CTG			0x0F000000	// Core Target Select
+
+// SEC Source Interface (SSI) Register Definitions
+#define SEC_SCTL0			0x00000000	// SEC Source Control Register n
+
+
+// SEC_SCTL
+#define SEC_SCTL_SRC_EN			0x00000004	// SEN: Enable
+#define SEC_SCTL_FAULT_EN		0x00000002	// FEN: Enable
+#define SEC_SCTL_INT_EN			0x00000001	// IEN: Enable
+
+
+// TRU0
+// 0x3108A000 + (0x4 * n)
+#define REG_TRU0_SSR160			0x3108A280	// TRU0 Slave Select Register
+#define REG_TRU0_SSR164			0x3108A290	// TRU0 Slave Select Register
+#define REG_TRU0_SSR168			0x3108A2A0	// TRU0 Slave Select Register
+#define REG_TRU0_MTR			0x3108A7E0	// TRU0 Master Trigger Register
+#define REG_TRU0_GCTL			0x3108A7F4	// TRU0 Global Control Register
+
+// Trigger Master Definitions
+#define TRGM_SOFT0			136	// Software-driven Trigger 3
+#define TRGM_SOFT1			137	// Software-driven Trigger 3
+#define TRGM_SOFT2			138	// Software-driven Trigger 4
+#define TRGM_SOFT3			139	// Software-driven Trigger 3
+#define TRGM_SOFT4			140	// Software-driven Trigger 4
+#define TRGM_SOFT5			141	// Software-driven Trigger 5
+
+// RCU0
+#define REG_RCU0_CTL			0x3108C000	// RCU0 Control Register
+#define REG_RCU0_STAT			0x3108C004	// RCU0 Status Register
+#define REG_RCU0_CRCTL			0x3108C008	// RCU0 Core Reset Control Register
+#define REG_RCU0_CRSTAT			0x3108C00C	// RCU0 Core Reset Status Register
+#define REG_RCU0_SIDIS			0x3108C01C	// RCU0 System Interface Disable Register
+#define REG_RCU0_SISTAT			0x3108C020	// RCU0 System Interface Status Register
+#define REG_RCU0_BCODE			0x3108C028	// RCU0 Boot Code Register
+#define REG_RCU0_MSG_SET		0x3108C070	// RCU0 Message Set Bits Register
+#define REG_RCU0_SVECT1			0x3108C030	// Software Vector Register 1
+#define REG_RCU0_SVECT2			0x3108C034	// Software Vector Register 2
+
+// SPU0
+#define REG_SPU0_CTL			0x3108B000	// SPU0 Control Register
+
+// LP0
+#define LP0_CTL				0x30FFE000	// LP0 Control Register
+
+// LP1
+#define LP1_CTL				0x30FFE100	// LP1 Control Register
+
+// PADS0
+#define REG_PADS0_BASE			0x31004600	// PADS Base Register
+#define REG_PADS0_PCFG0			0x31004604	// PADS0 Peripheral Configuration0 Register
+#define REG_PADS0_DAI0_IE		0x31004690	// PADS DAI0 IE Register
+#define REG_PADS0_DAI1_IE		0x31004694	// PADS DAI1 IE Register
+#define BITM_PADS_PCFG0_EMACRESET	0x00000004	// Reset Enable for RGMII
+#define ENUM_PADS_PCFG0_EMACPHY_MII	0x00000000	// EMACPHYISEL: MII Interface
+#define ENUM_PADS_PCFG0_EMACPHY_RGMII	0x00000008	// EMACPHYISEL: RGMII Interface
+#define ENUM_PADS_PCFG0_EMACPHY_RMII	0x00000010	// EMACPHYISEL: RMII Interface
+#define ENUM_PADS_PCFG0_EMAC0_RMII_CLK	0x00000000	// EMAC0: EMAC0_RMII CLK
+#define ENUM_PADS_PCFG0_EMAC0_SCLK1	0x00000001	// EMAC0: SCLK
+#define ENUM_PADS_PCFG0_EMAC0_EXT_CLK	0x00000002	// EMAC0: External Clock
+#define ENUM_PADS_PCFG0_EMAC0_SCLK3	0x00000003	// EMAC0: SCLK
+
+#endif
diff --git a/include/linux/soc/adi/system_config.h b/include/linux/soc/adi/system_config.h
new file mode 100644
index 0000000000000000000000000000000000000000..788d39f0c0d36f233a7b48ef4e2f0a3f4750f711
--- /dev/null
+++ b/include/linux/soc/adi/system_config.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Implementation of adi_system_config, potential replacement for syscon that
+ * generalizes it to support arbitrary regmap registration and requires the
+ * driver to be initialized first
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#ifndef SOC_ADI_SYSTEM_CONFIG_H
+#define SOC_ADI_SYSTEM_CONFIG_H
+
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct adi_system_register {
+	uint32_t id;
+	uint32_t offset;
+	uint32_t mask;
+	uint8_t shift;
+	bool is_bits;
+};
+
+struct adi_system_config {
+	/* User configured */
+	struct adi_system_register *registers;
+	unsigned int max_register;
+	size_t len;
+
+	/* Internal data populated during usage */
+	struct regmap_config config;
+	struct regmap *mmio_regmap;
+	struct device_node *np;
+	struct list_head list;
+	struct regmap *system_regmap;
+};
+
+/*
+ * All possible system register IDs across all platforms supported by this
+ * driver.
+ */
+enum adi_system_reg_id {
+	ADI_SYSTEM_REG_EMAC0_PTPCLK0 = 0,
+	ADI_SYSTEM_REG_EMAC0_EMACRESET,
+	ADI_SYSTEM_REG_EMAC0_PHYISEL,
+	ADI_SYSTEM_REG_CNT0UDSEL,
+	ADI_SYSTEM_REG_CNT0DGSEL,
+	ADI_SYSTEM_REG_TWI0VSEL,
+	ADI_SYSTEM_REG_TWI1VSEL,
+	ADI_SYSTEM_REG_TWI2VSEL,
+	ADI_SYSTEM_REG_PUMSIDLC,
+	ADI_SYSTEM_REG_PUMSIHL,
+	ADI_SYSTEM_REG_PUTMS,
+	ADI_SYSTEM_REG_EMAC0_AUXIE,
+	ADI_SYSTEM_REG_FAULT_DIS,
+	ADI_SYSTEM_REG_EMAC0_ENDIANNESS,
+	ADI_SYSTEM_REG_EMAC1_ENDIANNESS,
+	ADI_SYSTEM_REG_MSHC_CCLK_DIV_EN,
+	ADI_SYSTEM_REG_DAI0_IE,
+	ADI_SYSTEM_REG_DAI1_IE,
+	__ADI_SYSTEM_REG_COUNT
+};
+
+#endif

-- 
2.25.1



