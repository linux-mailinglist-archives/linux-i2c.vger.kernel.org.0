Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAF81B86D7
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 15:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgDYNox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 09:44:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:64840 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgDYNox (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 09:44:53 -0400
IronPort-SDR: XodGb+a9RcXTXyi7nfsfW835MBPoGeK0U4XndNVd5Sqf6hH/LSgt3H8cjzrOeO/g2tn72XQ8Fu
 +RUpaCS/4qQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 06:44:52 -0700
IronPort-SDR: 6XPY3n9sb8jmZe2C6CDquFzGRPEaDbGUUHhSjcDFS97AT3zWpVuPnqdNrvuMZttVJQEkp7UPej
 dfp8RhQObcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="301889078"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2020 06:44:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E09CD72; Sat, 25 Apr 2020 16:44:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/5] i2c: designware: Move configuration routines to respective modules
Date:   Sat, 25 Apr 2020 16:44:45 +0300
Message-Id: <20200425134448.28514-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move configuration routines to respective modules, i.e. master and slave.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/i2c/busses/i2c-designware-core.h    | 12 +++++++
 drivers/i2c/busses/i2c-designware-master.c  | 24 +++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 38 +--------------------
 drivers/i2c/busses/i2c-designware-slave.c   | 11 ++++++
 4 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b220ad64c38d7..b2f894f685233 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -314,13 +314,25 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
 
+extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe(struct dw_i2c_dev *dev);
+
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_SLAVE)
+extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_slave(struct dw_i2c_dev *dev);
 #else
+static inline void i2c_dw_configure_slave(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
 #endif
 
+static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
+{
+	if (i2c_detect_slave_mode(dev->dev))
+		i2c_dw_configure_slave(dev);
+	else
+		i2c_dw_configure_master(dev);
+}
+
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
 extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
 #else
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index b6c17b550d31e..139ba98c40331 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -657,6 +657,30 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+void i2c_dw_configure_master(struct dw_i2c_dev *dev)
+{
+	struct i2c_timings *t = &dev->timings;
+
+	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
+
+	dev->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
+			  DW_IC_CON_RESTART_EN;
+
+	dev->mode = DW_IC_MASTER;
+
+	switch (t->bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		dev->master_cfg |= DW_IC_CON_SPEED_STD;
+		break;
+	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		dev->master_cfg |= DW_IC_CON_SPEED_HIGH;
+		break;
+	default:
+		dev->master_cfg |= DW_IC_CON_SPEED_FAST;
+	}
+}
+EXPORT_SYMBOL_GPL(i2c_dw_configure_master);
+
 static void i2c_dw_prepare_recovery(struct i2c_adapter *adap)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 5b090480aa03e..108b7d9d78bb5 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -184,39 +184,6 @@ static inline int dw_i2c_of_configure(struct platform_device *pdev)
 }
 #endif
 
-static void i2c_dw_configure_master(struct dw_i2c_dev *dev)
-{
-	struct i2c_timings *t = &dev->timings;
-
-	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
-
-	dev->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
-			  DW_IC_CON_RESTART_EN;
-
-	dev->mode = DW_IC_MASTER;
-
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ:
-		dev->master_cfg |= DW_IC_CON_SPEED_STD;
-		break;
-	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
-		dev->master_cfg |= DW_IC_CON_SPEED_HIGH;
-		break;
-	default:
-		dev->master_cfg |= DW_IC_CON_SPEED_FAST;
-	}
-}
-
-static void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
-{
-	dev->functionality = I2C_FUNC_SLAVE | DW_IC_DEFAULT_FUNCTIONALITY;
-
-	dev->slave_cfg = DW_IC_CON_RX_FIFO_FULL_HLD_CTRL |
-			 DW_IC_CON_RESTART_EN | DW_IC_CON_STOP_DET_IFADDRESSED;
-
-	dev->mode = DW_IC_SLAVE;
-}
-
 static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 {
 	pm_runtime_disable(dev->dev);
@@ -319,10 +286,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_reset;
 
-	if (i2c_detect_slave_mode(&pdev->dev))
-		i2c_dw_configure_slave(dev);
-	else
-		i2c_dw_configure_master(dev);
+	i2c_dw_configure(dev);
 
 	/* Optional interface clock */
 	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index f5ecf76c0d024..576e7af4e94be 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -241,6 +241,17 @@ static const struct i2c_algorithm i2c_dw_algo = {
 	.unreg_slave = i2c_dw_unreg_slave,
 };
 
+void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
+{
+	dev->functionality = I2C_FUNC_SLAVE | DW_IC_DEFAULT_FUNCTIONALITY;
+
+	dev->slave_cfg = DW_IC_CON_RX_FIFO_FULL_HLD_CTRL |
+			 DW_IC_CON_RESTART_EN | DW_IC_CON_STOP_DET_IFADDRESSED;
+
+	dev->mode = DW_IC_SLAVE;
+}
+EXPORT_SYMBOL_GPL(i2c_dw_configure_slave);
+
 int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
-- 
2.26.2

