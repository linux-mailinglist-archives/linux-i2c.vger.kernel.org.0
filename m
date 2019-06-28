Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FF059644
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 10:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbfF1ImO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 04:42:14 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:49128 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfF1ImO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 04:42:14 -0400
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hgmIC-00054u-Ib from Joshua_Frkuska@mentor.com ; Fri, 28 Jun 2019 01:31:36 -0700
Received: from jfrkuska-fe28.world.mentorg.com (147.34.91.1) by
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Fri, 28 Jun 2019 01:31:33 -0700
From:   Joshua Frkuska <joshua_frkuska@mentor.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <wolfram@the-dreams.de>, <msyrchin@dev.rtsoft.ru>,
        <ying.zhang22455@nxp.com>, <leoyang.li@nxp.com>, <york.sun@nxp.com>
Subject: [PATCH V7 1/1] i2c: imx: add slave support
Date:   Fri, 28 Jun 2019 17:31:01 +0900
Message-ID: <20190628083101.103418-2-joshua_frkuska@mentor.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628083101.103418-1-joshua_frkuska@mentor.com>
References: <42974013-1b7a-368a-652d-47f709c4e91e () mentor ! com>
 <20190628083101.103418-1-joshua_frkuska@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Maxim Syrchin <msyrchin@dev.rtsoft.ru>

This patch adds hardware supported slave-mode with master arbitration
via the i2c generic slave interface. This allows master transactions
to be supported while a slave-mode device is in idle.

To enable this functionality enable i2c slave support.

CONFIG_I2C_SLAVE=y

If i2c-slave support is not enabled in the kernel config, we support
master-mode only and the slave-mode support is not compiled in.

A queue backed event-driven state machine is implemented in order to
handle events in the order they occur in the hardware. The states
for the most part follow the logic charts in the imx reference manual

Signed-off-by: Maxim Syrchin <msyrchin@dev.rtsoft.ru>
[joshua_frkuska@mentor.com: Reworked patchset for upstream submission]
Signed-off-by: Joshua Frkuska <joshua_frkuska@mentor.com>
---
 drivers/i2c/busses/i2c-imx.c | 738 +++++++++++++++++++++++++++++++++--
 1 file changed, 703 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b1b8b938d7f4..53223faca4f9 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -34,6 +34,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -44,6 +45,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <uapi/linux/sched/types.h>
 
 /* This will be the driver name the kernel reports */
 #define DRIVER_NAME "imx-i2c"
@@ -51,6 +53,13 @@
 /* Default value */
 #define IMX_I2C_BIT_RATE	100000	/* 100kHz */
 
+/* Wait delays */
+#define IMX_I2C_STATE_NO_DELAY	0
+#define IMX_I2C_STATE_MIN_DELAY	1 /* 1 jiffy */
+#define IMX_I2C_STATE_DELAY	(HZ / 10) /* arbitrarily chosen */
+
+#define IMX_I2C_MAX_EVENTS	16
+
 /*
  * Enable DMA if transfer byte size is bigger than this threshold.
  * As the hardware request, it must bigger than 4 bytes.\
@@ -162,6 +171,30 @@ enum imx_i2c_type {
 	VF610_I2C,
 };
 
+enum imx_i2c_state {
+	STATE_IDLE,
+	STATE_SLAVE,
+	STATE_MASTER,
+	STATE_START_POLL,
+};
+
+enum imx_i2c_events {
+	EVT_AL,
+	EVT_SI,
+	EVT_START,
+	EVT_STOP,
+	EVT_POLL,
+	EVT_INVALID,
+	EVT_ENTRY,
+};
+
+struct imx_i2c_evt_queue {
+	int count;
+	int head_idx;
+	int tail_idx;
+	enum imx_i2c_events evt[IMX_I2C_MAX_EVENTS];
+};
+
 struct imx_i2c_hwdata {
 	enum imx_i2c_type	devtype;
 	unsigned		regshift;
@@ -202,6 +235,18 @@ struct imx_i2c_struct {
 	struct pinctrl_state *pinctrl_pins_gpio;
 
 	struct imx_i2c_dma	*dma;
+
+	enum imx_i2c_state	state;
+	struct imx_i2c_evt_queue	events;
+	int			last_error;
+
+	bool			master_interrupt;
+	unsigned int		start_retry_cnt;
+	unsigned int		slave_poll_cnt;
+
+	struct i2c_client	*slave;
+	struct task_struct	*slave_task;
+	wait_queue_head_t	state_queue;
 };
 
 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -412,17 +457,29 @@ static void i2c_imx_dma_free(struct imx_i2c_struct *i2c_imx)
 static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy)
 {
 	unsigned long orig_jiffies = jiffies;
-	unsigned int temp;
 
 	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
 
 	while (1) {
+		unsigned int temp, ctl;
+
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+		/*
+		 * Check for arbitration lost. Datasheet recommends to
+		 * clean IAL bit in interrupt handler before any other
+		 * action.
+		 *
+		 * We can detect if controller resets MSTA bit, because
+		 * hardware is switched to slave mode if arbitration was
+		 * lost.
+		 */
 
