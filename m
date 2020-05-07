Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45BF1C8D05
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 15:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgEGNwr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 09:52:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:7353 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgEGNwr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 May 2020 09:52:47 -0400
IronPort-SDR: KpKbueO1slD+K4Nhoubd4yuexbW49ueNiwH8t+Do9Oq7ESBrx3M1Ww2QyQ3jopi1mBxoDtl8tO
 25bYMsC7klQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:51:45 -0700
IronPort-SDR: aq0Jnn1RSg7cONcEMMPwYoFqj+10ZwL004zwpe4Sxbrq7slZtegPENMPLHn8Vc7wJ4wkbiF6G7
 +1a3HM8jtJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="296540966"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 07 May 2020 06:51:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 130C4119; Thu,  7 May 2020 16:51:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] i2c: designware: Split out i2c_dw_validate_speed() helper
Date:   Thu,  7 May 2020 16:51:37 +0300
Message-Id: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to export array supported speed for wider use,
split out them along with i2c_dw_validate_speed() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    | 31 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 29 ++++---------------
 2 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 1674caf277451..626959573f894 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -9,6 +9,7 @@
  * Copyright (C) 2009 Provigent Ltd.
  */
 
+#include <linux/errno.h>
 #include <linux/i2c.h>
 
 #define DW_IC_DEFAULT_FUNCTIONALITY (I2C_FUNC_I2C |			\
@@ -351,3 +352,33 @@ extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
 #else
 static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
 #endif
+
+static const u32 i2c_dw_supported_speeds[] = {
+	I2C_MAX_HIGH_SPEED_MODE_FREQ,
+	I2C_MAX_FAST_MODE_PLUS_FREQ,
+	I2C_MAX_FAST_MODE_FREQ,
+	I2C_MAX_STANDARD_MODE_FREQ,
+};
+
+static inline int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
+{
+	struct i2c_timings *t = &dev->timings;
+	unsigned int i;
+
+	/*
+	 * Only standard mode at 100kHz, fast mode at 400kHz,
+	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
+	 */
+	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
+		if (t->bus_freq_hz == i2c_dw_supported_speeds[i])
+			break;
+	}
+	if (i == ARRAY_SIZE(i2c_dw_supported_speeds)) {
+		dev_err(dev->dev,
+			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
+			t->bus_freq_hz);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 01db634461b60..d6c03d7179c7a 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -192,13 +192,6 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 		pm_runtime_put_noidle(dev->dev);
 }
 
-static const u32 supported_speeds[] = {
-	I2C_MAX_HIGH_SPEED_MODE_FREQ,
-	I2C_MAX_FAST_MODE_PLUS_FREQ,
-	I2C_MAX_FAST_MODE_FREQ,
-	I2C_MAX_STANDARD_MODE_FREQ,
-};
-
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -241,11 +234,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	 * Some DSTDs use a non standard speed, round down to the lowest
 	 * standard speed.
 	 */
-	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
-		if (acpi_speed >= supported_speeds[i])
+	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
+		if (acpi_speed >= i2c_dw_supported_speeds[i])
 			break;
 	}
-	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
+	acpi_speed = i < ARRAY_SIZE(i2c_dw_supported_speeds) ? i2c_dw_supported_speeds[i] : 0;
 
 	/*
 	 * Find bus speed from the "clock-frequency" device property, ACPI
@@ -266,21 +259,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (has_acpi_companion(&pdev->dev))
 		dw_i2c_acpi_configure(pdev);
 
-	/*
-	 * Only standard mode at 100kHz, fast mode at 400kHz,
-	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
-	 */
-	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
-		if (t->bus_freq_hz == supported_speeds[i])
-			break;
-	}
-	if (i == ARRAY_SIZE(supported_speeds)) {
-		dev_err(&pdev->dev,
-			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
-			t->bus_freq_hz);
-		ret = -EINVAL;
+	ret = i2c_dw_validate_speed(dev);
+	if (ret)
 		goto exit_reset;
-	}
 
 	ret = i2c_dw_probe_lock_support(dev);
 	if (ret)
-- 
2.26.2

