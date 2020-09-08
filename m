Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF1F262321
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgIHWoh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbgIHWkc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:32 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E70FC061786;
        Tue,  8 Sep 2020 15:40:31 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so958990ljk.8;
        Tue, 08 Sep 2020 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vFGzjwGX1HKX5lyPoG6GisXiLAg0DIxIZ91bMI/VsTM=;
        b=eMQPVJTFqzzJJU+fR1Tg+FLsWgFN/WttSJ65sBIBxxA3wfUjHpw2LcCkM5bHLXNlNN
         bKiaq/r9BU2C+JZtfnqjUNthJ5ArsUMGQkDf0aX1GPJ9daIcMMG3BFj7a1YNk2S2yj2g
         UNrDfGtw63L5fTZcwlKflDzhF0Y79CHwksg7y1KeUC56crN5ynnK2xDCu8t9gdpcPQ4j
         Gz50RlHcm3DAZDEKkng1Xz65DkwC8QD7VD4htL/HO0MMNjD8ZQB5iRTS8CP5w8Ik78/M
         njU1vFOR4Y2DQlDxUS4gUgWUXGBIhcb7cVDxmCcCzqDZDDE591S9C1OFCJsX8KoivhRt
         wTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFGzjwGX1HKX5lyPoG6GisXiLAg0DIxIZ91bMI/VsTM=;
        b=csCphjvJetgadCfgTH6YbTCpTRQnM+JTnGF1ZsO6CmjHOZLP6xfgvMTN4FnGXYNmWT
         5aWIdj8XnmUcA2RhHFRB05xKZmwSmY4Ec9FP+ptn2ATXt5NcgV86spa+PFCjRVLTwcG0
         RlW5gWX8naMSuWVT1bQnra61onjHtYz5q8rkm3EoQp+U5czt2hXVX+Sy1nJif48po/PT
         TpAVL4LaWZACNxF9+5X3xeJTaZYFo261h7rz00iyATLo9p157Q9ETKyAIsalKe2uLSb1
         BYTw98KwqpTd83C/Owv5WbcL9q6dInEdSxNPCR13L4E0cLl+yOOWQSopmas2nXLeBV7v
         WR5w==
X-Gm-Message-State: AOAM533at+Ha/xOKip5wUbAIF7HqjP4bpwXOlU5SadrLj5c6k8tPJNjy
        sykAhSmPOAUX0yNijV6FSLg=
X-Google-Smtp-Source: ABdhPJzeEztwjLNlGWUlc+lV5x86WPM0cYBqg0EEIBlUrmuwFbj7tx6coINFI/LyfMT6KlHYSXy1Yg==
X-Received: by 2002:a2e:9d1:: with SMTP id 200mr314298ljj.349.1599604829725;
        Tue, 08 Sep 2020 15:40:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/34] i2c: tegra: Runtime PM always available on Tegra
Date:   Wed,  9 Sep 2020 01:39:39 +0300
Message-Id: <20200908224006.25636-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85ed0e02d48c..a52c72135390 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1775,18 +1775,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
-			goto put_rpm;
-		}
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(dev, "runtime resume failed\n");
+		goto put_rpm;
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1845,15 +1837,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 put_rpm:
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_put_sync(&pdev->dev);
-	else
-		tegra_i2c_runtime_suspend(&pdev->dev);
-
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-
-unprepare_div_clk:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
@@ -1875,8 +1860,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

