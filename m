Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE222F23F8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 01:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbhALA2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 19:28:53 -0500
Received: from mga04.intel.com ([192.55.52.120]:60546 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbhALA2w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 19:28:52 -0500
IronPort-SDR: VkLP8SUekwIYfmvLmB8u1eldv/lZjQQ//LsdgBqqb9qIft7EMS91/iKoR6mMA9rn8OVbYyG+8U
 +zaeH0v6O90A==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="175379161"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="175379161"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2021 16:27:04 -0800
IronPort-SDR: WrFrlVEvPWo+8pShdQUcjZtMc0lDcpCajU+0y/jBteBtEWStF0pp7Pbu7rWxr7Igo5slDPjIXZ
 DinZWb4LwFjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; 
   d="scan'208";a="348273572"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2021 16:27:04 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 4/4] i2c: aspeed: add DMA mode transfer support
Date:   Mon, 11 Jan 2021 16:37:49 -0800
Message-Id: <20210112003749.10565-5-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This commit adds DMA mode transfer support.

Only AST2500 and later versions supports DMA mode.

AST2500 has these restrictions:
  - If one of these controllers is enabled
      * UHCI host controller
      * MCTP controller
    I2C has to use buffer mode or byte mode instead
    since these controllers run only in DMA mode and
    I2C is sharing the same DMA H/W with them.
  - If one of these controllers uses DMA mode, I2C
    can't use DMA mode
      * SD/eMMC
      * Port80 snoop

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v1:
- Updated commit message and comments.
- Refined using abstract functions.

 drivers/i2c/busses/i2c-aspeed.c | 258 ++++++++++++++++++++++++++------
 1 file changed, 215 insertions(+), 43 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 223885e7a62f..717d3ef68da2 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -10,6 +10,8 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -47,6 +49,8 @@
 #define ASPEED_I2C_DEV_ADDR_REG				0x18
 #define ASPEED_I2C_BUF_CTRL_REG				0x1c
 #define ASPEED_I2C_BYTE_BUF_REG				0x20
+#define ASPEED_I2C_DMA_ADDR_REG				0x24
+#define ASPEED_I2C_DMA_LEN_REG				0x28
 
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
@@ -111,6 +115,8 @@
 #define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
 
 /* Command Bit */
+#define ASPEED_I2CD_RX_DMA_ENABLE			BIT(9)
+#define ASPEED_I2CD_TX_DMA_ENABLE			BIT(8)
 #define ASPEED_I2CD_RX_BUFF_ENABLE			BIT(7)
 #define ASPEED_I2CD_TX_BUFF_ENABLE			BIT(6)
 #define ASPEED_I2CD_M_STOP_CMD				BIT(5)
@@ -136,6 +142,14 @@
 #define ASPEED_I2CD_BUF_TX_COUNT_MASK			GENMASK(15, 8)
 #define ASPEED_I2CD_BUF_OFFSET_MASK			GENMASK(5, 0)
 
+/* 0x24 : I2CD DMA Mode Buffer Address Register */
+#define ASPEED_I2CD_DMA_ADDR_MASK			GENMASK(31, 2)
+#define ASPEED_I2CD_DMA_ALIGN				4
+
+/* 0x28 : I2CD DMA Transfer Length Register */
+#define ASPEED_I2CD_DMA_LEN_SHIFT			0
+#define ASPEED_I2CD_DMA_LEN_MASK			GENMASK(11, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
 	ASPEED_I2C_MASTER_PENDING,
