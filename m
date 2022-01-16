Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0047048FDBB
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 17:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbiAPQCW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jan 2022 11:02:22 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:43762 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233440AbiAPQCV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jan 2022 11:02:21 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JcKYS0w7PzMc;
        Sun, 16 Jan 2022 17:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642348940; bh=b+aXZUEZ/iu/vA0Z9GFMnzJiD2dDum0zArW4qRVtf2o=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dKJmCZ1XudMh1ggQg5NMcX9+k5jU5RrNDShmOatiazuusXPFWFowhXS4jO9+kgBo+
         Gl1lUFUpLRqS/r815J3UqfkLhII5OUbaRu6dbPcqwagD8GYaMbGDrMrXSmrgDceQJ0
         GRdcyh7hRCtSRmc5jE4Mm2kRzG18p5gL+nZtHS1rAF5re+LMS/3zRQnZUBvaVcwZRk
         CDXvP+K63cUg+RKoFzSbDvxWwGt4ALR4bQsajQxlFviE/57XaV9tPeapxR9tiM7fBd
         U4/Vc53yWk8/2wiiv6ftvIIxq02WSPjS7+u+oPVvcy8mODYeDP0lGc6mZ3TSxxxBSP
         eraQ8ocKf6ypQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Sun, 16 Jan 2022 17:02:19 +0100
Message-Id: <b8bc368b7beea938849b89334e4635a59a76f0f3.1642348712.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/2] i2c: tegra: allow VI support to be compiled out
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Save a bit of code for older Tegra platforms by compiling out
VI's I2C mode support that's used only for Tegra210.

$ size i2c-tegra.o
   text    data     bss     dec     hex filename
  10385     240       8   10633    2989 i2c-tegra.o (full)
   9617     240       8    9865    2689 i2c-tegra.o (no-dvc)
   9389     240       8    9637    25a5 i2c-tegra.o (no-vi)
   8617     240       8    8865    22a1 i2c-tegra.o (no-vi,no-dvc)

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/i2c/busses/Kconfig     |  8 ++++++++
 drivers/i2c/busses/i2c-tegra.c | 20 ++++++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b557b832bfec..2dd5974acc14 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1087,6 +1087,14 @@ config I2C_TEGRA_DVC
 	  If you say yes to this option, tegra-i2c will also support
 	  I2C controller that is part of DVC in Tegra20 SoCs.
 
+config I2C_TEGRA_VI
+	bool "NVIDIA Tegra VI I2C controller"
+	depends on I2C_TEGRA
+	default y if ARCH_TEGRA_210_SOC
+	help
+	  If you say yes to this option, tegra-i2c will also support
+	  I2C controller that is part of VI in Tegra210 SoCs.
+
 config I2C_TEGRA_BPMP
 	tristate "NVIDIA Tegra BPMP I2C controller"
 	depends on TEGRA_BPMP || COMPILE_TEST
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 60ecf6c9f649..140fbce203cb 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -295,6 +295,7 @@ struct tegra_i2c_dev {
 };
 
 #define IS_DVC(dev) (IS_ENABLED(CONFIG_I2C_TEGRA_DVC) && dev->is_dvc)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_I2C_TEGRA_VI) && dev->is_vi)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -315,7 +316,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
 	if (IS_DVC(i2c_dev))
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
-	else if (i2c_dev->is_vi)
+	else if (IS_VI(i2c_dev))
 		reg = 0xc00 + (reg << 2);
 
 	return reg;
@@ -444,7 +445,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
+	if (!i2c_dev->hw->has_apb_dma || IS_VI(i2c_dev))
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
@@ -635,7 +636,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, val, I2C_CNFG);
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
 	switch (i2c_dev->bus_clk_rate) {
@@ -687,7 +688,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	if (!IS_DVC(i2c_dev) && !i2c_dev->is_vi) {
+	if (!IS_DVC(i2c_dev) && !IS_VI(i2c_dev)) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -1612,7 +1613,9 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
+#if IS_ENABLED(CONFIG_I2C_TEGRA_VI)
 	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+#endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
@@ -1643,7 +1646,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
 
-	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+	if (IS_ENABLED(CONFIG_I2C_TEGRA_VI) &&
+	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
 		i2c_dev->is_vi = true;
 }
 
@@ -1656,7 +1660,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw == &tegra20_i2c_hw || i2c_dev->hw == &tegra30_i2c_hw)
 		i2c_dev->clocks[i2c_dev->nclocks++].id = "fast-clk";
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		i2c_dev->clocks[i2c_dev->nclocks++].id = "slow";
 
 	err = devm_clk_bulk_get(i2c_dev->dev, i2c_dev->nclocks,
@@ -1777,7 +1781,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers.
 	 */
-	if (!i2c_dev->is_vi)
+	if (!IS_VI(i2c_dev))
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);
@@ -1850,7 +1854,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * power ON/OFF during runtime PM resume/suspend, meaning that
 	 * controller needs to be re-initialized after power ON.
 	 */
-	if (i2c_dev->is_vi) {
+	if (IS_VI(i2c_dev)) {
 		err = tegra_i2c_init(i2c_dev);
 		if (err)
 			goto disable_clocks;
-- 
2.30.2

