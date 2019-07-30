Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60DED7B1C0
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 20:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfG3SUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 14:20:07 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37857 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387885AbfG3SQP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Jul 2019 14:16:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id i70so19736928pgd.4
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jul 2019 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=571S7gZPWNIHFaV60/t8l9K6p4kMW0NF3sRxoDsBKt0=;
        b=BZ4C/mq81oKuw5/J4XL/8e1IlMSJ572BGgN24w1Pn2CEKuvTuT+ENu89s0ju/tBsn6
         Jws48SkU/+skMWx5WD6/adjBfLr4Swl1GohSwwTPJrvSp4ZElR26x6XHIn25+/wDtPw9
         peaYFd7HeReYuYE4m67GTysBvpKiLHOfyWSeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=571S7gZPWNIHFaV60/t8l9K6p4kMW0NF3sRxoDsBKt0=;
        b=S0ue+AnROpP6eR6b3I6jdV7LOyFyrksDuhma0W+K0WBAbo+MdvtBK9BuJ3/r8Vo+7c
         CZubVp+bplHTas8I3bZU77JyB3JqzS/i/oCGUvusB7cZo4MCxpc8RzcS9pOPkMDp+uqJ
         dslOTQT0vWV3r42QLUYlVlcq6EF9sBBq0vaxNzy6AWUTrkmPAjfLgJ+H+4/zO/MHjCS+
         T2yspDHxiAgwxUoh8Z6RWBdrgrtFx3y6HaYRbrUvZh4HxL5AnaUCmKSAD7yWEASnBuQt
         T8wxjN5fq3xYHGiI8lNL/M8JI7KsjRl8mXKReFx56ZgKeSyRyCo3MJWWsEie1OtLUQKn
         rXaQ==
X-Gm-Message-State: APjAAAXpRPnnfkc/zDSKg1IO7lVo6P6uYSK+NVlvcLUID5S2Jnu76H+s
        hL/XdFdqnD1aRdhqEMf8m/O6jA==
X-Google-Smtp-Source: APXvYqziJjd7DpobmBYIb53JVDBKnIYxdCHbI/jI9me01b88XuRY4R/GVHRD+QeOIZrbUf2TG9Ouug==
X-Received: by 2002:a17:90a:8a91:: with SMTP id x17mr118685941pjn.95.1564510574474;
        Tue, 30 Jul 2019 11:16:14 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:14 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 18/57] i2c: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:18 -0700
