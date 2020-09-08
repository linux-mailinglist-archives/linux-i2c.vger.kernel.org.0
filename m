Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2529260889
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbgIHCQR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbgIHCLo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:44 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7243CC0613ED;
        Mon,  7 Sep 2020 19:11:43 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so18045828ljc.3;
        Mon, 07 Sep 2020 19:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vFGzjwGX1HKX5lyPoG6GisXiLAg0DIxIZ91bMI/VsTM=;
        b=T5y9qhD98NS9lAKyvB7qsB4SlfoBe6Juq/2QacU0JtvFXyHAB1xQ8sQoG21fSaNiCR
         QKJpEf24zVDTnItxK4P/ppOUFmJMd0Nqnk5mtthHwx6yVGdDobW4MJVZB+jsZ9I+iIFv
         7u+y6LXKnjnGiZ4A+SNSYBZEBstRCDEKu1lVzk5hHtkjd3WWQNF5R0ZJdH3NxsO5Naet
         QXxNezItUcP0bwVrUiBJO/2Pl0Io5AUCllbfCnmy6ff2JBOuYEJ8wsM5sY3TINjSJEO0
         6JNquyjfzZJTvteBV6BIPtkdLj1FfO+0HxqwqtrIDi9ZtRsXOmrI9O/l2n3KbJ5H2nHj
         NQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFGzjwGX1HKX5lyPoG6GisXiLAg0DIxIZ91bMI/VsTM=;
        b=DVtHF7kAEiCnZJFm9wDEr3p8jKPN3+pz3IElYYHQyrp6T1nshyGyW+bN2RMG06Ffcf
         BD6bpPCXP72aA6sRsv9oOSy2Uq5kNUlmFxdYQYzR/9FAVEiyumg3+NRwHAKmNHUp6IXo
         P0qKBH2833EqzKcrhcrf2DXVmmUwGp3pBbf9jF8IpLvKnLJf7PT8M4HmXJ+w6OD0+YGE
         406rH93sG8QJiciUC0onOHeJq4dvKZ/Y/YalZ/arEk+CSP8P5GjfIu6SHmcOCvL5H2rF
         tTYofA16F5LMG+ZzcEgHoeel+XnTQcrdsO94pDaRlsfQ4QUMvFaIiWjVYWhgaX9HNK6P
         9M9Q==
X-Gm-Message-State: AOAM531XVYqOgmCRBSibRozu5UAZj0kNPNc27d0cGcTu2PKla/WPHUaS
        Nu29LmNlb/Aq5OzegUfuYgo=
X-Google-Smtp-Source: ABdhPJyrQLtWtUtIPtGlO2UJGpCycfMwO0MduT3Qk3o8BSX0UetXZ2XYI7Oy1ZuSLypOxlTDJC0EFw==
X-Received: by 2002:a05:651c:141:: with SMTP id c1mr996963ljd.182.1599531101953;
        Mon, 07 Sep 2020 19:11:41 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/35] i2c: tegra: Runtime PM always available on Tegra
Date:   Tue,  8 Sep 2020 05:09:53 +0300
Message-Id: <20200908021021.9123-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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

