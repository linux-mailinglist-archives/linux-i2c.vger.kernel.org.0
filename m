Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D78B25826E
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbgHaUXi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730002AbgHaUXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FEFC061755;
        Mon, 31 Aug 2020 13:23:35 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d2so4253654lfj.1;
        Mon, 31 Aug 2020 13:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CXR3qFOucIlowGPKcNGJFAMcsQBtXy750zI361J9ej4=;
        b=Alz/nBPN6UfECssskFJIiKHc3/mteaugVOqVMlHw3bXKBJttjUJTf4b4Tyus/coSIZ
         njVtt3ABX2ZIAsjd3MI2UP+4Z4LRTOm4UtHRAWnDc+LOZd33r4+kqOJiYPKkLJZqYD+I
         n3zW0H07tzKEZBoD/mHREy5rSoPCanYmG5f9dWyFVyR7p1cSxd6qgHcDf+y7ftKOQRM5
         FXhM7vyvZcrNMmEG3wK8Aewh4G7qDkBkYOuh6W7+ep7EXG9s8FfdH3/48Ozu0NvxZXyH
         8oJBoh9OAXcbNLMexnLcxVaGXUWQgzSCfFWWNMzMdOkwOMfgJeAAkTcmQpPEeX0q+Hwe
         2/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXR3qFOucIlowGPKcNGJFAMcsQBtXy750zI361J9ej4=;
        b=A9+vzwIddAUCTpQbUiDwgIWcEJHL4U6dhz5nQTVaWyZVUmIpaS4UVpMlUxDIcV40zj
         1TVANE5NU/WkYrmynTTHrxxmPRUtwVDbJo2hqo4/jw3Awsy8q02Qm4rueq8HtRQgG6GJ
         is+BM3JXjpCrRwJQ7IdgYjIiQZkN5Hhm288SrMPDfftD8bpeVVFaAQAjYCEBeSQnJd/t
         EQUZWvHJYHaNvfYbPUesubxLe4EEV1Mk9scNJHfgQ+PZ7wQZHmL6jzV69OVTS+EUYoRB
         B08p1CtoIGSnMCVR/BhnAZBQupJUFMQyslzn1GfGNVOWfWFHZs1iTVvgM/gfcfPYHr1E
         Ag4g==
X-Gm-Message-State: AOAM530DOIWGkXFxhAvxGPQNYWKAZZtt7IBTraic17ZcUqP4zCe0lEmL
        wmEn0/VNti9Rz6BXYYH3Uos=
X-Google-Smtp-Source: ABdhPJyTQ3qcwMOeLXC2wZ+bXSCVbAo9h1Anvs04+EJuot5/Ejb+UlRLYbnEvvUk5C/insA/nLtCoQ==
X-Received: by 2002:a19:818a:: with SMTP id c132mr1457536lfd.76.1598905414167;
        Mon, 31 Aug 2020 13:23:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/12] i2c: tegra: Clean up probe function
Date:   Mon, 31 Aug 2020 23:23:00 +0300
Message-Id: <20200831202303.15391-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver's probe function code is difficult to read and follow. This
patch splits probe function into several logical parts that are easy to
work with.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 398 ++++++++++++++++++++-------------
 1 file changed, 240 insertions(+), 158 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ca8c16b1c049..57a3e1a9eef7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -447,6 +447,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 	i2c_dev->tx_dma_chan = chan;
 
+	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
+				I2C_PACKET_HEADER_SIZE;
+
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
@@ -1417,19 +1420,27 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
-static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
+	u32 bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 	bool multi_mode;
-	int ret;
 
