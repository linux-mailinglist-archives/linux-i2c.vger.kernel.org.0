Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51A8204C67
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 10:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731595AbgFWIbS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 04:31:18 -0400
Received: from mga14.intel.com ([192.55.52.115]:16453 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731579AbgFWIbS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 04:31:18 -0400
IronPort-SDR: defrBi5fLUdQj9wx99ozbm3La3Wurt7k7Qu/Cbxtr3nDiity2GJuiQfGhlWLbPasx4Tn4Z6e/u
 AehM7WBCDAIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143068333"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="143068333"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 01:31:17 -0700
IronPort-SDR: g0c1tqaX1zkooaTk3+maDThhMA9O0jNKbzUduknbuG2FAwhczbRRfjNOjd0h2H/GKbxQvHejR5
 tWzh0zMgRdng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="293131351"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.87])
  by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 01:31:16 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: designware: Fix bus speed in !CONFIG_ACPI case
Date:   Tue, 23 Jun 2020 11:31:13 +0300
Message-Id: <20200623083113.241137-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

John Stultz reported that commit f9288fcc5c615 ("i2c: designware: Move
ACPI parts into common module") caused a regression on the HiKey board
where adv7511 HDMI bridge driver wasn't probing anymore due the I2C bus
failed to start.

It seems the change caused the bus speed being zero when CONFIG_ACPI
not set and neither speed based on "clock-frequency" device property or
default fast mode is set.

Fix this by moving bus speed setting back to dw_i2c_plat_probe() and let
the i2c_dw_acpi_adjust_bus_speed() adjust only speed from ACPI.

Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common module")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Hi John. Would this fix the issue you are seeing?
---
 drivers/i2c/busses/i2c-designware-common.c  | 17 ++---------------
 drivers/i2c/busses/i2c-designware-core.h    |  4 ++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 13 ++++++++++++-
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e3a8640db7da..ee86efe94f7f 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -286,10 +286,8 @@ int i2c_dw_acpi_configure(struct device *device)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
-void i2c_dw_acpi_adjust_bus_speed(struct device *device)
+u32 i2c_dw_acpi_adjust_bus_speed(struct device *device)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(device);
-	struct i2c_timings *t = &dev->timings;
 	u32 acpi_speed;
 	int i;
 
@@ -302,18 +300,7 @@ void i2c_dw_acpi_adjust_bus_speed(struct device *device)
 		if (acpi_speed >= supported_speeds[i])
 			break;
 	}
-	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
-
-	/*
-	 * Find bus speed from the "clock-frequency" device property, ACPI
-	 * or by using fast mode if neither is set.
-	 */
-	if (acpi_speed && t->bus_freq_hz)
-		t->bus_freq_hz = min(t->bus_freq_hz, acpi_speed);
-	else if (acpi_speed || t->bus_freq_hz)
-		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
-	else
-		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
+	return (i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0);
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_adjust_bus_speed);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 556673a1f61b..2f1e72d07194 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -364,8 +364,8 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
 int i2c_dw_acpi_configure(struct device *device);
-void i2c_dw_acpi_adjust_bus_speed(struct device *device);
+u32 i2c_dw_acpi_adjust_bus_speed(struct device *device);
 #else
 static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
-static inline void i2c_dw_acpi_adjust_bus_speed(struct device *device) {}
+static inline u32 i2c_dw_acpi_adjust_bus_speed(struct device *device) { return 0; }
 #endif
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 0de4e302fc6a..b53aa91e64dc 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -197,6 +197,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
+	u32 acpi_speed;
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -228,7 +229,17 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	else
 		i2c_parse_fw_timings(&pdev->dev, t, false);
 
-	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
+	acpi_speed = i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
+	/*
+	 * Find bus speed from the "clock-frequency" device property, ACPI
+	 * or by using fast mode if neither is set.
+	 */
+	if (acpi_speed && t->bus_freq_hz)
+		t->bus_freq_hz = min(t->bus_freq_hz, acpi_speed);
+	else if (acpi_speed || t->bus_freq_hz)
+		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
+	else
+		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 
 	if (pdev->dev.of_node)
 		dw_i2c_of_configure(pdev);
-- 
2.27.0