@@ -185,6 +199,12 @@ struct aspeed_i2c_bus {
 	void __iomem			*buf_base;
 	u8				buf_offset;
 	u8				buf_page;
+	/* DMA mode */
+	struct dma_pool			*dma_pool;
+	dma_addr_t			dma_handle;
+	u8				*dma_buf;
+	size_t				dma_len;
+	/* Buffer/DMA mode */
 	size_t				buf_size;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct i2c_client		*slave;
@@ -267,9 +287,13 @@ static inline void
 aspeed_i2c_slave_handle_rx_done(struct aspeed_i2c_bus *bus, u32 irq_status,
 				u8 *value)
 {
-	if (bus->buf_base &&
+	if (bus->dma_buf &&
 	    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
 	    !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
+		*value = bus->dma_buf[0];
+	else if (bus->buf_base &&
+		 bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+		 !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
 		*value = readb(bus->buf_base);
 	else
 		*value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
@@ -283,7 +307,18 @@ aspeed_i2c_slave_handle_normal_stop(struct aspeed_i2c_bus *bus, u32 irq_status,
 
 	if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
 	    irq_status & ASPEED_I2CD_INTR_RX_DONE) {
-		if (bus->buf_base) {
+		if (bus->dma_buf) {
+			len = bus->buf_size -
+			      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_DMA_LEN_REG));
+			for (i = 0; i < len; i++) {
+				*value = bus->dma_buf[i];
+				i2c_slave_event(bus->slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						value);
+			}
+		} else if (bus->buf_base) {
 			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 					readl(bus->base +
 					      ASPEED_I2C_BUF_CTRL_REG));
@@ -300,7 +335,14 @@ aspeed_i2c_slave_handle_normal_stop(struct aspeed_i2c_bus *bus, u32 irq_status,
 static inline void
 aspeed_i2c_slave_handle_write_requested(struct aspeed_i2c_bus *bus, u8 *value)
 {
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, bus->buf_size),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		writel(ASPEED_I2CD_RX_DMA_ENABLE,
+		       bus->base + ASPEED_I2C_CMD_REG);
+	} else if (bus->buf_base) {
 		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
 				  bus->buf_size - 1) |
 		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
@@ -316,7 +358,23 @@ aspeed_i2c_slave_handle_write_received(struct aspeed_i2c_bus *bus, u8 *value)
 {
 	int i, len;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		len = bus->buf_size -
+		      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+				readl(bus->base +
+				      ASPEED_I2C_DMA_LEN_REG));
+		for (i = 1; i < len; i++) {
+			*value = bus->dma_buf[i];
+			i2c_slave_event(bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+					value);
+		}
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, bus->buf_size),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		writel(ASPEED_I2CD_RX_DMA_ENABLE,
+		       bus->base + ASPEED_I2C_CMD_REG);
+	} else if (bus->buf_base) {
 		len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 				readl(bus->base +
 				      ASPEED_I2C_BUF_CTRL_REG));
@@ -446,7 +504,15 @@ aspeed_i2c_prepare_rx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
 		command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 	}
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		command |= ASPEED_I2CD_RX_DMA_ENABLE;
+
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		bus->dma_len = len;
+	} else {
 		command |= ASPEED_I2CD_RX_BUFF_ENABLE;
 
 		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK, len - 1) |
@@ -469,7 +535,18 @@ aspeed_i2c_prepare_tx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
 	else
 		len = msg->len + 1;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		command |= ASPEED_I2CD_TX_DMA_ENABLE;
+
+		bus->dma_buf[0] = slave_addr;
+		memcpy(bus->dma_buf + 1, msg->buf, len);
+
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		bus->dma_len = len;
+	} else {
 		u8 wbuf[4];
 		int i;
 
@@ -522,18 +599,19 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 	if (msg->flags & I2C_M_RD) {
 		command |= ASPEED_I2CD_M_RX_CMD;
 		if (!(msg->flags & I2C_M_RECV_LEN)) {
-			if (msg->len && bus->buf_base)
+			if (msg->len && (bus->dma_buf || bus->buf_base))
 				command |= aspeed_i2c_prepare_rx_buf(bus, msg);
 
 			/* Need to let the hardware know to NACK after RX. */
 			if (msg->len <= 1)
 				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 		}
-	} else if (msg->len && bus->buf_base) {
+	} else if (msg->len && (bus->dma_buf || bus->buf_base)) {
 		command |= aspeed_i2c_prepare_tx_buf(bus, msg);
 	}
 
-	if (!(command & ASPEED_I2CD_TX_BUFF_ENABLE))
+	if (!(command & (ASPEED_I2CD_TX_BUFF_ENABLE |
+			 ASPEED_I2CD_TX_DMA_ENABLE)))
 		writel(i2c_8bit_addr_from_msg(msg),
 		       bus->base + ASPEED_I2C_BYTE_BUF_REG);
 	writel(command, bus->base + ASPEED_I2C_CMD_REG);
@@ -576,38 +654,51 @@ aspeed_i2c_master_handle_tx_first(struct aspeed_i2c_bus *bus,
 {
 	u32 command = 0;
 
-	if (bus->buf_base) {
-		u8 wbuf[4];
+	if (bus->dma_buf || bus->buf_base) {
 		int len;
-		int i;
 
 		if (msg->len - bus->buf_index > bus->buf_size)
 			len = bus->buf_size;
 		else
 			len = msg->len - bus->buf_index;
 
-		command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+		if (bus->dma_buf) {
+			command |= ASPEED_I2CD_TX_DMA_ENABLE;
 
-		if (msg->len - bus->buf_index > bus->buf_size)
-			len = bus->buf_size;
-		else
-			len = msg->len - bus->buf_index;
+			memcpy(bus->dma_buf, msg->buf + bus->buf_index, len);
 
-		for (i = 0; i < len; i++) {
-			wbuf[i % 4] = msg->buf[bus->buf_index + i];
-			if (i % 4 == 3)
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			bus->dma_len = len;
+		} else {
+			u8 wbuf[4];
+			int i;
+
+			command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+
+			if (msg->len - bus->buf_index > bus->buf_size)
+				len = bus->buf_size;
+			else
+				len = msg->len - bus->buf_index;
+
+			for (i = 0; i < len; i++) {
+				wbuf[i % 4] = msg->buf[bus->buf_index + i];
+				if (i % 4 == 3)
+					writel(*(u32 *)wbuf,
+					       bus->buf_base + i - 3);
+			}
+			if (--i % 4 != 3)
 				writel(*(u32 *)wbuf,
-				       bus->buf_base + i - 3);
-		}
-		if (--i % 4 != 3)
-			writel(*(u32 *)wbuf,
-			       bus->buf_base + i - (i % 4));
+				       bus->buf_base + i - (i % 4));
 
-		writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
-				  len - 1) |
-		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
-				  bus->buf_offset),
-		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
+					  len - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		}
 
 		bus->buf_index += len;
 	} else {
@@ -624,7 +715,14 @@ aspeed_i2c_master_handle_rx(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
 	u8 recv_byte;
 	int len;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		len = bus->dma_len -
+		      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+				readl(bus->base + ASPEED_I2C_DMA_LEN_REG));
+
+		memcpy(msg->buf + bus->buf_index, bus->dma_buf, len);
+		bus->buf_index += len;
+	} else if (bus->buf_base) {
 		len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 				readl(bus->base + ASPEED_I2C_BUF_CTRL_REG));
 		memcpy_fromio(msg->buf + bus->buf_index, bus->buf_base, len);
@@ -641,7 +739,7 @@ aspeed_i2c_master_handle_rx_next(struct aspeed_i2c_bus *bus,
 {
 	u32 command = 0;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf || bus->buf_base) {
 		int len;
 
 		if (msg->len - bus->buf_index > bus->buf_size) {
@@ -651,14 +749,24 @@ aspeed_i2c_master_handle_rx_next(struct aspeed_i2c_bus *bus,
 			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 		}
 
-		command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+		if (bus->dma_buf) {
+			command |= ASPEED_I2CD_RX_DMA_ENABLE;
 
-		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
-				  len - 1) |
-		       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, 0) |
-		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
-				  bus->buf_offset),
-		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			bus->dma_len = len;
+		} else {
+			command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+					  len - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, 0) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		}
 	} else {
 		if (bus->buf_index + 1 == msg->len)
 			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
@@ -1243,7 +1351,58 @@ static void aspeed_i2c_set_xfer_mode(struct aspeed_i2c_bus *bus)
 			sram_enabled = false;
 	}
 
