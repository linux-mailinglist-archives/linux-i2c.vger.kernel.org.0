Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE20027DBB9
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgI2WVL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729344AbgI2WVI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:21:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8712C0613DA;
        Tue, 29 Sep 2020 15:21:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a15so5355751ljk.2;
        Tue, 29 Sep 2020 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5sq+YU4Azw4BWs8shUrZ8+IFi6863RO03MohpkrFUQ=;
        b=pzF5gNnrpvWRJiTjqku2TrWplDfNzWofO59Mv7dGCXtPjer3v/dzKPmyIcIXXOh5sU
         GDBHt3KEGk6crCe/uqo1M4KEaPg6Zb8TFJZnsHwmHZkizOjQRaEfWS8P1hnWhiy/oorv
         Ij1M9cMnf04Hass5gHVhSP7ywx/okDBJQuG6d7mNk+TyGBq7A7MD2X9c8nQYknS8cu1S
         QaXAjgj/gJJPl84NbpgjODu4r2uHVCuSHzqA+hThCeOnZs15/aCGD1m2vRDlcns519oY
         kuH7c7Vg8VEEreh5NVjvA6ntWU0pVX9CN3ezcf1KkWw5L2af6fLOhWUAqYqGMQsWPdH9
         yNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x5sq+YU4Azw4BWs8shUrZ8+IFi6863RO03MohpkrFUQ=;
        b=amSGBtBqhrPF2t4PgtKD7xYRmnQf0/uQdFG47/i99iHeliRYECYMhFdqktLL4NrGkt
         oJbqBpYmr8AM2Pn6i1D7pM4aHCgkspnMkeW4gALjBir9vRVR18LiWSrNKvv0HEJ0Xoze
         5qTAnKo8UtN8zJIBYXRwmL1jGkdUp4+ATujsbfYqayitqKZNJk31liBW4RPEz4I/qbkr
         C6ps9Lrnsucx2WVMUWMcsNGN5AzVeqUQfWiautuhcq04QkbtSyDDgG8JRQx1f1iSSTbj
         kZKPb6GewLrv/LlKPawjA5Si1dHsJznInBEsrDEIMd/tFGx/4s8Xax/ApnMz1+EEcXjH
         obIg==
X-Gm-Message-State: AOAM533dDtM2J+X31tiwoT/npyYvshf5AgR7fbPdMIDNnslMEbKvD3eb
        CvzYKHtrH3kQ97eED/WbXEM=
X-Google-Smtp-Source: ABdhPJzcZ/Q4ZARelxmOMzC1YvI6juPUO6sbJDm37hy5aZiGSW7TueGyZw00SgrAJh3R8w/vYN6L7w==
X-Received: by 2002:a2e:9212:: with SMTP id k18mr2007059ljg.241.1601418060346;
        Tue, 29 Sep 2020 15:21:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 25/32] i2c: tegra: Factor out hardware initialization into separate function
Date:   Wed, 30 Sep 2020 01:19:08 +0300
Message-Id: <20200929221915.10979-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out hardware initialization into a separate function from the probe
function. The only place where runtime PM needs to be resumed during probe
is the place of hardware initialization, hence it makes sense to factor
out it in order to have a bit cleaner error handling in tegra_i2c_probe().

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2d18a35dc18c..d8fc5cdcc310 100644
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

