Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DAF16A999
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgBXPPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:39 -0500
Received: from mga03.intel.com ([134.134.136.65]:14873 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727958AbgBXPPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="316773087"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2020 07:15:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8EF193D5; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 11/40] i2c: designware: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:01 +0200
Message-Id: <20200224151530.31713-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 37 ++++++++++++---------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3b7d58c2fe85..4ecc2dffeccc 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -99,16 +99,16 @@ static int dw_i2c_acpi_configure(struct platform_device *pdev)
 	dw_i2c_acpi_params(pdev, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
 
 	switch (t->bus_freq_hz) {
-	case 100000:
+	case I2C_STANDARD_MODE_FREQ:
 		dev->sda_hold_time = ss_ht;
 		break;
-	case 1000000:
+	case I2C_FAST_MODE_PLUS_FREQ:
 		dev->sda_hold_time = fp_ht;
 		break;
-	case 3400000:
+	case I2C_HIGH_SPEED_MODE_FREQ:
 		dev->sda_hold_time = hs_ht;
 		break;
-	case 400000:
+	case I2C_FAST_MODE_FREQ:
 	default:
 		dev->sda_hold_time = fs_ht;
 		break;
@@ -198,10 +198,10 @@ static void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 	dev->mode = DW_IC_MASTER;
 
 	switch (t->bus_freq_hz) {
-	case 100000:
+	case I2C_STANDARD_MODE_FREQ:
 		dev->master_cfg |= DW_IC_CON_SPEED_STD;
 		break;
-	case 3400000:
+	case I2C_HIGH_SPEED_MODE_FREQ:
 		dev->master_cfg |= DW_IC_CON_SPEED_HIGH;
 		break;
 	default:
@@ -249,6 +249,13 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 		pm_runtime_put_noidle(dev->dev);
 }
 
+static const u32 supported_speeds[] = {
+	I2C_HIGH_SPEED_MODE_FREQ,
+	I2C_FAST_MODE_PLUS_FREQ,
+	I2C_FAST_MODE_FREQ,
+	I2C_STANDARD_MODE_FREQ,
+};
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -258,9 +265,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	u32 acpi_speed;
 	struct resource *mem;
 	int i, irq, ret;
-	static const int supported_speeds[] = {
-		0, 100000, 400000, 1000000, 3400000
-	};
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -296,11 +300,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	 * Some DSTDs use a non standard speed, round down to the lowest
 	 * standard speed.
 	 */
-	for (i = 1; i < ARRAY_SIZE(supported_speeds); i++) {
-		if (acpi_speed < supported_speeds[i])
+	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
+		if (acpi_speed >= supported_speeds[i])
 			break;
 	}
-	acpi_speed = supported_speeds[i - 1];
+	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
 
 	/*
 	 * Find bus speed from the "clock-frequency" device property, ACPI
@@ -311,7 +315,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	else if (acpi_speed || t->bus_freq_hz)
 		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
 	else
-		t->bus_freq_hz = 400000;
+		t->bus_freq_hz = I2C_FAST_MODE_FREQ;
 
 	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
 
@@ -325,8 +329,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	 * Only standard mode at 100kHz, fast mode at 400kHz,
 	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
 	 */
-	if (t->bus_freq_hz != 100000 && t->bus_freq_hz != 400000 &&
-	    t->bus_freq_hz != 1000000 && t->bus_freq_hz != 3400000) {
+	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
+		if (t->bus_freq_hz == supported_speeds[i])
+			break;
+	}
+	if (i == ARRAY_SIZE(supported_speeds)) {
 		dev_err(&pdev->dev,
 			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
 			t->bus_freq_hz);
-- 
2.25.0

