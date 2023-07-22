Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AE675DC1A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjGVLyG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGVLyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:54:05 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB332708;
        Sat, 22 Jul 2023 04:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0+PMcQ1JQi88PmWz758Zjy2jsHKFsLNpkh61EVZhzLM=;
        b=OEGd/g37kzB68UIkWUPZ3NsiW3jm+b6h83KP6H18iEL/uT8A4JOeA49WYS21ekBzkKV27H
        IifcaajxhSaOoH9nJOoARPZS7PGmqY1KZkGqpVvCAG8p8cwGvm/SOnQaKZymd8+t7X5aHr
        5TusUeZHYznllR5OjktFjPXUXcJIg2I=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 09/22] i2c: img-scb: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:33 +0200
Message-Id: <20230722115046.27323-10-paul@crapouillou.net>
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

---
v2: Unfold _DEFINE_DEV_PM_OPS() macro
---
 drivers/i2c/busses/i2c-img-scb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 66ba36949ab5..f9d4bfef511c 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1454,7 +1454,6 @@ static int img_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_i2c_suspend(struct device *dev)
 {
 	struct img_i2c *i2c = dev_get_drvdata(dev);
@@ -1482,13 +1481,10 @@ static int img_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops img_i2c_pm = {
-	SET_RUNTIME_PM_OPS(img_i2c_runtime_suspend,
-			   img_i2c_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(img_i2c_suspend, img_i2c_resume)
+	RUNTIME_PM_OPS(img_i2c_runtime_suspend, img_i2c_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(img_i2c_suspend, img_i2c_resume)
 };
 
 static const struct of_device_id img_scb_i2c_match[] = {
@@ -1501,7 +1497,7 @@ static struct platform_driver img_scb_i2c_driver = {
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

