Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F44125B7C8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgICAyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgICAyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DCDC061246;
        Wed,  2 Sep 2020 17:54:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so1415791ljo.5;
        Wed, 02 Sep 2020 17:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DBMpRTsDKoEtZa8d3VMxV0RyURLZJ1LTPHjdCaFtbaA=;
        b=S/4DaMv/Q6FClY8Fxbst4ssvGlkFTwWtIrvzOy4M3mo65nkVLivsLyCI3bIVo9KVtU
         cG2fSTm8wulJC6w5zrdzewRRSg+F276BOGzXbGFOu4WawmX7SwamlPkYgi5lFk4wH/OV
         vbEGAnMOF5tOZhY6660Yi1Z/9XqHpkN0ioQDDEnu/jM5Sg3/NSOX7Hw12iwPs6arhlBi
         d8GAx9lkDiVBtWAt/2fsjwwU+KBZYkawZGk7WLviWGvwuy36s7cjIiHZo4f1jiiVw3Mq
         GxlYMHRHQppN0647kNZdj8l5Hgjv/8Tcy7qAw8lMogtqyM7677BNUQVBDpZ+Ej+g/A/7
         210w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DBMpRTsDKoEtZa8d3VMxV0RyURLZJ1LTPHjdCaFtbaA=;
        b=Uxh1E5H9J1b0gSNP40u/7BjteNFU4AgrMU475jG/BIbKBr3Jqg1EnNO5krMOguJfZw
         UHxwL5tiXKBR5h75v7HtXtKD5fC40iaMdJN0QMovx2CkFv3Z7H4pxIi/fihONXRFKFS8
         DQBN/ZwcA1TerN5U9RcwFgrpuQiJPIRP2PHUJzKH44+6srmgcJM1Zo1EWQIbvAKj4Uwv
         4CdqADPCZrefBpFI9uB46gzuqisL1rC55+nUDI4TIw/lkkjakppGDKe9egTKW0Bhy/UD
         PlmlKVCojdDR7AnaUoABXNy0kOvYUa4TL7MFnl08R7ynGJVOP0oispohNKIf7r1/W7IZ
         EWpQ==
X-Gm-Message-State: AOAM530NZZKXL7WDcfiZV2Wzdcuz9D2NnaopustaDMfnW5ullf3od8Rs
        Y046QLY3/B2kQtqXEt/ULak=
X-Google-Smtp-Source: ABdhPJyiDGqx212vYKnAE/CEKNrG7OWhce9E9dQB1asOz6pY5+42WCrlcUCq6dtfCOCIYSHF+UCglQ==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr231086ljj.461.1599094448323;
        Wed, 02 Sep 2020 17:54:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/22] i2c: tegra: Reorder location of functions in the code
Date:   Thu,  3 Sep 2020 03:52:56 +0300
Message-Id: <20200903005300.7894-19-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reorder location of functions in the code in order to have definition
of functions closer to the place of the invocation. This change makes
easier to navigate around the code and removes the need to have a
prototype for tegra_i2c_init().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 550 ++++++++++++++++-----------------
 1 file changed, 274 insertions(+), 276 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 5b37435fa36d..f30ac45c2bfd 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -293,8 +293,6 @@ struct tegra_i2c_dev {
 	bool is_curr_atomic_xfer;
 };
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit);
-
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
 {
@@ -473,186 +471,6 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	return err;
 }
 
-static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
-{
-	ktime_t ktime, ktimeout;
-	unsigned int offset;
-	u32 mask, val;
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
-	/*
-	 * ktime_get() may take up to couple milliseconds in a worst case
-	 * and normally FIFOs are flushed, hence let's check the state before
-	 * proceeding to polling.
-	 */
-	if (!(i2c_readl(i2c_dev, offset) & mask))
-		return 0;
-
-	ktime = ktime_get();
-	ktimeout = ktime_add_ms(ktime, 1000);
-
-	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (ktime_after(ktime, ktimeout))
-			goto err_timeout;
-
-		if (i2c_dev->is_curr_atomic_xfer)
-			mdelay(1);
-		else
-			fsleep(1000);
-
-		ktime = ktime_get();
-	}
-
-	return 0;
-
-err_timeout:
-	dev_err(i2c_dev->dev, "FIFO flushing timed out\n");
-
-	return -ETIMEDOUT;
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
 /*
  * One of the Tegra I2C blocks is inside the DVC (Digital Voltage Controller)
  * block.  This block is identical to the rest of the I2C blocks, except that
@@ -674,66 +492,33 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
 }
 
-static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
+static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 {
-	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int ret;
-
-	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
-	if (ret)
-		return ret;
-
-	ret = clk_enable(i2c_dev->fast_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable fast clock: %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_enable(i2c_dev->slow_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable slow clock: %d\n", ret);
-		goto disable_fast_clk;
-	}
-
-	ret = clk_enable(i2c_dev->div_clk);
-	if (ret) {
-		dev_err(dev, "failed to enable div clock: %d\n", ret);
-		goto disable_slow_clk;
-	}
-
-	/*
-	 * VI I2C device is attached to VE power domain which goes through
-	 * power ON/OFF during PM runtime resume/suspend. So, controller
-	 * should go through reset and need to re-initialize after power
-	 * domain ON.
-	 */
-	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev, true);
-		if (ret)
-			goto disable_div_clk;
-	}
+	u32 value;
 
