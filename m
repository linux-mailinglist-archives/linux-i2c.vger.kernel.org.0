Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6B5E650AA9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 12:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbiLSLUc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 06:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiLSLUb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 06:20:31 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABD82672;
        Mon, 19 Dec 2022 03:20:30 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ9k2UO010321;
        Mon, 19 Dec 2022 05:20:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=u5lQpuaVFsCIgj9TsW97JvpQ+ol6bSgZvGNrCVXttmk=;
 b=El1/Q2GA+SZ66Xyichte/akd+hpM37MMnx+lLZsJYZWyt/yfkYRY0tjZBhT9JbZJmQlQ
 YNJ9L1ZPCNCZ2z3I45BTOCH62YuX2Bd3zC47oMAs1df6+ycaoiQrJDSpeCsyIGTsx551
 DxKdTb4Ivftv4aOVjqZpWIazn70bd+/2980gpaUbg6nx6RD0efOAujw8u4l4ViVsjSow
 qCHGudMIp82N1fHsCZ1FrtYzPOguTn0cp0jHUhEQngSZTVp4DgOCK8Fi4/BZXwLMj/C/
 1XrOdRqUQs4eF9R6XKqYzqsjGG98NnDrhzXO7tg4XqFYqD72TJG7Xe59FFgJBhfgwjbQ Xg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mhc27afp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Dec 2022 05:20:22 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 19 Dec
 2022 05:20:20 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Mon, 19 Dec 2022 05:20:20 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.111])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F051011CC;
        Mon, 19 Dec 2022 11:20:19 +0000 (UTC)
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <wsa@kernel.org>
CC:     <hdegoede@redhat.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v3] i2c: designware: Fix unbalanced suspended flag
Date:   Mon, 19 Dec 2022 11:20:19 +0000
Message-ID: <20221219112019.882092-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: szsJb1a1oTWtpjGAp2R6PRe5kwA6Y5qX
X-Proofpoint-GUID: szsJb1a1oTWtpjGAp2R6PRe5kwA6Y5qX
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
i2c_mark_adapter_resumed().

dw_i2c_plat_resume() must always be called, so that
i2c_mark_adapter_resumed() is called. This is not compatible with
DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.

Since the controller is always resumed on system resume the
dw_i2c_plat_complete() callback is redundant and has been removed.

The unbalanced suspended flag was introduced by
commit c57813b8b288 ("i2c: designware: Lock the adapter while setting the
suspended flag")

Before that commit, the system and runtime PM used the same functions. The
DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
had been in runtime-suspend. If system resume was skipped, the suspended
flag would be cleared by the next runtime resume. The check of the
suspended flag was _after_ the call to pm_runtime_get_sync() in
i2c_dw_xfer(). So either a system resume or a runtime resume would clear
the flag before it was checked.

Having introduced the unbalanced suspended flag with that commit, a further
commit 80704a84a9f8 ("i2c: designware: Use the
i2c_mark_adapter_suspended/resumed() helpers")

changed from using a local suspended flag to using the
i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
checked by I2C core code before issuing the transfer to the bus driver, so
there was no opportunity for the bus driver to runtime resume itself before
the flag check.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index ba043b547393..74182db03a88 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -351,13 +351,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		dev_pm_set_driver_flags(&pdev->dev,
-					DPM_FLAG_SMART_PREPARE |
-					DPM_FLAG_MAY_SKIP_RESUME);
+					DPM_FLAG_SMART_PREPARE);
 	} else {
 		dev_pm_set_driver_flags(&pdev->dev,
 					DPM_FLAG_SMART_PREPARE |
-					DPM_FLAG_SMART_SUSPEND |
-					DPM_FLAG_MAY_SKIP_RESUME);
+					DPM_FLAG_SMART_SUSPEND);
 	}
 
 	device_enable_async_suspend(&pdev->dev);
@@ -419,21 +417,8 @@ static int dw_i2c_plat_prepare(struct device *dev)
 	 */
 	return !has_acpi_companion(dev);
 }
-
-static void dw_i2c_plat_complete(struct device *dev)
-{
-	/*
-	 * The device can only be in runtime suspend at this point if it has not
-	 * been resumed throughout the ending system suspend/resume cycle, so if
-	 * the platform firmware might mess up with it, request the runtime PM
-	 * framework to resume it.
-	 */
-	if (pm_runtime_suspended(dev) && pm_resume_via_firmware())
-		pm_request_resume(dev);
-}
 #else
 #define dw_i2c_plat_prepare	NULL
-#define dw_i2c_plat_complete	NULL
 #endif
 
 #ifdef CONFIG_PM
@@ -483,7 +468,6 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
 
 static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 	.prepare = dw_i2c_plat_prepare,
-	.complete = dw_i2c_plat_complete,
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
 	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
-- 
2.30.2

