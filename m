Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C01D1B86D9
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Apr 2020 15:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgDYNoy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Apr 2020 09:44:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:43229 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgDYNoy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Apr 2020 09:44:54 -0400
IronPort-SDR: doMMNs62d6yMEQxQAdQCRZhDQNkzZlVIyaqwO1w+6Sk6PY99C2tgJJzWmvUiw3GiYBotMOiutC
 5oLPvbZUnxFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 06:44:52 -0700
IronPort-SDR: Ly4FGv1clp3J7dVzeNJTLjuwqFfOrGZtfsLh+5seC84xjU+RnEz0SrD4mm2lDpResTWFwyMgYA
 4OGA7W6uy8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,316,1583222400"; 
   d="scan'208";a="291917128"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 25 Apr 2020 06:44:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 02084302; Sat, 25 Apr 2020 16:44:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/5] i2c: designware: Rename i2c_dw_probe() to i2c_dw_probe_master()
Date:   Sat, 25 Apr 2020 16:44:47 +0300
Message-Id: <20200425134448.28514-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
References: <20200425134448.28514-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As a preparatory patch to support slave mode for PCI enumerated devices rename
i2c_dw_probe() to i2c_dw_probe_master() and split common i2c_dw_probe() as
inline helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: drop MASTER module optional choice (Jarkko, Wolfram)

 drivers/i2c/busses/Makefile                 |  3 ++-
 drivers/i2c/busses/i2c-designware-core.h    | 15 ++++++++++++++-
 drivers/i2c/busses/i2c-designware-master.c  |  4 ++--
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  6 +-----
 5 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index c852d27370377..d5f56e6179a4b 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -49,7 +49,8 @@ obj-$(CONFIG_I2C_CBUS_GPIO)	+= i2c-cbus-gpio.o
 obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
 obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
 obj-$(CONFIG_I2C_DESIGNWARE_CORE)	+= i2c-designware-core.o
-i2c-designware-core-objs := i2c-designware-common.o i2c-designware-master.o
+i2c-designware-core-objs := i2c-designware-common.o
+i2c-designware-core-objs += i2c-designware-master.o
 ifeq ($(CONFIG_I2C_DESIGNWARE_SLAVE),y)
 i2c-designware-core-objs += i2c-designware-slave.o
 endif
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b2f894f685233..1674caf277451 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -315,7 +315,7 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
 
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
-extern int i2c_dw_probe(struct dw_i2c_dev *dev);
+extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
@@ -325,6 +325,19 @@ static inline void i2c_dw_configure_slave(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
 #endif
 
+static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
+{
+	switch (dev->mode) {
+	case DW_IC_SLAVE:
+		return i2c_dw_probe_slave(dev);
+	case DW_IC_MASTER:
+		return i2c_dw_probe_master(dev);
+	default:
+		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
+		return -EINVAL;
+	}
+}
+
 static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 {
 	if (i2c_detect_slave_mode(dev->dev))
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 139ba98c40331..95eeec53c744f 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -727,7 +727,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-int i2c_dw_probe(struct dw_i2c_dev *dev)
+int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
 	unsigned long irq_flags;
@@ -794,7 +794,7 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(i2c_dw_probe);
+EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index d5e5abc03683f..7e994f366a5e8 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -271,7 +271,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->nr = controller->bus_num;
 
-	r = i2c_dw_probe(dev);
+	r = i2c_dw_probe_master(dev);
 	if (r) {
 		pci_free_irq_vectors(pdev);
 		return r;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 108b7d9d78bb5..7e228ff91ad48 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -337,11 +337,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	if (dev->mode == DW_IC_SLAVE)
-		ret = i2c_dw_probe_slave(dev);
-	else
-		ret = i2c_dw_probe(dev);
-
+	ret = i2c_dw_probe(dev);
 	if (ret)
 		goto exit_probe;
 
-- 
2.26.2

