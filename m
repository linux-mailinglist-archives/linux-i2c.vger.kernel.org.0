Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 734CFCEF6E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 01:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbfJGXNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Oct 2019 19:13:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:35426 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728980AbfJGXNX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Oct 2019 19:13:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 16:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; 
   d="scan'208";a="218109592"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2019 16:13:22 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 4/5] i2c: aspeed: add buffer mode transfer support
Date:   Mon,  7 Oct 2019 16:13:12 -0700
Message-Id: <20191007231313.4700-5-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Byte mode currently this driver uses makes lots of interrupt call
which isn't good for performance and it makes the driver very
timing sensitive. To improve performance of the driver, this commit
adds buffer mode transfer support which uses I2C SRAM buffer
instead of using a single byte buffer.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Tested-by: Tao Ren <taoren@fb.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 297 ++++++++++++++++++++++++++++----
 1 file changed, 263 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 40f6cf98d32e..37d1a7fa2f87 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -7,6 +7,7 @@
  *  Copyright 2017 Google, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -19,15 +20,24 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-/* I2C Register */
+/* I2C Global Registers */
+/* 0x00 : I2CG Interrupt Status Register  */
+/* 0x08 : I2CG Interrupt Target Assignment  */
+/* 0x0c : I2CG Global Control Register (AST2500)  */
+#define ASPEED_I2CG_GLOBAL_CTRL_REG			0x0c
+#define  ASPEED_I2CG_SRAM_BUFFER_EN			BIT(0)
+
+/* I2C Bus Registers */
 #define ASPEED_I2C_FUN_CTRL_REG				0x00
 #define ASPEED_I2C_AC_TIMING_REG1			0x04
 #define ASPEED_I2C_AC_TIMING_REG2			0x08
@@ -35,14 +45,12 @@
 #define ASPEED_I2C_INTR_STS_REG				0x10
 #define ASPEED_I2C_CMD_REG				0x14
 #define ASPEED_I2C_DEV_ADDR_REG				0x18
+#define ASPEED_I2C_BUF_CTRL_REG				0x1c
 #define ASPEED_I2C_BYTE_BUF_REG				0x20
 
-/* Global Register Definition */
-/* 0x00 : I2C Interrupt Status Register  */
-/* 0x08 : I2C Interrupt Target Assignment  */
-
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
+#define ASPEED_I2CD_BUFFER_PAGE_SEL_MASK		GENMASK(22, 20)
 #define ASPEED_I2CD_MULTI_MASTER_DIS			BIT(15)
 #define ASPEED_I2CD_SDA_DRIVE_1T_EN			BIT(8)
 #define ASPEED_I2CD_M_SDA_DRIVE_1T_EN			BIT(7)
@@ -102,6 +110,8 @@
 #define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
 
 /* Command Bit */
+#define ASPEED_I2CD_RX_BUFF_ENABLE			BIT(7)
+#define ASPEED_I2CD_TX_BUFF_ENABLE			BIT(6)
 #define ASPEED_I2CD_M_STOP_CMD				BIT(5)
 #define ASPEED_I2CD_M_S_RX_CMD_LAST			BIT(4)
 #define ASPEED_I2CD_M_RX_CMD				BIT(3)
@@ -112,6 +122,13 @@
 /* 0x18 : I2CD Slave Device Address Register   */
 #define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
 
+/* 0x1c : I2CD Buffer Control Register */
+/* Use 8-bits or 6-bits wide bit fileds to support both AST2400 and AST2500 */
+#define ASPEED_I2CD_BUF_RX_COUNT_MASK			GENMASK(31, 24)
+#define ASPEED_I2CD_BUF_RX_SIZE_MASK			GENMASK(23, 16)
+#define ASPEED_I2CD_BUF_TX_COUNT_MASK			GENMASK(15, 8)
+#define ASPEED_I2CD_BUF_OFFSET_MASK			GENMASK(5, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
 	ASPEED_I2C_MASTER_PENDING,
