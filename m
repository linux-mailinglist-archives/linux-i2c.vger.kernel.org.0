Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB1675DC0E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGVLwg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjGVLwe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:52:34 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE6030F0;
        Sat, 22 Jul 2023 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oAKEITRB3KTFMFCP8QK4Q+ZniZfjvi0a7HdvJLVQa1Y=;
        b=FHZKq5TkNFj9YbHLtfrAcN6fHb5DGZuwu6T4MrfrAUoEaZDR4NDM97Ikn0nHW3dc70W/5N
        gkafbpf7h2TtxEwe3Xw/VmcToUI8Xzsq71gXL/kf3ynFaN2/pT5l4EBs9INkgP3FvFyHbV
        mPQgg87o+hpuh4VIA9So5WY/X/Sm+H4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v2 05/22] i2c: designware: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:29 +0200
Message-Id: <20230722115046.27323-6-paul@crapouillou.net>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 22 ++++++---------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 970c1c3b0402..855b698e99c0 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -418,7 +418,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	reset_control_assert(dev->rst);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dw_i2c_plat_prepare(struct device *dev)
 {
 	/*
@@ -429,11 +428,7 @@ static int dw_i2c_plat_prepare(struct device *dev)
 	 */
 	return !has_acpi_companion(dev);
 }
-#else
-#define dw_i2c_plat_prepare	NULL
-#endif
 
-#ifdef CONFIG_PM
 static int dw_i2c_plat_runtime_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
@@ -447,7 +442,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused dw_i2c_plat_suspend(struct device *dev)
+static int dw_i2c_plat_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
@@ -468,7 +463,7 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
+static int dw_i2c_plat_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
@@ -479,16 +474,11 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
-	.prepare = dw_i2c_plat_prepare,
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
-	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
+	.prepare = pm_sleep_ptr(dw_i2c_plat_prepare),
+	LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
+	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
 
-#define DW_I2C_DEV_PMOPS (&dw_i2c_dev_pm_ops)
-#else
-#define DW_I2C_DEV_PMOPS NULL
-#endif
-
 /* Work with hotplug and coldplug */
 MODULE_ALIAS("platform:i2c_designware");
 
@@ -499,7 +489,7 @@ static struct platform_driver dw_i2c_driver = {
 		.name	= "i2c_designware",
 		.of_match_table = of_match_ptr(dw_i2c_of_match),
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
-		.pm	= DW_I2C_DEV_PMOPS,
+		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
 	},
 };
 
-- 
2.40.1

