Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A72748F40
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbjGEUqY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbjGEUqX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:46:23 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65B81BCB;
        Wed,  5 Jul 2023 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5G9Bz4NBKmoOQ9iIRjAj1sqsIF1f4+70ZU6MM73SBdQ=;
        b=pmIX54jGvEPhw5a4wQO13kQM6njVxF/iPqIJas2Uh6vE8uCq6P0QwjUYIR07+3jhpGL/wM
        ria1xcRwx4n72G6XmTX9rTVwJ2SaEDo67UYZgiz45n3YpLFkIJVzGLPqyd23yQl9GqlIZ8
        ABIXojaXcSs2htlre6QTklwqjQ1QY8A=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 11/23] i2c: kempld: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:02 +0200
Message-Id: <20230705204314.89800-12-paul@crapouillou.net>
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

Note that the driver should most likely be updated to use the
platform_driver.driver.pm.{suspend,resume} callbacks.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/i2c/busses/i2c-kempld.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 281058e3ea46..cb61e7b9202c 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -350,7 +350,6 @@ static void kempld_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 }
 
-#ifdef CONFIG_PM
 static int kempld_i2c_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct kempld_i2c_data *i2c = platform_get_drvdata(pdev);
@@ -377,10 +376,6 @@ static int kempld_i2c_resume(struct platform_device *pdev)
 
 	return 0;
 }
-#else
-#define kempld_i2c_suspend	NULL
-#define kempld_i2c_resume	NULL
-#endif
 
 static struct platform_driver kempld_i2c_driver = {
 	.driver = {
@@ -388,8 +383,8 @@ static struct platform_driver kempld_i2c_driver = {
 	},
 	.probe		= kempld_i2c_probe,
 	.remove_new	= kempld_i2c_remove,
-	.suspend	= kempld_i2c_suspend,
-	.resume		= kempld_i2c_resume,
+	.suspend	= pm_ptr(kempld_i2c_suspend),
+	.resume		= pm_ptr(kempld_i2c_resume),
 };
 
 module_platform_driver(kempld_i2c_driver);
-- 
2.40.1

