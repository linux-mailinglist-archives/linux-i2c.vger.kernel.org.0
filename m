Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749D5260848
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbgIHCNo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbgIHCMU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:20 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3FEC061795;
        Mon,  7 Sep 2020 19:12:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so17987115lji.11;
        Mon, 07 Sep 2020 19:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0S/4Np9sPc793jkBRlsI+/R5oCadbPZM3MSvc8MO1k=;
        b=d66VIMLIdRTu/WczmtN9OLBNrmwlgdh8KQuzEf8jGVtx0jG+zZeEbTJHHHG+C2MAXu
         2kU6i4pI0FcGnzSLIpjschNRqdk33JMSXzAt/HWvQjWriV0MYGaYZnpyjcKjNS9JRlNZ
         FWQykMFFJwJ3A+XJQHfwms5GGDq4/Fi0/AStCA3F7thDJygoHZLMUVHfBTkaqMHJ8zHH
         A4GiTaP2B0y/3SvGYRli3kJhMbECk616jTTKxXoKxyUhKRowIOPy1zlnUJXu5nSndFiK
         t+SLykfMFDV4Sf1NYxswcd3fwx2C5d9jtpNv0kGxN7pgo/wfsw4p8LSrHDGKdi75Y8TL
         siyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0S/4Np9sPc793jkBRlsI+/R5oCadbPZM3MSvc8MO1k=;
        b=a3i9GQwS0Gv6SH0/W4CoLnkPCrd5KmWkjfKPKc7pCVyWEFku+QvPLfTTgMn7K0h+uo
         f6DDmlL934Zc2a6UwpDHSbKaaQYvYRPsIT1/y1GtN0buWoScFu3GI/9ghnFRkggmNeOT
         HPe5wkTi+3OJnsEd9Qq6cr4akCtG+yzaWj7mHRCoILue9o3XX+sgsMz2YECflW9jWRHW
         6pCRkOMc1euLVux+3CofEyv/d07xvzk1Sv3VN/moEuvvaAlnAF25GruUEDuL8wdZXPS6
         67MEtYbwBIV2h02YpS4SlIwaYpq0StWAQlx9vXifjPQmpGC7bAH8wKnmfMuvivgAWj1h
         j+Hw==
X-Gm-Message-State: AOAM531g0vaQQbXj7ilG2lJRWG7uBtGinT+mtufRMTT6Da2+JaK1S4ay
        OrcJPBKMXwLVH4YRhFaXEPXKnhOCQG0=
X-Google-Smtp-Source: ABdhPJx5l2LYH+Ky2qRjckzgavI9WQfVIHJxhjIMkhTXTBFAw5bhHaG1YnHYelB6EWsWBgJb1e5OaA==
X-Received: by 2002:a2e:87d9:: with SMTP id v25mr11849428ljj.171.1599531124310;
        Mon, 07 Sep 2020 19:12:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 32/35] i2c: tegra: Clean up printk messages
Date:   Tue,  8 Sep 2020 05:10:18 +0300
Message-Id: <20200908021021.9123-33-digetx@gmail.com>
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

This patch unifies style of all messages in the driver by starting them
with a lowercase letter and using consistent capitalization and wording
for all messages.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 37 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 44c75595a173..56a7f696e425 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -381,7 +381,8 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
 	if (!dma_desc) {
-		dev_err(i2c_dev->dev, "failed to get DMA descriptor\n");
+		dev_err(i2c_dev->dev, "failed to get %s DMA descriptor\n",
+			i2c_dev->msg_read ? "RX" : "TX");
 		return -EINVAL;
 	}
 
@@ -422,7 +423,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
 		return 0;
 	}
 
@@ -448,7 +449,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
+		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -572,7 +573,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
 				      1000, I2C_CONFIG_LOAD_TIMEOUT);
 	if (err) {
-		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
+		dev_err(i2c_dev->dev, "failed to load config\n");
 		return err;
 	}
 
@@ -835,7 +836,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
-		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
+		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
 			 i2c_readl(i2c_dev, I2C_STATUS),
 			 i2c_readl(i2c_dev, I2C_CNFG));
@@ -978,8 +979,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 		slv_config.device_fc = true;
 		err = dmaengine_slave_config(chan, &slv_config);
 		if (err) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				err);
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
 			return err;
 		}
 
@@ -1079,14 +1079,13 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
 
@@ -1218,12 +1217,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 			err = -ETIMEDOUT;
 			goto reset_hardware;
 		}
@@ -1307,7 +1298,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
 		err = -ETIMEDOUT;
 		goto reset_hardware;
 	}
-- 
2.27.0