-	return 0;
+	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
+	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
 
-disable_div_clk:
-	clk_disable(i2c_dev->div_clk);
-disable_slow_clk:
-	clk_disable(i2c_dev->slow_clk);
-disable_fast_clk:
-	clk_disable(i2c_dev->fast_clk);
+	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
+		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
+	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
 
-	return ret;
-}
+	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
+	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
 
-static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-{
-	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
+		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
+	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
 
-	clk_disable(i2c_dev->div_clk);
-	clk_disable(i2c_dev->slow_clk);
-	clk_disable(i2c_dev->fast_clk);
+	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
+	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
 
-	return pinctrl_pm_select_idle_state(i2c_dev->dev);
+	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
 }
 
 static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
@@ -765,33 +550,55 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
-static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 value;
+	ktime_t ktime, ktimeout;
+	unsigned int offset;
+	u32 mask, val;
 
-	value = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
+	if (i2c_dev->hw->has_mst_fifo) {
+		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
+		       I2C_MST_FIFO_CONTROL_RX_FLUSH;
+		offset = I2C_MST_FIFO_CONTROL;
+	} else {
+		mask = I2C_FIFO_CONTROL_TX_FLUSH |
+		       I2C_FIFO_CONTROL_RX_FLUSH;
+		offset = I2C_FIFO_CONTROL;
+	}
 
-	value = FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
-		FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
-	i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
+	val = i2c_readl(i2c_dev, offset);
+	val |= mask;
+	i2c_writel(i2c_dev, val, offset);
+
+	/*
+	 * ktime_get() may take up to couple milliseconds in a worst case
+	 * and normally FIFOs are flushed, hence let's check the state before
+	 * proceeding to polling.
+	 */
+	if (!(i2c_readl(i2c_dev, offset) & mask))
+		return 0;
+
+	ktime = ktime_get();
+	ktimeout = ktime_add_ms(ktime, 1000);
+
+	while (i2c_readl(i2c_dev, offset) & mask) {
+		if (ktime_after(ktime, ktimeout))
+			goto err_timeout;
 
-	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
+		if (i2c_dev->is_curr_atomic_xfer)
+			mdelay(1);
+		else
+			fsleep(1000);
 
-	value = FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
-		FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
-	i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
+		ktime = ktime_get();
+	}
 
-	value = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND;
-	i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
+	return 0;
 
-	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
+err_timeout:
+	dev_err(i2c_dev->dev, "FIFO flushing timed out\n");
+
+	return -ETIMEDOUT;
 }
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
@@ -903,6 +710,135 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
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
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
@@ -1454,27 +1390,6 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
-static int tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
-{
-	struct device_node *np = i2c_dev->dev->of_node;
-	u32 bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
-	bool multi_mode;
-
-	of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
-	i2c_dev->bus_clk_rate = bus_clk_rate;
-
-	multi_mode = of_property_read_bool(np, "multi-master");
-	i2c_dev->is_multimaster_mode = multi_mode;
-
-	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
-
-	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
-
-	return 0;
-}
-
 static const struct i2c_algorithm tegra_i2c_algo = {
 	.master_xfer		= tegra_i2c_xfer,
 	.master_xfer_atomic	= tegra_i2c_xfer_atomic,
@@ -1687,6 +1602,27 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
+static int tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
+{
+	struct device_node *np = i2c_dev->dev->of_node;
+	u32 bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
+	bool multi_mode;
+
+	of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
+	i2c_dev->bus_clk_rate = bus_clk_rate;
+
+	multi_mode = of_property_read_bool(np, "multi-master");
+	i2c_dev->is_multimaster_mode = multi_mode;
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
+
+	return 0;
+}
+
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 {
 	const struct tegra_i2c_hw_feature *hw = i2c_dev->hw;
@@ -1930,6 +1866,68 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
+	ret = clk_enable(i2c_dev->fast_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable fast clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_enable(i2c_dev->slow_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable slow clock: %d\n", ret);
+		goto disable_fast_clk;
+	}
+
+	ret = clk_enable(i2c_dev->div_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable div clock: %d\n", ret);
+		goto disable_slow_clk;
+	}
+
+	/*
+	 * VI I2C device is attached to VE power domain which goes through
+	 * power ON/OFF during PM runtime resume/suspend. So, controller
+	 * should go through reset and need to re-initialize after power
+	 * domain ON.
+	 */
+	if (i2c_dev->is_vi) {
+		ret = tegra_i2c_init(i2c_dev, true);
+		if (ret)
+			goto disable_div_clk;
+	}
+
+	return 0;
+
+disable_div_clk:
+	clk_disable(i2c_dev->div_clk);
+disable_slow_clk:
+	clk_disable(i2c_dev->slow_clk);
+disable_fast_clk:
+	clk_disable(i2c_dev->fast_clk);
+
+	return ret;
+}
+
+static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
+{
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+
+	clk_disable(i2c_dev->div_clk);
+	clk_disable(i2c_dev->slow_clk);
+	clk_disable(i2c_dev->fast_clk);
+
+	return pinctrl_pm_select_idle_state(i2c_dev->dev);
+}
+
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-- 
2.27.0

