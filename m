Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBDE70FB5C
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 18:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjEXQIX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 12:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEXQIW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 12:08:22 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7153135;
        Wed, 24 May 2023 09:08:20 -0700 (PDT)
Received: from van1shing-pc.localdomain ([10.12.182.0])
        (user=silver_code@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 34OFZupg004681-34OFZuph004681
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 24 May 2023 23:36:12 +0800
From:   Wang Zhang <silver_code@hust.edu.cn>
To:     Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     os-kernel-patches@googlegroups.com,
        Wang Zhang <silver_code@hust.edu.cn>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: ocores: use devm_ managed clks
Date:   Wed, 24 May 2023 23:35:53 +0800
Message-Id: <20230524153553.2118-1-silver_code@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
References: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: silver_code@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While it is not entirely clear why the original author implemented this
behavior, there may have been certain circumstances or issues that were not
apparent to us. It's possible that they were trying to work around a bug by
employing an unconventional solution.Using `devm_clk_get_enabled()` rather
than devm_clk_get() can automatically track the usage of clocks and free
them when they are no longer needed or an error occurs.

fixing it by changing `ocores_i2c_of_probe` to use
`devm_clk_get_optional_enabled()` rather than `devm_clk_get()`, changing
`goto err_clk' to direct return and removing `err_clk`.

Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2->v3: use `devm_clk_get_optional_enabled()` to manage clks
v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
---
 drivers/i2c/busses/i2c-ocores.c | 57 +++++++++++++--------------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 2e575856c5cd..316d72cde3b9 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -552,16 +552,14 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
 							&clock_frequency);
 	i2c->bus_clock_khz = 100;
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 
-	if (!IS_ERR(i2c->clk)) {
-		int ret = clk_prepare_enable(i2c->clk);
-
-		if (ret) {
-			dev_err(&pdev->dev,
-				"clk_prepare_enable failed: %d\n", ret);
-			return ret;
-		}
+	if (IS_ERR(i2c->clk)) {
+		dev_err(&pdev->dev,
+			"devm_clk_get_optional_enabled failed\n");
+		return PTR_ERR(i2c->clk);
+	}
+	if (i2c->clk) {
 		i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
 		if (clock_frequency_present)
 			i2c->bus_clock_khz = clock_frequency / 1000;
@@ -573,7 +571,6 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
 			if (!clock_frequency_present) {
 				dev_err(&pdev->dev,
 					"Missing required parameter 'opencores,ip-clock-frequency'\n");
-				clk_disable_unprepare(i2c->clk);
 				return -ENODEV;
 			}
 			i2c->ip_clock_khz = clock_frequency / 1000;
@@ -678,8 +675,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 		default:
 			dev_err(&pdev->dev, "Unsupported I/O width (%d)\n",
 				i2c->reg_io_width);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	}
 
@@ -710,13 +706,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 						   pdev->name, i2c);
 		if (ret) {
 			dev_err(&pdev->dev, "Cannot claim IRQ\n");
-			goto err_clk;
+			return ret;
 		}
 	}
 
 	ret = ocores_init(&pdev->dev, i2c);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
@@ -728,7 +724,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* add in known devices to the bus */
 	if (pdata) {
@@ -737,10 +733,6 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(i2c->clk);
-	return ret;
 }
 
 static int ocores_i2c_remove(struct platform_device *pdev)
@@ -755,9 +747,6 @@ static int ocores_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	if (!IS_ERR(i2c->clk))
-		clk_disable_unprepare(i2c->clk);
-
 	return 0;
 }
 
@@ -771,8 +760,7 @@ static int ocores_i2c_suspend(struct device *dev)
 	ctrl &= ~(OCI2C_CTRL_EN | OCI2C_CTRL_IEN);
 	oc_setreg(i2c, OCI2C_CONTROL, ctrl);
 
-	if (!IS_ERR(i2c->clk))
-		clk_disable_unprepare(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	return 0;
 }
 
@@ -780,19 +768,18 @@ static int ocores_i2c_resume(struct device *dev)
 {
 	struct ocores_i2c *i2c = dev_get_drvdata(dev);
 
-	if (!IS_ERR(i2c->clk)) {
-		unsigned long rate;
-		int ret = clk_prepare_enable(i2c->clk);
+	unsigned long rate;
+	int ret = clk_prepare_enable(i2c->clk);
 
-		if (ret) {
-			dev_err(dev,
-				"clk_prepare_enable failed: %d\n", ret);
-			return ret;
-		}
-		rate = clk_get_rate(i2c->clk) / 1000;
-		if (rate)
-			i2c->ip_clock_khz = rate;
+	if (ret) {
+		dev_err(dev,
+			"clk_prepare_enable failed: %d\n", ret);
+		return ret;
 	}
+	rate = clk_get_rate(i2c->clk) / 1000;
+	if (rate)
+		i2c->ip_clock_khz = rate;
+
 	return ocores_init(dev, i2c);
 }
 
-- 
2.34.1

