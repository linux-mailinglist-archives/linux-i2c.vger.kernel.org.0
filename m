Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B7B4392C0
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 11:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhJYJok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 05:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37660 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232809AbhJYJoY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 05:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635154922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6t9ryFWYGCHXDxG6H4N6+O/cVwJXsV++bItqjCdOUsE=;
        b=h/yj18k/mbCkMni0hIwSmz3MJYCyyWAoH0OLU6Gfb2eK14jSeOncMvZflMIQddf6bdybSE
        C2hxSRwBbHzRZV+6IZick8UztZQhE7oCWq5Ckl61N97uHANC8atmoPuvsOMHZqHUIV/f/g
        w2RwEQ3WQs7rD4bliY5QzbBdGzKfNqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-9AE0XPNYPHul79sAA2pvvA-1; Mon, 25 Oct 2021 05:41:58 -0400
X-MC-Unique: 9AE0XPNYPHul79sAA2pvvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CE9110A8E02;
        Mon, 25 Oct 2021 09:41:56 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.129])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2063760CA1;
        Mon, 25 Oct 2021 09:41:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 05/11] clk: Introduce clk-tps68470 driver
Date:   Mon, 25 Oct 2021 11:41:13 +0200
Message-Id: <20211025094119.82967-6-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-1-hdegoede@redhat.com>
References: <20211025094119.82967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
the kernel the Regulators and Clocks are controlled by an OpRegion
driver designed to work with power control methods defined in ACPI, but
some platforms lack those methods, meaning drivers need to be able to
consume the resources of these chips through the usual frameworks.

This commit adds a driver for the clocks provided by the tps68470,
and is designed to bind to the platform_device registered by the
intel_skl_int3472 module.

This is based on this out of tree driver written by Intel:
https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/clk/clk-tps68470.c
with various cleanups added.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Kconfig: select REGMAP_I2C, add || COMPILE_TEST, fix help text
- tps68470_clk_prepare(): Wait for the PLL to lock before returning
- tps68470_clk_unprepare(): Remove unnecesary clearing of divider regs
- tps68470_clk_probe(): Use devm_clk_hw_register()
- Misc. small cleanups

Changes in v2:
- Update the comment on why a subsys_initcall is used to register the drv
- Fix trailing whitespice on line 100
---
 drivers/clk/Kconfig          |   8 ++
 drivers/clk/Makefile         |   1 +
 drivers/clk/clk-tps68470.c   | 253 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps68470.h |  11 ++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/clk/clk-tps68470.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc97396a..4e9098d79249 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -169,6 +169,14 @@ config COMMON_CLK_CDCE706
 	help
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
+config COMMON_CLK_TPS68470
+	tristate "Clock Driver for TI TPS68470 PMIC"
+	depends on I2C
+	depends on INTEL_SKL_INT3472 || COMPILE_TEST
+	select REGMAP_I2C
+	help
+	  This driver supports the clocks provided by the TPS68470 PMIC.
+
 config COMMON_CLK_CDCE925
 	tristate "Clock driver for TI CDCE913/925/937/949 devices"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e42312121e51..6b6a88ae1425 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o
+obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
diff --git a/drivers/clk/clk-tps68470.c b/drivers/clk/clk-tps68470.c
new file mode 100644
index 000000000000..b3edd40078cb
--- /dev/null
+++ b/drivers/clk/clk-tps68470.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clock driver for TPS68470 PMIC
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ * Copyright (C) 2018 Intel Corporation
+ *
+ * Authors:
+ *	Hans de Goede <hdegoede@redhat.com>
+ *	Zaikuo Wang <zaikuo.wang@intel.com>
+ *	Tianshu Qiu <tian.shu.qiu@intel.com>
+ *	Jian Xu Zheng <jian.xu.zheng@intel.com>
+ *	Yuning Pu <yuning.pu@intel.com>
+ *	Antti Laakso <antti.laakso@intel.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps68470.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/tps68470.h>
+#include <linux/regmap.h>
+
+#define TPS68470_CLK_NAME "tps68470-clk"
+
+#define to_tps68470_clkdata(clkd) \
+	container_of(clkd, struct tps68470_clkdata, clkout_hw)
+
+struct tps68470_clkout_freqs {
+	unsigned long freq;
+	unsigned int xtaldiv;
+	unsigned int plldiv;
+	unsigned int postdiv;
+	unsigned int buckdiv;
+	unsigned int boostdiv;
+} clk_freqs[] = {
+/*
+ *  The PLL is used to multiply the crystal oscillator
+ *  frequency range of 3 MHz to 27 MHz by a programmable
+ *  factor of F = (M/N)*(1/P) such that the output
+ *  available at the HCLK_A or HCLK_B pins are in the range
+ *  of 4 MHz to 64 MHz in increments of 0.1 MHz
+ *
+ * hclk_# = osc_in * (((plldiv*2)+320) / (xtaldiv+30)) * (1 / 2^postdiv)
+ *
+ * PLL_REF_CLK should be as close as possible to 100kHz
+ * PLL_REF_CLK = input clk / XTALDIV[7:0] + 30)
+ *
+ * PLL_VCO_CLK = (PLL_REF_CLK * (plldiv*2 + 320))
+ *
+ * BOOST should be as close as possible to 2Mhz
+ * BOOST = PLL_VCO_CLK / (BOOSTDIV[4:0] + 16) *
+ *
+ * BUCK should be as close as possible to 5.2Mhz
+ * BUCK = PLL_VCO_CLK / (BUCKDIV[3:0] + 5)
+ *
+ * osc_in   xtaldiv  plldiv   postdiv   hclk_#
+ * 20Mhz    170      32       1         19.2Mhz
+ * 20Mhz    170      40       1         20Mhz
+ * 20Mhz    170      80       1         24Mhz
+ *
+ */
+	{ 19200000, 170, 32, 1, 2, 3 },
+	{ 20000000, 170, 40, 1, 3, 4 },
+	{ 24000000, 170, 80, 1, 4, 8 },
+};
+
+struct tps68470_clkdata {
+	struct clk_hw clkout_hw;
+	struct regmap *regmap;
+	unsigned int clk_cfg_idx;
+};
+
+static int tps68470_clk_is_prepared(struct clk_hw *hw)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+	int val;
+
+	if (regmap_read(clkdata->regmap, TPS68470_REG_PLLCTL, &val))
+		return 0;
+
+	return val & TPS68470_PLL_EN_MASK;
+}
+
+static int tps68470_clk_prepare(struct clk_hw *hw)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+	unsigned int idx = clkdata->clk_cfg_idx;
+
+	regmap_write(clkdata->regmap, TPS68470_REG_BOOSTDIV, clk_freqs[idx].boostdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_BUCKDIV, clk_freqs[idx].buckdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLSWR, TPS68470_PLLSWR_DEFAULT);
+	regmap_write(clkdata->regmap, TPS68470_REG_XTALDIV, clk_freqs[idx].xtaldiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLDIV, clk_freqs[idx].plldiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV, clk_freqs[idx].postdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_POSTDIV2, clk_freqs[idx].postdiv);
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG2, TPS68470_CLKCFG2_DRV_STR_2MA);
+
+	regmap_write(clkdata->regmap, TPS68470_REG_PLLCTL,
+		     TPS68470_OSC_EXT_CAP_DEFAULT << TPS68470_OSC_EXT_CAP_SHIFT |
+		     TPS68470_CLK_SRC_XTAL << TPS68470_CLK_SRC_SHIFT);
+
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1,
+			   (TPS68470_PLL_OUTPUT_ENABLE << TPS68470_OUTPUT_A_SHIFT) |
+			   (TPS68470_PLL_OUTPUT_ENABLE << TPS68470_OUTPUT_B_SHIFT));
+
+	regmap_update_bits(clkdata->regmap, TPS68470_REG_PLLCTL,
+			   TPS68470_PLL_EN_MASK, TPS68470_PLL_EN_MASK);
+
+	/*
+	 * The PLLCTL reg lock bit is set by the PMIC after approx. 4ms and
+	 * does not indicate a true lock, so just wait 4 ms.
+	 */
+	usleep_range(4000, 5000);
+
+	return 0;
+}
+
+static void tps68470_clk_unprepare(struct clk_hw *hw)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+
+	/* disable clock first */
+	regmap_update_bits(clkdata->regmap, TPS68470_REG_PLLCTL, TPS68470_PLL_EN_MASK, 0);
+
+	/* and then tri-state the clock outputs */
+	regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1, 0);
+}
+
+static unsigned long tps68470_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+
+	return clk_freqs[clkdata->clk_cfg_idx].freq;
+}
+
+static unsigned int tps68470_clk_cfg_lookup(unsigned long rate)
+{
+	long diff, best_diff = LONG_MAX;
+	unsigned int i, best_idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(clk_freqs); i++) {
+		diff = clk_freqs[i].freq - rate;
+		if (diff == 0)
+			return i;
+
+		diff = abs(diff);
+		if (diff < best_diff) {
+			best_diff = diff;
+			best_idx = i;
+		}
+	}
+
+	return best_idx;
+}
+
+static long tps68470_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	unsigned int idx = tps68470_clk_cfg_lookup(rate);
+
+	return clk_freqs[idx].freq;
+}
+
+static int tps68470_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct tps68470_clkdata *clkdata = to_tps68470_clkdata(hw);
+	unsigned int idx = tps68470_clk_cfg_lookup(rate);
+
+	if (rate != clk_freqs[idx].freq)
+		return -EINVAL;
+
+	clkdata->clk_cfg_idx = idx;
+
+	return 0;
+}
+
+static const struct clk_ops tps68470_clk_ops = {
+	.is_prepared = tps68470_clk_is_prepared,
+	.prepare = tps68470_clk_prepare,
+	.unprepare = tps68470_clk_unprepare,
+	.recalc_rate = tps68470_clk_recalc_rate,
+	.round_rate = tps68470_clk_round_rate,
+	.set_rate = tps68470_clk_set_rate,
+};
+
+static const struct clk_init_data tps68470_clk_initdata = {
+	.name = TPS68470_CLK_NAME,
+	.ops = &tps68470_clk_ops,
+};
+
+static int tps68470_clk_probe(struct platform_device *pdev)
+{
+	struct tps68470_clk_platform_data *pdata = pdev->dev.platform_data;
+	struct tps68470_clkdata *tps68470_clkdata;
+	int ret;
+
+	tps68470_clkdata = devm_kzalloc(&pdev->dev, sizeof(*tps68470_clkdata),
+					GFP_KERNEL);
+	if (!tps68470_clkdata)
+		return -ENOMEM;
+
+	tps68470_clkdata->regmap = dev_get_drvdata(pdev->dev.parent);
+	tps68470_clkdata->clkout_hw.init = &tps68470_clk_initdata;
+	ret = devm_clk_hw_register(&pdev->dev, &tps68470_clkdata->clkout_hw);
+	if (ret)
+		return ret;
+
+	ret = devm_clk_hw_register_clkdev(&pdev->dev, &tps68470_clkdata->clkout_hw,
+					  TPS68470_CLK_NAME, NULL);
+	if (ret)
+		return ret;
+
+	if (pdata) {
+		ret = devm_clk_hw_register_clkdev(&pdev->dev,
+						  &tps68470_clkdata->clkout_hw,
+						  pdata->consumer_con_id,
+						  pdata->consumer_dev_name);
+	}
+
+	return ret;
+}
+
+static struct platform_driver tps68470_clk_driver = {
+	.driver = {
+		.name = TPS68470_CLK_NAME,
+	},
+	.probe = tps68470_clk_probe,
+};
+
+/*
+ * The ACPI tps68470 probe-ordering depends on the clk/gpio/regulator drivers
+ * registering before the drivers for the camera-sensors which use them bind.
+ * subsys_initcall() ensures this when the drivers are builtin.
+ */
+static int __init tps68470_clk_init(void)
+{
+	return platform_driver_register(&tps68470_clk_driver);
+}
+subsys_initcall(tps68470_clk_init);
+
+static void __exit tps68470_clk_exit(void)
+{
+	platform_driver_unregister(&tps68470_clk_driver);
+}
+module_exit(tps68470_clk_exit);
+
+MODULE_ALIAS("platform:tps68470-clk");
+MODULE_DESCRIPTION("clock driver for TPS68470 pmic");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index ffe81127d91c..7807fa329db0 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -75,6 +75,17 @@
 #define TPS68470_CLKCFG1_MODE_A_MASK	GENMASK(1, 0)
 #define TPS68470_CLKCFG1_MODE_B_MASK	GENMASK(3, 2)
 
+#define TPS68470_CLKCFG2_DRV_STR_2MA	0x05
+#define TPS68470_PLL_OUTPUT_ENABLE	0x02
+#define TPS68470_CLK_SRC_XTAL		BIT(0)
+#define TPS68470_PLLSWR_DEFAULT		GENMASK(1, 0)
+#define TPS68470_OSC_EXT_CAP_DEFAULT	0x05
+
+#define TPS68470_OUTPUT_A_SHIFT		0x00
+#define TPS68470_OUTPUT_B_SHIFT		0x02
+#define TPS68470_CLK_SRC_SHIFT		GENMASK(2, 0)
+#define TPS68470_OSC_EXT_CAP_SHIFT	BIT(2)
+
 #define TPS68470_GPIO_CTL_REG_A(x)	(TPS68470_REG_GPCTL0A + (x) * 2)
 #define TPS68470_GPIO_CTL_REG_B(x)	(TPS68470_REG_GPCTL0B + (x) * 2)
 #define TPS68470_GPIO_MODE_MASK		GENMASK(1, 0)
-- 
2.31.1

