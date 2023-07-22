Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D79D75DC08
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjGVLvZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjGVLvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:51:24 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B1735AC;
        Sat, 22 Jul 2023 04:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WOFHNKsK7sTI8VewWj5Rz28bPQ4enj8OUgwSMc6/wig=;
        b=ulHCEv5lhHhyUR1dKodWn4Hv2vDkmxP3tl9Pn0xBuxUQ+8utZ4gwARsFqRKalziDeJ6nk4
        c2YeO3rWRqOhrGrZQKzdEOpY7pQ/3Trw5t00p3UmeuO4HUwf7FnScaduaFIISQffsFDSll
        PyWXfUYqEMTTnNN2pYY2kwLiCqYb3yU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Ray Jui <ray.jui@broadcom.com>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/22] i2c: iproc: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:26 +0200
Message-Id: <20230722115046.27323-3-paul@crapouillou.net>
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Ray Jui <ray.jui@broadcom.com>

---
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 2d8342fdc25d..8a3e2208475c 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1125,8 +1125,6 @@ static void bcm_iproc_i2c_remove(struct platform_device *pdev)
 	bcm_iproc_i2c_enable_disable(iproc_i2c, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
-
 static int bcm_iproc_i2c_suspend(struct device *dev)
 {
 	struct bcm_iproc_i2c_dev *iproc_i2c = dev_get_drvdata(dev);
@@ -1177,12 +1175,6 @@ static const struct dev_pm_ops bcm_iproc_i2c_pm_ops = {
 	.resume_early = &bcm_iproc_i2c_resume
 };
 
-#define BCM_IPROC_I2C_PM_OPS (&bcm_iproc_i2c_pm_ops)
-#else
-#define BCM_IPROC_I2C_PM_OPS NULL
-#endif /* CONFIG_PM_SLEEP */
-
-
 static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
 {
 	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
@@ -1255,7 +1247,7 @@ static struct platform_driver bcm_iproc_i2c_driver = {
 	.driver = {
 		.name = "bcm-iproc-i2c",
 		.of_match_table = bcm_iproc_i2c_of_match,
-		.pm = BCM_IPROC_I2C_PM_OPS,
+		.pm = pm_sleep_ptr(&bcm_iproc_i2c_pm_ops),
 	},
 	.probe = bcm_iproc_i2c_probe,
 	.remove_new = bcm_iproc_i2c_remove,
-- 
2.40.1

