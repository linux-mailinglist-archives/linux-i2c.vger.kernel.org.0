Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040A271F985
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jun 2023 07:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbjFBFB1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jun 2023 01:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbjFBFBN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jun 2023 01:01:13 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813301B3
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jun 2023 22:01:09 -0700 (PDT)
X-ASG-Debug-ID: 1685682064-1eb14e2b4803910001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id k8YqqZNUpmGqDsvb (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 02 Jun 2023 13:01:04 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 2 Jun
 2023 13:01:04 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Jun 2023 13:01:03 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
Subject: [PATCH v3] i2c: add support for Zhaoxin I2C controller
Date:   Fri, 2 Jun 2023 13:01:03 +0800
X-ASG-Orig-Subj: [PATCH v3] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1685682064
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 20098
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109488
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Zhaoxin I2C controller driver. It provides the access to the i2c
busses, which connects to the touchpad, eeprom, etc.

Zhaoxin I2C controller has two separate busses, so may accommodate up
to two I2C adapters. Those adapters are listed in the ACPI namespace
with the "IIC1D17" HID, and probed by a platform driver.

The driver works with IRQ mode, and supports basic I2C features. Flags
I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
the unsupported access.

Change since v2:
  * fixed some code style issues
  * check if "timeout == 0" first, then check if event $condition is true
  * add warnning message for "timeout == 1"
  Link: https://lore.kernel.org/all/20230531110058.n7ubjp2kzlx7tuoc@intel.intel/

Change since v1:
  * remove some useless include files and sort the rest.
  * use mmio bar distinguish host index.
  * use pci-dev's name and i2c-dev's name rename adapter's name.
  * remove some debug code, fix some code style issue.
  Link: https://lore.kernel.org/all/20230504060043.13155-1-hanshu-oc@zhaoxin.com/

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-zhaoxin.c | 645 +++++++++++++++++++++++++++++++
 3 files changed, 656 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 87600b4aacb3..4c2d302184aa 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -333,6 +333,16 @@ config I2C_VIAPRO
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-viapro.
 
+config I2C_ZHAOXIN
+	tristate "ZHAOXIN I2C Interface"
+	depends on PCI && ACPI
+	help
+	  If you say yes to this option, support will be included for the
+	  ZHAOXIN I2C interface
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-zhaoxin.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index af56fe2c75c0..cc470ce470ca 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
+obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
new file mode 100644
index 000000000000..61807da9c170
--- /dev/null
+++ b/drivers/i2c/busses/i2c-zhaoxin.c
@@ -0,0 +1,645 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  i2c-zhaoxin-i2c.c - Zhaoxin I2C controller driver
+ *
+ *  Copyright(c) 2021 Shanghai Zhaoxin Semiconductor Corporation.
+ *                    All rights reserved.
+ *
+ *  CONTACTS:
+ *
+ *  Hans Hu             hanshu@zhaoxin.com
+ *  Cobe Chen           cobechen@zhaoxin.com
+ */
+
+#define DRIVER_VERSION "1.4.0"
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+
+#define ZX_I2C_NAME             "Zhaoxin-I2C"
+
+/*
+ * registers
+ */
+/* I2C MMIO Address Constants */
+#define IICCR_L                  0x00
+#define   MST_RST          BIT(7)
+#define   MST_RST_PATCH    BIT(6)
+#define   CPU_RDY          BIT(3)
+#define   TX_END           BIT(2)
+#define   RX_ACK           BIT(1)
+#define IICCR_H                  0x01
+#define   FIFO_EN          BIT(6)
+#define IICSLVADDR               0x02
+#define IICTCR                   0x03
+#define   FAST_SEL         BIT(7)
+#define   MASTER_RECV      BIT(6)
+#define   HS_SEL           BIT(5)
+#define IICSR                    0x04
+#define   SDA_I            BIT(3)
+#define   SCL_I            BIT(2)
+#define   READY            BIT(1)
+#define   RCV_NACK         BIT(0)
+#define IICISR                   0x06
+#define   IRQ_STS_BYTENACK BIT(5)
+#define   IRQ_STS_FIFONACK BIT(4)
+#define   IRQ_STS_FIFOEND  BIT(3)
+#define   IRQ_SCL_TIMEOUT  BIT(2)
+#define   IRQ_STS_BYTEEND  BIT(1)
+#define   IRQ_STS_ADDRNACK BIT(0)
+#define   IRQ_STS_MASK     GENMASK(3, 0)
+#define IICIMR                   0x08
+#define   IRQ_EN_FIFOEND   BIT(3)
+#define   IRQ_EN_TIMEOUT   BIT(2)
+#define   IRQ_EN_BYTEEND   BIT(1)
+#define   IRQ_EN_ADDRNACK  BIT(0)
+#define IICDATA2IIC              0x0A
+#define IICDATA2CPU              0x0B
+#define IICTR_FSTP               0x0C
+#define IICTR_SCLTP              0x0D
+#define IICMCR                   0x0E
+#define   DYCLK_EN         BIT(0)
+#define IIC_MST_CODE             0x0F
+#define IICCS                    0x10
+#define   CLKSEL_50M       BIT(0)
+#define IICREV                   0x11
+#define IICHCR                   0x12
+#define   FIFO_RST         GENMASK(1, 0)
+#define IICHTDR                  0x13
+#define IICHRDR                  0x14
+#define IICHTLR                  0x15
+#define IICHRLR                  0x16
+#define IICHWCNTR                0x18
+#define IICHRCNTR                0x19
+
+#define FIFO_SIZE       32
+#define ZXI2C_TIMEOUT   1000
+
+struct zxi2c {
+	/* controller resources information */
+	struct device *dev;
+	struct pci_dev *pci;
+	struct i2c_adapter adap;
+	void __iomem *regs;
+	u8 irq;
+	u8 hrv;
+	u32 speed;
+	u8 fstp;		/* freq control by BIOS */
+	u8 reset_bitmask;
+
+	/* process control information */
+	u8 event;
+	u16 byte_left;
+	wait_queue_head_t waitq;
+
+	/* processing msg information */
+	u8 addr;
+	u16 len;
+	bool is_read;
+	bool is_last_msg;
+	bool dynamic;
+};
+
+#define set_byte(r, d)           iowrite8(d, r + IICDATA2IIC)
+#define get_byte(r)              ioread8(r + IICDATA2CPU)
+#define is_ready(r)              (ioread8(r + IICSR) & READY)
+#define is_nack(r)               (ioread8(r + IICSR) & RCV_NACK)
+#define get_irq_status(r)        ioread8(r + IICISR)
+#define get_reversion(r)         ioread8(r + IICREV)
+#define clear_irq_status(r)      iowrite8(IRQ_STS_MASK, r + IICISR)
+#define set_fifo_byte(r, d)      iowrite8(d, r + IICHTDR)
+#define get_fifo_byte(r)         ioread8(r + IICHRDR)
+#define set_fifo_wr_len(r, d)    iowrite8(d, r + IICHTLR)
+#define set_fifo_rd_len(r, d)    iowrite8(d, r + IICHRLR)
+#define get_fifo_wr_cnt(r)       ioread8(r + IICHWCNTR)
+#define get_fifo_rd_cnt(r)       ioread8(r + IICHRCNTR)
+#define master_regs_reset(r)     iowrite8(MST_RST | 0x41, r + IICCR_L)
+#define set_dynamic_clock(r, d)  iowrite8(d, r + IICMCR)
+#define get_dynamic_clock(r)     (ioread8(r + IICMCR) & DYCLK_EN)
+#define stop_write_byte(r)       iowrite8(TX_END | 0x41, r + IICCR_L)
+#define get_fstp_value(r)        ioread8(r + IICTR_FSTP)
+#define enable_fifo_mode(r)      iowrite8(FIFO_EN, r + IICCR_H)
+#define enable_byte_mode(r)      iowrite8(0, r + IICCR_H)
+
+static inline void zxi2c_prepare_next_read(void __iomem *regs, u16 left)
+{
+	u8 tmp = ioread8(regs + IICCR_L);
+
+	if (left > 1)
+		tmp &= ~RX_ACK;
+	else
+		tmp |= RX_ACK;
+
+	iowrite8(tmp, regs + IICCR_L);
+}
+
+static inline void zxi2c_enable_irq(void __iomem *regs, u8 type, int enable)
+{
+	if (enable)
+		iowrite8(IRQ_EN_ADDRNACK | type, regs + IICIMR);
+	else
+		iowrite8(0, regs + IICIMR);
+}
+
+static inline void zxi2c_continue(struct zxi2c *i2c)
+{
+	u8 tmp;
+
+	i2c->event = 0;
+	tmp = ioread8(i2c->regs + IICCR_L);
+	iowrite8(tmp |= CPU_RDY, i2c->regs + IICCR_L);
+}
+
+static void zxi2c_reset_fifo(struct zxi2c *i2c)
+{
+	u8 tmp;
+	u8 count;
+	void __iomem *regs = i2c->regs;
+
+	tmp = ioread8(regs + IICHCR);
+	iowrite8(tmp | FIFO_RST, regs + IICHCR);
+	for (count = 0; count < 50; count++)
+		if (!(ioread8(regs + IICHCR) & FIFO_RST))
+			break;
+	if (count >= 50)
+		dev_warn(i2c->dev, "%s failed\n", __func__);
+}
+
+static void zxi2c_set_wr(void __iomem *regs, bool is_read)
+{
+	u8 tmp;
+
+	tmp = ioread8(regs + IICTCR);
+	if (is_read)
+		tmp |= MASTER_RECV;
+	else
+		tmp &= ~MASTER_RECV;
+	iowrite8(tmp, regs + IICTCR);
+}
+
+static void zxi2c_start(struct zxi2c *i2c)
+{
+	i2c->event = 0;
+	iowrite8(i2c->addr & 0x7f, i2c->regs + IICSLVADDR);
+}
+
+static const u32 speed_params_table[][3] = {
+	/* speed, IICTCR, IICTR_FSTP, IICCS, IICTR_SCLTP */
+	{I2C_MAX_STANDARD_MODE_FREQ, 0, 0xF3},
+	{I2C_MAX_FAST_MODE_FREQ, FAST_SEL, 0x38},
+	{I2C_MAX_FAST_MODE_PLUS_FREQ, FAST_SEL, 0x13},
+	{I2C_MAX_HIGH_SPEED_MODE_FREQ, HS_SEL, 0x37},
+};
+
+static void zxi2c_set_bus_speed(struct zxi2c *i2c)
+{
+	u8 i, count;
+	const u32 *params = NULL;
+
+	count = ARRAY_SIZE(speed_params_table);
+	for (i = 0; i < count; i++) {
+		if (speed_params_table[i][0] == i2c->speed) {
+			params = speed_params_table[i];
+			break;
+		}
+	}
+
+	iowrite8(params[1], i2c->regs + IICTCR);
+	if (abs(i2c->fstp - params[2]) > 0x10) {
+		/* if BIOS setting value far from golden value,
+		 * use golden value and warn user
+		 */
+		dev_warn_once(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
+				i2c->speed, i2c->fstp, params[2]);
+		iowrite8(params[2], i2c->regs + IICTR_FSTP);
+	} else {
+		iowrite8(i2c->fstp, i2c->regs + IICTR_FSTP);
+	}
+
+	iowrite8(CLKSEL_50M, i2c->regs + IICCS);
+	iowrite8(0xff, i2c->regs + IICTR_SCLTP);
+
+	/* for Hs-mode, use 0000 1000 as master code */
+	if (i2c->speed == I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		iowrite8(0x08, i2c->regs + IIC_MST_CODE);
+}
+
+static void zxi2c_get_bus_speed(struct zxi2c *i2c)
+{
+	u8 i, count;
+	u32 acpi_speed = i2c_acpi_find_bus_speed(i2c->dev);
+
+	count = ARRAY_SIZE(speed_params_table);
+	for (i = 0; i < count; i++)
+		if (acpi_speed == speed_params_table[i][0])
+			break;
+
+	/* if not found, use 400k as default */
+	i2c->speed = i < count ? acpi_speed : I2C_MAX_FAST_MODE_FREQ;
+
+	dev_info(i2c->dev, "speed mode is %s\n",
+			i2c_freq_mode_string(i2c->speed));
+}
+
+static void zxi2c_module_reset(struct zxi2c *i2c)
+{
+	u8 tmp;
+	u8 bitmask = i2c->reset_bitmask;
+
+	pci_read_config_byte(i2c->pci, 0x4F, &tmp);
+	pci_write_config_byte(i2c->pci, 0x4F, tmp & ~bitmask);
+	usleep_range(3000, 5000);
+	pci_write_config_byte(i2c->pci, 0x4F, tmp | bitmask);
+	usleep_range(3000, 5000);
+
+	set_dynamic_clock(i2c->regs, i2c->dynamic);
+}
+
+static irqreturn_t zxi2c_irq_handle(int irq, void *dev_id)
+{
+	struct zxi2c *i2c = (struct zxi2c *)dev_id;
+	void __iomem *regs = i2c->regs;
+	u8 status = get_irq_status(regs);
+
+	if ((status & IRQ_STS_MASK) == 0)
+		return IRQ_NONE;
+
+	if (status & IRQ_SCL_TIMEOUT)
+		dev_warn(i2c->dev, "timeout(HW), ID: 0x%X\n", i2c->addr);
+
+	if (status & IRQ_STS_ADDRNACK) {
+		dev_dbg(i2c->dev, "addr NACK, ID: 0x%X\n", i2c->addr);
+	} else if (status & IRQ_STS_BYTEEND) {
+		i2c->byte_left--;
+		if (!i2c->is_read) {
+			if (is_nack(regs)) {
+				status = IRQ_STS_BYTENACK;
+				i2c->byte_left++;
+				dev_err(i2c->dev, "data NACK, ID: 0x%X\n",
+					i2c->addr);
+			} else if (i2c->byte_left == 0 && i2c->is_last_msg) {
+				stop_write_byte(regs);
+			}
+		}
+	}
+
+	i2c->event = status;
+	clear_irq_status(regs);
+	wake_up(&i2c->waitq);
+
+	return IRQ_HANDLED;
+}
+
+static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
+{
+	int timeout;
+
+	timeout = wait_event_interruptible_timeout(i2c->waitq,
+			i2c->event != 0,
+			msecs_to_jiffies(ZXI2C_TIMEOUT));
+
+	if (timeout == 0) {
+		dev_err(i2c->dev, "timeout(SW), ID: 0x%X\n", i2c->addr);
+		/* Clock streching timeout, do recovery */
+		if (!is_nack(i2c->regs))
+			dev_err(i2c->dev, "device hang? reset, ID: 0x%X\n",
+				i2c->addr);
+
+		master_regs_reset(i2c->regs);
+		zxi2c_set_bus_speed(i2c);
+
+		return -EIO;
+	}
+
+	if (i2c->event & event) {
+		if (timeout == 1)
+			dev_warn(i2c->dev, "thread may be blocked\n");
+		return 0;
+	}
+
+	return -EIO;
+}
+
+static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
+{
+	u16 i, finished;
+	u8 index;
+	int ret = 0;
+	struct i2c_msg *msg;
+	void __iomem *regs = i2c->regs;
+
+	clear_irq_status(regs);
+	enable_byte_mode(regs);
+	zxi2c_enable_irq(regs, IRQ_EN_BYTEEND, true);
+
+	for (index = 0; index < num; index++) {
+		int error;
+
+		msg = msgs + index;
+		i2c->addr = msg->addr;
+		i2c->is_read = !!(msg->flags & I2C_M_RD);
+		i2c->byte_left = i2c->len = msg->len;
+
+		zxi2c_set_wr(regs, i2c->is_read);
+		if (i2c->is_read) {
+			zxi2c_prepare_next_read(regs, i2c->byte_left);
+			zxi2c_start(i2c);
+			/* create restart for non-first msg */
+			if (index)
+				zxi2c_continue(i2c);
+
+			for (i = 1; i <= msg->len; i++) {
+				error = zxi2c_wait_event(i2c, IRQ_STS_BYTEEND);
+				if (error)
+					break;
+
+				msg->buf[i - 1] = get_byte(regs);
+				if (i2c->byte_left == 0)
+					break;
+
+				zxi2c_prepare_next_read(regs, i2c->byte_left);
+				zxi2c_continue(i2c);
+			}
+		} else {
+			set_byte(regs, msg->buf[0]);
+			/* mark whether this is the last msg */
+			i2c->is_last_msg = index == !!(num - 1);
+			zxi2c_start(i2c);
+			/* create restart for non-first msg */
+			if (index)
+				zxi2c_continue(i2c);
+
+			for (i = 1; i <= msg->len; i++) {
+				error = zxi2c_wait_event(i2c, IRQ_STS_BYTEEND);
+				if (error)
+					break;
+
+				if (i2c->byte_left == 0)
+					break;
+				set_byte(regs, msg->buf[i]);
+				zxi2c_continue(i2c);
+			}
+		}
+
+		if (error) {
+			/* check if NACK during transmitting */
+			finished = msg->len - i2c->byte_left;
+			if (finished)
+				dev_err(i2c->dev,
+					"%s: %s finished %d bytes: %*ph\n",
+					__func__,
+					i2c->is_read ? "read" : "write",
+					finished, finished, msg->buf);
+			return error;
+		}
+		ret++;
+	}
+
+	zxi2c_enable_irq(regs, IRQ_EN_BYTEEND, false);
+	return ret;
+}
+
+static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msgs)
+{
+	void __iomem *regs = i2c->regs;
+	struct i2c_msg *msg = msgs;
+	int i;
+	u8 finished;
+
+	i2c->addr = msg->addr;
+	i2c->is_read = !!(msg->flags & I2C_M_RD);
+	i2c->len = msg->len;
+
+	zxi2c_reset_fifo(i2c);
+	enable_fifo_mode(regs);
+
+	clear_irq_status(regs);
+	zxi2c_enable_irq(regs, IRQ_EN_FIFOEND, true);
+
+	zxi2c_set_wr(regs, i2c->is_read);
+	if (i2c->is_read) {
+		set_fifo_rd_len(regs, msg->len - 1);
+	} else {
+		set_fifo_wr_len(regs, msg->len - 1);
+		for (i = 0; i < msg->len; i++)
+			set_fifo_byte(regs, msg->buf[i]);
+	}
+
+	zxi2c_start(i2c);
+	if (zxi2c_wait_event(i2c, IRQ_STS_FIFOEND))
+		return -ENODEV;
+
+	if (i2c->is_read) {
+		finished = get_fifo_rd_cnt(regs);
+		for (i = 0; i < finished; i++)
+			msg->buf[i] = get_fifo_byte(regs);
+	} else {
+		finished = get_fifo_wr_cnt(regs);
+	}
+
+	/* check if NACK during transmitting */
+	if (finished != msg->len) {
+		if (finished)
+			dev_err(i2c->dev,
+				"%s: %s only finished %d/%d bytes: %*ph\n",
+				__func__, i2c->is_read ? "read" : "write",
+				finished, msg->len, finished, msg->buf);
+		return -EAGAIN;
+	}
+
+	zxi2c_enable_irq(regs, IRQ_EN_FIFOEND, false);
+	return 1;
+}
+
+static int zxi2c_master_xfer(struct i2c_adapter *adap,
+			     struct i2c_msg *msgs, int num)
+{
+	int error;
+	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
+
+	if (!is_ready(i2c->regs)) {
+		zxi2c_module_reset(i2c);
+		zxi2c_set_bus_speed(i2c);
+		dev_err(i2c->dev, "controller busy, reset try again\n");
+
+		return -EAGAIN;
+	}
+
+	if (num == 1 && msgs->len <= FIFO_SIZE && msgs->len >= 3)
+		error = zxi2c_fifo_xfer(i2c, msgs);
+	else
+		error = zxi2c_byte_xfer(i2c, msgs, num);
+
+	return error;
+}
+
+static u32 zxi2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm zxi2c_algorithm = {
+	.master_xfer = zxi2c_master_xfer,
+	.functionality = zxi2c_func,
+};
+
+static const struct i2c_adapter_quirks zxi2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN | I2C_AQ_COMB_WRITE_THEN_READ,
+};
+
+static int zxi2c_parse_resources(struct zxi2c *i2c)
+{
+	struct platform_device *pdev = to_platform_device(i2c->dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(i2c->regs))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->regs),
+				"get base addr failed\n");
+
+	if (res->start & 0x20)
+		i2c->reset_bitmask = BIT(4);
+	else
+		i2c->reset_bitmask = BIT(5);
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return dev_err_probe(&pdev->dev, i2c->irq,
+				"get irq failed\n");
+
+	zxi2c_get_bus_speed(i2c);
+
+	i2c->hrv = get_reversion(i2c->regs);
+
+	i2c->dynamic = get_dynamic_clock(i2c->regs);
+	set_dynamic_clock(i2c->regs, i2c->dynamic);
+
+	i2c->fstp = get_fstp_value(i2c->regs);
+	zxi2c_set_bus_speed(i2c);
+
+	return 0;
+}
+
+static int zxi2c_probe(struct platform_device *pdev)
+{
+	int error;
+	struct zxi2c *i2c;
+	struct pci_dev *pci;
+	struct device *dev;
+
+	/* make sure this is zhaoxin platform */
+	dev = pdev->dev.parent;
+	if (dev && dev_is_pci(dev)) {
+		pci = to_pci_dev(dev);
+		if (pci->vendor != 0x1d17 || pci->device != 0x1001)
+			return -ENODEV;
+	} else {
+		return -ENODEV;
+	}
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (IS_ERR(i2c)) {
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				"devm_kzalloc failed\n");
+	}
+
+	i2c->pci = pci;
+	i2c->dev = &pdev->dev;
+	error = zxi2c_parse_resources(i2c);
+	if (error)
+		return error;
+
+	platform_set_drvdata(pdev, (void *)i2c);
+
+	error = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
+			     IRQF_SHARED, pdev->name, i2c);
+	if (error < 0)
+		return dev_err_probe(i2c->dev, error,
+				"IRQ%d request failed\n",
+				i2c->irq);
+
+	init_waitqueue_head(&i2c->waitq);
+
+	i2c->adap.owner = THIS_MODULE;
+	i2c->adap.algo = &zxi2c_algorithm;
+	i2c->adap.retries = 2;
+	i2c->adap.quirks = &zxi2c_quirks;
+	i2c->adap.dev.parent = &pdev->dev;
+	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
+	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
+		 "%s-%s", dev_name(&pci->dev), dev_name(i2c->dev));
+	i2c_set_adapdata(&i2c->adap, i2c);
+
+	error = i2c_add_adapter(&i2c->adap);
+	if (unlikely(error))
+		return dev_err_probe(i2c->dev, error,
+				"adapter registration failed\n");
+
+	dev_info(i2c->dev, "adapter /dev/i2c-%d registered. hw version %x\n",
+		 i2c->adap.nr, i2c->hrv);
+
+	return 0;
+}
+
+static int zxi2c_remove(struct platform_device *pdev)
+{
+	struct zxi2c *i2c = platform_get_drvdata(pdev);
+
+	i2c_lock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	zxi2c_module_reset(i2c);
+	master_regs_reset(i2c->regs);
+
+	devm_free_irq(&pdev->dev, i2c->irq, i2c);
+
+	i2c_unlock_bus(&i2c->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	i2c_del_adapter(&i2c->adap);
+
+	platform_set_drvdata(pdev, NULL);
+	devm_kfree(&pdev->dev, i2c);
+
+	dev_info(&pdev->dev, "adapter unregistered\n");
+
+	return 0;
+}
+
+static int zxi2c_resume(struct device *dev)
+{
+	struct zxi2c *i2c = dev_get_drvdata(dev);
+
+	zxi2c_module_reset(i2c);
+	zxi2c_set_bus_speed(i2c);
+
+	return 0;
+}
+
+const struct dev_pm_ops zxi2c_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, zxi2c_resume)
+};
+
+static const struct acpi_device_id zxi2c_acpi_match[] = {
+	{"IIC1D17", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
+
+static struct platform_driver zxi2c_driver = {
+	.probe = zxi2c_probe,
+	.remove = zxi2c_remove,
+	.driver = {
+		.name = ZX_I2C_NAME,
+		.owner = THIS_MODULE,
+		.acpi_match_table = ACPI_PTR(zxi2c_acpi_match),
+		.pm = &zxi2c_pm,
+	},
+};
+module_platform_driver(zxi2c_driver);
+
+MODULE_AUTHOR("HansHu@zhaoxin.com");
+MODULE_DESCRIPTION("Shanghai Zhaoxin IIC driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL");
-- 
2.17.1

