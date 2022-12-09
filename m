Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6480E6481E2
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 12:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiLILkp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 06:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiLILko (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 06:40:44 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8337B5CD1F;
        Fri,  9 Dec 2022 03:40:43 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B9BVM5s003250;
        Fri, 9 Dec 2022 05:40:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=OutUFtWHRVDbHzYVTgNI3mlFIOs7N4z1+/v8FMaHDh8=;
 b=l/RYnu51udB1TrSu2pAUhTydk9eP8sRLGug+GE9iy8TasVy7RrCDPGRB6dEGK2Z22qtl
 8hqyynL0hCzlMqx0WxPBOIYsDCSIW38z5i+8RJwV6gmem9BcRu3s8Uve6PbEdqsiXZx5
 e7lzUwDMHKK3HfDhOYzkv7jPpSZtCKGrt6KaOLagB/oKANLFroWzEuWBZfsQZo1PhvXZ
 hPV+VpCFzMzGR9tIIINUZURdgajwg3kVCbH+jULtgQuSl8Tvjn/Vrny4jKMYKa8PXRys
 BLL+osdzyrrTlj/Ac7XtwqhaqVJO5o0l0y1SCwzrm/j1sti8ryDa945W3qHjisn2vYsr Kg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m84r6pwm9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 05:40:38 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 05:40:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Fri, 9 Dec 2022 05:40:36 -0600
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A155BB2F;
        Fri,  9 Dec 2022 11:40:35 +0000 (UTC)
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
To:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
CC:     <hdegoede@redhat.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] i2c: designware: Fix unbalanced suspended flag
Date:   Fri, 9 Dec 2022 11:40:34 +0000
Message-ID: <20221209114034.18025-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Mmw74t7pBqmkJ-KdyHG0oqveaNXoCUjT
X-Proofpoint-GUID: Mmw74t7pBqmkJ-KdyHG0oqveaNXoCUjT
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

Don't set DPM_FLAG_MAY_SKIP_RESUME to skip system early_resume stage if the
driver was runtime-suspended. Instead, always call dw_i2c_plat_resume() and
use pm_runtime_suspended() to determine whether we need to power up the
hardware.

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
commit 80704a84a9f8
("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")

changed from using a local suspended flag to using the
i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
checked by I2C core code before issuing the transfer to the bus driver, so
there was no opportunity for the bus driver to runtime resume itself before
the flag check.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
---
Apologies if you get this message multiple times. I'm having trouble
with my SMTP server.
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index ba043b547393..d805b8c7e797 100644
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
@@ -475,7 +473,9 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	dw_i2c_plat_runtime_resume(dev);
+	if (!pm_runtime_suspended(dev))
+		dw_i2c_plat_runtime_resume(dev);
+
 	i2c_mark_adapter_resumed(&i_dev->adapter);
 
 	return 0;
-- 
2.30.2

