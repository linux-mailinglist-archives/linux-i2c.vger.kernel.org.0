Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30C11E31A7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390842AbgEZVz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:55:59 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60004 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390187AbgEZVz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 352B58030834;
        Tue, 26 May 2020 21:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9WdY5lw-0mM1; Wed, 27 May 2020 00:55:42 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 09/12] i2c: designware: Convert driver to using regmap API
Date:   Wed, 27 May 2020 00:55:25 +0300
Message-ID: <20200526215528.16417-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Seeing the DW I2C driver is using flags-based accessors with two
conditional clauses it would be better to replace them with the regmap
API IO methods and to initialize the regmap object with read/write
callbacks specific to the controller registers map implementation. This
will be also handy for the drivers with non-standard registers mapping
(like an embedded into the Baikal-T1 System Controller DW I2C block, which
glue-driver is a part of this series).

As before the driver tries to detect the mapping setup at probe stage and
creates a regmap object accordingly, which will be used by the rest of the
code to correctly access the controller registers. In two places it was
appropriate to convert the hand-written read-modify-write and
read-poll-loop design patterns to the corresponding regmap API
ready-to-use methods.

Note the regmap IO methods return value is checked only at the probe
stage. The rest of the code won't do this because basically we have
MMIO-based regmap so non of the read/write methods can fail (this also
won't be needed for the Baikal-T1-specific I2C controller).

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 drivers/i2c/busses/Kconfig                 |   1 +
 drivers/i2c/busses/i2c-designware-common.c | 178 +++++++++++++++------
 drivers/i2c/busses/i2c-designware-core.h   |  18 +--
 drivers/i2c/busses/i2c-designware-master.c | 125 ++++++++-------
 drivers/i2c/busses/i2c-designware-slave.c  |  77 ++++-----
 5 files changed, 246 insertions(+), 153 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 4e1997642e73..adaaf5679266 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -526,6 +526,7 @@ config I2C_DAVINCI
 
 config I2C_DESIGNWARE_CORE
 	tristate
+	select REGMAP
 
 config I2C_DESIGNWARE_PLATFORM
 	tristate "Synopsys DesignWare Platform"
diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index c70c6fc09ee3..141ea0651a8f 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/regmap.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -53,66 +54,123 @@ static char *abort_sources[] = {
 		"incorrect slave-transmitter mode configuration",
 };
 
-u32 dw_readl(struct dw_i2c_dev *dev, int offset)
+static int dw_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
-	u32 value;
+	struct dw_i2c_dev *dev = context;
 
-	if (dev->flags & ACCESS_16BIT)
-		value = readw_relaxed(dev->base + offset) |
-			(readw_relaxed(dev->base + offset + 2) << 16);
-	else
-		value = readl_relaxed(dev->base + offset);
+	*val = readl_relaxed(dev->base + reg);
 
-	if (dev->flags & ACCESS_SWAP)
-		return swab32(value);
-	else
-		return value;
+	return 0;
 }
 
-void dw_writel(struct dw_i2c_dev *dev, u32 b, int offset)
+static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
 {
-	if (dev->flags & ACCESS_SWAP)
-		b = swab32(b);
-
-	if (dev->flags & ACCESS_16BIT) {
-		writew_relaxed((u16)b, dev->base + offset);
-		writew_relaxed((u16)(b >> 16), dev->base + offset + 2);
-	} else {
-		writel_relaxed(b, dev->base + offset);
-	}
+	struct dw_i2c_dev *dev = context;
+
+	writel_relaxed(val, dev->base + reg);
+
+	return 0;
+}
+
+static int dw_reg_read_swab(void *context, unsigned int reg, unsigned int *val)
+{
+	struct dw_i2c_dev *dev = context;
+
+	*val = swab32(readl_relaxed(dev->base + reg));
+
+	return 0;
+}
+
+static int dw_reg_write_swab(void *context, unsigned int reg, unsigned int val)
+{
+	struct dw_i2c_dev *dev = context;
+
+	writel_relaxed(swab32(val), dev->base + reg);
+
+	return 0;
+}
+
+static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
+{
+	struct dw_i2c_dev *dev = context;
+
+	*val = readw_relaxed(dev->base + reg) |
+		(readw_relaxed(dev->base + reg + 2) << 16);
+
+	return 0;
+}
+
+static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
+{
+	struct dw_i2c_dev *dev = context;
+
+	writew_relaxed((u16)val, dev->base + reg);
+	writew_relaxed((u16)(val >> 16), dev->base + reg + 2);
+
+	return 0;
 }
 
 /**
- * i2c_dw_set_reg_access() - Set register access flags
+ * i2c_dw_init_regmap() - Initialize registers map
  * @dev: device private data
+ * @base: Registers map base address
  *
- * Autodetects needed register access mode and sets access flags accordingly.
- * This must be called before doing any other register access.
+ * Autodetects needed register access mode and creates the regmap with
+ * corresponding read/write callbacks. This must be called before doing any
+ * other register access.
  */
