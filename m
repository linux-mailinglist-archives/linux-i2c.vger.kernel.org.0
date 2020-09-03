Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C02D25B7FE
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgICAzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgICAx4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:53:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483C8C061247;
        Wed,  2 Sep 2020 17:53:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b19so1367309lji.11;
        Wed, 02 Sep 2020 17:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P09fB9PJmjA7VSekvJwMh8LCjQIhzh/GV3rByZhgWNQ=;
        b=fAIrcxLpjTA6W1QJTu/eVvoiZDhmqTysVZn0MjrBT50PSZZzrDeSvWXLjfyB6JLlLr
         4GaR7gGWMXVck8B//ChlrvPlEhOZMA3vxhvhzom7jscvycmFFF0mp6oObSV978U5qTVf
         SWX1n8kDN9fZnZdgfk6UjTRqGtx2iYeivgkVE72wDjYmHiMacDx6oAWDQf3qEWf1feU1
         KUpHlxhdC9cKLzaCIk3h6AfXLwLdUEp0leLlY0QOZvVeIDuPeLvw6jszxBmtKhTWLkCz
         8VWXObP00A/Ki7yHN04vl2wnP7K4uuiOSy2E/uSeWH9imgeLl8vVW/CDH2EKoMw0cavL
         ZUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P09fB9PJmjA7VSekvJwMh8LCjQIhzh/GV3rByZhgWNQ=;
        b=EYhvkOmGfIfXsGm9ATvCoEBM19yGSJ+tFtL1uYxXOMHNSW96+jSEZE1YY7W9rzXRMd
         o4uURFdWhr4rjgVhh1YguI/PuLXlwtbbUtppI42lVgfnnTYg3nPTuqyqHQy6GoxxdTMf
         HHIKE2WD/WDd0M+An96NAreqyqPk3vCWuwVHJWMVDNgAWyRHY80Fq13KqJYUc2t21iTl
         FsfcWyWxq6NWv6AZCSpK+v6EcpMbicg/g0CTtqV/BttTPrwEp83gJ8+BUIqY1B4mwCiz
         kW+4RgA37P6jZBDfKAqbo97eXPcT3UspwsliWm8fBXxroqQ6XuyBWGB0d/VaQ/YXG9xd
         gz2g==
X-Gm-Message-State: AOAM530yQ7YtBZpA9KnXqpIf0MRW20Kk7XLIVhn1KqLsIgBTA4NeuQGN
        7OLrkNtcBn8QJjBHmiU2VBo=
X-Google-Smtp-Source: ABdhPJx5iGoaGoNenP1waUy3WkJ8JOBj2Y5gbSVkGn0HW3OQsPDLCfJM22BhrqmOmo/xWs17bDUjFA==
X-Received: by 2002:a05:651c:1119:: with SMTP id d25mr244590ljo.300.1599094433635;
        Wed, 02 Sep 2020 17:53:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/22] i2c: tegra: Clean up messages in the code
Date:   Thu,  3 Sep 2020 03:52:41 +0300
Message-Id: <20200903005300.7894-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 63 ++++++++++++++++------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index efc6e97aeb8a..79e542cf3e59 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -427,7 +427,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-		dev_dbg(i2c_dev->dev, "Support for APB DMA not enabled!\n");
+		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
 		return 0;
 	}
 
@@ -450,7 +450,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate the DMA buffer\n");
+		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
 		err = -ENOMEM;
 		goto err_out;
 	}
@@ -682,8 +682,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 
 	ret = clk_enable(i2c_dev->fast_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev,
-			"Enabling fast clk failed, err %d\n", ret);
+		dev_err(dev, "failed to enable fast clock: %d\n", ret);
 		return ret;
 	}
 
@@ -695,8 +694,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 
 	ret = clk_enable(i2c_dev->div_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev,
-			"Enabling div clk failed, err %d\n", ret);
+		dev_err(dev, "failed to enable div clock: %d\n", ret);
 		goto disable_slow_clk;
 	}
 
@@ -757,8 +755,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 						I2C_CONFIG_LOAD_TIMEOUT);
 
 		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
