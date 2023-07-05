Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65BF6748F33
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbjGEUpR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbjGEUpN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:45:13 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4ECF1BC0;
        Wed,  5 Jul 2023 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Cruf7Vmb7XSlnXrVuQFYOamoAziq4HcztCnizK0FoQ=;
        b=XM/d9wXlRlr4OUyJhItpMMIKkBgDyd81rFGnWpcQIRIkJuNZg9U+g8H5M+YQyHsWVdK/UK
        iHBGMsvWguN/7JSchVExtCMcwnB95aByf6jXOvy/dsbo/RZ8I/ZOt5aVDXCY1leYH3wG8g
        dHiNaRFXXrpDmOzZ7X0h3exNU7Ygqng=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/23] i2c: davinci: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:42:56 +0200
Message-Id: <20230705204314.89800-6-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
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

Note that the behaviour is slightly different than before; the original
code wrapped the suspend/resume with #ifdef CONFIG_PM guards, which
resulted in these functions being compiled in but never used when
CONFIG_PM_SLEEP was disabled.

Now, those functions are only compiled in when CONFIG_PM_SLEEP is
enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-davinci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 71b60778c643..52527189a7bf 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -902,7 +902,6 @@ static void davinci_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev->dev);
 }
 
-#ifdef CONFIG_PM
 static int davinci_i2c_suspend(struct device *dev)
 {
 	struct davinci_i2c_dev *i2c_dev = dev_get_drvdata(dev);
@@ -926,15 +925,10 @@ static int davinci_i2c_resume(struct device *dev)
 static const struct dev_pm_ops davinci_i2c_pm = {
 	.suspend        = davinci_i2c_suspend,
 	.resume         = davinci_i2c_resume,
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
 };
 
-#define davinci_i2c_pm_ops (&davinci_i2c_pm)
-#else
-#define davinci_i2c_pm_ops NULL
-#endif
-
 static const struct platform_device_id davinci_i2c_driver_ids[] = {
 	{ .name = "i2c_davinci", },
 	{ /* sentinel */ }
@@ -947,7 +941,7 @@ static struct platform_driver davinci_i2c_driver = {
 	.id_table	= davinci_i2c_driver_ids,
 	.driver		= {
 		.name	= "i2c_davinci",
-		.pm	= davinci_i2c_pm_ops,
+		.pm	= pm_sleep_ptr(&davinci_i2c_pm),
 		.of_match_table = davinci_i2c_of_match,
 	},
 };
-- 
2.40.1

