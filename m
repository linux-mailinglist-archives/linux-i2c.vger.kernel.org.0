Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841686F8C9A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 01:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjEEXB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 19:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjEEXB6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 19:01:58 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F32710D9;
        Fri,  5 May 2023 16:01:56 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4QCkkY3yndzBf;
        Fri,  5 May 2023 23:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1683323125; bh=pPveaA4XaGAjcdknR0lPLjVOMjJBset2RbTiw9CHMCE=;
        h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
        b=cqRA2oQXyjqaZrTsOyu70yfnTPH/RMAxmwLCogTAk4VUgfUFLoV14XSEmAYpySPxM
         gq+LCeHAhdiQgLtcFR2vRtunQfzacNpa48qX4kjFsotJNiWOp6MZ0BSJI7CrK1b2V9
         +0qr8i0thd73Fd4ajO4N1HVnM+IAmjTKJrxzmhihWeg47/+EW4wqYhTDwsb538wkkJ
         IppBH6DE5mTYePfISou3zxTiH3y5IVxxMzqfr/ewf5ABn9K73uYfkNlEQYo0Iae/de
         zjYBB4HLqoudwUSuzyhz3oM9NexlFEh/jtir0vd3u/uN2/sLq/POpbokzdaz9TlKIt
         vLWg7Pe5qF1pA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Fri, 05 May 2023 23:45:25 +0200
Message-Id: <fd7c71738959a755249e63ddcddaa2b425692b82.1683322608.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1683322608.git.mirq-linux@rere.qmqm.pl>
References: <cover.1683322608.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 1/2] i2c: tegra: allow DVC support to be compiled out
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

Save a bit of code for newer Tegra platforms by compiling out
DVC's I2C mode support that's used only for Tegra2.

$ size i2c-tegra.o
    text    data     bss     dec     hex filename
-  10385     240       8   10633    2989 i2c-tegra.o
+   9617     240       8    9865    2689 i2c-tegra.o

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Wolfram Sang <wsa@kernel.org>

---
v3: add parentheses for IS_DVC() macro value
v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
    (Assuming that for Tegra20 the DVC part will be used anyway.)

---
 drivers/i2c/busses/i2c-tegra.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6aab84c8d22b..536ba5873333 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -296,6 +296,8 @@ struct tegra_i2c_dev {
 	bool is_vi;
 };
 
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
+
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
 {
@@ -313,7 +315,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
  */
 static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
@@ -637,7 +639,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 	WARN_ON_ONCE(err);
 
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		tegra_dvc_init(i2c_dev);
 
 	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
@@ -701,7 +703,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	if (!i2c_dev->is_dvc && !i2c_dev->is_vi) {
+	if (!IS_DVC(i2c_dev) && !i2c_dev->is_vi) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -931,7 +933,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	/*
@@ -970,7 +972,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
 
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	if (i2c_dev->dma_mode) {
@@ -1646,7 +1648,9 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+#endif
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
@@ -1661,7 +1665,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
-	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
+	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
 
 	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-- 
2.39.2

