Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17BA672B4B6
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjFKXDF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFKXDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:03:04 -0400
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net [46.105.56.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6BEBE
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:03:02 -0700 (PDT)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.253])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id C1BBA24B52
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:51 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8s98b (unknown [10.110.103.46])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1A9371FD4F;
        Sun, 11 Jun 2023 22:57:51 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
        by ghost-submission-6684bf9d7b-8s98b with ESMTPSA
        id mePMBG9RhmTn0Q8AyNC6/Q
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R00212037f6d-5d66-462c-a755-c6e5ad352955,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 04/15] i2c: busses: exynos5: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:51 +0200
Message-Id: <20230611225702.891856-5-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5867908842054879970
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace the pair of functions, devm_clk_get() and
clk_prepare_enable(), with a single function
devm_clk_get_enabled().

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 44 +++++++++-----------------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index f378cd479e558..6f76d0027aeae 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -808,30 +808,20 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	i2c->adap.retries = 3;
 
 	i2c->dev = &pdev->dev;
-	i2c->clk = devm_clk_get(&pdev->dev, "hsi2c");
-	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return -ENOENT;
-	}
+	i2c->clk = devm_clk_get_enabled(&pdev->dev, "hsi2c");
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+				     "cannot enable clock\n");
 
-	i2c->pclk = devm_clk_get_optional(&pdev->dev, "hsi2c_pclk");
-	if (IS_ERR(i2c->pclk)) {
+	i2c->pclk = devm_clk_get_optional_enabled(&pdev->dev, "hsi2c_pclk");
+	if (IS_ERR(i2c->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->pclk),
-				     "cannot get pclk");
-	}
-
-	ret = clk_prepare_enable(i2c->pclk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret)
-		goto err_pclk;
+				     "cannot enable pclk");
 
 	i2c->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(i2c->regs)) {
 		ret = PTR_ERR(i2c->regs);
-		goto err_clk;
+		return ret;
 	}
 
 	i2c->adap.dev.of_node = np;
@@ -846,26 +836,26 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 
 	i2c->irq = ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", i2c->irq);
-		goto err_clk;
+		return ret;
 	}
 
 	i2c->variant = of_device_get_match_data(&pdev->dev);
 
 	ret = exynos5_hsi2c_clock_setup(i2c);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	exynos5_i2c_reset(i2c);
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 
 	platform_set_drvdata(pdev, i2c);
 
@@ -873,13 +863,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	clk_disable(i2c->pclk);
 
 	return 0;
-
- err_clk:
-	clk_disable_unprepare(i2c->clk);
-
- err_pclk:
-	clk_disable_unprepare(i2c->pclk);
-	return ret;
 }
 
 static void exynos5_i2c_remove(struct platform_device *pdev)
@@ -887,9 +870,6 @@ static void exynos5_i2c_remove(struct platform_device *pdev)
 	struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adap);
-
-	clk_unprepare(i2c->clk);
-	clk_unprepare(i2c->pclk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.40.1

