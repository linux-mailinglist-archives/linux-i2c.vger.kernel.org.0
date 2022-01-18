Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B2A492ED8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348988AbiARUAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:00:08 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:56546 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348963AbiARUAH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 18 Jan 2022 15:00:07 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Jdfks4PZxz9j;
        Tue, 18 Jan 2022 21:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1642536005; bh=H6E7bG7YJrXsY/7wmkDfz/7IsC41zhil28AHTN5V508=;
        h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
        b=GGo2KTkMD8qSCh1tZ0Q4bTHemnxccXjLuBphOwN+QW4ZrS98r73JvE6nW6e2FA+gJ
         xIVeK40yPeb0Gqyu34UdsmGQM72qJhsG1qRY94vCshBf2Xixgha4O96YTIRxO8hygk
         cjzhmLkdtCY811CMJWsjQ0S7GBI50ng84WwRRJ37P2/YcthLJ7QJR1hoTE0UDNhAof
         EGX/YFEvedIxiWsL9OpgaytWgUcHJpGIaANN+C/jRkZvgfGweQJKYg0RoSYGtk972w
         13Qla0HMGUhloiazQh9DZ7rOpJu97iamgasl2ier0zKG61p+aPSR3tqxiWYaJXQOem
         b21Uccq0Lv+nQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Tue, 18 Jan 2022 21:00:05 +0100
Message-Id: <ebe847bb25016e743c28bd38a10c966b04b06cc8.1642535860.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1642535860.git.mirq-linux@rere.qmqm.pl>
References: <cover.1642535860.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 1/2] i2c: tegra: allow DVC support to be compiled out
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
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Save a bit of code for newer Tegra platforms by compiling out
DVC's I2C mode support that's used only for Tegra2.

$ size i2c-tegra.o
    text    data     bss     dec     hex filename
-  10385     240       8   10633    2989 i2c-tegra.o
+   9617     240       8    9865    2689 i2c-tegra.o

---
v2: remove KConfig symbol as per Dmitry Osipenko's suggestion.
    (Assuming that for Tegra20 the DVC part will be used anyway.)

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/i2c/busses/i2c-tegra.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b3184c422826..96bfe7013d85 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -294,6 +294,8 @@ struct tegra_i2c_dev {
 	bool is_vi;
 };
 
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && dev->is_dvc)
+
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
 {
@@ -311,7 +313,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
  */
 static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
@@ -621,7 +623,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	err = reset_control_reset(i2c_dev->rst);
 	WARN_ON_ONCE(err);
 
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		tegra_dvc_init(i2c_dev);
 
 	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
@@ -685,7 +687,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		return err;
 	}
 
-	if (!i2c_dev->is_dvc && !i2c_dev->is_vi) {
+	if (!IS_DVC(i2c_dev) && !i2c_dev->is_vi) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -915,7 +917,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	/*
@@ -954,7 +956,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
 
-	if (i2c_dev->is_dvc)
+	if (IS_DVC(i2c_dev))
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	if (i2c_dev->dma_mode) {
@@ -1616,7 +1618,9 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+#endif
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
@@ -1635,7 +1639,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
 
-	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
+	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
 		i2c_dev->is_dvc = true;
 
 	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-- 
2.30.2

