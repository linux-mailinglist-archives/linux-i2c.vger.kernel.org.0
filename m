Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411EB2622C9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgIHWlS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbgIHWkr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DADC061755;
        Tue,  8 Sep 2020 15:40:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so959658ljk.8;
        Tue, 08 Sep 2020 15:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DrVLHYam86b5sg92T3Noj715XaTTRZtUMxwVoek/NFY=;
        b=YcAviJs9bu0V3KbV/FlxweAbSo6vcDlU/D+FpRl1QZpacZ4cREaCW8XRTGGVTbVYpq
         hEiyI2kwrwEWa+sMOf8+DeGEa5ViUgCu8chvQ4TWcvCpCf48bCiEsecKxad85X34FXuh
         p47F36mXlwPeXb7jUomM3vI0qTJ88jrTGRVrQ44rnQ0knM0AqPpMG2QcPjYVtqdzvPkV
         Q3atsCd9TEk0DLa7EpX1H2gEKUAd1Z19dMHsZlNOlDsPtJNQWwfNa7QNlQ8wJs1ikmVB
         mKhn+6PuOg/EAk2SjFOyBhlwqHXS3ElVrf6To4fz6S8pbAL5vVAq1f3PTWtqaNMJQt0O
         A45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DrVLHYam86b5sg92T3Noj715XaTTRZtUMxwVoek/NFY=;
        b=jP6qWT8rquNPfV9yxcM8tCT6bCNE+wRtE4zUB8Tw1HH7A4pkUPg0RDaC0Ua68DOoGS
         +kvjLNVTfhJGB1xuPuVvJd8GOyDITwZg7yPtDh6YmCp8biccx2+6knUR7eeGgmrE4Fp3
         UaXWHU7/vP3ejn8FM5U6uuLr7Bm5ByMmu7ecZPhflg9nq9X234Wt/iQT1ylF1lUYAsI2
         0gW0Fbia1TfsbbEXJqQnAbgX5VZ6ogwbGtTScr6jcWY8a4KetkpVCGZpka5i8ryA8KH0
         lW6/AzuPXnMjjiDfyyKvhiUgO7b5M5QmdZV4pzMOfxrwoRncHVDjhFrPQwTM+mgwzZsz
         6SZw==
X-Gm-Message-State: AOAM531OBbAhuISfkvTHxsUD2VBHyF65M5//yjhc2yUPBOucRPBMHa/q
        WzBlNPQbB/DtAKkuJEULoqA=
X-Google-Smtp-Source: ABdhPJwZZs1kgoiw9MTPiD7TieniCk0hhIhYiTNo3j19mQqhnmlcg94VaOKcm1Eg2/iWQPF2Ms4YPA==
X-Received: by 2002:a2e:88c4:: with SMTP id a4mr316433ljk.393.1599604845280;
        Tue, 08 Sep 2020 15:40:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 14/34] i2c: tegra: Clean up probe function
Date:   Wed,  9 Sep 2020 01:39:46 +0300
Message-Id: <20200908224006.25636-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe function code is a bit difficult to read. This patch
reorders code of the probe function, forming groups of code that are easy
to work with. The probe tear-down order now matches the driver-removal
order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 79d1cefdc901..7c91bbb3f95c 100644
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
@@ -1693,34 +1696,42 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1734,14 +1745,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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
@@ -1759,49 +1765,41 @@ static int tegra_i2c_probe(struct platform_device *pdev)
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

