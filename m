Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A246F941F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 23:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjEFVTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 May 2023 17:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjEFVTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 May 2023 17:19:07 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2489E83C2;
        Sat,  6 May 2023 14:19:05 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4QDL5f0pJvzBf;
        Sat,  6 May 2023 23:19:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1683407942; bh=VHLUk5TRxUrV9tpNVEXH1omBZ4+ZuQYZ46H+ns5d9jM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=FIAAptJIJJTcG94JlQS89qaAADnJoy77xnDlV/8AmLz7ZNoK4Pm1RC9IoRXX/VbJe
         f02Z8Cpb+GvGbfDgnjh9B9qOuKAg6lX8tdbmn2sP1d34s1AEG2kIEHBpmjtkh0AsCe
         YOPbKjcgPkiskDrRng9iOrCqx+2/yhjhsX9Ww4/sZ/gLr8PbUlordcUo4ury0W5S9z
         4vaXsaXfXSP4NeUo6ahFSqWJN8HETpyd5xSyrtpYNklUdO8wcA6scRQs+XxOsZJEtY
         WddlEpG9Y3jipMcwEXh/U8U5WW1uFB0p3Gh27GletC30eVK6djIXoeuJYaWzY55R1u
         T/a2d2szF3E0w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Sat, 06 May 2023 23:19:01 +0200
Message-Id: <857cca81cdda30c1a2b5fb87e81cc50ec6c51e63.1683407699.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1683407699.git.mirq-linux@rere.qmqm.pl>
References: <cover.1683407699.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 1/2] i2c: tegra: allow DVC support to be compiled out
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

Save a bit of code for newer Tegra platforms by compiling out
DVC's I2C mode support that's used only for Tegra2.

$ size i2c-tegra.o
    text    data     bss     dec     hex filename
-  11381     292       8   11681    2da1 i2c-tegra.o
+  10193     292       8   10493    28fd i2c-tegra.o

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Wolfram Sang <wsa@kernel.org>

---
v4: no changes
v3: add parentheses for IS_DVC() macro value
v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
    (Assuming that for Tegra20 the DVC part will be used anyway.)

---
 drivers/i2c/busses/i2c-tegra.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 157066f06a32..51ef2e80e8ce 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -298,6 +298,8 @@ struct tegra_i2c_dev {
 	bool is_vi;
 };
 
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
+
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
 {
@@ -315,7 +317,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
  */
 static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
@@ -639,7 +641,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 	WARN_ON_ONCE(err);
 
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		tegra_dvc_init(i2c_dev);
 
 	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
@@ -703,7 +705,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	if (!i2c_dev->is_dvc && !i2c_dev->is_vi) {
+	if (!IS_DVC(i2c_dev) && !i2c_dev->is_vi) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -933,7 +935,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	/*
@@ -972,7 +974,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
 
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	if (i2c_dev->dma_mode) {
@@ -1660,7 +1662,9 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+#endif
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
@@ -1675,7 +1679,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
-	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
+	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
 
 	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-- 
2.39.2