-int i2c_dw_set_reg_access(struct dw_i2c_dev *dev)
+int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 {
+	struct regmap_config map_cfg = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.disable_locking = true,
+		.reg_read = dw_reg_read,
+		.reg_write = dw_reg_write,
+		.max_register = DW_IC_COMP_TYPE
+	};
 	u32 reg;
 	int ret;
 
+	/*
+	 * Skip detecting the registers map configuration if the regmap has
+	 * already been provided by a higher code.
+	 */
+	if (dev->map)
+		return 0;
+
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
 		return ret;
 
-	reg = dw_readl(dev, DW_IC_COMP_TYPE);
+	reg = readl(dev->base + DW_IC_COMP_TYPE);
 	i2c_dw_release_lock(dev);
 
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
-		/* Configure register endianness access */
-		dev->flags |= ACCESS_SWAP;
+		map_cfg.reg_read = dw_reg_read_swab;
+		map_cfg.reg_write = dw_reg_write_swab;
 	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
-		/* Configure register access mode 16bit */
-		dev->flags |= ACCESS_16BIT;
+		map_cfg.reg_read = dw_reg_read_word;
+		map_cfg.reg_write = dw_reg_write_word;
 	} else if (reg != DW_IC_COMP_TYPE_VALUE) {
 		dev_err(dev->dev,
 			"Unknown Synopsys component type: 0x%08x\n", reg);
 		return -ENODEV;
 	}
 
+	/*
+	 * Note we'll check the return value of the regmap IO accessors only
+	 * at the probe stage. The rest of the code won't do this because
+	 * basically we have MMIO-based regmap so non of the read/write methods
+	 * can fail.
+	 */
+	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
+	if (IS_ERR(dev->map)) {
+		dev_err(dev->dev, "Failed to init the registers map\n");
+		return PTR_ERR(dev->map);
+	}
+
 	return 0;
 }
 
@@ -181,11 +239,17 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 		return ret;
 
 	/* Configure SDA Hold Time if required */
