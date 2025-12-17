Return-Path: <linux-i2c+bounces-14635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F50CC9851
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 21:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B898A3011766
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 20:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464202C08C2;
	Wed, 17 Dec 2025 20:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQAnPx7B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A18203710
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004605; cv=none; b=UiNFZvczaksVH7obGU1xYBqI5BTjK9IbBFdp9fGB6roiiANVvoD6lMItOcSU2D1Pbl7nr5Wvham158P5ha3ZqAMXw7unUe3htWT4IvEaa1IRB2l87hSDPV1XROcGTUxsmSN9Ag8eNpLMoJv/v6PlelbxYzsvGJoWnlgqLnzzo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004605; c=relaxed/simple;
	bh=uZmeU6/lH+Oyx+HJkcBRoHj9KuSaQoSzqyS+vqTlh18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fhh9kctCKKDoOoLtFTnztdFvYi/Br8vJuplo1v26BuIF+2mHLusWz6A1iW8GUWqFWk6zhlIttz1YP+XpYbeO5Uk/iLBJb1YdPEGWA6kLoh7JhN1oZMHz7PPuajDL3y5hR+kI9F08i8suyGXs/3iNATaY9mWuZ8Ne/TCPp1s/vS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQAnPx7B; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c902f6845so4916867a91.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766004602; x=1766609402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Vqf2Irqa47r0MODYS/qJupfOYkoqLvIbxbr/hC0OZI=;
        b=kQAnPx7BigFTGUF9lbe3jYFGWCvd7IeQBoFWIs6m/bYzVtPLwnNxBfo0zxYPQfHmRE
         YeTyHLXvBmUqEOU61Ys2Utx2zXsB/F38zEi8bc9Pn+Ezb8RHiOKC1nXt+jCp+RDq5l7k
         dc5bK+3lFlT5NyWfSQ/dKekToBlFCsJaxRPzP6dbfh3OBgaiLJME0x/juG4121hKPN4S
         AOQS8B8kXn3rcD0pB0RBHFp7YyIRakHrToggdHv33mYG4qTY07VcTuTmsuE4kQUxVZbv
         47bzw9HmQD1mw2i6k6jv8FIBrPYjzB5AkEq+ps1IAocy9eg0Cz3EdEVhjOOG1SuC5lmr
         NWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004602; x=1766609402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Vqf2Irqa47r0MODYS/qJupfOYkoqLvIbxbr/hC0OZI=;
        b=Lf9kztQGjowVkw12/1i4X8UlpZAP4O/2EGxg7t1pOQxQuQgJ70oqoCCeXSv7kHQl8A
         WtNJd9CC4Rchr9e7tEnEzGpTaJB2cGTa0osk9dAN2pvXlvpTkIbASl34LVgf7rUvdEaK
         kszqwU7xV6yrk9ZztUfhI2/544wt+fUMBA0hs29xJUgaNBvgClWrVrOtsqdhyCMbIOrj
         Zsyu4Uw97kpbqEqp6+6XPBV/yIbON4bpuBLVifthvG+weik/Q1emBH5K8OCRc/U1vLl1
         GzdnCgTa/QSnynV3OP1CA5e0c5F+xeYJAtfKJrQ8MxZbVEYLZVY5YLUOqY2q+4JOBLTQ
         bMyA==
X-Gm-Message-State: AOJu0YyKKZNwu1vsBBVF/q7BrEvHhGGdNx/ofzrZi7sc2WvnSZklPSPL
	hGFz0SmJhiu7qi/3ZpliUHeKkcVc9dQjeM35U77BBucdfWiAaujZMoeD80h7lA==
