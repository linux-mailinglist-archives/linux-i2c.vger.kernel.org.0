Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D57274CB2
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgIVWxg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgIVWw7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1ADFC0613D8;
        Tue, 22 Sep 2020 15:52:55 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y2so19835104lfy.10;
        Tue, 22 Sep 2020 15:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFZKHQfoiStVzgHOD3Vl3XMwQ6CDFlBEXqNiQ3V7k1k=;
        b=FWVJ+szE+0bIxYL5wuoS/eSETI7hLUUuzmXWKNXh2sJh5PJtckMhrnfad2l78puFpL
         GB62EU17r15dP++AfphwZqkUrcz0WVKzKyfKDAGAdE0t5D37mch9aQKcT/fLfU7555O6
         Y3NL+eRe5XLlUP7Hu2Nmjz0lDLhVNBD+5ESEmzHtP4ZGBJp6Utuuhn9MjStrghKXtQkU
         XHLe004ffvTFEPPOYEF0KkHAG69QaCyLCBms58aM2GI9jMbV4psifbxN7a4bSSmXnbLb
         xSoN6l0yVObDSD7oADyS/YWv0XOFZTkZ2D49Fj9O7Oz8dbaEamLQHms2zlnUrFCa5FGl
         UwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFZKHQfoiStVzgHOD3Vl3XMwQ6CDFlBEXqNiQ3V7k1k=;
        b=U6tPVL2AA+V8FQKTeoVjoV4aPkTAkF1vopsY3UWniEf5ce0NwhHMFHXC2w0AFEiuR7
         H46vvZYNiar7L2NauaRNv/rD4B+ZAgV3tQDimh7dNgJhPWyrW0gfTkXIqsjNphx3sRLR
         /IRlIowh3VvBNC+LMN1JYtDn9VB2lMQniR53RXRxr0an+CGK0vz1qV+NJ2bO9Vnq3A3h
         JNBbTQAzxxe1BAZxVqgvw1cgQHafZXlcgTTQA1iguhEbvPKx6iKKMXv5lhAh6ZARSjha
         wmFUj0LRCtbMiTGpZkMmswrt1UNEsUZXVgk4shbQ59XiNb3uVmKJ+CDi0CD1LAaRoT2F
         L5qA==
X-Gm-Message-State: AOAM532gaIDgS0M1Cslze8D4u+IFiLnm+yVCqf97BPGKTDpVJ/cIRlhc
        Ocs7MXTq9H5hSJGKbeafk3Q=
X-Google-Smtp-Source: ABdhPJwR9CYqSzxn03F6LCBZy0oWeY3kzN98kPa3ks1sW0d1HMVrkHHYKhvrhnjtIsTEjCkWUX/Gnw==
X-Received: by 2002:a05:6512:3e8:: with SMTP id n8mr2391291lfq.492.1600815174258;
        Tue, 22 Sep 2020 15:52:54 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 25/32] i2c: tegra: Factor out hardware initialization into separate function
Date:   Wed, 23 Sep 2020 01:51:48 +0300
Message-Id: <20200922225155.10798-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out hardware initialization into a separate function from the probe
function. The only place where runtime PM needs to be resumed during probe
is the place of hardware initialization, hence it makes sense to factor
out it in order to have a bit cleaner error handling in tegra_i2c_probe().

Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 72ad0e8e89d2..a02675924a6f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1660,9 +1660,23 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
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
@@ -1728,15 +1742,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1757,14 +1766,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
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