+			dev_err(i2c_dev->dev, "failed to load config\n");
 			return err;
 		}
 	}
@@ -860,7 +857,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 				   i2c_dev->bus_clk_rate * clk_multiplier);
 		if (err) {
 			dev_err(i2c_dev->dev,
-				"failed changing clock rate: %d\n", err);
+				"failed to set div-clk rate: %d\n", err);
 			return err;
 		}
 	}
@@ -916,7 +913,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
-		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
+		dev_warn(i2c_dev->dev, "IRQ status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
 			 i2c_readl(i2c_dev, I2C_STATUS),
 			 i2c_readl(i2c_dev, I2C_CNFG));
@@ -1062,8 +1059,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		slv_config.device_fc = true;
 		ret = dmaengine_slave_config(chan, &slv_config);
 		if (ret < 0) {
-			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
-				ret);
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", ret);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->is_curr_dma_xfer = false;
@@ -1173,8 +1169,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 
 	reg = i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
 	if (!(reg & I2C_BC_STATUS)) {
-		dev_err(i2c_dev->dev,
-			"un-recovered arbitration lost\n");
+		dev_err(i2c_dev->dev, "un-recovered arbitration lost\n");
 		return -EIO;
 	}
 
@@ -1231,8 +1226,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err < 0) {
 				dev_err(i2c_dev->dev,
-					"starting RX DMA failed, err %d\n",
-					err);
+					"starting RX DMA failed: %d\n", err);
 				return err;
 			}
 
@@ -1291,8 +1285,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err < 0) {
 				dev_err(i2c_dev->dev,
-					"starting TX DMA failed, err %d\n",
-					err);
+					"starting TX DMA failed: %d\n", err);
 				return err;
 			}
 		} else {
@@ -1310,7 +1303,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
-	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
+	dev_dbg(i2c_dev->dev, "unmasked IRQ: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	if (dma) {
@@ -1352,12 +1345,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
+		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
 		tegra_i2c_init(i2c_dev, true);
 		return -ETIMEDOUT;
 	}
 
-	dev_dbg(i2c_dev->dev, "transfer complete: %lu %d %d\n",
+	dev_dbg(i2c_dev->dev, "transfer completed: %lu %d %d\n",
 		time_left, completion_done(&i2c_dev->msg_complete),
 		i2c_dev->msg_err);
 
@@ -1686,7 +1679,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "no irq resource\n");
+		dev_err(dev, "no IRQ resource\n");
 		return -EINVAL;
 	}
 	irq = res->start;
@@ -1694,7 +1687,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
 	if (IS_ERR(div_clk)) {
 		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "missing controller clock\n");
+			dev_err(&pdev->dev, "failed to get div-clk: %ld\n",
+				PTR_ERR(div_clk));
 
 		return PTR_ERR(div_clk);
 	}
@@ -1715,7 +1709,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(&pdev->dev, "missing controller reset\n");
+		dev_err(dev, "failed to get reset control: %pe\n",
+			i2c_dev->rst);
+
 		return PTR_ERR(i2c_dev->rst);
 	}
 
@@ -1735,7 +1731,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1756,7 +1754,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = clk_prepare(i2c_dev->fast_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		dev_err(dev, "failed to prepare fast clock: %d\n", ret);
 		return ret;
 	}
 
@@ -1780,7 +1778,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
+		dev_err(dev, "failed to prepare div-clk: %d\n", ret);
 		goto unprepare_slow_clk;
 	}
 
@@ -1797,13 +1795,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1811,8 +1809,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->is_multimaster_mode) {
 		ret = clk_enable(i2c_dev->div_clk);
 		if (ret < 0) {
-			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
-				ret);
+			dev_err(dev, "failed to enable div-clk: %d\n", ret);
 			goto put_rpm;
 		}
 	}
@@ -1826,7 +1823,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = tegra_i2c_init(i2c_dev, false);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
+		dev_err(dev, "failed to initialize I2C controller\n");
 		goto release_dma;
 	}
 
@@ -1835,7 +1832,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
+		dev_err(dev, "failed to request IRQ %i\n", i2c_dev->irq);
 		goto release_dma;
 	}
 
-- 
2.27.0

