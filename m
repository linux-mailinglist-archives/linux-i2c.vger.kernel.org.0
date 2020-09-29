Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42AD27DBDC
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729694AbgI2WWG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbgI2WU4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:56 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC70AC0613D4;
        Tue, 29 Sep 2020 15:20:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id w11so7450575lfn.2;
        Tue, 29 Sep 2020 15:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ldr/AOkdXvs270BHGs96eyBmp9vWy9sgokGffsTIoVI=;
        b=X8L4ieBrIgXTKQhWEQYL4ycWq6txMqaMs+EBWXJqb2XoI4nFCFvBAPyCEAGPMf2WGO
         pHWBDiwN3BhlN5kKfRb2uWR1sEw/f+/+GLLYLE21oetqavxuHsOAX5DZ5maPK9LPzqYu
         U1Az1reZrZ1kurY2sIgnkvxyZbueYbgejWG1uqi5ldSC4S+O5HnUuPjCg/S3uGg93Av8
         zeb5WQUYCP7anoNmq414wyRH7660v4pS1TsTFgXVN6RCLRZOoUgoJLPJNPDfPpqFBnf7
         M5/HFbX18YBnVivNEsMvSPQ37sYQRhvjYsv1wBHlSY9qLsGWw5R0IWpgRKICGScnN8tJ
         wf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ldr/AOkdXvs270BHGs96eyBmp9vWy9sgokGffsTIoVI=;
        b=Ls6scIcM9bs33WX4WN7TH5wVGA8gcQ2i6KXAOUiW5NSMjC772WV8ohklh8woUbN3mv
         hFBfwh0VYSZPqcGX0z5XgGRzIekpMjQl2VYSnJkJV1MVcEV9J2/TICAug458+ZTXMUBz
         fFJpNc0ifxYCdK45R4jr4cUIzYy3pR9m8oPHAIu4ue//pQfn2L9QXA28nuBlGSkZkNtU
         u+De7ZI2ltfdrv7uME9bhlzVswTzRMZH6ViQ3lCP0OTYAor6Lmo6ygTI3kJIamuLCbUe
         RXe9HMafo4DWrH5qtaqmNV7VO+MZSefnamVjIZQsH+sb+dbrBqo/IhPS3Ow3wnDpFdep
         7z7Q==
X-Gm-Message-State: AOAM533IK6OUYb3JSg5HNsMhXS9i5AE58TSBvzJ5BCaL8iFMvRQO8gOY
        +XD4AREyDKXrvEcZsiVQ4mUtxPCoN6o=
X-Google-Smtp-Source: ABdhPJyMmXJvNJ/Cmzfg4rZSV0Rjp6gcYt+UlMtjNvRDaHdkA2zuAb7g3rdxU6XNBsTADdZSuYtPdQ==
X-Received: by 2002:a19:430f:: with SMTP id q15mr2209823lfa.191.1601418049742;
        Tue, 29 Sep 2020 15:20:49 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 14/32] i2c: tegra: Clean up probe function
Date:   Wed, 30 Sep 2020 01:18:57 +0300
Message-Id: <20200929221915.10979-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

