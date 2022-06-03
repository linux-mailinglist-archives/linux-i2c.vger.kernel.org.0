Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44CC153C5D2
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jun 2022 09:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241804AbiFCHRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jun 2022 03:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiFCHRw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jun 2022 03:17:52 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FF7220C6;
        Fri,  3 Jun 2022 00:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654240667; x=1685776667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mVdata3CQ9U57UCSKFKmRRXNt83/NQ01Klygpq2WnYU=;
  b=stL2QymJS9z1vmk/wqSeCaE9YDK46Luvj40z7edLZXaYlhgdvQC+UEK6
   hFRoxz+OGemRheAu7Y2QsFjJPaAXyHEa5T214WizWuNJlvy7jtwxOTsbM
   2k7h5AW94snq8m717umiQBLyqkvQrrjtdpPJeXVYErXx9BD2kufqAPvi/
   +lsBpXQThWsHDlwSxZ5LClKZzcPSUL8C7z7QP/9vyI8xhOwf/B1KzCDwg
   +Ma8ntH4SgIJsjgGwiHfKCZrN1+NlE5NpiHrwcDiKur9QtMWHedJ3GLfJ
   WyYQ2TSrgs2Fdxz8mScFtnBfZhLMnv3vxw74V62Pou4s7dfG9T3Lo8BdS
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; 
   d="scan'208";a="166942644"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jun 2022 00:17:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 3 Jun 2022 00:17:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 3 Jun 2022 00:17:44 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v5] i2c: add support for microchip fpga i2c controllers
Date:   Fri, 3 Jun 2022 08:16:02 +0100
Message-ID: <20220603071601.1849562-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Microchip CoreI2C i2c controller support. This driver supports the
"hard" i2c controller on the Microchip PolarFire SoC & the basic feature
set for "soft" i2c controller implemtations in the FPGA fabric.

Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes from v4:
- reset the controller on xfer timeout
- sort the headers alphabetically

Changes from v3:
- update members in struct doc comment
- move mchp_corei2c_transfer in its caller
- change msg_len to a u16
- remove unused variable msg_read
- use adapater.timeout for completion
- dont use last_byte goto
- remove block on zero length messages
  (the hardware can do them, was a carryover from the baremetal driver)
- probe:
  - drop unneeded initialisation
  - use ret not val
  - explain shared irq
  - disallow 0 bus_clock_rate
  - include base in device name
  - dropped the duplicate "microchip" in the registered print
    (its in driver.name)

Changes from v2:
- Fixed whitespace in defines that I removed accidentally

Changes from v1:
- Use byte write and read functions
- Return IRQ_NONE and don't warn if not this drivers interrupt
- Add a clk_disable_unprepare to avoid leaking a clock in the probe
---
 drivers/i2c/busses/Kconfig              |  11 +
 drivers/i2c/busses/Makefile             |   1 +
 drivers/i2c/busses/i2c-microchip-core.c | 486 ++++++++++++++++++++++++
 3 files changed, 498 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-microchip-core.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a1bae59208e3..3d4d8e0e9de7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -781,6 +781,17 @@ config I2C_MESON
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Amlogic Meson family of SoCs.
 
+config I2C_MICROCHIP_CORE
+	tristate "Microchip FPGA I2C controller"
+	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on OF
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C interface on Microchip FPGAs.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called i2c-microchip-core.
+
 config I2C_MPC
 	tristate "MPC107/824x/85xx/512x/52xx/83xx/86xx"
 	depends on PPC
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 479f60e4ee3d..75869b189e43 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
+obj-$(CONFIG_I2C_MICROCHIP_CORE)	+= i2c-microchip-core.o
 obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
 obj-$(CONFIG_I2C_MT65XX)	+= i2c-mt65xx.o
 obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
