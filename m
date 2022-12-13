Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0C5464B7A5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 15:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbiLMOpk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 09:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235523AbiLMOpj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 09:45:39 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E821E48;
        Tue, 13 Dec 2022 06:45:37 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDCc10g013804;
        Tue, 13 Dec 2022 08:45:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=gYFfCadETKCKRRriGuMXvg8ILVl93d82IhYujyff2jE=;
 b=gEJv29UF/dj70QMqINnNoAYl09vHDeeGYjz+oRIuy4WMPeddQecOpmVH2R48QA4U68Cl
 pAVexzOdpfvlRT7vojp71s1+2Db+Z+mKh9bP5JN0zys6a2/4M9Smm4iezcW69UT7rKr8
 3Ec136Hd5fEG+fPYR5Wp5/mnpBJivce13xaXNV7/kVoi77meEyExvniC94ZsYnCU/LPs
 YzxaL/k1oT/YLh2x2VyyxAGieCNpI3xf6m0gtnVOASTSezebvEPHUHOe8lV6GR0va6Tb
 wUE9H/ii/N+he0vBFH35mIPfdEL9HDQC/PwUHdK7PwFyo3kTTa+vjTKoLXxysLGvGt4D mw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mcrd63c06-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Dec 2022 08:45:26 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 13 Dec
 2022 08:45:23 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Tue, 13 Dec 2022 08:45:23 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.111])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 03750477;
        Tue, 13 Dec 2022 14:45:24 +0000 (UTC)
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <wsa@kernel.org>
CC:     <hdegoede@redhat.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v2] i2c: designware: Fix unbalanced suspended flag
Date:   Tue, 13 Dec 2022 14:45:24 +0000
Message-ID: <20221213144524.368297-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yH8y5efmS_NuXyzqj4zBBj574k4k-sVL
X-Proofpoint-ORIG-GUID: yH8y5efmS_NuXyzqj4zBBj574k4k-sVL
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
DPM_FLAG_MAY_SKIP_RESUME.

The pairing of pm_runtime_force_suspend() and pm_runtime_force_resume()
can replace this. If nothing is using the driver, and it is not currently
suspended, it will be put into runtime-suspend and will be left in
runtime-suspend during the system resume.

pm_runtime_force_suspend() is not compatible with DPM_FLAG_SMART_SUSPEND
so this must also be removed. DPM_FLAG_SMART_SUSPEND will set the device
back to pm_runtime_active() during resume_noirq if it cannot skip resume.
This would lead to the inconsistent state where the driver runtime_suspend
has been called (by force_suspend()) but it is marked active (by PM core).

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
 drivers/i2c/busses/i2c-designware-platdrv.c | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index ba043b547393..590503e56bd0 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -349,17 +349,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
 
-	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
-		dev_pm_set_driver_flags(&pdev->dev,
-					DPM_FLAG_SMART_PREPARE |
-					DPM_FLAG_MAY_SKIP_RESUME);
-	} else {
-		dev_pm_set_driver_flags(&pdev->dev,
-					DPM_FLAG_SMART_PREPARE |
-					DPM_FLAG_SMART_SUSPEND |
-					DPM_FLAG_MAY_SKIP_RESUME);
-	}
-
+	dev_pm_set_driver_flags(&pdev->dev, DPM_FLAG_SMART_PREPARE);
 	device_enable_async_suspend(&pdev->dev);
 
 	/* The code below assumes runtime PM to be disabled. */
@@ -453,10 +443,15 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
 static int __maybe_unused dw_i2c_plat_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
 
 	i2c_mark_adapter_suspended(&i_dev->adapter);
 
-	return dw_i2c_plat_runtime_suspend(dev);
+	return 0;
 }
 
 static int dw_i2c_plat_runtime_resume(struct device *dev)
@@ -474,8 +469,13 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
 static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+	int ret;
+
+	/* Resume if pm_runtime_force_suspend() suspended. */
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
 
-	dw_i2c_plat_runtime_resume(dev);
 	i2c_mark_adapter_resumed(&i_dev->adapter);
 
 	return 0;
-- 
2.30.2

