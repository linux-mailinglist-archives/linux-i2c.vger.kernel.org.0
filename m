Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 585F692145
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 12:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfHSKbe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 06:31:34 -0400
Received: from mga09.intel.com ([134.134.136.24]:10676 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfHSKbe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Aug 2019 06:31:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 03:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; 
   d="scan'208";a="168709767"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 19 Aug 2019 03:31:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 470348D; Mon, 19 Aug 2019 13:31:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: designware: Fix optional reset error handling
Date:   Mon, 19 Aug 2019 13:31:30 +0300
Message-Id: <20190819103130.73999-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The commit bb475230b8e5 ("reset: make optional functions really optional")
brought a missed part of the support for an optional reset handlers.

Since that we don't need to have special error handling in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4624ef8fbae8..16dd338877d0 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -279,12 +279,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dev);
 
 	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(dev->rst)) {
-		if (PTR_ERR(dev->rst) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-	} else {
-		reset_control_deassert(dev->rst);
-	}
+	if (IS_ERR(dev->rst))
+		return PTR_ERR(dev->rst);
+
+	reset_control_deassert(dev->rst);
 
 	t = &dev->timings;
 	if (pdata)
@@ -402,8 +400,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 exit_probe:
 	dw_i2c_plat_pm_cleanup(dev);
 exit_reset:
-	if (!IS_ERR_OR_NULL(dev->rst))
-		reset_control_assert(dev->rst);
+	reset_control_assert(dev->rst);
 	return ret;
 }
 
@@ -421,8 +418,7 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	dw_i2c_plat_pm_cleanup(dev);
 
-	if (!IS_ERR_OR_NULL(dev->rst))
-		reset_control_assert(dev->rst);
+	reset_control_assert(dev->rst);
 
 	return 0;
 }
-- 
2.23.0.rc1