-	ret = of_property_read_u32(np, "clock-frequency",
-				   &i2c_dev->bus_clk_rate);
-	if (ret)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
+	of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
+	i2c_dev->bus_clk_rate = bus_clk_rate;
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->is_multimaster_mode = multi_mode;
+
+	i2c_dev->hw = of_device_get_match_data(i2c_dev->dev);
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
+
+	return 0;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1644,221 +1655,292 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
-static int tegra_i2c_probe(struct platform_device *pdev)
+static int tegra_i2c_init_resources(struct tegra_i2c_dev *i2c_dev,
+				    struct platform_device *pdev)
 {
-	struct clk *div_clk, *fast_clk, *slow_clk;
-	struct device *dev = &pdev->dev;
-	struct tegra_i2c_dev *i2c_dev;
-	phys_addr_t base_phys;
 	struct resource *res;
-	void __iomem *base;
-	int irq, ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_phys = res->start;
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(dev, "no irq resource\n");
+	if (WARN_ON(!res))
 		return -EINVAL;
-	}
-	irq = res->start;
 
-	div_clk = devm_clk_get(&pdev->dev, "div-clk");
-	if (IS_ERR(div_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(div_clk),
-				     "failed to get div-clk\n");
+	i2c_dev->base_phys = res->start;
 
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
-		return -ENOMEM;
+	i2c_dev->base = devm_ioremap_resource(i2c_dev->dev, res);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
 
-	i2c_dev->base = base;
-	i2c_dev->base_phys = base_phys;
-	i2c_dev->div_clk = div_clk;
-	i2c_dev->adapter.algo = &tegra_i2c_algo;
-	i2c_dev->adapter.retries = 1;
-	i2c_dev->adapter.timeout = 6 * HZ;
-	i2c_dev->irq = irq;
-	i2c_dev->cont_id = pdev->id;
-	i2c_dev->dev = &pdev->dev;
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (WARN_ON(!res))
+		return -EINVAL;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
-	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(dev, "failed to get controller reset: %pe\n",
-			i2c_dev->rst);
+	i2c_dev->irq = res->start;
 
-		return PTR_ERR(i2c_dev->rst);
-	}
+	return 0;
+}
 