-	reg = dw_readl(dev, DW_IC_COMP_VERSION);
+	ret = regmap_read(dev->map, DW_IC_COMP_VERSION, &reg);
+	if (ret)
+		goto err_release_lock;
+
 	if (reg >= DW_IC_SDA_HOLD_MIN_VERS) {
 		if (!dev->sda_hold_time) {
 			/* Keep previous hold time setting if no one set it */
-			dev->sda_hold_time = dw_readl(dev, DW_IC_SDA_HOLD);
+			ret = regmap_read(dev->map, DW_IC_SDA_HOLD,
+					  &dev->sda_hold_time);
+			if (ret)
+				goto err_release_lock;
 		}
 
 		/*
@@ -209,14 +273,16 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 		dev->sda_hold_time = 0;
 	}
 
+err_release_lock:
 	i2c_dw_release_lock(dev);
 
-	return 0;
+	return ret;
 }
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
 	int timeout = 100;
+	u32 status;
 
 	do {
 		__i2c_dw_disable_nowait(dev);
@@ -224,7 +290,8 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * The enable status register may be unimplemented, but
 		 * in that case this test reads zero and exits the loop.
 		 */
-		if ((dw_readl(dev, DW_IC_ENABLE_STATUS) & 1) == 0)
+		regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
+		if ((status & 1) == 0)
 			return;
 
 		/*
@@ -303,22 +370,23 @@ void i2c_dw_release_lock(struct dw_i2c_dev *dev)
  */
 int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 {
-	int timeout = TIMEOUT;
+	u32 status;
+	int ret;
 
-	while (dw_readl(dev, DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY) {
-		if (timeout <= 0) {
-			dev_warn(dev->dev, "timeout waiting for bus ready\n");
-			i2c_recover_bus(&dev->adapter);
+	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+				       !(status & DW_IC_STATUS_ACTIVITY),
+				       1100, 20000);
+	if (ret) {
+		dev_warn(dev->dev, "timeout waiting for bus ready\n");
 
-			if (dw_readl(dev, DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY)
-				return -ETIMEDOUT;
-			return 0;
-		}
-		timeout--;
-		usleep_range(1000, 1100);
+		i2c_recover_bus(&dev->adapter);
+
+		regmap_read(dev->map, DW_IC_STATUS, &status);
+		if (!(status & DW_IC_STATUS_ACTIVITY))
+			ret = 0;
 	}
 
-	return 0;
+	return ret;
 }
 
 int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
@@ -344,15 +412,19 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 		return -EIO;
 }
 
-void i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
+int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 {
 	u32 param, tx_fifo_depth, rx_fifo_depth;
+	int ret;
 
 	/*
 	 * Try to detect the FIFO depth if not set by interface driver,
 	 * the depth could be from 2 to 256 from HW spec.
 	 */
-	param = dw_readl(dev, DW_IC_COMP_PARAM_1);
+	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
+	if (ret)
+		return ret;
+
 	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
 	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
 	if (!dev->tx_fifo_depth) {
@@ -364,6 +436,8 @@ void i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 		dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
 				rx_fifo_depth);
 	}
+
+	return 0;
 }
 
 u32 i2c_dw_func(struct i2c_adapter *adap)
@@ -375,17 +449,19 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
 
 void i2c_dw_disable(struct dw_i2c_dev *dev)
 {
+	u32 dummy;
+
 	/* Disable controller */
 	__i2c_dw_disable(dev);
 
 	/* Disable all interrupts */
-	dw_writel(dev, 0, DW_IC_INTR_MASK);
-	dw_readl(dev, DW_IC_CLR_INTR);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
 }
 
 void i2c_dw_disable_int(struct dw_i2c_dev *dev)
 {
-	dw_writel(dev, 0, DW_IC_INTR_MASK);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 }
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index e036e7268d3b..4a54ec1ce6e3 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -10,6 +10,7 @@
  */
 
 #include <linux/i2c.h>
+#include <linux/regmap.h>
 
 #define DW_IC_DEFAULT_FUNCTIONALITY (I2C_FUNC_I2C |			\
 					I2C_FUNC_SMBUS_BYTE |		\
@@ -120,8 +121,6 @@
 #define STATUS_WRITE_IN_PROGRESS	0x1
 #define STATUS_READ_IN_PROGRESS		0x2
 
-#define TIMEOUT			20 /* ms */
-
 /*
  * operation modes
  */
@@ -174,7 +173,9 @@
 /**
  * struct dw_i2c_dev - private i2c-designware data
  * @dev: driver model device node
+ * @map: IO registers map
  * @base: IO registers pointer
+ * @ext: Extended IO registers pointer
  * @cmd_complete: tx completion indicator
  * @clk: input reference clock
  * @pclk: clock required to access the registers
@@ -224,6 +225,7 @@
  */
 struct dw_i2c_dev {
 	struct device		*dev;
+	struct regmap		*map;
 	void __iomem		*base;
 	void __iomem		*ext;
 	struct completion	cmd_complete;
@@ -276,17 +278,13 @@ struct dw_i2c_dev {
 	bool			suspended;
 };
 
-#define ACCESS_SWAP		0x00000001
-#define ACCESS_16BIT		0x00000002
 #define ACCESS_INTR_MASK	0x00000004
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
 
 #define MODEL_MSCC_OCELOT	0x00000100
 #define MODEL_MASK		0x00000f00
 
-u32 dw_readl(struct dw_i2c_dev *dev, int offset);
-void dw_writel(struct dw_i2c_dev *dev, u32 b, int offset);
-int i2c_dw_set_reg_access(struct dw_i2c_dev *dev);
+int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
@@ -296,19 +294,19 @@ int i2c_dw_acquire_lock(struct dw_i2c_dev *dev);
 void i2c_dw_release_lock(struct dw_i2c_dev *dev);
 int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev);
 int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
-void i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
+int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
 void i2c_dw_disable(struct dw_i2c_dev *dev);
 void i2c_dw_disable_int(struct dw_i2c_dev *dev);
 
 static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
 {
-	dw_writel(dev, 1, DW_IC_ENABLE);
+	regmap_write(dev->map, DW_IC_ENABLE, 1);
 }
 
 static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 {
-	dw_writel(dev, 0, DW_IC_ENABLE);
+	regmap_write(dev->map, DW_IC_ENABLE, 0);
 }
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 3a58eef20936..f78cb0d08b4b 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/regmap.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -25,11 +26,11 @@
 static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 {
 	/* Configure Tx/Rx FIFO threshold levels */
-	dw_writel(dev, dev->tx_fifo_depth / 2, DW_IC_TX_TL);
-	dw_writel(dev, 0, DW_IC_RX_TL);
+	regmap_write(dev->map, DW_IC_TX_TL, dev->tx_fifo_depth / 2);
+	regmap_write(dev->map, DW_IC_RX_TL, 0);
 
 	/* Configure the I2C master */
-	dw_writel(dev, dev->master_cfg, DW_IC_CON);
+	regmap_write(dev->map, DW_IC_CON, dev->master_cfg);
 }
 
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
@@ -44,8 +45,11 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
 		return ret;
-	comp_param1 = dw_readl(dev, DW_IC_COMP_PARAM_1);
+
+	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &comp_param1);
 	i2c_dw_release_lock(dev);
