Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E03426082F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgIHCMp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728307AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D04C06179A;
        Mon,  7 Sep 2020 19:11:52 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d15so7418450lfq.11;
        Mon, 07 Sep 2020 19:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M6ZLkoHlcSCDifvVCVlDKrSGw2O9flrYXIfshk6+Wt8=;
        b=gDpYuigXrn+iEY6E2yFlb1apV4/793dm2Wy30xgsJeH/aI6RUQOTkvXpHluNhL5GT3
         4S0hnrhWG8kQtcIoOnp+aBb+33TMV0KFeKm9rud4brXZHoIsmWIsSJxK0ziqWYI0Xx0c
         mqKiNWsFt5agHGK+rZqlgQewiLSd/aPtNO5bMH5SFelMh3bFl1HE4JIJTfps5pvxAmhx
         mnQEe7eytDbGN7chBs7IieWbGCIQ+bj2wZw6mDEF8xIgohs/yxmgL0jR2+kHevZuvcDK
         euEOCSD8oHtC3BgxAOUynORdza7jEBzIY4bt/8zGESY2inefAu6SauhvLqyHKd0gxwJ5
         WZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M6ZLkoHlcSCDifvVCVlDKrSGw2O9flrYXIfshk6+Wt8=;
        b=q1n+2EY1Y4KfBqKE0K/CR/lNC9YJEoDyd1+NLzmKpOgT+D58Z98Si7kVbfLQqBodXf
         i6Rw4pt+L1Y6mD2T65pPLQLiQKYlLN9R02a0hZ18/mwaMnE27+CIvFRpvhWGR/ibWTBc
         jV9074jZikmgLb9RKWO0r7/b+xzZKp9XRBHgyFQkpyYUoYoeO2g3hrYE/Bslxwfcr8iA
         ltRE8bY/LKdn7C9QGyOH6WmdCHGGmnAk3mU8iK7C7FYkHYZrzV6hYV5kR3DDaYkd3KfU
         /Uc1ta7WhkdkhULo0QQE5A6XLrbA3ZB8B7dtGg0hX8U0kVsoFQj4so9H1kZDPxT0y83c
         iFQw==
X-Gm-Message-State: AOAM531DAYR60VRAUun2ePCPRHCBy3pqju+ITOTLE/5VeVNcNjgzEwtd
        KMwdBdGX42vlFUuqFY1KlYw=
X-Google-Smtp-Source: ABdhPJxDp1cNZ5FeYoQrtWsioxZFjuOqSt0XLQHApSIN3hRrFZhvh/qBkGfux7qU4EKgnBe7O2h1cg==
X-Received: by 2002:a19:7d8b:: with SMTP id y133mr2575409lfc.152.1599531110419;
        Mon, 07 Sep 2020 19:11:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/35] i2c: tegra: Reorder location of functions in the code
Date:   Tue,  8 Sep 2020 05:10:02 +0300
Message-Id: <20200908021021.9123-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 486 ++++++++++++++++-----------------
 1 file changed, 242 insertions(+), 244 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8ab31f8100a8..542436cb7823 100644
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
-	unsigned int rx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
-	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	unsigned int words_to_transfer;
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
-	unsigned int tx_fifo_avail;
-	u8 *buf = i2c_dev->msg_buf;
-	size_t buf_remaining = i2c_dev->msg_buf_remaining;
-	unsigned int words_to_transfer;
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
+	unsigned int rx_fifo_avail;
+	u8 *buf = i2c_dev->msg_buf;
+	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	unsigned int words_to_transfer;
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
+	unsigned int tx_fifo_avail;
+	u8 *buf = i2c_dev->msg_buf;
+	size_t buf_remaining = i2c_dev->msg_buf_remaining;
+	unsigned int words_to_transfer;
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

