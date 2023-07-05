Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2F63748F4F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbjGEUsB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbjGEUsA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:48:00 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2310E1BC2;
        Wed,  5 Jul 2023 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zqaVGCHIKAI5J4uA9dTG+VcopV7+fzMzjarUUFT6S+I=;
        b=TMtDYFppOYfIUzYPE8c0kCnFTBwkP22i7XpXlCx/qu3G8wXEo65kJzt0AB2sVkzGYMufbF
        Hma2E70gR9MNmu5a3zbgi8Ib5rOSlHExraHEvd/KhAjtYuDhfMyqF5Sk4FpKTSNRVydwtF
        xNt8JVqaVOwrJoe6fIJcXFpX3dIjPDU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 17/23] i2c: pxa: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:08 +0200
Message-Id: <20230705204314.89800-18-paul@crapouillou.net>
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

Also note that pm_sleep_ptr() has not been applied to each callback
in the dev_pm_ops structure because the pm_sleep_ptr() at the usage site
is sufficient.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/i2c/busses/i2c-pxa.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 937f7eebe906..65a18d73be5c 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1491,7 +1491,6 @@ static void i2c_pxa_remove(struct platform_device *dev)
 	clk_disable_unprepare(i2c->clk);
 }
 
-#ifdef CONFIG_PM
 static int i2c_pxa_suspend_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
@@ -1516,17 +1515,12 @@ static const struct dev_pm_ops i2c_pxa_dev_pm_ops = {
 	.resume_noirq = i2c_pxa_resume_noirq,
 };
 
-#define I2C_PXA_DEV_PM_OPS (&i2c_pxa_dev_pm_ops)
-#else
-#define I2C_PXA_DEV_PM_OPS NULL
-#endif
-
 static struct platform_driver i2c_pxa_driver = {
 	.probe		= i2c_pxa_probe,
 	.remove_new	= i2c_pxa_remove,
 	.driver		= {
 		.name	= "pxa2xx-i2c",
-		.pm	= I2C_PXA_DEV_PM_OPS,
+		.pm	= pm_sleep_ptr(&i2c_pxa_dev_pm_ops),
 		.of_match_table = i2c_pxa_dt_ids,
 	},
 	.id_table	= i2c_pxa_id_table,
-- 
2.40.1

