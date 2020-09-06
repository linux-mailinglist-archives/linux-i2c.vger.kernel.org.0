Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE5025EFA7
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgIFSxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729221AbgIFSwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:08 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B36C061573;
        Sun,  6 Sep 2020 11:52:08 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a22so7172445ljp.13;
        Sun, 06 Sep 2020 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GyLAjt4e3Doar3tmqWLMH5Ep6Vj8C/4MybkD9AqTieU=;
        b=tZ9EgBDpipZpE8q4KizK/5WPA5IuU80kPN3XwiKGVkuDcd6O7HXULQZpyVS+jIwZ3a
         ++Wd0S1vG40goNAGf47DJfYOIvNtPaawm5AOmPHQsQ8ANQ/OEJyAmq6hx8z/ZzPf5MGC
         MeyNjGUI/MfsQjT9diaJ3J4sqTOtWDLdZ67fYBw7oZFhPAXGwuKTmf33h8YL46cqJJYz
         rgjCgmFJP0n5Nfzq2/pSTp0xFvwWOW6wKmJi43sH1Xphhi56RvMTraSdgRexJgKRtbgT
         SEvmYBXA9/HDXpRDmT2Oa9p0JxBg1ESjnLjeAOiVvDkb+yIBUI/d4MjQHN/C31jTiICU
         wIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GyLAjt4e3Doar3tmqWLMH5Ep6Vj8C/4MybkD9AqTieU=;
        b=TqR2K8FIxctuIuIzZV7rsl61UGmpjmuauPyU0gowk44oMX53wAvTJOzuMtf9bE3iGr
         TPik/D1hV2g8XRC3HpvR6rYrzyfPXWbe6TWGwEE9mRRFWm6/EZaHD7ylhmtqg0VC4sLc
         LKn+dqgF82DEUKId4ojpM8KiAZWhjNjzm1oyY/W0TxM43DAoTKaIS/3l75gCyc5n5Y0Q
         NCmlXFtX8ogc1gNNlcZ1GfCSICkg5m8j5mjQ4DG55LFpVWue0RPjHtigIjSkoy8+N2cC
         hz3+r9h1b0pBbVNZsOrttoU6UR5jbCFDG7ZfAOuGPcJthbs7HnTIKrG21/pAh9TSzn+B
         vIjA==
X-Gm-Message-State: AOAM532ri8fSOHHL7DfItVLyzkWYWDxR/sIbc0o/hPu+UoAsZGW48HgU
        fBgeeSSdoto/4w2TGfttCYM=
X-Google-Smtp-Source: ABdhPJzlH9WKELxDvCnUt+pCVfGw3ZSQtEl+dpjyOiMpOom1YpcsnCL8HS+jI/Tf2TUbDB5L3SIrPQ==
X-Received: by 2002:a2e:9e17:: with SMTP id e23mr8573765ljk.439.1599418326508;
        Sun, 06 Sep 2020 11:52:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 31/36] i2c: tegra: Clean up whitespaces, newlines and indentation
Date:   Sun,  6 Sep 2020 21:50:34 +0300
Message-Id: <20200906185039.22700-32-digetx@gmail.com>
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

Some places in the code are missing newlines or have unnecessary
whitespaces and newlines. This creates inconsistency of the code and
hurts readability. This patch removes the unnecessary and adds necessary
whitespaces / newlines, clears indentation of the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 64 +++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2c9636722b86..4fa56010304d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -308,6 +308,7 @@ static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, u32 reg)
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -367,9 +368,12 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
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
@@ -383,6 +387,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -570,6 +575,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
 		return err;
 	}
+
 	return 0;
 }
 
@@ -781,9 +787,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 */
 		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
 		tx_fifo_avail -= words_to_transfer;
+
 		i2c_dev->msg_buf_remaining = buf_remaining;
-		i2c_dev->msg_buf = buf +
-			words_to_transfer * BYTES_PER_FIFO_WORD;
+		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
@@ -895,12 +901,18 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	goto done;
 err:
 	/* An error occurred, mask all interrupts */
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
 
@@ -1048,6 +1060,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	int err;
 
 	reinit_completion(&i2c_dev->msg_complete);
+
 	val = FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND |
 	      I2C_BC_TERMINATE;
 	i2c_writel(i2c_dev, val, I2C_BUS_CLEAR_CNFG);
@@ -1180,6 +1193,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
+
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
@@ -1193,25 +1207,24 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
-					i2c_dev->bus_clk_rate);
+				       i2c_dev->bus_clk_rate);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
+
 	if (i2c_dev->is_curr_dma_xfer) {
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
 
@@ -1220,10 +1233,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!i2c_dev->msg_read) {
 		if (i2c_dev->is_curr_dma_xfer) {
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
@@ -1234,6 +1248,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
+
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
@@ -1272,10 +1287,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1360,6 +1374,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1765,11 +1780,11 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
 
@@ -1868,15 +1883,14 @@ static const struct dev_pm_ops tegra_i2c_pm = {
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

