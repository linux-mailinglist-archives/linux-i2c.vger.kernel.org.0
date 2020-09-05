Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D449F25EA95
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgIEUnV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbgIEUmz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAFEC061251;
        Sat,  5 Sep 2020 13:42:54 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d15so4721234lfq.11;
        Sat, 05 Sep 2020 13:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jM6mZMS3phZex18xRxgLb8dTfS3i1wzqX7A67SdzArY=;
        b=QpVEf4XR/wrDAnscle5Y3vF5VsY2yDje+XxXNxx0K6LAlcil+blfQ/6Drei+QuGemA
         GV+yRmP1tXbrq4I7EW/6tcmBcUlf+2+GGx2tjJdHyEVJNkb2cHpgIjcZQP1sb8HHUI/Q
         FYapWb8IpQgoQnki1N+RGtymjt0e4JEeFA7Xv+/44ugRJOvuY9L5IHMJtHaPdmdJOhqK
         qlX5J0Tbta5zb1HfkvSL5yOfXyXDITJOxiz5756DQsrgpGKbcnHFtXtE7rlAw4ptiK17
         hPQ/J/DbItvAq+M1+zgxnL3baVvDiP9IQUsNSvDxDA8RCJsX5c8Y2pI7lQK90hzqZnQc
         DKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jM6mZMS3phZex18xRxgLb8dTfS3i1wzqX7A67SdzArY=;
        b=nXlYJwClVk6ChlSieRwAuNns72Jz9C8t/itVY5VlCfNugPkqhdsgpQPqSlHDu3dxY4
         1Sww5Tpu8L1Fa+q03HTbb1GBg1Nfr6s5oEQCGKHkRkJwVekL047nGiWZSQPXn3GeVykU
         rOTEPnwnSAeOi8h7qECGnrfAi2s6dp/+zZmhuExO52zhVin3FXaPA+RnVgmRmdbG/n/W
         bmRoH//p1u/7LHwUqlR0oSVBoH4guam2Sc1c/p1IYS1oef/8D1184lwdmly9qgl6Vr9Z
         xOVXoWNzRIic+AOibkVXAGHukFrXXn2xxZqEgBvILGsXk8O1l8yuBIg9YXTqY9Ix/kLn
         5Ybw==
X-Gm-Message-State: AOAM5330othOC18BUuZln0BefMNcdeCd19PL6eqrXC9NlMeRpbzs85/L
        hnkJd05JtPDAZ0ePloRR1UY=
X-Google-Smtp-Source: ABdhPJy4/4rI717ynezqEUoBsa4mLZSJXWegT/gG4g5/D0EUJxjcdpbNKt4OHZS7i+ThPsZSX84htA==
X-Received: by 2002:ac2:5597:: with SMTP id v23mr6743710lfg.5.1599338573105;
        Sat, 05 Sep 2020 13:42:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 31/31] i2c: tegra: Rename couple "ret" variables to "err"
Date:   Sat,  5 Sep 2020 23:41:51 +0300
Message-Id: <20200905204151.25343-32-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename "ret" variables to "err" in order to make code a bit more
expressive, emphasizing that the returned value is a error code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d389ea5813c3..2c84d5848e29 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -935,7 +935,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	unsigned long reg_offset;
 	u32 val, reg, dma_burst;
 	struct dma_chan *chan;
-	int ret;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
 		reg = I2C_MST_FIFO_CONTROL;
@@ -975,9 +975,9 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		}
 
 		slv_config.device_fc = true;
-		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret) {
-			dev_err(i2c_dev->dev, "DMA config failed: %d\n", ret);
+		err = dmaengine_slave_config(chan, &slv_config);
+		if (err) {
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
 			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->is_curr_dma_xfer = false;
@@ -1584,11 +1584,11 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
-	int ret;
+	int err;
 
-	ret = of_property_read_u32(np, "clock-frequency",
+	err = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
-	if (ret)
+	if (err)
 		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 
 	multi_mode = of_property_read_bool(np, "multi-master");
@@ -1796,15 +1796,15 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
-	int ret;
+	int err;
 
-	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
-	if (ret)
-		return ret;
+	err = pinctrl_pm_select_default_state(i2c_dev->dev);
+	if (err)
+		return err;
 
-	ret = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
-	if (ret)
-		return ret;
+	err = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
+	if (err)
+		return err;
 
 	/*
 	 * VI I2C device is attached to VE power domain which goes through
@@ -1812,8 +1812,8 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * controller needs to be re-initialized after power ON.
 	 */
 	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev);
-		if (ret)
+		err = tegra_i2c_init(i2c_dev);
+		if (err)
 			goto disable_clocks;
 	}
 
@@ -1822,7 +1822,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 disable_clocks:
 	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
 
-	return ret;
+	return err;
 }
 
 static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
-- 
2.27.0

