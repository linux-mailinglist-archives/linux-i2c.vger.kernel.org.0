Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF09274CA6
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgIVWxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgIVWxB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:53:01 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB37AC061755;
        Tue, 22 Sep 2020 15:53:00 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x69so19852588lff.3;
        Tue, 22 Sep 2020 15:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bx0ZViGhx84rdSjVusVfoATu3CnZ4D4yYOHDa249mmM=;
        b=Hb96+TgvIxdzu/r3SYjHROg7U1Eb1pTvb+6i+QJkkhh/NVPcs+oe366+eLvTSqnSot
         YjTx01I1rzHNUNZsiX0r5ScH71Kp5CXvJvarxBlv2ARALSRFCC6Gq+xtQCw0KxAYDvw+
         ptpGJz45c+j96TzoRGeG6PhyuyFJoiplLCAXAUzIh5SYKJ6dtQ8JrWYLwfvjCm1lMjjs
         0UnFPQfiRAXnm5DEeRa+clc6uXHJpAXFe361oc5h0EDKVGpbtPKqVcoIg6F394j/H68L
         0xMelAveoLmEbrNT3tenBaJejqYn7AQFMOOtap6/D7zk66f9fKAZX9IKrfZ8xC0la3ng
         /WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bx0ZViGhx84rdSjVusVfoATu3CnZ4D4yYOHDa249mmM=;
        b=jog9spgbbzxFe0wpT7mR/aK5dSUKrH/60vwYazCDfX0CftKfH3wQAvYB8lr10btrXq
         7AcVTt9xcyp9rL1bYKn2xAxWinBBhYMNnKQbTjvyAP+i9TwpgLlyaDua5G4w3qecuBgf
         CAIi8JCusz566Dq3ShEmd7qj1UOxKhheRJQZ3rOdnboRXdpvwHa8TNmma8ShtxAPujQE
         D3PQgoPoe1wGRFdwPF3mc8Ldd4ftoKcKXYXk5u8j02c4NeUmcCHoob9kD2AGm+8UjJFF
         GAmMUHBUxfbx5H2xlItSesKwbQOnqUIYw8GjNIy0j70k79KLif7bNN8NrXY/Xkk/8j4U
         3e7Q==
X-Gm-Message-State: AOAM532ycZK+dfnaFoRe0SDahdmKtaW03sIXoNaXQiLLGnldzKzfDhkg
        LVxP1fvPeb/R/Df/b8oZX3w=
X-Google-Smtp-Source: ABdhPJz96u9Itt+76YN3zw+w6VOhR1MPiBE2NtpzFwy+syFrVnenIiA8lCWzOWzDR/cPg4vSXbhr/Q==
X-Received: by 2002:a19:c157:: with SMTP id r84mr2177029lff.34.1600815179008;
        Tue, 22 Sep 2020 15:52:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 30/32] i2c: tegra: Clean up and improve comments
