Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FCD25EFA1
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729292AbgIFSxG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729227AbgIFSwM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:12 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D24C06179B;
        Sun,  6 Sep 2020 11:52:11 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u21so3321687ljl.6;
        Sun, 06 Sep 2020 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWLzICm8fT3IDixATxnPn99X1v8YhxkdVLlJr4vNpIs=;
        b=pUBVd6RFNDbmBWxAfW0eCAHi4aNtiTERDaiV0wtPk+SbILhSyRQryDAd3LmfmC63/L
         uCqgTmZBBU80/tquju4UkjsSmxhGTOgKKcMO4aq777DlyKW71Cec651R09YzZkutsAu5
         IYr6waTl/Ge1B36QQIFykXWDes0WDGEq//FwxdtxOPrDAWnIb3+QLZFKXirTTz7mTtee
         wBHk0btlbBEfx32zjm2VYlyF6BMfIPlfn/0vro0uqAWMPo4nYCBO+pS073yxmv//wwJL
         fK+1wVALezU0F81yTbCrAMOyr1M7JGzxJEIx5iC7LaF8S67OchwDQ/4Kr5Cmbj9JNgP/
         ZX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWLzICm8fT3IDixATxnPn99X1v8YhxkdVLlJr4vNpIs=;
        b=tI8N0ucF5M6jd7zY0fwOvjtObSkdR2vRoVj/rj03mWohoOvNsa/LZY3NB4tHia2Tn7
         ZoAvwFKtjUUwJqllK8cl5mKeJ+hrC3r8i0vRzKTaGr/wEI6bvRQipO/vB6B4E6cly80t
         o4EMzpIxx9zCFkqDa0XVmHxS47o+tS9hss2Wlpv1xCrD+e0EU1tvyEUtOYloNkCFJP1R
         8QIIfqq3AfEQP5zQIjhQKo7QRTNJuNwTlJ0YyJF7waORCIsiPDV8iQU9by1/C8i8Gprs
         IT6UuKKHT0LcDntWP8+qfRfAXmS6HRKMI1Tqc47RIOggAsy49Ew8wX++DAKL2/YPNFWc
         Tf2w==
X-Gm-Message-State: AOAM531YXLr3McuSnKEK3HEU5NpkGLLaaLHINSLqZFVu2NFsTVs//KE+
        0QcozryvhY+4VZVeJyRXUbg=
X-Google-Smtp-Source: ABdhPJz+7b5nWL8HiZzT4pnxnrUg/SJB9wAc0o/UqnDBKtO5UQ8/IbEVZwJONHNRxj81lS23i47SJA==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr6102435ljj.268.1599418330079;
        Sun, 06 Sep 2020 11:52:10 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 35/36] i2c: tegra: Rename couple "ret" variables to "err"
Date:   Sun,  6 Sep 2020 21:50:38 +0300
Message-Id: <20200906185039.22700-36-digetx@gmail.com>
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

Rename "ret" variables to "err" in order to make code a bit more
expressive, emphasizing that the returned value is a error code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 36 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f15796a19688..880fbcd28c5e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -938,7 +938,7 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 	struct dma_slave_config slv_config = {0};
 	u32 val, reg, dma_burst, reg_offset;
 	struct dma_chan *chan;
-	int ret;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo)
 		reg = I2C_MST_FIFO_CONTROL;
@@ -978,10 +978,10 @@ static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 		}
 
 		slv_config.device_fc = true;
-		ret = dmaengine_slave_config(chan, &slv_config);
-		if (ret) {
-			dev_err(i2c_dev->dev, "DMA config failed: %d\n", ret);
-			return ret;
+		err = dmaengine_slave_config(chan, &slv_config);
+		if (err) {
+			dev_err(i2c_dev->dev, "DMA config failed: %d\n", err);
+			return err;
 		}
 
 		goto out;
@@ -1590,11 +1590,11 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
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

