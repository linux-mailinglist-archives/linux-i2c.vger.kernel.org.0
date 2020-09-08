Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B6E26086C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgIHCP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgIHCMA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E111C061799;
        Mon,  7 Sep 2020 19:11:49 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z17so8278147lfi.12;
        Mon, 07 Sep 2020 19:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kCyEsKR0un5niH6gxtptQbiMsjxv3WuucENMOeiVIdo=;
        b=lTWhurnFIjL3s22RvrWf+mATezimZRnvwTBABxHtYlhJHg01vKS5B0IVzV7BiAqV7P
         dpCQ6qlYu5wN3ihCWyudv8oAc7PouWvX927jdFBNh+e/pZTM0yLh+hTdD4tKboh0bnNs
         iF7OkdvIodaz6fs7vjoVHAGfWwLXky/OkIRnkioMUpElJ5G/ma1Bx7/W+xVpkcWiUilh
         KnxrL8Rpax6waN8Ww4+FrQY6xemeLDtfIMaaQUVzA7y1Gs7FhLGUMWAlnwBw3Ve7SVNh
         0RELBrudfBcu3WB3xb2R53klEsFzFiznxY9PB0MdztfM4KgaoBB9MLn1rOCJ/45+z1ib
         003g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kCyEsKR0un5niH6gxtptQbiMsjxv3WuucENMOeiVIdo=;
        b=APNr8CqrZDkEado8zZWyYAw7uehe175lcUqjK9BO7mLu27Rkf5hy0905RYfUZSvGCP
         +npa+eeWhRRKM7HaYgCLRNuMZXpnN8JtDP8pa3FHM8hI1Nc7Bw6vdCwX65k0ry/tOEz4
         IiJJiXADlfcYWM2P6qQ4s1PORWkQFVSgVwxBBzSH5HVkvKhzgdbFCqjcsrOhm3439UgO
         D0wfJh3kW/EOoVk/DikpV0b+sla26zgygDtGWPXiWEjvvu+tCryqqhyhkjc0lj2i/QS8
         cPH7BB83cqV83cFz0R95sJaGAF8/kyjDvlph55vdHirgapvGfK51Ie9gqqgdUzDLs94y
         lNIQ==
X-Gm-Message-State: AOAM533KhFSGoNZjto025Z7fiJLGS++HU6kVRobCO8TVQG+/Jjao8EUd
        qhaokOLvKuzTuAhrEzuUbWo=
X-Google-Smtp-Source: ABdhPJzClpLCo4Ht4G/uPEbOf+KJSXede6woAFncTWfr32pa+8azWbEqnniF5jczfO4RW6WNmfPR0w==
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr11388832lfg.179.1599531108041;
        Mon, 07 Sep 2020 19:11:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 14/35] i2c: tegra: Clean up probe function
Date:   Tue,  8 Sep 2020 05:10:00 +0300
Message-Id: <20200908021021.9123-15-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe function code is a bit difficult to read. This patch
reorders code of the probe function, forming groups of code that are easy
to work with.

The probe tear-down order now matches the driver-removal order.

All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
code style across the driver.

The "ret" variable renamed to "err" since it only carries error code and
the new name clearly shows that.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 141 +++++++++++++++++----------------
 1 file changed, 71 insertions(+), 70 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e20937041504..01637e1fccde 100644
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
@@ -1690,38 +1693,45 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
-	void __iomem *base;
-	phys_addr_t base_phys;
-	int irq;
-	int ret;
-
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	base_phys = res->start;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	int err;
 
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
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	i2c_dev->base_phys = res->start;
+
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
+
+	i2c_dev->irq = err;
+
+	/* interrupt will be enabled during of transfer time */
+	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
+
+	err = devm_request_irq(i2c_dev->dev, i2c_dev->irq, tegra_i2c_isr,
+			       IRQF_NO_SUSPEND, dev_name(i2c_dev->dev),
+			       i2c_dev);
+	if (err)
+		return err;
+
+	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
 		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 			      "failed to get reset control\n");
@@ -1730,18 +1740,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	tegra_i2c_parse_dt(i2c_dev);
 
-	ret = tegra_i2c_init_clocks(i2c_dev);
-	if (ret)
-		return ret;
-
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
-	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
-				I2C_PACKET_HEADER_SIZE;
-	init_completion(&i2c_dev->msg_complete);
-	init_completion(&i2c_dev->dma_complete);
+	err = tegra_i2c_init_clocks(i2c_dev);
+	if (err)
+		return err;
 
-	platform_set_drvdata(pdev, i2c_dev);
+	err = tegra_i2c_init_dma(i2c_dev);
+	if (err)
+		goto release_clocks;
 
 	/*
 	 * VI I2C is in VE power domain which is not always on and not
@@ -1751,60 +1756,56 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * not be used for atomic transfers.
 	 */
 	if (!i2c_dev->is_vi)
-		pm_runtime_irq_safe(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0) {
-		dev_err(dev, "runtime resume failed\n");
-		goto put_rpm;
-	}
+		pm_runtime_irq_safe(i2c_dev->dev);
 
-	if (i2c_dev->hw->supports_bus_clear)
-		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+	pm_runtime_enable(i2c_dev->dev);
 
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret < 0)
+	err = pm_runtime_get_sync(i2c_dev->dev);
+	if (err < 0) {
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", err);
 		goto put_rpm;
-
-	ret = tegra_i2c_init(i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
-		goto release_dma;
 	}
 
-	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
-
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret)
-		goto release_dma;
+	/* initialize hardware state */
+	err = tegra_i2c_init(i2c_dev);
+	if (err)
+		goto put_rpm;
 
-	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
+	i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
+	i2c_dev->adapter.dev.parent = i2c_dev->dev;
+	i2c_dev->adapter.retries = 1;
+	i2c_dev->adapter.timeout = 6 * HZ;
+	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->adapter.owner = THIS_MODULE;
 	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
-	strlcpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
+	i2c_dev->adapter.algo = &tegra_i2c_algo;
+	i2c_dev->adapter.nr = i2c_dev->cont_id;
+
+	if (i2c_dev->hw->supports_bus_clear)
+		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+
+	strlcpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
 		sizeof(i2c_dev->adapter.name));
-	i2c_dev->adapter.dev.parent = &pdev->dev;
-	i2c_dev->adapter.nr = pdev->id;
-	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
 
-	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
-	if (ret)
-		goto release_dma;
+	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 
-	pm_runtime_put(&pdev->dev);
+	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
+	if (err)
+		goto put_rpm;
 
-	return 0;
+	pm_runtime_put(i2c_dev->dev);
 
-release_dma:
-	tegra_i2c_release_dma(i2c_dev);
+	return 0;
 
 put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put(i2c_dev->dev);
+	pm_runtime_disable(i2c_dev->dev);
+
+	tegra_i2c_release_dma(i2c_dev);
+release_clocks:
 	tegra_i2c_release_clocks(i2c_dev);
 
-	return ret;
+	return err;
 }
 
 static int tegra_i2c_remove(struct platform_device *pdev)
-- 
2.27.0

