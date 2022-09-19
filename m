Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B305BD4A6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 20:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiISSQB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 14:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiISSPy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 14:15:54 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D29546201;
        Mon, 19 Sep 2022 11:15:50 -0700 (PDT)
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 55D134474B;
        Mon, 19 Sep 2022 18:56:22 +0200 (CEST)
From:   tumic@gpxsee.org
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 2/3] Added Xilinx XDMA IP core driver
Date:   Mon, 19 Sep 2022 20:55:55 +0200
Message-Id: <20220919185556.5215-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919185556.5215-1-tumic@gpxsee.org>
References: <20220919185556.5215-1-tumic@gpxsee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Added support for the Xilinx XDMA PCIe DMA IP core. The XDMA IP core is used in
many FPGA PCIe card designs for DMA transfers between the PCIe card and the host
system. This driver can be incorporated into any PCIe card (that contains
the XDMA IP core) driver to initialize the XDMA HW and process DMA transfers.

The driver is originally based on the code provided by Xilinx at
https://github.com/Xilinx/dma_ip_drivers

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/dma/Kconfig              |    7 +
 drivers/dma/xilinx/Makefile      |    1 +
 drivers/dma/xilinx/xilinx_xdma.c | 2042 ++++++++++++++++++++++++++++++
 include/linux/dma/xilinx_xdma.h  |   44 +
 4 files changed, 2094 insertions(+)
 create mode 100644 drivers/dma/xilinx/xilinx_xdma.c
 create mode 100644 include/linux/dma/xilinx_xdma.h

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index a06d2a7627aa..932086cd5962 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -804,4 +804,11 @@ config DMATEST
 config DMA_ENGINE_RAID
 	bool
 
+config XILINX_XDMA
+	tristate "Xilinx XDMA Engine"
+	depends on PCI
+	select DMA_ENGINE
+	help
+	  Enable support for Xilinx XDMA IP controller.
+
 endif
diff --git a/drivers/dma/xilinx/Makefile b/drivers/dma/xilinx/Makefile
index 767bb45f641f..55e97686f8ea 100644
--- a/drivers/dma/xilinx/Makefile
+++ b/drivers/dma/xilinx/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_XILINX_DMA) += xilinx_dma.o
 obj-$(CONFIG_XILINX_ZYNQMP_DMA) += zynqmp_dma.o
 obj-$(CONFIG_XILINX_ZYNQMP_DPDMA) += xilinx_dpdma.o
