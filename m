Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94D927DBBB
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgI2WVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbgI2WVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:10 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19EBC0613DF;
        Tue, 29 Sep 2020 15:21:08 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v23so5364084ljd.1;
        Tue, 29 Sep 2020 15:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yEIPc4GGKVuqRV861s3TB7ljzUA+eqaRNwu4yrhHocE=;
        b=vAW0xjdumMqyToNKMbJhrGDr+4yqe2tRInEYGX66MJAq/5aBQi38q0ho2JA0xTartm
         bgwJt4bYVFwJxu7gtuTZgX9CD667fkgcxliGOze2YkI+qPlACnBBnSweASeFnVh0HAYM
         WJNreMeZaLf4BnxiRSGj4r2P+kv5lwpPsA5wiNHBP4Qjd3RJJRFB1VzIzse3OpopkpLl
         gAbwzfdRxSTBU1yOt3eTlB3leeASqvuT5x4aovx02GAgMIqjGbMHEImXQy0fkAd5wOjX
         0qforVUVLgV5Nl6XkBFaRuNitccfdwsL7CT6kvStiN5nllr/Z5eiP3EOxdw2//nysgCM
         aP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yEIPc4GGKVuqRV861s3TB7ljzUA+eqaRNwu4yrhHocE=;
        b=RzjpnBfWTM3ITfJqI3eKU8WdObj7p2JCE2hUsXVqGYk6VTiz+cCk8GNITHJMpfEuku
         FItpNFLcVm7BV2nd8f/BnBBHcFGhS6HXQu5yJgdytAIKqWIJds34jrrSV6l0Lpa69mr7
         DJFaRIXrZfYBFm9/33K3clYrpaj2uJnaRWcj5G1iKtVNrJ0pGYXek4WR7SYMOfh5ofk0
         s5GWxz3gkLUBf7XKpaeF8wqjsFqAq4pAEIc8bK13J+QVCSj1sENLaUzkvpY/VZSl0qH3
         UJ3xITePm0sH/oDTmMChsOtMtlReKCofUnlqWf7OFttkxBlSKOx7444sKfsERW2FWa0s
         BHaA==
X-Gm-Message-State: AOAM531bw/sKUuxFKe7zHp/cwpHf2Scb/FoMZdU+AOVgt9J5N6hQraHP
        +Ve9HWNV92v70wWVDnrBB9w=
X-Google-Smtp-Source: ABdhPJx6j0XNUXSkpEc6mdqr9RFzDGFaWxG1oq4jvuw1dkFzkygxNPO1b4C/hyFg0smElapbQv+hEw==
X-Received: by 2002:a2e:9457:: with SMTP id o23mr1718599ljh.71.1601418067039;
        Tue, 29 Sep 2020 15:21:07 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:21:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 31/32] i2c: tegra: Clean up whitespaces, newlines and indentation
Date:   Wed, 30 Sep 2020 01:19:14 +0300
Message-Id: <20200929221915.10979-32-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the code are missing newlines or have unnecessary
whitespaces and newlines. This creates inconsistency of the code and
hurts readability. This patch removes the unnecessary and adds necessary
whitespaces / newlines, clears indentation of the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 73 +++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 194c9ec84713..b88b38a45fb5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -315,6 +315,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -374,9 +375,12 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
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
@@ -388,8 +392,10 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 
 	dma_desc->callback = tegra_i2c_dma_complete;
 	dma_desc->callback_param = i2c_dev;
+
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -456,6 +462,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 	i2c_dev->dma_buf = dma_buf;
 	i2c_dev->dma_phys = dma_phys;
+
 	return 0;
 
 err_out:
@@ -558,6 +565,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
 		return err;
 	}
+
 	return 0;
 }
 
@@ -651,8 +659,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
-	clk_multiplier  = tlow + thigh + 2;
-	clk_multiplier *= non_hs_mode + 1;
+	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
 			   i2c_dev->bus_clk_rate * clk_multiplier);
@@ -800,9 +807,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 */
 		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
 		tx_fifo_avail -= words_to_transfer;
+
 		i2c_dev->msg_buf_remaining = buf_remaining;
-		i2c_dev->msg_buf = buf +
-			words_to_transfer * BYTES_PER_FIFO_WORD;
+		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
@@ -915,12 +922,18 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
 
@@ -962,6 +975,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		if (i2c_dev->msg_read) {
 			chan = i2c_dev->rx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_RX_FIFO);
+
 			slv_config.src_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 			slv_config.src_maxburst = dma_burst;
@@ -973,6 +987,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		} else {
 			chan = i2c_dev->tx_dma_chan;
 			reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
+
 			slv_config.dst_addr = i2c_dev->base_phys + reg_offset;
 			slv_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 			slv_config.dst_maxburst = dma_burst;
@@ -988,6 +1003,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		if (err) {
 			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
+
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->dma_mode = false;
 		} else {
@@ -1069,6 +1085,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
+
 	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
@@ -1200,7 +1217,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
-	i2c_dev->dma_mode = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
+
+	i2c_dev->dma_mode = xfer_size > I2C_PIO_MODE_PREFERRED_LEN &&
 			    i2c_dev->dma_buf && !i2c_dev->atomic_mode;
 
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
@@ -1210,25 +1228,24 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1238,10 +1255,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
 			       msg->buf, msg->len);
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
@@ -1252,6 +1270,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
+
 	if (!i2c_dev->dma_mode) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
@@ -1290,10 +1309,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1375,6 +1393,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1734,6 +1753,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 */
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(i2c_dev->dev);
+
 	pm_runtime_enable(i2c_dev->dev);
 
 	err = tegra_i2c_init_hardware(i2c_dev);
@@ -1778,11 +1798,11 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adapter);
-
 	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
 	tegra_i2c_release_clocks(i2c_dev);
+
 	return 0;
 }
 
@@ -1883,15 +1903,14 @@ static const struct dev_pm_ops tegra_i2c_pm = {
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

