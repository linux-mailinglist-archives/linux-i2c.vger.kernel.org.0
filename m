Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E10B748F35
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233912AbjGEUpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbjGEUp2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:45:28 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A1219AC;
        Wed,  5 Jul 2023 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I3lBz+eaIN5N2MwzF2q9zx4C6GRahQdn7x/nnKH54Gw=;
        b=bvryjvSj9Bt4CNYeaGGuaK4QMzJkNBn/wfxOn1JI186QyIVi08g4QQQuEJAFDgl51OUrnq
        +qLq8QXhw+yZa4/FW0AObdvZuGJPGrbhpX8JTFHNCRbVnXJyphuxC3rxFbwuZOzc55Cc2b
        rrukYEM9QclIsOFyuLxYSxg4X6u11Ps=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: [PATCH 06/23] i2c: designware: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:42:57 +0200
Message-Id: <20230705204314.89800-7-paul@crapouillou.net>
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

