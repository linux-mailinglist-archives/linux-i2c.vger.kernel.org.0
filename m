Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67A5460207
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Nov 2021 23:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356452AbhK0Wlb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 17:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356475AbhK0Wja (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Nov 2021 17:39:30 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4175CC0613ED
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:01 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j3so27307195wrp.1
        for <linux-i2c@vger.kernel.org>; Sat, 27 Nov 2021 14:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C2fYlu8o+hwcxca3MmfB8F34BJEFc2MVtDi8Tro0yVw=;
        b=g/kFSwDIdL1FGgt1BJxzECWQhS0/gPGYvTY6e8feqhelTX/YQoFIHwFaYiLU0UVNQN
         ZjPNdIpjKptq9BX3NIrhh+GggTZujZOcfu6xOveqin1mzGw4+fOUuVtwBsd/pnMSMXp8
         k9avuikBejMseB+a8Wx1CUuxq5FGgvLH0OcZZUJPYSKgY7Ko8WeMxbP0/qUi09tN12NS
         NH01kdZBq48WRdQXd/GLIaKeMfa3UBCz193RF1u0jgCgtLBqAO+YMNIB5wY/wayMfTM1
         vn+MdY+dJlZO9INbS48E1bhSz7y1AVYDlAPObUcrFZig1nKsRc2NWA2CQjyBLLnsOKgf
         feFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2fYlu8o+hwcxca3MmfB8F34BJEFc2MVtDi8Tro0yVw=;
        b=CgabFyplbyEn/rjl5AYRetyrrrlPR6s3EossU0ZI25I5vPVE6Ute5tajsePX0voR6F
         e9h+bBK0fqez8+1HIDB1urMMDhIxNGgoEmR/kUbIOMh6yZGKCM2LDYoxKSzlUi9x/B4W
         oKcA0D5nhJJeoijA6J7gyakmIEknUaIgsKTDsRFV0IFtxCYNVt7Z6svToOPRFLLlNbib
         U2QbXtd8RD5a5fG3/9F21ANJ2g4qYyuh9Z0lzjCybf/y8wfqCTWx/2v2KBDeNnW+Q/5h
         FTVEvADQ1GSD6PUkf+3VCK8PhMYddIftCZ8HK4K1x5yExyjzocZYv7mS0k+OGqp4vqOA
         M0bw==
X-Gm-Message-State: AOAM530YLplme8D0Ws5JP2FyIsshZrGTP9aHojteSJlFUjQDZAj9RTY2
        UZJeOBoWeMxZMxlHeIZ2JSiSiA==
X-Google-Smtp-Source: ABdhPJx7eV8hM34GzyVKeh1ASY8Ddgr8Crg8v9waCtcv3gEYGBOYuXiNVN1OMn2OWc/XXLNQSJc8Jg==
X-Received: by 2002:adf:f907:: with SMTP id b7mr23385258wrr.5.1638052379807;
        Sat, 27 Nov 2021 14:32:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h2sm9169578wrz.23.2021.11.27.14.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 14:32:59 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 3/8] soc: samsung: Add USIv2 driver
Date:   Sun, 28 Nov 2021 00:32:48 +0200
Message-Id: <20211127223253.19098-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

USIv2 IP-core is found on modern ARM64 Exynos SoCs (like Exynos850) and
provides selectable serial protocol (one of: UART, SPI, I2C). USIv2
registers usually reside in the same register map as a particular
underlying protocol it implements, but have some particular offset. E.g.
on Exynos850 the USI_UART has 0x13820000 base address, where UART
registers have 0x00..0x40 offsets, and USI registers have 0xc0..0xdc
offsets. Desired protocol can be chosen via SW_CONF register from System
Register block of the same domain as USI.

Before starting to use a particular protocol, USIv2 must be configured
properly:
  1. Select protocol to be used via System Register
  2. Clear "reset" flag in USI_CON
  3. Configure HWACG behavior (e.g. for UART Rx the HWACG must be
     disabled, so that the IP clock is not gated automatically); this is
     done using USI_OPTION register
  4. Keep both USI clocks (PCLK and IPCLK) running during USI registers
     modification

This driver implements above behavior. Of course, USIv2 driver should be
probed before UART/I2C/SPI drivers. It can be achived by embedding
UART/I2C/SPI nodes inside of USI node (in Device Tree); driver then
walks underlying nodes and instantiates those. Driver also handles USI
configuration on PM resume, as register contents can be lost during CPU
suspend.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/Kconfig         |  14 ++
 drivers/soc/samsung/Makefile        |   2 +
 drivers/soc/samsung/exynos-usi-v2.c | 242 ++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/soc/samsung/exynos-usi-v2.c

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index e2cedef1e8d1..b168973c887f 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -23,6 +23,20 @@ config EXYNOS_CHIPID
 	  Support for Samsung Exynos SoC ChipID and Adaptive Supply Voltage.
 	  This driver can also be built as module (exynos_chipid).
 
