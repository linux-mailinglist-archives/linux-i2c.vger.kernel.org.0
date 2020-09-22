Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC6A274CC7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgIVWyM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgIVWwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:46 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD18C061755;
        Tue, 22 Sep 2020 15:52:46 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so19847829lfb.6;
        Tue, 22 Sep 2020 15:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ThTwclZVeYawa8Jn7OV2eep74uxeTmmTBAGKwURcq30=;
        b=XrQ+lEWm73U+B5ydvvYPp72fHsawtuooajcDFRC3tTZJNhJpDpOZITYjZwOrXK3L6e
         sN+vHKSCPcvS70GSQC7sNDXn18t0+ulC6MMhJ6hOENAcRODaaVSFbD0xzFwVEDWGvh5C
         XbvmLmcDSn5SRYH9udkyPSVlwbtJPX7B/ypeZypYOQT32zf+fi+yqAWkBN8MasNRr53t
         yIBX0q972jbG1TUw1SY+HkhRKDYIh9jx2D8DC7//2SjmELwvRK4nest7dRdj9+VxvQtW
         aBKgKZXy/XqJHuNmKnJ2PE3fO0XWiQv56Axmfkt9yBjk/mV0Quds6lpXwV165rn/b8e5
         X7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ThTwclZVeYawa8Jn7OV2eep74uxeTmmTBAGKwURcq30=;
        b=Zb+soKYVHoHB1DAMKJib7cg383bL1sB/gaYHsly/VCgdr9KJbyYRgPFk1JiZ014ue6
         qxo0WhrNiQ6ypCN97LSDEc8jhU9j/p7HkC/GnVGJ+tAgrrEb8UzesJ1MCvMIFdOfJOkZ
         uapvvexqtFBjX1djDrB/cYmEhf6eDFbwB3bewM5NdnBLWPAyoMPSLedXsGUHbDi710qn
         vaOZyGEt4rLjHIyqdbqAHb2zqZu91CFScB2ojfnrn6K2GI5vptm3yz2Dp9fRzHgVayej
         iHIzIWJLmObR0FDv9wm/ZRNCBy7axMx27bySjc3z8ps2P3/Re+i3ycQBIZUZioHFoakW
         L4iw==
X-Gm-Message-State: AOAM532ll7tjjOpVcO9slKryF3qx9pTNoYjwA/XZxxHynU7/3q62l1lC
        o2YrP8wehye76lMe095xRGQ=
X-Google-Smtp-Source: ABdhPJxYMdvz8/TtYykRGG/boBS5V/cdtWxURZ/Iq9LmAeEzQ47YnuTzuM0/cTstfluJmIWMOcd3dw==
X-Received: by 2002:a19:4306:: with SMTP id q6mr2570315lfa.147.1600815164484;
        Tue, 22 Sep 2020 15:52:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 15/32] i2c: tegra: Reorder location of functions in the code
Date:   Wed, 23 Sep 2020 01:51:38 +0300
Message-Id: <20200922225155.10798-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder location of functions in the code in order to have definition
of functions closer to the place of the invocation. This change makes
easier to navigate around the code and removes the need to have a
prototype for tegra_i2c_init().

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 486 ++++++++++++++++-----------------
 1 file changed, 242 insertions(+), 244 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 56981a5506ae..990eeb832492 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -288,8 +288,6 @@ struct tegra_i2c_dev {
 	bool is_curr_atomic_xfer;
 };
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev);
-
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
@@ -466,6 +464,56 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	return err;
 }
 