+	/*
+	 * AST2400 doesn't support DMA mode.
+	 * AST2500 supports DMA mode under some restrictions:
+	 * I2C is sharing the DMA H/W with UHCI host controller and MCTP
+	 * controller. Since those controllers operate with DMA mode only, I2C
+	 * has to use buffer mode or byte mode instead if one of those
+	 * controllers is enabled. Also make sure that if SD/eMMC or Port80
+	 * snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
+	 * use DMA mode.
+	 */
 	if (sram_enabled) {
+		if (of_device_is_compatible(pdev->dev.of_node,
+					    "aspeed,ast2400-i2c-bus") ||
+		    (of_device_is_compatible(pdev->dev.of_node,
+					      "aspeed,ast2500-i2c-bus") &&
+		     IS_ENABLED(CONFIG_USB_UHCI_ASPEED))) {
+			sram_enabled = false;
+		} else {
+			u32 dma_len_max = ASPEED_I2CD_DMA_LEN_MASK >>
+					  ASPEED_I2CD_DMA_LEN_SHIFT;
+
+			ret = device_property_read_u32(&pdev->dev,
+						       "aspeed,dma-buf-size",
+						       &bus->buf_size);
+			if (!ret && bus->buf_size > dma_len_max)
+				bus->buf_size = dma_len_max;
+		}
+	}
+
+	if (bus->buf_size) {
+		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+			dev_warn(&pdev->dev, "No suitable DMA available\n");
+		} else {
+			bus->dma_pool = dma_pool_create("i2c-aspeed",
+							&pdev->dev,
+							bus->buf_size,
+							ASPEED_I2CD_DMA_ALIGN,
+							0);
+			if (bus->dma_pool)
+				bus->dma_buf = dma_pool_alloc(bus->dma_pool,
+							      GFP_KERNEL,
+							      &bus->dma_handle);
+
+			if (!bus->dma_buf) {
+				dev_warn(&pdev->dev,
+					 "Cannot allocate DMA buffer\n");
+				dma_pool_destroy(bus->dma_pool);
+			}
+		}
+	}
+
+	if (!bus->dma_buf && sram_enabled) {
 		struct resource *res = platform_get_resource(pdev,
 							     IORESOURCE_MEM, 1);
 
@@ -1349,24 +1508,33 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	 */
 	ret = aspeed_i2c_init(bus, pdev);
 	if (ret < 0)
-		return ret;
+		goto out_free_dma_buf;
 
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
 			       0, dev_name(&pdev->dev), bus);
 	if (ret < 0)