+	if (ret)
+		return ret;
 
 	/* Set standard and fast speed dividers for high/low periods */
 	sda_falling_time = t->sda_fall_ns ?: 300; /* ns */
@@ -162,22 +166,22 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 	__i2c_dw_disable(dev);
 
 	/* Write standard speed timing parameters */
-	dw_writel(dev, dev->ss_hcnt, DW_IC_SS_SCL_HCNT);
-	dw_writel(dev, dev->ss_lcnt, DW_IC_SS_SCL_LCNT);
+	regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
+	regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
 
 	/* Write fast mode/fast mode plus timing parameters */
-	dw_writel(dev, dev->fs_hcnt, DW_IC_FS_SCL_HCNT);
-	dw_writel(dev, dev->fs_lcnt, DW_IC_FS_SCL_LCNT);
+	regmap_write(dev->map, DW_IC_FS_SCL_HCNT, dev->fs_hcnt);
+	regmap_write(dev->map, DW_IC_FS_SCL_LCNT, dev->fs_lcnt);
 
 	/* Write high speed timing parameters if supported */
 	if (dev->hs_hcnt && dev->hs_lcnt) {
-		dw_writel(dev, dev->hs_hcnt, DW_IC_HS_SCL_HCNT);
-		dw_writel(dev, dev->hs_lcnt, DW_IC_HS_SCL_LCNT);
+		regmap_write(dev->map, DW_IC_HS_SCL_HCNT, dev->hs_hcnt);
+		regmap_write(dev->map, DW_IC_HS_SCL_LCNT, dev->hs_lcnt);
 	}
 
 	/* Write SDA hold time if supported */
 	if (dev->sda_hold_time)
-		dw_writel(dev, dev->sda_hold_time, DW_IC_SDA_HOLD);
+		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
 
 	i2c_dw_configure_fifo_master(dev);
 	i2c_dw_release_lock(dev);