+/*
+ * One of the Tegra I2C blocks is inside the DVC (Digital Voltage Controller)
+ * block.  This block is identical to the rest of the I2C blocks, except that
+ * it only supports master mode, it has registers moved around, and it needs
+ * some extra init to get it into I2C mode.  The register moves are handled
+ * by i2c_readl and i2c_writel
+ */
+static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val;
+
+	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
+	val |= DVC_CTRL_REG3_SW_PROG;
+	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
+	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
+
+	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
+	val |= DVC_CTRL_REG1_INTR_EN;
+	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
+}
+
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
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 mask, val, offset, reg_offset;
@@ -503,198 +551,6 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
-static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
-{
-	u32 val;
-	int rx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
-	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	int words_to_transfer;
-
-	/*
-	 * Catch overflow due to message fully sent
-	 * before the check for RX FIFO availability.
-	 */
-	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
-		return -EINVAL;
-
-	if (i2c_dev->hw->has_mst_fifo) {
-		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
-		rx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
-	} else {
-		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
-		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
-	}
-
-	/* Rounds down to not include partial word at the end of buf */
-	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
-	if (words_to_transfer > rx_fifo_avail)
-		words_to_transfer = rx_fifo_avail;
-
-	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
-
-	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
-	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
-	rx_fifo_avail -= words_to_transfer;
-
-	/*
-	 * If there is a partial word at the end of buf, handle it manually to
-	 * prevent overwriting past the end of buf
-	 */
-	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		/*
-		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
-		 * when (words_to_transfer was > rx_fifo_avail) earlier
-		 * in this function.
-		 */
-		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
-		val = cpu_to_le32(val);
-		memcpy(buf, &val, buf_remaining);
-		buf_remaining = 0;
-		rx_fifo_avail--;
-	}
-
-	/* RX FIFO must be drained, otherwise it's an Overflow case. */
-	if (WARN_ON_ONCE(rx_fifo_avail))
-		return -EINVAL;
-
-	i2c_dev->msg_buf_remaining = buf_remaining;
-	i2c_dev->msg_buf = buf;
-
-	return 0;
-}
-
-static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
-{
-	u32 val;
-	int tx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
-	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	int words_to_transfer;
-
-	if (i2c_dev->hw->has_mst_fifo) {
-		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
-		tx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
-	} else {
-		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
-		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
-	}
-
-	/* Rounds down to not include partial word at the end of buf */
-	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
-
-	/* It's very common to have < 4 bytes, so optimize that case. */
-	if (words_to_transfer) {
-		if (words_to_transfer > tx_fifo_avail)
-			words_to_transfer = tx_fifo_avail;
-
-		/*
-		 * Update state before writing to FIFO.  If this casues us
-		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
-		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
-		 * not maskable).  We need to make sure that the isr sees
-		 * buf_remaining as 0 and doesn't call us back re-entrantly.
-		 */
-		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
-		tx_fifo_avail -= words_to_transfer;
-		i2c_dev->msg_buf_remaining = buf_remaining;
-		i2c_dev->msg_buf = buf +
-			words_to_transfer * BYTES_PER_FIFO_WORD;
-		barrier();
-
-		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
-
-		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
-	}
-
-	/*
-	 * If there is a partial word at the end of buf, handle it manually to
-	 * prevent reading past the end of buf, which could cross a page
-	 * boundary and fault.
-	 */
-	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		/*
-		 * buf_remaining > 3 check not needed as tx_fifo_avail == 0
-		 * when (words_to_transfer was > tx_fifo_avail) earlier
-		 * in this function for non-zero words_to_transfer.
-		 */
-		memcpy(&val, buf, buf_remaining);
-		val = le32_to_cpu(val);
-
-		/* Again update before writing to FIFO to make sure isr sees. */
-		i2c_dev->msg_buf_remaining = 0;
-		i2c_dev->msg_buf = NULL;
-		barrier();
-
-		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
-	}
-
-	return 0;
-}
-
-/*
- * One of the Tegra I2C blocks is inside the DVC (Digital Voltage Controller)
- * block.  This block is identical to the rest of the I2C blocks, except that
- * it only supports master mode, it has registers moved around, and it needs
- * some extra init to get it into I2C mode.  The register moves are handled
- * by i2c_readl and i2c_writel
- */
-static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
-{
-	u32 val;
-
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
-	val |= DVC_CTRL_REG3_SW_PROG;
-	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
-	dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
-
-	val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
-	val |= DVC_CTRL_REG1_INTR_EN;
-	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
-}
-
-static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
-{
-	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
-	if (ret)
-		return ret;
-
-	ret = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
-	if (ret)
-		return ret;
-
-	/*
-	 * VI I2C device is attached to VE power domain which goes through
-	 * power ON/OFF during PM runtime resume/suspend. So, controller
-	 * should go through reset and need to re-initialize after power
-	 * domain ON.
-	 */
-	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev);
-		if (ret)
-			goto disable_clocks;
-	}
-
-	return 0;
-
-disable_clocks:
-	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
-
-	return ret;
-}
-
-static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-{
-	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-
-	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
-
-	return pinctrl_pm_select_idle_state(i2c_dev->dev);
-}
-
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 {
 	unsigned long reg_offset;
@@ -726,35 +582,6 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
-static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
-{
-	u32 value;
-
-	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
-
-	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
-
-	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
-
-	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
-
-	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
-	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
-
-	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
-}
-
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
@@ -882,6 +709,135 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	return tegra_i2c_wait_for_config_load(i2c_dev);
 }
 
