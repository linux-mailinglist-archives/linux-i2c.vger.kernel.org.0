Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EDD1D7D7C
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 17:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgERPxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 11:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgERPxu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 11:53:50 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5529DC061A0C;
        Mon, 18 May 2020 08:53:50 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x2so5143119pfx.7;
        Mon, 18 May 2020 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/hcpwI388Warwq8iAzUCO4DC/RJWNCyQ9RoUxhqWMtk=;
        b=t8hAsniZXY2hOhXes8pvyPvb9Y1UbxDE0IS61ja0/YdHu1ahQQrtX2i1ORWsxOrFR6
         P2ISbTCKJGCrMw9WuXcgays7Fg53VixbW6pDFOow1RLiVcgscg2PcHfSpHZwa/PcgLPe
         9Ui8dN834YVoxV/UhhASSCSuVJ0gEjcSAd1RNmcdx50Z5c4DVpT8RbIWHx8h7sTGdqRy
         7q3PcF6vGve8gAanwsa0y+e/hoiAe3LWeo0IfLvJiur4tetP5MlU2/Ntn4aJGt/ty1ML
         rqo7bJp4bo3cKdFkgClpPh+8FL3XNRcdCDMhCpPbV5wEsZEvXfl72PPnpkf0/1GVYBMU
         bH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/hcpwI388Warwq8iAzUCO4DC/RJWNCyQ9RoUxhqWMtk=;
        b=aM3auD2Aycc/MsWm+bGQZMJMqJ3xBkMDfa6P2R0Mrtbgi11BhS27kw1ot8ApvNajEu
         rkJHJWp0dG2Q4O6ikmEbc/1sdhwdfhy92juixSHWdDDWL1s+8jzOenwV6n3RLBI+hv+k
         XNLg0PtwA0GQXm0W88WXlqb7jBHWuLSic/Hj5b3g13I4EW1j2JtI1lIshI+igFxjQgjD
         pglpcFyc8caSxA++KpdorRGeb6Bc8156ouZC9byYXYbioXFe+upRE2O2fHc6ZgUwBH7E
         gz/PTFbu6ztTijyhQPDJJNYCSr010HHaUA8Z+3iwl+XUjPqxJmJdmeBPYsWMsRwGMa/3
         n7tA==
X-Gm-Message-State: AOAM533zIyp/HOORV7loltOG2L6IAIOxuWBeGsvGUOd/6Hz4EI70NHRG
        G644Cx5IkjLeHskZGxp57xQ=
X-Google-Smtp-Source: ABdhPJzKGXCL4JjeJrK+ZKKtQcthZIKP6yfwPiVTBd/sjoh3i9l3uLY+daok33q6J05tb6vcUD+9GQ==
X-Received: by 2002:aa7:9464:: with SMTP id t4mr6547092pfq.52.1589817229830;
        Mon, 18 May 2020 08:53:49 -0700 (PDT)
Received: from localhost ([176.122.159.242])
        by smtp.gmail.com with ESMTPSA id a85sm6173381pfd.181.2020.05.18.08.53.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 08:53:49 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, vz@mleia.com,
        slemieux.tyco@gmail.com, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, ardb@kernel.org,
        radu_nicolae.pirea@upb.ro, zhouyanjie@wanyeetech.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 2/2] i2c: busses: convert to devm_platform_request_irq()
Date:   Mon, 18 May 2020 23:53:04 +0800
Message-Id: <20200518155304.28639-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200518155304.28639-1-zhengdejin5@gmail.com>
References: <20200518155304.28639-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use devm_platform_request_irq() to simplify code, and it contains
platform_get_irq() and devm_request_irq().

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++-------------
 drivers/i2c/busses/i2c-cadence.c   | 10 +++-------
 drivers/i2c/busses/i2c-digicolor.c | 10 +++-------
 drivers/i2c/busses/i2c-emev2.c     |  5 ++---
 drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
 drivers/i2c/busses/i2c-meson.c     | 13 ++++---------
 drivers/i2c/busses/i2c-mxs.c       |  9 +++------
 drivers/i2c/busses/i2c-pnx.c       |  9 ++-------
 drivers/i2c/busses/i2c-rcar.c      |  9 +++------
 drivers/i2c/busses/i2c-rk3x.c      | 14 +++-----------
 drivers/i2c/busses/i2c-sirf.c      | 10 ++--------
 drivers/i2c/busses/i2c-stu300.c    |  4 ++--
 drivers/i2c/busses/i2c-synquacer.c | 12 +++---------
 13 files changed, 35 insertions(+), 91 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index ed5e1275ae46..f45acb47552a 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -818,20 +818,10 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	       ISR_NOACK_MASK,
 	       dev->base + ISR_OFFSET);
 