@@ -188,15 +192,15 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 {
 	struct i2c_msg *msgs = dev->msgs;
-	u32 ic_con, ic_tar = 0;
+	u32 ic_con = 0, ic_tar = 0;
+	u32 dummy;
 
 	/* Disable the adapter */
 	__i2c_dw_disable(dev);
 
 	/* If the slave address is ten bit address, enable 10BITADDR */
-	ic_con = dw_readl(dev, DW_IC_CON);
 	if (msgs[dev->msg_write_idx].flags & I2C_M_TEN) {
-		ic_con |= DW_IC_CON_10BITADDR_MASTER;
+		ic_con = DW_IC_CON_10BITADDR_MASTER;
 		/*
 		 * If I2C_DYNAMIC_TAR_UPDATE is set, the 10-bit addressing
 		 * mode has to be enabled via bit 12 of IC_TAR register.
@@ -204,17 +208,17 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 		 * detected from registers.
 		 */
 		ic_tar = DW_IC_TAR_10BITADDR_MASTER;
-	} else {
-		ic_con &= ~DW_IC_CON_10BITADDR_MASTER;
 	}
 
-	dw_writel(dev, ic_con, DW_IC_CON);
+	regmap_update_bits(dev->map, DW_IC_CON, DW_IC_CON_10BITADDR_MASTER,
+			   ic_con);
 
 	/*
 	 * Set the slave (target) address and enable 10-bit addressing mode
 	 * if applicable.
 	 */
-	dw_writel(dev, msgs[dev->msg_write_idx].addr | ic_tar, DW_IC_TAR);
+	regmap_write(dev->map, DW_IC_TAR,
+		     msgs[dev->msg_write_idx].addr | ic_tar);
 
 	/* Enforce disabled interrupts (due to HW issues) */
 	i2c_dw_disable_int(dev);
@@ -223,11 +227,11 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	__i2c_dw_enable(dev);
 
 	/* Dummy read to avoid the register getting stuck on Bay Trail */
-	dw_readl(dev, DW_IC_ENABLE_STATUS);
+	regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
 
 	/* Clear and enable interrupts */
-	dw_readl(dev, DW_IC_CLR_INTR);
-	dw_writel(dev, DW_IC_INTR_MASTER_MASK, DW_IC_INTR_MASK);
+	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
+	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
 }
 
 /*
@@ -246,6 +250,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	u32 buf_len = dev->tx_buf_len;
 	u8 *buf = dev->tx_buf;
 	bool need_restart = false;
+	unsigned int flr;
 
 	intr_mask = DW_IC_INTR_MASTER_MASK;
 
@@ -278,8 +283,11 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 				need_restart = true;
 		}
 
-		tx_limit = dev->tx_fifo_depth - dw_readl(dev, DW_IC_TXFLR);
-		rx_limit = dev->rx_fifo_depth - dw_readl(dev, DW_IC_RXFLR);
+		regmap_read(dev->map, DW_IC_TXFLR, &flr);
+		tx_limit = dev->tx_fifo_depth - flr;
+
+		regmap_read(dev->map, DW_IC_RXFLR, &flr);
+		rx_limit = dev->rx_fifo_depth - flr;
 
 		while (buf_len > 0 && tx_limit > 0 && rx_limit > 0) {
 			u32 cmd = 0;
@@ -312,11 +320,14 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 				if (dev->rx_outstanding >= dev->rx_fifo_depth)
 					break;
 
-				dw_writel(dev, cmd | 0x100, DW_IC_DATA_CMD);
+				regmap_write(dev->map, DW_IC_DATA_CMD,
+					     cmd | 0x100);
 				rx_limit--;
 				dev->rx_outstanding++;
-			} else
-				dw_writel(dev, cmd | *buf++, DW_IC_DATA_CMD);
+			} else {
+				regmap_write(dev->map, DW_IC_DATA_CMD,
+					     cmd | *buf++);
+			}
 			tx_limit--; buf_len--;
 		}
 
@@ -346,7 +357,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	if (dev->msg_err)
 		intr_mask = 0;
 
-	dw_writel(dev, intr_mask,  DW_IC_INTR_MASK);
+	regmap_write(dev->map,  DW_IC_INTR_MASK, intr_mask);
 }
 
 static u8
@@ -374,7 +385,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 	int rx_valid;
 
 	for (; dev->msg_read_idx < dev->msgs_num; dev->msg_read_idx++) {
-		u32 len;
+		u32 len, tmp;
 		u8 *buf;
 
 		if (!(msgs[dev->msg_read_idx].flags & I2C_M_RD))
@@ -388,18 +399,18 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			buf = dev->rx_buf;
 		}
 
-		rx_valid = dw_readl(dev, DW_IC_RXFLR);
+		regmap_read(dev->map, DW_IC_RXFLR, &rx_valid);
 
 		for (; len > 0 && rx_valid > 0; len--, rx_valid--) {
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
-			*buf = dw_readl(dev, DW_IC_DATA_CMD);
+			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN &&
-				*buf <= I2C_SMBUS_BLOCK_MAX && *buf > 0) {
-				len = i2c_dw_recv_len(dev, *buf);
+			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
+				len = i2c_dw_recv_len(dev, tmp);
 			}
-			buf++;
+			*buf++ = tmp;
 			dev->rx_outstanding--;
 		}
 
@@ -517,7 +528,7 @@ static const struct i2c_adapter_quirks i2c_dw_quirks = {
 
 static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 {
-	u32 stat;
+	u32 stat, dummy;
 
 	/*
 	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
@@ -525,47 +536,47 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 	 * in the IC_RAW_INTR_STAT register.
 	 *
 	 * That is,
-	 *   stat = dw_readl(IC_INTR_STAT);
+	 *   stat = readl(IC_INTR_STAT);
 	 * equals to,
-	 *   stat = dw_readl(IC_RAW_INTR_STAT) & dw_readl(IC_INTR_MASK);
+	 *   stat = readl(IC_RAW_INTR_STAT) & readl(IC_INTR_MASK);
 	 *
 	 * The raw version might be useful for debugging purposes.
 	 */
