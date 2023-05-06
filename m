Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D876F941D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 23:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjEFVTJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 May 2023 17:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjEFVTI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 May 2023 17:19:08 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963E28A60;
        Sat,  6 May 2023 14:19:05 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4QDL5f3CkYzBr;
        Sat,  6 May 2023 23:19:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1683407942; bh=awLAvYVYY1Hw6JPyY91yctNAjsWIDgy3YBAXa3CweBw=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=cvxrKEuiyxlHVNIwzgoglYAaCUnnYNJGRj9pddIT2xa9qsXzQS8WVnHMpoA71dC+K
         ARZ/r7nLjfg/GM6dATnKFV4gLrascLu9LMa9350p9sMEJU434j41mmaOOi5OI0w64S
         oNZxjTT00OoaGUqEmaBe0qgiYoEB68AD8POqaS3FDCJFWgtHDGCv2OSuvKmyeyTb7X
         /zlPmiWuY/4o+IzZ8XVIkxhs5D1vfrWPlrTkc6/hnwpVMPUvjh0cj6BCrHlpi2xBlm
         8Q0USUxAWdQ0+9k/ezgslIAy3TY6Ps+HAk3zKBJoN4/v3fezuHZFg+CFHh3U0mTwrP
         TG3nZvtIlHFNQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Sat, 06 May 2023 23:19:02 +0200
Message-Id: <0248c0737ace5db7be4e04f97985f3e7874ff1ab.1683407699.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1683407699.git.mirq-linux@rere.qmqm.pl>
References: <cover.1683407699.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 2/2] i2c: tegra: allow VI support to be compiled out
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Save a bit of code for older Tegra platforms by compiling out
VI's I2C mode support that's used only for Tegra210.

$ size i2c-tegra.o
   text    data     bss     dec     hex filename
  11381     292       8   11681    2da1 i2c-tegra.o (full)
  10193     292       8   10493    28fd i2c-tegra.o (no-dvc)
   9145     292       8    9445    24e5 i2c-tegra.o (no-vi,no-dvc)

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Wolfram Sang <wsa@kernel.org>

---
v4: include a missed is_vi check in i2c_writel() readback
v3: add parentheses for IS_VI() macro value
v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
    (Assuming that for Tegra210 the VI part will be used anyway.)

---
 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 51ef2e80e8ce..d26f94364fbc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -299,6 +299,7 @@ struct tegra_i2c_dev {
 };
 
 #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -319,7 +320,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
 	if (IS_DVC(i2c_dev))
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
-	else if (i2c_dev->is_vi)
+	else if (IS_VI(i2c_dev))
 		reg = 0xc00 + (reg << 2);
 
 	return reg;
@@ -332,7 +333,7 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
 	/* read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
-	else if (i2c_dev->is_vi)
+	else if (IS_VI(i2c_dev))
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
 }
 
@@ -448,7 +449,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		return 0;
 
 	if (!i2c_dev->hw->has_apb_dma) {
@@ -653,7 +654,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, val, I2C_CNFG);
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
 	switch (t->bus_freq_hz) {
@@ -705,7 +706,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	if (!IS_DVC(i2c_dev) && !i2c_dev->is_vi) {
+	if (!IS_DVC(i2c_dev) && !IS_VI(i2c_dev)) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -848,7 +849,7 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->msg_buf_remaining = buf_remaining;
 		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
-		if (i2c_dev->is_vi)
+		if (IS_VI(i2c_dev))
 			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 		else
 			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
@@ -1656,7 +1657,9 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+#endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
@@ -1683,7 +1686,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
 
-	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
+	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
 		i2c_dev->is_vi = true;
 }
 
@@ -1712,7 +1716,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw == &tegra20_i2c_hw || i2c_dev->hw == &tegra30_i2c_hw)
 		i2c_dev->clocks[i2c_dev->nclocks++].id = "fast-clk";
 
-	if (i2c_dev->is_vi)
+	if (IS_VI(i2c_dev))
 		i2c_dev->clocks[i2c_dev->nclocks++].id = "slow";
 
 	err = devm_clk_bulk_get(i2c_dev->dev, i2c_dev->nclocks,
@@ -1830,7 +1834,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers.
 	 */
-	if (!i2c_dev->is_vi)
+	if (!IS_VI(i2c_dev))
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);
@@ -1904,7 +1908,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
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

