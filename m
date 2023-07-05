Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC91748F3E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbjGEUqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbjGEUqF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:46:05 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDD91BC2;
        Wed,  5 Jul 2023 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O6s8zlIWAPbRXKFmTmNcemtSW35hNiREJpb3UD0lF9s=;
        b=dz3W5Zchp8vNqFNM5stHka3thaIlMoxDgt46SmsSNtT09+euSUMWOmiofoOMYGrbjMasK2
        39/1qvEdvHf4ZhVIKJeDED9YR/2BTL+NhfTOsrG3O90TRpVjsExYBMjiZ+tUwmNalxARMh
        cz3CAQ8GvVL4EFoGELtkrMWGrypZ4J8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 10/23] i2c: img-scb: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:01 +0200
Message-Id: <20230705204314.89800-11-paul@crapouillou.net>
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

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/i2c/busses/i2c-img-scb.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 4b674cfbc6fb..a92e3082542e 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1454,7 +1454,6 @@ static int img_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_i2c_suspend(struct device *dev)
 {
 	struct img_i2c *i2c = dev_get_drvdata(dev);
@@ -1482,14 +1481,10 @@ static int img_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static const struct dev_pm_ops img_i2c_pm = {
-	SET_RUNTIME_PM_OPS(img_i2c_runtime_suspend,
-			   img_i2c_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(img_i2c_suspend, img_i2c_resume)
-};
+static _DEFINE_DEV_PM_OPS(img_i2c_pm, img_i2c_suspend, img_i2c_resume,
+			  img_i2c_runtime_suspend, img_i2c_runtime_resume,
+			  NULL);
 
 static const struct of_device_id img_scb_i2c_match[] = {
 	{ .compatible = "img,scb-i2c" },
@@ -1501,7 +1496,7 @@ static struct platform_driver img_scb_i2c_driver = {
 	.driver = {
 		.name		= "img-i2c-scb",
 		.of_match_table	= img_scb_i2c_match,
-		.pm		= &img_i2c_pm,
+		.pm		= pm_ptr(&img_i2c_pm),
 	},
 	.probe = img_i2c_probe,
 	.remove_new = img_i2c_remove,
-- 
2.40.1

