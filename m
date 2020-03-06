Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692DC17BE9B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 14:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgCFNdD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 08:33:03 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37262 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgCFNdD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 08:33:03 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 71E638030793;
        Fri,  6 Mar 2020 13:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VmLFY2L5sqQc; Fri,  6 Mar 2020 16:23:47 +0300 (MSK)
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
Subject: [PATCH 6/6] i2c: designware: Add Baikal-T1 SoC I2C controller support
Date:   Fri, 6 Mar 2020 16:19:58 +0300
In-Reply-To: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132348.71E638030793@mail.baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

A third I2C controller embedded into the Baikal-T1 SoC is also fully
based on the DW APB I2C core, but its registers are indirectly
accessible via "command/data in/data out" trio. There is no difference
other than that. So in order to have that controller supported by the
common DW APB I2C driver we only need to introduce a new flag
ACCESS_INDIRECT and use the access-registers to reach the I2C controller
normal registers space in the dw_readl/dw_writel methods. Currently this
flag is only enabled for the controllers with "be,bt1-i2c" compatible
string.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-designware-common.c  | 79 ++++++++++++++++++---
 drivers/i2c/busses/i2c-designware-core.h    | 14 ++++
 drivers/i2c/busses/i2c-designware-master.c  |  1 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 drivers/i2c/busses/i2c-designware-slave.c   |  1 +
 5 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 72e93c1aa9bc..d3010bb6ad42 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -53,15 +54,75 @@ static char *abort_sources[] = {
 		"incorrect slave-transmitter mode configuration",
 };
 
