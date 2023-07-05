Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECEB748F5C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbjGEUs5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbjGEUsy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:48:54 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA0119B;
        Wed,  5 Jul 2023 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dd7kJehD/sxOz38mxb1O6og++o78tUkBbMzQnSlqq3U=;
        b=ebydb06n8lqrvr3AtowfN8t44XnZkga/icMCWbGlov+nL8WQGp7F+nQpgqO3QqCJz2/0Ud
        hr7q30x050GYzxQ87GRTINrdVla4YahJ6xZXJZepUvf/ByLBooMKFVH1YeO66/ek7u+/k3
        90E3xdN5EAXTlldQFwuQh4cLZPCkCnU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 20/23] i2c: s3c2410: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:45:18 +0200
Message-Id: <20230705204521.90050-2-paul@crapouillou.net>
In-Reply-To: <20230705204521.90050-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
 <20230705204521.90050-1-paul@crapouillou.net>
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

---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/i2c/busses/i2c-s3c2410.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 28f0e5c64f32..d23a9e7fcb48 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1125,7 +1125,6 @@ static void s3c24xx_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int s3c24xx_i2c_suspend_noirq(struct device *dev)
 {
 	struct s3c24xx_i2c *i2c = dev_get_drvdata(dev);
@@ -1155,26 +1154,19 @@ static int s3c24xx_i2c_resume_noirq(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM
 static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(s3c24xx_i2c_suspend_noirq,
-				      s3c24xx_i2c_resume_noirq)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(s3c24xx_i2c_suspend_noirq,
+				  s3c24xx_i2c_resume_noirq)
 };
 
-#define S3C24XX_DEV_PM_OPS (&s3c24xx_i2c_dev_pm_ops)
-#else
-#define S3C24XX_DEV_PM_OPS NULL
-#endif
-
 static struct platform_driver s3c24xx_i2c_driver = {
 	.probe		= s3c24xx_i2c_probe,
 	.remove_new	= s3c24xx_i2c_remove,
 	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
 		.name	= "s3c-i2c",
-		.pm	= S3C24XX_DEV_PM_OPS,
+		.pm	= pm_sleep_ptr(&s3c24xx_i2c_dev_pm_ops),
 		.of_match_table = of_match_ptr(s3c24xx_i2c_match),
 	},
 };
-- 
2.40.1

