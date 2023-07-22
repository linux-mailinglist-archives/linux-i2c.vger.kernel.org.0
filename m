Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71CA675DC30
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjGVL4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjGVL4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:56:45 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904B62D46;
        Sat, 22 Jul 2023 04:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vWjncXjiCmOApnwrSM4Cd6iO/mHi8UOW3/VBKdasyw8=;
        b=cl4sWmS8BYMFArLhDmUcTqi8Sj16qDJV26GhC9RFXSlqluch0tOSCP7gy7MJL4YffBm1Bd
        TxLeGDRoXqrqBlHIS0YZnsMaQYgYmaK2MirAw9NkUZrDw6IErA+gMwSAFsbeIvyu4S5QeL
        ca3EuDQnQbe/ZovRirKPTL6Uf4/XU1w=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 14/22] i2c: ocores: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:38 +0200
Message-Id: <20230722115046.27323-15-paul@crapouillou.net>
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
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Andrew Lunn <andrew@lunn.ch>
---
 drivers/i2c/busses/i2c-ocores.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 4ac77e57bbbf..041a76f71a49 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -743,7 +743,6 @@ static void ocores_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&i2c->adap);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ocores_i2c_suspend(struct device *dev)
 {
 	struct ocores_i2c *i2c = dev_get_drvdata(dev);
@@ -772,11 +771,8 @@ static int ocores_i2c_resume(struct device *dev)
 	return ocores_init(dev, i2c);
 }
 
-static SIMPLE_DEV_PM_OPS(ocores_i2c_pm, ocores_i2c_suspend, ocores_i2c_resume);
-#define OCORES_I2C_PM	(&ocores_i2c_pm)
-#else
-#define OCORES_I2C_PM	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(ocores_i2c_pm,
+				ocores_i2c_suspend, ocores_i2c_resume);
 
 static struct platform_driver ocores_i2c_driver = {
 	.probe   = ocores_i2c_probe,
@@ -784,7 +780,7 @@ static struct platform_driver ocores_i2c_driver = {
 	.driver  = {
 		.name = "ocores-i2c",
 		.of_match_table = ocores_i2c_match,
-		.pm = OCORES_I2C_PM,
+		.pm = pm_sleep_ptr(&ocores_i2c_pm),
 	},
 };
 
-- 
2.40.1

