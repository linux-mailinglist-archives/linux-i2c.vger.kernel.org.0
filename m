Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B33727DBCA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbgI2WVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729372AbgI2WVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:11 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BECC0613DE;
        Tue, 29 Sep 2020 15:21:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so5337147ljk.8;
        Tue, 29 Sep 2020 15:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7kN54rfdggf4DQUzi2GjLK+8/mjp0qy1urQDd1IdySU=;
        b=JsyzS7qMVkCuf3nVJPH93HQdhyvSQSUGl0drxZbWI10fGAOLvyuNy3gDC1j4QWTq+O
         MTQgq6gPgj0FSpe2/I4CTF3z9ZyB4kbinD1TB5FCCoOf7q7a4qChnmQtU35Mpexs7CtU
         fw3kLpcKzEt15ctiPfWNTKu+kVEhGi/ShlqDK0r6QSAWwOeJieZPWcn/I04cNRaMZofC
         bdKbAi3R1so1KKTL0p9ShHOqPjZAVj00CeJ/MnxaBSkVUfh7jjbR/TmDEV9M32KHY6mc
         MdsL+18QFusK68WLP35/AvCQOGkhFRUuvmolpxlivZ1G3OygTBc7/i8P4S4T72sLSXG2
         YPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7kN54rfdggf4DQUzi2GjLK+8/mjp0qy1urQDd1IdySU=;
        b=IZ1s7MeB+68NvLkBX0xi31tWrdNKKAt7hbU778mRD9FVhhgmQUZHYXO21NSGd1gsD/
         aGNV70X9L6z1cksp3f/ZqzYzUfYIM3DqdNLvezO49aLYRv//6sJf5UjXbGlKXDB9toDx
         Jk3dj0nbV0HG454tfgKkjsHrb17ANhTP6UbSNX+uWP2Uee3zak1kJfaMenW0JB5aJ5/5
         peIOonUj2MgRcgr+94hdYeRTPsF5CmsstoQnDxiKet8fZr9s7rdtYL0izDI1bCzkGxSZ
         nLKJ4wYR3w/ZOTjndEo5gJPV/8geMDObvLwKNHrjYvxQAABJ/z7FH4XlPPlXroOxHgwA
         HhlQ==
X-Gm-Message-State: AOAM532KHVtrKQX8a5I9HnQVjEQvORoB6MWbGG/11eMOkTuMIjlQJpbG
        86vULQlysWvTCUP0BZVG5sI=
X-Google-Smtp-Source: ABdhPJzzZswBqPfAMsF7fRXFq1BO+Z+Y5huuL59C1jjgA9oZytU1CIplGz191Cw75wiYdiLAf33dlg==
X-Received: by 2002:a05:651c:124c:: with SMTP id h12mr1699074ljh.208.1601418064977;
        Tue, 29 Sep 2020 15:21:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:21:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 29/32] i2c: tegra: Clean up printk messages
Date:   Wed, 30 Sep 2020 01:19:12 +0300
Message-Id: <20200929221915.10979-30-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch unifies style of all messages in the driver by starting them
with a lowercase letter and using consistent capitalization and wording
for all messages.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 37 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1a1388339660..dbf83424fb2f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -382,7 +382,8 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
 	if (!dma_desc) {
-		dev_err(i2c_dev->dev, "failed to get DMA descriptor\n");
+		dev_err(i2c_dev->dev, "failed to get %s DMA descriptor\n",
+			i2c_dev->msg_read ? "RX" : "TX");
 		return -EINVAL;
 	}
 
@@ -423,7 +424,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
 		return 0;
 	}
 
@@ -449,7 +450,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
+		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -573,7 +574,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
-		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		dev_err(i2c_dev->dev, "failed to load config\n");
 		return err;
 	}
 
@@ -836,7 +837,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
-		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
+		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
 			 i2c_readl(i2c_dev, I2C_STATUS),
 			 i2c_readl(i2c_dev, I2C_CNFG));
@@ -980,8 +981,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		slv_config.device_fc = true;
 		err = dmaengine_slave_config(chan, &slv_config);
 		if (err) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				err);
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->dma_mode = false;
@@ -1080,14 +1080,13 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "timed out for bus clear\n");
+		dev_err(i2c_dev->dev, "failed to clear bus\n");
 		return -ETIMEDOUT;
 	}
 
 	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
 	if (!(val & I2C_BC_STATUS)) {
-		dev_err(i2c_dev->dev,
-			"un-recovered arbitration lost\n");
+		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
 
@@ -1217,12 +1216,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_FROM_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err) {
-				dev_err(i2c_dev->dev,
-					"starting RX DMA failed, err %d\n",
-					err);
+			if (err)
 				return err;
-			}
 
 		} else {
 			dma_sync_single_for_cpu(i2c_dev->dev,
@@ -1243,12 +1238,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						   xfer_size,
 						   DMA_TO_DEVICE);
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
-			if (err) {
-				dev_err(i2c_dev->dev,
-					"starting TX DMA failed, err %d\n",
-					err);
+			if (err)
 				return err;
-			}
 		} else {
 			tegra_i2c_fill_tx_fifo(i2c_dev);
 		}
@@ -1264,7 +1255,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
+	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->dma_mode) {
@@ -1286,7 +1277,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					 i2c_dev->tx_dma_chan);
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
-			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
+			dev_err(i2c_dev->dev, "DMA transfer timed out\n");
 			tegra_i2c_init(i2c_dev);
 			return -ETIMEDOUT;
 		}
@@ -1307,7 +1298,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
 		tegra_i2c_init(i2c_dev);
 		return -ETIMEDOUT;
 	}
-- 
2.27.0