-	/* Get the interrupt number */
-	dev->irq = platform_get_irq(pdev, 0);
-	if (dev->irq < 0) {
-		rc = dev->irq;
-		goto probe_disable_clk;
-	}
-
-	/* register the ISR handler */
-	rc = devm_request_irq(&pdev->dev, dev->irq, bcm_kona_i2c_isr,
-			      IRQF_SHARED, pdev->name, dev);
-	if (rc) {
-		dev_err(dev->device, "failed to request irq %i\n", dev->irq);
+	rc = devm_platform_request_irq(pdev, 0, &dev->irq, bcm_kona_i2c_isr,
+					IRQF_SHARED, pdev->name, dev);
+	if (rc)
 		goto probe_disable_clk;
-	}
 
 	/* Enable the controller but leave it idle */
 	bcm_kona_i2c_send_cmd_to_ctrl(dev, BCM_CMD_NOACTION);
diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 4b72398af505..9ffae4d231dc 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1204,8 +1204,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
 
-	id->irq = platform_get_irq(pdev, 0);
-
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
 	id->adap.algo = &cdns_i2c_algo;
@@ -1256,12 +1254,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 	}
 
-	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
-				 DRIVER_NAME, id);
-	if (ret) {
-		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
+	ret = devm_platform_request_irq(pdev, 0, &id->irq, cdns_i2c_isr, 0,
+					DRIVER_NAME, id);
+	if (ret)
 		goto err_clk_dis;
-	}
 
 	/*
 	 * Cadence I2C controller has a bug wherein it generates
diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 332f00437479..9ea965f41396 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -290,7 +290,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct dc_i2c *i2c;
-	int ret = 0, irq;
+	int ret = 0;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct dc_i2c), GFP_KERNEL);
 	if (!i2c)
@@ -314,12 +314,8 @@ static int dc_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(&pdev->dev, irq, dc_i2c_irq, 0,
-			       dev_name(&pdev->dev), i2c);
+	ret = devm_platform_request_irq(pdev, 0, NULL, dc_i2c_irq, 0,
+					dev_name(&pdev->dev), i2c);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 1a319352e51b..cae00a9ec86f 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -395,9 +395,8 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	em_i2c_reset(&priv->adap);
 
-	priv->irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
-				"em_i2c", priv);
+	ret = devm_platform_request_irq(pdev, 0, &priv->irq,
+			em_i2c_irq_handler, 0, "em_i2c", priv);
 	if (ret)
 		goto err_clk;
 
diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index ba831df6661e..27de0309f211 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -825,9 +825,8 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
 
-	i2c->irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
-			       dev_name(&pdev->dev), i2c);
+	ret = devm_platform_request_irq(pdev, 0, &i2c->irq, jz4780_i2c_irq, 0,
+					dev_name(&pdev->dev), i2c);
 	if (ret)
 		goto err;
 
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c5dec572fc48..2e5a855ff20a 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -398,7 +398,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct meson_i2c *i2c;
 	struct i2c_timings timings;
-	int irq, ret = 0;
+	int ret = 0;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct meson_i2c), GFP_KERNEL);
 	if (!i2c)
@@ -425,15 +425,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(&pdev->dev, irq, meson_i2c_irq, 0, NULL, i2c);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "can't request IRQ\n");
+	ret = devm_platform_request_irq(pdev, 0, NULL, meson_i2c_irq,
+					0, NULL, i2c);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = clk_prepare(i2c->clk);
 	if (ret < 0) {
diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 9587347447f0..cff82af3208a 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -802,7 +802,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mxs_i2c_dev *i2c;
 	struct i2c_adapter *adap;
-	int err, irq;
+	int err;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -817,11 +817,8 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	err = devm_request_irq(dev, irq, mxs_i2c_isr, 0, dev_name(dev), i2c);
+	err = devm_platform_request_irq(pdev, 0, NULL, mxs_i2c_isr, 0,
+					dev_name(dev), i2c);
 	if (err)
 		return err;
 
diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 5d7207c10f1d..3e249373375f 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -718,13 +718,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	}
 	init_completion(&alg_data->mif.complete);
 
-	alg_data->irq = platform_get_irq(pdev, 0);
-	if (alg_data->irq < 0) {
-		ret = alg_data->irq;
-		goto out_clock;
-	}
-	ret = devm_request_irq(&pdev->dev, alg_data->irq, i2c_pnx_interrupt,
-			       0, pdev->name, alg_data);
+	ret = devm_platform_request_irq(pdev, 0, &alg_data->irq,
+				i2c_pnx_interrupt, 0, pdev->name, alg_data);
 	if (ret)
 		goto out_clock;
 
diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index a45c4bf1ec01..bd59a13de707 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -984,13 +984,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	else
 		pm_runtime_put(dev);
 
-
-	priv->irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, 0, dev_name(dev), priv);
-	if (ret < 0) {
-		dev_err(dev, "cannot get irq %d\n", priv->irq);
+	ret = devm_platform_request_irq(pdev, 0, &priv->irq, rcar_i2c_irq, 0,
+					dev_name(dev), priv);
+	if (ret < 0)
 		goto out_pm_disable;
-	}
 
 	platform_set_drvdata(pdev, priv);
 
diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index bc698240c4aa..a8d47689de0a 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1196,7 +1196,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	int ret = 0;
 	int bus_nr;
 	u32 value;
-	int irq;
 	unsigned long clk_rate;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct rk3x_i2c), GFP_KERNEL);
@@ -1258,17 +1257,10 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* IRQ setup */
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
-			       0, dev_name(&pdev->dev), i2c);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "cannot request IRQ\n");
+	ret = devm_platform_request_irq(pdev, 0, NULL, rk3x_i2c_irq,
+					0, dev_name(&pdev->dev), i2c);
+	if (ret < 0)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, i2c);
 
diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
index d7f72ec331e8..a593c15bfbf5 100644
--- a/drivers/i2c/busses/i2c-sirf.c
+++ b/drivers/i2c/busses/i2c-sirf.c
@@ -274,7 +274,6 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
 	struct clk *clk;
 	int bitrate;
 	int ctrl_speed;
-	int irq;
 
 	int err;
 	u32 regval;
@@ -314,13 +313,8 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto out;
-	}
-	err = devm_request_irq(&pdev->dev, irq, i2c_sirfsoc_irq, 0,
-		dev_name(&pdev->dev), siic);
+	err = devm_platform_request_irq(pdev, 0, NULL, i2c_sirfsoc_irq, 0,
+					dev_name(&pdev->dev), siic);
 	if (err)
 		goto out;
 
diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
index 64d739baf480..7893c532b8f2 100644
--- a/drivers/i2c/busses/i2c-stu300.c
+++ b/drivers/i2c/busses/i2c-stu300.c
@@ -881,8 +881,8 @@ static int stu300_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->virtbase))
 		return PTR_ERR(dev->virtbase);
 
-	dev->irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(&pdev->dev, dev->irq, stu300_irh, 0, NAME, dev);
+	ret = devm_platform_request_irq(pdev, 0, &dev->irq, stu300_irh,
+					0, NAME, dev);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index c9a3dba6a75d..d9143373e688 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -577,16 +577,10 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0)
-		return -ENODEV;
-
-	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
-			       0, dev_name(&pdev->dev), i2c);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
+	ret = devm_platform_request_irq(pdev, 0, &i2c->irq, synquacer_i2c_isr,
+					0, dev_name(&pdev->dev), i2c);
+	if (ret < 0)
 		return ret;
-	}
 
 	i2c->state = STATE_IDLE;
 	i2c->dev = &pdev->dev;
-- 
2.25.0