diff --git a/drivers/i2c/busses/i2c-microchip-core.c b/drivers/i2c/busses/i2c-microchip-core.c
new file mode 100644
index 000000000000..6da8e9735c83
--- /dev/null
+++ b/drivers/i2c/busses/i2c-microchip-core.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip CoreI2C I2C controller driver
+ *
+ * Copyright (c) 2018 - 2022 Microchip Corporation. All rights reserved.
+ *
+ * Author: Daire McNamara <daire.mcnamara@microchip.com>
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ */
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+
+#define MICROCHIP_I2C_TIMEOUT (msecs_to_jiffies(1000))
+
+#define CORE_I2C_CTRL	(0x00)
+#define  CTRL_CR0	BIT(0)
+#define  CTRL_CR1	BIT(1)
+#define  CTRL_AA	BIT(2)
+#define  CTRL_SI	BIT(3)
+#define  CTRL_STO	BIT(4)
+#define  CTRL_STA	BIT(5)
+#define  CTRL_ENS1	BIT(6)
+#define  CTRL_CR2	BIT(7)
+
+#define STATUS_BUS_ERROR			(0x00)
+#define STATUS_M_START_SENT			(0x08)
+#define STATUS_M_REPEATED_START_SENT		(0x10)
+#define STATUS_M_SLAW_ACK			(0x18)
+#define STATUS_M_SLAW_NACK			(0x20)
+#define STATUS_M_TX_DATA_ACK			(0x28)
+#define STATUS_M_TX_DATA_NACK			(0x30)
+#define STATUS_M_ARB_LOST			(0x38)
+#define STATUS_M_SLAR_ACK			(0x40)
+#define STATUS_M_SLAR_NACK			(0x48)
+#define STATUS_M_RX_DATA_ACKED			(0x50)
+#define STATUS_M_RX_DATA_NACKED			(0x58)
+#define STATUS_S_SLAW_ACKED			(0x60)
+#define STATUS_S_ARB_LOST_SLAW_ACKED		(0x68)
+#define STATUS_S_GENERAL_CALL_ACKED		(0x70)
+#define STATUS_S_ARB_LOST_GENERAL_CALL_ACKED	(0x78)
+#define STATUS_S_RX_DATA_ACKED			(0x80)
+#define STATUS_S_RX_DATA_NACKED			(0x88)
+#define STATUS_S_GENERAL_CALL_RX_DATA_ACKED	(0x90)
+#define STATUS_S_GENERAL_CALL_RX_DATA_NACKED	(0x98)
+#define STATUS_S_RX_STOP			(0xA0)
+#define STATUS_S_SLAR_ACKED			(0xA8)
+#define STATUS_S_ARB_LOST_SLAR_ACKED		(0xB0)
+#define STATUS_S_TX_DATA_ACK			(0xB8)
+#define STATUS_S_TX_DATA_NACK			(0xC0)
+#define STATUS_LAST_DATA_ACK			(0xC8)
+#define STATUS_M_SMB_MASTER_RESET		(0xD0)
+#define STATUS_S_SCL_LOW_TIMEOUT		(0xD8) /* 25 ms */
+#define STATUS_NO_STATE_INFO			(0xF8)
+
+#define CORE_I2C_STATUS		(0x04)
+#define CORE_I2C_DATA		(0x08)
+#define WRITE_BIT		(0x0)
+#define READ_BIT		(0x1)
+#define SLAVE_ADDR_SHIFT	(1)
+#define CORE_I2C_SLAVE0_ADDR	(0x0c)
+#define GENERAL_CALL_BIT	(0x0)
+#define CORE_I2C_SMBUS		(0x10)
+#define SMBALERT_INT_ENB	(0x0)
+#define SMBSUS_INT_ENB		(0x1)
+#define SMBUS_ENB		(0x2)
+#define SMBALERT_NI_STATUS	(0x3)
+#define SMBALERT_NO_CTRL	(0x4)
+#define SMBSUS_NI_STATUS	(0x5)
+#define SMBSUS_NO_CTRL		(0x6)
+#define SMBUS_RESET		(0x7)
+#define CORE_I2C_FREQ		(0x14)
+#define CORE_I2C_GLITCHREG	(0x18)
+#define CORE_I2C_SLAVE1_ADDR	(0x1c)
+
+#define PCLK_DIV_960	(CTRL_CR2)
+#define PCLK_DIV_256	(0)
+#define PCLK_DIV_224	(CTRL_CR0)
+#define PCLK_DIV_192	(CTRL_CR1)
+#define PCLK_DIV_160	(CTRL_CR0 | CTRL_CR1)
+#define PCLK_DIV_120	(CTRL_CR0 | CTRL_CR2)
+#define PCLK_DIV_60	(CTRL_CR1 | CTRL_CR2)
+#define BCLK_DIV_8	(CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
+#define CLK_MASK	(CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
+
+/**
+ * struct mchp_corei2c_dev - Microchip CoreI2C device private data
+ *
+ * @base:		pointer to register struct
+ * @dev:		device reference
+ * @i2c_clk:		clock reference for i2c input clock
+ * @buf:		pointer to msg buffer for easier use
+ * @msg_complete:	xfer completion object
+ * @adapter:		core i2c abstraction
+ * @lock:		spinlock for IRQ synchronization
+ * @msg_err:		error code for completed message
+ * @bus_clk_rate:	current i2c bus clock rate
+ * @isr_status:		cached copy of local ISR status
+ * @msg_len:		number of bytes transferred in msg
+ * @addr:		address of the current slave
+ */
+struct mchp_corei2c_dev {
+	void __iomem *base;
+	struct device *dev;
+	struct clk *i2c_clk;
+	u8 *buf;
+	struct completion msg_complete;
+	struct i2c_adapter adapter;
+	spinlock_t lock; /* IRQ synchronization */
+	int msg_err;
+	u32 bus_clk_rate;
+	u32 isr_status;
+	u16 msg_len;
+	u8 addr;
+};
+
+static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
+
+	ctrl &= ~CTRL_ENS1;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+}
+
+static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
+
+	ctrl |= CTRL_ENS1;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+}
+
+static void mchp_corei2c_reset(struct mchp_corei2c_dev *idev)
+{
+	mchp_corei2c_core_disable(idev);
+	mchp_corei2c_core_enable(idev);
+}
+
+static inline void mchp_corei2c_stop(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
+
+	ctrl |= CTRL_STO;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+}
+
+static inline int mchp_corei2c_set_divisor(u32 rate,
+					   struct mchp_corei2c_dev *idev)
+{
+	u8 clkval, ctrl;
+
+	if (rate >= 960)
+		clkval = PCLK_DIV_960;
+	else if (rate >= 256)
+		clkval = PCLK_DIV_256;
+	else if (rate >= 224)
+		clkval = PCLK_DIV_224;
+	else if (rate >= 192)
+		clkval = PCLK_DIV_192;
+	else if (rate >= 160)
+		clkval = PCLK_DIV_160;
+	else if (rate >= 120)
+		clkval = PCLK_DIV_120;
+	else if (rate >= 60)
+		clkval = PCLK_DIV_60;
+	else if (rate >= 8)
+		clkval = BCLK_DIV_8;
+	else
+		return -EINVAL;
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl &= ~CLK_MASK;
+	ctrl |= clkval;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	if ((ctrl & CLK_MASK) != clkval)
+		return -EIO;
+
+	return 0;
+}
+
+static int mchp_corei2c_init(struct mchp_corei2c_dev *idev)
+{
+	u32 clk_rate = clk_get_rate(idev->i2c_clk);
+	u32 divisor = clk_rate / idev->bus_clk_rate;
+	int ret;
+
+	ret = mchp_corei2c_set_divisor(divisor, idev);
+	if (ret)
+		return ret;
+
+	mchp_corei2c_reset(idev);
+
+	return 0;
+}
+
+static void mchp_corei2c_empty_rx(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl;
+
+	if (idev->msg_len > 0) {
+		*idev->buf++ = readb(idev->base + CORE_I2C_DATA);
+		idev->msg_len--;
+	}
+
+	if (idev->msg_len == 0) {
+		ctrl = readb(idev->base + CORE_I2C_CTRL);
+		ctrl &= ~CTRL_AA;
+		writeb(ctrl, idev->base + CORE_I2C_CTRL);
+	}
+}
+
+static int mchp_corei2c_fill_tx(struct mchp_corei2c_dev *idev)
+{
+	if (idev->msg_len > 0)
+		writeb(*idev->buf++, idev->base + CORE_I2C_DATA);
+	idev->msg_len--;
+
+	return 0;
+}
+
+static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
+{
+	u32 status = idev->isr_status;
+	u8 ctrl;
+	bool last_byte = false, finished = false;
+
+	if (!idev->buf)
+		return IRQ_NONE;
+
+	switch (status) {
+	case STATUS_M_START_SENT:
+	case STATUS_M_REPEATED_START_SENT:
+		ctrl = readb(idev->base + CORE_I2C_CTRL);
+		ctrl &= ~CTRL_STA;
+		writeb(idev->addr, idev->base + CORE_I2C_DATA);
+		writeb(ctrl, idev->base + CORE_I2C_CTRL);
+		if (idev->msg_len <= 0)
+			finished = true;
+		break;
+	case STATUS_M_ARB_LOST:
+		idev->msg_err = -EAGAIN;
+		finished = true;
+		break;
+	case STATUS_M_SLAW_ACK:
+	case STATUS_M_TX_DATA_ACK:
+		if (idev->msg_len > 0)
+			mchp_corei2c_fill_tx(idev);
+		else
+			last_byte = true;
+		break;
+	case STATUS_M_TX_DATA_NACK:
+	case STATUS_M_SLAR_NACK:
+	case STATUS_M_SLAW_NACK:
+		idev->msg_err = -ENXIO;
+		last_byte = true;
+		break;
+	case STATUS_M_SLAR_ACK:
+		ctrl = readb(idev->base + CORE_I2C_CTRL);
+		if (idev->msg_len == 1u) {
+			ctrl &= ~CTRL_AA;
+			writeb(ctrl, idev->base + CORE_I2C_CTRL);
+		} else {
+			ctrl |= CTRL_AA;
+			writeb(ctrl, idev->base + CORE_I2C_CTRL);
+		}
+		if (idev->msg_len < 1u)
+			last_byte = true;
+		break;
+	case STATUS_M_RX_DATA_ACKED:
+		mchp_corei2c_empty_rx(idev);
+		break;
+	case STATUS_M_RX_DATA_NACKED:
+		mchp_corei2c_empty_rx(idev);
+		if (idev->msg_len == 0)
+			last_byte = true;
+		break;
+	default:
+		break;
+	}
+
+	/* On the last byte to be transmitted, send STOP */
+	if (last_byte)
+		mchp_corei2c_stop(idev);
+
+	if (last_byte || finished)
+		complete(&idev->msg_complete);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
+{
+	struct mchp_corei2c_dev *idev = _dev;
+	irqreturn_t ret = IRQ_NONE;
+	u8 ctrl;
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	if (ctrl & CTRL_SI) {
+		idev->isr_status = readb(idev->base + CORE_I2C_STATUS);
+		ret = mchp_corei2c_handle_isr(idev);
+	}
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl &= ~CTRL_SI;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	return ret;
+}
+
+static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
+				 struct i2c_msg *msg)
+{
+	u8 ctrl;
+	unsigned long time_left;
+
+	idev->addr = i2c_8bit_addr_from_msg(msg);
+	idev->msg_len = msg->len;
+	idev->buf = msg->buf;
+	idev->msg_err = 0;
+
+	reinit_completion(&idev->msg_complete);
+
+	mchp_corei2c_core_enable(idev);
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl |= CTRL_STA;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	time_left = wait_for_completion_timeout(&idev->msg_complete,
+						idev->adapter.timeout);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	return idev->msg_err;
+}
+
+static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			     int num)
+{
+	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
+	int i, ret;
+
+	for (i = 0; i < num; i++) {
+		ret = mchp_corei2c_xfer_msg(idev, msgs++);
+		if (ret)
+			return ret;
+	}
+
+	return num;
+}
+
+static u32 mchp_corei2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm mchp_corei2c_algo = {
+	.master_xfer = mchp_corei2c_xfer,
+	.functionality = mchp_corei2c_func,
+};
+
+static int mchp_corei2c_probe(struct platform_device *pdev)
+{
+	struct mchp_corei2c_dev *idev;
+	struct resource *res;
+	int irq, ret;
+
+	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
+	if (!idev)
+		return -ENOMEM;
+
+	idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(idev->base))
+		return PTR_ERR(idev->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq,
+				     "missing interrupt resource\n");
+
+	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(idev->i2c_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
+				     "missing clock\n");
+
+	idev->dev = &pdev->dev;
+	init_completion(&idev->msg_complete);
+	spin_lock_init(&idev->lock);
+
+	ret = device_property_read_u32(idev->dev, "clock-frequency",
+				       &idev->bus_clk_rate);
+	if (ret || !idev->bus_clk_rate) {
+		dev_info(&pdev->dev, "default to 100kHz\n");
+		idev->bus_clk_rate = 100000;
+	}
+
+	if (idev->bus_clk_rate > 400000)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "clock-frequency too high: %d\n",
+				     idev->bus_clk_rate);
+
+	/*
+	 * This driver supports both the hard peripherals & soft FPGA cores.
+	 * The hard peripherals do not have shared IRQs, but we don't have
+	 * control over what way the interrupts are wired for the soft cores.
+	 */
+	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
+			       pdev->name, idev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to claim irq %d\n", irq);
+
+	ret = clk_prepare_enable(idev->i2c_clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable clock\n");
+
+	ret = mchp_corei2c_init(idev);
+	if (ret) {
+		clk_disable_unprepare(idev->i2c_clk);
+		return dev_err_probe(&pdev->dev, ret, "failed to program clock divider\n");
+	}
+
+	i2c_set_adapdata(&idev->adapter, idev);
+	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
+		 "Microchip I2C hw bus at %08lx", (unsigned long)res->start);
+	idev->adapter.owner = THIS_MODULE;
+	idev->adapter.algo = &mchp_corei2c_algo;
+	idev->adapter.dev.parent = &pdev->dev;
+	idev->adapter.dev.of_node = pdev->dev.of_node;
+	idev->adapter.timeout = MICROCHIP_I2C_TIMEOUT;
+
+	platform_set_drvdata(pdev, idev);
+
+	ret = i2c_add_adapter(&idev->adapter);
+	if (ret) {
+		clk_disable_unprepare(idev->i2c_clk);
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "registered CoreI2C bus driver\n");
+
+	return 0;
+}
+
+static int mchp_corei2c_remove(struct platform_device *pdev)
+{
+	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(idev->i2c_clk);
+	i2c_del_adapter(&idev->adapter);
+
+	return 0;
+}
+
+static const struct of_device_id mchp_corei2c_of_match[] = {
+	{ .compatible = "microchip,mpfs-i2c" },
+	{ .compatible = "microchip,corei2c-rtl-v7" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
+
+static struct platform_driver mchp_corei2c_driver = {
+	.probe = mchp_corei2c_probe,
+	.remove = mchp_corei2c_remove,
+	.driver = {
+		.name = "microchip-corei2c",
+		.of_match_table = mchp_corei2c_of_match,
+	},
+};
+
+module_platform_driver(mchp_corei2c_driver);
+
+MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
+MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_LICENSE("GPL");
-- 
2.36.1

