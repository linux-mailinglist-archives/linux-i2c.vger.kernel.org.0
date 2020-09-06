Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3B625EF8E
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgIFSwC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbgIFSvt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:49 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A15EC061786;
        Sun,  6 Sep 2020 11:51:47 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id q8so6400364lfb.6;
        Sun, 06 Sep 2020 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NSXj2EyioaJ7KNO8tUwLix2FExFrX/+cO8ZUIFH1Bxw=;
        b=SRTP9X9qSYmPg+0VrgvftYJmGI41agTUEFKD7//RT5zgbFZtyRlN7FHAwf+KGyQl0l
         yQVT4R28XZz5qYn8pSpWucNeggfmm5dJI4VZ1iuYLfXxpqbIPnR2irR6DMicx4lZkAMC
         yTpdlzVtaNCHFHhaqKer2u1DKyGUaYUB6RKldr+qdsgXnu+MxGYhGJ0fyevc3J/OS8YM
         kA6nmXBwIT/zB8kjQi+/tbO1kXUWdlWyG6Rd2dz90/nuL7NFQC9MiwDfen9acV1Jv6e6
         PzXlo9psOENT7ztoAARHzuegH6BLpyMX7MrqK/WNPk/QeOQ02uj9UpTH1guBLB0yhbNO
         Opsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSXj2EyioaJ7KNO8tUwLix2FExFrX/+cO8ZUIFH1Bxw=;
        b=eBAXvuOicWjPoR/ERj/pbADU3xidbt3m5PgxNWnv9tKEH2TyRdL144sxUuQW0F04zj
         xajZR/F20KxY6lsELHPw/6zaFvhLptFDLr4RHHmkhP4XqLbIjSigmAEg06tUBvX/EUxm
         mAiP7IT44saOHtoYzFNa+a+3AhuBGzWGzPaXkLN9KlRacJ0zCZjCaQyEwGh4Sa1pzjuF
         3RAeR7x+H2vOUmbtF/HpVmZOszseu0PMu+A4QZHnQ2v4dIdW6i8Dws2bdr5pPpwIL7Ad
         kOHchLFCN/zJlmz6xNoyQH5Wpm6/e96goRHHsrFpsXIrzlzksGFo88JA0LTyu+G4uEh+
         +SqQ==
X-Gm-Message-State: AOAM5330njpote5rWFvpLNqpGe4x0fnoECipH7FjcMgIstMpyJJiMMed
        IDgquJZlGiE/RHIeMEUrh4I=
X-Google-Smtp-Source: ABdhPJz2mwl8OdePg+qrrH8jnTf5CHzspBAM459bEX5NvjGNgw4ltqDTUdm8b0vadnJxbYrYS3rtdQ==
X-Received: by 2002:a19:70c:: with SMTP id 12mr8628014lfh.207.1599418302807;
        Sun, 06 Sep 2020 11:51:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/36] i2c: tegra: Initialization div-clk rate unconditionally
Date:   Sun,  6 Sep 2020 21:50:07 +0300
Message-Id: <20200906185039.22700-5-digetx@gmail.com>
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

It doesn't make sense to conditionalize the div-clk rate changes because
rate is fixed and it won't ever change once it's set at the driver's probe
time. All further changes are NO-OPs because CCF caches rate and skips
rate-change if rate is unchanged.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d01697995224..bfdb8d388ce2 100644
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
@@ -1810,7 +1808,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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

