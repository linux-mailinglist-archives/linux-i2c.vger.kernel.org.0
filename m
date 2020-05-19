Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F8E1D96AA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgESMu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:56 -0400
Received: from mga01.intel.com ([192.55.52.88]:5915 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgESMuv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:51 -0400
IronPort-SDR: a3mICQlOtmDrDTIVEjzcSXtp7MdqZz5J8oIp+v3OI9TS/+jam2+sasD3kFSPfy531GgoPcKxis
 Pi06Hmt3CJUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:50 -0700
IronPort-SDR: R1y8BKKVU4y6EpgaWxrfGViYWeDyKu4RruIll00aH1LNcaYnnxEbXpKBe52dtDaUe5K/HaXyut
 YZTvzkchTcQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="282312469"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2020 05:50:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D17B619E; Tue, 19 May 2020 15:50:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/7] i2c: designware: Move i2c_dw_validate_speed() helper to a common code
Date:   Tue, 19 May 2020 15:50:39 +0300
Message-Id: <20200519125043.6069-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to export array supported speed for wider use, move it
to a header along with i2c_dw_validate_speed() helper moved to
a common code.

No functional changes intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: move it to common code instead of being separate (Jarkko)
 drivers/i2c/busses/i2c-designware-common.c  | 24 +++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  9 +++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 29 ++++-----------------
 3 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index c70c6fc09ee3..9f06567be54a 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -116,6 +116,30 @@ int i2c_dw_set_reg_access(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
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
+EXPORT_SYMBOL_GPL(i2c_dw_validate_speed);
+
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
 	/*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 94d9ad15133a..77c8aa422268 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -359,3 +359,12 @@ extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
 #else
 static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
 #endif
+
+static __maybe_unused const u32 i2c_dw_supported_speeds[] = {
+	I2C_MAX_HIGH_SPEED_MODE_FREQ,
+	I2C_MAX_FAST_MODE_PLUS_FREQ,
+	I2C_MAX_FAST_MODE_FREQ,
+	I2C_MAX_STANDARD_MODE_FREQ,
+};
+
+int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 7e228ff91ad4..a502750c89b7 100644
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

