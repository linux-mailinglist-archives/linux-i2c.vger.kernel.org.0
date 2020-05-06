Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04741C7A07
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 21:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgEFTPd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 15:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728106AbgEFTPb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 15:15:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46D0C061A0F;
        Wed,  6 May 2020 12:15:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u16so3994436wmc.5;
        Wed, 06 May 2020 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNq8fkGUX8o/fgxICD6OL4NWkrCewCOPD4RItlaeXkk=;
        b=l0b8npYKTDTQM7w0k03GN8vABsUwuWHgQZFAJJmpf76vlhVMMDkGHZZzC2wfO4BTJj
         g52N1zdL+slYR3KFaXqZ6FjRuBy2co+MEadVn3S8EFVyWDrLcrQos7COiqKOiMg7rEeu
         BXvnImWAGn5t/RdUEpPgiEiQQaLfFVfIunPYtqsG7xSwqNIotJXF6DkmBtvNU7qm5sTF
         mYb4UXQFna8WcgKWnsCmPbbWvkd5K+136pOuQho5KZ/AONjTxen2YjzNGwEZaOQaCtrS
         dRd3OTKx95eVIVRF8+Pzr2/SjE6C1+QDit/psyvsQtk4r5ry3YYZt6KUlRNrAqrhRcjs
         CMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNq8fkGUX8o/fgxICD6OL4NWkrCewCOPD4RItlaeXkk=;
        b=CCuRkEcvNrBoV7/V9lY0uHj/3KV7uSKqf7NlJDmrdIX283MJGNMUqLHXCiyoSr/pVZ
         7MtpNDZcv84zNzScdLoRHwPMlX9rGUmiYtAVH6vSAUTZqIjek6bCBYmoSHY1L3bkU23p
         GusAoYxNMoy2byLQfulinkg7JpzdEGxSvVJQgYA0bdxJV3QiqVlF0OGUPO/Gi6rKQhcW
         4g+lUqOfMli7P1NSVEffH2OJsbbhJuAIDwBkWuTjKP5vrgxcht749R+TSKLEi0VBvlYr
         Y816nvb+Tg+Zp5Aedzk3aXqIidbzLki2KBXVGrpdlkXBW/mCCFTLeDgBLjR7xUb5cEEW
         T9Kg==
X-Gm-Message-State: AGi0PuYxudORK6YeUREStOj+Z5q1NYlFEMYOW58KiWTWGG41gLrjZe5D
        BqFOjscHGupccu/29rzRToo=
X-Google-Smtp-Source: APiQypLxVgtP/fGuYt8PLF/kfNrCkeNuZpd3ZXjSQG7xZCC3IcNefbEUDOnzW3keFLyQ31rjLStSVw==
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr5685508wmt.129.1588792529547;
        Wed, 06 May 2020 12:15:29 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id r5sm4109104wrt.20.2020.05.06.12.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:15:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] i2c: tegra: Add support for the VI I2C on Tegra210
Date:   Wed,  6 May 2020 21:15:10 +0200
Message-Id: <20200506191511.2791107-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200506191511.2791107-1-thierry.reding@gmail.com>
References: <20200506191511.2791107-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra210 has an extra instance of the I2C controller that is in the
domain of host1x and usually used for camera use-cases. The programming
model for the VI variant of the controller is roughly the same as for
the other variants, except that the I2C registers start at an offset
and are spaced further apart. VI I2C also doesn't support slave mode.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 97 +++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e8e64498dd8b..08dac4242726 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -40,6 +40,7 @@
 #define I2C_SL_CNFG_NEWSL			BIT(2)
 #define I2C_SL_ADDR1				0x02c
 #define I2C_SL_ADDR2				0x030
+#define I2C_TLOW_SEXT				0x034
 #define I2C_TX_FIFO				0x050
 #define I2C_RX_FIFO				0x054
 #define I2C_PACKET_TRANSFER_STATUS		0x058
@@ -109,6 +110,18 @@
 #define  I2C_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
 #define  I2C_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
 #define I2C_INTERFACE_TIMING_1			0x098
+#define  I2C_INTERFACE_TIMING_TBUF		GENMASK(29, 24)
+#define  I2C_INTERFACE_TIMING_TSU_STO		GENMASK(21, 16)
+#define  I2C_INTERFACE_TIMING_THD_STA		GENMASK(13, 8)
+#define  I2C_INTERFACE_TIMING_TSU_STA		GENMASK(5, 0)
+
+#define I2C_HS_INTERFACE_TIMING_0		0x09c
+#define  I2C_HS_INTERFACE_TIMING_THIGH		GENMASK(13, 8)
+#define  I2C_HS_INTERFACE_TIMING_TLOW		GENMASK(5, 0)
+#define I2C_HS_INTERFACE_TIMING_1		0x0a0
+#define  I2C_HS_INTERFACE_TIMING_TSU_STO	GENMASK(21, 16)
+#define  I2C_HS_INTERFACE_TIMING_THD_STA	GENMASK(13, 8)
+#define  I2C_HS_INTERFACE_TIMING_TSU_STA	GENMASK(5, 0)
 
 #define I2C_MST_FIFO_CONTROL			0x0b4
 #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
