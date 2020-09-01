Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C85025A0A7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgIAVNI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgIAVLb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E633FC061244;
        Tue,  1 Sep 2020 14:11:28 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so3281238ljk.8;
        Tue, 01 Sep 2020 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LI5IZwfJ0fn+Z9lwo1JJQbv9Wuowy3OzaHL/E7iS8lc=;
        b=SyMA3lnESROEfsNblRmAyLHoDCX0QVUCkbE/6PrBh5uUgm1vOJLr2Ao1/iUdmoBKXQ
         TejkpVyWDZ/gTMpTuoa0kG/STPdy5Bvl8TU+58sQ/tGhqnTe7TuJ8ACvSoxbHL7w3l1e
         aDUsxtUgNJRYKJrO2go0do7FUAKswY+etfmF4ijkkT4emCrclYrpqLu6WPeDX7uB+R9a
         DlhwZ0VysCSlRXMumllFVH3pYHQtjlsFBc/L6rijKmUCFB94YlOL1MO34sq6kvUf9EqX
         N00Z4N2Hm2z4nHNYN5L7yvKG1Y4nw1Z5l5EXp496r06KgsgF4zsk8BepX9OK4hXbwKoO
         s/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LI5IZwfJ0fn+Z9lwo1JJQbv9Wuowy3OzaHL/E7iS8lc=;
        b=ufTAes7ABZ8ylsCif2+DHl9p61mSMJen0rZi+wYRH95+g0iGOi02Zj60DSwzE1atJs
         dGVy5SesLjVWv0iiIZd+F7k2G27bnXy6LNMwEHFhUmoSWL1cpiRfXqYeMd6AfM5uVku/
         TSYl85cG/QsISMPAqr5uE6rwTCAE/HeT6pws6Ncz0mq7MKTbgYUexHCFkqS8zygy/kkn
         ApC99VtGUq2naAbvHY7754wmBPskD3CvKqAq7W3RdZcoGVu5rj/4fiy9QK3gxQFNV40M
         ezgoXn7wPzMVve6UN1DxkIoBkFFIIqteLEnJ2+DYdSxTG4LIsYPoOL3F1SXlneSlufNy
         bNcw==
X-Gm-Message-State: AOAM532w623nfy4tPze9MpwuP2dxVGv9VaniYrANCKahMy03/yG1WxE1
        X4fkpltVZ4XZ6B7GQLWk+S8=
X-Google-Smtp-Source: ABdhPJxd5s80+dwKEkCcPo4KkxLLlKennc+YOH4Vf+VOM9syJGN1jSmsLkd1/7g6ceEidrLzwLiRgw==
X-Received: by 2002:a2e:3019:: with SMTP id w25mr1439282ljw.291.1598994686527;
        Tue, 01 Sep 2020 14:11:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:25 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/17] i2c: tegra: Clean up messages in the code
Date:   Wed,  2 Sep 2020 00:10:48 +0300
Message-Id: <20200901211102.11072-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use lowercase and consistent wording for all messages in the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 65 ++++++++++++++++------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9bd91b6f32f4..0d358bc12973 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -377,7 +377,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 	enum dma_transfer_direction dir;
 	struct dma_chan *chan;
 
-	dev_dbg(i2c_dev->dev, "starting DMA for length: %zu\n", len);
+	dev_dbg(i2c_dev->dev, "starting dma for length: %zu\n", len);
 	reinit_completion(&i2c_dev->dma_complete);
 	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
 	chan = i2c_dev->msg_read ? i2c_dev->rx_dma_chan : i2c_dev->tx_dma_chan;
@@ -385,7 +385,7 @@ static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
 					       len, dir, DMA_PREP_INTERRUPT |
 					       DMA_CTRL_ACK);
 	if (!dma_desc) {
-		dev_err(i2c_dev->dev, "failed to get DMA descriptor\n");
+		dev_err(i2c_dev->dev, "failed to get dma descriptor\n");
 		return -EINVAL;
 	}
 
@@ -427,7 +427,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+		dev_dbg(i2c_dev->dev, "dma support not enabled\n");
 		return 0;
 	}
 
@@ -450,7 +450,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
+		dev_err(i2c_dev->dev, "failed to allocate dma buffer\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -462,8 +462,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 err_out:
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
-		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
-		dev_err(i2c_dev->dev, "falling back to PIO\n");
+		dev_err(i2c_dev->dev, "cannot use dma: %d\n", err);
+		dev_err(i2c_dev->dev, "falling back to pio\n");
 		return 0;
 	}
 
