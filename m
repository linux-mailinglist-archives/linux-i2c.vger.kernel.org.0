Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA4E75DC06
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjGVLvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjGVLvO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:51:14 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937B230DD;
        Sat, 22 Jul 2023 04:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jgsRf+yJF99p9uHxmODn5bF3cNDJE4aPPd/VwEEyUZo=;
        b=vJy2Y/pam/r2zsgZxW+32o4WCUuwHNJdl2t4uuTqj/bBcpzwXvKJLHikaAT/rPeA5lRsZI
        ejZcurUp1Pd/7LOCZCkjVcNUsLLHLDNr4bf6ZSTQhfxTUTs30hW1EJzDMbsyhNgh1Clmo8
        et3aJvXf2REeIDJDEhShz7VQnPeuNT8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 01/22] i2c: au1550: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:25 +0200
Message-Id: <20230722115046.27323-2-paul@crapouillou.net>
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

Note that the behaviour is slightly different than before; the original
code wrapped the suspend/resume with #ifdef CONFIG_PM guards, which
resulted in these functions being compiled in but never used when
CONFIG_PM_SLEEP was disabled.

Now, those functions are only compiled in when CONFIG_PM_SLEEP is
enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/i2c/busses/i2c-au1550.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index e66c12ecf270..8e43f25c117e 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -342,7 +342,6 @@ static void i2c_au1550_remove(struct platform_device *pdev)
 	i2c_au1550_disable(priv);
 }
 
-#ifdef CONFIG_PM
 static int i2c_au1550_suspend(struct device *dev)
 {
 	struct i2c_au1550_data *priv = dev_get_drvdata(dev);
@@ -361,21 +360,13 @@ static int i2c_au1550_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops i2c_au1550_pmops = {
-	.suspend	= i2c_au1550_suspend,
-	.resume		= i2c_au1550_resume,
-};
-
-#define AU1XPSC_SMBUS_PMOPS (&i2c_au1550_pmops)
-
-#else
-#define AU1XPSC_SMBUS_PMOPS NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(i2c_au1550_pmops,
+				i2c_au1550_suspend, i2c_au1550_resume);
 
 static struct platform_driver au1xpsc_smbus_driver = {
 	.driver = {
 		.name	= "au1xpsc_smbus",
-		.pm	= AU1XPSC_SMBUS_PMOPS,
+		.pm	= pm_sleep_ptr(&i2c_au1550_pmops),
 	},
 	.probe		= i2c_au1550_probe,
 	.remove_new	= i2c_au1550_remove,
-- 
2.40.1

