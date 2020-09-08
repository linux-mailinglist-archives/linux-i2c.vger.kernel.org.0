Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EE02622EB
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIHWmh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730099AbgIHWlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CE6C06179B;
        Tue,  8 Sep 2020 15:40:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so960110ljk.8;
        Tue, 08 Sep 2020 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xsrTDZsPANlBlVqC91x6N4Fz7EajBgNDYNawxzVHs1M=;
        b=aZ1HvNn97AouC9BNqcj+//07v+vLdVTMKB1MPiWaEgS6q3G3ENI/b0G13/GaS+La88
         lqMkDHI12IO9wV/X87bTC5kk7Nwa5CeCeqJWAHHJM/4XgtrW01bSJw32t2zBT5ZLJkKB
         qY/zdRnyhaegsEU69ZKCHfVQXAzsCcHsYP6XxOUA5w83olb4bE+whzL2nfmGXl32IAcI
         TBNgDxmpEZZzzs6QfqAkDd3Pnd5t4N9QH7jXj8brtVpKHnO3SDVZaP/QHxR2DvobnYFI
         /Ul7TeYUWWgRvMc+aq0wTgE16TwGWdAPisEDHE8eu0V9xLFJlTSJgw2LOI4Yg4cI5Ao4
         1e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xsrTDZsPANlBlVqC91x6N4Fz7EajBgNDYNawxzVHs1M=;
        b=LVPmN45uK6fSGbir5QGMWlAmyxqx7xnCn7VFrlzNcqM0Y7UTzbc+hysHYcdDvGp4vx
         7CWjn7VbWny+cN9+eSNg9+Q3MQzJ/nOT3lip/lPoOeV8s0O1Tkf+7PluaG3U7RGOA+Pb
         yP9RKomfHYrk6fzJFvIyzANGVZJA99jltRnV9+RtzBFcGHfC+KtjpZ/dzDgEwBfidZ6J
         VuylgETMFO+76MeAF0iRINdCwqdtUUh9RRfwfWlnfTsjD9luU8HCIifD2E7KAdnMzeXU
         36vIMZqswOFOgB5q9dHRyyTzWMOH/BCuQmIZlnjOGznw8nVi/AwIo+5gVGgbNbJK+zt0
         VpvA==
X-Gm-Message-State: AOAM532SlRrpFEiGYtwtdh0d+8KoVq9T58JjGo6DuUft6aTxT8GZGDS1
        KPxILI1HSKS8YXrWe3iNdKs=
X-Google-Smtp-Source: ABdhPJzOF9qWatisc3SQjVSmEAQV1LFLrz69M4S6yh2DkDrU1u6q8kdAvdOHN07hNMZdrqi3OVGeVQ==
X-Received: by 2002:a2e:93cd:: with SMTP id p13mr364352ljh.460.1599604856207;
        Tue, 08 Sep 2020 15:40:56 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:55 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 26/34] i2c: tegra: Factor out hardware initialization into separate function
Date:   Wed,  9 Sep 2020 01:39:58 +0300
Message-Id: <20200908224006.25636-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out hardware initialization into a separate function from the probe
function. The only place where runtime PM needs to be resumed during probe
is the place of hardware initialization, hence it makes sense to factor
out it in order to have a bit cleaner error handling in tegra_i2c_probe().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e071de9ce106..2f39366b6d55 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1661,9 +1661,23 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
 }
 
+static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0)
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+	else
+		ret = tegra_i2c_init(i2c_dev);
+
+	pm_runtime_put(i2c_dev->dev);
+
+	return ret;
+}
+
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
 	int ret;
@@ -1729,15 +1743,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0) {
-		dev_err(dev, "runtime resume failed\n");
-		goto put_rpm;
-	}
 
-	ret = tegra_i2c_init(i2c_dev);
+	ret = tegra_i2c_init_hardware(i2c_dev);
 	if (ret)
-		goto put_rpm;
+		goto release_rpm;
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
@@ -1758,14 +1767,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (ret)
-		goto put_rpm;
-
-	pm_runtime_put(&pdev->dev);
+		goto release_rpm;
 
 	return 0;
 
-put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
+release_rpm:
 	pm_runtime_disable(&pdev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
-- 
2.27.0

