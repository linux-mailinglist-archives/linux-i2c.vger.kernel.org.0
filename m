Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43294204DA3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 11:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731894AbgFWJPH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 05:15:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:39848 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731887AbgFWJPH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 05:15:07 -0400
IronPort-SDR: CDRKv2Q2xPqOkMX8NWeQND7JM78c2dT0CtlDC1C5P9MScje+ecVtDTD2DG1YnQxQ1xejfwuJbu
 UZskwKBKeZ5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="131423507"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="131423507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 02:15:05 -0700
IronPort-SDR: /RdcajRGXRh3/aOmzvuNj+yk/QtWddPP9DF/eKAmQrYb752oQaEWm/FZm2I9BY+iE/u9tIpXP9
 2wXbYBSrKBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="301188646"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 02:15:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6C88A11C; Tue, 23 Jun 2020 12:15:02 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH v1] i2c: designware: Adjust bus speed independently of ACPI
Date:   Tue, 23 Jun 2020 12:15:01 +0300
Message-Id: <20200623091501.50070-1-andriy.shevchenko@linux.intel.com>
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
not set and neither speed based on "clock-frequency" device property
or default fast mode is set.

Fix this by splitting i2c_dw_acpi_adjust_bus_speed() to
i2c_dw_acpi_round_bus_speed() and i2c_dw_adjust_bus_speed(), where
the latter one has the code that runs independently of ACPI.

Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common module")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 25 ++++++++++++++-------
 drivers/i2c/busses/i2c-designware-core.h    |  3 +--
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  2 +-
 4 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e3a8640db7da..3c19aada4b30 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -286,10 +286,8 @@ int i2c_dw_acpi_configure(struct device *device)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
-void i2c_dw_acpi_adjust_bus_speed(struct device *device)
+static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(device);
-	struct i2c_timings *t = &dev->timings;
 	u32 acpi_speed;
 	int i;
 
@@ -300,9 +298,22 @@ void i2c_dw_acpi_adjust_bus_speed(struct device *device)
 	 */
 	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
 		if (acpi_speed >= supported_speeds[i])
-			break;
+			return supported_speeds[i];
 	}
-	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
+
+	return 0;
+}
+
+#else	/* CONFIG_ACPI */
+
+static inline u32 i2c_dw_acpi_round_bus_speed(struct device *device) { return 0; }
+
+#endif	/* CONFIG_ACPI */
+
+void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
+{
+	u32 acpi_speed = i2c_dw_acpi_round_bus_speed(dev->dev);
+	struct i2c_timings *t = &dev->timings;
 
 	/*
 	 * Find bus speed from the "clock-frequency" device property, ACPI
@@ -315,9 +326,7 @@ void i2c_dw_acpi_adjust_bus_speed(struct device *device)
 	else
 		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 }
-EXPORT_SYMBOL_GPL(i2c_dw_acpi_adjust_bus_speed);
-
-#endif	/* CONFIG_ACPI */
+EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
 
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 556673a1f61b..eb5ef4d0f463 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -361,11 +361,10 @@ static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0;
 #endif
 
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
+void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
 int i2c_dw_acpi_configure(struct device *device);
-void i2c_dw_acpi_adjust_bus_speed(struct device *device);
 #else
 static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
-static inline void i2c_dw_acpi_adjust_bus_speed(struct device *device) {}
 #endif
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 947c096f86e3..8522134f9ea9 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -240,7 +240,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
-	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
+	i2c_dw_adjust_bus_speed(dev);
 
 	if (has_acpi_companion(&pdev->dev))
 		i2c_dw_acpi_configure(&pdev->dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 0de4e302fc6a..c2efaaaac252 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -228,7 +228,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	else
 		i2c_parse_fw_timings(&pdev->dev, t, false);
 
-	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
+	i2c_dw_adjust_bus_speed(dev);
 
 	if (pdev->dev.of_node)
 		dw_i2c_of_configure(pdev);
-- 
2.27.0

