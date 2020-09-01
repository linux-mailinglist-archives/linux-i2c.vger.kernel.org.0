Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CE425A07E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgIAVLm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbgIAVLe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:34 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEC7C061249;
        Tue,  1 Sep 2020 14:11:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so3303176ljd.1;
        Tue, 01 Sep 2020 14:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULaOztD74OSTG1+kWd+VH/aLpegv1mFhAzUeElTs0qM=;
        b=TyKYVltlSS23ZSl8C4BJIq5EmiqKodA4NJAAzXI+6ajFQjlG4x+ukhei0dtFaB4VAE
         dEYjAqmQoT9sgSIOobYpi/UiUUgXeicZSWzS9FRqsgHBeGAzuPXkJE0hl52r13w4XEAb
         2NUw90xMGYv8rXBInx9Tun4mx+8FFbacFrNA7ww0ff0tGimxmC8OJE6/uUIUOODrJZaO
         oRFTkgEBiQXDX1v3ImgddhRQTeH6y4/C4mwFzFO2k7sK6DdM32mnckJ86IHOoMEWlmJO
         DBoYmB7r7KKyQYmmKK2WuUwucPHKXT9OtTq0oQe8bl444YTfFZYOFVc/8k32mSaDKM4T
         8eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULaOztD74OSTG1+kWd+VH/aLpegv1mFhAzUeElTs0qM=;
        b=mxoC48XFpO6Xwgk5m0sJ70T8qeKp3pLSFi3w6LTLlkD9twLCxPc9NsmrrzGnqQIrIC
         zdP75vK6OcXtma+q0092FCpzEF47u2nfqSdmYL7yvo9Jqsff7oRU09WD+GJQkBpUGMe2
         h0zyXDvkwbx2u6pgVkYg/182Y2bwMVQv3a7tW5pB2A3PVegkAkx0KmgwxwvO2LjfFuEb
         P4mCKY8JkCExHMiq4WJAUdliDMlIO6Fy39oVJ4H2pYuP+7OMZuFzhK8S+FQjHSsX862U
         LB2M8N6awWWqq8qv+fNj8r9TXTDh/CVyiGG+HG9mctxg4cL35iJqc8/1xIrElbAGfgsX
         kszA==
X-Gm-Message-State: AOAM530xUodIlcGqIBMLQMZix3Qbv7gyWYy/TJmROekLO+4iFnbKsmzK
        ZGTHx+Ksany4PrfShJOhI/s=
X-Google-Smtp-Source: ABdhPJy+7LSy+rn935AMuflyh/7dh9M9paa8A+kn/iPXkUSGbJ1CW3iCFkYG7h47fz0XdTkIbbQVzQ==
X-Received: by 2002:a2e:80c9:: with SMTP id r9mr1403653ljg.95.1598994691266;
        Tue, 01 Sep 2020 14:11:31 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/17] i2c: tegra: Runtime PM always available on Tegra
Date:   Wed,  2 Sep 2020 00:10:53 +0300
Message-Id: <20200901211102.11072-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The runtime PM is guaranteed to be always available on Tegra after commit
40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
all the RPM-availability checking and handling from the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c142b424e46d..a5d9e3ce6320 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1767,18 +1767,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra_i2c_runtime_resume(&pdev->dev);
-		if (ret < 0) {
-			dev_err(dev, "runtime resume failed\n");
-			goto unprepare_div_clk;
-		}
-	} else {
-		ret = pm_runtime_get_sync(i2c_dev->dev);
-		if (ret < 0) {
-			dev_err(dev, "runtime resume failed\n");
-			goto disable_rpm;
-		}
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(dev, "runtime resume failed\n");
+		goto disable_rpm;
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1836,16 +1828,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1867,8 +1853,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