@@ -230,6 +243,7 @@ struct tegra_i2c_hw_feature {
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
  * @is_dvc: identifies the DVC I2C controller, has a different register layout
+ * @is_vi: identifies the VI I2C controller, has a different register layout
  * @msg_complete: transfer completion notifier
  * @msg_err: error code for completed message
  * @msg_buf: pointer to current message data
@@ -253,12 +267,14 @@ struct tegra_i2c_dev {
 	struct i2c_adapter adapter;
 	struct clk *div_clk;
 	struct clk *fast_clk;
+	struct clk *slow_clk;
 	struct reset_control *rst;
 	void __iomem *base;
 	phys_addr_t base_phys;
 	int cont_id;
 	int irq;
 	int is_dvc;
+	bool is_vi;
 	struct completion msg_complete;
 	int msg_err;
 	u8 *msg_buf;
@@ -297,6 +313,8 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 {
 	if (i2c_dev->is_dvc)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
+	else if (i2c_dev->is_vi)
+		reg = 0xc00 + (reg << 2);
 	return reg;
 }
 
@@ -646,6 +664,14 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 		}
 	}
 
+	if (i2c_dev->slow_clk) {
+		ret = clk_enable(i2c_dev->slow_clk);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable slow clock: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = clk_enable(i2c_dev->div_clk);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev,
@@ -662,6 +688,10 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
 	clk_disable(i2c_dev->div_clk);
+
+	if (i2c_dev->slow_clk)
+		clk_disable(i2c_dev->slow_clk);
+
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_disable(i2c_dev->fast_clk);
 
@@ -699,6 +729,35 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 value;
+
+	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
+	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
+
+	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
+	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
+
+	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
+	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
+
+	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
+	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
+
+	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
+	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
+
+	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 {
 	u32 val;
@@ -723,6 +782,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	i2c_writel(i2c_dev, val, I2C_CNFG);
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 
+	if (i2c_dev->is_vi)
+		tegra_i2c_vi_init(i2c_dev);
+
 	/* Make sure clock divisor programmed correctly */
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
@@ -766,7 +828,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 		}
 	}
 
-	if (!i2c_dev->is_dvc) {
+	if (!i2c_dev->is_dvc && !i2c_dev->is_vi) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
@@ -1555,6 +1617,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
@@ -1567,6 +1630,7 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
 	struct clk *div_clk;
@@ -1622,6 +1686,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						  "nvidia,tegra20-i2c-dvc");
+	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
+						 "nvidia,tegra210-i2c-vi");
 	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
 				I2C_PACKET_HEADER_SIZE;
@@ -1637,6 +1703,17 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		i2c_dev->fast_clk = fast_clk;
 	}
 
+	if (i2c_dev->is_vi) {
+		i2c_dev->slow_clk = devm_clk_get(dev, "slow");
+		if (IS_ERR(i2c_dev->slow_clk)) {
+			if (PTR_ERR(i2c_dev->slow_clk) != -EPROBE_DEFER)
+				dev_err(dev, "failed to get slow clock: %ld\n",
+					PTR_ERR(i2c_dev->slow_clk));
+
+			return PTR_ERR(i2c_dev->slow_clk);
+		}
+	}
+
 	platform_set_drvdata(pdev, i2c_dev);
 
 	if (!i2c_dev->hw->has_single_clk_source) {
@@ -1647,6 +1724,14 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (i2c_dev->slow_clk) {
+		ret = clk_prepare(i2c_dev->slow_clk);
+		if (ret < 0) {
+			dev_err(dev, "failed to prepare slow clock: %d\n", ret);
+			goto unprepare_fast_clk;
+		}
+	}
+
 	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
 	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c_dev->clk_divisor_non_hs_mode =
@@ -1662,7 +1747,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-		goto unprepare_fast_clk;
+		goto unprepare_slow_clk;
 	}
 
 	pm_runtime_irq_safe(&pdev->dev);
@@ -1749,6 +1834,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 unprepare_div_clk:
 	clk_unprepare(i2c_dev->div_clk);
 
+unprepare_slow_clk:
+	if (i2c_dev->is_vi)
+		clk_unprepare(i2c_dev->slow_clk);
+
 unprepare_fast_clk:
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_unprepare(i2c_dev->fast_clk);
@@ -1770,6 +1859,10 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
+
+	if (i2c_dev->slow_clk)
+		clk_unprepare(i2c_dev->slow_clk);
+
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_unprepare(i2c_dev->fast_clk);
 
-- 
2.24.1