-		/* check for arbitration lost */
-		if (temp & I2SR_IAL) {
-			temp &= ~I2SR_IAL;
-			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
+		if (for_busy && !(ctl & I2CR_MSTA)) {
+			dev_dbg(&i2c_imx->adapter.dev,
+				"<%s> Lost arbitration (SR = %02x, CR = %02x)\n",
+				__func__, temp, ctl);
 			return -EAGAIN;
 		}
 
@@ -447,14 +504,15 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy)
 
 static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx)
 {
-	wait_event_timeout(i2c_imx->queue, i2c_imx->i2csr & I2SR_IIF, HZ / 10);
+	wait_event_timeout(i2c_imx->queue, i2c_imx->master_interrupt,
+			   IMX_I2C_STATE_DELAY);
 
-	if (unlikely(!(i2c_imx->i2csr & I2SR_IIF))) {
+	if (unlikely(!(i2c_imx->master_interrupt))) {
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Timeout\n", __func__);
 		return -ETIMEDOUT;
 	}
 	dev_dbg(&i2c_imx->adapter.dev, "<%s> TRX complete\n", __func__);
-	i2c_imx->i2csr = 0;
+	i2c_imx->master_interrupt = false;
 	return 0;
 }
 
@@ -525,36 +583,577 @@ static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int i2c_imx_start(struct imx_i2c_struct *i2c_imx)
+static int i2c_imx_configure_clock(struct imx_i2c_struct *i2c_imx)
 {
-	unsigned int temp = 0;
 	int result;
 
-	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
 
-	imx_i2c_write_reg(i2c_imx->ifdr, i2c_imx, IMX_I2C_IFDR);
-	/* Enable I2C controller */
-	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
-	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx, IMX_I2C_I2CR);
+	result = clk_prepare_enable(i2c_imx->clk);
+	if (!result)
+		imx_i2c_write_reg(i2c_imx->ifdr, i2c_imx, IMX_I2C_IFDR);
+
+	return result;
+}
+
+static void i2c_imx_enable_i2c_controller(struct imx_i2c_struct *i2c_imx)
+{
+	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
+			  IMX_I2C_I2SR);
+	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx,
+			  IMX_I2C_I2CR);
 
 	/* Wait controller to be stable */
 	usleep_range(50, 150);
+}
 
