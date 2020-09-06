Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C2425EFD4
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgIFSyz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729188AbgIFSv4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFF6C061797;
        Sun,  6 Sep 2020 11:51:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u21so3321189ljl.6;
        Sun, 06 Sep 2020 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DLAhz+Bq5mPhbzVRHcJk+NFap+tOjmrurF3MUtG+8/k=;
        b=eTPEh1DX/NPu8bUhhIQlg3odCm49VheCYzwfo6JJdR0Zzjri8MzuHB/PHRq15MSYXK
         ifdnx9JM1UnMvs6HKiMQ6By76gCU9aTQbv2GPbnyhLcv5nr13voEZHIGLkbrOD11MbGx
         jWtD6pmkJrhBWWERYUAPTo+w8c6KO2kov4vUUAAitvuMFCjFpWZAE9GfpoeWVQEvD7HZ
         NZIhfOazOSQNAMZm5eC5MOUPZbDXVGAY/SifZWWuCdXuI8xWJrj4lc2nODp+ZKAokRma
         whPoHrCNENmrxZOCvzW+1WYUQug5uKiZ4GcjlMCENs5lZbS5escBb0G7/AtJoj9s+2x3
         FEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLAhz+Bq5mPhbzVRHcJk+NFap+tOjmrurF3MUtG+8/k=;
        b=nLUmqsUjNHsOhEK7s4o4z0+qpVAahwB89kNjticXI4a+dJw0smm5pkvo2lrXqN/cia
         Y+gUQwSTIPzlBEPYOA5n6rLzSj8io+6t9DRGSHeRVlFI//cm/8sExtYBAMyvOQ5Jkv+n
         iFQLfA8Y/xBJHlbXXfl0nydZuJjxSLoj1UQFZKQVZmVOiKLk727weuE2ZFGSQbXHuvb7
         JRH5i3+Zd6384v8qeAdD4fEDuwv1tU3Ok8Rud9/+VEyTjPUhS66NUDUGeOAdOlHgix07
         5McAO0s4ngJKi7ZgB22h2GilYFXEtHK+N072kVdRIam5AIunU1d9QrHCwglR9/u1LPR4
         7cVg==
X-Gm-Message-State: AOAM530v0OQX1pRk5K8USAAzimA+bvJQCuM3nPCa0TXGRl5P/ps8TuTF
        Vg0X/rE0jGcWDlkU//Qq9X0=
X-Google-Smtp-Source: ABdhPJxANXPfi/cPDxXJXRfGHwY9GCY4bgXzhGjjAq4bJV7samWHDjoclkABpCsOCc0z5Xq31Ar2Xw==
X-Received: by 2002:a2e:b051:: with SMTP id d17mr8178238ljl.190.1599418310715;
        Sun, 06 Sep 2020 11:51:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/36] i2c: tegra: Clean up probe function
Date:   Sun,  6 Sep 2020 21:50:16 +0300
Message-Id: <20200906185039.22700-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe function code is a bit difficult to read. This patch
reorders code of the probe function, forming groups of code that are easy
to work with. The reset_control_get() now may return -EPROBE_DEFER on
newer Tegra SoCs because they use BPMP driver that provides reset controls
and BPMP doesn't come up early during boot, previously rst was protected
by other checks error checks in the code, hence dev_err_probe() is used
now for the rst. The probe tear-down order now matches the driver-removal
order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 145 +++++++++++++++++----------------
 1 file changed, 73 insertions(+), 72 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ae4b80b522ab..b4df0351252e 100644
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
@@ -1680,57 +1683,60 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 
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
-		dev_err(&pdev->dev, "missing controller reset\n");
+		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
+			      "failed to get reset control\n");
 		return PTR_ERR(i2c_dev->rst);
 	}
 
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
@@ -1740,62 +1746,57 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 * not be used for atomic transfers.
 	 */
 	if (!i2c_dev->is_vi)
-		pm_runtime_irq_safe(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0) {
-		dev_err(dev, "runtime resume failed\n");
+		pm_runtime_irq_safe(i2c_dev->dev);
+
+	pm_runtime_enable(i2c_dev->dev);
+
+	err = pm_runtime_get_sync(i2c_dev->dev);
+	if (err < 0) {
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", err);
 		goto disable_rpm;
 	}
 
-	if (i2c_dev->hw->supports_bus_clear)
-		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
-
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret < 0)
+	/* initialize hardware state */
+	err = tegra_i2c_init(i2c_dev);
+	if (err)
 		goto put_rpm;
 
-	ret = tegra_i2c_init(i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
-		goto release_dma;
-	}
+	i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
+	i2c_dev->adapter.dev.parent = i2c_dev->dev;
+	i2c_dev->adapter.retries = 1;
+	i2c_dev->adapter.timeout = 6 * HZ;
+	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
+	i2c_dev->adapter.owner = THIS_MODULE;
+	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
+	i2c_dev->adapter.algo = &tegra_i2c_algo;
+	i2c_dev->adapter.nr = i2c_dev->cont_id;
 
-	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
+	if (i2c_dev->hw->supports_bus_clear)
+		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret)
-		goto release_dma;
+	strlcpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
+		sizeof(i2c_dev->adapter.name));
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
-	i2c_dev->adapter.owner = THIS_MODULE;
-	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
-	strlcpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
-		sizeof(i2c_dev->adapter.name));
-	i2c_dev->adapter.dev.parent = &pdev->dev;
-	i2c_dev->adapter.nr = pdev->id;
-	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
 
-	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
-	if (ret)
-		goto release_dma;
+	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
+	if (err)
+		goto put_rpm;
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(i2c_dev->dev);
 
 	return 0;
 
-release_dma:
-	tegra_i2c_release_dma(i2c_dev);
-
 put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
-
+	pm_runtime_put(i2c_dev->dev);
 disable_rpm:
-	pm_runtime_disable(&pdev->dev);
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