-		return ret;
+		goto out_free_dma_buf;
 
 	ret = i2c_add_adapter(&bus->adap);
 	if (ret < 0)
-		return ret;
+		goto out_free_dma_buf;
 
 	platform_set_drvdata(pdev, bus);
 
 	dev_info(bus->dev, "i2c bus %d registered (%s mode), irq %d\n",
-		 bus->adap.nr, bus->buf_base ? "buffer" : "byte", irq);
+		 bus->adap.nr, bus->dma_buf ? "dma" :
+					      bus->buf_base ? "buffer" : "byte",
+		 irq);
 
 	return 0;
+
+out_free_dma_buf:
+	if (bus->dma_buf)
+		dma_pool_free(bus->dma_pool, bus->dma_buf, bus->dma_handle);
+	dma_pool_destroy(bus->dma_pool);
+
+	return ret;
 }
 
 static int aspeed_i2c_remove_bus(struct platform_device *pdev)
@@ -1384,6 +1552,10 @@ static int aspeed_i2c_remove_bus(struct platform_device *pdev)
 
 	reset_control_assert(bus->rst);
 
+	if (bus->dma_buf)
+		dma_pool_free(bus->dma_pool, bus->dma_buf, bus->dma_handle);
+	dma_pool_destroy(bus->dma_pool);
+
 	i2c_del_adapter(&bus->adap);
 
 	return 0;
-- 
2.17.1

