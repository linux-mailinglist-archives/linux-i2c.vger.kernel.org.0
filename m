Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2BC75DC1C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjGVLyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjGVLyb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:54:31 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8463586;
        Sat, 22 Jul 2023 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZfYmIzHRgYBzV6urk0eBKkvjZd8s+Cgl1DtSm6VxrPY=;
        b=j/JaMSGc6PEQpHppNXSaZQBKWIeEAp5izrRpYNEXg20lvJgfjeHBQHNWoUveV5+WEsC1Y7
        whute7Q1yDLcX0/X/OGvcTUugBGkCAuvThrAxGd+vhdMIjjDMSWdv7EVCFk9chaV26a2+R
        Jn179nWeQSZIavfgk6YFTTR0N3gia4o=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 10/22] i2c: kempld: Convert to use regular device PM
Date:   Sat, 22 Jul 2023 13:50:34 +0200
Message-Id: <20230722115046.27323-11-paul@crapouillou.net>
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

Provide PM callbacks through platform_driver.driver.pm instead of
platform_driver.{suspend,resume} as any good-behaved driver should do.

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
v2: Convert to use regular device PM instead of using
    platform_driver.{suspend,resume}
---
 drivers/i2c/busses/i2c-kempld.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 281058e3ea46..e01d75308288 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -350,10 +350,9 @@ static void kempld_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 }
 
-#ifdef CONFIG_PM
-static int kempld_i2c_suspend(struct platform_device *pdev, pm_message_t state)
+static int kempld_i2c_suspend(struct device *dev)
 {
-	struct kempld_i2c_data *i2c = platform_get_drvdata(pdev);
+	struct kempld_i2c_data *i2c = dev_get_drvdata(dev);
 	struct kempld_device_data *pld = i2c->pld;
 	u8 ctrl;
 
@@ -366,9 +365,9 @@ static int kempld_i2c_suspend(struct platform_device *pdev, pm_message_t state)
 	return 0;
 }
 
-static int kempld_i2c_resume(struct platform_device *pdev)
+static int kempld_i2c_resume(struct device *dev)
 {
-	struct kempld_i2c_data *i2c = platform_get_drvdata(pdev);
+	struct kempld_i2c_data *i2c = dev_get_drvdata(dev);
 	struct kempld_device_data *pld = i2c->pld;
 
 	kempld_get_mutex(pld);
@@ -377,19 +376,17 @@ static int kempld_i2c_resume(struct platform_device *pdev)
 
 	return 0;
 }
-#else
-#define kempld_i2c_suspend	NULL
-#define kempld_i2c_resume	NULL
-#endif
+
+static DEFINE_SIMPLE_DEV_PM_OPS(kempld_i2c_pm_ops,
+				kempld_i2c_suspend, kempld_i2c_resume);
 
 static struct platform_driver kempld_i2c_driver = {
 	.driver = {
 		.name = "kempld-i2c",
+		.pm = pm_sleep_ptr(&kempld_i2c_pm_ops),
 	},
 	.probe		= kempld_i2c_probe,
 	.remove_new	= kempld_i2c_remove,
-	.suspend	= kempld_i2c_suspend,
-	.resume		= kempld_i2c_resume,
 };
 
 module_platform_driver(kempld_i2c_driver);
-- 
2.40.1