+obj-$(CONFIG_XILINX_XDMA) += xilinx_xdma.o
diff --git a/drivers/dma/xilinx/xilinx_xdma.c b/drivers/dma/xilinx/xilinx_xdma.c
new file mode 100644
index 000000000000..9db637c25045
--- /dev/null
+++ b/drivers/dma/xilinx/xilinx_xdma.c
@@ -0,0 +1,2042 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2016-2021,  Xilinx, Inc.
+ * Copyright (c) 2022,       Digiteq Automotive s.r.o.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/mm.h>
+#include <linux/errno.h>
+#include <linux/sched.h>
+#include <linux/vmalloc.h>
+#include <linux/pci.h>
+#include <linux/dma/xilinx_xdma.h>
+
+
+static unsigned int enable_credit_mp = 1;
+module_param(enable_credit_mp, uint, 0644);
+MODULE_PARM_DESC(enable_credit_mp,
+		 "Set 0 to disable credit feature, default is 1 (enabled)");
+
+#define XDMA_BAR_SIZE	0x8000UL
+
+#define XDMA_CHANNEL_NUM_MAX	4
+#define XDMA_ENG_IRQ_NUM	1
+#define XDMA_MAX_ADJ_BLOCK_SIZE	0x40
+#define XDMA_PAGE_SIZE		0x1000
+#define RX_STATUS_EOP 1
+
+#define XDMA_OFS_INT_CTRL	0x2000UL
+#define XDMA_OFS_CONFIG		0x3000UL
+
+#define XDMA_TRANSFER_MAX_DESC	2048
+
+#define XDMA_DESC_BLEN_BITS	28
+#define XDMA_DESC_BLEN_MAX	((1 << (XDMA_DESC_BLEN_BITS)) - 1)
+
+/* bits of the SG DMA control register */
+#define XDMA_CTRL_RUN_STOP			(1UL << 0)
+#define XDMA_CTRL_IE_DESC_STOPPED		(1UL << 1)
+#define XDMA_CTRL_IE_DESC_COMPLETED		(1UL << 2)
+#define XDMA_CTRL_IE_DESC_ALIGN_MISMATCH	(1UL << 3)
+#define XDMA_CTRL_IE_MAGIC_STOPPED		(1UL << 4)
+#define XDMA_CTRL_IE_IDLE_STOPPED		(1UL << 6)
+#define XDMA_CTRL_IE_READ_ERROR			(0x1FUL << 9)
+#define XDMA_CTRL_IE_DESC_ERROR			(0x1FUL << 19)
+#define XDMA_CTRL_NON_INCR_ADDR			(1UL << 25)
+#define XDMA_CTRL_POLL_MODE_WB			(1UL << 26)
+#define XDMA_CTRL_STM_MODE_WB			(1UL << 27)
+
+/* bits of the SG DMA status register */
+#define XDMA_STAT_BUSY			(1UL << 0)
+#define XDMA_STAT_DESC_STOPPED		(1UL << 1)
+#define XDMA_STAT_DESC_COMPLETED	(1UL << 2)
+#define XDMA_STAT_ALIGN_MISMATCH	(1UL << 3)
+#define XDMA_STAT_MAGIC_STOPPED		(1UL << 4)
+#define XDMA_STAT_INVALID_LEN		(1UL << 5)
+#define XDMA_STAT_IDLE_STOPPED		(1UL << 6)
+
+#define XDMA_STAT_COMMON_ERR_MASK \
+	(XDMA_STAT_ALIGN_MISMATCH | XDMA_STAT_MAGIC_STOPPED | \
+	 XDMA_STAT_INVALID_LEN)
+
+/* desc_error, C2H & H2C */
+#define XDMA_STAT_DESC_UNSUPP_REQ	(1UL << 19)
+#define XDMA_STAT_DESC_COMPL_ABORT	(1UL << 20)
+#define XDMA_STAT_DESC_PARITY_ERR	(1UL << 21)
+#define XDMA_STAT_DESC_HEADER_EP	(1UL << 22)
+#define XDMA_STAT_DESC_UNEXP_COMPL	(1UL << 23)
+
+#define XDMA_STAT_DESC_ERR_MASK	\
+	(XDMA_STAT_DESC_UNSUPP_REQ | XDMA_STAT_DESC_COMPL_ABORT | \
+	 XDMA_STAT_DESC_PARITY_ERR | XDMA_STAT_DESC_HEADER_EP | \
+	 XDMA_STAT_DESC_UNEXP_COMPL)
+
+/* read error: H2C */
+#define XDMA_STAT_H2C_R_UNSUPP_REQ	(1UL << 9)
+#define XDMA_STAT_H2C_R_COMPL_ABORT	(1UL << 10)
+#define XDMA_STAT_H2C_R_PARITY_ERR	(1UL << 11)
+#define XDMA_STAT_H2C_R_HEADER_EP	(1UL << 12)
+#define XDMA_STAT_H2C_R_UNEXP_COMPL	(1UL << 13)
+
+#define XDMA_STAT_H2C_R_ERR_MASK	\
+	(XDMA_STAT_H2C_R_UNSUPP_REQ | XDMA_STAT_H2C_R_COMPL_ABORT | \
+	 XDMA_STAT_H2C_R_PARITY_ERR | XDMA_STAT_H2C_R_HEADER_EP | \
+	 XDMA_STAT_H2C_R_UNEXP_COMPL)
+
+/* write error, H2C only */
+#define XDMA_STAT_H2C_W_DECODE_ERR	(1UL << 14)
+#define XDMA_STAT_H2C_W_SLAVE_ERR	(1UL << 15)
+
+#define XDMA_STAT_H2C_W_ERR_MASK	\
+	(XDMA_STAT_H2C_W_DECODE_ERR | XDMA_STAT_H2C_W_SLAVE_ERR)
+
+/* read error: C2H */
+#define XDMA_STAT_C2H_R_DECODE_ERR	(1UL << 9)
+#define XDMA_STAT_C2H_R_SLAVE_ERR	(1UL << 10)
+
+#define XDMA_STAT_C2H_R_ERR_MASK	\
+	(XDMA_STAT_C2H_R_DECODE_ERR | XDMA_STAT_C2H_R_SLAVE_ERR)
+
+/* all combined */
+#define XDMA_STAT_H2C_ERR_MASK	\
+	(XDMA_STAT_COMMON_ERR_MASK | XDMA_STAT_DESC_ERR_MASK | \
+	 XDMA_STAT_H2C_R_ERR_MASK | XDMA_STAT_H2C_W_ERR_MASK)
+
+#define XDMA_STAT_C2H_ERR_MASK	\
+	(XDMA_STAT_COMMON_ERR_MASK | XDMA_STAT_DESC_ERR_MASK | \
+	 XDMA_STAT_C2H_R_ERR_MASK)
+
+/* bits of the SGDMA descriptor control field */
+#define XDMA_DESC_STOPPED	(1UL << 0)
+#define XDMA_DESC_COMPLETED	(1UL << 1)
+#define XDMA_DESC_EOP		(1UL << 4)
+
+/* upper 16-bits of engine identifier register */
+#define XDMA_ID_H2C 0x1fc0U
+#define XDMA_ID_C2H 0x1fc1U
+
+#define LS_BYTE_MASK 0x000000FFUL
+
+#define BLOCK_ID_MASK 0xFFF00000
+#define BLOCK_ID_HEAD 0x1FC00000
+
+#define IRQ_BLOCK_ID 0x1fc20000UL
+#define CONFIG_BLOCK_ID 0x1fc30000UL
+
+#define WB_COUNT_MASK 0x00ffffffUL
+#define WB_ERR_MASK (1UL << 31)
+
+#define MAX_USER_IRQ 16
+
+#define DESC_MAGIC 0xAD4B0000UL
+
+#define C2H_WB 0x52B4UL
+
+#define H2C_CHANNEL_OFFSET 0x1000
+#define SGDMA_OFFSET_FROM_CHANNEL 0x4000
+#define CHANNEL_SPACING 0x100
+#define TARGET_SPACING 0x1000
+
+/* obtain the 32 most significant (high) bits of a 32-bit or 64-bit address */
+#define PCI_DMA_H(addr) ((addr >> 16) >> 16)
+/* obtain the 32 least significant (low) bits of a 32-bit or 64-bit address */
+#define PCI_DMA_L(addr) (addr & 0xffffffffUL)
+
+
+enum transfer_state {
+	TRANSFER_STATE_NEW = 0,
+	TRANSFER_STATE_SUBMITTED,
+	TRANSFER_STATE_COMPLETED,
+	TRANSFER_STATE_FAILED,
+	TRANSFER_STATE_ABORTED
+};
+
+enum shutdown_state {
+	ENGINE_SHUTDOWN_NONE = 0,	/* No shutdown in progress */
+	ENGINE_SHUTDOWN_REQUEST = 1,	/* engine requested to shutdown */
+	ENGINE_SHUTDOWN_IDLE = 2	/* engine has shutdown and is idle */
+};
+
+struct config_regs {
+	u32 identifier;
+	u32 reserved_1[4];
+	u32 msi_enable;
+};
+
+struct engine_regs {
+	u32 identifier;
+	u32 control;
+	u32 control_w1s;
+	u32 control_w1c;
+	u32 reserved_1[12];	/* padding */
+
+	u32 status;
+	u32 status_rc;
+	u32 completed_desc_count;
+	u32 alignments;
+	u32 reserved_2[14];	/* padding */
+
+	u32 poll_mode_wb_lo;
+	u32 poll_mode_wb_hi;
+	u32 interrupt_enable_mask;
+	u32 interrupt_enable_mask_w1s;
+	u32 interrupt_enable_mask_w1c;
+	u32 reserved_3[9];	/* padding */
+
+	u32 perf_ctrl;
+	u32 perf_cyc_lo;
+	u32 perf_cyc_hi;
+	u32 perf_dat_lo;
+	u32 perf_dat_hi;
+	u32 perf_pnd_lo;
+	u32 perf_pnd_hi;
+} __packed;
+
+struct engine_sgdma_regs {
+	u32 identifier;
+	u32 reserved_1[31];	/* padding */
+
+	/* bus address to first descriptor in Root Complex Memory */
+	u32 first_desc_lo;
+	u32 first_desc_hi;
+	/* number of adjacent descriptors at first_desc */
+	u32 first_desc_adjacent;
+	u32 credits;
+} __packed;
+
+struct interrupt_regs {
+	u32 identifier;
+	u32 user_int_enable;
+	u32 user_int_enable_w1s;
+	u32 user_int_enable_w1c;
+	u32 channel_int_enable;
+	u32 channel_int_enable_w1s;
+	u32 channel_int_enable_w1c;
+	u32 reserved_1[9];	/* padding */
+
+	u32 user_int_request;
+	u32 channel_int_request;
+	u32 user_int_pending;
+	u32 channel_int_pending;
+	u32 reserved_2[12];	/* padding */
+
+	u32 user_msi_vector[8];
+	u32 channel_msi_vector[8];
+} __packed;
+
+struct sgdma_common_regs {
+	u32 padding[8];
+	u32 credit_mode_enable;
+	u32 credit_mode_enable_w1s;
+	u32 credit_mode_enable_w1c;
+} __packed;
+
+
+/*
+ * Descriptor for a single contiguous memory block transfer.
+ *
+ * Multiple descriptors are linked by means of the next pointer. An additional
+ * extra adjacent number gives the amount of extra contiguous descriptors.
+ *
+ * The descriptors are in root complex memory, and the bytes in the 32-bit
+ * words must be in little-endian byte ordering.
+ */
+struct xdma_desc {
+	u32 control;
+	u32 bytes;		/* transfer length in bytes */
+	u32 src_addr_lo;	/* source address (low 32-bit) */
+	u32 src_addr_hi;	/* source address (high 32-bit) */
+	u32 dst_addr_lo;	/* destination address (low 32-bit) */
+	u32 dst_addr_hi;	/* destination address (high 32-bit) */
+	/*
+	 * next descriptor in the single-linked list of descriptors;
+	 * this is the PCIe (bus) address of the next descriptor in the
+	 * root complex memory
+	 */
+	u32 next_lo;		/* next desc address (low 32-bit) */
+	u32 next_hi;		/* next desc address (high 32-bit) */
+} __packed;
+
+/* 32 bytes (four 32-bit words) or 64 bytes (eight 32-bit words) */
+struct xdma_result {
+	u32 status;
+	u32 length;
+	u32 reserved_1[6];	/* padding */
+} __packed;
+
+struct sw_desc {
+	dma_addr_t addr;
+	unsigned int len;
+};
+
+/* Describes a (SG DMA) single transfer for the engine */
+#define XFER_FLAG_NEED_UNMAP		0x1
+#define XFER_FLAG_ST_C2H_EOP_RCVED	0x2	/* ST c2h only */
+struct xdma_transfer {
+	struct list_head entry;		/* queue of non-completed transfers */
+	struct xdma_desc *desc_virt;	/* virt addr of the 1st descriptor */
+	struct xdma_result *res_virt;   /* virt addr of result, c2h streaming */
+	dma_addr_t res_bus;		/* bus addr for result descriptors */
+	dma_addr_t desc_bus;		/* bus addr of the first descriptor */
+	int desc_adjacent;		/* adjacent descriptors at desc_bus */
+	int desc_num;			/* number of descriptors in transfer */
+	int desc_index;			/* index for 1st desc. in transfer */
+	int desc_cmpl;			/* completed descriptors */
+	int desc_cmpl_th;		/* completed descriptor threshold */
+	enum dma_data_direction dir;
+	struct swait_queue_head wq;	/* wait queue for transfer completion */
+
+	enum transfer_state state;	/* state of the transfer */
+	unsigned int flags;
+	int cyclic;			/* flag if transfer is cyclic */
+	int last_in_request;		/* flag if last within request */
+	unsigned int len;
+	struct sg_table *sgt;
+};
+
+struct xdma_request_cb {
+	struct sg_table *sgt;
+	unsigned int total_len;
+	u64 ep_addr;
+
+	struct xdma_transfer tfer;
+
+	unsigned int sw_desc_idx;
+	unsigned int sw_desc_cnt;
+	struct sw_desc sdesc[0];
+};
+
+struct xdma_engine {
+	struct xdma_dev *xdev;	/* parent device */
+	char name[16];		/* name of this engine */
+
+	/* HW register address offsets */
+	struct engine_regs *regs;		/* Control reg BAR offset */
+	struct engine_sgdma_regs *sgdma_regs;	/* SGDAM reg BAR offset */
+
+	/* Engine state, configuration and flags */
+	enum shutdown_state shutdown;	/* engine shutdown mode */
+	enum dma_data_direction dir;
+	u8 addr_align;		/* source/dest alignment in bytes */
+	u8 len_granularity;	/* transfer length multiple */
+	u8 addr_bits;		/* HW datapath address width */
+	u8 channel:2;		/* engine indices */
+	u8 streaming:1;
+	u8 device_open:1;	/* flag if engine node open, ST mode only */
+	u8 running:1;		/* flag if the driver started engine */
+	u8 non_incr_addr:1;	/* flag if non-incremental addressing used */
+	u8 eop_flush:1;		/* st c2h only, flush up the data with eop */
+	u8 filler:1;
+
+	int max_extra_adj;	/* descriptor prefetch capability */
+	int desc_dequeued;	/* num descriptors of completed transfers */
+	u32 status;		/* last known status of device */
+	u32 interrupt_enable_mask_value; /* per-engine interrupt mask value */
+
+	/* Transfer list management */
+	struct list_head transfer_list;	/* queue of transfers */
+
+	/* Members applicable to AXI-ST C2H (cyclic) transfers */
+	struct xdma_result *cyclic_result;
+	dma_addr_t cyclic_result_bus;	/* bus addr for transfer */
+
+	/* Members associated with interrupt mode support */
+	struct swait_queue_head shutdown_wq;
+	spinlock_t lock;		/* protects concurrent access */
+	int prev_cpu;			/* remember CPU# of (last) locker */
+	int irq_line;			/* IRQ vector for this engine */
+	u32 irq_bitmask;		/* IRQ bit mask for this engine */
+	struct work_struct work;	/* Work queue for interrupt handling */
+
+	struct mutex desc_lock;		/* protects concurrent access */
+	dma_addr_t desc_bus;
+	struct xdma_desc *desc;
+	int desc_idx;			/* current descriptor index */
+	int desc_used;			/* total descriptors used */
+};
+
+struct xdma_dev {
+	struct pci_dev *pdev;
+	void __iomem *config_bar;
+	unsigned int mask_irq_user;
+	int engines_num;
+	struct xdma_engine engine_h2c[XDMA_CHANNEL_NUM_MAX];
+	struct xdma_engine engine_c2h[XDMA_CHANNEL_NUM_MAX];
+};
+
+
+static void channel_interrupts_enable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+
+	iowrite32(mask, &reg->channel_int_enable_w1s);
+}
+
+static void channel_interrupts_disable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+
+	iowrite32(mask, &reg->channel_int_enable_w1c);
+}
+
+static void user_interrupts_enable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+
+	iowrite32(mask, &reg->user_int_enable_w1s);
+}
+
+static void user_interrupts_disable(struct xdma_dev *xdev, u32 mask)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+
+	iowrite32(mask, &reg->user_int_enable_w1c);
+}
+
+static void read_interrupts(struct xdma_dev *xdev)
+{
+	struct interrupt_regs *reg =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+	u32 lo, hi;
+
+	hi = ioread32(&reg->user_int_request);
+	lo = ioread32(&reg->channel_int_request);
+}
+
+static void engine_reg_dump(struct xdma_engine *engine)
+{
+	u32 w;
+
+	w = ioread32(&engine->regs->identifier);
+	if ((w & BLOCK_ID_MASK) != BLOCK_ID_HEAD) {
+		pr_warn("XDMA: %s: 0x%08x: invalid engine id\n",
+		       engine->name, w);
+		return;
+	}
+
+	pr_info("XDMA: %s: ENGINE REGISTER DUMP\n", engine->name);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (id).\n",
+		engine->name, &engine->regs->identifier, w);
+	w = ioread32(&engine->regs->status);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (status).\n",
+		engine->name, &engine->regs->status, w);
+	w = ioread32(&engine->regs->control);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (control)\n",
+		engine->name, &engine->regs->control, w);
+	w = ioread32(&engine->sgdma_regs->first_desc_lo);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (first_desc_lo)\n",
+		engine->name, &engine->sgdma_regs->first_desc_lo, w);
+	w = ioread32(&engine->sgdma_regs->first_desc_hi);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (first_desc_hi)\n",
+		engine->name, &engine->sgdma_regs->first_desc_hi, w);
+	w = ioread32(&engine->sgdma_regs->first_desc_adjacent);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (first_desc_adjacent).\n",
+		engine->name, &engine->sgdma_regs->first_desc_adjacent, w);
+	w = ioread32(&engine->regs->completed_desc_count);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (completed_desc_count).\n",
+		engine->name, &engine->regs->completed_desc_count, w);
+	w = ioread32(&engine->regs->interrupt_enable_mask);
+	pr_info("%s: ioread32(0x%p) = 0x%08x (interrupt_enable_mask)\n",
+		engine->name, &engine->regs->interrupt_enable_mask, w);
+}
+
+static void engine_status_dump(struct xdma_engine *engine)
+{
+	u32 v = engine->status;
+	char buffer[256];
+	char *buf = buffer;
+	int len = 0;
+
+	len = sprintf(buf, "XDMA: %s: status: 0x%08x: ", engine->name, v);
+
+	if ((v & XDMA_STAT_BUSY))
+		len += sprintf(buf + len, "BUSY,");
+	if ((v & XDMA_STAT_DESC_STOPPED))
+		len += sprintf(buf + len, "DESC_STOPPED,");
+	if ((v & XDMA_STAT_DESC_COMPLETED))
+		len += sprintf(buf + len, "DESC_COMPL,");
+
+	/* common H2C & C2H */
+	if ((v & XDMA_STAT_COMMON_ERR_MASK)) {
+		if ((v & XDMA_STAT_ALIGN_MISMATCH))
+			len += sprintf(buf + len, "ALIGN_MISMATCH ");
+		if ((v & XDMA_STAT_MAGIC_STOPPED))
+			len += sprintf(buf + len, "MAGIC_STOPPED ");
+		if ((v & XDMA_STAT_INVALID_LEN))
+			len += sprintf(buf + len, "INVLIAD_LEN ");
+		if ((v & XDMA_STAT_IDLE_STOPPED))
+			len += sprintf(buf + len, "IDLE_STOPPED ");
+		buf[len - 1] = ',';
+	}
+
+	if (engine->dir == DMA_TO_DEVICE) {
+		/* H2C only */
+		if ((v & XDMA_STAT_H2C_R_ERR_MASK)) {
+			len += sprintf(buf + len, "R:");
+			if ((v & XDMA_STAT_H2C_R_UNSUPP_REQ))
+				len += sprintf(buf + len, "UNSUPP_REQ ");
+			if ((v & XDMA_STAT_H2C_R_COMPL_ABORT))
+				len += sprintf(buf + len, "COMPL_ABORT ");
+			if ((v & XDMA_STAT_H2C_R_PARITY_ERR))
+				len += sprintf(buf + len, "PARITY ");
+			if ((v & XDMA_STAT_H2C_R_HEADER_EP))
+				len += sprintf(buf + len, "HEADER_EP ");
+			if ((v & XDMA_STAT_H2C_R_UNEXP_COMPL))
+				len += sprintf(buf + len, "UNEXP_COMPL ");
+			buf[len - 1] = ',';
+		}
+
+		if ((v & XDMA_STAT_H2C_W_ERR_MASK)) {
+			len += sprintf(buf + len, "W:");
+			if ((v & XDMA_STAT_H2C_W_DECODE_ERR))
+				len += sprintf(buf + len, "DECODE_ERR ");
+			if ((v & XDMA_STAT_H2C_W_SLAVE_ERR))
+				len += sprintf(buf + len, "SLAVE_ERR ");
+			buf[len - 1] = ',';
+		}
+
+	} else {
+		/* C2H only */
+		if ((v & XDMA_STAT_C2H_R_ERR_MASK)) {
+			len += sprintf(buf + len, "R:");
+			if ((v & XDMA_STAT_C2H_R_DECODE_ERR))
+				len += sprintf(buf + len, "DECODE_ERR ");
+			if ((v & XDMA_STAT_C2H_R_SLAVE_ERR))
+				len += sprintf(buf + len, "SLAVE_ERR ");
+			buf[len - 1] = ',';
+		}
+	}
+
+	/* common H2C & C2H */
+	if ((v & XDMA_STAT_DESC_ERR_MASK)) {
+		len += sprintf(buf + len, "DESC_ERR:");
+		if ((v & XDMA_STAT_DESC_UNSUPP_REQ))
+			len += sprintf(buf + len, "UNSUPP_REQ ");
+		if ((v & XDMA_STAT_DESC_COMPL_ABORT))
+			len += sprintf(buf + len, "COMPL_ABORT ");
+		if ((v & XDMA_STAT_DESC_PARITY_ERR))
+			len += sprintf(buf + len, "PARITY ");
+		if ((v & XDMA_STAT_DESC_HEADER_EP))
+			len += sprintf(buf + len, "HEADER_EP ");
+		if ((v & XDMA_STAT_DESC_UNEXP_COMPL))
+			len += sprintf(buf + len, "UNEXP_COMPL ");
+		buf[len - 1] = ',';
+	}
+
+	buf[len - 1] = '\0';
+	pr_info("%s\n", buffer);
+}
+
+static void engine_status_read(struct xdma_engine *engine, bool clear, bool dump)
+{
+	if (dump)
+		engine_reg_dump(engine);
+
+	if (clear)
+		engine->status = ioread32(&engine->regs->status_rc);
+	else
+		engine->status = ioread32(&engine->regs->status);
+
+	if (dump)
+		engine_status_dump(engine);
+}
+
+static void engine_stop(struct xdma_engine *engine)
+{
+	u32 w;
+
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE)
+		iowrite32(0, &engine->sgdma_regs->credits);
+
+	w = 0;
+	w |= (u32)XDMA_CTRL_IE_DESC_ALIGN_MISMATCH;
+	w |= (u32)XDMA_CTRL_IE_MAGIC_STOPPED;
+	w |= (u32)XDMA_CTRL_IE_READ_ERROR;
+	w |= (u32)XDMA_CTRL_IE_DESC_ERROR;
+
+	w |= (u32)XDMA_CTRL_IE_DESC_STOPPED;
+	w |= (u32)XDMA_CTRL_IE_DESC_COMPLETED;
+
+	iowrite32(w, &engine->regs->control);
+
+	engine->running = 0;
+}
+
+static int engine_start_mode_config(struct xdma_engine *engine)
+{
+	u32 w;
+
+	/* write control register of SG DMA engine */
+	w = (u32)XDMA_CTRL_RUN_STOP;
+	w |= (u32)XDMA_CTRL_IE_READ_ERROR;
+	w |= (u32)XDMA_CTRL_IE_DESC_ERROR;
+	w |= (u32)XDMA_CTRL_IE_DESC_ALIGN_MISMATCH;
+	w |= (u32)XDMA_CTRL_IE_MAGIC_STOPPED;
+
+	w |= (u32)XDMA_CTRL_IE_DESC_STOPPED;
+	w |= (u32)XDMA_CTRL_IE_DESC_COMPLETED;
+
+	/* set non-incremental addressing mode */
+	if (engine->non_incr_addr)
+		w |= (u32)XDMA_CTRL_NON_INCR_ADDR;
+
+	/* start the engine */
+	iowrite32(w, &engine->regs->control);
+	/* dummy read of status register to flush all previous writes */
+	w = ioread32(&engine->regs->status);
+
+	return 0;
+}
+
+/*
+ * Get the number for adjacent descriptors to set in a descriptor, based on the
+ * remaining number of descriptors and the lower bits of the address of the
+ * next descriptor.
+ * Since the number of descriptors in a page (XDMA_PAGE_SIZE) is 128 and the
+ * maximum size of a block of adjacent descriptors is 64 (63 max adjacent
+ * descriptors for any descriptor), align the blocks of adjacent descriptors
+ * to the block size.
+ */
+static u32 xdma_get_next_adj(unsigned int remaining, u32 next_lo)
+{
+	unsigned int next_index;
+
+	if (remaining <= 1)
+		return 0;
+
+	/* shift right 5 times corresponds to a division by
+	 * sizeof(xdma_desc) = 32
+	 */
+	next_index = ((next_lo & (XDMA_PAGE_SIZE - 1)) >> 5) %
+		XDMA_MAX_ADJ_BLOCK_SIZE;
+	return min(XDMA_MAX_ADJ_BLOCK_SIZE - next_index - 1, remaining - 1);
+}
+
+/*
+ * start an idle engine with its first transfer on queue
+ *
+ * The engine will run and process all transfers that are queued using
+ * transfer_queue() and thus have their descriptor lists chained.
+ *
+ * During the run, new transfers will be processed if transfer_queue() has
+ * chained the descriptors before the hardware fetches the last descriptor.
+ * A transfer that was chained too late will invoke a new run of the engine
+ * initiated from the engine_service() routine.
+ *
+ * The engine must be idle and at least one transfer must be queued.
+ */
+static int engine_start(struct xdma_engine *engine)
+{
+	struct xdma_transfer *transfer;
+	u32 w, next_adj;
+	int rv;
+
+	/* engine transfer queue must not be empty */
+	if (list_empty(&engine->transfer_list)) {
+		pr_warn("XDMA: %s: transfer queue must not be empty\n",
+			engine->name);
+		return -EIO;
+	}
+	/* inspect first transfer queued on the engine */
+	transfer = list_entry(engine->transfer_list.next, struct xdma_transfer,
+			      entry);
+	if (!transfer) {
+		pr_warn("XDMA: %s: queued transfer must not be empty\n",
+			engine->name);
+		return -EIO;
+	}
+
+	/* engine is no longer shutdown */
+	engine->shutdown = ENGINE_SHUTDOWN_NONE;
+
+	/* Add credits for Streaming mode C2H */
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE)
+		iowrite32(engine->desc_used, &engine->sgdma_regs->credits);
+
+	/* initialize number of descriptors of dequeued transfers */
+	engine->desc_dequeued = 0;
+
+	/* write lower 32-bit of bus address of transfer first descriptor */
+	w = cpu_to_le32(PCI_DMA_L(transfer->desc_bus));
+	iowrite32(w, &engine->sgdma_regs->first_desc_lo);
+	/* write upper 32-bit of bus address of transfer first descriptor */
+	w = cpu_to_le32(PCI_DMA_H(transfer->desc_bus));
+	iowrite32(w, &engine->sgdma_regs->first_desc_hi);
+
+	next_adj = xdma_get_next_adj(transfer->desc_adjacent,
+				     cpu_to_le32(PCI_DMA_L(transfer->desc_bus)));
+	iowrite32(next_adj, &engine->sgdma_regs->first_desc_adjacent);
+
+	rv = engine_start_mode_config(engine);
+	if (rv < 0)
+		return rv;
+	engine_status_read(engine, 0, 0);
+
+	engine->running = 1;
+
+	return 0;
+}
+
+static void engine_service_shutdown(struct xdma_engine *engine)
+{
+	engine_stop(engine);
+	/* awake task on engine's shutdown wait queue */
+	swake_up_one(&engine->shutdown_wq);
+}
+
+static struct xdma_transfer *engine_transfer_completion(
+		struct xdma_engine *engine,
+		struct xdma_transfer *transfer)
+{
+	if (unlikely(!transfer)) {
+		pr_warn("XDMA: %s empty xfer\n", engine->name);
+		return NULL;
+	}
+
+	/* synchronous I/O? */
+	/* awake task on transfer's wait queue */
+	swake_up_one(&transfer->wq);
+
+	return transfer;
+}
+
+static struct xdma_transfer *engine_service_transfer_list(
+		struct xdma_engine *engine,
+		struct xdma_transfer *transfer,
+		u32 *pdesc_completed)
+{
+	if (unlikely(!transfer)) {
+		pr_warn("XDMA: %s empty xfer\n", engine->name);
+		return NULL;
+	}
+
+	/*
+	 * iterate over all the transfers completed by the engine,
+	 * except for the last
+	 */
+	while (transfer && (!transfer->cyclic) &&
+	       (*pdesc_completed > transfer->desc_num)) {
+		/* remove this transfer from pdesc_completed */
+		*pdesc_completed -= transfer->desc_num;
+
+		/* remove completed transfer from list */
+		list_del(engine->transfer_list.next);
+		/* add to dequeued number of descriptors during this run */
+		engine->desc_dequeued += transfer->desc_num;
+		/* mark transfer as successfully completed */
+		transfer->state = TRANSFER_STATE_COMPLETED;
+
+		/*
+		 * Complete transfer - sets transfer to NULL if an async
+		 * transfer has completed
+		 */
+		transfer = engine_transfer_completion(engine, transfer);
+
+		/* if exists, get the next transfer on the list */
+		if (!list_empty(&engine->transfer_list)) {
+			transfer = list_entry(engine->transfer_list.next,
+					      struct xdma_transfer, entry);
+		} else {
+			/* no further transfers? */
+			transfer = NULL;
+		}
+	}
+
+	return transfer;
+}
+
+static void engine_err_handle(struct xdma_engine *engine,
+			      struct xdma_transfer *transfer)
+{
+	u32 value;
+
+	/*
+	 * The BUSY bit is expected to be clear now but older HW has a race
+	 * condition which could cause it to be still set.  If it's set, re-read
+	 * and check again.  If it's still set, log the issue.
+	 */
+	if (engine->status & XDMA_STAT_BUSY) {
+		value = ioread32(&engine->regs->status);
+		if ((value & XDMA_STAT_BUSY))
+			pr_warn("XDMA: %s has errors but is still BUSY\n",
+				engine->name);
+	}
+
+	/* mark transfer as failed */
+	transfer->state = TRANSFER_STATE_FAILED;
+	engine_stop(engine);
+}
+
+static struct xdma_transfer *
+engine_service_final_transfer(struct xdma_engine *engine,
+			      struct xdma_transfer *transfer,
+			      u32 *pdesc_completed)
+{
+	/* inspect the current transfer */
+	if (unlikely(!transfer)) {
+		pr_warn("XDMA: %s: empty xfer\n", engine->name);
+		return NULL;
+	}
+
+	if (((engine->dir == DMA_FROM_DEVICE) &&
+	     (engine->status & XDMA_STAT_C2H_ERR_MASK)) ||
+	    ((engine->dir == DMA_TO_DEVICE) &&
+	     (engine->status & XDMA_STAT_H2C_ERR_MASK))) {
+		pr_warn("XDMA: %s: status error 0x%x.\n", engine->name,
+			engine->status);
+		engine_status_dump(engine);
+		engine_err_handle(engine, transfer);
+		goto transfer_del;
+	}
+
+	if (engine->status & XDMA_STAT_BUSY)
+		pr_info("XDMA: %s: engine unexpectedly busy, ignoring\n",
+			engine->name);
+
+	/* the engine stopped on current transfer? */
+	if (*pdesc_completed < transfer->desc_num) {
+		if (engine->eop_flush) {
+			/* check if eop received */
+			struct xdma_result *result = transfer->res_virt;
+			int i;
+			int max = *pdesc_completed;
+
+			for (i = 0; i < max; i++) {
+				if ((result[i].status & RX_STATUS_EOP) != 0) {
+					transfer->flags |=
+						XFER_FLAG_ST_C2H_EOP_RCVED;
+					break;
+				}
+			}
+
+			transfer->desc_cmpl += *pdesc_completed;
+			if (!(transfer->flags & XFER_FLAG_ST_C2H_EOP_RCVED))
+				return NULL;
+
+			/* mark transfer as successfully completed */
+			engine_service_shutdown(engine);
+			transfer->state = TRANSFER_STATE_COMPLETED;
+			engine->desc_dequeued += transfer->desc_cmpl;
+		} else {
+			transfer->state = TRANSFER_STATE_FAILED;
+			pr_warn("XDMA: %s: xfer stopped half-way\n",
+				engine->name);
+
+			/* add dequeued number of descriptors during this run */
+			engine->desc_dequeued += transfer->desc_num;
+			transfer->desc_cmpl = *pdesc_completed;
+		}
+	} else {
+		if (!transfer->cyclic) {
+			/*
+			 * if the engine stopped on this transfer,
+			 * it should be the last
+			 */
+			WARN_ON(*pdesc_completed > transfer->desc_num);
+		}
+		/* mark transfer as successfully completed */
+		transfer->state = TRANSFER_STATE_COMPLETED;
+		transfer->desc_cmpl = transfer->desc_num;
+		/* add dequeued number of descriptors during this run */
+		engine->desc_dequeued += transfer->desc_num;
+	}
+
+transfer_del:
+	/* remove completed transfer from list */
+	list_del(engine->transfer_list.next);
+
+	/*
+	 * Complete transfer - sets transfer to NULL if an asynchronous
+	 * transfer has completed
+	 */
+	transfer = engine_transfer_completion(engine, transfer);
+
+	return transfer;
+}
+
+static int engine_service_resume(struct xdma_engine *engine)
+{
+	int rv;
+
+	if (!engine->running) {
+		/* in the case of shutdown, let it finish what's in the Q */
+		if (!list_empty(&engine->transfer_list)) {
+			/* (re)start engine */
+			rv = engine_start(engine);
+			if (rv)
+				return rv;
+			/* engine was requested to be shutdown? */
+		} else if (engine->shutdown & ENGINE_SHUTDOWN_REQUEST) {
+			engine->shutdown |= ENGINE_SHUTDOWN_IDLE;
+			/* awake task on engine's shutdown wait queue */
+			swake_up_one(&engine->shutdown_wq);
+		}
+	} else if (list_empty(&engine->transfer_list)) {
+		engine_service_shutdown(engine);
+	}
+
+	return 0;
+}
+
+static int engine_service(struct xdma_engine *engine, int desc_writeback)
+{
+	struct xdma_transfer *transfer = NULL;
+	u32 desc_count = desc_writeback & WB_COUNT_MASK;
+	u32 err_flag = desc_writeback & WB_ERR_MASK;
+	int rv;
+
+	if (!engine->running) {
+		engine_status_read(engine, 1, 0);
+		return 0;
+	}
+
+	/*
+	 * If called by the ISR detected an error, read and clear
+	 * engine status.
+	 */
+	if ((desc_count == 0) || (err_flag != 0))
+		engine_status_read(engine, 1, 0);
+
+	/*
+	 * engine was running but is no longer busy, or writeback occurred,
+	 * shut down
+	 */
+	if ((engine->running && !(engine->status & XDMA_STAT_BUSY)) ||
+	    (!engine->eop_flush && desc_count != 0))
+		engine_service_shutdown(engine);
+
+	/*
+	 * If called from the ISR, or if an error occurred, the descriptor
+	 * count will be zero.  In this scenario, read the descriptor count
+	 * from HW.
+	 */
+	if (!desc_count)
+		desc_count = ioread32(&engine->regs->completed_desc_count);
+	if (!desc_count)
+		goto done;
+
+	/* transfers on queue? */
+	if (!list_empty(&engine->transfer_list)) {
+		/* pick first transfer on queue (was submitted to the engine) */
+		transfer = list_entry(engine->transfer_list.next,
+				      struct xdma_transfer, entry);
+	}
+
+	/* account for already dequeued transfers during this engine run */
+	desc_count -= engine->desc_dequeued;
+
+	/* Process all but the last transfer */
+	transfer = engine_service_transfer_list(engine, transfer, &desc_count);
+
+	/*
+	 * Process final transfer - includes checks of number of descriptors to
+	 * detect faulty completion
+	 */
+	transfer = engine_service_final_transfer(engine, transfer, &desc_count);
+
+	/* Restart the engine following the servicing */
+	if (!engine->eop_flush) {
+		rv = engine_service_resume(engine);
+		if (rv)
+			return rv;
+	}
+
+done:
+	return err_flag ? -1 : 0;
+}
+
+static void engine_service_work(struct work_struct *work)
+{
+	struct xdma_engine *engine;
+	unsigned long flags;
+	int rv;
+
+	engine = container_of(work, struct xdma_engine, work);
+
+	spin_lock_irqsave(&engine->lock, flags);
+
+	rv = engine_service(engine, 0);
+	if (rv < 0)
+		goto unlock;
+
+	/* re-enable interrupts for this engine */
+	iowrite32(engine->interrupt_enable_mask_value,
+		  &engine->regs->interrupt_enable_mask_w1s);
+
+unlock:
+	spin_unlock_irqrestore(&engine->lock, flags);
+}
+
+static irqreturn_t xdma_isr(int irq, void *dev_id)
+{
+	struct xdma_dev *xdev;
+	struct xdma_engine *engine;
+	struct interrupt_regs *irq_regs;
+
+	engine = (struct xdma_engine *)dev_id;
+	xdev = engine->xdev;
+
+	irq_regs = (struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+
+	/* Disable the interrupt for this engine */
+	iowrite32(engine->interrupt_enable_mask_value,
+		&engine->regs->interrupt_enable_mask_w1c);
+	/* Dummy read to flush the above write */
+	ioread32(&irq_regs->channel_int_pending);
+	schedule_work(&engine->work);
+
+	return IRQ_HANDLED;
+}
+
+static int is_config_bar(void *bar)
+{
+	u32 irq_id = 0;
+	u32 cfg_id = 0;
+	u32 mask = 0xffff0000; /* Compare only XDMA ID's not Version number */
+	struct interrupt_regs *irq_regs =
+		(struct interrupt_regs *)(bar + XDMA_OFS_INT_CTRL);
+	struct config_regs *cfg_regs =
+		(struct config_regs *)(bar + XDMA_OFS_CONFIG);
+
+	irq_id = ioread32(&irq_regs->identifier);
+	cfg_id = ioread32(&cfg_regs->identifier);
+
+	if (((irq_id & mask) == IRQ_BLOCK_ID)
+	    && ((cfg_id & mask) == CONFIG_BLOCK_ID))
+		return 1;
+
+	return 0;
+}
+
+static void unmap_config_bar(struct xdma_dev *xdev, int config_bar_id)
+{
+	pci_iounmap(xdev->pdev, xdev->config_bar);
+	pci_release_selected_regions(xdev->pdev, 1U<<config_bar_id);
+}
+
+static int map_config_bar(struct xdma_dev *xdev, int config_bar_id)
+{
+	int rv, bar_len;
+
+	bar_len = pci_resource_len(xdev->pdev, config_bar_id);
+	if (bar_len < XDMA_BAR_SIZE) {
+		pr_err("XDMA: %d: Not a config BAR\n", config_bar_id);
+		return -EINVAL;
+	}
+	rv = pci_request_selected_regions(xdev->pdev, 1U<<config_bar_id,
+					  "xdma");
+	if (rv) {
+		pr_err("XDMA: Failed to request config BAR memory\n");
+		return rv;
+	}
+	xdev->config_bar = pci_iomap(xdev->pdev, config_bar_id, bar_len);
+	if (!xdev->config_bar) {
+		pr_err("XDMA: Failed to map config BAR memory\n");
+		rv = -ENOMEM;
+		goto err_map;
+	}
+	if (!is_config_bar(xdev->config_bar)) {
+		pr_err("XDMA: %d: Not a config BAR\n", config_bar_id);
+		rv = -EINVAL;
+		goto err_bar;
+	}
+
+	pr_debug("XDMA: Config BAR %d mapped at %p\n",
+		 config_bar_id, xdev->config_bar);
+
+	return 0;
+
+err_bar:
+	pci_iounmap(xdev->pdev, xdev->config_bar);
+err_map:
+	pci_release_selected_regions(xdev->pdev, 1U<<config_bar_id);
+
+	return rv;
+}
+
+static void prog_irq_user(struct xdma_dev *xdev, int num_channel, int num_irq,
+			  bool clear)
+{
+	struct interrupt_regs *int_regs =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+	int i = num_channel;
+	int max = i + num_irq;
+	int j;
+
+	for (j = 0; i < max; j++) {
+		u32 val = 0;
+		int k, shift = 0;
+
+		if (clear)
+			i += 4;
+		else
+			for (k = 0; k < 4 && i < max; i++, k++, shift += 8)
+				val |= (i & 0x1f) << shift;
+
+		iowrite32(val, &int_regs->user_msi_vector[j]);
+	}
+}
+
+static void prog_irq_channel(struct xdma_dev *xdev, int num_channel, bool clear)
+{
+	struct interrupt_regs *int_regs =
+		(struct interrupt_regs *)(xdev->config_bar + XDMA_OFS_INT_CTRL);
+	int i, j;
+
+	for (i = 0, j = 0; i < num_channel; j++) {
+		u32 val = 0;
+		int k, shift = 0;
+
+		if (clear)
+			i += 4;
+		else
+			for (k = 0; k < 4 && i < num_channel; i++, k++, shift += 8)
+				val |= (i & 0x1f) << shift;
+
+		iowrite32(val, &int_regs->channel_msi_vector[j]);
+	}
+}
+
+static void irq_channel_teardown(struct xdma_dev *xdev, int h2c_channel_max,
+				 int c2h_channel_max)
+{
+	struct xdma_engine *engine;
+	int i = 0, j = 0;
+
+	engine = xdev->engine_h2c;
+	for (i = 0; i < h2c_channel_max; i++, j++, engine++) {
+		if (!engine->irq_line)
+			break;
+		free_irq(engine->irq_line, engine);
+	}
+
+	engine = xdev->engine_c2h;
+	for (i = 0; i < c2h_channel_max; i++, j++, engine++) {
+		if (!engine->irq_line)
+			break;
+		free_irq(engine->irq_line, engine);
+	}
+}
+
+static int irq_channel_setup(struct xdma_dev *xdev, int h2c_channel_max,
+			     int c2h_channel_max)
+{
+	int i, j, rv;
+	u32 vector;
+	struct xdma_engine *engine;
+
+	j = h2c_channel_max;
+	engine = xdev->engine_h2c;
+	for (i = 0; i < h2c_channel_max; i++, engine++) {
+		vector = pci_irq_vector(xdev->pdev, i);
+		rv = request_irq(vector, xdma_isr, 0, engine->name, engine);
+		if (rv) {
+			pr_err("XDMA: %s: error requesting irq#%d\n",
+			       engine->name, vector);
+			return rv;
+		}
+		pr_info("XDMA: %s: irq#%d\n", engine->name, vector);
+		engine->irq_line = vector;
+	}
+
+	engine = xdev->engine_c2h;
+	for (i = 0; i < c2h_channel_max; i++, j++, engine++) {
+		vector = pci_irq_vector(xdev->pdev, j);
+		rv = request_irq(vector, xdma_isr, 0, engine->name, engine);
+		if (rv) {
+			pr_err("XDMA: %s: error requesting irq#%d\n",
+			       engine->name, vector);
+			return rv;
+		}
+		pr_info("XDMA: %s: irq#%d\n", engine->name, vector);
+		engine->irq_line = vector;
+	}
+
+	return 0;
+}
+
+static void irq_teardown(struct xdma_dev *xdev, int h2c_channel_max,
+			 int c2h_channel_max, int user_irq_max)
+{
+	int num_channel = h2c_channel_max + c2h_channel_max;
+
+	prog_irq_user(xdev, num_channel, user_irq_max, 1);
+	prog_irq_channel(xdev, num_channel, 1);
+
+	irq_channel_teardown(xdev, h2c_channel_max, c2h_channel_max);
+}
+
+static int irq_setup(struct xdma_dev *xdev, int h2c_channel_max,
+		     int c2h_channel_max, int user_irq_max)
+{
+	int rv;
+	int num_channel = h2c_channel_max + c2h_channel_max;
+
+	rv = irq_channel_setup(xdev, h2c_channel_max, c2h_channel_max);
+	if (rv)
+		return rv;
+
+	prog_irq_channel(xdev, num_channel, 0);
+	prog_irq_user(xdev, num_channel, user_irq_max, 0);
+
+	return 0;
+}
+
+/* Chains the descriptors as a singly-linked list
+ *
+ * Each descriptor's next pointer specifies the bus address of the next
+ * descriptor.
+ * Terminates the last descriptor to form a singly-linked list.
+ */
+static void transfer_desc_init(struct xdma_transfer *transfer, int count)
+{
+	struct xdma_desc *desc_virt = transfer->desc_virt;
+	dma_addr_t desc_bus = transfer->desc_bus;
+	int i;
+
+	BUG_ON(count > XDMA_TRANSFER_MAX_DESC);
+
+	/* create singly-linked list for SG DMA controller */
+	for (i = 0; i < count - 1; i++) {
+		/* increment bus address to next in array */
+		desc_bus += sizeof(struct xdma_desc);
+
+		/* singly-linked list uses bus addresses */
+		desc_virt[i].next_lo = cpu_to_le32(PCI_DMA_L(desc_bus));
+		desc_virt[i].next_hi = cpu_to_le32(PCI_DMA_H(desc_bus));
+		desc_virt[i].bytes = cpu_to_le32(0);
+
+		desc_virt[i].control = cpu_to_le32(DESC_MAGIC);
+	}
+
+	/* zero the last descriptor next pointer */
+	desc_virt[i].next_lo = cpu_to_le32(0);
+	desc_virt[i].next_hi = cpu_to_le32(0);
+	desc_virt[i].bytes = cpu_to_le32(0);
+	desc_virt[i].control = cpu_to_le32(DESC_MAGIC);
+}
+
+/* Set how many descriptors are adjacent to this one */
+static void xdma_desc_adjacent(struct xdma_desc *desc, u32 next_adjacent)
+{
+	/* remember reserved and control bits */
+	u32 control = le32_to_cpu(desc->control) & 0x0000f0ffUL;
+	/* merge adjacent and control field */
+	control |= 0xAD4B0000UL | (next_adjacent << 8);
+	/* write control and next_adjacent */
+	desc->control = cpu_to_le32(control);
+}
+
+/* Set complete control field of a descriptor */
+static void xdma_desc_control_set(struct xdma_desc *first, u32 control_field)
+{
+	/* remember magic and adjacent number */
+	u32 control = le32_to_cpu(first->control) & ~(LS_BYTE_MASK);
+
+	/* merge adjacent and control field */
+	control |= control_field;
+	/* write control and next_adjacent */
+	first->control = cpu_to_le32(control);
+}
+
+static inline void xdma_desc_done(struct xdma_desc *desc_virt, int count)
+{
+	memset(desc_virt, 0, count * sizeof(struct xdma_desc));
+}
+
+/* Fill a descriptor with the transfer details */
+static void xdma_desc_set(struct xdma_desc *desc, dma_addr_t rc_bus_addr,
+			  u64 ep_addr, int len, int dir)
+{
+	/* transfer length */
+	desc->bytes = cpu_to_le32(len);
+	if (dir == DMA_TO_DEVICE) {
+		/* read from root complex memory (source address) */
+		desc->src_addr_lo = cpu_to_le32(PCI_DMA_L(rc_bus_addr));
+		desc->src_addr_hi = cpu_to_le32(PCI_DMA_H(rc_bus_addr));
+		/* write to end point address (destination address) */
+		desc->dst_addr_lo = cpu_to_le32(PCI_DMA_L(ep_addr));
+		desc->dst_addr_hi = cpu_to_le32(PCI_DMA_H(ep_addr));
+	} else {
+		/* read from end point address (source address) */
+		desc->src_addr_lo = cpu_to_le32(PCI_DMA_L(ep_addr));
+		desc->src_addr_hi = cpu_to_le32(PCI_DMA_H(ep_addr));
+		/* write to root complex memory (destination address) */
+		desc->dst_addr_lo = cpu_to_le32(PCI_DMA_L(rc_bus_addr));
+		desc->dst_addr_hi = cpu_to_le32(PCI_DMA_H(rc_bus_addr));
+	}
+}
+
+static void transfer_abort(struct xdma_engine *engine,
+			  struct xdma_transfer *transfer)
+{
+	struct xdma_transfer *head;
+
+	head = list_entry(engine->transfer_list.next, struct xdma_transfer,
+			  entry);
+	if (head == transfer)
+		list_del(engine->transfer_list.next);
+	else
+		pr_warn("XDMA: %s: transfer for abort NOT found\n",
+			engine->name);
+
+	if (transfer->state == TRANSFER_STATE_SUBMITTED)
+		transfer->state = TRANSFER_STATE_ABORTED;
+}
+
+static int transfer_queue(struct xdma_engine *engine,
+			  struct xdma_transfer *transfer)
+{
+	int rv = 0;
+	unsigned long flags;
+
+	/* lock the engine state */
+	spin_lock_irqsave(&engine->lock, flags);
+
+	engine->prev_cpu = get_cpu();
+	put_cpu();
+
+	/* engine is being shutdown; do not accept new transfers */
+	if (engine->shutdown & ENGINE_SHUTDOWN_REQUEST) {
+		pr_info("XDMA: %s: engine offline, transfer not queued\n",
+			engine->name);
+		rv = -EBUSY;
+		goto shutdown;
+	}
+
+	/* mark the transfer as submitted */
+	transfer->state = TRANSFER_STATE_SUBMITTED;
+	/* add transfer to the tail of the engine transfer queue */
+	list_add_tail(&transfer->entry, &engine->transfer_list);
+
+	if (!engine->running)
+		rv = engine_start(engine);
+
+shutdown:
+	spin_unlock_irqrestore(&engine->lock, flags);
+
+	return rv;
+}
+
+static void engine_alignments(struct xdma_engine *engine)
+{
+	u32 w = ioread32(&engine->regs->alignments);
+
+	if (w) {
+		engine->addr_align = (w & 0x00ff0000U) >> 16;
+		engine->len_granularity = (w & 0x0000ff00U) >> 8;
+		engine->addr_bits = (w & 0x000000ffU);
+	} else {
+		/* Some default values if alignments are unspecified */
+		engine->addr_align = 1;
+		engine->len_granularity = 1;
+		engine->addr_bits = 64;
+	}
+}
+
+static void engine_free_resource(struct xdma_engine *engine)
+{
+	struct xdma_dev *xdev = engine->xdev;
+
+	if (engine->desc) {
+		dma_free_coherent(&xdev->pdev->dev,
+				  XDMA_TRANSFER_MAX_DESC *
+					  sizeof(struct xdma_desc),
+				  engine->desc, engine->desc_bus);
+		engine->desc = NULL;
+	}
+
+	if (engine->cyclic_result) {
+		dma_free_coherent(
+			&xdev->pdev->dev,
+			XDMA_TRANSFER_MAX_DESC * sizeof(struct xdma_result),
+			engine->cyclic_result, engine->cyclic_result_bus);
+		engine->cyclic_result = NULL;
+	}
+}
+
+static void engine_destroy(struct xdma_dev *xdev, struct xdma_engine *engine)
+{
+	/* Disable interrupts to stop processing new events during shutdown */
+	iowrite32(0x0, &engine->regs->interrupt_enable_mask);
+
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE) {
+		u32 reg_value = (0x1 << engine->channel) << 16;
+		struct sgdma_common_regs *reg =
+			(struct sgdma_common_regs *)
+			(xdev->config_bar + (0x6 * TARGET_SPACING));
+		iowrite32(reg_value, &reg->credit_mode_enable_w1c);
+	}
+
+	/* Release memory use for descriptor writebacks */
+	engine_free_resource(engine);
+
+	memset(engine, 0, sizeof(struct xdma_engine));
+	/* Decrement the number of engines available */
+	xdev->engines_num--;
+}
+
+static void engine_init_regs(struct xdma_engine *engine)
+{
+	u32 reg_value;
+
+	iowrite32(XDMA_CTRL_NON_INCR_ADDR, &engine->regs->control_w1c);
+
+	engine_alignments(engine);
+
+	/* Configure error interrupts by default */
+	reg_value = XDMA_CTRL_IE_DESC_ALIGN_MISMATCH;
+	reg_value |= XDMA_CTRL_IE_MAGIC_STOPPED;
+	reg_value |= XDMA_CTRL_IE_MAGIC_STOPPED;
+	reg_value |= XDMA_CTRL_IE_READ_ERROR;
+	reg_value |= XDMA_CTRL_IE_DESC_ERROR;
+
+	/* enable the relevant completion interrupts */
+	reg_value |= XDMA_CTRL_IE_DESC_STOPPED;
+	reg_value |= XDMA_CTRL_IE_DESC_COMPLETED;
+
+	/* Apply engine configurations */
+	iowrite32(reg_value, &engine->regs->interrupt_enable_mask);
+
+	engine->interrupt_enable_mask_value = reg_value;
+
+	/* only enable credit mode for AXI-ST C2H */
+	if (enable_credit_mp && engine->streaming &&
+	    engine->dir == DMA_FROM_DEVICE) {
+		struct xdma_dev *xdev = engine->xdev;
+		u32 reg_value = (0x1 << engine->channel) << 16;
+		struct sgdma_common_regs *reg =
+			(struct sgdma_common_regs *)
+			(xdev->config_bar + (0x6 * TARGET_SPACING));
+
+		iowrite32(reg_value, &reg->credit_mode_enable_w1s);
+	}
+}
+
+static int engine_alloc_resource(struct xdma_engine *engine)
+{
+	struct xdma_dev *xdev = engine->xdev;
+
+	engine->desc = dma_alloc_coherent(&xdev->pdev->dev,
+					  XDMA_TRANSFER_MAX_DESC *
+						  sizeof(struct xdma_desc),
+					  &engine->desc_bus, GFP_KERNEL);
+	if (!engine->desc)
+		goto err_out;
+
+	if (engine->streaming && engine->dir == DMA_FROM_DEVICE) {
+		engine->cyclic_result = dma_alloc_coherent(
+			&xdev->pdev->dev,
+			XDMA_TRANSFER_MAX_DESC * sizeof(struct xdma_result),
+			&engine->cyclic_result_bus, GFP_KERNEL);
+
+		if (!engine->cyclic_result)
+			goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	engine_free_resource(engine);
+	return -ENOMEM;
+}
+
+static int engine_init(struct xdma_engine *engine, struct xdma_dev *xdev,
+		       int offset, enum dma_data_direction dir, int channel)
+{
+	int rv;
+	u32 val;
+
+	engine->channel = channel;
+	engine->xdev = xdev;
+
+	/* engine interrupt request bit */
+	engine->irq_bitmask = (1 << XDMA_ENG_IRQ_NUM) - 1;
+	engine->irq_bitmask <<= (xdev->engines_num * XDMA_ENG_IRQ_NUM);
+
+	/* register address */
+	engine->regs = xdev->config_bar + offset;
+	engine->sgdma_regs = xdev->config_bar + offset +
+			     SGDMA_OFFSET_FROM_CHANNEL;
+	val = ioread32(&engine->regs->identifier);
+	if (val & 0x8000U)
+		engine->streaming = 1;
+
+	/* remember SG DMA direction */
+	engine->dir = dir;
+	sprintf(engine->name, "xdma-%s%d%s", (dir == DMA_TO_DEVICE) ? "H2C" : "C2H",
+		channel, engine->streaming ? "ST" : "MM");
+
+	/* initialize the deferred work for transfer completion */
+	INIT_WORK(&engine->work, engine_service_work);
+
+	xdev->engines_num++;
+
+	rv = engine_alloc_resource(engine);
+	if (rv)
+		return rv;
+	engine_init_regs(engine);
+
+	return 0;
+}
+
+static void transfer_destroy(struct xdma_dev *xdev, struct xdma_transfer *xfer)
+{
+	xdma_desc_done(xfer->desc_virt, xfer->desc_num);
+
+	if (xfer->last_in_request && (xfer->flags & XFER_FLAG_NEED_UNMAP)) {
+		struct sg_table *sgt = xfer->sgt;
+
+		if (sgt->nents) {
+			dma_unmap_sg(&xdev->pdev->dev, sgt->sgl, sgt->nents,
+				     xfer->dir);
+			sgt->nents = 0;
+		}
+	}
+}
+
+static void transfer_build(struct xdma_engine *engine,
+			struct xdma_request_cb *req, struct xdma_transfer *xfer,
+			unsigned int desc_max)
+{
+	struct sw_desc *sdesc = &(req->sdesc[req->sw_desc_idx]);
+	int i, j;
+	dma_addr_t bus = xfer->res_bus;
+
+	for (i = 0, j = 0; i < desc_max; i++, j++, sdesc++) {
+		/* fill in descriptor entry j with transfer details */
+		xdma_desc_set(xfer->desc_virt + j, sdesc->addr, req->ep_addr,
+			      sdesc->len, xfer->dir);
+		xfer->len += sdesc->len;
+
+		/* for non-inc-add mode don't increment ep_addr */
+		if (!engine->non_incr_addr)
+			req->ep_addr += sdesc->len;
+
+		if (engine->streaming && engine->dir == DMA_FROM_DEVICE) {
+			memset(xfer->res_virt + j, 0,
+				sizeof(struct xdma_result));
+			xfer->desc_virt[j].src_addr_lo =
+						cpu_to_le32(PCI_DMA_L(bus));
+			xfer->desc_virt[j].src_addr_hi =
+						cpu_to_le32(PCI_DMA_H(bus));
+			bus += sizeof(struct xdma_result);
+		}
+
+	}
+
+	req->sw_desc_idx += desc_max;
+}
+
+static void transfer_init(struct xdma_engine *engine,
+			struct xdma_request_cb *req, struct xdma_transfer *xfer)
+{
+	unsigned int desc_max = min_t(unsigned int,
+				req->sw_desc_cnt - req->sw_desc_idx,
+				XDMA_TRANSFER_MAX_DESC);
+	int i, last;
+	u32 control;
+	unsigned long flags;
+
+	memset(xfer, 0, sizeof(*xfer));
+
+	spin_lock_irqsave(&engine->lock, flags);
+	init_swait_queue_head(&xfer->wq);
+
+	/* remember direction of transfer */
+	xfer->dir = engine->dir;
+	xfer->desc_virt = engine->desc + engine->desc_idx;
+	xfer->res_virt = engine->cyclic_result + engine->desc_idx;
+	xfer->desc_bus = engine->desc_bus +
+			(sizeof(struct xdma_desc) * engine->desc_idx);
+	xfer->res_bus = engine->cyclic_result_bus +
+			(sizeof(struct xdma_result) * engine->desc_idx);
+	xfer->desc_index = engine->desc_idx;
+
+	if ((engine->desc_idx + desc_max) >= XDMA_TRANSFER_MAX_DESC)
+		desc_max = XDMA_TRANSFER_MAX_DESC - engine->desc_idx;
+
+	transfer_desc_init(xfer, desc_max);
+	transfer_build(engine, req, xfer, desc_max);
+
+	xfer->desc_adjacent = desc_max;
+
+	/* terminate last descriptor */
+	last = desc_max - 1;
+	/* stop engine, EOP for AXI ST, req IRQ on last descriptor */
+	control = XDMA_DESC_STOPPED;
+	control |= XDMA_DESC_EOP;
+	control |= XDMA_DESC_COMPLETED;
+	xdma_desc_control_set(xfer->desc_virt + last, control);
+
+	if (engine->eop_flush) {
+		for (i = 0; i < last; i++)
+			xdma_desc_control_set(xfer->desc_virt + i,
+					XDMA_DESC_COMPLETED);
+		xfer->desc_cmpl_th = 1;
+	} else
+		xfer->desc_cmpl_th = desc_max;
+
+	xfer->desc_num = desc_max;
+	engine->desc_idx = (engine->desc_idx + desc_max) % XDMA_TRANSFER_MAX_DESC;
+	engine->desc_used += desc_max;
+
+	/* fill in adjacent numbers */
+	for (i = 0; i < xfer->desc_num; i++) {
+		u32 next_adj = xdma_get_next_adj(xfer->desc_num - i - 1,
+						(xfer->desc_virt + i)->next_lo);
+		xdma_desc_adjacent(xfer->desc_virt + i, next_adj);
+	}
+
+	spin_unlock_irqrestore(&engine->lock, flags);
+}
+
+static void xdma_request_free(struct xdma_request_cb *req)
+{
+	kvfree(req);
+}
+
+static struct xdma_request_cb *xdma_request_alloc(struct xdma_dev *xdev,
+						  unsigned int sdesc_nr)
+{
+	unsigned int size = sizeof(struct xdma_request_cb) +
+			    sdesc_nr * sizeof(struct sw_desc);
+
+	return kvzalloc(size, GFP_KERNEL);
+}
+
+static struct xdma_request_cb *xdma_init_request(struct xdma_dev *xdev,
+						 struct sg_table *sgt,
+						 u64 ep_addr)
+{
+	struct xdma_request_cb *req;
+	struct scatterlist *sg = sgt->sgl;
+	int max = sgt->nents;
+	int extra = 0;
+	int i, j = 0;
+
+	for (i = 0; i < max; i++, sg = sg_next(sg)) {
+		unsigned int len = sg_dma_len(sg);
+
+		if (unlikely(len > XDMA_DESC_BLEN_MAX))
+			extra += (len + XDMA_DESC_BLEN_MAX - 1) / XDMA_DESC_BLEN_MAX;
+	}
+
+	max += extra;
+	req = xdma_request_alloc(xdev, max);
+	if (!req)
+		return NULL;
+
+	req->sgt = sgt;
+	req->ep_addr = ep_addr;
+
+	for (i = 0, sg = sgt->sgl; i < sgt->nents; i++, sg = sg_next(sg)) {
+		unsigned int tlen = sg_dma_len(sg);
+		dma_addr_t addr = sg_dma_address(sg);
+
+		req->total_len += tlen;
+		while (tlen) {
+			req->sdesc[j].addr = addr;
+			if (tlen > XDMA_DESC_BLEN_MAX) {
+				req->sdesc[j].len = XDMA_DESC_BLEN_MAX;
+				addr += XDMA_DESC_BLEN_MAX;
+				tlen -= XDMA_DESC_BLEN_MAX;
+			} else {
+				req->sdesc[j].len = tlen;
+				tlen = 0;
+			}
+			j++;
+		}
+	}
+
+	if (j > max) {
+		pr_err("XDMA: Max. transfer length (%d) exceeded",
+		       XDMA_DESC_BLEN_MAX);
+		xdma_request_free(req);
+		return NULL;
+	}
+	req->sw_desc_cnt = j;
+
+	return req;
+}
+
+static struct xdma_engine *channel_engine(struct xdma_core *xdma, int channel,
+					  bool write)
+{
+	if (write) {
+		if (channel >= xdma->h2c_channel_max) {
+			pr_err("XDMA: %d: invalid H2C channel\n", channel);
+			return NULL;
+		} else
+			return &xdma->xdev->engine_h2c[channel];
+	} else {
+		if (channel >= xdma->c2h_channel_max) {
+			pr_err("XDMA: %d: invalid C2H channel\n", channel);
+			return NULL;
+		} else
+			return &xdma->xdev->engine_c2h[channel];
+	}
+}
+
+static struct xdma_dev *alloc_dev(struct pci_dev *pdev)
+{
+	int i;
+	struct xdma_dev *xdev;
+	struct xdma_engine *engine;
+
+	xdev = kzalloc(sizeof(struct xdma_dev), GFP_KERNEL);
+	if (!xdev)
+		return NULL;
+
+	xdev->pdev = pdev;
+
+	engine = xdev->engine_h2c;
+	for (i = 0; i < XDMA_CHANNEL_NUM_MAX; i++, engine++) {
+		spin_lock_init(&engine->lock);
+		mutex_init(&engine->desc_lock);
+		INIT_LIST_HEAD(&engine->transfer_list);
+		init_swait_queue_head(&engine->shutdown_wq);
+	}
+
+	engine = xdev->engine_c2h;
+	for (i = 0; i < XDMA_CHANNEL_NUM_MAX; i++, engine++) {
+		spin_lock_init(&engine->lock);
+		mutex_init(&engine->desc_lock);
+		INIT_LIST_HEAD(&engine->transfer_list);
+		init_swait_queue_head(&engine->shutdown_wq);
+	}
+
+	return xdev;
+}
+
+static int set_dma_mask(struct xdma_dev *xdev)
+{
+	if (!dma_set_mask(&xdev->pdev->dev, DMA_BIT_MASK(64))) {
+		pr_devel("XDMA: Using a 64-bit DMA mask\n");
+		/* use 32-bit DMA for descriptors */
+		dma_set_coherent_mask(&xdev->pdev->dev, DMA_BIT_MASK(32));
+	} else if (!dma_set_mask(&xdev->pdev->dev, DMA_BIT_MASK(32))) {
+		pr_devel("XDMA: Using a 32-bit DMA mask\n");
+		dma_set_coherent_mask(&xdev->pdev->dev, DMA_BIT_MASK(32));
+	} else {
+		pr_err("XDMA: No suitable DMA possible.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int get_engine_channel_id(struct engine_regs *regs)
+{
+	int value = ioread32(&regs->identifier);
+
+	return (value & 0x00000f00U) >> 8;
+}
+
+static int get_engine_id(struct engine_regs *regs)
+{
+	int value = ioread32(&regs->identifier);
+
+	return (value & 0xffff0000U) >> 16;
+}
+
+static void remove_engines(struct xdma_dev *xdev, int h2c_channel_max,
+			   int c2h_channel_max)
+{
+	int i;
+
+	for (i = 0; i < h2c_channel_max; i++)
+		engine_destroy(xdev, &xdev->engine_h2c[i]);
+
+	for (i = 0; i < c2h_channel_max; i++)
+		engine_destroy(xdev, &xdev->engine_c2h[i]);
+}
+
+static int probe_for_engine(struct xdma_dev *xdev, enum dma_data_direction dir,
+			    int channel)
+{
+	struct engine_regs *regs;
+	int offset = channel * CHANNEL_SPACING;
+	u32 engine_id;
+	u32 engine_id_expected;
+	u32 channel_id;
+	struct xdma_engine *engine;
+
+	if (dir == DMA_TO_DEVICE) {
+		engine_id_expected = XDMA_ID_H2C;
+		engine = &xdev->engine_h2c[channel];
+	} else {
+		offset += H2C_CHANNEL_OFFSET;
+		engine_id_expected = XDMA_ID_C2H;
+		engine = &xdev->engine_c2h[channel];
+	}
+
+	regs = xdev->config_bar + offset;
+	engine_id = get_engine_id(regs);
+	channel_id = get_engine_channel_id(regs);
+
+	if ((engine_id != engine_id_expected) || (channel_id != channel)) {
+		pr_err("XDMA: %s engine #%d not found\n",
+		       dir == DMA_TO_DEVICE ? "H2C" : "C2H", channel);
+		return -EINVAL;
+	}
+
+	engine_init(engine, xdev, offset, dir, channel);
+
+	return 0;
+}
+
+static int probe_engines(struct xdma_dev *xdev, int h2c_channel_max,
+			 int c2h_channel_max)
+{
+	int i, rv;
+
+	for (i = 0; i < h2c_channel_max; i++) {
+		rv = probe_for_engine(xdev, DMA_TO_DEVICE, i);
+		if (rv)
+			return rv;
+	}
+
+	for (i = 0; i < c2h_channel_max; i++) {
+		rv = probe_for_engine(xdev, DMA_FROM_DEVICE, i);
+		if (rv)
+			return rv;
+	}
+
+	return 0;
+}
+
+
+int xdma_probe(struct xdma_core *xdma)
+{
+	int rv;
+
+	if (xdma->user_irq_max > MAX_USER_IRQ) {
+		pr_err("XDMA: %d: Invalid number of user IRQs\n",
+		       xdma->user_irq_max);
+		return -EINVAL;
+	}
+	if (xdma->h2c_channel_max > XDMA_CHANNEL_NUM_MAX) {
+		pr_err("XDMA: %d: Invalid number of H2C channels\n",
+		       xdma->h2c_channel_max);
+		return -EINVAL;
+	}
+	if (xdma->c2h_channel_max > XDMA_CHANNEL_NUM_MAX) {
+		pr_err("XDMA: %d: Invalid number of C2H channels\n",
+		       xdma->c2h_channel_max);
+		return -EINVAL;
+	}
+
+	xdma->xdev = alloc_dev(xdma->pdev);
+	if (!xdma->xdev)
+		return -ENOMEM;
+
+	rv = map_config_bar(xdma->xdev, xdma->config_bar_id);
+	if (rv)
+		goto err_map;
+
+	rv = set_dma_mask(xdma->xdev);
+	if (rv)
+		goto err_mask;
+
+	channel_interrupts_disable(xdma->xdev, ~0);
+	user_interrupts_disable(xdma->xdev, ~0);
+	/* Flush writes */
+	read_interrupts(xdma->xdev);
+
+	rv = probe_engines(xdma->xdev, xdma->h2c_channel_max, xdma->c2h_channel_max);
+	if (rv)
+		goto err_engines;
+
+	rv = irq_setup(xdma->xdev, xdma->h2c_channel_max, xdma->c2h_channel_max,
+		       xdma->user_irq_max);
+	if (rv < 0)
+		goto err_interrupts;
+	channel_interrupts_enable(xdma->xdev, ~0);
+	/* Flush writes */
+	read_interrupts(xdma->xdev);
+
+	return 0;
+
+err_interrupts:
+	irq_teardown(xdma->xdev, xdma->h2c_channel_max, xdma->c2h_channel_max,
+		     xdma->user_irq_max);
+err_engines:
+	remove_engines(xdma->xdev, xdma->h2c_channel_max, xdma->c2h_channel_max);
+err_mask:
+	unmap_config_bar(xdma->xdev, xdma->config_bar_id);
+err_map:
+	kfree(xdma->xdev);
+
+	return rv;
+}
+EXPORT_SYMBOL_GPL(xdma_probe);
+
+void xdma_remove(struct xdma_core *xdma)
+{
+	channel_interrupts_disable(xdma->xdev, ~0);
+	user_interrupts_disable(xdma->xdev, ~0);
+	/* Flush writes */
+	read_interrupts(xdma->xdev);
+
+	irq_teardown(xdma->xdev, xdma->h2c_channel_max, xdma->c2h_channel_max,
+		     xdma->user_irq_max);
+
+	remove_engines(xdma->xdev, xdma->h2c_channel_max, xdma->c2h_channel_max);
+	unmap_config_bar(xdma->xdev, xdma->config_bar_id);
+
+	kfree(xdma->xdev);
+}
+EXPORT_SYMBOL_GPL(xdma_remove);
+
+/**
+ * xdma_irq_enable - enable XDMA user interrupt(s)
+ * @xdma: XDMA device handle
+ * @mask: bitmask of user interrupts (0 ~ 15) to be registered
+ */
+void xdma_irq_enable(struct xdma_core *xdma, unsigned int mask)
+{
+	xdma->xdev->mask_irq_user |= mask;
+	user_interrupts_enable(xdma->xdev, mask);
+	/* Flush writes */
+	read_interrupts(xdma->xdev);
+}
+EXPORT_SYMBOL_GPL(xdma_irq_enable);
+
+/**
+ * xdma_irq_disable - disable XDMA user interrupt(s)
+ * @xdma: XDMA device handle
+ * @mask: bitmask of user interrupts (0 ~ 15) to be unregistered
+ */
+void xdma_irq_disable(struct xdma_core *xdma, unsigned int mask)
+{
+	xdma->xdev->mask_irq_user &= ~mask;
+	user_interrupts_disable(xdma->xdev, mask);
+	/* Flush writes */
+	read_interrupts(xdma->xdev);
+}
+EXPORT_SYMBOL_GPL(xdma_irq_disable);
+
+/**
+ * xdma_transfer - do a DMA transfer
+ * @xdma: XDMA device handle
+ * @channel: channel number
+ * @write: slecets read/write operation
+ * @ep_addr: offset into the DDR/BRAM (card) memory to read from or write to
+ * @sg_table: the scatter-gather list of data buffers
+ * @timeout_ms: timeout in mili-seconds
+ *
+ * Returns # of bytes transferred on success, negative on failure
+ */
+ssize_t xdma_transfer(struct xdma_core *xdma, int channel, bool write,
+		      u64 ep_addr, struct sg_table *sgt, int timeout_ms)
+{
+	struct xdma_engine *engine;
+	int rv = 0, i, nents;
+	ssize_t done = 0;
+	struct xdma_request_cb *req = NULL;
+
+
+	engine = channel_engine(xdma, channel, write);
+	if (!engine)
+		return -EINVAL;
+
+	req = xdma_init_request(xdma->xdev, sgt, ep_addr);
+	if (!req)
+		return -ENOMEM;
+
+	nents = req->sw_desc_cnt;
+	mutex_lock(&engine->desc_lock);
+
+	while (nents) {
+		unsigned long flags;
+		struct xdma_transfer *xfer;
+
+		/* build transfer */
+		transfer_init(engine, req, &req->tfer);
+		xfer = &req->tfer;
+
+		/* last transfer for the given request? */
+		nents -= xfer->desc_num;
+		if (!nents) {
+			xfer->last_in_request = 1;
+			xfer->sgt = sgt;
+		}
+
+		rv = transfer_queue(engine, xfer);
+		if (rv < 0)
+			break;
+
+		if (timeout_ms > 0)
+			swait_event_interruptible_timeout_exclusive(xfer->wq,
+				(xfer->state != TRANSFER_STATE_SUBMITTED),
+				msecs_to_jiffies(timeout_ms));
+		else
+			swait_event_interruptible_exclusive(xfer->wq,
+				(xfer->state != TRANSFER_STATE_SUBMITTED));
+
+		spin_lock_irqsave(&engine->lock, flags);
+
+		switch (xfer->state) {
+		case TRANSFER_STATE_COMPLETED:
+			spin_unlock_irqrestore(&engine->lock, flags);
+			/* For C2H streaming use writeback results */
+			if (engine->streaming &&
+			    engine->dir == DMA_FROM_DEVICE) {
+				struct xdma_result *result = xfer->res_virt;
+
+				for (i = 0; i < xfer->desc_cmpl; i++)
+					done += result[i].length;
+
+				/* finish the whole request */
+				if (engine->eop_flush)
+					nents = 0;
+			} else
+				done += xfer->len;
+			rv = 0;
+			break;
+		case TRANSFER_STATE_FAILED:
+			pr_warn("XDMA: transfer failed\n");
+			spin_unlock_irqrestore(&engine->lock, flags);
+			rv = -EIO;
+			break;
+		default:
+			/* transfer can still be in-flight */
+			pr_warn("XDMA: transfer timed out\n");
+			engine_status_read(engine, 0, 1);
+			transfer_abort(engine, xfer);
+			engine_stop(engine);
+			spin_unlock_irqrestore(&engine->lock, flags);
+			rv = -ERESTARTSYS;
+			break;
+		}
+
+		engine->desc_used -= xfer->desc_num;
+		transfer_destroy(xdma->xdev, xfer);
+
+		if (rv < 0)
+			break;
+	}
+
+	mutex_unlock(&engine->desc_lock);
+	xdma_request_free(req);
+
+	return rv ? rv : done;
+}
+EXPORT_SYMBOL_GPL(xdma_transfer);
+
+MODULE_AUTHOR("Digiteq Automotive s.r.o.");
+MODULE_DESCRIPTION("Xilinx XDMA Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/dma/xilinx_xdma.h b/include/linux/dma/xilinx_xdma.h
new file mode 100644
index 000000000000..c63dc7768e66
--- /dev/null
+++ b/include/linux/dma/xilinx_xdma.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file is part of the Xilinx DMA IP Core driver for Linux
+ *
+ * Copyright (c) 2016-2021,  Xilinx, Inc.
+ * Copyright (c) 2020-2022,  Digiteq Automotive s.r.o.
+ */
+
+#ifndef XILINX_XDMA_H
+#define XILINX_XDMA_H
+
+#include <linux/pci.h>
+#include <linux/scatterlist.h>
+
+struct xdma_dev;
+
+/**
+ * struct xdma_core - representation of XDMA hardware
+ * @pdev:		The parent PCIe device which contains the XDMA core
+ * @config_bar_id:	PCI BAR id where XDMA config regs are located
+ * @user_irq_max:	number of user IRQs
+ * @c2h_channel_max:	number of C2H DMA channels
+ * @h2c_channel_max:	number of H2C DMA channels
+ * @xdev:		struct xdma_dev that is filed by ->probe()
+ */
+struct xdma_core {
+	struct pci_dev *pdev;
+	int config_bar_id;
+	unsigned int user_irq_max;
+	unsigned int c2h_channel_max;
+	unsigned int h2c_channel_max;
+	struct xdma_dev *xdev;
+};
+
+int xdma_probe(struct xdma_core *xdma);
+void xdma_remove(struct xdma_core *xdma);
+
+void xdma_irq_enable(struct xdma_core *xdma, unsigned int mask);
+void xdma_irq_disable(struct xdma_core *xdma, unsigned int mask);
+
+ssize_t xdma_transfer(struct xdma_core *xdma, int channel, bool write,
+		      u64 ep_addr, struct sg_table *sgt, int timeout_ms);
+
+#endif /* XILINX_XDMA_H */
-- 
2.37.2

