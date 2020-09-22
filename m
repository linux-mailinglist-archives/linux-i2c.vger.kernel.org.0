Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC10274CDC
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgIVWwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgIVWwg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:36 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520B8C0613D2;
        Tue, 22 Sep 2020 15:52:36 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so19847554lfb.6;
        Tue, 22 Sep 2020 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a5dxppkFR4cLRraVyzLxFbOIgODkh/XNghrFuLLS/uk=;
        b=nZrO69IMgBXkb8qVJXeeAA5S0fJj7OH0hXBLeb0WPfWeQ2D+mycLh1lJ2O8Z0v3DYt
         CO6EbgkXwEUXMiSzlliBJixyzDU7iU7WNHXvdbH+MHELeMumXNUlaxZdLzJn6SUyZc+D
         +lamsP5n/MlPpj5dEr/ILtcZHr9YSh/zKQBXsISHyA9E+8peAnwi/tuM0gUkP4rFGlXi
         3CQg931MNbo0hAQW0v1qWfCSJHBUROg1JeyWPRHajCVt3VVAie/YzIrglGwmZdh/1n17
         QZX1kA+kz3sviJ603bfjedXT+2Tj6OuTOHS6N1HEwbAFkgvP2S16pTC6fLAr3Gx1TBCg
         w+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5dxppkFR4cLRraVyzLxFbOIgODkh/XNghrFuLLS/uk=;
        b=bP1u2+791qUnDmIDKkr7OPLpv0vkveIScPndFF5gJwufp9WNRrImo1/WyZ8SDZPLan
         0iD+0pUfruEOhJ4KBFioBG5TzOJhLsoXQdbbMEF2cBOGi4EssBqnNwfY8J3QYfKA+EoZ
         d8MOlebEjsPvcl6hTIvW6LmMBiaKvGQzKyVSN/uQuqK3khrQh4ecg/2ACOsp7BXI80Su
         wiJhFqbahA5bN/k0ck+azP8ysZVkQo8CX/oLXUEtSrFISgDe+oWm7Q8TiNPgbRefX81b
         6sQ8i0EHRECEYf4YB+14HvUtWnmYGvh2Y80SWG1NN0UhY1k3c0hCQ1kpFyxwgvOQFlMZ
         PlUw==
X-Gm-Message-State: AOAM530bTHSriHLR319BXuegazfWCpYlXFSUOFxzzj2yAIBQSzTKdnJQ
        xYmJOwJgqMZg0hfRsvN9HSE=
X-Google-Smtp-Source: ABdhPJwO41Zsnx9zXU7c1n+nyvW8Jwh/B/WzEIJaqZKjqagPiJU1JM6aVRUemghob+x92PNLd70Usw==
X-Received: by 2002:a05:6512:70f:: with SMTP id b15mr2402001lfs.39.1600815154758;
        Tue, 22 Sep 2020 15:52:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 05/32] i2c: tegra: Initialize div-clk rate unconditionally
Date:   Wed, 23 Sep 2020 01:51:28 +0300
Message-Id: <20200922225155.10798-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It doesn't make sense to conditionalize the div-clk rate changes because
rate is fixed and it won't ever change once it's set at the driver's probe
time. All further changes are NO-OPs because CCF caches rate and skips
rate-change if rate is unchanged.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1d1ce266255a..720a75439e91 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -293,7 +293,7 @@ struct tegra_i2c_dev {
 	bool is_curr_atomic_xfer;
 };
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit);
+static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev);
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
@@ -691,7 +691,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * domain ON.
 	 */
 	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev, true);
+		ret = tegra_i2c_init(i2c_dev);
 		if (ret)
 			goto disable_div_clk;
 	}
@@ -778,7 +778,7 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
 	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
 }
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
+static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 	int err;
@@ -836,16 +836,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
-	if (!clk_reinit) {
-		clk_multiplier = (tlow + thigh + 2);
-		clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
-		err = clk_set_rate(i2c_dev->div_clk,
-				   i2c_dev->bus_clk_rate * clk_multiplier);
-		if (err) {
-			dev_err(i2c_dev->dev,
-				"failed changing clock rate: %d\n", err);
-			return err;
-		}
+	clk_multiplier  = tlow + thigh + 2;
+	clk_multiplier *= i2c_dev->clk_divisor_non_hs_mode + 1;
+
+	err = clk_set_rate(i2c_dev->div_clk,
+			   i2c_dev->bus_clk_rate * clk_multiplier);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
+		return err;
 	}
 
 	if (!i2c_dev->is_dvc && !i2c_dev->is_vi) {
@@ -1319,7 +1317,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			tegra_i2c_init(i2c_dev, true);
+			tegra_i2c_init(i2c_dev);
 			return -ETIMEDOUT;
 		}
 
@@ -1340,7 +1338,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
-		tegra_i2c_init(i2c_dev, true);
+		tegra_i2c_init(i2c_dev);
 		return -ETIMEDOUT;
 	}
 
@@ -1352,7 +1350,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
 		return 0;
 
-	tegra_i2c_init(i2c_dev, true);
+	tegra_i2c_init(i2c_dev);
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
 		if (!i2c_dev->is_multimaster_mode)
@@ -1811,7 +1809,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto disable_div_clk;
 
-	ret = tegra_i2c_init(i2c_dev, false);
+	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
 		goto release_dma;
@@ -1918,7 +1916,7 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	err = tegra_i2c_init(i2c_dev, false);
+	err = tegra_i2c_init(i2c_dev);
 	if (err)
 		return err;
 
-- 
2.27.0

