Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4423475DC2D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjGVLzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjGVLzl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:55:41 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6F93ABD;
        Sat, 22 Jul 2023 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=INhMr4ZnPfM7KPu4B+DulB6N21MJlD7AD/5uWSd1oOE=;
        b=dhyXVRKPuMycbtf07n5qKw8WqCRNjk/2dYzu9+MuY+dIWQKdfW/nrrgIf71i/eyLYSaPZ4
        onLN52UTHVsnFBR5ng4UnS8Us6b5fwPoxkyLSgIYIoGfwTseKToKj1xl0YzlYC8vTRCinh
        O+fmk6fGpXabzAj40H6V9xOMYQ+nVLE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 13/22] i2c: nomadik: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:37 +0200
Message-Id: <20230722115046.27323-14-paul@crapouillou.net>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
v2: Rewrapped runtime PM line

---
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-nomadik.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 212f412f1c74..b10574d42b7a 100644
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
@@ -925,13 +922,10 @@ static int nmk_i2c_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops nmk_i2c_pm = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(nmk_i2c_suspend_late, nmk_i2c_resume_early)
-	SET_RUNTIME_PM_OPS(nmk_i2c_runtime_suspend,
-			nmk_i2c_runtime_resume,
-			NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(nmk_i2c_suspend_late, nmk_i2c_resume_early)
+	RUNTIME_PM_OPS(nmk_i2c_runtime_suspend, nmk_i2c_runtime_resume, NULL)
 };
 
 static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
@@ -1078,7 +1072,7 @@ static struct amba_driver nmk_i2c_driver = {
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