+static inline u32 dw_read_reg(struct dw_i2c_dev *dev, int offset)
+{
+	if (dev->flags & ACCESS_16BIT)
+		return readw_relaxed(dev->base + offset) |
+			(readw_relaxed(dev->base + offset + 2) << 16);
+	else
+		return readl_relaxed(dev->base + offset);
+}
+
+static inline void dw_write_reg(struct dw_i2c_dev *dev, u32 b, int offset)
+{
+	if (dev->flags & ACCESS_16BIT) {
+		writew_relaxed((u16)b, dev->base + offset);
+		writew_relaxed((u16)(b >> 16), dev->base + offset + 2);
+	} else {
+		writel_relaxed(b, dev->base + offset);
+	}
+}
+
+static inline u32 dw_read_ind(struct dw_i2c_dev *dev, int offset)
+{
+	unsigned long flags, ok = DW_IC_IND_RETRY;
+	u32 cmd, value = 0;
+
+	cmd = DW_IC_CTL_GO | (offset & DW_IC_CTL_ADDR_MASK);
+
+	spin_lock_irqsave(&dev->ind_lock, flags);
+
+	dw_write_reg(dev, cmd, DW_IC_CTL);
+
+	while ((dw_read_reg(dev, DW_IC_CTL) & DW_IC_CTL_GO) && ok--);
+	if (ok)
+		value = dw_read_reg(dev, DW_IC_DO);
+	else
+		dev_err(dev->dev, "Register 0x%02x read timedout\n", offset);
+
+	spin_unlock_irqrestore(&dev->ind_lock, flags);
+
+	return value;
+}
+
+static inline void dw_write_ind(struct dw_i2c_dev *dev, u32 b, int offset)
+{
+	unsigned long flags, ok = DW_IC_IND_RETRY;
+	u32 cmd;
+
+	cmd = DW_IC_CTL_GO | DW_IC_CTL_WR | (offset & DW_IC_CTL_ADDR_MASK);
+
+	spin_lock_irqsave(&dev->ind_lock, flags);
+
+	dw_write_reg(dev, b, DW_IC_DI);
+	dw_write_reg(dev, cmd, DW_IC_CTL);
+
+	while ((dw_read_reg(dev, DW_IC_CTL) & DW_IC_CTL_GO) && ok--);
+
+	spin_unlock_irqrestore(&dev->ind_lock, flags);
+
+	if (!ok)
+		dev_err(dev->dev, "Register 0x%02x write timedout\n", offset);
+}
+
 u32 dw_readl(struct dw_i2c_dev *dev, int offset)
 {
 	u32 value;
 
-	if (dev->flags & ACCESS_16BIT)
-		value = readw_relaxed(dev->base + offset) |
-			(readw_relaxed(dev->base + offset + 2) << 16);
+	if (dev->flags & ACCESS_INDIRECT)
+		value = dw_read_ind(dev, offset);
 	else
-		value = readl_relaxed(dev->base + offset);
+		value = dw_read_reg(dev, offset);
 
 	if (dev->flags & ACCESS_SWAP)
 		return swab32(value);
@@ -74,12 +135,10 @@ void dw_writel(struct dw_i2c_dev *dev, u32 b, int offset)
 	if (dev->flags & ACCESS_SWAP)
 		b = swab32(b);
 
-	if (dev->flags & ACCESS_16BIT) {
-		writew_relaxed((u16)b, dev->base + offset);
-		writew_relaxed((u16)(b >> 16), dev->base + offset + 2);
-	} else {
-		writel_relaxed(b, dev->base + offset);
-	}
+	if (dev->flags & ACCESS_INDIRECT)
+		dw_write_ind(dev, b, offset);
+	else
+		dw_write_reg(dev, b, offset);
 }
 
 /**
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b220ad64c38d..0857b3842283 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -170,11 +170,23 @@
 					 DW_IC_TX_ABRT_TXDATA_NOACK | \
 					 DW_IC_TX_ABRT_GCALL_NOACK)
 
+/*
+ * Access registers for the IC space described above.
+ */
+#define DW_IC_CTL		0x0
+#define DW_IC_DI		0x4
+#define DW_IC_DO		0x8
+#define DW_IC_IND_RETRY		100
+
+#define DW_IC_CTL_GO		BIT(31)
+#define DW_IC_CTL_WR		BIT(8)
+#define DW_IC_CTL_ADDR_MASK	GENMASK(7, 0)
 
 /**
  * struct dw_i2c_dev - private i2c-designware data
  * @dev: driver model device node
  * @base: IO registers pointer
+ * @ind_lock: Spin-lock for indirectly accesible registers
  * @cmd_complete: tx completion indicator
  * @clk: input reference clock
  * @pclk: clock required to access the registers
@@ -226,6 +238,7 @@ struct dw_i2c_dev {
 	struct device		*dev;
 	void __iomem		*base;
 	void __iomem		*ext;
+	spinlock_t		ind_lock;
 	struct completion	cmd_complete;
 	struct clk		*clk;
 	struct clk		*pclk;
@@ -280,6 +293,7 @@ struct dw_i2c_dev {
 #define ACCESS_16BIT		0x00000002
 #define ACCESS_INTR_MASK	0x00000004
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
+#define ACCESS_INDIRECT		0x00000010
 
 #define MODEL_CHERRYTRAIL	0x00000100
 #define MODEL_MSCC_OCELOT	0x00000200
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 05da900cf375..59365dd4dc66 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -684,6 +684,7 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	unsigned long irq_flags;
 	int ret;
 
+	spin_lock_init(&dev->ind_lock);
 	init_completion(&dev->cmd_complete);
 
 	dev->init = i2c_dw_init_master;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index cb494273bb60..683c456c4e1c 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -176,6 +176,7 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "be,bt1-i2c", .data = (void *)ACCESS_INDIRECT },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 0fc3aa31d46a..a6e65dcc693b 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -246,6 +246,7 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	struct i2c_adapter *adap = &dev->adapter;
 	int ret;
 
+	spin_lock_init(&dev->ind_lock);
 	init_completion(&dev->cmd_complete);
 
 	dev->init = i2c_dw_init_slave;
-- 
2.25.1

