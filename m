Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456F125B7EC
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgICAzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgICAyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:01 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C70C061246;
        Wed,  2 Sep 2020 17:54:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so1356002ljj.12;
        Wed, 02 Sep 2020 17:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pWvuVJzRgBYCg/ozyN+DcUogROGMBuEP7qfrXN0qToE=;
        b=BRvZe0n7yjB8Wnz8/GHxPHTraviV646Injm8975SCfHLlt/hfdo1NYQrSWD+IUKbt5
         UgplEUV1L8iNWTM6am3T0/l4+aRfXawO8UZM6C0/sqC4mla4QkUMPC2F8GXqckbOD/mE
         JMsueqPg3Vm3s5w7YrLnlu/yHeBOpTmx6bYIusQyyu9zxfXhJk0o2A9SSF8nfJZslm1W
         QOyLo+u16JmVG+zFxe6yGFihUQqW85Lugv8oAVCyoAIMI/bitzEP7sdps/AfzWgUN8Iv
         QhMxId3oAoNsJZkduae1QLnehDwrYbhpbqZTQvUwntd//0VmzaHehLzJPEmUDRJC6E5u
         Crkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWvuVJzRgBYCg/ozyN+DcUogROGMBuEP7qfrXN0qToE=;
        b=d5l/jiVK86NkQxdjbTtc5ym5Ni1uu64/qqyLiPSytZKij71YnC1f6AWC6PsGT0Z/Ci
         AJAGs8qOnboDxwhhh5bswHYuwgWhPU+IV7nBj9Zn/9tLqXa0eYFlaG2/F+u5JMaQGvny
         EhCajSc79WaHIQA5yF3uUB2RoUNvw2UFjKTthEc1GgEXWdMlw29MwPdWu2kD2jPmArfO
         bI7lus4W6L5/fN/IcRPa+ehb73s4tFf4tEXzO3OqZd6D/9Gbj874wfnleYhhj2miNdJ/
         wOxDV++T9kOnY7rB8v4xhi9nmXMAlmvkz1hCf5OAnHGDI72+J7xxzF6fBL1WkMXAmwLT
         PuEQ==
X-Gm-Message-State: AOAM530KSVqFZuesm/Q6PQ8h2n+/MGWUiH9sVqZ+9mf9gvSoJJxg109N
        8AhcVSlDbpPjUAkauvaMO14=
X-Google-Smtp-Source: ABdhPJxnHtZ6wh6UliYMBSLrezM+hAbSMkyy5gkjkEEcKLQ66yundvzlhx+ADgWj2pjCfTJSHLVSHA==
X-Received: by 2002:a05:651c:200b:: with SMTP id s11mr265379ljo.196.1599094438656;
        Wed, 02 Sep 2020 17:53:58 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/22] i2c: tegra: Runtime PM always available on Tegra
Date:   Thu,  3 Sep 2020 03:52:46 +0300
Message-Id: <20200903005300.7894-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
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
index 409f6bc5caa8..a8ef8619b7ef 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1777,18 +1777,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1846,16 +1838,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1877,8 +1863,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

