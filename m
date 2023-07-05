Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628EF748F42
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbjGEUqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233918AbjGEUqp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:46:45 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BD51FC6;
        Wed,  5 Jul 2023 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O6riZ7HAoo2pfRWqdmOzvB12VXTYW5f5TYo3Pt2LWIk=;
        b=dqJL0juFB6n6IaMEyVkmC5kCzdZ+82vdOx52STzkhs+yMRkdcf/jPHayDbfCyfQL/GIEZp
        ZkOOG+F9Z2P4nnQVHZOGAyI0VbRXDgtNVvgX0LothzRswXpl31NCDV9N5H3+v2x5kPEkyN
        IXMYQRCxoTsJx+xzUeyVnEyvnX56Xj0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/23] i2c: lpc2k: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:03 +0200
Message-Id: <20230705204314.89800-13-paul@crapouillou.net>
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
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-lpc2k.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 5c6d96554753..c61157f1409b 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -431,7 +431,6 @@ static void i2c_lpc2k_remove(struct platform_device *dev)
 	i2c_del_adapter(&i2c->adap);
 }
 
-#ifdef CONFIG_PM
 static int i2c_lpc2k_suspend(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
@@ -456,11 +455,6 @@ static const struct dev_pm_ops i2c_lpc2k_dev_pm_ops = {
 	.resume_noirq = i2c_lpc2k_resume,
 };
 
-#define I2C_LPC2K_DEV_PM_OPS (&i2c_lpc2k_dev_pm_ops)
-#else
-#define I2C_LPC2K_DEV_PM_OPS NULL
-#endif
-
 static const struct of_device_id lpc2k_i2c_match[] = {
 	{ .compatible = "nxp,lpc1788-i2c" },
 	{},
@@ -472,7 +466,7 @@ static struct platform_driver i2c_lpc2k_driver = {
 	.remove_new = i2c_lpc2k_remove,
 	.driver	= {
 		.name		= "lpc2k-i2c",
-		.pm		= I2C_LPC2K_DEV_PM_OPS,
+		.pm		= pm_sleep_ptr(&i2c_lpc2k_dev_pm_ops),
 		.of_match_table	= lpc2k_i2c_match,
 	},
 };
-- 
2.40.1