-	stat = dw_readl(dev, DW_IC_INTR_STAT);
+	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
 
 	/*
 	 * Do not use the IC_CLR_INTR register to clear interrupts, or
 	 * you'll miss some interrupts, triggered during the period from
-	 * dw_readl(IC_INTR_STAT) to dw_readl(IC_CLR_INTR).
+	 * readl(IC_INTR_STAT) to readl(IC_CLR_INTR).
 	 *
 	 * Instead, use the separately-prepared IC_CLR_* registers.
 	 */
 	if (stat & DW_IC_INTR_RX_UNDER)
-		dw_readl(dev, DW_IC_CLR_RX_UNDER);
+		regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &dummy);
 	if (stat & DW_IC_INTR_RX_OVER)
-		dw_readl(dev, DW_IC_CLR_RX_OVER);
+		regmap_read(dev->map, DW_IC_CLR_RX_OVER, &dummy);
 	if (stat & DW_IC_INTR_TX_OVER)
-		dw_readl(dev, DW_IC_CLR_TX_OVER);
+		regmap_read(dev->map, DW_IC_CLR_TX_OVER, &dummy);
 	if (stat & DW_IC_INTR_RD_REQ)
-		dw_readl(dev, DW_IC_CLR_RD_REQ);
+		regmap_read(dev->map, DW_IC_CLR_RD_REQ, &dummy);
 	if (stat & DW_IC_INTR_TX_ABRT) {
 		/*
 		 * The IC_TX_ABRT_SOURCE register is cleared whenever
 		 * the IC_CLR_TX_ABRT is read.  Preserve it beforehand.
 		 */
-		dev->abort_source = dw_readl(dev, DW_IC_TX_ABRT_SOURCE);
-		dw_readl(dev, DW_IC_CLR_TX_ABRT);
+		regmap_read(dev->map, DW_IC_TX_ABRT_SOURCE, &dev->abort_source);
+		regmap_read(dev->map, DW_IC_CLR_TX_ABRT, &dummy);
 	}
 	if (stat & DW_IC_INTR_RX_DONE)
-		dw_readl(dev, DW_IC_CLR_RX_DONE);
+		regmap_read(dev->map, DW_IC_CLR_RX_DONE, &dummy);
 	if (stat & DW_IC_INTR_ACTIVITY)
-		dw_readl(dev, DW_IC_CLR_ACTIVITY);
+		regmap_read(dev->map, DW_IC_CLR_ACTIVITY, &dummy);
 	if (stat & DW_IC_INTR_STOP_DET)
-		dw_readl(dev, DW_IC_CLR_STOP_DET);
+		regmap_read(dev->map, DW_IC_CLR_STOP_DET, &dummy);
 	if (stat & DW_IC_INTR_START_DET)
-		dw_readl(dev, DW_IC_CLR_START_DET);
+		regmap_read(dev->map, DW_IC_CLR_START_DET, &dummy);
 	if (stat & DW_IC_INTR_GEN_CALL)
-		dw_readl(dev, DW_IC_CLR_GEN_CALL);
+		regmap_read(dev->map, DW_IC_CLR_GEN_CALL, &dummy);
 
 	return stat;
 }
@@ -587,7 +598,7 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 		 * Anytime TX_ABRT is set, the contents of the tx/rx
 		 * buffers are flushed. Make sure to skip them.
 		 */
-		dw_writel(dev, 0, DW_IC_INTR_MASK);
+		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 		goto tx_aborted;
 	}
 
@@ -608,9 +619,9 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 		complete(&dev->cmd_complete);
 	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
 		/* Workaround to trigger pending interrupt */
-		stat = dw_readl(dev, DW_IC_INTR_MASK);
+		regmap_read(dev->map, DW_IC_INTR_MASK, &stat);
 		i2c_dw_disable_int(dev);
-		dw_writel(dev, stat, DW_IC_INTR_MASK);
+		regmap_write(dev->map, DW_IC_INTR_MASK, stat);
 	}
 
 	return 0;
@@ -621,8 +632,8 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 	struct dw_i2c_dev *dev = dev_id;
 	u32 stat, enabled;
 