@@ -157,6 +174,11 @@ struct aspeed_i2c_bus {
 	int				master_xfer_result;
 	/* Multi-master */
 	bool				multi_master;
+	/* Buffer mode */
+	void __iomem			*buf_base;
+	size_t				buf_size;
+	u8				buf_offset;
+	u8				buf_page;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct i2c_client		*slave;
 	enum aspeed_i2c_slave_state	slave_state;
@@ -238,6 +260,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 {
 	u32 command, irq_handled = 0;
 	struct i2c_client *slave = bus->slave;
+	int i, len;
 	u8 value;
 
 	if (!slave)
@@ -260,7 +283,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was sent something. */
 	if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
-		value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
+		if (bus->buf_base &&
+		    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+		    !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
+			value = readb(bus->buf_base);
+		else
+			value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
 		/* Handle address frame. */
 		if (bus->slave_state == ASPEED_I2C_SLAVE_START) {
 			if (value & 0x1)
@@ -275,6 +303,20 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was asked to stop. */
 	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
+		if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+		    irq_status & ASPEED_I2CD_INTR_RX_DONE) {
+			if (bus->buf_base) {
+				len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+						readl(bus->base +
+						      ASPEED_I2C_BUF_CTRL_REG));
+				for (i = 0; i < len; i++) {
+					value = readb(bus->buf_base + i);
+					i2c_slave_event(slave,
+							I2C_SLAVE_WRITE_RECEIVED,
+							&value);
+				}
+			}
+		}
 		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
 		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
 	}
@@ -307,9 +349,36 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
 		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		if (bus->buf_base) {
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+					  bus->buf_size - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			writel(ASPEED_I2CD_RX_BUFF_ENABLE,
+			       bus->base + ASPEED_I2C_CMD_REG);
+		}
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		if (bus->buf_base) {
+			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_BUF_CTRL_REG));
+			for (i = 1; i < len; i++) {
+				value = readb(bus->buf_base + i);
+				i2c_slave_event(slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						&value);
+			}
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+					  bus->buf_size - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			writel(ASPEED_I2CD_RX_BUFF_ENABLE,
+			       bus->base + ASPEED_I2C_CMD_REG);
+		}
 		break;
 	case ASPEED_I2C_SLAVE_STOP:
 		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
@@ -335,6 +404,8 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 	u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
 	struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
 	u8 slave_addr = i2c_8bit_addr_from_msg(msg);
+	u8 wbuf[4];
+	int len;
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/*
@@ -353,12 +424,66 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 
 	if (msg->flags & I2C_M_RD) {
 		command |= ASPEED_I2CD_M_RX_CMD;
-		/* Need to let the hardware know to NACK after RX. */
-		if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
-			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+
+		if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
+			command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+
+			if (msg->len > bus->buf_size) {
+				len = bus->buf_size;
+			} else {
+				len = msg->len;
+				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+			}
+
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+					  len - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		} else {
+			/* Need to let the hardware know to NACK after RX. */
+			if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
+				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+		}
+	} else {
+		if (bus->buf_base) {
+			int i;
+
+			command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+
+			if (msg->len + 1 > bus->buf_size)
+				len = bus->buf_size;
+			else
+				len = msg->len + 1;
+
+			/*
+			 * Yeah, it looks clumsy but byte writings on a remapped
+			 * I2C SRAM cause corruptions so use this way to make
+			 * dword writings.
+			 */
+			wbuf[0] = slave_addr;
+			for (i = 1; i < len; i++) {
+				wbuf[i % 4] = msg->buf[i - 1];
+				if (i % 4 == 3)
+					writel(*(u32 *)wbuf,
+					       bus->buf_base + i - 3);
+			}
+			if (--i % 4 != 3)
+				writel(*(u32 *)wbuf,
+				       bus->buf_base + i - (i % 4));
+
+			bus->buf_index = len - 1;
+
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
+					  len - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		}
 	}
 
-	writel(slave_addr, bus->base + ASPEED_I2C_BYTE_BUF_REG);
+	if (!(command & ASPEED_I2CD_TX_BUFF_ENABLE))
+		writel(slave_addr, bus->base + ASPEED_I2C_BYTE_BUF_REG);
 	writel(command, bus->base + ASPEED_I2C_CMD_REG);
 }
 
@@ -398,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	u32 irq_handled = 0, command = 0;
 	struct i2c_msg *msg;
 	u8 recv_byte;
-	int ret;
+	int ret, len;
 
 	if (irq_status & ASPEED_I2CD_INTR_BUS_RECOVER_DONE) {
 		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
@@ -511,11 +636,43 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		/* fall through */
 	case ASPEED_I2C_MASTER_TX_FIRST:
 		if (bus->buf_index < msg->len) {
+			command = ASPEED_I2CD_M_TX_CMD;
+
+			if (bus->buf_base) {
+				u8 wbuf[4];
+				int i;
+
+				command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+
+				if (msg->len - bus->buf_index > bus->buf_size)
+					len = bus->buf_size;
+				else
+					len = msg->len - bus->buf_index;
+
+				for (i = 0; i < len; i++) {
+					wbuf[i % 4] = msg->buf[bus->buf_index
+							       + i];
+					if (i % 4 == 3)
+						writel(*(u32 *)wbuf,
+						       bus->buf_base + i - 3);
+				}
+				if (--i % 4 != 3)
+					writel(*(u32 *)wbuf,
+					       bus->buf_base + i - (i % 4));
+
+				bus->buf_index += len;
+
+				writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
+						  len - 1) |
+				       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+						  bus->buf_offset),
+				       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			} else {
+				writel(msg->buf[bus->buf_index++],
+				       bus->base + ASPEED_I2C_BYTE_BUF_REG);
+			}
+			writel(command, bus->base + ASPEED_I2C_CMD_REG);
 			bus->master_state = ASPEED_I2C_MASTER_TX;