-	/* Start I2C transaction */
-	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
-	temp |= I2CR_MSTA;
-	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-	result = i2c_imx_bus_busy(i2c_imx, 1);
+static void __maybe_unused set_state(struct imx_i2c_struct *i2c_imx,
+				     unsigned int new);
+
+static inline int __maybe_unused i2c_imx_evt_find_next_idx(int *v)
+{
+	return (*v)++ & (IMX_I2C_MAX_EVENTS - 1);
+}
+
+static int __maybe_unused i2c_imx_evt_put(struct imx_i2c_evt_queue *stk,
+					  enum imx_i2c_events evt)
+{
+	int count = stk->count++;
+	int idx;
+
+	if (count < IMX_I2C_MAX_EVENTS) {
+		idx = i2c_imx_evt_find_next_idx(&stk->tail_idx);
+		stk->evt[idx] = evt;
+	} else {
+		stk->count--;
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static enum imx_i2c_events __maybe_unused i2c_imx_evt_get(
+	struct imx_i2c_evt_queue *stk)
+{
+	int count = stk->count--;
+	int idx;
+
+	if (count > 0) {
+		idx = i2c_imx_evt_find_next_idx(&stk->head_idx);
+	} else {
+		stk->count++;
+		return EVT_INVALID;
+	}
+
+	return stk->evt[idx];
+}
+
+static bool __maybe_unused i2c_imx_evt_is_empty(struct imx_i2c_evt_queue *stk)
+{
+	return (stk->count <= 0);
+}
+
+static void __maybe_unused i2c_imx_evt_init(struct imx_i2c_evt_queue *stk)
+{
+	stk->count = 0;
+	stk->tail_idx = -1;
+	stk->head_idx = -1;
+}
+
+static void __maybe_unused i2c_imx_clear_ial_bit(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int status;
+
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	status &= ~I2SR_IAL;
+	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
+}
+
+static int i2c_imx_hw_start(struct imx_i2c_struct *i2c_imx)
+{
+	int result;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+
+	result = i2c_imx_configure_clock(i2c_imx);
 	if (result)
 		return result;
+	i2c_imx_enable_i2c_controller(i2c_imx);
+	return 0;
+}
 
-	temp |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
-	temp &= ~I2CR_DMAEN;
+static void __maybe_unused i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+
+	i2c_imx_enable_i2c_controller(i2c_imx);
+
+	/* Set Slave mode with interrupt enable */
+	temp = i2c_imx->hwdata->i2cr_ien_opcode | I2CR_IIEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+}
+
+#ifdef CONFIG_I2C_SLAVE
+
+static void i2c_imx_slave_process_irq(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int status, ctl;
+	u8 data;
+
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+	if (status & I2SR_IAAS) { /* interrupt slave mode */
+		if (status & I2SR_SRW) {
+			/* master wants to read from us */
+			i2c_slave_event(i2c_imx->slave,
+					I2C_SLAVE_READ_REQUESTED,
+					&data);
+			ctl |= I2CR_MTX;
+			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+
+			imx_i2c_write_reg(data, i2c_imx, IMX_I2C_I2DR);
+		} else {
+			/* master wants to write to us */
+			dev_dbg(&i2c_imx->adapter.dev, "write requested");
+
+			i2c_slave_event(i2c_imx->slave,
+					I2C_SLAVE_WRITE_REQUESTED,
+					&data);
+
+			ctl &= ~I2CR_MTX;
+			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+
+			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		}
+	} else {
+		if (ctl & I2CR_MTX) { /* transmit mode */
+			if (!(status & I2SR_RXAK)) {
+				/* received ACK */
+				i2c_slave_event(i2c_imx->slave,
+						I2C_SLAVE_READ_PROCESSED,
+						&data);
+				ctl |= I2CR_MTX;
+				imx_i2c_write_reg(ctl, i2c_imx,
+						  IMX_I2C_I2CR);
+
+				/*send data */
+				imx_i2c_write_reg(data, i2c_imx,
+						  IMX_I2C_I2DR);
+			} else {
+				/* received NAK */
+				dev_dbg(&i2c_imx->adapter.dev,
+					"read requested");
+				i2c_slave_event(i2c_imx->slave,
+						I2C_SLAVE_READ_REQUESTED,
+						&data);
+
+				ctl &= ~I2CR_MTX;
+				imx_i2c_write_reg(ctl, i2c_imx,
+						  IMX_I2C_I2CR);
+
+				imx_i2c_read_reg(i2c_imx,
+						 IMX_I2C_I2DR);
+			}
+		} else { /* receive mode */
+			ctl &= ~I2CR_MTX;
+			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
+
+			/* read data from i2dr and store */
+			data = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+			dev_dbg(&i2c_imx->adapter.dev,
+				"received %x", data);
+			i2c_slave_event(i2c_imx->slave,
+					I2C_SLAVE_WRITE_RECEIVED,
+					&data);
+		}
+	}
+}
+
+static int i2c_imx_slave_evt_handler(struct imx_i2c_struct *i2c_imx,
+				     enum imx_i2c_events event)
+{
+	u8 reg, data;
+
+	switch (event) {
+	case EVT_ENTRY:
+		if (i2c_imx->last_error == -EINPROGRESS) {
+			dev_dbg(&i2c_imx->adapter.dev, "Reset lost START event\n");
+			i2c_imx->last_error = -EBUSY;
+		}
+		i2c_imx->start_retry_cnt = 0;
+		i2c_imx->slave_poll_cnt = 0;
+		return IMX_I2C_STATE_NO_DELAY;
+	case EVT_AL:
+		set_state(i2c_imx, STATE_IDLE);
+		break;
+	case EVT_START:
+		reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		i2c_imx->last_error = -EBUSY;
+		break;
+	case EVT_SI:
+		i2c_imx_slave_process_irq(i2c_imx);
+		reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		if (!(reg & I2SR_IBB)) {
+			data = 0;
+			set_state(i2c_imx, STATE_IDLE);
+			dev_dbg(&i2c_imx->adapter.dev, "end of package");
+			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &data);
+		}
+		if (i2c_imx->slave_poll_cnt > 10) {
+			dev_err(&i2c_imx->adapter.dev,
+				"Too much slave loops (%i)\n",
+				i2c_imx->slave_poll_cnt);
+		}
+
+		i2c_imx->slave_poll_cnt = 0;
+		break;
+	case EVT_POLL:
+		reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		if (!(reg & I2SR_IBB)) {
+			data = 0;
+			set_state(i2c_imx,  STATE_IDLE);
+			dev_dbg(&i2c_imx->adapter.dev, "end of package");
+			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &data);
+			if (i2c_imx->slave_poll_cnt > 10) {
+				dev_err(&i2c_imx->adapter.dev,
+					"Too much slave loops (%i)\n",
+					i2c_imx->slave_poll_cnt);
+			}
+
+			i2c_imx->slave_poll_cnt = 0;
+		}
+
+		/*
+		 * Do "dummy read" if no interrupts or stop condition
+		 * for more then 10 wait loops
+		 */
+		i2c_imx->slave_poll_cnt++;
+		if (i2c_imx->slave_poll_cnt % 10 == 0)
+			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		break;
+	default:
+		break;
+	}
+
+	return IMX_I2C_STATE_MIN_DELAY;
+}
+
+#else
+
+static void __maybe_unused i2c_imx_slave_process_irq(
+	struct imx_i2c_struct *i2c_imx)
+{
+	/* EMPTY */
+}
+
+static int __maybe_unused i2c_imx_slave_evt_handler(
+	struct imx_i2c_struct *i2c_imx,
+	enum imx_i2c_events event)
+{
+	return 0;
+}
+
+#endif
+
+static int __maybe_unused i2c_imx_idle_evt_handler(
+	struct imx_i2c_struct *i2c_imx,
+	enum imx_i2c_events event)
+{
+	u8 reg;
+
+	switch (event) {
+	case EVT_ENTRY:
+		imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
+				  i2c_imx, IMX_I2C_I2CR);
+		i2c_imx_enable_i2c_controller(i2c_imx);
+		imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode | I2CR_IIEN,
+				  i2c_imx, IMX_I2C_I2CR);
+		if (i2c_imx->last_error == -EINPROGRESS) {
+			dev_dbg(&i2c_imx->adapter.dev, "Reset lost START event\n");
+			i2c_imx->last_error = -EBUSY;
+		}
+		i2c_imx->start_retry_cnt = 0;
+		return IMX_I2C_STATE_NO_DELAY;
+	case EVT_AL:
+		i2c_imx_clear_ial_bit(i2c_imx);
+		break;
+	case EVT_SI:
+		set_state(i2c_imx, STATE_SLAVE);
+		i2c_imx_slave_process_irq(i2c_imx);
+		break;
+	case EVT_START:
+		reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		if (reg & I2SR_IBB) {
+			i2c_imx->last_error = -EBUSY;
+			break;
+		}
+
+		reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		reg |= I2CR_MSTA;
+		imx_i2c_write_reg(reg, i2c_imx, IMX_I2C_I2CR);
+		set_state(i2c_imx, STATE_START_POLL);
+		i2c_imx->start_retry_cnt = 0;
+		return IMX_I2C_STATE_NO_DELAY;
+	default:
+		break;
+	}
+
+	return IMX_I2C_STATE_DELAY;
+}
+
+static int __maybe_unused i2c_imx_master_evt_handler(
+	struct imx_i2c_struct *i2c_imx,
+	enum imx_i2c_events event)
+{
+	switch (event) {
+	case EVT_ENTRY:
+		i2c_imx->start_retry_cnt = 0;
+		return IMX_I2C_STATE_NO_DELAY;
+	case EVT_AL:
+		set_state(i2c_imx, STATE_IDLE);
+		break;
+	case EVT_START:
+		i2c_imx->last_error = -EBUSY;
+		break;
+	case EVT_STOP:
+		imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx,
+				  IMX_I2C_I2SR);
+		imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode | I2CR_IIEN,
+				  i2c_imx, IMX_I2C_I2CR);
+
+		i2c_imx->stopped = 1;
+		usleep_range(50, 80);
+		set_state(i2c_imx, STATE_IDLE);
+		return IMX_I2C_STATE_NO_DELAY;
+	default:
+		break;
+	}
+
+	return IMX_I2C_STATE_DELAY;
+}
+
+static int __maybe_unused i2c_imx_start_poll_evt_handler(
+	struct imx_i2c_struct *i2c_imx,
+	enum imx_i2c_events event)
+{
+	u8 reg;
+
+	switch (event) {
+	case EVT_AL:
+		dev_dbg(&i2c_imx->adapter.dev, "Lost arbitration on START");
+		i2c_imx->last_error = -EAGAIN;
+		set_state(i2c_imx, STATE_IDLE);
+		return IMX_I2C_STATE_NO_DELAY;
+	case EVT_SI:
+		set_state(i2c_imx, STATE_IDLE);
+		i2c_imx_evt_put(&i2c_imx->events, EVT_SI);
+	case EVT_START:
+		i2c_imx->last_error = -EBUSY;
+		break;
+	case EVT_STOP:
+		break;
+	case EVT_ENTRY:
+		return IMX_I2C_STATE_NO_DELAY;
+	case EVT_POLL:
+		reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		if ((reg & I2SR_IBB) && !(reg & I2SR_IAL)) {
+			set_state(i2c_imx,  STATE_MASTER);
+			reg = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+			i2c_imx->stopped = 0;
+			reg |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
+			reg &= ~I2CR_DMAEN;
+			imx_i2c_write_reg(reg, i2c_imx, IMX_I2C_I2CR);
+			i2c_imx->last_error = 0;
+			i2c_imx->start_retry_cnt = 0;
+			return IMX_I2C_STATE_NO_DELAY;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (i2c_imx->start_retry_cnt++ < 100) {
+		dev_dbg(&i2c_imx->adapter.dev,
+			"wait for busy cnt = %i evt = %i",
+			i2c_imx->start_retry_cnt, event);
+	} else {
+		dev_dbg(&i2c_imx->adapter.dev, "start timeout");
+		i2c_imx->start_retry_cnt = 0;
+		i2c_imx->last_error = -ETIMEDOUT;
+		set_state(i2c_imx, STATE_IDLE);
+		return IMX_I2C_STATE_DELAY;
+	}
+
+	return IMX_I2C_STATE_MIN_DELAY;
+}
+
+static void __maybe_unused set_state(struct imx_i2c_struct *i2c_imx,
+				     unsigned int new)
+{
+	i2c_imx->state = new;
+
+	switch (new) {
+	case STATE_IDLE:
+		i2c_imx_idle_evt_handler(i2c_imx, EVT_ENTRY);
+		break;
+	case STATE_SLAVE:
+		i2c_imx_slave_evt_handler(i2c_imx, EVT_ENTRY);
+		break;
+	case STATE_START_POLL:
+		i2c_imx_start_poll_evt_handler(i2c_imx, EVT_ENTRY);
+		break;
+	case STATE_MASTER:
+		i2c_imx_master_evt_handler(i2c_imx, EVT_ENTRY);
+		break;
+	}
+}
+
+static int __maybe_unused i2c_imx_slave_threadfn(void *pdata)
+{
+	struct imx_i2c_struct *i2c_imx = pdata;
+	enum imx_i2c_events event, delay;
+	int ret;
+
+	do {
+		event = i2c_imx_evt_get(&i2c_imx->events);
+		if (event == EVT_INVALID)
+			event = EVT_POLL;
+
+		switch (i2c_imx->state) {
+		case STATE_IDLE:
+			delay = i2c_imx_idle_evt_handler(i2c_imx, event);
+			break;
+		case STATE_SLAVE:
+			delay = i2c_imx_slave_evt_handler(i2c_imx, event);
+			break;
+		case STATE_START_POLL:
+			delay = i2c_imx_start_poll_evt_handler(i2c_imx, event);
+			break;
+		case STATE_MASTER:
+			delay = i2c_imx_master_evt_handler(i2c_imx, event);
+			break;
+		default:
+			delay = IMX_I2C_STATE_NO_DELAY;
+			break;
+		}
+
+		if (delay) {
+			ret = wait_event_interruptible_timeout(
+				i2c_imx->state_queue,
+				(!i2c_imx_evt_is_empty(&i2c_imx->events)),
+				delay);
+			if (ret < 0)
+				return ret;
+		}
+	} while (kthread_should_stop() == 0);
+
+	return 0;
+}
+
+static int __maybe_unused i2c_imx_reg_slave(struct i2c_client *slave)
+{
+	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(slave->adapter);
+	int result;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+
+	if (i2c_imx->slave)
+		return -EBUSY;
+
+	if (slave->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	i2c_imx->slave = slave;
+
+	/* Set the Slave address */
+	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx, IMX_I2C_IADR);
+
+	result = i2c_imx_hw_start(i2c_imx);
+	if (result)
+		return result;
+
+	i2c_imx->slave_task = kthread_run(i2c_imx_slave_threadfn,
+					  i2c_imx, "i2c-slave-%s",
+					  i2c_imx->adapter.name);
+
+	if (IS_ERR(i2c_imx->slave_task))
+		return PTR_ERR(i2c_imx->slave_task);
+
+	i2c_imx_slave_init(i2c_imx);
+
+	return 0;
+}
+
+static int i2c_imx_start(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp = 0;
+	int result, cnt = 0;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+
+	if (IS_ENABLED(CONFIG_I2C_SLAVE_MODE) && i2c_imx->slave_task) {
+		i2c_imx->last_error = -EINPROGRESS;
+
+		result = i2c_imx_evt_put(&i2c_imx->events, EVT_START);
+		if (result) {
+			dev_err(&i2c_imx->adapter.dev,
+				"Event buffer overflow\n");
+			return result;
+		}
+
+		wake_up(&i2c_imx->state_queue);
+
+		result = i2c_imx->last_error;
+
+		while (result == -EINPROGRESS) {
+			schedule();
+
+			/* start hung monitoring */
+			cnt++;
+			if (cnt == 500000) {
+				dev_err(&i2c_imx->adapter.dev,
+					"Too many start loops\n");
+				temp = i2c_imx->hwdata->i2cr_ien_opcode
+						^ I2CR_IEN;
+				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+				i2c_imx_enable_i2c_controller(i2c_imx);
+				temp = i2c_imx->hwdata->i2cr_ien_opcode
+						| I2CR_IIEN;
+				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+				return -ETIMEDOUT;
+			}
+			result = i2c_imx->last_error;
+		}
+	} else { /* i2c slave not used */
+
+		result = i2c_imx_hw_start(i2c_imx);
+		if (result)
+			return result;
+
+		/* Start I2C transaction */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_MSTA;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+		result = i2c_imx_bus_busy(i2c_imx, 1);
+		if (result)
+			return result;
+		i2c_imx->stopped = 0;
+
+		temp |= I2CR_IIEN | I2CR_MTX | I2CR_TXAK;
+		temp &= ~I2CR_DMAEN;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
+
 	return result;
 }
 
-static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
+static void i2c_imx_hw_stop(struct imx_i2c_struct *i2c_imx)
 {
 	unsigned int temp = 0;
 
@@ -578,24 +1177,74 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
 	if (!i2c_imx->stopped)
 		i2c_imx_bus_busy(i2c_imx, 0);
 
-	/* Disable I2C controller */
-	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
+	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+	clk_disable_unprepare(i2c_imx->clk);
+}
+
+static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx)
+{
+	if (!i2c_imx->slave) {
+		i2c_imx_hw_stop(i2c_imx);
+	} else {
+		dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+
+		i2c_imx_evt_put(&i2c_imx->events, EVT_STOP);
+		wake_up(&i2c_imx->state_queue);
+	}
+}
+
+static int __maybe_unused i2c_imx_unreg_slave(struct i2c_client *slave)
+{
+	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(slave->adapter);
+	int ret = 0;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
+	if (i2c_imx->slave_task)
+		ret = kthread_stop(i2c_imx->slave_task);
+
+	wake_up(&i2c_imx->state_queue);
+
+	i2c_imx->slave_task = NULL;
+
+	i2c_imx->slave = NULL;
+
+	i2c_imx_stop(i2c_imx);
+
+	return ret;
+}
+
+static void i2c_imx_clear_isr_bit(struct imx_i2c_struct *i2c_imx,
+				  unsigned int status)
+{
+	status &= ~I2SR_IIF;
+	status |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
+	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
 }
 
 static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
-	unsigned int temp;
+	unsigned int status, ctl;
+
+	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	if (status & I2SR_IIF) {
+		i2c_imx_clear_isr_bit(i2c_imx, status);
+
+		if (ctl & I2CR_MSTA) {
+			dev_dbg(&i2c_imx->adapter.dev, "master interrupt");
+			i2c_imx->master_interrupt = true;
+			wake_up(&i2c_imx->queue);
+		} else if (status & I2SR_IAL) { /* arbitration lost */
+			i2c_imx_evt_put(&i2c_imx->events, EVT_AL);
+		} else {
+			dev_dbg(&i2c_imx->adapter.dev, "slave interrupt");
+			i2c_imx_evt_put(&i2c_imx->events, EVT_SI);
+			wake_up(&i2c_imx->state_queue);
+		}
 
-	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	if (temp & I2SR_IIF) {
-		/* save status register */
-		i2c_imx->i2csr = temp;
-		temp &= ~I2SR_IIF;
-		temp |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
-		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
-		wake_up(&i2c_imx->queue);
 		return IRQ_HANDLED;
 	}
 
@@ -901,7 +1550,14 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx);
-	if (result) {
+	if (result == -ETIMEDOUT) {
+		/*
+		 * Recovery is not started on arbitration lost, since it can
+		 * break slave transfer. But in case of "bus timeout" recovery
+		 * it could be useful to bring controller out of a
+		 * "strange state".
+		 */
+		dev_dbg(&i2c_imx->adapter.dev, "call bus recovery");
 		if (i2c_imx->adapter.bus_recovery_info) {
 			i2c_recover_bus(&i2c_imx->adapter);
 			result = i2c_imx_start(i2c_imx);
@@ -1046,6 +1702,10 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 static const struct i2c_algorithm i2c_imx_algo = {
 	.master_xfer	= i2c_imx_xfer,
 	.functionality	= i2c_imx_func,
+#ifdef CONFIG_I2C_SLAVE
+	.reg_slave	= i2c_imx_reg_slave,
+	.unreg_slave	= i2c_imx_unreg_slave,
+#endif
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
@@ -1116,6 +1776,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	/* Init queue */
 	init_waitqueue_head(&i2c_imx->queue);
+	init_waitqueue_head(&i2c_imx->state_queue);
 
 	/* Set up adapter data */
 	i2c_set_adapdata(&i2c_imx->adapter, i2c_imx);
@@ -1172,6 +1833,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto del_adapter;
 
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
+	/* init slave_state to IDLE */
+	i2c_imx->state = STATE_IDLE;
+	i2c_imx_evt_init(&i2c_imx->events);
+
 	return 0;   /* Return OK */
 
 del_adapter:
@@ -1202,6 +1867,9 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
 	i2c_del_adapter(&i2c_imx->adapter);
 
+	if (i2c_imx->slave_task)
+		kthread_stop(i2c_imx->slave_task);
+
 	if (i2c_imx->dma)
 		i2c_imx_dma_free(i2c_imx);
 
-- 
2.20.1

