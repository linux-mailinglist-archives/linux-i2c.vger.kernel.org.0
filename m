Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E1141BF13
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 08:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243585AbhI2GZD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 02:25:03 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55855 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244305AbhI2GZC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Sep 2021 02:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1632896602; x=1664432602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BAJtZX4ETCfE9vwWI8H61ErIFmillFXkpSC6W7VfoxM=;
  b=WuQHQSYNziMC1ZY27+mOotDO6Z+jRVa5uXnnJbvi7F9MUa2xlrHRMyRk
   Sfw4IvQd/DCgzwLwsoGRJoYt9ZdvnRTS9MPQkmTinWqeOPGlzgDs21bMd
   l1mRDRwRUiEkk2n7oNwBxdW8Hcy6WlVnd5pcRkGcDz6LmGPn1nlJPuLuA
   dghore2fR/5vocjK4rwy98kC3UF9h86DsMvTVSiDpSY/r2v0uFt2P+Ozi
   m7qAmRwDbtrSqe0ysfzyIJUWzD30K3IDQSU2D8bRU+hUP3/Hkg5p/aFFh
   KdXXiQlYBp2VsPOeEoCdA4Aq3xVlCpBCQPK/vGZZB7NipYo9oR8AWODMj
   w==;
IronPort-SDR: fSgzBbYgWR3TkqOQN6xYotCr2StfrCouAsGp/nVED6ngNyZwTRj09YfmiHudFF1Crxv4h+qVWk
 6OmmA7JLA55lRwOCX+Hd3msl3H6H0i88KwrJt3R5uS+gDbFdQjGchdW3f/ZG4hMmhp0TD01bna
 Xwvf/Fd2cl3Q3VnPwjs2wG584KcA9UQB7x/3T3EPq/ULJJYEK+ktXnVM/fvevsBmGg8w9rlz91
 1OXCn+G7PzqzQBZJLKx0JJS4XQlBFa+zn7ydCU2G3aNnvAoPPDO1UqAyEG817c51dMaBch1nAS
 m8A8tRjZUM2FC//FBgBhWxoo
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; 
   d="scan'208";a="133574728"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2021 23:23:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Sep 2021 23:23:21 -0700
Received: from CHE-LT-I17972LX.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 28 Sep 2021 23:23:16 -0700
From:   LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
To:     <wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <digetx@gmail.com>, <treding@nvidia.com>,
        <mirq-linux@rere.qmqm.pl>, <s.shtylyov@omp.ru>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <UNGLinuxDriver@microchip.com>
Subject: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C subsystem
Date:   Wed, 29 Sep 2021 11:52:14 +0530
Message-ID: <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Register the adapter to the I2C subsystem. Also the power management
routines are added.