Date:   Wed, 23 Sep 2020 01:51:53 +0300
Message-Id: <20200922225155.10798-31-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make all comments to be consistent in regards to capitalization and
punctuation, correct spelling and grammar errors, improve wording.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 88 ++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6cbcad366b62..ebbfd7ed11c0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -136,7 +136,7 @@
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
-/* Packet header size in bytes */
+/* packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
 
 /*
@@ -148,11 +148,10 @@
 #define I2C_PIO_MODE_PREFERRED_LEN		32
 
 /*
- * msg_end_type: The bus control which need to be send at end of transfer.
- * @MSG_END_STOP: Send stop pulse at end of transfer.
- * @MSG_END_REPEAT_START: Send repeat start at end of transfer.
- * @MSG_END_CONTINUE: The following on message is coming and so do not send
- *		stop or repeat start.
+ * msg_end_type: The bus control which needs to be sent at end of transfer.
+ * @MSG_END_STOP: Send stop pulse.
+ * @MSG_END_REPEAT_START: Send repeat-start.
+ * @MSG_END_CONTINUE: Don't send stop or repeat-start.
  */
 enum msg_end_type {
 	MSG_END_STOP,
@@ -161,10 +160,10 @@ enum msg_end_type {
 };
 
 /**
- * struct tegra_i2c_hw_feature : Different HW support on Tegra
- * @has_continue_xfer_support: Continue transfer supports.
+ * struct tegra_i2c_hw_feature : per hardware generation features
+ * @has_continue_xfer_support: continue-transfer supported
  * @has_per_pkt_xfer_complete_irq: Has enable/disable capability for transfer
- *		complete interrupt per packet basis.
+ *		completion interrupt on per packet basis.
  * @has_config_load_reg: Has the config load register to load the new
  *		configuration.
  * @clk_divisor_hs_mode: Clock divisor in HS mode.
@@ -184,7 +183,7 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
- * @quirks: i2c adapter quirks for limiting write/read transfer size and not
+ * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
  *		SDA stuck low from device for some unknown reasons.
@@ -245,7 +244,7 @@ struct tegra_i2c_hw_feature {
  * @msg_err: error code for completed message
  * @msg_buf: pointer to current message data
  * @msg_buf_remaining: size of unsent data in the message buffer
- * @msg_read: identifies read transfers
+ * @msg_read: indicates that the transfer is a read access
  * @bus_clk_rate: current I2C bus clock rate
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
  * @tx_dma_chan: DMA transmit channel
@@ -307,8 +306,8 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 }
 
 /*
- * i2c_writel and i2c_readl will offset the register if necessary to talk
- * to the I2C block inside the DVC block
+ * If necessary, i2c_writel() and i2c_readl() will offset the register
+ * in order to talk to the I2C block inside the DVC block.
  */
 static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 {
@@ -323,7 +322,7 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
 {
 	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 
-	/* Read back register to make sure that register writes completed */
+	/* read back register to make sure that register writes completed */
 	if (reg != I2C_TX_FIFO)
 		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
 }
@@ -475,7 +474,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
  * block.  This block is identical to the rest of the I2C blocks, except that
  * it only supports master mode, it has registers moved around, and it needs
  * some extra init to get it into I2C mode.  The register moves are handled
- * by i2c_readl and i2c_writel
+ * by i2c_readl() and i2c_writel().
  */
 static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 {
@@ -633,7 +632,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		break;
 	}
 
-	/* Make sure clock divisor programmed correctly */
+	/* make sure clock divisor programmed correctly */
 	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
 				 i2c_dev->hw->clk_divisor_hs_mode) |
 		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
@@ -646,8 +645,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	/*
-	 * configure setup and hold times only when tsu_thd is non-zero.
-	 * otherwise, preserve the chip default values
+	 * Configure setup and hold times only when tsu_thd is non-zero.
+	 * Otherwise, preserve the chip default values.
 	 */
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
@@ -691,7 +690,7 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
 
 	/*
 	 * NACK interrupt is generated before the I2C controller generates
-	 * the STOP condition on the bus. So wait for 2 clock periods
+	 * the STOP condition on the bus.  So, wait for 2 clock periods
 	 * before disabling the controller so that the STOP condition has
 	 * been delivered properly.
 	 */
@@ -712,8 +711,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 
 	/*
-	 * Catch overflow due to message fully sent
-	 * before the check for RX FIFO availability.
+	 * Catch overflow due to message fully sent before the check for
+	 * RX FIFO availability.
 	 */
 	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
 		return -EINVAL;
@@ -726,7 +725,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_RX, val);
 	}
 
-	/* Rounds down to not include partial word at the end of buf */
+	/* round down to exclude partial word at the end of buffer */
 	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
 	if (words_to_transfer > rx_fifo_avail)
 		words_to_transfer = rx_fifo_avail;
