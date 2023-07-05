Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C20748F47
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234037AbjGEUrT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbjGEUrN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:47:13 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC7B1BDC;
        Wed,  5 Jul 2023 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5gHVcE8RU/hUBu2MLnfanVDpCvnfJ0V9sUihSxAlIOs=;
        b=L+NwoIkFTMfyOW2TfY7ACZms1Fp/R3Uh0DIk/4xqinDN1NxW2ymRxFezXOvfsTwskqfhkW
        DIdftWwQA65WCbkk9lfMY4SDeIKOkaTgsvIcGPoC/FD0UDAUtyHf4ubB+dMQnttG8AR7uf
        4jZyJ0vmec78v1r6MYD2kRFvwfMmE4g=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/23] i2c: nomadik: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:05 +0200
Message-Id: <20230705204314.89800-15-paul@crapouillou.net>
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-nomadik.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 1e5fd23ef45c..4a4b5bc257ae 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -873,7 +873,6 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int nmk_i2c_suspend_late(struct device *dev)
 {
 	int ret;
@@ -890,9 +889,7 @@ static int nmk_i2c_resume_early(struct device *dev)
 {
 	return pm_runtime_force_resume(dev);
 }
-#endif
 
-#ifdef CONFIG_PM
 static int nmk_i2c_runtime_suspend(struct device *dev)
 {
 	struct amba_device *adev = to_amba_device(dev);
@@ -925,13 +922,12 @@ static int nmk_i2c_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops nmk_i2c_pm = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(nmk_i2c_suspend_late, nmk_i2c_resume_early)
-	SET_RUNTIME_PM_OPS(nmk_i2c_runtime_suspend,
-			nmk_i2c_runtime_resume,
-			NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(nmk_i2c_suspend_late, nmk_i2c_resume_early)
+	RUNTIME_PM_OPS(nmk_i2c_runtime_suspend,
+		       nmk_i2c_runtime_resume,
+		       NULL)
 };
 
 static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
@@ -1080,7 +1076,7 @@ static struct amba_driver nmk_i2c_driver = {
 	.drv = {
 		.owner = THIS_MODULE,
 		.name = DRIVER_NAME,
-		.pm = &nmk_i2c_pm,
+		.pm = pm_ptr(&nmk_i2c_pm),
 	},
 	.id_table = nmk_i2c_ids,
 	.probe = nmk_i2c_probe,
-- 
2.40.1

