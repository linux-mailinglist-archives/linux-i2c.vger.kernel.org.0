Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45FB975DC40
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjGVL6g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjGVL6b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:58:31 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FF710C1;
        Sat, 22 Jul 2023 04:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gr5fISthM3hjviIV2m+GHu1GOqDLLniBOMs8Cbn21rA=;
        b=TsdRxWo4yJIATAp3W8dDyU7tgsfQmpxGpFFRw+3KM40FlLmb/rd/NYamRtL3nkjbzVOV1E
        EdGE1xEoAEAC+4v03oTCSxxntuVILqG2FM1l3wi6r1U+B9qqL6cZbfHndA1qE5YyRRmYqC
        hpr8GhfxWYmRwV8T7NwI0Us6DWZJsBw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 17/22] i2c: qup: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:53:05 +0200
Message-Id: <20230722115310.27681-1-paul@crapouillou.net>
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

Note that the driver should probably use the DEFINE_RUNTIME_DEV_PM_OPS()
macro, as the system suspend/resume callbacks seem to not do anything
more than triggering the runtime-PM states.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/i2c/busses/i2c-qup.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index ae90170023b0..598102d16677 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1927,7 +1927,6 @@ static void qup_i2c_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(qup->dev);
 }
 
-#ifdef CONFIG_PM
 static int qup_i2c_pm_suspend_runtime(struct device *device)
 {
 	struct qup_i2c_dev *qup = dev_get_drvdata(device);
@@ -1945,9 +1944,7 @@ static int qup_i2c_pm_resume_runtime(struct device *device)
 	qup_i2c_enable_clocks(qup);
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM_SLEEP
 static int qup_i2c_suspend(struct device *device)
 {
 	if (!pm_runtime_suspended(device))
@@ -1962,16 +1959,11 @@ static int qup_i2c_resume(struct device *device)
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
@@ -1987,7 +1979,7 @@ static struct platform_driver qup_i2c_driver = {
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

