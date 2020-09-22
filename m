Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D2C274CCA
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgIVWyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgIVWwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:45 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB61C061755;
        Tue, 22 Sep 2020 15:52:45 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d15so19843178lfq.11;
        Tue, 22 Sep 2020 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ARdmLVn593/Qj9/GylfGnGKw6+W/73j+YRwOpUd5PQ=;
        b=PJtm4a6ULlQkRmdmhxLHrLkX1PB6OMc7UpsevpIwDCNqee0YcqhGx1pEYUhCNEHx/2
         c3IdxGVLNQhOQZv4IlX0diXGjEFhtAdoi3TkLSI9f/jOHM0WBhoLGhktjD0IOEinfACJ
         OcqCcFwN706Keg8tY7Vl/KY6jSMl58BHu6nQ008qsNGQXiXI3zKinsHJNcIx4xLDZIuL
         QG/fjnJMB3Mx8MPqQGA0gkyU+YRRuwugU1JT4OT4AbU/ZhqWqYouvpMIebeM6eb4XFRI
         d17V06URSEuaFbj3FWLF4WzCKXrKf2EhUOl1fIxi0cBW1Dc0O4WtkioZTEI4JDJH6MQX
         /bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ARdmLVn593/Qj9/GylfGnGKw6+W/73j+YRwOpUd5PQ=;
        b=EC02PRfMjjgXhiegN4YmjohZPpF8zzrwfd1Lo0RzdzxwkfG8xn+bghpEx9611YMlKG
         epeLMvLL6no4uuAdhjKk8TqqtJk+sDLdIX/Fm5xPWC8CRwqz/xFj44rTd2+xbuUpFQcH
         UGm8IdV81be32sbeuBhb7sztFBSoCobBYD/zcWqNrW3fvQUfU0Mj21KPOX1x/mMDjdHC
         S66ENQXZWX67LMoGTySQA3yh4U8CCzLxF3e4Dthz74a8breFcbq7Tqox+RsrgZiVizfZ
         YGJ0lGByGuTcwM6VlGHdxsqWiTBmBs0/Xm7zS+oDnLj3CarDROX55g7oFcX9J2lOADX1
         MiGA==
X-Gm-Message-State: AOAM531IGjYfXTake/FAY0wUoGBtLcjzzkU6f3gzqOIp5SnrkV0tHOC1
        eC7UQ429I66ZaytiOs52n/E=
X-Google-Smtp-Source: ABdhPJwWkxYICJPFxryx9tSurW1gmude3jlnuDLs73vFhwYpEjAcON4/mAdIXZAkgN1uiHAWptu5Dw==
X-Received: by 2002:a19:8bd5:: with SMTP id n204mr2633135lfd.227.1600815163483;
        Tue, 22 Sep 2020 15:52:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 14/32] i2c: tegra: Clean up probe function
Date:   Wed, 23 Sep 2020 01:51:37 +0300
Message-Id: <20200922225155.10798-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe function code is a bit difficult to read. This patch
reorders code of the probe function, forming groups of code that are easy
to work with. The probe tear-down order now matches the driver-removal
order.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9486fcba655c..56981a5506ae 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -440,6 +440,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 	i2c_dev->tx_dma_chan = chan;
 
+	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
+				I2C_PACKET_HEADER_SIZE;
+
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
@@ -1694,34 +1697,42 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
-	void __iomem *base;
-	phys_addr_t base_phys;
-	int irq;
 	int ret;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	base_phys = res->start;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	i2c_dev->base = base;
-	i2c_dev->base_phys = base_phys;
-	i2c_dev->adapter.algo = &tegra_i2c_algo;
-	i2c_dev->adapter.retries = 1;
-	i2c_dev->adapter.timeout = 6 * HZ;
-	i2c_dev->irq = irq;
+	platform_set_drvdata(pdev, i2c_dev);
+
+	init_completion(&i2c_dev->msg_complete);
+	init_completion(&i2c_dev->dma_complete);
+
+	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
 
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	i2c_dev->base_phys = res->start;
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	i2c_dev->irq = ret;
+
+	/* interrupt will be enabled during of transfer time */
+	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
+
+	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev),
+			       i2c_dev);
+	if (ret)
+		return ret;
+
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
 		dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->rst),
@@ -1735,14 +1746,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
-	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
-				I2C_PACKET_HEADER_SIZE;
-	init_completion(&i2c_dev->msg_complete);
-	init_completion(&i2c_dev->dma_complete);
-
-	platform_set_drvdata(pdev, i2c_dev);
+	ret = tegra_i2c_init_dma(i2c_dev);
+	if (ret)
+		goto release_clocks;
 
 	/*
 	 * VI I2C is in VE power domain which is not always on and not
@@ -1760,49 +1766,41 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto put_rpm;
 	}
 
-	if (i2c_dev->hw->supports_bus_clear)
-		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
-
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret < 0)
-		goto put_rpm;
-
 	ret = tegra_i2c_init(i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
-		goto release_dma;
-	}
-
-	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
-
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
 	if (ret)
-		goto release_dma;
+		goto put_rpm;
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
+	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
+	i2c_dev->adapter.dev.parent = &pdev->dev;
+	i2c_dev->adapter.retries = 1;
+	i2c_dev->adapter.timeout = 6 * HZ;
+	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->adapter.owner = THIS_MODULE;
 	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
+	i2c_dev->adapter.algo = &tegra_i2c_algo;
+	i2c_dev->adapter.nr = pdev->id;
+
+	if (i2c_dev->hw->supports_bus_clear)
+		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+
 	strlcpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
 		sizeof(i2c_dev->adapter.name));
-	i2c_dev->adapter.dev.parent = &pdev->dev;
-	i2c_dev->adapter.nr = pdev->id;
-	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
 
 	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (ret)
-		goto release_dma;
+		goto put_rpm;
 
 	pm_runtime_put(&pdev->dev);
 
 	return 0;
 
-release_dma:
-	tegra_i2c_release_dma(i2c_dev);
-
 put_rpm:
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+
+	tegra_i2c_release_dma(i2c_dev);
+release_clocks:
 	tegra_i2c_release_clocks(i2c_dev);
 
 	return ret;
-- 
2.27.0

