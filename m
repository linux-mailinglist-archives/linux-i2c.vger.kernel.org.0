Return-Path: <linux-i2c+bounces-6639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49955977074
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6E61C23391
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1FC1C1AA9;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ziscm7wa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903F51BFE14;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=STfGnDWGDHtoSLymLHf9N1RPr419SQxugg1HPXKA5LGRw3Cht30Ht2gsBbDufRlH12GjHX4iqqOqALVDycGwnTpW0d2t11F3CEQ7CyOeeGCny4xgOz04rFKPRRo/aCtapc0UEgiYMVLSK6fNyK9Ky+GD2xvWZaqutDyICUx6EIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=ShQ/LProzO9Hm4NwCG67p9rw+RFa0AA/In63K50o89w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SeBgxUOnmgFy5Hrdx9GW6PRa3EgV4xARw3n7pto4ATnBdOD9ZIsYIRoRdXMNgS3wHEri8Y2GiCIpmpgOEA6qVXQOxUZkVgj1ZI3/iRwpzPOxzl55WcC/Jq9BVip+zDhNKxmwHJbSJd87Py5hqbjcCZngmwGbXaQ8tLUHcXGsEPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ziscm7wa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CC40C4CEE8;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165215;
	bh=ShQ/LProzO9Hm4NwCG67p9rw+RFa0AA/In63K50o89w=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=Ziscm7wa/lpA8bnPlLQotGEH/cq8TOCA3FVLWzCkW0fwtKsoK3rQVm0l30CqKsO0C
	 lgxiyPlOuPgZl6cKYH311I5VsJVft+fYT5bUofCvWdjGOVxmt+bI1ekpyzLzB16dIy
	 +09gOls6ra1/e+zX0t3tbA6VSFAW8g9iypUwJVQF69NqqX2DL6hXX0RcnQT9VFdAAM
	 5juciC4ejeJv2rZOCwHOTss84ATa3n9KF4VsEdFKVokwvXkYeEH8Alj7rDxAqY/kL0
	 AG3bXL+0sTuFzFlVChAC72N2eH/IbbGMabEAKtKxEwct7BpQzju8XXxXYUsNDB5RnV
	 NBv5PSAvuSYEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40536EEE240;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:24:52 +0100
Subject: [PATCH 07/21] clock: Add driver for ADI ADSP-SC5xx clock
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-7-458fa57c8ccf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=17101;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=LJfzHgjxAEXxENnyA4nkGwc9Qp/oj6ODq57mjKreJaQ=;
 b=jXDXV3Qh6baJWv1oojfxLBfGcsFXKJpvJDrmGyIwjeJt9yLfrxH8oWaueZVvEgLKHFHP0klV/
 FC74DghtWOCAmJIaIOe7dwfeokRV8Yn91cVHdxeS86xurBZEHUhgIPN
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC5xx clock driver

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/clk/Kconfig             |   9 ++
 drivers/clk/Makefile            |   1 +
 drivers/clk/adi/Makefile        |   4 +
 drivers/clk/adi/clk-adi-sc598.c | 329 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 343 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 983ef4f36d8c4387556d6b5d32f01dd4afa815a3..a3a076294c285d820f1c6922b872ff73174192c0 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -42,6 +42,15 @@ config COMMON_CLK_WM831X
 
 source "drivers/clk/versatile/Kconfig"
 
+config COMMON_CLK_ADI_SC598
+	bool "Clock driver for ADI SC598 SoCs"
+	depends on OF && ARCH_SC59X_64
+	help
+	  This driver supports the system clocks on Analog Devices SC598-series
+	  SoCs. It includes CGU and CDU clocks and supports gating unused clocks.
+	  Modifying PLL configuration is not supported; that must be done prior
+	  to booting the kernel. Clock dividers after the PLLs may be configured.
+
 config CLK_HSDK
 	bool "PLL Driver for HSDK platform"
 	depends on ARC_SOC_HSDK || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f793a16cad40bfff0d06989179e5401d7f3e69cc..9f48f81b9285ab19027cc287e62547a3c1332517 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
+obj-y					+= adi/
 obj-y					+= analogbits/
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
 obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
