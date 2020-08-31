Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F7225827A
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgHaUXf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbgHaUXe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:34 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC69AC061573;
        Mon, 31 Aug 2020 13:23:33 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y17so4240424lfa.8;
        Mon, 31 Aug 2020 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fLWAd459e53PrxCTbDW1N5SV9Ygjm3TESfTNB8/GCRE=;
        b=moS0Xsln368Ql3Iml8OegwXxXr099iGmNzylaB7uyzTZrMMQJ1RkVXm4Ymryer/kTs
         k8uxyPKgHCX9HU84dELgdlgk1Veb6iGGS1VsYm6d7m10CSfJ6/vXPOGiKltT5PoR6fH1
         JL3X8BRqlf2LnGlUDs8XxfMn+9T/KSA1LOHZNa4pPJ19XI5rMFMXCRj5AE7NHB8GpsUx
         yi8psP5WHQ9q2jVdGGxA/9FEHYESTQ45Kzp+qG13FABDHEfpdGViOwY0qkzSd52rmFQ7
         iTQFS7ilDerXbULeTSctmVTYJx/xgCm5W5rfOjumQu9S5VDOHkbq2O6P+7DplQWWe02x
         7bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fLWAd459e53PrxCTbDW1N5SV9Ygjm3TESfTNB8/GCRE=;
        b=o1GDHNm1c6udbCdtPeZ9JNDkq+YvuIsldTT/5hZFhHn0AGLJk7rG6eBqKA8KGJ8nqy
         ethXQQieLK1Bop9J1mYqhsClEUmrx1fXKQLGxdjBYU+n8jMH0jmxQufm1keRZyOG7bML
         kXu8H2VEVJ9GLMKy1fCpwf8gQDbzosKQ8Pu41OJ0uaZaX8115KVrnyYo4tOLQLnbAYst
         CWwZK8BMMICtiBLCyuYP3HPsGsZKk3t/iLleCKEzrbwaQWpJcN+tTHX9LPBcPnfUDLN7
         axUsWLUK4Fz+w3WwNaIjO9QUBRQDVC07+ceUCtjTpvwaZEovpOU9MPB25CEEiVWQ4ax3
         GT8w==
X-Gm-Message-State: AOAM531ILjVmhq4EFULC7+zTOYVN64ldtOTPwwhlCb1Dc8U7/zOUJBtj
        lp/WEqkgP39QpN4z6oFmS2w=
X-Google-Smtp-Source: ABdhPJxhhieFe/dZDTLvTfMsdNHfbjiADWLaVrIlGUcg6xkDNBCWnG7J4dwDH3Crrb21HcREJf/aLw==
X-Received: by 2002:a05:6512:6c1:: with SMTP id u1mr1472042lff.28.1598905412237;
        Mon, 31 Aug 2020 13:23:32 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/12] i2c: tegra: Use dev_err_probe()
Date:   Mon, 31 Aug 2020 23:22:58 +0300
Message-Id: <20200831202303.15391-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use dev_err_probe() to replace the manual -EPROBE_DEFER handling, making
code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2c00f2e39514..525a757bdc66 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1646,8 +1646,8 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
+	struct clk *div_clk, *fast_clk, *slow_clk;
 	struct device *dev = &pdev->dev;
-	struct clk *div_clk, *fast_clk;
 	struct tegra_i2c_dev *i2c_dev;
 	phys_addr_t base_phys;
 	struct resource *res;
@@ -1668,12 +1668,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	irq = res->start;
 
 	div_clk = devm_clk_get(&pdev->dev, "div-clk");
-	if (IS_ERR(div_clk)) {
-		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "missing controller clock\n");
-
-		return PTR_ERR(div_clk);
-	}
+	if (IS_ERR(div_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(div_clk),
+				     "failed to get div-clk\n");
 
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
@@ -1712,24 +1709,20 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-		if (IS_ERR(fast_clk)) {
-			dev_err(dev, "failed to get fast clock\n: %ld\n",
-				PTR_ERR(fast_clk));
+		if (IS_ERR(fast_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(fast_clk),
+					     "failed to get fast clock\n");
 
-			return PTR_ERR(fast_clk);
-		}
 		i2c_dev->fast_clk = fast_clk;
 	}
 
 	if (i2c_dev->is_vi) {
-		i2c_dev->slow_clk = devm_clk_get(dev, "slow");
-		if (IS_ERR(i2c_dev->slow_clk)) {
-			if (PTR_ERR(i2c_dev->slow_clk) != -EPROBE_DEFER)
-				dev_err(dev, "failed to get slow clock: %ld\n",
-					PTR_ERR(i2c_dev->slow_clk));
+		slow_clk = devm_clk_get(dev, "slow");
+		if (IS_ERR(slow_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(slow_clk),
+					     "failed to get slow clock\n");
 
-			return PTR_ERR(i2c_dev->slow_clk);
-		}
+		i2c_dev->slow_clk = slow_clk;
 	}
 
 	platform_set_drvdata(pdev, i2c_dev);
-- 
2.27.0