-	enabled = dw_readl(dev, DW_IC_ENABLE);
-	stat = dw_readl(dev, DW_IC_RAW_INTR_STAT);
+	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
 	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
 	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
 		return IRQ_NONE;
@@ -690,7 +701,7 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	dev->disable = i2c_dw_disable;
 	dev->disable_int = i2c_dw_disable_int;
 
-	ret = i2c_dw_set_reg_access(dev);
+	ret = i2c_dw_init_regmap(dev);
 	if (ret)
 		return ret;
 
@@ -698,7 +709,9 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	i2c_dw_set_fifo_size(dev);
+	ret = i2c_dw_set_fifo_size(dev);
+	if (ret)
+		return ret;
 
 	ret = dev->init(dev);
 	if (ret)
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index f5ecf76c0d02..9f8aef7a69b2 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/regmap.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -20,12 +21,12 @@
 static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
 {
 	/* Configure Tx/Rx FIFO threshold levels. */
-	dw_writel(dev, 0, DW_IC_TX_TL);
-	dw_writel(dev, 0, DW_IC_RX_TL);
+	regmap_write(dev->map, DW_IC_TX_TL, 0);
+	regmap_write(dev->map, DW_IC_RX_TL, 0);
 
 	/* Configure the I2C slave. */
-	dw_writel(dev, dev->slave_cfg, DW_IC_CON);
-	dw_writel(dev, DW_IC_INTR_SLAVE_MASK, DW_IC_INTR_MASK);
+	regmap_write(dev->map, DW_IC_CON, dev->slave_cfg);
+	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_SLAVE_MASK);
 }
 
 /**
@@ -49,7 +50,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
 
 	/* Write SDA hold time if supported */
 	if (dev->sda_hold_time)
-		dw_writel(dev, dev->sda_hold_time, DW_IC_SDA_HOLD);
+		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
 
 	i2c_dw_configure_fifo_slave(dev);
 	i2c_dw_release_lock(dev);
@@ -72,7 +73,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
 	 * the address to which the DW_apb_i2c responds.
 	 */
 	__i2c_dw_disable_nowait(dev);
-	dw_writel(dev, slave->addr, DW_IC_SAR);
+	regmap_write(dev->map, DW_IC_SAR, slave->addr);
 	dev->slave = slave;
 
 	__i2c_dw_enable(dev);
@@ -103,7 +104,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 
 static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
 {
-	u32 stat;
+	u32 stat, dummy;
 
 	/*
 	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
@@ -111,39 +112,39 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
 	 * in the IC_RAW_INTR_STAT register.
 	 *
 	 * That is,
-	 *   stat = dw_readl(IC_INTR_STAT);
+	 *   stat = readl(IC_INTR_STAT);
 	 * equals to,
-	 *   stat = dw_readl(IC_RAW_INTR_STAT) & dw_readl(IC_INTR_MASK);
+	 *   stat = readl(IC_RAW_INTR_STAT) & readl(IC_INTR_MASK);
 	 *
 	 * The raw version might be useful for debugging purposes.
 	 */
-	stat = dw_readl(dev, DW_IC_INTR_STAT);
+	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
 
 	/*
 	 * Do not use the IC_CLR_INTR register to clear interrupts, or
 	 * you'll miss some interrupts, triggered during the period from
-	 * dw_readl(IC_INTR_STAT) to dw_readl(IC_CLR_INTR).
+	 * readl(IC_INTR_STAT) to readl(IC_CLR_INTR).
 	 *
 	 * Instead, use the separately-prepared IC_CLR_* registers.
 	 */
 	if (stat & DW_IC_INTR_TX_ABRT)
-		dw_readl(dev, DW_IC_CLR_TX_ABRT);
+		regmap_read(dev->map, DW_IC_CLR_TX_ABRT, &dummy);
 	if (stat & DW_IC_INTR_RX_UNDER)
-		dw_readl(dev, DW_IC_CLR_RX_UNDER);
+		regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &dummy);
 	if (stat & DW_IC_INTR_RX_OVER)
-		dw_readl(dev, DW_IC_CLR_RX_OVER);
+		regmap_read(dev->map, DW_IC_CLR_RX_OVER, &dummy);
 	if (stat & DW_IC_INTR_TX_OVER)
