Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0FC274CD9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgIVWwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgIVWwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B08C0613D4;
        Tue, 22 Sep 2020 15:52:38 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b22so19823825lfs.13;
        Tue, 22 Sep 2020 15:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NQDTn8/paWdL/pwnku/IwamIuSJ7KTI3l6GJXVub5jw=;
        b=qRnVSVIvckTKNGXj4Q90RbXCycLBJYYUtSK/raParHSwm48LjYwUMvImCu4SOhMnc2
         5H54rMP9whMxCOzT6XfBTJMf/Qq59151/hvB4XKuD7Qc2fbPnP04I3px7nfaaTXdTFqs
         xwO837Sp12dbr3aURhj3MDUyfJZ/GmVimJ9ypFcJW4nivqfFmz2Q3ouBMHH0m7eT5108
         ZLecWGVzgrD/Jhg/tE9NWhFCcoMNnI4m8LMHdlBlPGSTG3Tvc9oPj77Fn++TO7edaxW0
         jqGKftTp2tSAs9d6bZC27mYdPn/vvW5Ec6MDEUTKOzMs72Tl8v9yUoP3lgotoWYEr6vn
         1SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQDTn8/paWdL/pwnku/IwamIuSJ7KTI3l6GJXVub5jw=;
        b=RpLO0WvBmNpVh8y0YOYh1D367OIDAAItA2vsbAXlJ+PAxLHKQVQODUQjh8F4q8XisT
         RTfG9VtcwVJjxrLPhWg9R14khTPMGpHmqwoBaMQTowz5DbHAi/6GUguN75jFCixf/qDs
         U0mf1TSsgxR+Z1qH7wMCVcxe6Loh77+z4vsgwkXkOY3OqMADdVXEwq3sSbJKbuqAJzpc
         e2ZY3mRNx7gVEa+wRi/r6cxx3YABvDYeIbRT0nN3lHEUuQLQ61xtvh0EJcR0RQR1CCIN
         Tguw/TcEM+g8nUjovFHz1pT1dw6YEH93bNBo8nEJdXF1yXWfkdFk6+sM3uPGo0nXufI6
         yesg==
X-Gm-Message-State: AOAM532V6d3u5OTDQ5vcw/b2QVX8vsNzSEX7nDMpkK6zXIaKYiUOnYKZ
        1QI7zVw60IDR5zktALjAHSA=
X-Google-Smtp-Source: ABdhPJxdU1Mt8YEDYB4u2W/+qUz9P5jac4N6ELkKClIbOhvOt9p99Qd5MD8YE4YNibmpI/s099BvXA==
X-Received: by 2002:a19:8087:: with SMTP id b129mr2543392lfd.471.1600815156741;
        Tue, 22 Sep 2020 15:52:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 07/32] i2c: tegra: Runtime PM always available on Tegra
Date:   Wed, 23 Sep 2020 01:51:30 +0300
Message-Id: <20200922225155.10798-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The runtime PM is guaranteed to be always available on Tegra after commit
40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
all the RPM-availability checking and handling from the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
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