Message-Id: <20190730181557.90391-19-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/i2c/busses/i2c-altera.c     |  4 +---
 drivers/i2c/busses/i2c-axxia.c      |  4 +---
 drivers/i2c/busses/i2c-bcm-kona.c   |  1 -
 drivers/i2c/busses/i2c-cht-wc.c     |  4 +---
 drivers/i2c/busses/i2c-efm32.c      |  1 -
 drivers/i2c/busses/i2c-hix5hd2.c    |  4 +---
 drivers/i2c/busses/i2c-img-scb.c    |  4 +---
 drivers/i2c/busses/i2c-imx-lpi2c.c  |  4 +---
 drivers/i2c/busses/i2c-imx.c        |  4 +---
 drivers/i2c/busses/i2c-lpc2k.c      |  4 +---
 drivers/i2c/busses/i2c-meson.c      |  4 +---
 drivers/i2c/busses/i2c-omap.c       |  4 +---
 drivers/i2c/busses/i2c-owl.c        |  4 +---
 drivers/i2c/busses/i2c-pnx.c        |  1 -
 drivers/i2c/busses/i2c-pxa.c        |  4 +---
 drivers/i2c/busses/i2c-qcom-geni.c  |  4 +---
 drivers/i2c/busses/i2c-qup.c        |  4 +---
 drivers/i2c/busses/i2c-rk3x.c       |  4 +---
 drivers/i2c/busses/i2c-sprd.c       |  4 +---
 drivers/i2c/busses/i2c-stm32f7.c    | 12 ++----------
 drivers/i2c/busses/i2c-sun6i-p2wi.c |  4 +---
 drivers/i2c/busses/i2c-synquacer.c  |  4 +---
 drivers/i2c/busses/i2c-uniphier-f.c |  4 +---
 drivers/i2c/busses/i2c-uniphier.c   |  4 +---
 drivers/i2c/busses/i2c-xlp9xx.c     |  6 ++----
 25 files changed, 24 insertions(+), 77 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 5255d3755411..b5cc7e81e943 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -396,10 +396,8 @@ static int altr_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(idev->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "missing interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(idev->i2c_clk)) {
diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index ff3142b15cab..1ccbdd5e3360 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -612,10 +612,8 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "missing interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	idev->i2c_clk = devm_clk_get(&pdev->dev, "i2c");
 	if (IS_ERR(idev->i2c_clk)) {
diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 4e489a9d16fb..47a6b6a747fc 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -823,7 +823,6 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	/* Get the interrupt number */
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
-		dev_err(dev->device, "no irq resource\n");
 		rc = -ENODEV;
 		goto probe_disable_clk;
 	}
diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 66af44bfa67d..63e31a580f80 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -269,10 +269,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	int ret, reg, irq;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Error missing irq resource\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
 	if (!adap)
diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
index a8c6323e7f44..4de31fae72cd 100644
--- a/drivers/i2c/busses/i2c-efm32.c
+++ b/drivers/i2c/busses/i2c-efm32.c
@@ -352,7 +352,6 @@ static int efm32_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
-		dev_err(&pdev->dev, "failed to get irq (%d)\n", ret);
 		if (!ret)
 			ret = -EINVAL;
 		return ret;
diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 4df1434b3597..1830b19587be 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -417,10 +417,8 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(&pdev->dev, "cannot find HS-I2C IRQ\n");
+	if (irq <= 0)
 		return irq;
-	}
 
 	priv->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 20a4fbc53007..5a753e7c9765 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1344,10 +1344,8 @@ static int img_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
 	if (IS_ERR(i2c->sys_clk)) {
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index dc00fabc919a..f962c92d3daf 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -559,10 +559,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 		return PTR_ERR(lpi2c_imx->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	lpi2c_imx->adapter.owner	= THIS_MODULE;
 	lpi2c_imx->adapter.algo		= &lpi2c_imx_algo;
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b1b8b938d7f4..1c31f35c5726 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1062,10 +1062,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "<%s>\n", __func__);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index deea18b14add..9cf6957a3599 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -362,10 +362,8 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0) {
-		dev_err(&pdev->dev, "can't get interrupt resource\n");
+	if (i2c->irq < 0)
 		return i2c->irq;
-	}
 
 	init_waitqueue_head(&i2c->wait);
 
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 1e2647f9a2a7..46972f5ceb9a 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -395,10 +395,8 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't find IRQ\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, meson_i2c_irq, 0, NULL, i2c);
 	if (ret < 0) {
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 2dfea357b131..d2bba6d3e6bd 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1366,10 +1366,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	u16 minor, major;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq resource?\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	omap = devm_kzalloc(&pdev->dev, sizeof(struct omap_i2c_dev), GFP_KERNEL);
 	if (!omap)
diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index b6b5a495118b..b35a139e5a97 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -412,10 +412,8 @@ static int owl_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get IRQ number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency",
 				 &i2c_dev->bus_freq))
diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 6e0e546ef83f..a9b48c0f186d 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -720,7 +720,6 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 
 	alg_data->irq = platform_get_irq(pdev, 0);
 	if (alg_data->irq < 0) {
-		dev_err(&pdev->dev, "Failed to get IRQ from platform resource\n");
 		ret = alg_data->irq;
 		goto out_clock;
 	}
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 2c3c3d6935c0..ed81e9372a82 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1218,10 +1218,8 @@ static int i2c_pxa_probe(struct platform_device *dev)
 		return PTR_ERR(i2c->reg_base);
 
 	irq = platform_get_irq(dev, 0);
