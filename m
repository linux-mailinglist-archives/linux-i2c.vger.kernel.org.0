Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0901E260882
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgIHCP4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgIHCLu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:11:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BB4C061797;
        Mon,  7 Sep 2020 19:11:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so5443563ljk.0;
        Mon, 07 Sep 2020 19:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHZBmS//DKgloRMzbyQpmnOh0K1tBY6VABjMBXpbtz0=;
        b=c+BPUPuotzOcWSghINHQROv9//BUwlSfg5E4UeJlptTZEh9SnBmZLgPzQX59mQShrH
         uhjEQovZ8ypxEXG1Mb+g+PN8CeauwvnunQJ9j4Kwx7Pb7I/H7qRlvWgYYsKX1WEkO8M4
         1xbwBFhAZVXpBGk+cdu9imD0hfZCIvRj1PJ6rCrdGBox4rQ7XcvWCRfHbkiklVCKhw73
         KnmMDyw5Cm4Ttoqj6O/vAvfCcbDXQv6TZ5TI6e6A1tZ2UOCMVUlSkeh/06xqG5jBh2CJ
         u5b78N1AkIXcJtxmqlYe2TOWVIcMciw6LV8ahTlpC7iwYs+nnLBzI3Nswq3P4ZHVlVom
         /9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHZBmS//DKgloRMzbyQpmnOh0K1tBY6VABjMBXpbtz0=;
        b=DMMKB5KjGJ865yfrruKIlLaDzGNTk24JZX/NqSF81Y32enRP/54qDAKjnI7BIB+hIH
         P6cQExDFLJQ5rOA+xvNHFnBlvn/nG65/xGXGWJ8IHXAjRAxKrl73tUB1ew3RPsJ5ObM9
         c+8IXDq2V7R4f42/TcG6LlZA8WuC4iZ+uWrPn3NWGXLKZAX1vIQt1mBlXKvciiKZNqq8
         OsrcWIsIK5PVa/2/RJAz0RehGyWUOgwUoShkHljkLfoPBn9fmDFrVcdUNqS2eDj1SCN1
         awRNbXMYkpQrVdFyYS9KywgfL1okngKhaLl4FWXgQhOeG6oAL0jmCtPZ83kEShtrpXzx
         jUYA==
X-Gm-Message-State: AOAM533F/KYo9YhNjxl0Y4wtl29EL776GgdS0s6FAeLDnbT6V17eKEXx
        uK9srSHm5Dlam++tCvi3gYPMAWrTcd4=
X-Google-Smtp-Source: ABdhPJzBzcEIEpdkOEfHlOJ8q4Ps09yizoo7jOjiNehX3qMjfy8wVVFzLVkqHPsX7IDEBdhW4U2EGw==
X-Received: by 2002:a05:651c:1056:: with SMTP id x22mr12559913ljm.81.1599531106221;
        Mon, 07 Sep 2020 19:11:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/35] i2c: tegra: Use clk-bulk helpers
Date:   Tue,  8 Sep 2020 05:09:58 +0300
Message-Id: <20200908021021.9123-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use clk-bulk helpers and factor out clocks initialization into separate
function in order to make code cleaner.