-			writel(msg->buf[bus->buf_index++],
-			       bus->base + ASPEED_I2C_BYTE_BUF_REG);
-			writel(ASPEED_I2CD_M_TX_CMD,
-			       bus->base + ASPEED_I2C_CMD_REG);
 		} else {
 			aspeed_i2c_next_msg_or_stop(bus);
 		}
@@ -532,25 +689,56 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		}
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
 
-		recv_byte = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
-		msg->buf[bus->buf_index++] = recv_byte;
-
-		if (msg->flags & I2C_M_RECV_LEN) {
-			if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
-				bus->cmd_err = -EPROTO;
-				aspeed_i2c_do_stop(bus);
-				goto out_no_complete;
+		if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
+			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_BUF_CTRL_REG));
+			memcpy_fromio(msg->buf + bus->buf_index,
+				      bus->buf_base, len);
+			bus->buf_index += len;
+		} else {
+			recv_byte = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG)
+				    >> 8;
+			msg->buf[bus->buf_index++] = recv_byte;
+
+			if (msg->flags & I2C_M_RECV_LEN) {
+				if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
+					bus->cmd_err = -EPROTO;
+					aspeed_i2c_do_stop(bus);
+					goto out_no_complete;
+				}
+				msg->len = recv_byte +
+						((msg->flags & I2C_CLIENT_PEC) ?
+						2 : 1);
+				msg->flags &= ~I2C_M_RECV_LEN;
 			}
-			msg->len = recv_byte +
-					((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
-			msg->flags &= ~I2C_M_RECV_LEN;
 		}
 
 		if (bus->buf_index < msg->len) {
-			bus->master_state = ASPEED_I2C_MASTER_RX;
 			command = ASPEED_I2CD_M_RX_CMD;
-			if (bus->buf_index + 1 == msg->len)
-				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+			bus->master_state = ASPEED_I2C_MASTER_RX;
+			if (bus->buf_base) {
+				command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+
+				if (msg->len - bus->buf_index >
+				    bus->buf_size) {
+					len = bus->buf_size;
+				} else {
+					len = msg->len - bus->buf_index;
+					command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+				}
+
+				writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+						  len - 1) |
+				       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
+						  0) |
+				       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+						  bus->buf_offset),
+				       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			} else {
+				if (bus->buf_index + 1 == msg->len)
+					command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+			}
 			writel(command, bus->base + ASPEED_I2C_CMD_REG);
 		} else {
 			aspeed_i2c_next_msg_or_stop(bus);
@@ -890,6 +1078,9 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	if (ret < 0)
 		return ret;
 
+	fun_ctrl_reg |= FIELD_PREP(ASPEED_I2CD_BUFFER_PAGE_SEL_MASK,
+				   bus->buf_page);
+
 	if (of_property_read_bool(pdev->dev.of_node, "multi-master"))
 		bus->multi_master = true;
 	else
@@ -947,16 +1138,15 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct aspeed_i2c_bus *bus;
+	bool sram_enabled = true;
 	struct clk *parent_clk;
-	struct resource *res;
 	int irq, ret;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	bus->base = devm_ioremap_resource(&pdev->dev, res);
+	bus->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->base))
 		return PTR_ERR(bus->base);
 
@@ -990,6 +1180,45 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
 				match->data;
 
+	/*
+	 * Enable I2C SRAM in case of AST2500.
+	 * SRAM is enabled by default in AST2400 and AST2600.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "aspeed,ast2500-i2c-bus")) {
+		struct regmap *gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2500-i2c-gr");
+
+		if (IS_ERR(gr_regmap))
+			ret = PTR_ERR(gr_regmap);
+		else
+			ret = regmap_update_bits(gr_regmap,
+						 ASPEED_I2CG_GLOBAL_CTRL_REG,
+						 ASPEED_I2CG_SRAM_BUFFER_EN,
+						 ASPEED_I2CG_SRAM_BUFFER_EN);
+
+		if (ret)
+			sram_enabled = false;
+	}
+
+	if (sram_enabled) {
+		struct resource *res = platform_get_resource(pdev,
+							     IORESOURCE_MEM, 1);
+
+		if (res && resource_size(res) >= 2)
+			bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
+
+		if (!IS_ERR_OR_NULL(bus->buf_base)) {
+			bus->buf_size = resource_size(res);
+			if (of_device_is_compatible(pdev->dev.of_node,
+						    "aspeed,ast2400-i2c-bus")) {
+				bus->buf_page = ((res->start >> 8) &
+						 GENMASK(3, 0)) - 8;
+				bus->buf_offset = (res->start >> 2) &
+						  ASPEED_I2CD_BUF_OFFSET_MASK;
+			}
+		}
+	}
+
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
 	init_completion(&bus->cmd_complete);
@@ -1026,8 +1255,8 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bus);
 
-	dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
-		 bus->adap.nr, irq);
+	dev_info(bus->dev, "i2c bus %d registered (%s mode), irq %d\n",
+		 bus->adap.nr, bus->buf_base ? "buffer" : "byte", irq);
 
 	return 0;
 }
-- 
2.23.0

