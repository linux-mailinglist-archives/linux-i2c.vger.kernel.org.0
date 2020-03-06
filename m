Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6887017BE58
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 14:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCFN2E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 08:28:04 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37064 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgCFN2E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 08:28:04 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2ABC38030786;
        Fri,  6 Mar 2020 13:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iGGu-Kyj4LLh; Fri,  6 Mar 2020 16:21:50 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] i2c: designware: Detect the FIFO size in the common code
Date:   Fri, 6 Mar 2020 16:19:54 +0300
In-Reply-To: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132151.2ABC38030786@mail.baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

The problem with detecting the FIFO depth in the platform driver
is that in order to implement this we have to access the controller
IC_COMP_PARAM_1 register. Currently it's done before the
i2c_dw_set_reg_access() method execution, which is errors prone since
the method determines the registers endianness and access mode and we
can't use dw_readl/dw_writel accessors before this information is
retrieved. We also can't move the i2c_dw_set_reg_access() function
invocation to after the master/slave probe functions call (when endianness
and access mode are determined), since the FIFO depth information is used
by them for initializations. So in order to fix the problem we have no
choice but to move the FIFO size detection methods to the common code and
call it at the probe stage.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-designware-common.c  | 22 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  |  2 ++
 drivers/i2c/busses/i2c-designware-platdrv.c | 24 ---------------------
 drivers/i2c/busses/i2c-designware-slave.c   |  2 ++
 5 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 2de7452fcd6d..4291ff6246d8 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -344,6 +344,28 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 		return -EIO;
 }
 
+void i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
+{
+	u32 param, tx_fifo_depth, rx_fifo_depth;
+
+	/*
+	 * Try to detect the FIFO depth if not set by interface driver,
+	 * the depth could be from 2 to 256 from HW spec.
+	 */
+	param = dw_readl(dev, DW_IC_COMP_PARAM_1);
+	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
+	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
+	if (!dev->tx_fifo_depth) {
+		dev->tx_fifo_depth = tx_fifo_depth;
+		dev->rx_fifo_depth = rx_fifo_depth;
+	} else if (tx_fifo_depth >= 2) {
+		dev->tx_fifo_depth = min_t(u32, dev->tx_fifo_depth,
+				tx_fifo_depth);
+		dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
+				rx_fifo_depth);
+	}
+}
+
 u32 i2c_dw_func(struct i2c_adapter *adap)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 67edbbde1070..3fbc9f22fcf1 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -297,6 +297,7 @@ int i2c_dw_acquire_lock(struct dw_i2c_dev *dev);
 void i2c_dw_release_lock(struct dw_i2c_dev *dev);
 int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev);
 int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
+void i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
 void i2c_dw_disable(struct dw_i2c_dev *dev);
 void i2c_dw_disable_int(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e8b328242256..05da900cf375 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -698,6 +698,8 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
+	i2c_dw_set_fifo_size(dev);
+
 	ret = dev->init(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3b7d58c2fe85..cb494273bb60 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -219,28 +219,6 @@ static void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
 	dev->mode = DW_IC_SLAVE;
 }
 
-static void dw_i2c_set_fifo_size(struct dw_i2c_dev *dev)
-{
-	u32 param, tx_fifo_depth, rx_fifo_depth;
-
-	/*
-	 * Try to detect the FIFO depth if not set by interface driver,
-	 * the depth could be from 2 to 256 from HW spec.
-	 */
-	param = i2c_dw_read_comp_param(dev);
-	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
-	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
-	if (!dev->tx_fifo_depth) {
-		dev->tx_fifo_depth = tx_fifo_depth;
-		dev->rx_fifo_depth = rx_fifo_depth;
-	} else if (tx_fifo_depth >= 2) {
-		dev->tx_fifo_depth = min_t(u32, dev->tx_fifo_depth,
-				tx_fifo_depth);
-		dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
-				rx_fifo_depth);
-	}
-}
-
 static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 {
 	pm_runtime_disable(dev->dev);
@@ -362,8 +340,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 				div_u64(clk_khz * t->sda_hold_ns + 500000, 1000000);
 	}
 
-	dw_i2c_set_fifo_size(dev);
-
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index f5f001738df5..0fc3aa31d46a 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -260,6 +260,8 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
+	i2c_dw_set_fifo_size(dev);
+
 	ret = dev->init(dev);
 	if (ret)
 		return ret;
-- 
2.25.1

