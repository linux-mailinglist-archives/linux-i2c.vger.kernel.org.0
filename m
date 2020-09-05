Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3AB25EAB6
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgIEUpq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728720AbgIEUml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A10CC06125C;
        Sat,  5 Sep 2020 13:42:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so11745777ljj.12;
        Sat, 05 Sep 2020 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yJ00lOCQCT7ORVZaWpSwIHQEVex93WHqEiG3flihqKQ=;
        b=EcbBZPpWn5meJPwWS3VmdqlFq4RAakAgIwnyCFxWCnvipviMq2gHi2FnXZaSJlPnyV
         cFqvUPTvEI2g2452PHIofFZfuoTygFhhrLHQc9lKtPnGCOgbG7bNztQlxEWTC7wQpqOr
         x0KH3E2wSgAhintBWnFYxLpqRNU25Bf+2CffiXHGkqDqHxGYPErfIZLUD2fXAe1OqOBH
         VkX87hlQX+MMSFexsM1yono1LsUCa7vugJK2T3LMEfMRR92CFJ9vG0elZGdq030AKICN
         Q99I4mu7kkq308FTc2iYBGRGGqb7SzWjCYnxp1tgbz3IBYkvJtZIfCetCOWy/kq6O2QW
         2g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yJ00lOCQCT7ORVZaWpSwIHQEVex93WHqEiG3flihqKQ=;
        b=h8Iv2o66aQrxYLtOE7j0807P8ji+fmo//aGyz4ahI9lvnPD6H0Uz+2EBS1DHktf31d
         Ijpici9xcZk+YOdW935xq7QFkNRz/VTj7B8jJS4p33Sa6zNvnf9FureVUxupmij8xyVf
         uoL8kWmw9j3T4FiqXbMJ/mrQKekAC5ZzkfC4mZmiRwC0mHdtuBzyv/Ljzg6K8dug5SUR
         ByH0YS6eGhwLk/n9dudBET1u1ztDBBpBVXDz5ICVgSMgNjmhYJuzIsWcbsDIvuNlky7v
         kGbo4Ktvf5/THgcR0M+bjgzE0Sy7C5cU+gk6WzsD+XWIVDtHr6lxnA8PyF25+MCqAnMP
         SVKg==
X-Gm-Message-State: AOAM530FQDxL4ZF9rGo+c/MYwWchsZFHr5fehDA7y+unIehfamlN8yBj
        3KN25Av9ZMmXzAzgtVIce6M=
X-Google-Smtp-Source: ABdhPJxYZWfuktbdK+RbXnXlojjcRztyAe/wVCxitYso7h7vB8QOure5SDscGnN3gcFmOTm1yY2ZkA==
X-Received: by 2002:a05:651c:32b:: with SMTP id b11mr1222693ljp.99.1599338556745;
        Sat, 05 Sep 2020 13:42:36 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/31] i2c: tegra: Clean up probe function
Date:   Sat,  5 Sep 2020 23:41:33 +0300
Message-Id: <20200905204151.25343-14-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
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
now for the rst.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 120 +++++++++++++++++----------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d6bc23bf765e..d8b7373673ea 100644
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
@@ -1711,85 +1714,88 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 {
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
+	/* initialize virt base of hardware registers */
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	/* initialize phys base of hardware registers */
+	i2c_dev->base_phys = res->start;
+
+	/* initialize controller's interrupt */
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
+	/* initialize hardware reset control */
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
-
-	platform_set_drvdata(pdev, i2c_dev);
-
-	if (i2c_dev->hw->supports_bus_clear)
-		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+	err = tegra_i2c_init_clocks(i2c_dev);
+	if (err)
+		return err;
 
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret < 0)
+	err = tegra_i2c_init_dma(i2c_dev);
+	if (err)
 		goto release_clocks;
 
-	ret = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
-	if (ret)
+	err = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
+	if (err)
 		goto release_dma;
 
-	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
-
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret)
-		goto release_rpm;
-
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
+
+	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
+	if (err)
+		goto release_rpm;
 
 	return 0;
 
@@ -1800,7 +1806,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 release_clocks:
 	tegra_i2c_release_clocks(i2c_dev);
 
-	return ret;
+	return err;
 }
 
 static int tegra_i2c_remove(struct platform_device *pdev)
-- 
2.27.0

