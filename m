Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8CE25EACB
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgIEUmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbgIEUmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BE0C061247;
        Sat,  5 Sep 2020 13:42:31 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a22so5396361ljp.13;
        Sat, 05 Sep 2020 13:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ta5qHCzRrnR28z/BnbtAtyxJbaAe9wUkZ6uuDPTRwxA=;
        b=PdtNQhURgAwKBJT/SY+TPQu0e3aQPXNuDzqupfCk1GXlp93BXQUbQrodWSqfls8Y6c
         YCpHKkRV9pMGstevuIIVoT2OlDPNtRv03cJXcKs25CkPf900L7fXVMGkcT0Zl1CjUJ9+
         X6TS9EF7cQ3YAgPYIFw8ddFMS8z4ULYeOESKlH1sieLBJQpFofM3XXCBjafZQ6BnWTtr
         FHaQPWl/ukU4GoMrgMUJOy56V9guRSGBaxwQ40Sfo8lTUpeKvaBwG0oIOo/qKaWJNz2n
         4HER4W4XFNN2JtydolKioIAymKSn/r2TwLIMuWd8I21P/EogyAt47gfSBPWGqLhtYDLC
         U8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ta5qHCzRrnR28z/BnbtAtyxJbaAe9wUkZ6uuDPTRwxA=;
        b=CajBe92Zg/ASkYt989CboKj4o0zUZgvDNlICQz7IwCqsaznBerLwlnUMxGTPVdE12t
         HXKgeuDM6MsS+HFfCKxBnASkOJl9dumDAUvI6dxDHt7ASJprRaZq+fSodpj6gXzGeeGq
         sur95nMwe0XqDg2WjB6+nKqFDXNlv25UowtixsT+Kt3AyZefa3No6HrDUyvcz/P/txEx
         YRwdGEqk1tU3Cw2kVT0xtt0DpZy9l3PYVrqYeUoUiXeGWtAxE+wGY7Mxx+IUAsKNLmtx
         GyKf0I+kswXceC8RFDrK4aIq7S3/MlUVD5+AS+F5BVeDrD0RR9CuJRHuvYWxJ9WQfaHj
         bgQg==
X-Gm-Message-State: AOAM530Wx5JwjKmFOkxmPDr50cvCmNdAqjAYPL888XOLIluvnrrmI08r
        tgpLdCTYscNnlb7D4gY22pg=
X-Google-Smtp-Source: ABdhPJzIRd1Ri6HcWL8xIJshTNYAWydqMHq4/xyxc+iL+wlxHcli1Nv01UZLDT8Hrx9N67ntSYiTUw==
X-Received: by 2002:a2e:97da:: with SMTP id m26mr7192335ljj.9.1599338549593;
        Sat, 05 Sep 2020 13:42:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/31] i2c: tegra: Runtime PM always available on Tegra
Date:   Sat,  5 Sep 2020 23:41:25 +0300
Message-Id: <20200905204151.25343-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
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
index f5b9cdb65182..9f0269bffab4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1771,18 +1771,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1841,16 +1833,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1872,8 +1858,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

