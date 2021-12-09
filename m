Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB6D46E993
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbhLIOGw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238285AbhLIOGw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:06:52 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8FEC0617A2
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 06:03:18 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d10so12180089lfg.6
        for <linux-i2c@vger.kernel.org>; Thu, 09 Dec 2021 06:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=64krO+V+IZo2Ha5bj0DHTuWWmyjAZcg9ZgxN6UxHjhc=;
        b=QmbBl0RK8fMZW7jCPF4AINoMtMTkYKsKIpCpz9ztgxx2eFxIBhi2zZO21ITS+68I8x
         NkQO2MVnoUpAVlObcrPPgXEV4XxhXwLTKWsiY07WpZHhMXE+cpw+I2ExQrqjqFQXNdwm
         BGBogUE7ifomLMjvlPrfOJ1ApN304tZZW3KajiL3xrPSr7PSDHt3j8glSHbah0n0JYt7
         e1BIWu0/xbBlTLJdwIqQ2nt5rJ5bgZbQxLzVfaww2giBpyw3H8rGAH+a4bX3rL2LX0js
         57ndvMgd/chpxAUWC0IPIcWL8QLUCDdrxxzPGq0ED/g2xvZz968FXSAXFbWntbIJALOJ
         afVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=64krO+V+IZo2Ha5bj0DHTuWWmyjAZcg9ZgxN6UxHjhc=;
        b=OiB40EZvj/uaAckNtZ89KwoJFDrUePyugJfepToI1L9CGdc3H+Rk2A1bR6gN87Wer3
         k4ZbT9+sUer+wl9tHkzkA4g0ukhY9ZiHHE3491M7Gl3Nk9TRRLPRs27goZNWAF20+A9d
         W5CVDCcOMeJ/TkmVHsDU+7+7+ih8jladC32xK2kCya5S9GHaAWDKuQfCouuoW672cfnF
         Lw4QL6gM+r/waMNQTQJBwuFw/iwVK6R1xyIRN3+UJViUXWAs7W52NI9VNGHLceaV5CTW
         4k5n9TWk0bsbrfZWEaEz6xyRWf2a9tLxdPbSecJAWLmNtt1VfD38eEzU/mr29kFa29Wt
         Rzow==
X-Gm-Message-State: AOAM531UUYHoXO2w8C61G25dd7Pwjq9JXgWtHYmVulnRJYZbzcMj5Snc
        fdlwAx5kXKvV3d62zucFekuIQQ==
X-Google-Smtp-Source: ABdhPJzH+2XDoYBLN0Ewa6UxTwrV8nLvPrwWp9MqA9YDScekvmu/bEAAVXbMSBGr+tOHebmPSFZdYA==
X-Received: by 2002:ac2:5615:: with SMTP id v21mr6418380lfd.112.1639058595951;
        Thu, 09 Dec 2021 06:03:15 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bp41sm539482lfb.129.2021.12.09.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 06:03:15 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3] i2c: exynos5: Add bus clock support
Date:   Thu,  9 Dec 2021 16:03:13 +0200
Message-Id: <20211209140313.14926-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
part of USIv2 block, there are two clocks provided to HSI2C controller:
  - PCLK: bus clock (APB), provides access to register interface
  - IPCLK: operating IP-core clock; SCL is derived from this one

Both clocks have to be asserted for HSI2C to be functional in that case.

Add code to obtain and enable/disable PCLK in addition to already
handled operating clock. Make it optional though, as older Exynos SoC
variants only have one HSI2C clock.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
---
Changes in v3:
  - Rebased correctly on top of linux-next

Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added R-b tag by Chanho Park

 drivers/i2c/busses/i2c-exynos5.c | 46 ++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index c7e3cae99d13..693903e80892 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -182,7 +182,8 @@ struct exynos5_i2c {
 	unsigned int		irq;
 
 	void __iomem		*regs;
-	struct clk		*clk;
+	struct clk		*clk;		/* operating clock */
+	struct clk		*pclk;		/* bus clock */
 	struct device		*dev;
 	int			state;
 
@@ -757,10 +758,14 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 	struct exynos5_i2c *i2c = adap->algo_data;
 	int i, ret;
 
-	ret = clk_enable(i2c->clk);
+	ret = clk_enable(i2c->pclk);
 	if (ret)
 		return ret;
 
+	ret = clk_enable(i2c->clk);
+	if (ret)
+		goto err_pclk;
+
 	for (i = 0; i < num; ++i) {
 		ret = exynos5_i2c_xfer_msg(i2c, msgs + i, i + 1 == num);
 		if (ret)
@@ -768,6 +773,8 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	clk_disable(i2c->clk);
+err_pclk:
+	clk_disable(i2c->pclk);
 
 	return ret ?: num;
 }
@@ -807,10 +814,18 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	ret = clk_prepare_enable(i2c->clk);
+	i2c->pclk = devm_clk_get(&pdev->dev, "hsi2c_pclk");
+	if (IS_ERR(i2c->pclk))
+		i2c->pclk = NULL; /* pclk is optional */
+
+	ret = clk_prepare_enable(i2c->pclk);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		goto err_pclk;
+
 	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs)) {
 		ret = PTR_ERR(i2c->regs);
@@ -853,11 +868,15 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2c);
 
 	clk_disable(i2c->clk);
+	clk_disable(i2c->pclk);
 
 	return 0;
 
  err_clk:
 	clk_disable_unprepare(i2c->clk);
+
+ err_pclk:
+	clk_disable_unprepare(i2c->pclk);
 	return ret;
 }
 
@@ -868,6 +887,7 @@ static int exynos5_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 
 	clk_unprepare(i2c->clk);
+	clk_unprepare(i2c->pclk);
 
 	return 0;
 }
@@ -879,6 +899,7 @@ static int exynos5_i2c_suspend_noirq(struct device *dev)
 
 	i2c_mark_adapter_suspended(&i2c->adap);
 	clk_unprepare(i2c->clk);
+	clk_unprepare(i2c->pclk);
 
 	return 0;
 }
@@ -888,21 +909,30 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
 	struct exynos5_i2c *i2c = dev_get_drvdata(dev);
 	int ret = 0;
 
-	ret = clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->pclk);
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		goto err_pclk;
+
 	ret = exynos5_hsi2c_clock_setup(i2c);
-	if (ret) {
-		clk_disable_unprepare(i2c->clk);
-		return ret;
-	}
+	if (ret)
+		goto err_clk;
 
 	exynos5_i2c_init(i2c);
 	clk_disable(i2c->clk);
+	clk_disable(i2c->pclk);
 	i2c_mark_adapter_resumed(&i2c->adap);
 
 	return 0;
+
+err_clk:
+	clk_disable_unprepare(i2c->clk);
+err_pclk:
+	clk_disable_unprepare(i2c->pclk);
+	return ret;
 }
 #endif
 
-- 
2.30.2

