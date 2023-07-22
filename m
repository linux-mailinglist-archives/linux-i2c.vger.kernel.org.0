Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A6375DC4A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjGVL7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjGVL7j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:59:39 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A7435B7;
        Sat, 22 Jul 2023 04:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cDKwmBrSHDbvvXF7OyKsUvepLA1ouw+cJYaTFRNC5YE=;
        b=Qj/sCk8tyAcmh0z0+MS8uYnDQoAZWTqbFzZcVoCwBT8rDu3oWELh/AV7Lke5gA0QFl5y83
        b60b5HTyzrN6GeRnwi8DjsjwqKMKL4/S9XGR8k76SztJ6SP99KrlwDhVERPspr6PFYaoGf
        kWDblSSNtW9txOKkzftznIk4kyYyKgg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 20/22] i2c: sh-mobile: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:53:08 +0200
Message-Id: <20230722115310.27681-4-paul@crapouillou.net>
In-Reply-To: <20230722115046.27323-1-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/i2c/busses/i2c-sh_mobile.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 21717b943a9e..324407196a10 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -965,7 +965,6 @@ static void sh_mobile_i2c_remove(struct platform_device *dev)
 	pm_runtime_disable(&dev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sh_mobile_i2c_suspend(struct device *dev)
 {
 	struct sh_mobile_i2c_data *pd = dev_get_drvdata(dev);
@@ -983,20 +982,15 @@ static int sh_mobile_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops sh_mobile_i2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(sh_mobile_i2c_suspend,
-				      sh_mobile_i2c_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(sh_mobile_i2c_suspend,
+				  sh_mobile_i2c_resume)
 };
 
-#define DEV_PM_OPS (&sh_mobile_i2c_pm_ops)
-#else
-#define DEV_PM_OPS NULL
-#endif /* CONFIG_PM_SLEEP */
-
 static struct platform_driver sh_mobile_i2c_driver = {
 	.driver		= {
 		.name		= "i2c-sh_mobile",
 		.of_match_table = sh_mobile_i2c_dt_ids,
-		.pm	= DEV_PM_OPS,
+		.pm	= pm_sleep_ptr(&sh_mobile_i2c_pm_ops),
 	},
 	.probe		= sh_mobile_i2c_probe,
 	.remove_new	= sh_mobile_i2c_remove,
-- 
2.40.1

