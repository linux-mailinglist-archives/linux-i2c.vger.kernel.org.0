Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC3825EFC6
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgIFSyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgIFSwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:04 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71052C061574;
        Sun,  6 Sep 2020 11:52:03 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a15so13643958ljk.2;
        Sun, 06 Sep 2020 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nvn2f/4+8sCzljp1osiX9wS9Z7EWgRWa4imR+nB9se4=;
        b=gXCjl7Ve079ZOk7ndjATpuAR3yDEFq2rtZXxj+yFWq09LczJgy2JpRTzK85nzf3W/D
         DphlzmjnUV6z9IwT8GHO4EtuQNLztc2qAhLRFxVcNUxY9XLWsexe0y469wqCGeSJowqP
         XTJk0Nnlq7b1QP9p8raTo9Xqz9IRjBmli2MXWoybXAXvX3P7ZYgi/d6mTRvdAi+MjL4m
         iW3NwG17xNLt/QrHSO4iX2luwJV1pdY/eLa2/P7cduFrqLjO+7/wxESYOdXegxxVVmhj
         FZxxn8XyPpJf/42Sb7ANL0brV1ciICj0KN2vvrZpI2dinEa3hSUqts25VlyOBHHeH6fF
         3vxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nvn2f/4+8sCzljp1osiX9wS9Z7EWgRWa4imR+nB9se4=;
        b=NzKPnTkPCmZckeqWMxlilKfsgBePAC7qjIzzu1Pka4eBf8NfNr8wCyz31obIB9zzYB
         cF4iQ+aUkhj05bK4hTZOV+O2EKtgHcbCK62MCg1gF8gSnNWcAoTLjpnsUhfFin+oP+eL
         OP7w7Eb97rmjGSntL7+5WYyJHXcuyQ2BEK16WqWeyACsb7XwRgROIvsDC278AUm5CggL
         LiCCTwXYZ6+L5r8LfhoiRXn0LTqdHt0Qz98C8i0thZERb7zpy2vKJSZNhuaE9hGP3ZzD
         BNrfvqO3nYO8pz4rcV5iPcv1Q8Z4PGwPKrn/9y2U6S0M+ndvQaesu3JxslXGYotNR2/K
         43vQ==
X-Gm-Message-State: AOAM531ocXGJjASwsX2nrVZY0iOZWFK+iM+g7ROymfZxpKS1QZIlgijr
        v/y+eHPTvgFe8BNOGTc2n8w=
X-Google-Smtp-Source: ABdhPJyvgtBz7DMBt+79iccUBmve1OV0Zkp60ysLwoqAAZb3X/VFpgFGJRpS4DT642GcOm09kPgUYg==
X-Received: by 2002:a2e:800e:: with SMTP id j14mr162366ljg.145.1599418321898;
        Sun, 06 Sep 2020 11:52:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:52:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 26/36] i2c: tegra: Factor out hardware initialization into separate function
Date:   Sun,  6 Sep 2020 21:50:29 +0300
Message-Id: <20200906185039.22700-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 36 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b5ec540ae2c6..5fe138ead45e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1684,6 +1684,23 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
 }
 
+static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = tegra_i2c_init(i2c_dev);
+
+	pm_runtime_put(i2c_dev->dev);
+
+	return ret;
+}
+
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct tegra_i2c_dev *i2c_dev;
@@ -1753,16 +1770,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(i2c_dev->dev);
 
-	err = pm_runtime_get_sync(i2c_dev->dev);
-	if (err < 0) {
-		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", err);
-		goto disable_rpm;
-	}
-
-	/* initialize hardware state */
-	err = tegra_i2c_init(i2c_dev);
+	err = tegra_i2c_init_hardware(i2c_dev);
 	if (err)
-		goto put_rpm;
+		goto release_rpm;
 
 	i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
 	i2c_dev->adapter.dev.parent = i2c_dev->dev;
@@ -1784,15 +1794,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (err)
-		goto put_rpm;
-
-	pm_runtime_put(i2c_dev->dev);
+		goto release_rpm;
 
 	return 0;
 
-put_rpm:
-	pm_runtime_put(i2c_dev->dev);
-disable_rpm:
+release_rpm:
 	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
-- 
2.27.0