@@ -738,8 +737,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	rx_fifo_avail -= words_to_transfer;
 
 	/*
-	 * If there is a partial word at the end of buf, handle it manually to
-	 * prevent overwriting past the end of buf
+	 * If there is a partial word at the end of buffer, handle it
+	 * manually to prevent overwriting past the end of buffer.
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
 		/*
@@ -779,10 +778,15 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		tx_fifo_avail = FIELD_GET(I2C_FIFO_STATUS_TX, val);
 	}
 
-	/* Rounds down to not include partial word at the end of buf */
+	/* round down to exclude partial word at the end of buffer */
 	words_to_transfer = buf_remaining / BYTES_PER_FIFO_WORD;
 
-	/* It's very common to have < 4 bytes, so optimize that case. */
+	/*
+	 * This hunk pushes 4 bytes at a time into the TX FIFO.
+	 *
+	 * It's very common to have < 4 bytes, hence there is no word
+	 * to push if we have less than 4 bytes to transfer.
+	 */
 	if (words_to_transfer) {
 		if (words_to_transfer > tx_fifo_avail)
 			words_to_transfer = tx_fifo_avail;
@@ -806,8 +810,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	/*
-	 * If there is a partial word at the end of buf, handle it manually to
-	 * prevent reading past the end of buf, which could cross a page
+	 * If there is a partial word at the end of buffer, handle it manually
+	 * to prevent reading past the end of buffer, which could cross a page
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
@@ -855,7 +859,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	/*
-	 * I2C transfer is terminated during the bus clear so skip
+	 * I2C transfer is terminated during the bus clear, so skip
 	 * processing the other interrupts.
 	 */
 	if (i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE))
@@ -891,7 +895,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	 * During message read XFER_COMPLETE interrupt is triggered prior to
 	 * DMA completion and during message write XFER_COMPLETE interrupt is
 	 * triggered after DMA completion.
-	 * PACKETS_XFER_COMPLETE indicates completion of all bytes of transfer.
+	 *
+	 * PACKETS_XFER_COMPLETE indicates completion of all bytes of transfer,
 	 * so forcing msg_buf_remaining to 0 in DMA mode.
 	 */
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
@@ -909,7 +914,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 	goto done;
 err:
-	/* An error occurred, mask all interrupts */
+	/* mask all interrupts on error */
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
 		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
 		I2C_INT_RX_FIFO_DATA_REQ);
@@ -1332,6 +1337,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		enum msg_end_type end_type = MSG_END_STOP;
 
 		if (i < (num - 1)) {
+			/* check whether follow up message is coming */
 			if (msgs[i + 1].flags & I2C_M_NOSTART)
 				end_type = MSG_END_CONTINUE;
 			else
@@ -1561,7 +1567,6 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 };
 
-/* Match table for of_platform binding */
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
@@ -1585,7 +1590,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	err = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
 	if (err)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
+		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
@@ -1718,11 +1723,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto release_clocks;
 
 	/*
-	 * VI I2C is in VE power domain which is not always on and not
-	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
-	 * safe domain as it prevents powering off the PM domain.
-	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
-	 * not be used for atomic transfers.
+	 * VI I2C is in VE power domain which is not always ON and not
+	 * IRQ-safe.  Thus, IRQ-safe device shouldn't be attached to a
+	 * non IRQ-safe domain because this prevents powering off the power
+	 * domain.
+	 *
+	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
+	 * be used for atomic transfers.
 	 */
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(i2c_dev->dev);
@@ -1793,9 +1800,8 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 
 	/*
 	 * VI I2C device is attached to VE power domain which goes through
-	 * power ON/OFF during PM runtime resume/suspend. So, controller
-	 * should go through reset and need to re-initialize after power
-	 * domain ON.
+	 * power ON/OFF during runtime PM resume/suspend, meaning that
+	 * controller needs to be re-initialized after power ON.
 	 */
 	if (i2c_dev->is_vi) {
 		err = tegra_i2c_init(i2c_dev);
-- 
2.27.0

