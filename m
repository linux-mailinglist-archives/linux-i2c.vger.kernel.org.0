Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BBB748F54
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbjGEUsW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbjGEUsV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:48:21 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C351FD5;
        Wed,  5 Jul 2023 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4ZMhJHfwRq/YsfRfB6Rq8DTpviAwP7iZQD4xDuA/JAE=;
        b=vGyP40/Nz2qbJ0Kr5CPbwqy32ezKbHLB4Ij3p169EhLODT4/2cd76R2sAVp3yXy0Jojkpy
        QbDgMCQ3DD1tqRcd5UMZqzT7Jy2/uwcgY2BETH4sOw4lEv4R1GBS9q5KYo6rCGB2L48bcM
        dZxpNw2BMrfPP2dKkSSWiMQOx/4cLfw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 18/23] i2c: qup: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:09 +0200
Message-Id: <20230705204314.89800-19-paul@crapouillou.net>
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

Note that the driver should probably use the DEFINE_RUNTIME_DEV_PM_OPS()
macro, as the system suspend/resume callbacks seem to not do anything
more than triggering the runtime-PM states.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/i2c/busses/i2c-qup.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 6eef1dbd00de..658d1c1c2ec8 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1920,7 +1920,6 @@ static void qup_i2c_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(qup->dev);
 }
 
-#ifdef CONFIG_PM
 static int qup_i2c_pm_suspend_runtime(struct device *device)
 {
 	struct qup_i2c_dev *qup = dev_get_drvdata(device);
@@ -1938,9 +1937,7 @@ static int qup_i2c_pm_resume_runtime(struct device *device)
 	qup_i2c_enable_clocks(qup);
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int qup_i2c_suspend(struct device *device)
 {
 	if (!pm_runtime_suspended(device))
@@ -1955,16 +1952,11 @@ static int qup_i2c_resume(struct device *device)
 	pm_request_autosuspend(device);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops qup_i2c_qup_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(
-		qup_i2c_suspend,
-		qup_i2c_resume)
-	SET_RUNTIME_PM_OPS(
-		qup_i2c_pm_suspend_runtime,
-		qup_i2c_pm_resume_runtime,
-		NULL)
+	SYSTEM_SLEEP_PM_OPS(qup_i2c_suspend, qup_i2c_resume)
+	RUNTIME_PM_OPS(qup_i2c_pm_suspend_runtime,
+		       qup_i2c_pm_resume_runtime, NULL)
 };
 
 static const struct of_device_id qup_i2c_dt_match[] = {
@@ -1980,7 +1972,7 @@ static struct platform_driver qup_i2c_driver = {
 	.remove_new = qup_i2c_remove,
 	.driver = {
 		.name = "i2c_qup",
-		.pm = &qup_i2c_qup_pm_ops,
+		.pm = pm_ptr(&qup_i2c_qup_pm_ops),
 		.of_match_table = qup_i2c_dt_match,
 		.acpi_match_table = ACPI_PTR(qup_i2c_acpi_match),
 	},
-- 
2.40.1

