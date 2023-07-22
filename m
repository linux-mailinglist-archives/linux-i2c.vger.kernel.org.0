Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F0B75DC10
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjGVLw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjGVLww (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:52:52 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D00D119;
        Sat, 22 Jul 2023 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tzx6rGIH9n2t+jhvvX5hTmgPFpu20Dhz+c4ZXTCaqwc=;
        b=ahU213I+SxEqoMtC+cbppR09wmCUM247IbYCXOe/IPaUjjVnwvNlQKOD5fKJ9qUVPVKaTF
        XIqsc8rjt7WBsAO/ZV3XyNUGaZO/1OD26M8/aUlxhVBYMeWBtwEDIrEYyEKJ3lLqYZbeu/
        9vFn9n9xR2tl/8Gu8gVJAkigkHTt2MM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 06/22] i2c: exynos5: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:30 +0200
Message-Id: <20230722115046.27323-7-paul@crapouillou.net>
In-Reply-To: <20230722115046.27323-1-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/i2c/busses/i2c-exynos5.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index f378cd479e55..5b201a326c13 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -892,7 +892,6 @@ static void exynos5_i2c_remove(struct platform_device *pdev)
 	clk_unprepare(i2c->pclk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int exynos5_i2c_suspend_noirq(struct device *dev)
 {
 	struct exynos5_i2c *i2c = dev_get_drvdata(dev);
@@ -934,11 +933,10 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
 	clk_disable_unprepare(i2c->pclk);
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos5_i2c_suspend_noirq,
-				      exynos5_i2c_resume_noirq)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos5_i2c_suspend_noirq,
+				  exynos5_i2c_resume_noirq)
 };
 
 static struct platform_driver exynos5_i2c_driver = {
@@ -946,7 +944,7 @@ static struct platform_driver exynos5_i2c_driver = {
 	.remove_new	= exynos5_i2c_remove,
 	.driver		= {
 		.name	= "exynos5-hsi2c",
-		.pm	= &exynos5_i2c_dev_pm_ops,
+		.pm	= pm_sleep_ptr(&exynos5_i2c_dev_pm_ops),
 		.of_match_table = exynos5_i2c_match,
 	},
 };
-- 
2.40.1