-	tegra_i2c_parse_dt(i2c_dev);
+static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
+{
+	const struct tegra_i2c_hw_feature *hw = i2c_dev->hw;
+	struct device *dev = i2c_dev->dev;
+	struct clk *clk;
+	int err, mode;
+
+	clk = devm_clk_get(dev, "div-clk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get div-clk\n");
 
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
-						  "nvidia,tegra20-i2c-dvc");
-	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
-						 "nvidia,tegra210-i2c-vi");
-	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
-	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
-				I2C_PACKET_HEADER_SIZE;
-	init_completion(&i2c_dev->msg_complete);
-	init_completion(&i2c_dev->dma_complete);
+	i2c_dev->div_clk = clk;
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-		if (IS_ERR(fast_clk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(fast_clk),
-					     "failed to get fast clock\n");
+	if (!hw->has_single_clk_source) {
+		clk = devm_clk_get(dev, "fast-clk");
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get fast clk\n");
 
-		i2c_dev->fast_clk = fast_clk;
+		i2c_dev->fast_clk = clk;
 	}
 
 	if (i2c_dev->is_vi) {
-		slow_clk = devm_clk_get(dev, "slow");
-		if (IS_ERR(slow_clk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(slow_clk),
-					     "failed to get slow clock\n");
+		clk = devm_clk_get(dev, "slow");
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get slow clk\n");
 
-		i2c_dev->slow_clk = slow_clk;
+		i2c_dev->slow_clk = clk;
 	}
 
-	platform_set_drvdata(pdev, i2c_dev);
-
-	ret = clk_prepare(i2c_dev->fast_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare fast clock: %d\n", ret);
-		return ret;
+	err = clk_prepare(i2c_dev->fast_clk);
+	if (err) {
+		dev_err(dev, "failed to prepare fast clk: %d\n", err);
+		return err;
 	}
 
-	ret = clk_prepare(i2c_dev->slow_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare slow clock: %d\n", ret);
+	err = clk_prepare(i2c_dev->slow_clk);
+	if (err) {
+		dev_err(dev, "failed to prepare slow clk: %d\n", err);
 		goto unprepare_fast_clk;
 	}
 
-	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
-	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_PLUS_FREQ)
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_fast_plus_mode;
-	else if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
-		 i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_FREQ)
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_fast_mode;
-	else
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_std_mode;
-
-	ret = clk_prepare(i2c_dev->div_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare div-clk: %d\n", ret);
+	err = clk_prepare(i2c_dev->div_clk);
+	if (err) {
+		dev_err(dev, "failed to prepare div-clk: %d\n", err);
 		goto unprepare_slow_clk;
 	}
 
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
 	if (i2c_dev->is_multimaster_mode) {
-		ret = clk_enable(i2c_dev->div_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable div-clk: %d\n", ret);
-			goto put_rpm;
+		err = clk_enable(i2c_dev->div_clk);
+		if (err) {
+			dev_err(dev, "failed to enable div-clk: %d\n", err);
+			goto unprepare_div_clk;
 		}
 	}
 
-	if (i2c_dev->hw->supports_bus_clear)
-		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+	switch (i2c_dev->bus_clk_rate) {
+	case I2C_MAX_FAST_MODE_FREQ ... I2C_MAX_FAST_MODE_PLUS_FREQ:
+		mode = hw->clk_divisor_fast_plus_mode;
+		break;
 
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret < 0)
-		goto disable_div_clk;
+	case I2C_MAX_STANDARD_MODE_FREQ ... I2C_MAX_FAST_MODE_FREQ - 1:
+		mode = hw->clk_divisor_fast_mode;
+		break;
 
-	ret = tegra_i2c_init(i2c_dev, false);
-	if (ret) {
-		dev_err(dev, "failed to initialize i2c controller\n");
-		goto release_dma;
+	default:
+		mode = hw->clk_divisor_std_mode;
+		break;
 	}
 
-	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
+	i2c_dev->clk_divisor_non_hs_mode = mode;
 
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret) {
-		dev_err(dev, "failed to request irq %i\n", i2c_dev->irq);
-		goto release_dma;
+	return 0;
+
+unprepare_div_clk:
+	clk_unprepare(i2c_dev->div_clk);
+unprepare_slow_clk:
+	clk_unprepare(i2c_dev->slow_clk);
+unprepare_fast_clk:
+	clk_unprepare(i2c_dev->fast_clk);
+
+	return err;
+}
+
+static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
+{
+	if (i2c_dev->is_multimaster_mode)
+		clk_disable(i2c_dev->div_clk);
+
+	clk_unprepare(i2c_dev->div_clk);
+	clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->fast_clk);
+}
+
+static int tegra_i2c_init_reset_control(struct tegra_i2c_dev *i2c_dev)
+{
+	struct device *dev = i2c_dev->dev;
+	struct reset_control *rst;
+
+	rst = devm_reset_control_get_exclusive(dev, "i2c");
+	if (IS_ERR(rst)) {
+		dev_err(dev, "failed to get controller reset: %pe\n", rst);
+		return PTR_ERR(rst);
 	}
 
-	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
+	i2c_dev->rst = rst;
+
+	return 0;
+}
+
+static int tegra_i2c_init_adapter(struct tegra_i2c_dev *i2c_dev)
+{
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
+	strscpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
 		sizeof(i2c_dev->adapter.name));
-	i2c_dev->adapter.dev.parent = &pdev->dev;
-	i2c_dev->adapter.nr = pdev->id;
-	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
 
-	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
-	if (ret)
-		goto release_dma;
+	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 
-	pm_runtime_put(&pdev->dev);
+	return 0;
+}
+
+static int tegra_i2c_init_runtime_pm(struct tegra_i2c_dev *i2c_dev)
+{
+	/*
+	 * VI I2C is in VE power domain which is not always ON and not
+	 * IRQ-safe. Thus, IRQ-safe device shouldn't be attached to a
+	 * non IRQ-safe domain because this prevents powering off the power
+	 * domain.
+	 *
+	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
+	 * be used for atomic transfers.
+	 */
+	if (!i2c_dev->is_vi)
+		pm_runtime_irq_safe(i2c_dev->dev);
+
+	pm_runtime_enable(i2c_dev->dev);
 
 	return 0;
+}
 
-release_dma:
-	tegra_i2c_release_dma(i2c_dev);
+static void tegra_i2c_release_runtime_pm(struct tegra_i2c_dev *i2c_dev)
+{
+	pm_runtime_disable(i2c_dev->dev);
+}
 
-disable_div_clk:
-	if (i2c_dev->is_multimaster_mode)
-		clk_disable(i2c_dev->div_clk);
+static int tegra_i2c_init_interrupt(struct tegra_i2c_dev *i2c_dev)
+{
+	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
 
-put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
+	return devm_request_irq(i2c_dev->dev, i2c_dev->irq, tegra_i2c_isr,
+				IRQF_NO_SUSPEND, dev_name(i2c_dev->dev),
+				i2c_dev);
+}
 
-disable_rpm:
-	pm_runtime_disable(&pdev->dev);
-	clk_unprepare(i2c_dev->div_clk);
+static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
+{
+	int ret;
 
-unprepare_slow_clk:
-	clk_unprepare(i2c_dev->slow_clk);
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
-unprepare_fast_clk:
-	clk_unprepare(i2c_dev->fast_clk);
+	ret = tegra_i2c_init(i2c_dev, false);
+	pm_runtime_put(i2c_dev->dev);
 
 	return ret;
 }
 
-static int tegra_i2c_remove(struct platform_device *pdev)
+static int tegra_i2c_probe(struct platform_device *pdev)
 {
-	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+	struct tegra_i2c_dev *i2c_dev;
+	int err;
 
-	i2c_del_adapter(&i2c_dev->adapter);
+	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
+	if (!i2c_dev)
+		return -ENOMEM;
 
-	if (i2c_dev->is_multimaster_mode)
-		clk_disable(i2c_dev->div_clk);
+	platform_set_drvdata(pdev, i2c_dev);
 
-	pm_runtime_disable(&pdev->dev);
+	init_completion(&i2c_dev->msg_complete);
+	init_completion(&i2c_dev->dma_complete);
 
-	clk_unprepare(i2c_dev->div_clk);
-	clk_unprepare(i2c_dev->slow_clk);
-	clk_unprepare(i2c_dev->fast_clk);
+	i2c_dev->cont_id = pdev->id;
+	i2c_dev->dev = &pdev->dev;
+
+	err = tegra_i2c_parse_dt(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_resources(i2c_dev, pdev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_adapter(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_reset_control(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_interrupt(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_clocks(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_runtime_pm(i2c_dev);
+	if (err)
+		goto release_clocks;
+
+	err = tegra_i2c_init_dma(i2c_dev);
+	if (err)
+		goto release_rpm;
+
+	err = tegra_i2c_init_hardware(i2c_dev);
+	if (err)
+		goto release_dma;
+
+	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
+	if (err)
+		goto release_dma;
+
+	return 0;
+
+release_dma:
+	tegra_i2c_release_dma(i2c_dev);
+release_rpm:
+	tegra_i2c_release_runtime_pm(i2c_dev);
+release_clocks:
+	tegra_i2c_release_clocks(i2c_dev);
+
+	return err;
+}
+
+static int tegra_i2c_remove(struct platform_device *pdev)
+{
+	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&i2c_dev->adapter);
 
 	tegra_i2c_release_dma(i2c_dev);
+	tegra_i2c_release_runtime_pm(i2c_dev);
+	tegra_i2c_release_clocks(i2c_dev);
 
 	return 0;
 }
-- 
2.27.0

