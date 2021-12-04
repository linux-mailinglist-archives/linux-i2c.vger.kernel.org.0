Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772FF4687CE
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 22:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379117AbhLDVzB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 16:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379273AbhLDVyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 16:54:09 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDFAC061354
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 13:50:43 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so4877355wmc.2
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVkIUWY0OSvWRa+LskKzcmg/hbEtnNu06lHh+/SBJ88=;
        b=FpJlj8JqtuSaC21wsmqZDhvAYKWzvMA5cei5fusZjowiLmCrphGiOdzasy8e4fUpEz
         MoCdSAuC6Yyqpf0gEqhux7DWayKOff556o3FMgJPrdy0sfzk/75DgbkvDundR4zStIoU
         x3fhnvpJH/u9TopmkgxTklKzXAnk4JFKItqsTfp5rS0G5ZkjiWbU0mZH8k44JR/xvdwL
         BvnYd4VPvrlwaX2gZt+hbFx2WzAaQHBX+aGoFgJ15Om2C/2HkLB2JZ6RugBUzz36SVUz
         DeMFw+H+xbQbGiIIL7SYo00MARX/A/I5aB607hlLyty4vz+9WxohxIp1tpM6YhcvygD3
         q6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVkIUWY0OSvWRa+LskKzcmg/hbEtnNu06lHh+/SBJ88=;
        b=SX0BZ5ITiPxeegZS8o422ZEoRoK7sSzq6hhvsP31GLd//5SRL0jUHv2isN6CEGG37I
         hyN1rHQ+WImliEewzoyOdmLIMDIy9JDctGlyIvbWj96xlyPDLT0WcGpBz3CReWpAld0m
         jD+UNatjlzhONHxVro6bfde0E8xu6kArK9r7cPCVa8IqabY2jJpzfE9sL/QAqdxVFIs9
         1E4gZW322h3gfZcaF3xRY4LOWg5mBtJbtsAJKE3r/HTp+AAQjoG/O5SySX6G2GRg2c5U
         T+RTKe+6mxOpSbxpotSt+5J+JomvY15BXKBmCYV0E0m3aCBCxZ6SoNU/rl+NY4vDotxN
         xNlw==
X-Gm-Message-State: AOAM530QqxpNic3UWg/2cQsK6QTLi9rK6qr7uxUKTx1fLg6n8Cgk9iDC
        OahFZw/FmiJLOOc1sh1kCXztjg==
X-Google-Smtp-Source: ABdhPJzlV1DW8PKUpxjP73QanGy9XDrP9z1KHI3+n/qz+wxRQ/2ZHlW5QhepDn2YDnt1aTVmYxzZpg==
X-Received: by 2002:a05:600c:1d97:: with SMTP id p23mr26535412wms.186.1638654642106;
        Sat, 04 Dec 2021 13:50:42 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i17sm7355238wmq.48.2021.12.04.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:50:41 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/8] i2c: exynos5: Add bus clock support
Date:   Sat,  4 Dec 2021 23:50:30 +0200
Message-Id: <20211204215033.5134-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204215033.5134-1-semen.protsenko@linaro.org>
References: <20211204215033.5134-1-semen.protsenko@linaro.org>
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
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added R-b tag by Chanho Park

 drivers/i2c/busses/i2c-exynos5.c | 46 ++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 5198e71e8dab..9cde5ecb9449 100644
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
@@ -853,6 +868,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2c);
 
 	clk_disable(i2c->clk);
+	clk_disable(i2c->pclk);
 
 	dev_info(&pdev->dev, "%s: HSI2C adapter\n", dev_name(&i2c->adap.dev));
 
@@ -860,6 +876,9 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 
  err_clk:
 	clk_disable_unprepare(i2c->clk);
+
+ err_pclk:
+	clk_disable_unprepare(i2c->pclk);
 	return ret;
 }
 
@@ -870,6 +889,7 @@ static int exynos5_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 
 	clk_unprepare(i2c->clk);
+	clk_unprepare(i2c->pclk);
 
 	return 0;
 }
@@ -881,6 +901,7 @@ static int exynos5_i2c_suspend_noirq(struct device *dev)
 
 	i2c_mark_adapter_suspended(&i2c->adap);
 	clk_unprepare(i2c->clk);
+	clk_unprepare(i2c->pclk);
 
 	return 0;
 }
@@ -890,21 +911,30 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
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