Signed-off-by: LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
---
 MAINTAINERS                            |   7 +
 drivers/i2c/busses/Kconfig             |  10 +
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 616 +++++++++++++++++++++++++
 3 files changed, 633 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-mchp-pci1xxxx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..ebfa8a8749d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12331,6 +12331,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
 F:	drivers/mtd/nand/raw/atmel/*
 
+MICROCHIP PCI1XXXX I2C DRIVER
+M:	LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
+M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+
 MICROCHIP PWM DRIVER
 M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e17790fe35a7..7e5db3167aca 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1271,6 +1271,16 @@ config I2C_VIPERBOARD
 	  River Tech's viperboard.h for detailed meaning
 	  of the module parameters.
 
+config I2C_MCHP_PCI1XXXX
+	tristate "PCI1XXXX I2C Host Adapter support"
+	depends on PCI
+	help
+	  Say yes here to enable the I2C Host adapter support for the PCI1xxxx card
+	  This is a PCI to I2C adapter
+
+	  This driver can be built as a module. If so, the module will be
+	  called as i2c-mchp-pci1xxxx
+
 comment "Other I2C/SMBus bus drivers"
 
 config I2C_ACORN
diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
new file mode 100644
index 000000000000..5b51f20fe98e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -0,0 +1,616 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Microchip PCI1XXXX I2C adapter driver for PCIe Switch
+ * which has I2C controller in one of its downstream functions
+ *
+ * * Copyright 2020-2021 Microchip Technology, Inc
+ *
+ * Author: LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+
+#define PCI_VENDOR_ID_MICROCHIP 0x1055
+#define PCI12000_I2C_PID	0xA003
+#define PCI11010_I2C_PID	0xA013
+#define PCI11101_I2C_PID	0xA023
+#define PCI11400_I2C_PID	0xA033
+#define PCI11414_I2C_PID	0xA043
+
+#define DRV_NAME "i2c-mchp-pci1xxxx"
+
+#define BAR0    0
+#define BAR1    1
+#define BAR2    2
+#define BAR3    3
+
+#define SMBUS_MAST_CORE_ADDR_BASE	0x00000
+#define SMBUS_MAST_SYS_REG_ADDR_BASE	0x01000
+
+#define PCI1XXXX_IRQ_FLAGS 0
+
+/* SMB register space */
+#define SMB_CORE_CTRL_REG_OFF		(SMBUS_MAST_CORE_ADDR_BASE + 0x00)
+
+#define SMB_CORE_CTRL_ESO		(0x40)
+#define SMB_CORE_CTRL_FW_ACK		(0x10)
+
+#define SMB_CORE_STATUS_REG_OFF		(SMBUS_MAST_CORE_ADDR_BASE + 0x01)
+#define SMB_CORE_DATA_REG_OFF		(SMBUS_MAST_CORE_ADDR_BASE + 0x08)
+
+#define SMB_CORE_CMD_REG_OFF3		(SMBUS_MAST_CORE_ADDR_BASE + 0x0F)
+#define SMB_CORE_CMD_REG_OFF2		(SMBUS_MAST_CORE_ADDR_BASE + 0x0E)
+#define SMB_CORE_CMD_REG_OFF1		(SMBUS_MAST_CORE_ADDR_BASE + 0x0D)
+
+#define SMB_CORE_CMD_READM		(0x10)
+#define SMB_CORE_CMD_STOP		(0x04)
+#define SMB_CORE_CMD_START		(0x01)
+
+#define SMB_CORE_CMD_REG_OFF0		(SMBUS_MAST_CORE_ADDR_BASE + 0x0C)
+
+#define SMB_CORE_CMD_M_PROCEED		(0x02)
+#define SMB_CORE_CMD_M_RUN		(0x01)
+
+#define SMB_CORE_SR_HOLD_TIME_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x18)
+
+#define SR_HOLD_TIME_100KHZ		(0x85)
+#define SR_HOLD_TIME_400KHZ		(0x14)
+#define SR_HOLD_TIME_1000KHZ		(0x0B)
+
+#define SMB_CORE_COMPLETION_REG_OFF3	(SMBUS_MAST_CORE_ADDR_BASE + 0x23)
+#define SMB_CORE_COMPLETION_REG_OFF2	(SMBUS_MAST_CORE_ADDR_BASE + 0x22)
+#define SMB_CORE_COMPLETION_REG_OFF1	(SMBUS_MAST_CORE_ADDR_BASE + 0x21)
+#define SMB_CORE_COMPLETION_REG_OFF0	(SMBUS_MAST_CORE_ADDR_BASE + 0x20)
+
+#define COMPLETION_MDONE		(0x40)
+#define COMPLETION_IDLE			(0x20)
+#define COMPLETION_MNAKX		(0x01)
+
+#define SMB_CORE_IDLE_SCALING_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x24)
+
+#define SMB_IDLE_SCALING_100KHZ		(0x03E803C9)
+#define SMB_IDLE_SCALING_400KHZ		(0x01F4009D)
+#define SMB_IDLE_SCALING_1000KHZ	(0x01F4009D)
+
+#define SMB_CORE_CONFIG_REG3		(SMBUS_MAST_CORE_ADDR_BASE + 0x2B)
+
+#define SMB_CONFIG3_ENMI		(0x40)
+#define SMB_CONFIG3_ENIDI		(0x20)
+
+#define SMB_CORE_CONFIG_REG2		(SMBUS_MAST_CORE_ADDR_BASE + 0x2A)
+#define SMB_CORE_CONFIG_REG1		(SMBUS_MAST_CORE_ADDR_BASE + 0x29)
+
+#define SMB_CONFIG1_ASR			(0x80)
+#define SMB_CONFIG1_ENAB		(0x04)
+#define SMB_CONFIG1_RESET		(0x02)
+#define SMB_CONFIG1_FEN			(0x01)
+
+#define SMB_CORE_CONFIG_REG0		(SMBUS_MAST_CORE_ADDR_BASE + 0x28)
+
+#define SMB_CONFIG0_TCEN		(0x40)
+
+#define SMB_CORE_BUS_CLK_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x2C)
+
+#define BUS_CLK_100KHZ		(0x9A9C)
+#define BUS_CLK_400KHZ		(0x2329)
+#define BUS_CLK_1000KHZ		(0x0E0F)
+
+#define SMB_CORE_CLK_SYNC_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x3C)
+
+#define CLK_SYNC_100KHZ			(0x04)
+#define CLK_SYNC_400KHZ			(0x04)
+#define CLK_SYNC_1000KHZ		(0x04)
+
+#define SMB_CORE_DATA_TIMING_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x40)
+
+#define DATA_TIMING_100KHZ		(0x169D9D01)
+#define DATA_TIMING_400KHZ		(0x10141401)
+#define DATA_TIMING_1000KHZ		(0x060C0C01)
+
+#define SMB_CORE_TO_SCALING_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x44)
+
+#define TO_SCALING_100KHZ		(0xA79FC7CC)
+#define TO_SCALING_400KHZ		(0x8B9FC7CC)
+#define TO_SCALING_1000KHZ		(0x859FC7CC)
+
+#define I2C_SCL_PAD_CTRL_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x100)
+#define I2C_SDA_PAD_CTRL_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x101)
+
+#define I2C_FOD_EN		(0x10)
+#define I2C_PULL_UP_EN		(0x08)
+#define I2C_PULL_DOWN_EN	(0x04)
+#define I2C_INPUT_EN		(0x02)
+#define I2C_OUTPUT_EN		(0x01)
+
+#define SMBUS_CONTROL_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x200)
+
+#define CTL_RESET_COUNTERS	(0x08)
+#define CTL_TRANSFER_DIR	(0x04)
+#define CTL_HOST_FIFO_ENTRY	(0x02)
+#define CTL_RUN			(0x01)
+
+#define I2C_DIR_WRITE		(0)
+#define I2C_DIR_READ		(1)
+
+#define SMBUS_STATUS_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x204)
+
+#define STA_DMA_TERM		(0x80)
+#define STA_DMA_REQ		(0x40)
+#define STA_THRESHOLD		(0x04)
+#define STA_BUF_FULL		(0x02)
+#define STA_BUF_EMPTY		(0x01)
+
+#define SMBUS_INTR_STAT_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x208)
+
+#define INTR_STAT_DMA_TERM	(0x80)
+#define INTR_STAT_THRESHOLD	(0x04)
+#define INTR_STAT_BUF_FULL	(0x02)
+#define INTR_STAT_BUF_EMPTY	(0x01)
+
+#define SMBUS_INTR_MSK_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x20C)
+
+#define INTR_MSK_DMA_TERM	(0x80)
+#define INTR_MSK_THRESHOLD	(0x04)
+#define INTR_MSK_BUF_FULL	(0x02)
+#define INTR_MSK_BUF_EMPTY	(0x01)
+
+#define ALL_NW_LAYER_INTERRUPTS  (INTR_MSK_DMA_TERM | INTR_MSK_THRESHOLD |\
+				INTR_MSK_BUF_FULL | INTR_MSK_BUF_EMPTY)
+
+#define SMBUS_MCU_COUNTER_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x214)
+
+#define SMBUS_DEV_COUNTER_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x218)
+
+#define SMBALERT_MST_PAD_CTRL_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x230)
+
+#define SMBALERT_MST_PU		(0x01)
+
+#define SMBUS_GEN_INT_STAT_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x23C)
+
+#define SMBUS_GEN_INT_MASK_REG_OFF	(SMBUS_MAST_CORE_ADDR_BASE + 0x240)
+
+#define SMBALERT_INTR_MASK		(0x0400)
+#define I2C_BUF_MSTR_INTR_MASK		(0x0200)
+#define I2C_INTR_MASK			(0x0100)
+#define SMBALERT_WAKE_INTR_MASK		(0x0004)
+#define I2C_BUF_MSTR_WAKE_INTR_MASK	(0x0002)
+#define I2C_WAKE_INTR_MASK		(0x0001)
+
+#define ALL_HIGH_LAYER_INTR     (SMBALERT_INTR_MASK | I2C_BUF_MSTR_INTR_MASK | \
+				I2C_INTR_MASK | SMBALERT_WAKE_INTR_MASK | \
+				I2C_BUF_MSTR_WAKE_INTR_MASK | \
+				I2C_WAKE_INTR_MASK)
+
+#define SMBUS_PCI_CTRL_REG	(SMBUS_MAST_CORE_ADDR_BASE + 0x244)
+
+#define SMBUS_D3_CLK_EN		(0x01)
+
+#define SMBUS_RESET_REG		(SMBUS_MAST_CORE_ADDR_BASE + 0x248)
+
+#define PERI_SMBUS_D3_RESET_DIS	(0x10000)
+
+#define SMBUS_MST_BUF		(SMBUS_MAST_CORE_ADDR_BASE + 0x280)
+
+#define SMBUS_MAST_BUF_MAX_SIZE	(0x80)
+
+#define I2C_FLAGS_DIRECT_MODE	(0x80)
+#define I2C_FLAGS_POLLING_MODE	(0x40)
+#define I2C_FLAGS_STOP		(0x20)
+#define I2C_FLAGS_SMB_BLK_READ	(0x10)
+
+#define PCI1XXXX_I2C_TIMEOUT	(msecs_to_jiffies(1000))
+
+/*
+ * struct pci1xxxx_i2c - private structure for the I2C controller
+ *
+ * @adap:	I2C adapter instance
+ * @dev:	pointer to device struct
+ * @i2c_base:	pci base address of the I2C ctrler
+ * @i2c_xfer_done: used for synchronisation between foreground & isr
+ * @lock:	spinlock used for synchronisation inside isr
+ * @freq:	frequency of I2C transfer
+ * @flags:	internal flags to store transfer conditions
+ * @irq:	irq number
+ */
+
+struct pci1xxxx_i2c {
+	struct i2c_adapter adap;
+	struct device *dev;
+	struct completion i2c_xfer_done;
+	void __iomem *i2c_base;
+	/* spinlock used for synchronisation inside isr */
+	spinlock_t lock;
+	int irq;
+	u32 freq;
+	u32 flags;
+};
+
+static irqreturn_t pci1xxxx_i2c_isr(int irq, void *dev)
+{
+	struct pci1xxxx_i2c *i2c = dev;
+	bool intr_handled = false;
+	unsigned long flags;
+	u16 regval;
+	u8 regval1;
+
+	spin_lock_irqsave(&i2c->lock, flags);
+	/* Mask the interrupt */
+	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
+	regval |= (SMBALERT_INTR_MASK | I2C_BUF_MSTR_INTR_MASK);
+	writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));
+	/*
+	 * Read the SMBus interrupt status register to see if the
+	 * DMA_TERM interrupt has caused this callback
+	 */
+	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF);
+
+	if (regval & I2C_BUF_MSTR_INTR_MASK) {
+		regval1 = readb(i2c->i2c_base + SMBUS_INTR_STAT_REG_OFF);
+		if (regval1 & INTR_STAT_DMA_TERM) {
+			complete(&i2c->i2c_xfer_done);
+			intr_handled = true;
+			writeb(INTR_STAT_DMA_TERM,
+			       (i2c->i2c_base + SMBUS_INTR_STAT_REG_OFF));
+		}
+		/* ACK the high level interrupt */
+		writew(I2C_BUF_MSTR_INTR_MASK,
+		       (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));
+	}
+
+	if (regval & SMBALERT_INTR_MASK) {
+		intr_handled = true;
+		/* ACK the high level interrupt */
+		writew(SMBALERT_INTR_MASK,
+		       (i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF));
+	}
+
+	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
+	/* UnMask the interrupt */
+	regval &= ~(I2C_BUF_MSTR_INTR_MASK | SMBALERT_INTR_MASK);
+	writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));
+
+	spin_unlock_irqrestore(&i2c->lock, flags);
+
+	if (intr_handled)
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
+
+static void pci1xxxx_i2c_config_padctrl(struct pci1xxxx_i2c *i2c, bool enable)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + I2C_SCL_PAD_CTRL_REG_OFF);
+	if (enable)
+		regval |= (I2C_INPUT_EN | I2C_OUTPUT_EN);
+	else
+		regval &=  ~(I2C_INPUT_EN | I2C_OUTPUT_EN);
+
+	writeb(regval, (i2c->i2c_base + I2C_SCL_PAD_CTRL_REG_OFF));
+
+	regval = readb(i2c->i2c_base + I2C_SDA_PAD_CTRL_REG_OFF);
+	if (enable)
+		regval |= (I2C_INPUT_EN | I2C_OUTPUT_EN);
+	else
+		regval &=  ~(I2C_INPUT_EN | I2C_OUTPUT_EN);
+
+	writeb(regval, (i2c->i2c_base + I2C_SDA_PAD_CTRL_REG_OFF));
+}
+
+static void pci1xxxx_i2c_set_mode(struct pci1xxxx_i2c *i2c)
+{
+	u8 regval;
+
+	regval = readb(i2c->i2c_base + SMBUS_CONTROL_REG_OFF);
+	if (i2c->flags & I2C_FLAGS_DIRECT_MODE)
+		regval &= ~CTL_HOST_FIFO_ENTRY;
+	else
+		regval |= CTL_HOST_FIFO_ENTRY;
+
+	writeb(regval, (i2c->i2c_base + SMBUS_CONTROL_REG_OFF));
+}
+
+static void pci1xxxx_ack_high_level_intr(struct pci1xxxx_i2c *i2c, u16 intr_msk)
+{
+	writew(intr_msk, i2c->i2c_base + SMBUS_GEN_INT_STAT_REG_OFF);
+}
+
+static void pci1xxxx_i2c_config_high_level_intr(struct pci1xxxx_i2c *i2c,
+						u16 intr_msk, bool enable)
+{
+	u16 regval;
+
+	regval = readw(i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF);
+	if (enable)
+		regval &= ~(intr_msk);
+	else
+		regval |= intr_msk;
+	writew(regval, (i2c->i2c_base + SMBUS_GEN_INT_MASK_REG_OFF));
+}
+
+static void pci1xxxx_i2c_configure_core_reg(struct pci1xxxx_i2c *i2c, bool enable)
+{
+	u8 regval;
+	u8 regval1;
+
+	regval = readb(i2c->i2c_base + SMB_CORE_CONFIG_REG1);
+	regval1 = readb(i2c->i2c_base + SMB_CORE_CONFIG_REG3);
+	if (enable) {
+		regval |= (SMB_CONFIG1_ENAB | SMB_CONFIG1_FEN);
+		regval1 |= (SMB_CONFIG3_ENMI | SMB_CONFIG3_ENIDI);
+	} else {
+		regval &= ~(SMB_CONFIG1_ENAB | SMB_CONFIG1_FEN);
+		regval1 &= ~(SMB_CONFIG3_ENMI | SMB_CONFIG3_ENIDI);
+	}
+
+	writeb(regval, (i2c->i2c_base + SMB_CORE_CONFIG_REG1));
+	writeb(regval1, (i2c->i2c_base + SMB_CORE_CONFIG_REG3));
+}
+
+static void pci1xxxx_i2c_set_freq(struct pci1xxxx_i2c *i2c)
+{
+	/*
+	 * The SMB core needs specific values to be set in the BUS_CLK register
+	 * for the corresponding frequency
+	 */
+	switch (i2c->freq) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		writeb(SR_HOLD_TIME_100KHZ,
+		       (i2c->i2c_base + SMB_CORE_SR_HOLD_TIME_REG_OFF));
+		writel(SMB_IDLE_SCALING_100KHZ,
+		       (i2c->i2c_base + SMB_CORE_IDLE_SCALING_REG_OFF));
+		writew(BUS_CLK_100KHZ,
+		       (i2c->i2c_base + SMB_CORE_BUS_CLK_REG_OFF));
+		writel(CLK_SYNC_100KHZ,
+		       (i2c->i2c_base + SMB_CORE_CLK_SYNC_REG_OFF));
+		writel(DATA_TIMING_100KHZ,
+		       (i2c->i2c_base + SMB_CORE_DATA_TIMING_REG_OFF));
+		writel(TO_SCALING_100KHZ,
+		       (i2c->i2c_base + SMB_CORE_TO_SCALING_REG_OFF));
+		break;
+
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		writeb(SR_HOLD_TIME_1000KHZ,
+		       (i2c->i2c_base + SMB_CORE_SR_HOLD_TIME_REG_OFF));
+		writel(SMB_IDLE_SCALING_1000KHZ,
+		       (i2c->i2c_base + SMB_CORE_IDLE_SCALING_REG_OFF));
+		writew(BUS_CLK_1000KHZ,
+		       (i2c->i2c_base + SMB_CORE_BUS_CLK_REG_OFF));
+		writel(CLK_SYNC_1000KHZ,
+		       (i2c->i2c_base + SMB_CORE_CLK_SYNC_REG_OFF));
+		writel(DATA_TIMING_1000KHZ,
+		       (i2c->i2c_base + SMB_CORE_DATA_TIMING_REG_OFF));
+		writel(TO_SCALING_1000KHZ,
+		       (i2c->i2c_base + SMB_CORE_TO_SCALING_REG_OFF));
+		break;
+
+	case I2C_MAX_FAST_MODE_FREQ:
+	default:
+		writeb(SR_HOLD_TIME_400KHZ,
+		       (i2c->i2c_base + SMB_CORE_SR_HOLD_TIME_REG_OFF));
+		writel(SMB_IDLE_SCALING_400KHZ,
+		       (i2c->i2c_base + SMB_CORE_IDLE_SCALING_REG_OFF));
+		writew(BUS_CLK_400KHZ,
+		       (i2c->i2c_base + SMB_CORE_BUS_CLK_REG_OFF));
+		writel(CLK_SYNC_400KHZ,
+		       (i2c->i2c_base + SMB_CORE_CLK_SYNC_REG_OFF));
+		writel(DATA_TIMING_400KHZ,
+		       (i2c->i2c_base + SMB_CORE_DATA_TIMING_REG_OFF));
+		writel(TO_SCALING_400KHZ,
+		       (i2c->i2c_base + SMB_CORE_TO_SCALING_REG_OFF));
+		break;
+	}
+}
+
+static void pci1xxxx_i2c_init(struct pci1xxxx_i2c *i2c)
+{
+	i2c->freq = I2C_MAX_FAST_MODE_FREQ;
+	pci1xxxx_i2c_set_freq(i2c);
+	pci1xxxx_i2c_config_padctrl(i2c, true);
+	i2c->flags |= I2C_FLAGS_DIRECT_MODE;
+	pci1xxxx_i2c_set_mode(i2c);
+
+	/*
+	 * added as a precaution since BUF_EMPTY in status register
+	 * also trigered an Interrupt
+	 */
+	writeb(STA_BUF_EMPTY, (i2c->i2c_base + SMBUS_STATUS_REG_OFF));
+
+	/* Configure core I2c control registers */
+	pci1xxxx_i2c_configure_core_reg(i2c, true);
+}
+
+/*
+ * We could have used I2C_FUNC_SMBUS_EMUL but that includes
+ * SMBUS_QUICK as well.We dnt support SMBUS_QUICK hence the
+ * need for a lengthy funcs callback
+ */
+
+static u32 pci1xxxx_i2c_get_funcs(struct i2c_adapter *adap)
+{
+	return (I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING
+		| I2C_FUNC_SMBUS_BLOCK_PROC_CALL
+		| I2C_FUNC_SMBUS_READ_BYTE | I2C_FUNC_SMBUS_WRITE_BYTE
+		| I2C_FUNC_SMBUS_READ_BYTE_DATA
+		| I2C_FUNC_SMBUS_WRITE_BYTE_DATA
+		| I2C_FUNC_SMBUS_READ_WORD_DATA
+		| I2C_FUNC_SMBUS_WRITE_WORD_DATA
+		| I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_READ_BLOCK_DATA
+		| I2C_FUNC_SMBUS_WRITE_BLOCK_DATA);
+}
+
+static const struct i2c_algorithm pci1xxxx_i2c_algo = {
+	.functionality = pci1xxxx_i2c_get_funcs,
+};
+
+static const struct i2c_adapter pci1xxxx_i2c_ops = {
+	.owner	= THIS_MODULE,
+	.name	= "Pci1xxxx I2c Adapter",
+	.algo	= &pci1xxxx_i2c_algo,
+};
+
+static int pci1xxxx_i2c_suspend(struct device *dev)
+{
+	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 regval;
+
+	i2c_mark_adapter_suspended(&i2c->adap);
+
+	pci1xxxx_ack_high_level_intr(i2c, ALL_HIGH_LAYER_INTR);
+	pci1xxxx_i2c_config_high_level_intr(i2c, ALL_HIGH_LAYER_INTR, false);
+
+	/*
+	 * Enable the PERST_DIS bit to mask the PERST from
+	 * resetting the core regs
+	 */
+	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
+	regval |= PERI_SMBUS_D3_RESET_DIS;
+	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
+
+	return 0;
+}
+
+static int pci1xxxx_i2c_resume(struct device *dev)
+{
+	struct pci1xxxx_i2c *i2c = dev_get_drvdata(dev);
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 regval;
+
+	i2c_mark_adapter_resumed(&i2c->adap);
+
+	regval = readl(i2c->i2c_base + SMBUS_RESET_REG);
+	regval &= ~PERI_SMBUS_D3_RESET_DIS;
+	writel(regval, i2c->i2c_base + SMBUS_RESET_REG);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
+			 pci1xxxx_i2c_resume);
+
+static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
+				  const struct pci_device_id *ent)
+{
+	struct pci1xxxx_i2c *i2c;
+	int ret;
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->dev = &pdev->dev;
+
+	pci_set_drvdata(pdev, i2c);
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	ret = pci_request_regions(pdev, pci_name(pdev));
+	if (ret)
+		return ret;
+
+	/*
+	 * We are getting the base address of the SMB core. SMB core uses
+	 * BAR0 and 32K is the size here pci_resource_len returns 32K by
+	 * reading BAR0
+	 */
+
+	i2c->i2c_base = pcim_iomap(pdev, BAR0, pci_resource_len(pdev, BAR0));
+	if (!i2c->i2c_base) {
+		ret = -ENOMEM;
+		goto err_free_region;
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		goto err_free_region;
+
+	i2c->irq = pci_irq_vector(pdev, 0);
+
+	/* Register the isr. we are not using any isr flags here */
+	ret = devm_request_irq(&pdev->dev, i2c->irq, pci1xxxx_i2c_isr,
+			       PCI1XXXX_IRQ_FLAGS,
+			       pci_name(pdev), i2c);
+	if (ret)
+		goto err_free_region;
+
+	pci_set_master(pdev);
+
+	init_completion(&i2c->i2c_xfer_done);
+
+	spin_lock_init(&i2c->lock);
+
+	pci1xxxx_i2c_init(i2c);
+
+	i2c->adap = pci1xxxx_i2c_ops;
+
+	i2c->adap.class = I2C_CLASS_SPD;
+	i2c->adap.dev.parent = &pdev->dev;
+
+	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
+		 "MCHP PCI1xxxx i2c adapter at %s", pci_name(pdev));
+
+	i2c_set_adapdata(&i2c->adap, i2c);
+
+	ret = i2c_add_adapter(&i2c->adap);
+	if (ret) {
+		dev_err(&pdev->dev, "i2c add adapter failed = %d\n", ret);
+		goto err_free_region;
+	}
+
+	return 0;
+
+err_free_region:
+	pci_release_regions(pdev);
+	return ret;
+}
+
+static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
+{
+	pci1xxxx_i2c_config_padctrl(i2c, false);
+	pci1xxxx_i2c_configure_core_reg(i2c, false);
+}
+
+static void pci1xxxx_i2c_remove_pci(struct pci_dev *pdev)
+{
+	struct pci1xxxx_i2c *i2c = pci_get_drvdata(pdev);
+
+	pci1xxxx_i2c_shutdown(i2c);
+	i2c_del_adapter(&i2c->adap);
+}
+
+static const struct pci_device_id pci1xxxx_i2c_pci_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI12000_I2C_PID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11010_I2C_PID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11101_I2C_PID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11400_I2C_PID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MICROCHIP, PCI11414_I2C_PID) },
+	{0, }
+};
+
+MODULE_DEVICE_TABLE(pci, pci1xxxx_i2c_pci_id_table);
+
+static struct pci_driver pci1xxxx_i2c_pci_driver = {
+	.name		= DRV_NAME,
+	.id_table	= pci1xxxx_i2c_pci_id_table,
+	.probe		= pci1xxxx_i2c_probe_pci,
+	.remove		= pci1xxxx_i2c_remove_pci,
+	.driver = {
+		.pm = &pci1xxxx_i2c_pm_ops,
+	},
+};
+
+module_pci_driver(pci1xxxx_i2c_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("LakshmiPraveen Kopparthi<LakshmiPraveen.Kopparthi@microchip.com>");
+MODULE_DESCRIPTION("I2C-Bus adapter driver for Microchip PCI1xxxx");
-- 
2.25.1

