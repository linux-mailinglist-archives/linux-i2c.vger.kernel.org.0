Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D5325B7D7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgICAyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgICAyN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0686C06125F;
        Wed,  2 Sep 2020 17:54:12 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t7so697617ljo.13;
        Wed, 02 Sep 2020 17:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mzbf4DuflBeTQLxzGK/w5XUYkKbYVKcRiZ4UXxyN0qs=;
        b=R0Og/p/F+WZmlFbPxpOkoj84ltut7sniDMl7815ihQKSQeV0g4N3aQzRBAvEjjrx1V
         EOCpYZCEj9M5LTYl+LwBbWvYvJMdWNP7fTecVHiuy52EqX/zQFlQgxi2t0KlXiTz1sq/
         K2iDD95lcXoMGq5oxz98xfke3V/43K7sAFPXdWPXshMnbwmaGl+VZ/5OvL8UWLgzNzul
         wMvhFVNg3XV92bQ7+IB1IAE69By/990pf8ZkTURiTFYzmo7/586lG4OirQyJahxBykJ6
         p6p02eT1w0ug01gq0lm4v8HYH8viik3d1lNUBmzEokaCFw68lnpCgfxhC35e3K8XyXNV
         mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mzbf4DuflBeTQLxzGK/w5XUYkKbYVKcRiZ4UXxyN0qs=;
        b=Ik1ePwbeunMK93Mlb4IlmRIVYWE+xOkpS7HLuxjHRJfQXqvPSQc0RayZZI53GwkPfV
         dUhjlPHenKyaDyVSqku36DCWbEm5926yCLnCmYfzBGSyYLsHUGtUekJdht61FFy8o3Ey
         eOYuwYzw2ZqMoQLOQeEKZ1YfUSBQS+FFJCjNCGmfOnUoHE0HZ2NWMRZa0ACNz/zaAGqX
         uSHDhfoKUtwnkr6YKpM47Jgu1Qez+zzIj77UwFqw3+gvi/IamkJAhYHnt3WIho+2zAfB
         op0v8CU3hidU6hLtCIgsMzAbkEPAi+oKRma/zIdgNmHfVH3sVzn7y7wNvKtuWPdpvoT8
         v84A==
X-Gm-Message-State: AOAM531l83jzyJks0xGSek3OCfb1fiCBkb/d+jWNt4fCEUn1287+Mc57
        2Q779Xw9vo6bpftfFipvId8=
X-Google-Smtp-Source: ABdhPJwpvEajxxrLAgt1Refmaoy+hMxGz2srOTIk8FRzEIeoDsxo8FaovKwljc6m8/lPht2hqFCk2Q==
X-Received: by 2002:a2e:865a:: with SMTP id i26mr249186ljj.246.1599094451145;
        Wed, 02 Sep 2020 17:54:11 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/22] i2c: tegra: Initialization div-clk rate unconditionally
Date:   Thu,  3 Sep 2020 03:52:59 +0300
Message-Id: <20200903005300.7894-22-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 79caf87bb4c0..bc7954c8a5a0 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -601,7 +601,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	return -ETIMEDOUT;
 }
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
+static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh;
 	int err;
@@ -656,16 +656,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
-	if (!clk_reinit) {
-		clk_multiplier = (tlow + thigh + 2);
-		clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
-		err = clk_set_rate(i2c_dev->div_clk,
-				   i2c_dev->bus_clk_rate * clk_multiplier);
-		if (err) {
-			dev_err(i2c_dev->dev,
-				"failed to set div-clk rate: %d\n", err);
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
@@ -1163,7 +1161,7 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
-	tegra_i2c_init(i2c_dev, true);
+	tegra_i2c_init(i2c_dev);
 
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
@@ -1303,7 +1301,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			tegra_i2c_init(i2c_dev, true);
+			tegra_i2c_init(i2c_dev);
 			return -ETIMEDOUT;
 		}
 
@@ -1324,7 +1322,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
-		tegra_i2c_init(i2c_dev, true);
+		tegra_i2c_init(i2c_dev);
 		return -ETIMEDOUT;
 	}
 
@@ -1752,7 +1750,7 @@ static int tegra_i2c_init_runtime_pm_and_hardware(struct tegra_i2c_dev *i2c_dev)
 	}
 
 	/* initialize hardware state */
-	ret = tegra_i2c_init(i2c_dev, false);
+	ret = tegra_i2c_init(i2c_dev);
 
 	pm_runtime_put(i2c_dev->dev);
 
@@ -1907,7 +1905,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	 * domain ON.
 	 */
 	if (i2c_dev->is_vi) {
-		ret = tegra_i2c_init(i2c_dev, true);
+		ret = tegra_i2c_init(i2c_dev);
 		if (ret)
 			goto disable_div_clk;
 	}
@@ -1961,7 +1959,7 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	err = tegra_i2c_init(i2c_dev, false);
+	err = tegra_i2c_init(i2c_dev);
 	if (err)
 		return err;
 
-- 
2.27.0

