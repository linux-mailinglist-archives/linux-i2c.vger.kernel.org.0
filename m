Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACE325EA98
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgIEUnW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbgIEUmx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:53 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB03C06125E;
        Sat,  5 Sep 2020 13:42:50 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a15so11865828ljk.2;
        Sat, 05 Sep 2020 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=71X7gV0UsJDQK+ZE1hDXzomab/CdlvY7d7EaOYOUeXU=;
        b=JMns3m5ipp94OA8ijBfOwT2MwKrTMyR6stCQhc4rBBFyDRZdb2mcJA+JV7cmZyB1Q4
         ReLk+/ISlakqCOGIf3syJst5IlCbpn1M2SGFA5PMPMx3JSo/+6DD0oCq461+/1DvCqwX
         epkApJYeCVf0ebonHtzmeWUmL+y+YSw/9TO8hndnP+yCKg2KPEhRsQtzHoXmNoow5Zqf
         miTyKl1SarNWNB04ILjsEe1sAVuSJ/nRCttpLmK9a00o4lgHr/HKyxpLMhctg+znGwBJ
         2fPZa3Onw0NC3F8Xn/bgKt3mhwKWuE63kuDkcJx71lpt+/7zHCSAVshq1LEb+vH/BEsU
         rqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=71X7gV0UsJDQK+ZE1hDXzomab/CdlvY7d7EaOYOUeXU=;
        b=HgH/Uk8XUunyelAMLsk/LMDLS68xKqHpGAj3BjemFa9U3H2nWp5XmhJh/rRkSmpTOM
         8vCfIEV5+fdNiTqP9K5nFQlGkIgYcmyh19SlTlJxZHkggk4qb7Zj0AtOIzVIEwE6AF8I
         E3fv9Wr6IaocddCeg9cd9tlcJ9j5TbnYQkLP4E1WY/SJK4OjEHwfrbULOHjdi9a6my66
         NAgBEWrUT3JYIt2ZA0weaPmuqQeGKGV4oW0NnCjqGgJNUW0BcbtAI+2GV4nIjlHtN6Gd
         USYMfMCqghW0ol7jUqiGbrDaPv97g9CDadPmNTzQrQQlANqtizm6QJoRMlPZNYb7Nnyg
         sOEg==
X-Gm-Message-State: AOAM530W3G4VqOFLk+3NOSKVjIrX97KQLWgRKOLvqhfg5S/ihiFqIEZS
        t73M8ZRd7JIZ8GuyWGHoxB0=
X-Google-Smtp-Source: ABdhPJxwahSNBTmkvi2W0YXOSkJ4n0xundj62JfHNw8fDZUA7MmmKt/sgaqWhjSSSMFjimCsEzb7Bw==
X-Received: by 2002:a2e:958:: with SMTP id 85mr6274441ljj.151.1599338569413;
        Sat, 05 Sep 2020 13:42:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 27/31] i2c: tegra: Clean up printk messages
Date:   Sat,  5 Sep 2020 23:41:47 +0300
Message-Id: <20200905204151.25343-28-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch unifies style of all messages in the driver by starting them
with a lowercase letter and using consistent capitalization and wording
for all messages.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3dd688e9462a..2dd97540f14f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -377,7 +377,8 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
 	if (!dma_desc) {
-		dev_err(i2c_dev->dev, "failed to get DMA descriptor\n");
+		dev_err(i2c_dev->dev, "failed to get %s DMA descriptor\n",
+			i2c_dev->msg_read ? "RX" : "TX");
 		return -EINVAL;
 	}
 
@@ -418,7 +419,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
 		return 0;
 	}
 
@@ -444,7 +445,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
+		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -541,7 +542,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
-		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		dev_err(i2c_dev->dev, "failed to load config\n");
 		return err;
 	}
 
@@ -825,7 +826,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
-		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
+		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
 			 i2c_readl(i2c_dev, I2C_STATUS),
 			 i2c_readl(i2c_dev, I2C_CNFG));
@@ -970,8 +971,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
 		if (ret) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				ret);
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->is_curr_dma_xfer = false;
@@ -1077,8 +1077,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	val = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
 	if (!(val & I2C_BC_STATUS)) {
-		dev_err(i2c_dev->dev,
-			"un-recovered arbitration lost\n");
+		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
 
@@ -1208,12 +1207,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1233,12 +1228,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1254,7 +1245,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
+	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->is_curr_dma_xfer) {
@@ -1297,7 +1288,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
 		err = -ETIMEDOUT;
 		goto reset_hardware;
 	}
-- 
2.27.0

