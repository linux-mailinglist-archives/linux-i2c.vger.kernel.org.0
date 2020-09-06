Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B913A25EFB4
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgIFSx4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729211AbgIFSwF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:05 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7604BC061798;
        Sun,  6 Sep 2020 11:52:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so13555840ljk.8;
        Sun, 06 Sep 2020 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7bFqyavMxhkSDCjkTabphogGkLXTOQjXyiBQcykL62s=;
        b=I8TdskmokCnNFj2iU8uboP77ipPQVEj+vKk3PPlFgCJVXc9TDzuNbjxNK7ewI8xlon
         uBlNAzJjFSKATaW+HSHShKUxOvO5egdsZQ7Z92IX8qx0NRKJRm82+uGstjPL8T+MlB2J
         AxOg19iFHJyOck9zwEyu4GrNcA5iDCiwXVQFjQYhBKWe+BfBpm3hiJZEYGOvY7J+XZQW
         oaWCLCkA0PDstRfYHwV01GEUz3nW+GxglTTODrovNZUSOAuY+kIDGrR4JuS0t94o7/zw
         zb8hCcTS6agyAE0ooBrugY/hyjZZxvjNQjdoL+S3HVa5inOEdCrSia3cl8KdHZVFAfsK
         +PFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7bFqyavMxhkSDCjkTabphogGkLXTOQjXyiBQcykL62s=;
        b=Y23mIJgUvXwiLZPb05FyoIKOkY1HPiFrTyPkAIc8HFq4P1vTvjl2BtPV6W38XpXrKx
         UuhRrlOr/uPvymsTJDbIuUPNH9u50Rvl7WcjP24Urqrfi5IYbYwwPy2DlC2UYm43MB8b
         OMGCo2g/lkM4xzbZauVtc1BBryQkYtthHfcxa1cHcssMXi9GguQvxG9UdiSxQp3D25Xf
         R32J2fT2LASW/YwbIcNwpX2HhhJhYMOwLnGyJHl7Tnrli0BytGyVahAD++hN8/SUtpBH
         nlaNk3YUXD74UkZODb0yR80EGro44Khki2/k5c6M7o/fvD94VCiXyku7Y/AWE0wvHysP
         jbaQ==
X-Gm-Message-State: AOAM532qrlmeXGz988/ldrf3saE/8i9wFdgsqCvzRb2m+yaD3vywITMa
        +UoGbpYvorKcqVf6ym3lSSjyGxxYAro=
X-Google-Smtp-Source: ABdhPJwjDrAsyrv+xco184D0XbJmdD96yU/RD+DkSboOnkOXHaolmTO8M5xrpDLbVqgU+SrYA3uF+g==
X-Received: by 2002:a2e:330e:: with SMTP id d14mr6014546ljc.12.1599418322793;
        Sun, 06 Sep 2020 11:52:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 27/36] i2c: tegra: Reorder location of functions in the code
Date:   Sun,  6 Sep 2020 21:50:30 +0300
Message-Id: <20200906185039.22700-28-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder location of functions in the code in order to have definition
of functions closer to the place of the invocation. This change makes
easier to navigate around the code and removes the need to have a
prototype for tegra_i2c_init().

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 482 ++++++++++++++++-----------------
 1 file changed, 240 insertions(+), 242 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 5fe138ead45e..d34b6bb295b9 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -288,8 +288,6 @@ struct tegra_i2c_dev {
 	bool is_curr_atomic_xfer;
 };
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev);
-
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
 {
 	writel_relaxed(val, i2c_dev->base + reg);
@@ -463,174 +461,6 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	return err;
 }
 