-	if (irq < 0) {
-		dev_err(&dev->dev, "no irq resource: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	/* Default adapter num to device id; i2c_pxa_probe_dt can override. */
 	i2c->adap.nr = dev->id;
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a89bfce5388e..75e8009f377b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -529,10 +529,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
 
 	gi2c->irq = platform_get_irq(pdev, 0);
-	if (gi2c->irq < 0) {
-		dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
+	if (gi2c->irq < 0)
 		return gi2c->irq;
-	}
 
 	ret = geni_i2c_clk_map_idx(gi2c);
 	if (ret) {
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index e09cd0775ae9..8f670d5d369f 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1768,10 +1768,8 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(qup->base);
 
 	qup->irq = platform_get_irq(pdev, 0);
-	if (qup->irq < 0) {
-		dev_err(qup->dev, "No IRQ defined\n");
+	if (qup->irq < 0)
 		return qup->irq;
-	}
 
 	if (has_acpi_companion(qup->dev)) {
 		ret = device_property_read_u32(qup->dev,
diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 1a33007b03e9..87f57a47201c 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1262,10 +1262,8 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 
 	/* IRQ setup */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "cannot find rk3x IRQ\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
 			       0, dev_name(&pdev->dev), i2c);
diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 961123529678..da89b768452a 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -493,10 +493,8 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	i2c_dev->irq = platform_get_irq(pdev, 0);
-	if (i2c_dev->irq < 0) {
-		dev_err(&pdev->dev, "failed to get irq resource\n");
+	if (i2c_dev->irq < 0)
 		return i2c_dev->irq;
-	}
 
 	i2c_set_adapdata(&i2c_dev->adap, i2c_dev);
 	init_completion(&i2c_dev->complete);
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 266d1c269b83..69207790af98 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1839,20 +1839,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	phy_addr = (dma_addr_t)res->start;
 
 	irq_event = platform_get_irq(pdev, 0);
-	if (irq_event <= 0) {
-		if (irq_event != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get IRQ event: %d\n",
-				irq_event);
+	if (irq_event <= 0)
 		return irq_event ? : -ENOENT;
-	}
 
 	irq_error = platform_get_irq(pdev, 1);
-	if (irq_error <= 0) {
-		if (irq_error != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get IRQ error: %d\n",
-				irq_error);
+	if (irq_error <= 0)
 		return irq_error ? : -ENOENT;
-	}
 
 	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2c_dev->clk)) {
diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 7c07ce116e38..49ddd3a6d2db 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -238,10 +238,8 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	strlcpy(p2wi->adapter.name, pdev->name, sizeof(p2wi->adapter.name));
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to retrieve irq: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	p2wi->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(p2wi->clk)) {
diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index f724c8e6b360..8e00106a4388 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -580,10 +580,8 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0) {
-		dev_err(&pdev->dev, "no IRQ resource found\n");
+	if (i2c->irq < 0)
 		return -ENODEV;
-	}
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
 			       0, dev_name(&pdev->dev), i2c);
diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 7acca2599f04..e3ca4a8dfc8e 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -553,10 +553,8 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->membase);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get IRQ number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
 		bus_speed = UNIPHIER_FI2C_DEFAULT_SPEED;
diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 0173840c32af..548b60b9395b 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -341,10 +341,8 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->membase);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get IRQ number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
 		bus_speed = UNIPHIER_I2C_DEFAULT_SPEED;
diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 8a873975cf12..d633aac876f5 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -517,10 +517,8 @@ static int xlp9xx_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	priv->irq = platform_get_irq(pdev, 0);
-	if (priv->irq <= 0) {
-		dev_err(&pdev->dev, "invalid irq!\n");
-		return priv->irq;
-	}
+	if (priv->irq <= 0)
+		return priv->irq ? : -ENXIO;
 	/* SMBAlert irq */
 	priv->alert_data.irq = platform_get_irq(pdev, 1);
 	if (priv->alert_data.irq <= 0)
-- 
Sent by a computer through tubes