X-Gm-Gg: AY/fxX71twBRhjccJsSVFP/oTjNsRupamAvgJmNyttbiy69R53JR5YMYcC5yLDaCXLW
	+rLvPbh8oegXrAXkQgK9jfug21CW5zeE2dlqxHFBhIhxGQblv6fLm2BP769PvhhaiefGzgUfZjM
	7PdF1m9yeFLGrxqFWjQD3AuAJn2OhMvS+719+Gejp1nwZRwW1Q6hzo8fJvVzPdeblQulNk+Hd/i
	pF3Kn8W/YJJ1veOYQGBVloiyfJxcDKoT4VzBsbu5GZPKjRRksEr6OuJeGglQARRwZkM1e8P/8kV
	03mIT5XB9djLqRVTPK1o8VB/hvK0XA+haJgpGxt11O1Unqnc1Rg87XfHqymi4QZ+bJpG3Y/bGRN
	296odE3rZCBCGh9t+GnlXkLqdty0vAknkV/4gVOQRFC8zFYBS6k0iLf2vKQ==
X-Google-Smtp-Source: AGHT+IGUYpYXdBuUIy2BGU5YINHw7vHPbEi5/3qNwcr/8j7+nQe807tukrqvmnkcXYlc9GyRKCPBGA==
X-Received: by 2002:a17:90b:3f4f:b0:34a:4cc0:9e38 with SMTP id 98e67ed59e1d1-34abd71f4dfmr17296990a91.10.1766004602462;
        Wed, 17 Dec 2025 12:50:02 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7bcsm434558a91.13.2025.12.17.12.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:50:01 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: exynos5: simplify probe with devm
Date: Wed, 17 Dec 2025 12:49:44 -0800
Message-ID: <20251217204944.10862-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleans up probe a little bit and separates preparation from enablement.

Also use devm for i2c_add_adapter to get rid of the remove function.

Fix return code for failed clk_get_prepared. It returns PTR_ERR.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 41 ++++++++------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 9c1c5f3c09f6..fcc062910497 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -903,23 +903,20 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->adap.retries = 3;
 
 	i2c->dev = &pdev->dev;
-	i2c->clk = devm_clk_get(&pdev->dev, "hsi2c");
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return -ENOENT;
-	}
+	i2c->clk = devm_clk_get_prepared(&pdev->dev, "hsi2c");
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk), "cannot get clock\n");
 
-	i2c->pclk = devm_clk_get_optional(&pdev->dev, "hsi2c_pclk");
-	if (IS_ERR(i2c->pclk)) {
+	i2c->pclk = devm_clk_get_optional_prepared(&pdev->dev, "hsi2c_pclk");
+	if (IS_ERR(i2c->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
 				     "cannot get pclk");
-	}
 
-	ret = clk_prepare_enable(i2c->pclk);
+	ret = clk_enable(i2c->pclk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(i2c->clk);
+	ret = clk_enable(i2c->clk);
 	if (ret)
 		goto err_pclk;
 
@@ -958,35 +955,18 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 
 	exynos5_i2c_reset(i2c);
 
-	ret = i2c_add_adapter(&i2c->adap);
-	if (ret < 0)
-		goto err_clk;
+	ret = devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
 
 	platform_set_drvdata(pdev, i2c);
 
-	clk_disable(i2c->clk);
-	clk_disable(i2c->pclk);
-
-	return 0;
-
  err_clk:
-	clk_disable_unprepare(i2c->clk);
+	clk_disable(i2c->clk);
 
  err_pclk:
-	clk_disable_unprepare(i2c->pclk);
+	clk_disable(i2c->pclk);
 	return ret;
 }
 
-static void exynos5_i2c_remove(struct platform_device *pdev)
-{
-	struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
-
-	i2c_del_adapter(&i2c->adap);
-
-	clk_unprepare(i2c->clk);
-	clk_unprepare(i2c->pclk);
-}
-
 static int exynos5_i2c_suspend_noirq(struct device *dev)
 {
 	struct exynos5_i2c *i2c = dev_get_drvdata(dev);
@@ -1036,7 +1016,6 @@ static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
 
 static struct platform_driver exynos5_i2c_driver = {
 	.probe		= exynos5_i2c_probe,
-	.remove		= exynos5_i2c_remove,
 	.driver		= {
 		.name	= "exynos5-hsi2c",
 		.pm	= pm_sleep_ptr(&exynos5_i2c_dev_pm_ops),
-- 
2.52.0