diff --git a/drivers/clk/adi/Makefile b/drivers/clk/adi/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..2a83dff54adaddd81f3f33bd962fe6302e14a8a7
--- /dev/null
+++ b/drivers/clk/adi/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+#SC598
+obj-$(CONFIG_COMMON_CLK_ADI_SC598)  += clk-adi-pll.o
+obj-$(CONFIG_COMMON_CLK_ADI_SC598)  += clk-adi-sc598.o
diff --git a/drivers/clk/adi/clk-adi-sc598.c b/drivers/clk/adi/clk-adi-sc598.c
new file mode 100644
index 0000000000000000000000000000000000000000..9d0b01b813a0aa44bbeb35bb4deaa3b38ca90834
--- /dev/null
+++ b/drivers/clk/adi/clk-adi-sc598.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Clock support for ADI processor
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#include <dt-bindings/clock/adi-sc5xx-clock.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+
+#include "clk.h"
+
+struct clk_core {
+	const char		*name;
+	const struct clk_ops	*ops;
+	struct clk_hw		*hw;
+	struct module		*owner;
+	struct device		*dev;
+	struct hlist_node	rpm_node;
+	struct device_node	*of_node;
+	struct clk_core		*parent;
+	struct clk_parent_map	*parents;
+	u8			num_parents;
+	u8			new_parent_index;
+	unsigned long		rate;
+	unsigned long		req_rate;
+	unsigned long		new_rate;
+	struct clk_core		*new_parent;
+	struct clk_core		*new_child;
+	unsigned long		flags;
+	bool			orphan;
+	bool			rpm_enabled;
+	unsigned int		enable_count;
+	unsigned int		prepare_count;
+	unsigned int		protect_count;
+	unsigned long		min_rate;
+	unsigned long		max_rate;
+	unsigned long		accuracy;
+	int			phase;
+	struct clk_duty		duty;
+	struct hlist_head	children;
+	struct hlist_node	child_node;
+	struct hlist_head	clks;
+	unsigned int		notifier_count;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry		*dentry;
+	struct hlist_node	debug_node;
+#endif
+	struct kref		ref;
+};
+
+struct clk {
+	struct clk_core	*core;
+	struct device *dev;
+	const char *dev_id;
+	const char *con_id;
+	unsigned long min_rate;
+	unsigned long max_rate;
+	unsigned int exclusive_count;
+	struct hlist_node clks_node;
+};
+
+static DEFINE_SPINLOCK(cdu_lock);
+
+static struct clk *clks[ADSP_SC598_CLK_END];
+static struct clk_onecell_data clk_data;
+
+static const char * const cgu1_in_sels[] = {"sys_clkin0", "sys_clkin1"};
+static const char * const cgu0_s1sels[] = {"cgu0_s1seldiv", "cgu0_s1selexdiv"};
+static const char * const cgu1_s0sels[] = {"cgu1_s0seldiv", "cgu1_s0selexdiv"};
+static const char * const cgu1_s1sels[] = {"cgu1_s1seldiv", "cgu1_s1selexdiv"};
+static const char * const sharc0_sels[] = {"cclk0_0", "dummy", "dummy", "dummy"};
+static const char * const sharc1_sels[] = {"cclk0_0", "dummy", "dummy", "dummy"};
+static const char * const arm_sels[] = {"dummy", "dummy", "cclk2_0", "cclk2_1"};
+static const char * const cdu_ddr_sels[] = {"dclk_0", "dclk_1", "dummy", "dummy"};
+static const char * const can_sels[] = {"dummy", "oclk_1", "dummy", "dummy"};
+static const char * const spdif_sels[] = {"sclk1_0", "dummy", "dummy", "dummy"};
+static const char * const spi_sels[] = {"sclk0_0", "oclk_0", "dummy", "dummy"};
+static const char * const gige_sels[] = {"sclk0_0", "sclk0_1", "dummy", "dummy"};
+static const char * const lp_sels[] = {"oclk_0", "sclk0_0", "cclk0_1", "dummy"};
+static const char * const lp_ddr_sels[] = {"oclk_0", "dclk_0", "sysclk_1", "dummy"};
+static const char * const ospi_refclk_sels[] = {"sysclk_0", "sclk0_0", "sclk1_1", "dummy"};
+static const char * const trace_sels[] = {"sclk0_0", "dummy", "dummy", "dummy"};
+static const char * const emmc_sels[] = {"oclk_0", "sclk0_1", "dclk_0_half", "dclk_1_half"};
+static const char * const emmc_timer_sels[] = {"dummy", "sclk1_1_half", "dummy", "dummy"};
+
+static const char * const ddr_sels[] = {"cdu_ddr", "3pll_ddiv"};
+
+static void sc598_clock_setup(struct device_node *np)
+{
+	void __iomem *cgu0;
+	void __iomem *cgu1;
+	void __iomem *cdu;
+	void __iomem *pll3;
+	int i;
+
+	cgu0 = of_iomap(np, 0);
+	if (IS_ERR(cgu0)) {
+		pr_err("Unable to remap CGU0 address (resource 0)\n");
+		return;
+	}
+
+	cgu1 = of_iomap(np, 1);
+	if (IS_ERR(cgu1)) {
+		pr_err("Unable to remap CGU1 address (resource 1)\n");
+		return;
+	}
+
+	cdu = of_iomap(np, 2);
+	if (IS_ERR(cdu)) {
+		pr_err("Unable to remap CDU address (resource 2)\n");
+		return;
+	}
+
+	pll3 = of_iomap(np, 3);
+	if (IS_ERR(pll3)) {
+		pr_err("Unable to remap PLL3 control register (resource 3)\n");
+		return;
+	}
+
+	// We only access this one register for pll3
+	pll3 = pll3 + PLL3_OFFSET;
+
+	// Input clock configuration
+	clks[ADSP_SC598_CLK_DUMMY] = clk_register_fixed_rate(NULL, "dummy", NULL, 0, 0);
+	clks[ADSP_SC598_CLK_SYS_CLKIN0] = of_clk_get_by_name(np, "sys_clkin0");
+	clks[ADSP_SC598_CLK_SYS_CLKIN1] = of_clk_get_by_name(np, "sys_clkin1");
+	clks[ADSP_SC598_CLK_CGU1_IN] = clk_register_mux(NULL, "cgu1_in_sel",
+		cgu1_in_sels, 2, CLK_SET_RATE_PARENT, cdu + CDU_CLKINSEL, 0, 1, 0,
+		&cdu_lock);
+
+	// 3rd pll reuses cgu1 clk in selection, feeds directly into 3pll df
+	// changing the cgu1 in sel mux will affect 3pll so reuse the same clocks
+
+	// CGU configuration and internal clocks
+	clks[ADSP_SC598_CLK_CGU0_PLL_IN] = clk_register_divider(NULL, "cgu0_df",
+		"sys_clkin0", CLK_SET_RATE_PARENT, cgu0 + CGU_CTL, 0, 1, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_PLL_IN] = clk_register_divider(NULL, "cgu1_df",
+		"cgu1_in_sel", CLK_SET_RATE_PARENT, cgu1 + CGU_CTL, 0, 1, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_3PLL_PLL_IN] = clk_register_divider(NULL, "3pll_df",
+		"cgu1_in_sel", CLK_SET_RATE_PARENT, pll3, 3, 1, 0, &cdu_lock);
+
+	// VCO output inside PLL
+	clks[ADSP_SC598_CLK_CGU0_VCO_OUT] = sc5xx_cgu_pll("cgu0_vco_msel", "cgu0_df",
+		cgu0 + CGU_CTL, CGU_MSEL_SHIFT, CGU_MSEL_WIDTH, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_VCO_OUT] = sc5xx_cgu_pll("cgu1_vco_msel", "cgu1_df",
+		cgu1 + CGU_CTL, CGU_MSEL_SHIFT, CGU_MSEL_WIDTH, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_3PLL_VCO_OUT] = sc5xx_cgu_pll("3pll_vco_msel", "3pll_df",
+		pll3, PLL3_MSEL_SHIFT, PLL3_MSEL_WIDTH, 1, &cdu_lock);
+
+	//MSEL constant factor
+	clks[ADSP_SC598_CLK_CGU0_VCO_2_OUT] = clk_register_fixed_factor(NULL,
+		"cgu0_vco", "cgu0_vco_msel", CLK_SET_RATE_PARENT, 2, 1);
+	clks[ADSP_SC598_CLK_CGU1_VCO_2_OUT] = clk_register_fixed_factor(NULL,
+		"cgu1_vco", "cgu0_vco_msel", CLK_SET_RATE_PARENT, 2, 1);
+	clks[ADSP_SC598_CLK_3PLL_VCO_2_OUT] = clk_register_fixed_factor(NULL,
+		"3pll_vco", "cgu0_vco_msel", CLK_SET_RATE_PARENT, 2, 1);
+
+	// Final PLL output
+	clks[ADSP_SC598_CLK_CGU0_PLLCLK] = clk_register_fixed_factor(NULL,
+		"cgu0_pllclk", "cgu0_vco", CLK_SET_RATE_PARENT, 1, 2);
+	clks[ADSP_SC598_CLK_CGU1_PLLCLK] = clk_register_fixed_factor(NULL,
+		"cgu1_pllclk", "cgu1_vco", CLK_SET_RATE_PARENT, 1, 2);
+	clks[ADSP_SC598_CLK_3PLL_PLLCLK] = clk_register_fixed_factor(NULL,
+		"3pll_pllclk", "3pll_vco", CLK_SET_RATE_PARENT, 1, 2);
+
+	// Dividers from pll output
+	clks[ADSP_SC598_CLK_CGU0_CDIV] = cgu_divider("cgu0_cdiv", "cgu0_pllclk",
+		cgu0 + CGU_DIV, 0, 5, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_SYSCLK] = cgu_divider("sysclk_0", "cgu0_pllclk",
+		cgu0 + CGU_DIV, 8, 5, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_DDIV] = cgu_divider("cgu0_ddiv", "cgu0_pllclk",
+		cgu0 + CGU_DIV, 16, 5, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_ODIV] = cgu_divider("cgu0_odiv", "cgu0_pllclk",
+		cgu0 + CGU_DIV, 22, 7, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_S0SELDIV] = cgu_divider("cgu0_s0seldiv",
+		"sysclk_0", cgu0 + CGU_DIV, 5, 3, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_S1SELDIV] = cgu_divider("cgu0_s1seldiv",
+		"sysclk_0", cgu0 + CGU_DIV, 13, 3, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_S1SELEXDIV] = cgu_divider("cgu0_s1selexdiv",
+		"cgu0_pllclk", cgu0 + CGU_DIVEX, 16, 8, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_S1SEL] = clk_register_mux(NULL, "cgu0_sclk1sel",
+		cgu0_s1sels, 2, CLK_SET_RATE_PARENT, cgu0 + CGU_CTL, 17, 1, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_CCLK2] = clk_register_fixed_factor(NULL,
+		"cclk2_0", "cgu0_vco", CLK_SET_RATE_PARENT, 1, 3);
+
+	clks[ADSP_SC598_CLK_CGU1_CDIV] = cgu_divider("cgu1_cdiv", "cgu1_pllclk",
+		cgu1 + CGU_DIV, 0, 5, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_SYSCLK] = cgu_divider("sysclk_1", "cgu1_pllclk",
+		cgu1 + CGU_DIV, 8, 5, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_DDIV] = cgu_divider("cgu1_ddiv", "cgu1_pllclk",
+		cgu1 + CGU_DIV, 16, 5, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_ODIV] = cgu_divider("cgu1_odiv", "cgu1_pllclk",
+		cgu1 + CGU_DIV, 22, 7, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_S0SELDIV] = cgu_divider("cgu1_s0seldiv",
+		"sysclk_1", cgu1 + CGU_DIV, 5, 3, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_S1SELDIV] = cgu_divider("cgu1_s1seldiv",
+		"sysclk_1", cgu1 + CGU_DIV, 13, 3, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_S0SELEXDIV] = cgu_divider("cgu1_s0selexdiv",
+		"cgu1_pllclk", cgu1 + CGU_DIVEX, 0, 8, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_S1SELEXDIV] = cgu_divider("cgu1_s1selexdiv",
+		"cgu1_pllclk", cgu1 + CGU_DIVEX, 16, 8, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_S0SEL] = clk_register_mux(NULL, "cgu1_sclk0sel",
+		cgu1_s0sels, 2, CLK_SET_RATE_PARENT, cgu1 + CGU_CTL, 16, 1, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_S1SEL] = clk_register_mux(NULL, "cgu1_sclk1sel",
+		cgu1_s1sels, 2, CLK_SET_RATE_PARENT, cgu1 + CGU_CTL, 17, 1, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_CCLK2] = clk_register_fixed_factor(NULL,
+		"cclk2_1", "cgu1_vco", CLK_SET_RATE_PARENT, 1, 3);
+
+	clks[ADSP_SC598_CLK_3PLL_DDIV] = clk_register_divider(NULL, "3pll_ddiv",
+		"3pll_pllclk", CLK_SET_RATE_PARENT, pll3, 12, 5, 0, &cdu_lock);
+
+	// Gates to enable CGU outputs
+	clks[ADSP_SC598_CLK_CGU0_CCLK0] = cgu_gate("cclk0_0", "cgu0_cdiv",
+		cgu0 + CGU_CCBF_DIS, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_OCLK] = cgu_gate("oclk_0", "cgu0_odiv",
+		cgu0 + CGU_SCBF_DIS, 3, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_DCLK] = cgu_gate("dclk_0", "cgu0_ddiv",
+		cgu0 + CGU_SCBF_DIS, 2, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_SCLK1] = cgu_gate("sclk1_0", "cgu0_sclk1sel",
+		cgu0 + CGU_SCBF_DIS, 1, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU0_SCLK0] = cgu_gate("sclk0_0", "cgu0_s0seldiv",
+		cgu0 + CGU_SCBF_DIS, 0, &cdu_lock);
+
+	clks[ADSP_SC598_CLK_CGU1_CCLK0] = cgu_gate("cclk0_1", "cgu1_cdiv",
+		cgu1 + CGU_CCBF_DIS, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_OCLK] = cgu_gate("oclk_1", "cgu1_odiv",
+		cgu1 + CGU_SCBF_DIS, 3, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_DCLK] = cgu_gate("dclk_1", "cgu1_ddiv",
+		cgu1 + CGU_SCBF_DIS, 2, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_SCLK1] = cgu_gate("sclk1_1", "cgu1_sclk1sel",
+		cgu1 + CGU_SCBF_DIS, 1, &cdu_lock);
+	clks[ADSP_SC598_CLK_CGU1_SCLK0] = cgu_gate("sclk0_1", "cgu1_sclk0sel",
+		cgu1 + CGU_SCBF_DIS, 0, &cdu_lock);
+
+	// Extra half rate clocks generated in the CDU
+	clks[ADSP_SC598_CLK_DCLK0_HALF] = clk_register_fixed_factor(NULL, "dclk_0_half",
+		"dclk_0", CLK_SET_RATE_PARENT, 1, 2);
+	clks[ADSP_SC598_CLK_DCLK1_HALF] = clk_register_fixed_factor(NULL, "dclk_1_half",
+		"dclk_1", CLK_SET_RATE_PARENT, 1, 2);
+	clks[ADSP_SC598_CLK_CGU1_SCLK1_HALF] = clk_register_fixed_factor(NULL,
+		"sclk1_1_half", "sclk1_1", CLK_SET_RATE_PARENT, 1, 2);
+
+	// CDU output muxes
+	clks[ADSP_SC598_CLK_SHARC0_SEL] = cdu_mux("sharc0_sel", cdu + CDU_CFG0,
+		sharc0_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_SHARC1_SEL] = cdu_mux("sharc1_sel", cdu + CDU_CFG1,
+		sharc1_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_ARM_SEL] = cdu_mux("arm_sel", cdu + CDU_CFG2,
+		arm_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_CDU_DDR_SEL] = cdu_mux("cdu_ddr_sel", cdu + CDU_CFG3,
+		cdu_ddr_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_CAN_SEL] = cdu_mux("can_sel", cdu + CDU_CFG4,
+		can_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_SPDIF_SEL] = cdu_mux("spdif_sel", cdu + CDU_CFG5,
+		spdif_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_SPI_SEL] = cdu_mux("spi_sel", cdu + CDU_CFG6,
+		spi_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_GIGE_SEL] = cdu_mux("gige_sel", cdu + CDU_CFG7,
+		gige_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_LP_SEL] = cdu_mux("lp_sel", cdu + CDU_CFG8, lp_sels,
+		&cdu_lock);
+	clks[ADSP_SC598_CLK_LP_DDR_SEL] = cdu_mux("lp_ddr_sel", cdu + CDU_CFG9,
+		lp_ddr_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_OSPI_REFCLK_SEL] = cdu_mux("ospi_refclk_sel",
+		cdu + CDU_CFG10, ospi_refclk_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_TRACE_SEL] = cdu_mux("trace_sel", cdu + CDU_CFG12,
+		trace_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_EMMC_SEL] = cdu_mux("emmc_sel", cdu + CDU_CFG13,
+		emmc_sels, &cdu_lock);
+	clks[ADSP_SC598_CLK_EMMC_TIMER_QMC_SEL] = cdu_mux("emmc_timer_qmc_sel",
+		cdu + CDU_CFG14, emmc_timer_sels, &cdu_lock);
+
+	// CDU output enable gates
+	clks[ADSP_SC598_CLK_SHARC0] = cdu_gate("sharc0", "sharc0_sel",
+		cdu + CDU_CFG0, CLK_IS_CRITICAL, &cdu_lock);
+	clks[ADSP_SC598_CLK_SHARC1] = cdu_gate("sharc1", "sharc1_sel",
+		cdu + CDU_CFG1, CLK_IS_CRITICAL, &cdu_lock);
+	clks[ADSP_SC598_CLK_ARM] = cdu_gate("arm", "arm_sel", cdu + CDU_CFG2,
+		CLK_IS_CRITICAL, &cdu_lock);
+	clks[ADSP_SC598_CLK_CDU_DDR] = cdu_gate("cdu_ddr", "cdu_ddr_sel",
+		cdu + CDU_CFG3, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_CAN] = cdu_gate("can", "can_sel", cdu + CDU_CFG4, 0,
+		&cdu_lock);
+	clks[ADSP_SC598_CLK_SPDIF] = cdu_gate("spdif", "spdif_sel", cdu + CDU_CFG5,
+		0, &cdu_lock);
+	clks[ADSP_SC598_CLK_SPI] = cdu_gate("spi", "spi_sel", cdu + CDU_CFG6, 0,
+		&cdu_lock);
+	clks[ADSP_SC598_CLK_GIGE] = cdu_gate("gige", "gige_sel", cdu + CDU_CFG7, 0,
+		&cdu_lock);
+	clks[ADSP_SC598_CLK_LP] = cdu_gate("lp", "lp_sel", cdu + CDU_CFG8, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_LP_DDR] = cdu_gate("lp_ddr", "lp_ddr_sel",
+		cdu + CDU_CFG9, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_OSPI_REFCLK] = cdu_gate("ospi_refclk", "ospi_refclk_sel",
+		cdu + CDU_CFG10, 0, &cdu_lock);
+	clks[ADSP_SC598_CLK_TRACE] = cdu_gate("trace", "trace_sel", cdu + CDU_CFG12,
+		0, &cdu_lock);
+	clks[ADSP_SC598_CLK_EMMC] = cdu_gate("emmc", "emmc_sel", cdu + CDU_CFG13, 0,
+		&cdu_lock);
+	clks[ADSP_SC598_CLK_EMMC_TIMER_QMC] = cdu_gate("emmc_timer_qmc",
+		"emmc_timer_qmc_sel", cdu + CDU_CFG14, 0, &cdu_lock);
+
+	// Dedicated DDR output mux
+	clks[ADSP_SC598_CLK_DDR] = clk_register_mux(NULL, "ddr", ddr_sels, 2,
+		CLK_SET_RATE_PARENT | CLK_IS_CRITICAL, pll3, 11, 1, 0, &cdu_lock);
+
+	for (i = 0; i < ARRAY_SIZE(clks); i++) {
+		if (IS_ERR(clks[i])) {
+			pr_err("Zynq clk %d: register failed with %ld\n",
+			       i, PTR_ERR(clks[i]));
+			BUG();
+		}
+	}
+
+	clk_data.clks = clks;
+	clk_data.clk_num = ARRAY_SIZE(clks);
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+}
+
+CLK_OF_DECLARE(sc598_clocks, "adi,sc598-clocks", sc598_clock_setup);
+
+MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
+MODULE_DESCRIPTION("Analog Devices Clock driver");
+MODULE_LICENSE("GPL v2");
\ No newline at end of file

-- 
2.25.1