+static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val;
+	int rx_fifo_avail;
+	u8 *buf = i2c_dev->msg_buf;
+	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	int words_to_transfer;
+
+	/*
+	 * Catch overflow due to message fully sent
+	 * before the check for RX FIFO availability.
+	 */
+	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
+		return -EINVAL;
+
+	if (i2c_dev->hw->has_mst_fifo) {
+		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
+		rx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
+	} else {
+		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
+		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
+	}
+
+	/* Rounds down to not include partial word at the end of buf */
+	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
+	if (words_to_transfer > rx_fifo_avail)
+		words_to_transfer = rx_fifo_avail;
+
+	i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
+
+	buf += words_to_transfer * BYTES_PER_FIFO_WORD;
+	buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
+	rx_fifo_avail -= words_to_transfer;
+
+	/*
+	 * If there is a partial word at the end of buf, handle it manually to
+	 * prevent overwriting past the end of buf
+	 */
+	if (rx_fifo_avail > 0 && buf_remaining > 0) {
+		/*
+		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
+		 * when (words_to_transfer was > rx_fifo_avail) earlier
+		 * in this function.
+		 */
+		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
+		val = cpu_to_le32(val);
+		memcpy(buf, &val, buf_remaining);
+		buf_remaining = 0;
+		rx_fifo_avail--;
+	}
+
+	/* RX FIFO must be drained, otherwise it's an Overflow case. */
+	if (WARN_ON_ONCE(rx_fifo_avail))
+		return -EINVAL;
+
+	i2c_dev->msg_buf_remaining = buf_remaining;
+	i2c_dev->msg_buf = buf;
+
+	return 0;
+}
+
+static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val;
+	int tx_fifo_avail;
+	u8 *buf = i2c_dev->msg_buf;
+	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	int words_to_transfer;
+
+	if (i2c_dev->hw->has_mst_fifo) {
+		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
+		tx_fifo_avail = FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
+	} else {
+		val = i2c_readl(i2c_dev, I2C_FIFO_STATUS);
+		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
+	}
+
+	/* Rounds down to not include partial word at the end of buf */
+	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
+
+	/* It's very common to have < 4 bytes, so optimize that case. */
+	if (words_to_transfer) {
+		if (words_to_transfer > tx_fifo_avail)
+			words_to_transfer = tx_fifo_avail;
+
+		/*
+		 * Update state before writing to FIFO.  If this casues us
+		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
+		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
+		 * not maskable).  We need to make sure that the isr sees
+		 * buf_remaining as 0 and doesn't call us back re-entrantly.
+		 */
+		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
+		tx_fifo_avail -= words_to_transfer;
+		i2c_dev->msg_buf_remaining = buf_remaining;
+		i2c_dev->msg_buf = buf +
+			words_to_transfer * BYTES_PER_FIFO_WORD;
+		barrier();
+
+		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
+
+		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
+	}
+
+	/*
+	 * If there is a partial word at the end of buf, handle it manually to
+	 * prevent reading past the end of buf, which could cross a page
+	 * boundary and fault.
+	 */
+	if (tx_fifo_avail > 0 && buf_remaining > 0) {
+		/*
+		 * buf_remaining > 3 check not needed as tx_fifo_avail == 0
+		 * when (words_to_transfer was > tx_fifo_avail) earlier
+		 * in this function for non-zero words_to_transfer.
+		 */
+		memcpy(&val, buf, buf_remaining);
+		val = le32_to_cpu(val);
+
+		/* Again update before writing to FIFO to make sure isr sees. */
+		i2c_dev->msg_buf_remaining = 0;
+		i2c_dev->msg_buf = NULL;
+		barrier();
+
+		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
+	}
+
+	return 0;
+}
+
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
 	u32 status;
@@ -1418,27 +1374,6 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
-static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
-{
-	struct device_node *np = i2c_dev->dev->of_node;
-	int ret;
-	bool multi_mode;
-
-	ret = of_property_read_u32(np, "clock-frequency",
-				   &i2c_dev->bus_clk_rate);
-	if (ret)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
-
-	multi_mode = of_property_read_bool(np, "multi-master");
-	i2c_dev->is_multimaster_mode = multi_mode;
-
-	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
-
-	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
-}
-
 static const struct i2c_algorithm tegra_i2c_algo = {
 	.master_xfer		= tegra_i2c_xfer,
 	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
@@ -1644,6 +1579,27 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
+static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
+{
+	struct device_node *np = i2c_dev->dev->of_node;
+	int ret;
+	bool multi_mode;
+
+	ret = of_property_read_u32(np, "clock-frequency",
+				   &i2c_dev->bus_clk_rate);
+	if (ret)
+		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
+
+	multi_mode = of_property_read_bool(np, "multi-master");
+	i2c_dev->is_multimaster_mode = multi_mode;
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
+}
+
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 {
 	int err;
@@ -1819,6 +1775,48 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
+{
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
+	if (ret)
+		return ret;
+
+	/*
+	 * VI I2C device is attached to VE power domain which goes through
+	 * power ON/OFF during PM runtime resume/suspend. So, controller
+	 * should go through reset and need to re-initialize after power
+	 * domain ON.
+	 */
+	if (i2c_dev->is_vi) {
+		ret = tegra_i2c_init(i2c_dev);
+		if (ret)
+			goto disable_clocks;
+	}
+
+	return 0;
+
+disable_clocks:
+	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
+
+	return ret;
+}
+
+static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
+{
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
+
+	return pinctrl_pm_select_idle_state(i2c_dev->dev);
+}
+
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-- 
2.27.0

