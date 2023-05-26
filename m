Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27AF27120A6
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 09:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236626AbjEZHHW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 03:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjEZHHV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 03:07:21 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372E8F7;
        Fri, 26 May 2023 00:07:19 -0700 (PDT)
Received: from van1shing-pc.localdomain ([10.12.182.0])
        (user=silver_code@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 34Q75tik000939-34Q75til000939
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 26 May 2023 15:05:57 +0800
From:   Wang Zhang <silver_code@hust.edu.cn>
To:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@kernel.org>,
        Andreas Larsson <andreas@gaisler.com>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <jacmet@sunsite.dk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: ocores: use devm_ managed clks
Date:   Fri, 26 May 2023 15:05:33 +0800
Message-Id: <20230526070534.76112-1-silver_code@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b5c00122-0fe0-4020-9036-e4cc37d1b51a@lunn.ch>
References: <b5c00122-0fe0-4020-9036-e4cc37d1b51a@lunn.ch>
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

Smatch complains that:
drivers/i2c/busses/i2c-ocores.c:704 ocores_i2c_probe()
warn: missing unwind goto?

If any wrong occurs in ocores_i2c_of_probe, the i2c->clk needs to be
released. But the function returns directly without freeing the clock.

Fix this by updating the code to use devm_clk_get_optional_enabled()
instead. Use dev_err_probe() where appropriate as well since we are
changing those statements.

Fixes: f5f35a92e44a ("i2c: ocores: Add irq support for sparc")
Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
---
v3->v4: use `dev_err_probe` to compact the code and add a fixes tag
v2->v3: use `devm_clk_get_optional_enabled()` to manage clks
v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
---
 drivers/i2c/busses/i2c-ocores.c | 64 +++++++++++----------------------
 1 file changed, 21 insertions(+), 43 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 2e575856c5cd..e30df2b78fdf 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -552,28 +552,20 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
 							&clock_frequency);
 	i2c->bus_clock_khz = 100;
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
-
-	if (!IS_ERR(i2c->clk)) {
-		int ret = clk_prepare_enable(i2c->clk);
-
-		if (ret) {
-			dev_err(&pdev->dev,
-				"clk_prepare_enable failed: %d\n", ret);
-			return ret;
-		}
-		i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
-		if (clock_frequency_present)
-			i2c->bus_clock_khz = clock_frequency / 1000;
-	}
-
+	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+				     "devm_clk_get_optional_enabled failed\n");
+
+	i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
+	if (clock_frequency_present)
+		i2c->bus_clock_khz = clock_frequency / 1000;
 	if (i2c->ip_clock_khz == 0) {
 		if (of_property_read_u32(np, "opencores,ip-clock-frequency",
 						&val)) {
 			if (!clock_frequency_present) {
 				dev_err(&pdev->dev,
 					"Missing required parameter 'opencores,ip-clock-frequency'\n");
-				clk_disable_unprepare(i2c->clk);
 				return -ENODEV;
 			}
 			i2c->ip_clock_khz = clock_frequency / 1000;
@@ -678,8 +670,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 		default:
 			dev_err(&pdev->dev, "Unsupported I/O width (%d)\n",
 				i2c->reg_io_width);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	}
 
@@ -710,13 +701,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
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
@@ -728,7 +719,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	/* add in known devices to the bus */
 	if (pdata) {
@@ -737,10 +728,6 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(i2c->clk);
-	return ret;
 }
 
 static int ocores_i2c_remove(struct platform_device *pdev)
@@ -755,9 +742,6 @@ static int ocores_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	if (!IS_ERR(i2c->clk))
-		clk_disable_unprepare(i2c->clk);
-
 	return 0;
 }
 
@@ -771,28 +755,22 @@ static int ocores_i2c_suspend(struct device *dev)
 	ctrl &= ~(OCI2C_CTRL_EN | OCI2C_CTRL_IEN);
 	oc_setreg(i2c, OCI2C_CONTROL, ctrl);
 
-	if (!IS_ERR(i2c->clk))
-		clk_disable_unprepare(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	return 0;
 }
 
 static int ocores_i2c_resume(struct device *dev)
 {
 	struct ocores_i2c *i2c = dev_get_drvdata(dev);
+	unsigned long rate;
+	int ret;
 
-	if (!IS_ERR(i2c->clk)) {
-		unsigned long rate;
-		int ret = clk_prepare_enable(i2c->clk);
-
-		if (ret) {
-			dev_err(dev,
-				"clk_prepare_enable failed: %d\n", ret);
-			return ret;
-		}
-		rate = clk_get_rate(i2c->clk) / 1000;
-		if (rate)
-			i2c->ip_clock_khz = rate;
-	}
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "clk_prepare_enable failed\n");
+	rate = clk_get_rate(i2c->clk) / 1000;
+	if (rate)
+		i2c->ip_clock_khz = rate;
 	return ocores_init(dev, i2c);
 }
 
-- 
2.34.1

