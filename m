Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3C475DC0A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjGVLvv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjGVLvu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:51:50 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7F53C23;
        Sat, 22 Jul 2023 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3KIt+a22Ffe/m+Ih0lyp0HmaKGBLRsOsK70rxD3459M=;
        b=m4H4fG9RL5/SCfWfqeBRF8QkrSRJkXlzqvQ/aPfIm7oNzx38s//YBsCnregYXEUbZ+tRB9
        4a7gLfe+9rXbLwxT9oSnOzJDQpEUZHNpUZjRrJs1e7TDG14ElY8aL8yW1lwIVArx3V/ufL
        AHwEdUlong/255edBxgct+da+Uo9HH8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/22] i2c: brcmstb: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:27 +0200
Message-Id: <20230722115046.27323-4-paul@crapouillou.net>
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

---
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-brcmstb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index cf92cbcb8c86..c778bcca95fe 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -697,7 +697,6 @@ static void brcmstb_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&dev->adapter);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int brcmstb_i2c_suspend(struct device *dev)
 {
 	struct brcmstb_i2c_dev *i2c_dev = dev_get_drvdata(dev);
@@ -715,10 +714,9 @@ static int brcmstb_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(brcmstb_i2c_pm, brcmstb_i2c_suspend,
-			 brcmstb_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(brcmstb_i2c_pm, brcmstb_i2c_suspend,
+				brcmstb_i2c_resume);
 
 static const struct of_device_id brcmstb_i2c_of_match[] = {
 	{.compatible = "brcm,brcmstb-i2c"},
@@ -732,7 +730,7 @@ static struct platform_driver brcmstb_i2c_driver = {
 	.driver = {
 		   .name = "brcmstb-i2c",
 		   .of_match_table = brcmstb_i2c_of_match,
-		   .pm = &brcmstb_i2c_pm,
+		   .pm = pm_sleep_ptr(&brcmstb_i2c_pm),
 		   },
 	.probe = brcmstb_i2c_probe,
 	.remove_new = brcmstb_i2c_remove,
-- 
2.40.1

