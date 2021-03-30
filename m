Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5FF134EA45
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 16:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhC3OWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 10:22:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14642 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbhC3OWJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 10:22:09 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8s5T6N53znWLh;
        Tue, 30 Mar 2021 22:19:25 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 22:21:56 +0800
From:   Yicong Yang <yangyicong@hisilicon.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <Sergey.Semin@baikalelectronics.ru>,
        <linux-kernel@vger.kernel.org>
CC:     <digetx@gmail.com>, <treding@nvidia.com>,
        <jarkko.nikula@linux.intel.com>, <rmk+kernel@armlinux.org.uk>,
        <song.bao.hua@hisilicon.com>, <john.garry@huawei.com>,
        <mika.westerberg@linux.intel.com>, <yangyicong@hisilicon.com>,
        <prime.zeng@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v5 3/5] i2c: add support for HiSilicon I2C controller
Date:   Tue, 30 Mar 2021 22:19:24 +0800
Message-ID: <1617113966-40498-4-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
the access to the i2c busses, which connects to the eeprom, rtc, etc.

The driver works with IRQ mode, and supports basic I2C features and 10bit
address. The DMA is not supported.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-hisi.c | 506 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 517 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-hisi.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 05ebf75..eddf7bf 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -645,6 +645,16 @@ config I2C_HIGHLANDER
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-highlander.
 
+config I2C_HISI
+	tristate "HiSilicon I2C controller"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Say Y here if you want to have Hisilicon I2C controller support
+	  available on the Kunpeng Server.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-hisi.
+
 config I2C_IBM_IIC
 	tristate "IBM PPC 4xx on-chip I2C interface"
 	depends on 4xx
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 615f35e..e1c9292 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_I2C_EMEV2)		+= i2c-emev2.o
 obj-$(CONFIG_I2C_EXYNOS5)	+= i2c-exynos5.o
 obj-$(CONFIG_I2C_GPIO)		+= i2c-gpio.o
 obj-$(CONFIG_I2C_HIGHLANDER)	+= i2c-highlander.o
+obj-$(CONFIG_I2C_HISI)		+= i2c-hisi.o
 obj-$(CONFIG_I2C_HIX5HD2)	+= i2c-hix5hd2.o
 obj-$(CONFIG_I2C_IBM_IIC)	+= i2c-ibm_iic.o
 obj-$(CONFIG_I2C_IMG)		+= i2c-img-scb.o
diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
new file mode 100644
index 0000000..e717734
--- /dev/null
+++ b/drivers/i2c/busses/i2c-hisi.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * HiSilicon I2C Controller Driver for Kunpeng SoC
+ *
+ * Copyright (c) 2021 HiSilicon Limited.
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define HISI_I2C_FRAME_CTRL		0x0000
+#define   HISI_I2C_FRAME_CTRL_SPEED_MODE	GENMASK(1, 0)
+#define   HISI_I2C_FRAME_CTRL_ADDR_TEN	BIT(2)
+#define HISI_I2C_SLV_ADDR		0x0004
+#define   HISI_I2C_SLV_ADDR_VAL		GENMASK(9, 0)
+#define   HISI_I2C_SLV_ADDR_GC_S_MODE	BIT(10)
+#define   HISI_I2C_SLV_ADDR_GC_S_EN	BIT(11)
+#define HISI_I2C_CMD_TXDATA		0x0008
+#define   HISI_I2C_CMD_TXDATA_DATA	GENMASK(7, 0)
+#define   HISI_I2C_CMD_TXDATA_RW	BIT(8)
+#define   HISI_I2C_CMD_TXDATA_P_EN	BIT(9)
+#define   HISI_I2C_CMD_TXDATA_SR_EN	BIT(10)
+#define HISI_I2C_RXDATA			0x000c
+#define   HISI_I2C_RXDATA_DATA		GENMASK(7, 0)
+#define HISI_I2C_SS_SCL_HCNT		0x0010
+#define HISI_I2C_SS_SCL_LCNT		0x0014
+#define HISI_I2C_FS_SCL_HCNT		0x0018
+#define HISI_I2C_FS_SCL_LCNT		0x001c
+#define HISI_I2C_HS_SCL_HCNT		0x0020
+#define HISI_I2C_HS_SCL_LCNT		0x0024
+#define HISI_I2C_FIFO_CTRL		0x0028
+#define   HISI_I2C_FIFO_RX_CLR		BIT(0)
+#define   HISI_I2C_FIFO_TX_CLR		BIT(1)
+#define   HISI_I2C_FIFO_RX_AF_THRESH	GENMASK(7, 2)
+#define   HISI_I2C_FIFO_TX_AE_THRESH	GENMASK(13, 8)
+#define HISI_I2C_FIFO_STATE		0x002c
+#define   HISI_I2C_FIFO_STATE_RX_RERR	BIT(0)
+#define   HISI_I2C_FIFO_STATE_RX_WERR	BIT(1)
+#define   HISI_I2C_FIFO_STATE_RX_EMPTY	BIT(3)
+#define   HISI_I2C_FIFO_STATE_TX_RERR	BIT(6)
+#define   HISI_I2C_FIFO_STATE_TX_WERR	BIT(7)
+#define   HISI_I2C_FIFO_STATE_TX_FULL	BIT(11)
+#define HISI_I2C_SDA_HOLD		0x0030
+#define   HISI_I2C_SDA_HOLD_TX		GENMASK(15, 0)
+#define   HISI_I2C_SDA_HOLD_RX		GENMASK(23, 16)
+#define HISI_I2C_FS_SPK_LEN		0x0038
+#define   HISI_I2C_FS_SPK_LEN_CNT	GENMASK(7, 0)
+#define HISI_I2C_HS_SPK_LEN		0x003c
+#define   HISI_I2C_HS_SPK_LEN_CNT	GENMASK(7, 0)
+#define HISI_I2C_INT_MSTAT		0x0044
+#define HISI_I2C_INT_CLR		0x0048
+#define HISI_I2C_INT_MASK		0x004C
+#define HISI_I2C_TRANS_STATE		0x0050
+#define HISI_I2C_TRANS_ERR		0x0054
+#define HISI_I2C_VERSION		0x0058
+
+#define HISI_I2C_INT_ALL	GENMASK(4, 0)
+#define HISI_I2C_INT_TRANS_CPLT	BIT(0)
+#define HISI_I2C_INT_TRANS_ERR	BIT(1)
+#define HISI_I2C_INT_FIFO_ERR	BIT(2)
+#define HISI_I2C_INT_RX_FULL	BIT(3)
+#define HISI_I2C_INT_TX_EMPTY	BIT(4)
+#define HISI_I2C_INT_ERR \
+	(HISI_I2C_INT_TRANS_ERR | HISI_I2C_INT_FIFO_ERR)
+
+#define HISI_I2C_STD_SPEED_MODE		0
+#define HISI_I2C_FAST_SPEED_MODE	1
+#define HISI_I2C_HIGH_SPEED_MODE	2
+
+#define HISI_I2C_TX_FIFO_DEPTH		64
+#define HISI_I2C_RX_FIFO_DEPTH		64
+#define HISI_I2C_TX_F_AE_THRESH		1
+#define HISI_I2C_RX_F_AF_THRESH		60
+
+#define HZ_PER_KHZ	1000
+
+#define NSEC_TO_CYCLES(ns, clk_rate_khz) \
+	DIV_ROUND_UP_ULL((clk_rate_khz) * (ns), NSEC_PER_MSEC)
+
+struct hisi_i2c_controller {
+	struct i2c_adapter adapter;
+	void __iomem *iobase;
+	struct device *dev;
+	int irq;
+
+	/* Intermediates for recording the transfer process */
+	struct completion *completion;
+	struct i2c_msg *msgs;
+	int msg_num;
+	int msg_tx_idx;
+	int buf_tx_idx;
+	int msg_rx_idx;
+	int buf_rx_idx;
+	u16 tar_addr;
+	u32 xfer_err;
+
+	/* I2C bus configuration */
+	struct i2c_timings t;
+	u64 clk_rate_khz;
+	u32 spk_len;
+};
+
+static void hisi_i2c_enable_int(struct hisi_i2c_controller *ctlr, u32 mask)
+{
+	writel_relaxed(mask, ctlr->iobase + HISI_I2C_INT_MASK);
+}
+
+static void hisi_i2c_disable_int(struct hisi_i2c_controller *ctlr, u32 mask)
+{
+	writel_relaxed((~mask) & HISI_I2C_INT_ALL, ctlr->iobase + HISI_I2C_INT_MASK);
+}
+
+static void hisi_i2c_clear_int(struct hisi_i2c_controller *ctlr, u32 mask)
+{
+	writel_relaxed(mask, ctlr->iobase + HISI_I2C_INT_CLR);
+}
+
+static void hisi_i2c_handle_errors(struct hisi_i2c_controller *ctlr)
+{
+	u32 int_err = ctlr->xfer_err, reg;
+
+	if (int_err & HISI_I2C_INT_FIFO_ERR) {
+		reg = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
+
+		if (reg & HISI_I2C_FIFO_STATE_RX_RERR)
+			dev_err(ctlr->dev, "rx fifo error read\n");
+
+		if (reg & HISI_I2C_FIFO_STATE_RX_WERR)
+			dev_err(ctlr->dev, "rx fifo error write\n");
+
+		if (reg & HISI_I2C_FIFO_STATE_TX_RERR)
+			dev_err(ctlr->dev, "tx fifo error read\n");
+
+		if (reg & HISI_I2C_FIFO_STATE_TX_WERR)
+			dev_err(ctlr->dev, "tx fifo error write\n");
+	}
+}
+
+static int hisi_i2c_start_xfer(struct hisi_i2c_controller *ctlr)
+{
+	struct i2c_msg *msg = ctlr->msgs;
+	u32 reg;
+
+	reg = readl(ctlr->iobase + HISI_I2C_FRAME_CTRL);
+	reg &= ~HISI_I2C_FRAME_CTRL_ADDR_TEN;
+	if (msg->flags & I2C_M_TEN)
+		reg |= HISI_I2C_FRAME_CTRL_ADDR_TEN;
+	writel(reg, ctlr->iobase + HISI_I2C_FRAME_CTRL);
+
+	reg = readl(ctlr->iobase + HISI_I2C_SLV_ADDR);
+	reg &= ~HISI_I2C_SLV_ADDR_VAL;
+	reg |= FIELD_PREP(HISI_I2C_SLV_ADDR_VAL, msg->addr);
+	writel(reg, ctlr->iobase + HISI_I2C_SLV_ADDR);
+
+	reg = readl(ctlr->iobase + HISI_I2C_FIFO_CTRL);
+	reg |= HISI_I2C_FIFO_RX_CLR | HISI_I2C_FIFO_TX_CLR;
+	writel(reg, ctlr->iobase + HISI_I2C_FIFO_CTRL);
+	reg &= ~(HISI_I2C_FIFO_RX_CLR | HISI_I2C_FIFO_TX_CLR);
+	writel(reg, ctlr->iobase + HISI_I2C_FIFO_CTRL);
+
+	hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
+	hisi_i2c_enable_int(ctlr, HISI_I2C_INT_ALL);
+
+	return 0;
+}
+
+static void hisi_i2c_reset_xfer(struct hisi_i2c_controller *ctlr)
+{
+	ctlr->msg_num = 0;
+	ctlr->xfer_err = 0;
+	ctlr->msg_tx_idx = 0;
+	ctlr->msg_rx_idx = 0;
+	ctlr->buf_tx_idx = 0;
+	ctlr->buf_rx_idx = 0;
+}
+
+/*
+ * Initialize the transfer information and start the I2C bus transfer.
+ * We only configure the transfer and do some pre/post works here, and
+ * wait for the transfer done. The major transfer process is performed
+ * in the IRQ handler.
+ */
+static int hisi_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+				int num)
+{
+	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
+	DECLARE_COMPLETION_ONSTACK(done);
+	int ret = num;
+
+	hisi_i2c_reset_xfer(ctlr);
+	ctlr->completion = &done;
+	ctlr->msg_num = num;
+	ctlr->msgs = msgs;
+
+	hisi_i2c_start_xfer(ctlr);
+
+	if (!wait_for_completion_timeout(ctlr->completion, adap->timeout)) {
+		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
+		synchronize_irq(ctlr->irq);
+		i2c_recover_bus(&ctlr->adapter);
+		dev_err(ctlr->dev, "bus transfer timeout\n");
+		ret = -EIO;
+	}
+
+	if (ctlr->xfer_err) {
+		hisi_i2c_handle_errors(ctlr);
+		ret = -EIO;
+	}
+
+	hisi_i2c_reset_xfer(ctlr);
+	ctlr->completion = NULL;
+
+	return ret;
+}
+
+static u32 hisi_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm hisi_i2c_algo = {
+	.master_xfer	= hisi_i2c_master_xfer,
+	.functionality	= hisi_i2c_functionality,
+};
+
+static int hisi_i2c_read_rx_fifo(struct hisi_i2c_controller *ctlr)
+{
+	struct i2c_msg *cur_msg;
+	u32 fifo_state;
+
+	while (ctlr->msg_rx_idx < ctlr->msg_num) {
+		cur_msg = ctlr->msgs + ctlr->msg_rx_idx;
+
+		if (!(cur_msg->flags & I2C_M_RD)) {
+			ctlr->msg_rx_idx++;
+			continue;
+		}
+
+		fifo_state = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
+		while (!(fifo_state & HISI_I2C_FIFO_STATE_RX_EMPTY) &&
+		       ctlr->buf_rx_idx < cur_msg->len) {
+			cur_msg->buf[ctlr->buf_rx_idx++] = readl(ctlr->iobase + HISI_I2C_RXDATA);
+			fifo_state = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
+		}
+
+		if (ctlr->buf_rx_idx == cur_msg->len) {
+			ctlr->buf_rx_idx = 0;
+			ctlr->msg_rx_idx++;
+		}
+
+		if (fifo_state & HISI_I2C_FIFO_STATE_RX_EMPTY)
+			break;
+	}
+
+	return 0;
+}
+
+static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
+{
+	int max_write = HISI_I2C_TX_FIFO_DEPTH;
+	bool need_restart = false, last_msg;
+	struct i2c_msg *cur_msg;
+	u32 cmd, fifo_state;
+
+	while (ctlr->msg_tx_idx < ctlr->msg_num) {
+		cur_msg = ctlr->msgs + ctlr->msg_tx_idx;
+		last_msg = (ctlr->msg_tx_idx == ctlr->msg_num - 1);
+
+		/* Signal the SR bit when we start transferring a new message */
+		if (ctlr->msg_tx_idx && !ctlr->buf_tx_idx)
+			need_restart = true;
+
+		fifo_state = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
+		while (!(fifo_state & HISI_I2C_FIFO_STATE_TX_FULL) &&
+		       ctlr->buf_tx_idx < cur_msg->len && max_write) {
+			cmd = 0;
+
+			if (need_restart) {
+				cmd |= HISI_I2C_CMD_TXDATA_SR_EN;
+				need_restart = false;
+			}
+
+			/* Signal the STOP bit at the last frame of the last message */
+			if (ctlr->buf_tx_idx == cur_msg->len - 1 && last_msg)
+				cmd |= HISI_I2C_CMD_TXDATA_P_EN;
+
+			if (cur_msg->flags & I2C_M_RD)
+				cmd |= HISI_I2C_CMD_TXDATA_RW;
+			else
+				cmd |= FIELD_PREP(HISI_I2C_CMD_TXDATA_DATA,
+						  cur_msg->buf[ctlr->buf_tx_idx]);
+
+			writel(cmd, ctlr->iobase + HISI_I2C_CMD_TXDATA);
+			ctlr->buf_tx_idx++;
+			max_write--;
+
+			fifo_state = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
+		}
+
+		/* Update the transfer index after per message transfer is done. */
+		if (ctlr->buf_tx_idx == cur_msg->len) {
+			ctlr->buf_tx_idx = 0;
+			ctlr->msg_tx_idx++;
+		}
+
+		if ((fifo_state & HISI_I2C_FIFO_STATE_TX_FULL) ||
+		    max_write == 0)
+			break;
+	}
+}
+
+static irqreturn_t hisi_i2c_irq(int irq, void *context)
+{
+	struct hisi_i2c_controller *ctlr = context;
+	u32 int_stat;
+
+	int_stat = readl(ctlr->iobase + HISI_I2C_INT_MSTAT);
+	hisi_i2c_clear_int(ctlr, int_stat);
+	if (!(int_stat & HISI_I2C_INT_ALL))
+		return IRQ_NONE;
+
+	if (int_stat & HISI_I2C_INT_TX_EMPTY)
+		hisi_i2c_xfer_msg(ctlr);
+
+	if (int_stat & HISI_I2C_INT_ERR) {
+		ctlr->xfer_err = int_stat;
+		goto out;
+	}
+
+	/* Drain the rx fifo before finish the transfer */
+	if (int_stat & (HISI_I2C_INT_TRANS_CPLT | HISI_I2C_INT_RX_FULL))
+		hisi_i2c_read_rx_fifo(ctlr);
+
+out:
+	if (int_stat & HISI_I2C_INT_TRANS_CPLT || ctlr->xfer_err) {
+		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
+		hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
+		complete(ctlr->completion);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * Helper function for calculating and configuring the HIGH and LOW
+ * periods of SCL clock. The caller will pass the ratio of the
+ * counts (divide / divisor) according to the target speed mode,
+ * and the target registers.
+ */
+static void hisi_i2c_set_scl(struct hisi_i2c_controller *ctlr,
+			     u32 divide, u32 divisor,
+			     u32 reg_hcnt, u32 reg_lcnt)
+{
+	u32 total_cnt, t_scl_hcnt, t_scl_lcnt, scl_fall_cnt, scl_rise_cnt;
+	u32 scl_hcnt, scl_lcnt;
+
+	/* Total SCL clock cycles per speed period */
+	total_cnt = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz * HZ_PER_KHZ, ctlr->t.bus_freq_hz);
+	/* Total HIGH level SCL clock cycles including edges */
+	t_scl_hcnt = DIV_ROUND_UP_ULL(total_cnt * divide, divisor);
+	/* Total LOW level SCL clock cycles including edges */
+	t_scl_lcnt = total_cnt - t_scl_hcnt;
+	/* Fall edge SCL clock cycles */
+	scl_fall_cnt = NSEC_TO_CYCLES(ctlr->t.scl_fall_ns, ctlr->clk_rate_khz);
+	/* Rise edge SCL clock cycles */
+	scl_rise_cnt = NSEC_TO_CYCLES(ctlr->t.scl_rise_ns, ctlr->clk_rate_khz);
+
+	/* Calculated HIGH and LOW periods of SCL clock */
+	scl_hcnt = t_scl_hcnt - ctlr->spk_len - 7 - scl_fall_cnt;
+	scl_lcnt = t_scl_lcnt - 1 - scl_rise_cnt;
+
+	writel(scl_hcnt, ctlr->iobase + reg_hcnt);
+	writel(scl_lcnt, ctlr->iobase + reg_lcnt);
+}
+
+static void hisi_i2c_configure_bus(struct hisi_i2c_controller *ctlr)
+{
+	u32 reg, sda_hold_cnt, speed_mode;
+
+	i2c_parse_fw_timings(ctlr->dev, &ctlr->t, true);
+	ctlr->spk_len = NSEC_TO_CYCLES(ctlr->t.digital_filter_width_ns, ctlr->clk_rate_khz);
+
+	switch (ctlr->t.bus_freq_hz) {
+	case I2C_MAX_FAST_MODE_FREQ:
+		speed_mode = HISI_I2C_FAST_SPEED_MODE;
+		hisi_i2c_set_scl(ctlr, 26, 76, HISI_I2C_FS_SCL_HCNT, HISI_I2C_FS_SCL_LCNT);
+		break;
+	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		speed_mode = HISI_I2C_HIGH_SPEED_MODE;
+		hisi_i2c_set_scl(ctlr, 6, 22, HISI_I2C_HS_SCL_HCNT, HISI_I2C_HS_SCL_LCNT);
+		break;
+	case I2C_MAX_STANDARD_MODE_FREQ:
+	default:
+		speed_mode = HISI_I2C_STD_SPEED_MODE;
+
+		/* For default condition force the bus speed to standard mode. */
+		ctlr->t.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+		hisi_i2c_set_scl(ctlr, 40, 87, HISI_I2C_SS_SCL_HCNT, HISI_I2C_SS_SCL_LCNT);
+		break;
+	}
+
+	reg = readl(ctlr->iobase + HISI_I2C_FRAME_CTRL);
+	reg &= ~HISI_I2C_FRAME_CTRL_SPEED_MODE;
+	reg |= FIELD_PREP(HISI_I2C_FRAME_CTRL_SPEED_MODE, speed_mode);
+	writel(reg, ctlr->iobase + HISI_I2C_FRAME_CTRL);
+
+	sda_hold_cnt = NSEC_TO_CYCLES(ctlr->t.sda_hold_ns, ctlr->clk_rate_khz);
+
+	reg = FIELD_PREP(HISI_I2C_SDA_HOLD_TX, sda_hold_cnt);
+	writel(reg, ctlr->iobase + HISI_I2C_SDA_HOLD);
+
+	writel(ctlr->spk_len, ctlr->iobase + HISI_I2C_FS_SPK_LEN);
+
+	reg = FIELD_PREP(HISI_I2C_FIFO_RX_AF_THRESH, HISI_I2C_RX_F_AF_THRESH);
+	reg |= FIELD_PREP(HISI_I2C_FIFO_TX_AE_THRESH, HISI_I2C_TX_F_AE_THRESH);
+	writel(reg, ctlr->iobase + HISI_I2C_FIFO_CTRL);
+}
+
+static int hisi_i2c_probe(struct platform_device *pdev)
+{
+	struct hisi_i2c_controller *ctlr;
+	struct device *dev = &pdev->dev;
+	struct i2c_adapter *adapter;
+	u32 hw_version;
+	int ret;
+
+	ctlr = devm_kzalloc(dev, sizeof(*ctlr), GFP_KERNEL);
+	if (!ctlr)
+		return -ENOMEM;
+
+	ctlr->iobase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctlr->iobase))
+		return PTR_ERR(ctlr->iobase);
+
+	ctlr->irq = platform_get_irq(pdev, 0);
+	if (ctlr->irq < 0)
+		return ctlr->irq;
+
+	ctlr->dev = dev;
+
+	hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
+
+	ret = devm_request_irq(dev, ctlr->irq, hisi_i2c_irq, 0, "hisi-i2c", ctlr);
+	if (ret) {
+		dev_err(dev, "failed to request irq handler, ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = device_property_read_u64(dev, "clk_rate", &ctlr->clk_rate_khz);
+	if (ret) {
+		dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
+		return ret;
+	}
+
+	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz, HZ_PER_KHZ);
+
+	hisi_i2c_configure_bus(ctlr);
+
+	adapter = &ctlr->adapter;
+	snprintf(adapter->name, sizeof(adapter->name),
+		 "HiSilicon I2C Controller %s", dev_name(dev));
+	adapter->owner = THIS_MODULE;
+	adapter->algo = &hisi_i2c_algo;
+	adapter->dev.parent = dev;
+	i2c_set_adapdata(adapter, ctlr);
+
+	ret = devm_i2c_add_adapter(dev, adapter);
+	if (ret) {
+		dev_err(dev, "failed to add i2c adapter, ret = %d\n", ret);
+		return ret;
+	}
+
+	hw_version = readl(ctlr->iobase + HISI_I2C_VERSION);
+	dev_info(ctlr->dev, "speed mode is %s. hw version 0x%x\n",
+		 i2c_freq_mode_string(ctlr->t.bus_freq_hz), hw_version);
+
+	return 0;
+}
+
+static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
+	{ "HISI03D1", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);
+MODULE_ALIAS("platform:hisi-i2c");
+
+static struct platform_driver hisi_i2c_driver = {
+	.probe		= hisi_i2c_probe,
+	.driver		= {
+		.name	= "hisi-i2c",
+		.acpi_match_table = hisi_i2c_acpi_ids,
+	},
+};
+module_platform_driver(hisi_i2c_driver);
+
+MODULE_AUTHOR("Yicong Yang <yangyicong@hisilicon.com>");
+MODULE_DESCRIPTION("HiSilicon I2C Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.8.1

