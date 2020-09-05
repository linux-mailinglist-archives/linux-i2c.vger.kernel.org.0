Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC6325EACC
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbgIEUqR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgIEUmj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:39 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC00C061247;
        Sat,  5 Sep 2020 13:42:38 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w11so5627786lfn.2;
        Sat, 05 Sep 2020 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TDcoq79wxs8DnD5gOirKnGZA0uEtHDM76HfqXVjfgrg=;
        b=JKy7hhk5iJ6RnN6GuYaE5tlkHfCNHehcAJXHqc5MD5j6cBQdA/ZfwAaXoeqlSSdq3P
         7k7EYbcDjgbYHI2U/q7tEZbVyHeioLiuL6+jTvaSJ6lntQjlLv7uHJoti29S4b5PyT2j
         Y7Ds7s6ZTGkv1FDMS6kc6DROOrsMNmEN36uhLVQyVdgVgtrgP2jWi7gwyGTo0Osr+kQj
         IwIHDx0XQoI+Ay5Cz9CSFuhJlY9FbcLsVOD8tJHYYYQh9JC6xz4e9p1N4YG1rTzqIkT6
         oM1jl23RdErY95Yc3U5ppYELjZ7GvG79VfJzjW/hroM3MMCcgPPocchUPcCZfpgIpQgB
         h0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TDcoq79wxs8DnD5gOirKnGZA0uEtHDM76HfqXVjfgrg=;
        b=hmmz7oRFnJST02g0KPGHp29b22ZfPpe0O7lp3+mtqqG5NoAvDKBwWE8yAIMYK9FEVw
         5RLDxUVS5dhpzHotFSKd9wdHot976mOGM7h60FVkH1ACGQrogerbzH+EiYUFIvNbVc8Q
         XcoKkFLlv+/6wP2yLc5/ZYddjo0dA9KYc/kbAdaB4iQdGF7ku+EyV+AeVKuBAZrT45PN
         O3fqauaWwMCib2PiYoCQIbWAdG6OVlQEZRrWuvuaV1f8f5sJMgvIaY4ZZhyPR0fVZz1C
         FAxsvKuZTV6oFd6J7ptnEkKH/g+AZHxNk3O/IseH31WmLhPeTkbknu/xrW79zZX0v+Z3
         C/Bg==
X-Gm-Message-State: AOAM5325E4Ab2trLLxvI1ILQBuPmAQlB64GQBvHOzuj1Kp5YeekmfHv7
        dZNE6dxGXhAuWbp64roYMQw=
X-Google-Smtp-Source: ABdhPJxI/zyyEbHmeb5T/XeDSsStWOqOvIt5TtNDql32UsUHW7XKEwYu9NO1GVdrBdEfd5nSg/w0Ug==
X-Received: by 2002:a19:4251:: with SMTP id p78mr6880110lfa.154.1599338547735;
        Sat, 05 Sep 2020 13:42:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/31] i2c: tegra: Initialization div-clk rate unconditionally
Date:   Sat,  5 Sep 2020 23:41:23 +0300
Message-Id: <20200905204151.25343-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It doesn't make sense to conditionalize the div-clk rate changes because
rate is fixed and it won't ever change once it's set at the driver's probe
time. All further changes are NO-OPs because CCF caches rate and skips
rate-change if rate is unchanged.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 307df6f97ed0..56c5aff579b6 100644
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
@@ -1317,7 +1315,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			tegra_i2c_init(i2c_dev, true);
+			tegra_i2c_init(i2c_dev);
 			return -ETIMEDOUT;
 		}
 
@@ -1338,7 +1336,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
-		tegra_i2c_init(i2c_dev, true);
+		tegra_i2c_init(i2c_dev);
 		return -ETIMEDOUT;
 	}
 
@@ -1350,7 +1348,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
 		return 0;
 
-	tegra_i2c_init(i2c_dev, true);
+	tegra_i2c_init(i2c_dev);
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
 		if (!i2c_dev->is_multimaster_mode)
@@ -1808,7 +1806,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto disable_div_clk;
 
-	ret = tegra_i2c_init(i2c_dev, false);
+	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
 		goto release_dma;
@@ -1916,7 +1914,7 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	err = tegra_i2c_init(i2c_dev, false);
+	err = tegra_i2c_init(i2c_dev);
 	if (err)
 		return err;
 
-- 
2.27.0

