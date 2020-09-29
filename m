Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD5027DBF8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgI2WWn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbgI2WUm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:42 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39F3C0613D0;
        Tue, 29 Sep 2020 15:20:41 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so7434019lfl.5;
        Tue, 29 Sep 2020 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D/BA9kvookWuD0ADfYVk6x35/t1omYB14zvljd0//Vk=;
        b=jG8ieyk1qM/BGWlm8/6TPiCV+1AcsRif92gOvpa/K1Dsl4sVqta6kMnRPfKKc9bMtX
         WNfHnj3pQo6AuxDawXFMOArBzC19Zz1HtslYqFVnSVmtHS8NBUFbvvHfcfAYOspHFLN0
         DazfldOdsyKCHBRv/WUYEJ8DT9sznqSsHB6T8TFPLMd/ZnZq5/8JHpga9hsC3niaX6qw
         64AAAZ0kFiPDBnxdmZ5VSrimHFUOqBGhd+5u2hbsLBXzFuIqfnWq2Yx9DBHWxjfpnnSg
         /+pzPQeRZKlhS5glIRql2hF72KT6AyzquBK2/StfAK4YiogNd13taNku/QY64rCTC5B4
         kUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/BA9kvookWuD0ADfYVk6x35/t1omYB14zvljd0//Vk=;
        b=A77Yp3B0bQ5oY9EBfLAfqwkIIEEuQl+jG00tvR6ppAnA4ro6niMcGXciKVi4kpnKtR
         IxPit/XRk79H5kCASWlOufgo0Brsi8fIzFbvfIBCADIIjbunOL5DqxbubMkcmbPXxhB1
         tc+Pm4xwG3cQIyzDVO0ifjx7ZpVoeuTdSGzQo7U3m0IIDNXxM/9Fi4ZLEkD2Qw7gohOB
         bMbi63/nzXEriepNKKLpi3XyG0CNfi8Wbv0e+ZjfK0azfD4lyJCuMoq3bCjeBmnqovsx
         GPK+l/AhXZirOYQ+OCy0iuhW4kpZr+lK6f9k3dukkw/pbOXbid+K1luKP0d9vaSIOa1P
         szfg==
X-Gm-Message-State: AOAM5314hNAg1COFq5FEmmA0eEdTKxto7m4DunTFWuWrWKL97aJbzIu3
        ML5FojXqMhv9Pxipt37LfUI=
X-Google-Smtp-Source: ABdhPJynq5Q3E/QhG1zdBhuCqGhsC6mUoKlLxeIQ2hyZnwUkBYnvMd4aHd5b0jmW8YiTHHVF17hYgw==
X-Received: by 2002:ac2:5594:: with SMTP id v20mr2132555lfg.344.1601418040368;
        Tue, 29 Sep 2020 15:20:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 05/32] i2c: tegra: Initialize div-clk rate unconditionally
Date:   Wed, 30 Sep 2020 01:18:48 +0300
Message-Id: <20200929221915.10979-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

