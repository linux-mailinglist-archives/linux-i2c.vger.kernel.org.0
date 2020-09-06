Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB7225EFB1
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgIFSxz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729215AbgIFSwH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288DCC06179A;
        Sun,  6 Sep 2020 11:52:07 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so13596058ljc.3;
        Sun, 06 Sep 2020 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JEya1JmZIS+D+6t5rhkdtoQUC8oKJwpd193gWhhsSmw=;
        b=tXWbdjfh2Vhj8mUtYZxNJEqxEkP+8RE1mDNAeEeV3zwftxLDHSBUUdYmOV0SzyglOX
         6Ud2eAZClpKx3GA/5Nm4iEf/Ruo8HokBCeUMz85lpNewc9Lb/lSnkXZMf5zxJIw5kYh/
         X62rQZR7dg/A1O1gHk9ZxnYbQp7vZz3/61pJvecU07/g24LZ+Q0L4MVaYUemrgi3UJIz
         81LvxKMS3CD9VP00RKTHQljO+JCLKmQwnMVVHxeXixnSmH7v+0zDEQXakFDU4kqXwy8r
         RyTdjfPMZWzhA/yv/98Aipoe2OwfBfOpmyOAy1zBuMB3z2LyUDR0gK0Klksh5NeQIg5M
         8faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JEya1JmZIS+D+6t5rhkdtoQUC8oKJwpd193gWhhsSmw=;
        b=cZt/Nss9AlZoO645oKg4F+MUHwrYeBtBhnPoVeXWptytYefKPnFJYFL27BisYdb9xO
         juDtA3dupLGuTgqOE1yVkgriw/xAJHLHfqi8pRy4jvQLHwEc3qnLKTEMbd4qgdH623zU
         +1/W4A2a4R/eK4Wru7qAC8TS6UeCX9l/71XyL/XmTga2MAn1qNR/TkyxKA/gWnaiXaXk
         Mn/R++EwNK6RNdDoFTixev/BlPlYWKW3WKGjOkwNCh5b2wGR9lLPwOwpBaHg1thJLmSX
         P6fvONXHOqI9d1tTI0QHF7Yi4JTPekf5x2COQ+0V7PG3PELc3qFOm22/uBrpV5fJKGGF
         aXRg==
X-Gm-Message-State: AOAM533vSH3DaI+CMu62Xg+nR8a90y2s9dkkqVsQ5lcEUqNHRXlXEFEr
        dng3zgBiqUaI63+Bue8EQuY=
X-Google-Smtp-Source: ABdhPJzNcSclgGHPMLJSGoy08peNbhYnqzrAUX4pXEeaWYlSF+Jxe33PWz9Qq9aa0xpw8MjO3rtUhw==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr5647970ljg.387.1599418325608;
        Sun, 06 Sep 2020 11:52:05 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:05 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 30/36] i2c: tegra: Clean up printk messages
Date:   Sun,  6 Sep 2020 21:50:33 +0300
Message-Id: <20200906185039.22700-31-digetx@gmail.com>
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

This patch unifies style of all messages in the driver by starting them
with a lowercase letter and using consistent capitalization and wording
for all messages.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 63ae9bdee502..2c9636722b86 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -374,7 +374,8 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
 	if (!dma_desc) {
-		dev_err(i2c_dev->dev, "failed to get DMA descriptor\n");
+		dev_err(i2c_dev->dev, "failed to get %s DMA descriptor\n",
+			i2c_dev->msg_read ? "RX" : "TX");
 		return -EINVAL;
 	}
 
@@ -415,7 +416,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
 		return 0;
 	}
 
@@ -441,7 +442,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
+		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -538,7 +539,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
-		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		dev_err(i2c_dev->dev, "failed to load config\n");
 		return err;
 	}
 
@@ -821,7 +822,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
-		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
+		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
 			 i2c_readl(i2c_dev, I2C_STATUS),
 			 i2c_readl(i2c_dev, I2C_CNFG));
@@ -964,8 +965,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
 		if (ret) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				ret);
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", ret);
 			return ret;
 		}
 
@@ -1065,14 +1065,13 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
 
@@ -1205,12 +1204,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1230,12 +1225,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1251,7 +1242,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
+	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (i2c_dev->is_curr_dma_xfer) {
@@ -1294,7 +1285,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
 		err = -ETIMEDOUT;
 		goto reset_hardware;
 	}
-- 
2.27.0

