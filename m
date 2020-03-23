Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE3618F25A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 11:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgCWKE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 06:04:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:5149 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727804AbgCWKE4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 06:04:56 -0400
IronPort-SDR: YhA9lbd/wZruHEckWYYsPY5Nkf7ZRYj74j9WFBEJiHmiUSLL6uGnUx+KWtKLE6yy7rcViIzjCl
 4rtkYQJAgBRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 03:04:54 -0700
IronPort-SDR: IKCQokKnvsr9QYjWjgwxcVnECpxGM1jzn02YpZ4oGOkG/x/rBtgqjpH7oeUtrw50BWrzDoWzcl
 Y+sbIpr1K7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; 
   d="scan'208";a="239885606"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2020 03:04:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5D42211D; Mon, 23 Mar 2020 12:04:52 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] i2c: designware: Move configuration routines to respective modules
Date:   Mon, 23 Mar 2020 12:04:51 +0200
Message-Id: <20200323100451.28808-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
References: <20200323100451.28808-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move configuration routines to respective modules, i.e. master and slave.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    | 12 +++++++
 drivers/i2c/busses/i2c-designware-master.c  | 24 +++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 38 +--------------------
 drivers/i2c/busses/i2c-designware-slave.c   | 11 ++++++
 4 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 2d34c15dca75..ba04fa91de0c 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -315,13 +315,17 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_MASTER)
+extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 #else
+static inline void i2c_dw_configure_master(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_master(struct dw_i2c_dev *dev) { return -EINVAL; }
 #endif
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_SLAVE)
+extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_slave(struct dw_i2c_dev *dev);
 #else
+static inline void i2c_dw_configure_slave(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
 #endif
 
@@ -338,6 +342,14 @@ static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
 	}
 }
 
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
index 9d2af87f45f1..66ada723d740 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -632,6 +632,30 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
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
index 0edcebe2168f..6da7f14cba62 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -186,39 +186,6 @@ static inline int dw_i2c_of_configure(struct platform_device *pdev)
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
@@ -323,10 +290,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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
index f5ecf76c0d02..576e7af4e94b 100644
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
2.25.1

