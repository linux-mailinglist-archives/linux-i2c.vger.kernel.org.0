Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7BA260839
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgIHCNn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbgIHCMb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:31 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45E2C0617A9;
        Mon,  7 Sep 2020 19:12:07 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so8278365lfi.12;
        Mon, 07 Sep 2020 19:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DbQyWM7oycl0co92zuB2RA/14+46Ead6WBoTQN24xgA=;
        b=cdS5U2lWgm9VfIcvb82p6jUCNW8fO5lfhQSI4BMacgyXplBlGCCfxqBhxFGHvm6KBR
         3L6LtBgvB7q14vMhuiwSCJnRHgi76qfeGSPc8OotWeVutevKJKuzJywyBVU0w0GpuAMV
         MrSyfUbYxlCNNJfhgEu8QqyDfPzcSaQmVCzU8oUm1ziqzLcdqqWYtgandqYl5k76X1j+
         GIGVOmzHwkH8KLy8PeoyYDqABEVTG4gxQgYlILvEg4uRTLhwKgJrYQj8etj8zwjH0yEu
         3c6dYFF419iec3jj2tVt8tXyVADXWdPSO913+z6LeVRnlA0Iwb1ED14m2xHI4H4yndoj
         XYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DbQyWM7oycl0co92zuB2RA/14+46Ead6WBoTQN24xgA=;
        b=nNuTgY2XnwSL9xZ0bhQ5DMndeAD73eInY/4XGWjqnTQNlfWRHQzr7wNvp/9lpg6QBj
         uv2vn97gILbdRFD2MmldXxg0hCvKgOsgaTDicEt9q7VMZIgpoPWDFgfhOVvbUr3W3Ico
         AAoSjTCAAZ298dhEmworPA3DELTRTfglUW32slDilN2KcCeLC09YLE3nSF6fggJ4toUq
         yV0o5Lu8yq1w4/iNQpngNAzKluD8F+HrWqU65IozBCve4Qop4D6IcaqF9JPWWBik3JGx
         ZImWRhUUAACXn8a+uKKyw9tyJUKgoxol3NUV/tgS2+9uh/vk7hczMUCL8SqEHXJLuHN5
         i7cw==
X-Gm-Message-State: AOAM531sBfkMD7OrD/07TezwJAEzHdemtZs6UN7Febqs1w2HiHbncbUn
        fOc9qY7mwdgHeCTRi7MOuaU=
X-Google-Smtp-Source: ABdhPJygSNtBfq/PNPkYIi3pL007WuF16ob5y5CVjJqtBISWpJifx6xmFZi8xq5CYktEzje5w0UVDQ==
X-Received: by 2002:a19:7fd8:: with SMTP id a207mr11288005lfd.11.1599531126219;
        Mon, 07 Sep 2020 19:12:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 34/35] i2c: tegra: Clean up whitespaces, newlines and indentation
Date:   Tue,  8 Sep 2020 05:10:20 +0300
Message-Id: <20200908021021.9123-35-digetx@gmail.com>
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

Some places in the code are missing newlines or have unnecessary
whitespaces and newlines. This creates inconsistency of the code and
hurts readability. This patch removes the unnecessary and adds necessary
whitespaces / newlines, clears indentation of the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 72 +++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8b2be44cec2f..179d4bb66ae8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -314,6 +314,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, u32 reg)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -373,9 +374,12 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	struct dma_chan *chan;
 
 	dev_dbg(i2c_dev->dev, "starting DMA for length: %zu\n", len);
+
 	reinit_completion(&i2c_dev->dma_complete);
+
 	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
 	chan = i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_chan;
+
 	dma_desc = dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
@@ -387,8 +391,10 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 
 	dma_desc->callback = tegra_i2c_dma_complete;
 	dma_desc->callback_param = i2c_dev;
+
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -557,6 +563,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
 		return err;
 	}
+
 	return 0;
 }
 
