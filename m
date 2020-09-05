Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7ACA25EA86
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgIEUnW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728774AbgIEUmw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:52 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19C6C06125F;
        Sat,  5 Sep 2020 13:42:51 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a15so11865845ljk.2;
        Sat, 05 Sep 2020 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W9tEHaCutKChDWGj40n/tLK6DvHWgOOiB1AYU6tLOMc=;
        b=aFNWEw2XIr2auPUrtEqyMWpjxBJF3MNP8qNQ9KR9vMSkE7BRSf90FHPZaXHLGpBOkC
         bkmvZ6rvWKUp/0yre8J3G2+38CADohXXFiv/jMp3yIQm1HTyKzNOHw6u4pgyGmdMA/J+
         3wvIuk+MOifCCkenLnCIwVVouHfOu9nI1Y1IqzkpTexoRVUZ5xhUU+FHIU30uExqLDMW
         Tl51fJfnmcC7Vf3YP236z9Q/TFrfLX2EvHBZ6PbnQqJfbcC1RJ0w25nhnI+Fxdd7G0+n
         Q1nrFMJs146OSrMJQZzy5XEhomub++wkNRrIEBq5IzUwM1ige1ImMq+m3UW1KGlm7/Vy
         e82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9tEHaCutKChDWGj40n/tLK6DvHWgOOiB1AYU6tLOMc=;
        b=leErH37RLV7t9R6MGjEbBqzahr6EXHJ4pPe1AqJ8UF0d82QpDbIQoNYo27uUe6fZZ+
         yx557+8MhA+a9PFPWLT7RoOlWN1bOnpRS4UB0K0SxOXRspdNvzngfgk7cT2PVUazUShq
         v68dzSM0QozBNfilUKsNGCZbQrNrz8bV/5mclWdTi5P9Hh/KUoQL1j1hvt8h3PVK1DUl
         EYNl30qo5MHpirjzzuxhdXX4pdT/WJramg+Gc7iSAFava7SnMj2rip3DHS5GXxbORzxe
         JaIS1A8GLb5jVhwGZdRFv/yZ+De3XMG9pRhP8h1mzf3tdS4mjJOLuVgcUGnht887d2ju
         6LUg==
X-Gm-Message-State: AOAM5309H8bPfCJieDPmR+0lsha5mnPXBtwpDUI2xjd7LXLT21anZ9kZ
        yV4YBI4lKiBSk44nqSfV/bkcBjQ/maU=
X-Google-Smtp-Source: ABdhPJxdO5tW362OKBzRh1Cr6tjoq87VBxJRmUdfobpmQpM7I/JCwiGVohqUE84LYWlz5q+Ion+qdw==
X-Received: by 2002:a2e:86d3:: with SMTP id n19mr7215888ljj.368.1599338570361;
        Sat, 05 Sep 2020 13:42:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 28/31] i2c: tegra: Clean up whitespaces, newlines and indentation
Date:   Sat,  5 Sep 2020 23:41:48 +0300
Message-Id: <20200905204151.25343-29-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some places in the code are missing newlines or have unnecessary
whitespaces and newlines. This creates inconsistency of the code and
hurts readability. This patch removes the unnecessary and adds necessary
whitespaces / newlines, clears indentation of the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2dd97540f14f..c36f2bed0240 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -310,6 +310,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
 		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
 	else if (i2c_dev->is_vi)
 		reg = 0xc00 + (reg << 2);
+
 	return reg;
 }
 
@@ -370,9 +371,12 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
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
@@ -386,6 +390,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	dma_desc->callback_param = i2c_dev;
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(chan);
+
 	return 0;
 }
 
@@ -573,6 +578,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
 		return err;
 	}
+
 	return 0;
 }
 
@@ -784,9 +790,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 		 */
 		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
 		tx_fifo_avail -= words_to_transfer;
+
 		i2c_dev->msg_buf_remaining = buf_remaining;
-		i2c_dev->msg_buf = buf +
-			words_to_transfer * BYTES_PER_FIFO_WORD;
+		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
 
 		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
 
@@ -1186,9 +1192,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
 
 	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
+
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
+
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 
 	/*
@@ -1196,25 +1204,24 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1223,10 +1230,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1237,6 +1245,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
+
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (msg->flags & I2C_M_RD)
 			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
@@ -1275,10 +1284,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
@@ -1363,6 +1371,7 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 
 	if (i2c_dev->hw->has_continue_xfer_support)
 		ret |= I2C_FUNC_NOSTART;
+
 	return ret;
 }
 
@@ -1774,11 +1783,11 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
 
@@ -1877,15 +1886,14 @@ static const struct dev_pm_ops tegra_i2c_pm = {
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