-		dw_readl(dev, DW_IC_CLR_TX_OVER);
+		regmap_read(dev->map, DW_IC_CLR_TX_OVER, &dummy);
 	if (stat & DW_IC_INTR_RX_DONE)
-		dw_readl(dev, DW_IC_CLR_RX_DONE);
+		regmap_read(dev->map, DW_IC_CLR_RX_DONE, &dummy);
 	if (stat & DW_IC_INTR_ACTIVITY)
-		dw_readl(dev, DW_IC_CLR_ACTIVITY);
+		regmap_read(dev->map, DW_IC_CLR_ACTIVITY, &dummy);
 	if (stat & DW_IC_INTR_STOP_DET)
-		dw_readl(dev, DW_IC_CLR_STOP_DET);
+		regmap_read(dev->map, DW_IC_CLR_STOP_DET, &dummy);
 	if (stat & DW_IC_INTR_START_DET)
-		dw_readl(dev, DW_IC_CLR_START_DET);
+		regmap_read(dev->map, DW_IC_CLR_START_DET, &dummy);
 	if (stat & DW_IC_INTR_GEN_CALL)
-		dw_readl(dev, DW_IC_CLR_GEN_CALL);
+		regmap_read(dev->map, DW_IC_CLR_GEN_CALL, &dummy);
 
 	return stat;
 }
@@ -155,14 +156,14 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
 
 static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 {
-	u32 raw_stat, stat, enabled;
-	u8 val, slave_activity;
+	u32 raw_stat, stat, enabled, tmp;
+	u8 val = 0, slave_activity;
 
-	stat = dw_readl(dev, DW_IC_INTR_STAT);
-	enabled = dw_readl(dev, DW_IC_ENABLE);
-	raw_stat = dw_readl(dev, DW_IC_RAW_INTR_STAT);
-	slave_activity = ((dw_readl(dev, DW_IC_STATUS) &
-		DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);
+	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
+	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
+	regmap_read(dev->map, DW_IC_STATUS, &tmp);
+	slave_activity = ((tmp & DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);
 
 	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
 		return 0;
@@ -177,7 +178,8 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	if (stat & DW_IC_INTR_RD_REQ) {
 		if (slave_activity) {
 			if (stat & DW_IC_INTR_RX_FULL) {
-				val = dw_readl(dev, DW_IC_DATA_CMD);
+				regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+				val = tmp;
 
 				if (!i2c_slave_event(dev->slave,
 						     I2C_SLAVE_WRITE_RECEIVED,
@@ -185,24 +187,24 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 					dev_vdbg(dev->dev, "Byte %X acked!",
 						 val);
 				}
-				dw_readl(dev, DW_IC_CLR_RD_REQ);
+				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
 				stat = i2c_dw_read_clear_intrbits_slave(dev);
 			} else {
-				dw_readl(dev, DW_IC_CLR_RD_REQ);
-				dw_readl(dev, DW_IC_CLR_RX_UNDER);
+				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
+				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
 				stat = i2c_dw_read_clear_intrbits_slave(dev);
 			}
 			if (!i2c_slave_event(dev->slave,
 					     I2C_SLAVE_READ_REQUESTED,
 					     &val))
-				dw_writel(dev, val, DW_IC_DATA_CMD);
+				regmap_write(dev->map, DW_IC_DATA_CMD, val);
 		}
 	}
 
 	if (stat & DW_IC_INTR_RX_DONE) {
 		if (!i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED,
 				     &val))
-			dw_readl(dev, DW_IC_CLR_RX_DONE);
+			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
 
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
 		stat = i2c_dw_read_clear_intrbits_slave(dev);
@@ -210,7 +212,8 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	}
 
 	if (stat & DW_IC_INTR_RX_FULL) {
-		val = dw_readl(dev, DW_IC_DATA_CMD);
+		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+		val = tmp;
 		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
 				     &val))
 			dev_vdbg(dev->dev, "Byte %X acked!", val);
@@ -252,7 +255,7 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	dev->disable = i2c_dw_disable;
 	dev->disable_int = i2c_dw_disable_int;
 
-	ret = i2c_dw_set_reg_access(dev);
+	ret = i2c_dw_init_regmap(dev);
 	if (ret)
 		return ret;
 
@@ -260,7 +263,9 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	i2c_dw_set_fifo_size(dev);
+	ret = i2c_dw_set_fifo_size(dev);
+	if (ret)
+		return ret;
 
 	ret = dev->init(dev);
 	if (ret)
-- 
2.26.2