@@ -650,8 +657,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
-	clk_multiplier  = tlow + thigh + 2;
-	clk_multiplier *= non_hs_mode + 1;
+	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   i2c_dev->bus_clk_rate * clk_multiplier);
@@ -799,9 +805,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 */
 		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
 		tx_fifo_avail -= words_to_transfer;
+
 		i2c_dev->msg_buf_remaining = buf_remaining;
-		i2c_dev->msg_buf = buf +
-			words_to_transfer * BYTES_PER_FIFO_WORD;
+		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
@@ -914,12 +920,18 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	goto done;
 err:
 	/* mask all interrupts on error */
-	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
-		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
-		I2C_INT_RX_FIFO_DATA_REQ);
+	tegra_i2c_mask_irq(i2c_dev,
+			   I2C_INT_NO_ACK |
+			   I2C_INT_ARBITRATION_LOST |
+			   I2C_INT_PACKET_XFER_COMPLETE |
+			   I2C_INT_TX_FIFO_DATA_REQ |
+			   I2C_INT_RX_FIFO_DATA_REQ);
+
 	if (i2c_dev->hw->supports_bus_clear)
 		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
+
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+
 	if (i2c_dev->is_dvc)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
@@ -960,6 +972,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 		if (i2c_dev->msg_read) {
 			chan = i2c_dev->rx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
+
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 			slv_config.src_maxburst = dma_burst;
@@ -971,6 +984,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 		} else {
 			chan = i2c_dev->tx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
+
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 			slv_config.dst_maxburst = dma_burst;
@@ -1067,6 +1081,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
+
 	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
@@ -1199,7 +1214,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->dma_mode = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
+
+	i2c_dev->dma_mode = xfer_size > I2C_PIO_MODE_PREFERRED_LEN &&
 			    i2c_dev->dma_buf && !i2c_dev->atomic_mode;
 
 	err = tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
@@ -1211,25 +1227,24 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
-					i2c_dev->bus_clk_rate);
+				       i2c_dev->bus_clk_rate);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
+
 	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read) {
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
-						   xfer_size,
-						   DMA_FROM_DEVICE);
+						   xfer_size, DMA_FROM_DEVICE);
+
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err)
 				return err;
-
 		} else {
 			dma_sync_single_for_cpu(i2c_dev->dev,
 						i2c_dev->dma_phys,
-						xfer_size,
-						DMA_TO_DEVICE);
+						xfer_size, DMA_TO_DEVICE);
 		}
 	}
 
@@ -1238,10 +1253,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf, msg->buf, msg->len);
+
 			dma_sync_single_for_device(i2c_dev->dev,
 						   i2c_dev->dma_phys,
-						   xfer_size,
-						   DMA_TO_DEVICE);
+						   xfer_size, DMA_TO_DEVICE);
+
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err)
 				return err;
@@ -1252,6 +1268,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
+
 	if (!i2c_dev->dma_mode) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
@@ -1290,10 +1307,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
 			dma_sync_single_for_cpu(i2c_dev->dev,
 						i2c_dev->dma_phys,
-						xfer_size,
-						DMA_FROM_DEVICE);
-			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
-			       msg->len);
+						xfer_size, DMA_FROM_DEVICE);
+
+			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
 		}
 	}
 
@@ -1380,6 +1396,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1784,11 +1801,11 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adapter);
-
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
 	tegra_i2c_release_clocks(i2c_dev);
+
 	return 0;
 }
 
@@ -1886,15 +1903,14 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 };
 
 static struct platform_driver tegra_i2c_driver = {
-	.probe   = tegra_i2c_probe,
-	.remove  = tegra_i2c_remove,
-	.driver  = {
-		.name  = "tegra-i2c",
+	.probe = tegra_i2c_probe,
+	.remove = tegra_i2c_remove,
+	.driver = {
+		.name = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
-		.pm    = &tegra_i2c_pm,
+		.pm = &tegra_i2c_pm,
 	},
 };
-
 module_platform_driver(tegra_i2c_driver);
 
 MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
-- 
2.27.0