The clocks initialization now performed after reset-control initialization
in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bulk
helper which doesn't silence this error code. Hence reset_control_get()
now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
driver that provides reset controls and BPMP doesn't come up early during
boot. Previously rst was protected by the clocks retrieval and now this
patch makes dev_err_probe() to be used for the rst error handling.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++---------------------
 1 file changed, 67 insertions(+), 120 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 505b5d37077d..d2fe0f1704a5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -165,9 +165,6 @@ enum msg_end_type {
  * @has_continue_xfer_support: Continue transfer supports.
  * @has_per_pkt_xfer_complete_irq: Has enable/disable capability for transfer
  *		complete interrupt per packet basis.
- * @has_single_clk_source: The I2C controller has single clock source. Tegra30
- *		and earlier SoCs have two clock sources i.e. div-clk and
- *		fast-clk.
  * @has_config_load_reg: Has the config load register to load the new
  *		configuration.
  * @clk_divisor_hs_mode: Clock divisor in HS mode.
@@ -208,7 +205,6 @@ enum msg_end_type {
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
 	bool has_per_pkt_xfer_complete_irq;
-	bool has_single_clk_source;
 	bool has_config_load_reg;
 	int clk_divisor_hs_mode;
 	int clk_divisor_std_mode;
@@ -236,7 +232,8 @@ struct tegra_i2c_hw_feature {
  * @hw: Tegra I2C HW feature
  * @adapter: core I2C layer adapter information
  * @div_clk: clock reference for div clock of I2C controller
- * @fast_clk: clock reference for fast clock of I2C controller
+ * @clocks: array of I2C controller clocks
+ * @nclocks: number of clocks in the array
  * @rst: reset control for the I2C controller
  * @base: ioremapped registers cookie
  * @base_phys: physical base address of the I2C controller
@@ -265,8 +262,8 @@ struct tegra_i2c_dev {
 	const struct tegra_i2c_hw_feature *hw;
 	struct i2c_adapter adapter;
 	struct clk *div_clk;
-	struct clk *fast_clk;
-	struct clk *slow_clk;
+	struct clk_bulk_data *clocks;
+	unsigned int nclocks;
 	struct reset_control *rst;
 	void __iomem *base;
 	phys_addr_t base_phys;
@@ -662,25 +659,9 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_enable(i2c_dev->fast_clk);
-	if (ret < 0) {
-		dev_err(i2c_dev->dev,
-			"Enabling fast clk failed, err %d\n", ret);
+	ret = clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
+	if (ret)
 		return ret;
-	}
-
-	ret = clk_enable(i2c_dev->slow_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable slow clock: %d\n", ret);
-		goto disable_fast_clk;
-	}
-
-	ret = clk_enable(i2c_dev->div_clk);
-	if (ret < 0) {
-		dev_err(i2c_dev->dev,
-			"Enabling div clk failed, err %d\n", ret);
-		goto disable_slow_clk;
-	}
 
 	/*
 	 * VI I2C device is attached to VE power domain which goes through
@@ -691,17 +672,14 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 	if (i2c_dev->is_vi) {
 		ret = tegra_i2c_init(i2c_dev);
 		if (ret)
-			goto disable_div_clk;
+			goto disable_clocks;
 	}
 
 	return 0;
 
-disable_div_clk:
-	clk_disable(i2c_dev->div_clk);
-disable_slow_clk:
-	clk_disable(i2c_dev->slow_clk);
-disable_fast_clk:
-	clk_disable(i2c_dev->fast_clk);
+disable_clocks:
+	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
+
 	return ret;
 }
 
@@ -709,9 +687,7 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
-	clk_disable(i2c_dev->div_clk);
-	clk_disable(i2c_dev->slow_clk);
-	clk_disable(i2c_dev->fast_clk);
+	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
 
 	return pinctrl_pm_select_idle_state(i2c_dev->dev);
 }
@@ -1479,7 +1455,6 @@ static struct i2c_bus_recovery_info tegra_i2c_recovery_info = {
 static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_continue_xfer_support = false,
 	.has_per_pkt_xfer_complete_irq = false,
-	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_mode = 0,
 	.clk_divisor_fast_mode = 0,
@@ -1504,7 +1479,6 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = false,
-	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
 	.clk_divisor_std_mode = 0,
 	.clk_divisor_fast_mode = 0,
@@ -1529,7 +1503,6 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_mode = 0x19,
 	.clk_divisor_fast_mode = 0x19,
@@ -1554,7 +1527,6 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_mode = 0x19,
 	.clk_divisor_fast_mode = 0x19,
@@ -1579,7 +1551,6 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_mode = 0x19,
 	.clk_divisor_fast_mode = 0x19,
@@ -1604,7 +1575,6 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_mode = 0x16,
 	.clk_divisor_fast_mode = 0x19,
@@ -1629,7 +1599,6 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
-	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
 	.clk_divisor_std_mode = 0x4f,
 	.clk_divisor_fast_mode = 0x3c,
@@ -1666,13 +1635,58 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
+static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned int i;
+	int err;
+
+	err = devm_clk_bulk_get_all(i2c_dev->dev, &i2c_dev->clocks);
+	if (err < 0)
+		return err;
+
+	i2c_dev->nclocks = err;
+
+	err = clk_bulk_prepare(i2c_dev->nclocks, i2c_dev->clocks);
+	if (err)
+		return err;
+
+	for (i = 0; i < i2c_dev->nclocks; i++) {
+		if (!strcmp(i2c_dev->clocks[i].id, "div-clk")) {
+			i2c_dev->div_clk = i2c_dev->clocks[i].clk;
+			break;
+		}
+	}
+
+	if (!i2c_dev->is_multimaster_mode)
+		return 0;
+
+	err = clk_enable(i2c_dev->div_clk);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
+		goto unprepare_clocks;
+	}
+
+	return 0;
+
+unprepare_clocks:
+	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
+
+	return err;
+}
+
+static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
+{
+	if (i2c_dev->is_multimaster_mode)
+		clk_disable(i2c_dev->div_clk);
+
+	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
+}
+
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra_i2c_dev *i2c_dev;
 	struct resource *res;
-	struct clk *div_clk;
-	struct clk *fast_clk;
 	void __iomem *base;
 	phys_addr_t base_phys;
 	int irq;
@@ -1688,21 +1702,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	div_clk = devm_clk_get(&pdev->dev, "div-clk");
-	if (IS_ERR(div_clk)) {
-		if (PTR_ERR(div_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "missing controller clock\n");
-
-		return PTR_ERR(div_clk);
-	}
-
 	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
 		return -ENOMEM;
 
 	i2c_dev->base = base;
 	i2c_dev->base_phys = base_phys;
-	i2c_dev->div_clk = div_clk;
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
 	i2c_dev->adapter.retries = 1;
 	i2c_dev->adapter.timeout = 6 * HZ;
@@ -1712,12 +1717,17 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(&pdev->dev, "missing controller reset\n");
+		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
+			      "failed to get reset control\n");
 		return PTR_ERR(i2c_dev->rst);
 	}
 
 	tegra_i2c_parse_dt(i2c_dev);
 
+	ret = tegra_i2c_init_clocks(i2c_dev);
+	if (ret)
+		return ret;
+
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						  "nvidia,tegra20-i2c-dvc");
@@ -1729,46 +1739,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c_dev->msg_complete);
 	init_completion(&i2c_dev->dma_complete);
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-		if (IS_ERR(fast_clk)) {
-			dev_err(&pdev->dev, "missing fast clock\n");
-			return PTR_ERR(fast_clk);
-		}
-		i2c_dev->fast_clk = fast_clk;
-	}
-
-	if (i2c_dev->is_vi) {
-		i2c_dev->slow_clk = devm_clk_get(dev, "slow");
-		if (IS_ERR(i2c_dev->slow_clk)) {
-			if (PTR_ERR(i2c_dev->slow_clk) != -EPROBE_DEFER)
-				dev_err(dev, "failed to get slow clock: %ld\n",
-					PTR_ERR(i2c_dev->slow_clk));
-
-			return PTR_ERR(i2c_dev->slow_clk);
-		}
-	}
-
 	platform_set_drvdata(pdev, i2c_dev);
 
-	ret = clk_prepare(i2c_dev->fast_clk);
-	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare(i2c_dev->slow_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare slow clock: %d\n", ret);
-		goto unprepare_fast_clk;
-	}
-
-	ret = clk_prepare(i2c_dev->div_clk);
-	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
-		goto unprepare_slow_clk;
-	}
-
 	/*
 	 * VI I2C is in VE power domain which is not always on and not
 	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
@@ -1785,21 +1757,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto put_rpm;
 	}
 
-	if (i2c_dev->is_multimaster_mode) {
-		ret = clk_enable(i2c_dev->div_clk);
-		if (ret < 0) {
-			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
-				ret);
-			goto put_rpm;
-		}
-	}
-
 	if (i2c_dev->hw->supports_bus_clear)
 		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
 
 	ret = tegra_i2c_init_dma(i2c_dev);
 	if (ret < 0)
-		goto disable_div_clk;
+		goto put_rpm;
 
 	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
@@ -1834,20 +1797,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 release_dma:
 	tegra_i2c_release_dma(i2c_dev);
 
-disable_div_clk:
-	if (i2c_dev->is_multimaster_mode)
-		clk_disable(i2c_dev->div_clk);
-
 put_rpm:
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	clk_unprepare(i2c_dev->div_clk);
-
-unprepare_slow_clk:
-	clk_unprepare(i2c_dev->slow_clk);
-
-unprepare_fast_clk:
-	clk_unprepare(i2c_dev->fast_clk);
+	tegra_i2c_release_clocks(i2c_dev);
 
 	return ret;
 }
@@ -1858,16 +1811,10 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c_dev->adapter);
 
-	if (i2c_dev->is_multimaster_mode)
-		clk_disable(i2c_dev->div_clk);
-
 	pm_runtime_disable(&pdev->dev);
 
-	clk_unprepare(i2c_dev->div_clk);
-	clk_unprepare(i2c_dev->slow_clk);
-	clk_unprepare(i2c_dev->fast_clk);
-
 	tegra_i2c_release_dma(i2c_dev);
+	tegra_i2c_release_clocks(i2c_dev);
 	return 0;
 }
 
-- 
2.27.0

