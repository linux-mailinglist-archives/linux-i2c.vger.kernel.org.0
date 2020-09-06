Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8C425EFF6
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIFS5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgIFSvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A815C061757;
        Sun,  6 Sep 2020 11:51:46 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n25so2645458ljj.4;
        Sun, 06 Sep 2020 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TxOceK+4gVvHiSGhqRBFvjTe8SXe3B0gxIsDl+yAg2U=;
        b=uy4KOVuLonqQunUWTrLL8afu/rLD/v1m2EIdqy/sMtXb4TTG3ETdr355JVw/7xEukf
         XM4JXDDmF1CoZNaVy9vQK2AUM4rlgV55ycGyGBmrKe3LmeQwmM8WMYFUfEFiGASVb5pN
         FvNd5yLVHzhP935+BKrNK0HtaB3coCWbZ10EmPzf7h9Qx0unYKR5bOgCnHzSiCnPD98w
         SaQTU94Y93+vWsc7borW3uIHg+lUoT/i9X8/LZ+SXxsNj/Id/mZFVd4yCtphiX99ZWnu
         ShNHjK7JviXcs6YN+CRGZJIvO+JCA4Rc5WZmWzHNRxsAi6FlGqw02FSRv3S3iT+NEA9Q
         5UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TxOceK+4gVvHiSGhqRBFvjTe8SXe3B0gxIsDl+yAg2U=;
        b=Vmt2YPfqxfW2iTf4fDnNrMx+RWV503UDklrY0iarrvTJ0xqTV7ZoFGfHnAHyS+s642
         CzW4WysJrsQnW7dgeCF7ZFfR/9BxSlzRxcw0+J3sSSa1HrGFSUNEFA09XnXxtX5qUJSJ
         OBc2xPKKopvF5VPrEzVRYbrZ9aUAXZcBq5gnT2747qWOG91jpu+M9XS/VrAGLXlyfsxC
         /DxZk82YCaIr9G7HDBkftbMxZRLbs/tFgJuwTQ5dnyjk1P2PJNjSM+3bI1JwZqhZNdc5
         fB/addP0kX5/AonUibE4wxOqjXG6prXq9MGWCCxeqfGet9jwYpNHWawUmfKL36bWApdS
         3KbQ==
X-Gm-Message-State: AOAM530I5eyaHm1Mq0CWbPf0UjKyPcYpqbeGoK5Ggpsz+hw1eb29vqsP
        IEAtfStLGUyEU2ID7h8LJsckC0mNcHw=
X-Google-Smtp-Source: ABdhPJzAOTx69lhitHUeuI7MEN4pm9RJixmioY+dmXVEFk4KlGtP9BKw3z/8qXBfZyPt3yxANhYupQ==
X-Received: by 2002:a2e:9089:: with SMTP id l9mr9407516ljg.408.1599418304582;
        Sun, 06 Sep 2020 11:51:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
Date:   Sun,  6 Sep 2020 21:50:09 +0300
Message-Id: <20200906185039.22700-7-digetx@gmail.com>
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

The runtime PM is guaranteed to be always available on Tegra after commit
40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
all the RPM-availability checking and handling from the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4a9375fc71d8..c296095ace87 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1773,18 +1773,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra_i2c_runtime_resume(&pdev->dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto unprepare_div_clk;
-		}
-	} else {
-		ret = pm_runtime_get_sync(i2c_dev->dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto disable_rpm;
-		}
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(dev, "runtime resume failed\n");
+		goto disable_rpm;
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1843,16 +1835,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 put_rpm:
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_put_sync(&pdev->dev);
-	else
-		tegra_i2c_runtime_suspend(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 disable_rpm:
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-
-unprepare_div_clk:
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
@@ -1874,8 +1860,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

