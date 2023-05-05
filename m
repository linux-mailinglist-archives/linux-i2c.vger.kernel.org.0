Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF2A6F8C99
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 01:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjEEXB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 19:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjEEXB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 19:01:58 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1B8172D;
        Fri,  5 May 2023 16:01:56 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4QCkkZ17jPzBr;
        Fri,  5 May 2023 23:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1683323126; bh=r7IodaLcY4l5PFjujTNz/NWXTsBnQiFM1+yqJZQUjOg=;
        h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
        b=qCUjdfDvnYdipgc4D8wlq3SuV8Wr5Y0y+PzaFb5mOGqFCeA2sVIxs7Uurx9Y7u4CT
         fui5oCdE6yAXx78YZ97gvnJDrn/F27uv0nyhIbfCGFDN4rD/ViEbaivAn/l5G/4hT8
         4vtH2N4MXqWZ+G+t2oATKMOShQbdIdtJRPS0AQUEr6tsrRVvSMg0r/jxznliK1TPaT
         MNbLXFT4F00pGJUKY202O0NhhbPi0KCONNvSNCgXR2NOrWUN8unb9Oz52ATEGX+g/S
         ubxR/tsoRJTGQ0pQ9CCeqwH+Pge0UVWphUnrGhxXqN3yxNKmsUDyQDgrrbCkzG0xI4
         RMcmj4JIgIb/g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Fri, 05 May 2023 23:45:25 +0200
Message-Id: <44028f56a1d93602bae335df3a002bce755fb1dd.1683322608.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1683322608.git.mirq-linux@rere.qmqm.pl>
References: <cover.1683322608.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 2/2] i2c: tegra: allow VI support to be compiled out
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Wolfram Sang <wsa@kernel.org>

---
v3: add parentheses for IS_VI() macro value
v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
    (Assuming that for Tegra210 the VI part will be used anyway.)

---
 drivers/i2c/busses/i2c-tegra.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 536ba5873333..142afe3dedfb 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -297,6 +297,7 @@ struct tegra_i2c_dev {
 };
 
 #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -317,7 +318,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
 	if (IS_DVC(i2c_dev))
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
-	else if (i2c_dev->is_vi)
+	else if (IS_VI(i2c_dev))
 		reg = 0xc00 + (reg << 2);
 
 	return reg;
@@ -446,7 +447,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		return 0;
 
 	if (!i2c_dev->hw->has_apb_dma) {
@@ -651,7 +652,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, val, I2C_CNFG);
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
 	switch (t->bus_freq_hz) {
@@ -703,7 +704,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	if (!IS_DVC(i2c_dev) && !i2c_dev->is_vi) {
+	if (!IS_DVC(i2c_dev) && !IS_VI(i2c_dev)) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -1642,7 +1643,9 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+#endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
@@ -1669,7 +1672,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
 
-	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
+	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
 		i2c_dev->is_vi = true;
 }
 
@@ -1698,7 +1702,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw == &tegra20_i2c_hw || i2c_dev->hw == &tegra30_i2c_hw)
 		i2c_dev->clocks[i2c_dev->nclocks++].id = "fast-clk";
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		i2c_dev->clocks[i2c_dev->nclocks++].id = "slow";
 
 	err = devm_clk_bulk_get(i2c_dev->dev, i2c_dev->nclocks,
@@ -1816,7 +1820,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers.
 	 */
-	if (!i2c_dev->is_vi)
+	if (!IS_VI(i2c_dev))
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);
@@ -1890,7 +1894,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * power ON/OFF during runtime PM resume/suspend, meaning that
 	 * controller needs to be re-initialized after power ON.
 	 */
-	if (i2c_dev->is_vi) {
+	if (IS_VI(i2c_dev)) {
 		err = tegra_i2c_init(i2c_dev);
 		if (err)
 			goto disable_clocks;
-- 
2.39.2