+config EXYNOS_USI_V2
+	tristate "Exynos USIv2 (Universal Serial Interface) driver"
+	default ARCH_EXYNOS && ARM64
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Enable support for USIv2 block. USI (Universal Serial Interface) is an
+	  IP-core found in modern Samsung Exynos SoCs, like Exynos850 and
+	  ExynosAutoV0. USI block can be configured to provide one of the
+	  following serial protocols: UART, SPI or High Speed I2C.
+
+	  This driver allows one to configure USI for desired protocol, which
+	  is usually done in USI node in Device Tree.
+
 config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
index 2ae4bea804cf..0b746b2fd78f 100644
--- a/drivers/soc/samsung/Makefile
+++ b/drivers/soc/samsung/Makefile
@@ -4,6 +4,8 @@ obj-$(CONFIG_EXYNOS_ASV_ARM)	+= exynos5422-asv.o
 obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos_chipid.o
 exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
 
+obj-$(CONFIG_EXYNOS_USI_V2)	+= exynos-usi-v2.o
+
 obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
 
 obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
diff --git a/drivers/soc/samsung/exynos-usi-v2.c b/drivers/soc/samsung/exynos-usi-v2.c
new file mode 100644
index 000000000000..5a315890e4ec
--- /dev/null
+++ b/drivers/soc/samsung/exynos-usi-v2.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Linaro Ltd.
+ * Author: Sam Protsenko <semen.protsenko@linaro.org>
+ *
+ * Samsung Exynos USI v2 driver (Universal Serial Interface).
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include <dt-bindings/soc/samsung,exynos-usi-v2.h>
+
+/* System Register: SW_CONF register bits */
+#define SW_CONF_UART		BIT(0)
+#define SW_CONF_SPI		BIT(1)
+#define SW_CONF_I2C		BIT(2)
+#define SW_CONF_MASK		(SW_CONF_UART | SW_CONF_SPI | SW_CONF_I2C)
+
+/* USI register offsets */
+#define USI_CON			0x04
+#define USI_OPTION		0x08
+
+/* USI register bits */
+#define USI_CON_RESET		BIT(0)
+#define USI_OPTION_CLKREQ_ON	BIT(1)
+#define USI_OPTION_CLKSTOP_ON	BIT(2)
+
+struct usi_v2_mode {
+	const char *name;		/* mode name */
+	unsigned int val;		/* mode register value */
+};
+
+struct usi_v2 {
+	struct device *dev;
+	void __iomem *regs;		/* USI register map */
+	struct clk *pclk;		/* USI bus clock */
+	struct clk *ipclk;		/* USI operating clock */
+
+	size_t mode;			/* current USI SW_CONF mode index */
+	bool clkreq_on;			/* always provide clock to IP */
+
+	/* System Register */
+	struct regmap *sysreg;		/* System Register map */
+	unsigned int sw_conf;		/* SW_CONF register offset in sysreg */
+};
+
+static const struct usi_v2_mode usi_v2_modes[] = {
+	[USI_V2_UART] =	{ .name = "uart", .val = SW_CONF_UART },
+	[USI_V2_SPI] =	{ .name = "spi",  .val = SW_CONF_SPI },
+	[USI_V2_I2C] =	{ .name = "i2c",  .val = SW_CONF_I2C },
+};
+
+/**
+ * usi_v2_set_sw_conf - Set USI block configuration mode
+ * @usi: USI driver object
+ * @mode: Mode index
+ *
+ * Select underlying serial protocol (UART/SPI/I2C) in USI IP-core.
+ *
+ * Return: 0 on success, or negative error code on failure.
+ */
+static int usi_v2_set_sw_conf(struct usi_v2 *usi, size_t mode)
+{
+	unsigned int val;
+	int ret;
+
+	if (mode >= ARRAY_SIZE(usi_v2_modes))
+		return -EINVAL;
+
+	val = usi_v2_modes[mode].val;
+	ret = regmap_update_bits(usi->sysreg, usi->sw_conf, SW_CONF_MASK, val);
+	if (ret)
+		return ret;
+
+	usi->mode = mode;
+	dev_dbg(usi->dev, "USIv2 protocol: %s\n", usi_v2_modes[usi->mode].name);
+
+	return 0;
+}
+
+/**
+ * usi_v2_enable - Initialize USI block
+ * @usi: USI driver object
+ *
+ * USI IP-core start state is "reset" (on startup and after CPU resume). This
+ * routine enables USI block by clearing the reset flag. It also configures
+ * HWACG behavior (needed e.g. for UART Rx). It should be performed before
+ * underlying protocol becomes functional.
+ *
+ * Both 'pclk' and 'ipclk' clocks should be enabled when running this function.
+ */
+static void usi_v2_enable(const struct usi_v2 *usi)
+{
+	u32 val;
+
+	/* Enable USI block */
+	val = readl(usi->regs + USI_CON);
+	val &= ~USI_CON_RESET;
+	writel(val, usi->regs + USI_CON);
+	udelay(1);
+
+	/* Continuously provide the clock to USI IP w/o gating */
+	if (usi->clkreq_on) {
+		val = readl(usi->regs + USI_OPTION);
+		val &= ~USI_OPTION_CLKSTOP_ON;
+		val |= USI_OPTION_CLKREQ_ON;
+		writel(val, usi->regs + USI_OPTION);
+	}
+}
+
+static int usi_v2_configure(struct usi_v2 *usi)
+{
+	int ret;
+
+	ret = clk_prepare_enable(usi->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(usi->ipclk);
+	if (ret)
+		goto err_pclk;
+
+	ret = usi_v2_set_sw_conf(usi, usi->mode);
+	if (ret)
+		goto err_ipclk;
+
+	usi_v2_enable(usi);
+
+err_ipclk:
+	clk_disable_unprepare(usi->ipclk);
+err_pclk:
+	clk_disable_unprepare(usi->pclk);
+	return ret;
+}
+
+static int usi_v2_parse_dt(struct device_node *np, struct usi_v2 *usi)
+{
+	int ret;
+	u32 mode;
+
+	ret = of_property_read_u32(np, "samsung,mode", &mode);
+	if (ret)
+		return ret;
+	usi->mode = mode;
+
+	usi->clkreq_on = of_property_read_bool(np, "samsung,clkreq-on");
+
+	usi->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
+	if (IS_ERR(usi->sysreg))
+		return PTR_ERR(usi->sysreg);
+
+	return of_property_read_u32_index(np, "samsung,sysreg", 1,
+					  &usi->sw_conf);
+}
+
+static int usi_v2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct usi_v2 *usi;
+	int ret;
+
+	usi = devm_kzalloc(dev, sizeof(*usi), GFP_KERNEL);
+	if (!usi)
+		return -ENOMEM;
+
+	usi->dev = dev;
+	platform_set_drvdata(pdev, usi);
+
+	usi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(usi->regs))
+		return PTR_ERR(usi->regs);
+
+	ret = usi_v2_parse_dt(np, usi);
+	if (ret)
+		return ret;
+
+	usi->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(usi->pclk))
+		return PTR_ERR(usi->pclk);
+
+	usi->ipclk = devm_clk_get(dev, "ipclk");
+	if (IS_ERR(usi->ipclk))
+		return PTR_ERR(usi->ipclk);
+
+	ret = usi_v2_configure(usi);
+	if (ret)
+		return ret;
+
+	/* Make it possible to embed protocol nodes into USI np */
+	return of_platform_populate(np, NULL, NULL, dev);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int usi_v2_resume_noirq(struct device *dev)
+{
+	struct usi_v2 *usi = dev_get_drvdata(dev);
+
+	return usi_v2_configure(usi);
+}
+#endif
+
+static const struct dev_pm_ops usi_v2_pm = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, usi_v2_resume_noirq)
+};
+
+static const struct of_device_id usi_v2_dt_match[] = {
+	{ .compatible = "samsung,exynos-usi-v2", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, usi_v2_dt_match);
+
+static struct platform_driver usi_v2_driver = {
+	.driver = {
+		.name		= "exynos-usi-v2",
+		.pm		= &usi_v2_pm,
+		.of_match_table	= usi_v2_dt_match,
+	},
+	.probe = usi_v2_probe,
+};
+
+static int __init usi_v2_init(void)
+{
+	return platform_driver_register(&usi_v2_driver);
+}
+arch_initcall(usi_v2_init);
+
+static void __exit usi_v2_exit(void)
+{
+	platform_driver_unregister(&usi_v2_driver);
+}
+module_exit(usi_v2_exit);
+
+MODULE_DESCRIPTION("Samsung USI v2 driver");
+MODULE_AUTHOR("Sam Protsenko <semen.protsenko@linaro.org>");
+MODULE_LICENSE("GPL");
-- 
2.30.2