-static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
-				   u32 reg, u32 mask, u32 delay_us,
-				   u32 timeout_us)
-{
-	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
-	u32 val;
-
-	if (!i2c_dev->is_curr_atomic_xfer)
-		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
-						  delay_us, timeout_us);
-
-	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
-						 delay_us, timeout_us);
-}
-
-static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
-{
-	u32 mask, val, offset;
-	int err;
-
-	if (i2c_dev->hw->has_mst_fifo) {
-		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
-		       I2C_MST_FIFO_CONTROL_RX_FLUSH;
-		offset = I2C_MST_FIFO_CONTROL;
-	} else {
-		mask = I2C_FIFO_CONTROL_TX_FLUSH |
-		       I2C_FIFO_CONTROL_RX_FLUSH;
-		offset = I2C_FIFO_CONTROL;
-	}
-
-	val = i2c_readl(i2c_dev, offset);
-	val |= mask;
-	i2c_writel(i2c_dev, val, offset);
-
-	err = tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000);
-	if (err) {
-		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
-		return err;
-	}
-	return 0;
-}
-
-static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
-{
-	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	u8 *buf = i2c_dev->msg_buf;
-	int words_to_transfer;
-	int rx_fifo_avail;
-	u32 val;
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
-	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	u8 *buf = i2c_dev->msg_buf;
-	int words_to_transfer;
-	int tx_fifo_avail;
-	u32 val;
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
-		 * Update state before writing to FIFO.  Note that this may
-		 * cause us to finish writing all bytes (AKA buf_remaining
-		 * goes to 0), hence we have a potential for an interrupt
-		 * (PACKET_XFER_COMPLETE is not maskable), but GIC interrupt
-		 * is disabled at this point.
-		 */
-		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
-		tx_fifo_avail -= words_to_transfer;
-		i2c_dev->msg_buf_remaining = buf_remaining;
-		i2c_dev->msg_buf = buf +
-			words_to_transfer * BYTES_PER_FIFO_WORD;
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
-		i2c_dev->msg_buf_remaining = 0;
-		i2c_dev->msg_buf = NULL;
-
-		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
-	}
-
-	return 0;
-}
-
 /*
  * One of the Tegra I2C blocks is inside the DVC (Digital Voltage Controller)
  * block.  This block is identical to the rest of the I2C blocks, except that
@@ -652,46 +482,48 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
 }
 
-static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
+static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 {
-	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int ret;
+	u32 value;
 
-	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
-	if (ret)
-		return ret;
+	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
+	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
 
-	ret = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
-	if (ret)
-		return ret;
+	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
+	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
 
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
+	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
+	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
 
-	return 0;
+	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
+	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
 
-disable_clocks:
-	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
+	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
+	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
 
-	return ret;
+	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
 }
 
-static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
+static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
+				   u32 reg, u32 mask, u32 delay_us,
+				   u32 timeout_us)
 {
-	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
+	u32 val;
 
-	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
+	if (!i2c_dev->is_curr_atomic_xfer)
+		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						  delay_us, timeout_us);
 
-	return pinctrl_pm_select_idle_state(i2c_dev->dev);
+	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+						 delay_us, timeout_us);
 }
 
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
@@ -713,33 +545,31 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
-static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
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
+	u32 mask, val, offset;
+	int err;
 
-	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
+	if (i2c_dev->hw->has_mst_fifo) {
+		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
+		       I2C_MST_FIFO_CONTROL_RX_FLUSH;
+		offset = I2C_MST_FIFO_CONTROL;
+	} else {
+		mask = I2C_FIFO_CONTROL_TX_FLUSH |
+		       I2C_FIFO_CONTROL_RX_FLUSH;
+		offset = I2C_FIFO_CONTROL;
+	}
 
-	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
-	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
+	val = i2c_readl(i2c_dev, offset);
+	val |= mask;
+	i2c_writel(i2c_dev, val, offset);
 
-	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
+	err = tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
+		return err;
+	}
+	return 0;
 }
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
@@ -856,6 +686,132 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 	return tegra_i2c_wait_for_config_load(i2c_dev);
 }
 
+static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
+{
+	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	u8 *buf = i2c_dev->msg_buf;
+	int words_to_transfer;
+	int rx_fifo_avail;
+	u32 val;
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
+	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	u8 *buf = i2c_dev->msg_buf;
+	int words_to_transfer;
+	int tx_fifo_avail;
+	u32 val;
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
+		 * Update state before writing to FIFO.  Note that this may
+		 * cause us to finish writing all bytes (AKA buf_remaining
+		 * goes to 0), hence we have a potential for an interrupt
+		 * (PACKET_XFER_COMPLETE is not maskable), but GIC interrupt
+		 * is disabled at this point.
+		 */
+		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
+		tx_fifo_avail -= words_to_transfer;
+		i2c_dev->msg_buf_remaining = buf_remaining;
+		i2c_dev->msg_buf = buf +
+			words_to_transfer * BYTES_PER_FIFO_WORD;
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
+		i2c_dev->msg_buf_remaining = 0;
+		i2c_dev->msg_buf = NULL;
+
+		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
+	}
+
+	return 0;
+}
+
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
@@ -1411,27 +1367,6 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
-static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
-{
-	struct device_node *np = i2c_dev->dev->of_node;
-	bool multi_mode;
-	int ret;
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
@@ -1637,6 +1572,27 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
+static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
+{
+	struct device_node *np = i2c_dev->dev->of_node;
+	bool multi_mode;
+	int ret;
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
 	unsigned int i;
@@ -1821,6 +1777,48 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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