@@ -672,8 +672,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 
 	ret = clk_enable(i2c_dev->fast_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev,
-			"Enabling fast clk failed, err %d\n", ret);
+		dev_err(dev, "failed to enable fast clock: %d\n", ret);
 		return ret;
 	}
 
@@ -685,8 +684,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 
 	ret = clk_enable(i2c_dev->div_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev,
-			"Enabling div clk failed, err %d\n", ret);
+		dev_err(dev, "failed to enable div clock: %d\n", ret);
 		goto disable_slow_clk;
 	}
 
@@ -747,8 +745,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 						I2C_CONFIG_LOAD_TIMEOUT);
 
 		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
+			dev_err(i2c_dev->dev, "failed to load config\n");
 			return err;
 		}
 	}
@@ -850,7 +847,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 				   i2c_dev->bus_clk_rate * clk_multiplier);
 		if (err) {
 			dev_err(i2c_dev->dev,
-				"failed changing clock rate: %d\n", err);
+				"failed to set div-clk rate: %d\n", err);
 			return err;
 		}
 	}
@@ -1052,8 +1049,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
 		if (ret < 0) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				ret);
+			dev_err(i2c_dev->dev, "dma config failed: %d\n", ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->is_curr_dma_xfer = false;
@@ -1163,8 +1159,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
 	if (!(reg & I2C_BC_STATUS)) {
-		dev_err(i2c_dev->dev,
-			"un-recovered arbitration lost\n");
+		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
 
@@ -1221,8 +1216,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err < 0) {
 				dev_err(i2c_dev->dev,
-					"starting RX DMA failed, err %d\n",
-					err);
+					"starting rx dma failed: %d\n", err);
 				return err;
 			}
 
@@ -1281,8 +1275,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err < 0) {
 				dev_err(i2c_dev->dev,
-					"starting TX DMA failed, err %d\n",
-					err);
+					"starting tx dma failed: %d\n", err);
 				return err;
 			}
 		} else {
@@ -1321,7 +1314,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					 i2c_dev->tx_dma_chan);
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
-			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
+			dev_err(i2c_dev->dev, "dma transfer timeout\n");
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1676,7 +1669,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "no irq resource\n");
+		dev_err(dev, "no irq resource\n");
 		return -EINVAL;
 	}
 	irq = res->start;
@@ -1684,7 +1677,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
 		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "missing controller clock\n");
+			dev_err(&pdev->dev, "failed to get div-clk: %ld\n",
+				PTR_ERR(div_clk));
 
 		return PTR_ERR(div_clk);
 	}
@@ -1705,7 +1699,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(&pdev->dev, "missing controller reset\n");
+		dev_err(dev, "failed to get reset control: %pe\n",
+			i2c_dev->rst);
+
 		return PTR_ERR(i2c_dev->rst);
 	}
 
@@ -1725,7 +1721,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
 		if (IS_ERR(fast_clk)) {
-			dev_err(&pdev->dev, "missing fast clock\n");
+			dev_err(dev, "failed to get fast clock\n: %ld\n",
+				PTR_ERR(fast_clk));
+
 			return PTR_ERR(fast_clk);
 		}
 		i2c_dev->fast_clk = fast_clk;
@@ -1746,7 +1744,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = clk_prepare(i2c_dev->fast_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		dev_err(dev, "failed to prepare fast clock: %d\n", ret);
 		return ret;
 	}
 
@@ -1770,7 +1768,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		dev_err(dev, "failed to prepare div-clk: %d\n", ret);
 		goto unprepare_slow_clk;
 	}
 
@@ -1787,13 +1785,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
 		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
+			dev_err(dev, "runtime resume failed\n");
 			goto unprepare_div_clk;
 		}
 	} else {
 		ret = pm_runtime_get_sync(i2c_dev->dev);
 		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
+			dev_err(dev, "runtime resume failed\n");
 			goto disable_rpm;
 		}
 	}
@@ -1801,8 +1799,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->is_multimaster_mode) {
 		ret = clk_enable(i2c_dev->div_clk);
 		if (ret < 0) {
-			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
-				ret);
+			dev_err(dev, "failed to enable div-clk: %d\n", ret);
 			goto put_rpm;
 		}
 	}
@@ -1816,7 +1813,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = tegra_i2c_init(i2c_dev, false);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
+		dev_err(dev, "failed to initialize i2c controller\n");
 		goto release_dma;
 	}
 
@@ -1825,7 +1822,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
+		dev_err(dev, "failed to request irq %i\n", i2c_dev->irq);
 		goto release_dma;
 	}
 
-- 
2.27.0

