Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464B125EAC8
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgIEUqT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgIEUmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604B2C061244;
        Sat,  5 Sep 2020 13:42:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w3so11781435ljo.5;
        Sat, 05 Sep 2020 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIGeaR/EXi8wiuksPWP/N0eY23B0mtzvQ3a3fQz15Mk=;
        b=aD6EowbxnBo+ViiNw/F3OeUq4tJddcWLeFkto2z+SPdHHksrLBACJwA8jNRMB7gCNM
         +rERBWqI7l0P2m3mFfiWGfzjBkKYnou8Ghty95ZyhUdINLdw2Yw+1HFdb3d2JxTFshX7
         SXSP1ZYljaFVmHoo4ptFGFjH6dCBLPKyVMa7aG6yBbMr3Z+D3Z0XbSHR+51ENKSImbir
         S28plwJqWdk74KXyisprtdLxmQTPgAY39GTat8BH+VLy8SUugGJ2/dODGQzj1jwiVMmf
         IqWB4dncy36RlescpK6yPaZEnaC/Bczw4XcZBmv2hQ47vwichhUCclPZEtFYVAsRgeSv
         y9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIGeaR/EXi8wiuksPWP/N0eY23B0mtzvQ3a3fQz15Mk=;
        b=Ax9WU9F7CKZ50guhzxG5djh0eY3W/Tgkw5J+1l8rNjZO7DfO7YuXVjl7FEs9okpJ/L
         1Xn02jnzsAdGeubHKHaboq46e2GzQh/lDWYHEDeWf0u8/er8TMUZOfouPBSooAVumImt
         L26KBUgWSqq9Y6W6nUSwEyXp1L1jsg21RqMQjn9f3FWUU3Z0RoGU5Bf+/c8f6qNbsWAN
         YmHBcv8zTCTQFdodEuHDZdx89JKvbPKAvF1gH/XQNzeOYmanPC6ynSahFM0+fjYE6tG6
         XbXeGan0n9JoYObKn9APf/bPRIJuv0PIXWCDelo+wirF0PuhUsIe87LVrlW+Q7lKc26v
         Q6fA==
X-Gm-Message-State: AOAM531PJF54+DZD73ipT9j8yHTjEvLYlwrxK8V6msWH0EA2NGSZPVXc
        38tVS166Z7ObhTX8nHsJhUGjDGxO2e4=
X-Google-Smtp-Source: ABdhPJy2bFkfPXGnlxcMSLfTlR+W7rfG7mzedVqdBaXtb1vjs6KB7sG8TbPhs1Lg9EnuL+2t1Tt2ZA==
X-Received: by 2002:a2e:9b97:: with SMTP id z23mr6284183lji.1.1599338554838;
        Sat, 05 Sep 2020 13:42:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/31] i2c: tegra: Factor out runtime PM and hardware initialization
Date:   Sat,  5 Sep 2020 23:41:31 +0300
Message-Id: <20200905204151.25343-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out runtime PM and hardware initialization into separate function
in order have a cleaner error unwinding in the probe function.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 68 +++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8e4e72dec6ea..6e5af03d0b1d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1670,6 +1670,37 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
 }
 
+static int tegra_i2c_init_runtime_pm_and_hardware(struct tegra_i2c_dev *i2c_dev)
+{
+	int ret;
+
+	/*
+	 * VI I2C is in VE power domain which is not always on and not
+	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
+	 * safe domain as it prevents powering off the PM domain.
+	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
+	 * not be used for atomic transfers.
+	 */
+	if (!i2c_dev->is_vi)
+		pm_runtime_irq_safe(i2c_dev->dev);
+
+	pm_runtime_enable(i2c_dev->dev);
+
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		pm_runtime_disable(i2c_dev->dev);
+		return ret;
+	}
+
+	/* initialize hardware state */
+	ret = tegra_i2c_init(i2c_dev);
+
+	pm_runtime_put(i2c_dev->dev);
+
+	return ret;
+}
+
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1728,41 +1759,23 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c_dev);
 
-	/*
-	 * VI I2C is in VE power domain which is not always on and not
-	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
-	 * safe domain as it prevents powering off the PM domain.
-	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
-	 * not be used for atomic transfers.
-	 */
-	if (!i2c_dev->is_vi)
-		pm_runtime_irq_safe(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0) {
-		dev_err(dev, "runtime resume failed\n");
-		goto disable_rpm;
-	}
-
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
 	ret = tegra_i2c_init_dma(i2c_dev);
 	if (ret < 0)
-		goto put_rpm;
+		goto release_clocks;
 
-	ret = tegra_i2c_init(i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
+	ret = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
+	if (ret)
 		goto release_dma;
-	}
 
 	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
 
 	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
 	if (ret)
-		goto release_dma;
+		goto release_rpm;
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 	i2c_dev->adapter.owner = THIS_MODULE;
@@ -1777,18 +1790,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		goto release_dma;
 
-	pm_runtime_put(&pdev->dev);
-
 	return 0;
 
+release_rpm:
+	pm_runtime_disable(i2c_dev->dev);
 release_dma:
 	tegra_i2c_release_dma(i2c_dev);
-
-put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
-
-disable_rpm:
-	pm_runtime_disable(&pdev->dev);
+release_clocks:
 	tegra_i2c_release_clocks(i2c_dev);
 
 	return ret;
-- 
2.27.0

