Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7A125828E
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgHaUY0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729978AbgHaUXb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:31 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA171C061755;
        Mon, 31 Aug 2020 13:23:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so8242559ljj.4;
        Mon, 31 Aug 2020 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LlFFuQSVpP4nuOnidxL8KPHKkAPDk1QX0MDXTli+RAU=;
        b=dP1lmEFyf6frzJ1B8XZwURB2SeEh72JMFlrp4WrwxklfKetjzVQguOcrFwb0h1Wtn6
         OE6DtQMLQMy8dyGpXFcOWw9t6rIcMz6FOWXTspiLX++zGiiVnnIp4AzPuCQpMnftCFc8
         9Repl1fNNy4fQMNZgKJYxWeAjjTE4Pixxk0hQDke8SMzEzniV5lqq0gEn3mPWCcO4iKQ
         vw5KC+SgWXCZAzFaoOZg0TAe5SjFqmiBZREiEcuTYaLmv9haR8XIq4UQjX3hE/LpxgeW
         YVUyKoRpA5NhubrAaLS/iE4B45mNIgzXT8BPliqFxKAJ4n1iz3u4FrnCkjXk/JCMgoE7
         0w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LlFFuQSVpP4nuOnidxL8KPHKkAPDk1QX0MDXTli+RAU=;
        b=HoiE1himpQt4ADDKe95lRxLo/zyca/BsKn7r5GQCid9AYpW3av749zNN1aUZoUTa5S
         rdutUA2+yq6ETl3MDSuFwPQbDiRsW7kHaXL9YcveEsPmFqRUijboCxX4TSztj4qjHLSI
         LEHLYgCyN4BCktD4Sp/aPxVP07COytEHJ8tUWsAwufr2qxs/3eU3kaSRRepGwernTyn0
         7gIjBHN/fiJwYzsodidrtIXqRBfxVr138cbPorIaP8H/eseEikELa21ENWt+rfPgNqgH
         gzqFpTEHNvJ3pB0H97sZlwz/FhIRxI3mR8EmM/48BWqGgWMYfbpAfh5+/aNo+X+BehyO
         Gkfw==
X-Gm-Message-State: AOAM532dRv2/ffYWOmTjeOO/n816unsvweDiNlhBJQt0+u3VVI651dkX
        ueWVG5+f7aEcIgPGVE9wBLO5AotExFo=
X-Google-Smtp-Source: ABdhPJwVuNjpPMZLuTwO3BMasZHAYnlVKPN4KyfqL+kt3zKw0lRQAeuEw6UDBzbhWJsOO7BbJzp25w==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr1311257ljp.247.1598905408626;
        Mon, 31 Aug 2020 13:23:28 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/12] i2c: tegra: Clean up messages in the code
Date:   Mon, 31 Aug 2020 23:22:54 +0300
Message-Id: <20200831202303.15391-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use lowercase and consistent wording for all messages in the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 50 ++++++++++++++++------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9bd91b6f32f4..efbb20049cf8 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
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
 
@@ -850,7 +848,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 				   i2c_dev->bus_clk_rate * clk_multiplier);
 		if (err) {
 			dev_err(i2c_dev->dev,
-				"failed changing clock rate: %d\n", err);
+				"failed to set div-clk rate: %d\n", err);
 			return err;
 		}
 	}
@@ -1052,7 +1050,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
 		if (ret < 0) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
+			dev_err(i2c_dev->dev, "dma slave config failed: %d\n",
 				ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
@@ -1163,8 +1161,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
 	if (!(reg & I2C_BC_STATUS)) {
-		dev_err(i2c_dev->dev,
-			"un-recovered arbitration lost\n");
+		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
 
@@ -1221,8 +1218,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err < 0) {
 				dev_err(i2c_dev->dev,
-					"starting RX DMA failed, err %d\n",
-					err);
+					"starting rx dma failed: %d\n", err);
 				return err;
 			}
 
@@ -1281,8 +1277,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err < 0) {
 				dev_err(i2c_dev->dev,
-					"starting TX DMA failed, err %d\n",
-					err);
+					"starting tx dma failed: %d\n", err);
 				return err;
 			}
 		} else {
@@ -1321,7 +1316,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					 i2c_dev->tx_dma_chan);
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
-			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
+			dev_err(i2c_dev->dev, "dma transfer timeout\n");
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
 		}
@@ -1676,7 +1671,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "no irq resource\n");
+		dev_err(dev, "no irq resource\n");
 		return -EINVAL;
 	}
 	irq = res->start;
@@ -1705,7 +1700,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(&pdev->dev, "missing controller reset\n");
+		dev_err(dev, "failed to get controller reset: %pe\n",
+			i2c_dev->rst);
+
 		return PTR_ERR(i2c_dev->rst);
 	}
 
@@ -1725,7 +1722,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1746,7 +1745,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = clk_prepare(i2c_dev->fast_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		dev_err(dev, "failed to prepare fast clock: %d\n", ret);
 		return ret;
 	}
 
@@ -1770,7 +1769,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		dev_err(dev, "failed to prepare div-clk: %d\n", ret);
 		goto unprepare_slow_clk;
 	}
 
@@ -1787,13 +1786,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1801,8 +1800,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->is_multimaster_mode) {
 		ret = clk_enable(i2c_dev->div_clk);
 		if (ret < 0) {
-			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
-				ret);
+			dev_err(dev, "failed to enable div-clk: %d\n", ret);
 			goto put_rpm;
 		}
 	}
@@ -1816,7 +1814,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = tegra_i2c_init(i2c_dev, false);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
+		dev_err(dev, "failed to initialize i2c controller\n");
 		goto release_dma;
 	}
 
@@ -1825,7 +1823,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
+		dev_err(dev, "failed to request irq %i\n", i2c_dev->irq);
 		goto release_dma;
 	}
 
-- 
2.27.0

