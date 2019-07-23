Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FAA7215B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 23:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391987AbfGWVMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 17:12:19 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:58178 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728921AbfGWVMS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 17:12:18 -0400
Received: from [88.149.224.16] (port=34022 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1hq1Xk-007idA-Gd; Tue, 23 Jul 2019 22:37:53 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: [RFC,v2 5/6] media: ds90ub954: new driver for TI DS90UB954-Q1 video deserializer
Date:   Tue, 23 Jul 2019 22:37:22 +0200
Message-Id: <20190723203723.11730-6-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723203723.11730-1-luca@lucaceresoli.net>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a driver for the TI DS90UB954-Q1, a MIPI CSI-2 video deserializer that
forwards video streams from up to two FPD-Link 3 connections to a MIPI
CSI-2 output. It also allows access to remote I2C and GPIO.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes RFCv1 -> RFCv2:

 - i2c
   - add one i2c client per FPD-link RX port; this avoids the need to
     select ports before accessing the paged registers, and the locking
     that goes with it
   - don't use regmap: we have many clients now, having a regmap each was
     more burden than usefulness here as we use very few regmap features
   - switch from i2c-mux to i2c-atr, where the ATR functionality is now
   - add remote I2C adapters during probe, not when linked (simplifies a
     lot)
 - v4l2
   - v4l2: implement start/stop stream (!)
   - v4l2: remove unimplemented functions
 - device tree
   - get the remote serializer alias from DT, or fallback to a default
   - ditch the 'rxports' DT node, init rxports from 'ports'
   - get node to the remote chip from DT
   - get REFCLK from DT and expose it to the remote serializer
 - add remote GPIO support in the form of a gpiochip for each rxport to
   control GPIOs on the remote chip (input only for now)
 - enable IRQ (but keep polling loop as fallback)
 - add minimal CSI TX port management (DT + enable)
 - sysfs: notify 'locked' change (for poll(2) usage)
 - add test pattern generation
 - add some documentation
 - make log messages more uniform
 - many, many, many minor changes, fixes and cleanups

LIMITATIONS / TODO:

 - Implementation of V4L2 features is minimal; works in 1920x1080 YUV422
   only
 - Tested only with one of the two inputs at a time; no Virtual Channel ID
   mapping (routing) implemented
 - Do we really need ds90->alias_table_lock to protect the ATR table? Or
   are attach operations serialized?
 - The 'status' sysfs file is not sysfs compliant (contains multiple
   values). It was initially used to test the code and it should be
   rewritten differently.
 - Well tested on real hardware, but only on a 4.14 kernel
---
 drivers/media/i2c/Kconfig     |   14 +
 drivers/media/i2c/Makefile    |    2 +
 drivers/media/i2c/ds90ub954.c | 1575 +++++++++++++++++++++++++++++++++
 3 files changed, 1591 insertions(+)
 create mode 100644 drivers/media/i2c/ds90ub954.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 79ce9ec6fc1b..e7088ccfd280 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -555,6 +555,20 @@ config VIDEO_THS8200
 	  To compile this driver as a module, choose M here: the
 	  module will be called ths8200.
 
+comment "Video serializers and deserializers"
+
+config VIDEO_DS90UB954
+	tristate "TI DS90UB954-Q1 deserializer"
+	depends on OF_GPIO
+	select I2C_ATR
+	help
+	  Device driver for the Texas Instruments "DS90UB954-Q1 Dual
+	  4.16 Gbps FPD-Link III Deserializer Hub With MIPI CSI-2
+	  Outputs for 2MP/60fps Cameras and RADAR".
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ds90ub954.
+
 comment "Camera sensor devices"
 
 config VIDEO_APTINA_PLL
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fd4ea86dedd5..66e52ededa4e 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -115,4 +115,6 @@ obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
 
+obj-$(CONFIG_VIDEO_DS90UB954)	+= ds90ub954.o
+
 obj-$(CONFIG_SDR_MAX2175) += max2175.o
diff --git a/drivers/media/i2c/ds90ub954.c b/drivers/media/i2c/ds90ub954.c
new file mode 100644
index 000000000000..e5893948b3bf
--- /dev/null
+++ b/drivers/media/i2c/ds90ub954.c
@@ -0,0 +1,1575 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Driver for the Texas Instruments DS90UB954-Q1 video deserializer
+ *
+ * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c-atr.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/slab.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-ctrls.h>
+
+/* TODO increase DS90_FPD_RX_NPORTS to 2, test, fix */
+#define DS90_FPD_RX_NPORTS	1  /* Physical FPD-link RX ports */
+#define DS90_CSI_TX_NPORTS	1  /* Physical CSI-2 TX ports */
+#define DS90_NPORTS		(DS90_FPD_RX_NPORTS + DS90_CSI_TX_NPORTS)
+
+#define DS90_NUM_GPIOS		7  /* Physical GPIO pins */
+#define DS90_NUM_BC_GPIOS	4  /* Max GPIOs on Back Channel */
+
+#define DS90_NUM_SLAVE_ALIASES	8
+#define DS90_MAX_POOL_ALIASES	(DS90_FPD_RX_NPORTS * DS90_NUM_SLAVE_ALIASES)
+
+/*
+ * Register map
+ *
+ * 0x00-0x32   Shared
+ * 0x33-0x3A   CSI-2 TX (per-port paged on DS90UB960, shared on 954)
+ * 0x4C        Shared
+ * 0x4D-0x7F   FPD-Link RX, per-port paged
+ * 0xB0-0xBF   Shared
+ * 0xD0-0xDF   FPD-Link RX, per-port paged
+ * 0xF0-0xF5   Shared
+ * 0xF8-0xFB   Shared
+ * All others  Reserved
+ *
+ * Register defines prefixes:
+ * DS90_SR_* = Shared register
+ * DS90_RR_* = FPD-Link RX, per-port paged register
+ * DS90_TR_* = CSI-2 TX, per-port paged register
+ * DS90_XR_* = Reserved register
+ * DS90_IR_* = Indirect register
+ */
+
+#define DS90_SR_I2C_DEV_ID		0x00
+#define DS90_SR_RESET			0x01
+#define DS90_SR_GEN_CONFIG		0x02
+#define DS90_SR_REV_MASK		0x03
+#define DS90_SR_DEVICE_STS		0x04
+#define DS90_SR_PAR_ERR_THOLD_HI	0x05
+#define DS90_SR_PAR_ERR_THOLD_LO	0x06
+#define DS90_SR_BCC_WDOG_CTL		0x07
+#define DS90_SR_I2C_CTL1		0x08
+#define DS90_SR_I2C_CTL2		0x09
+#define DS90_SR_SCL_HIGH_TIME		0x0A
+#define DS90_SR_SCL_LOW_TIME		0x0B
+#define DS90_SR_RX_PORT_CTL		0x0C
+#define DS90_SR_IO_CTL			0x0D
+#define DS90_SR_GPIO_PIN_STS		0x0E
+#define DS90_SR_GPIO_INPUT_CTL		0x0F
+#define DS90_SR_GPIO_PIN_CTL(n)		(0x10 + (n)) /* n < DS90_NUM_GPIOS */
+#define DS90_SR_FS_CTL			0x18
+#define DS90_SR_FS_HIGH_TIME_1		0x19
+#define DS90_SR_FS_HIGH_TIME_0		0x1A
+#define DS90_SR_FS_LOW_TIME_1		0x1B
+#define DS90_SR_FS_LOW_TIME_0		0x1C
+#define DS90_SR_MAX_FRM_HI		0x1D
+#define DS90_SR_MAX_FRM_LO		0x1E
+#define DS90_SR_CSI_PLL_CTL		0x1F
+
+#define DS90_SR_FWD_CTL1		0x20
+#define DS90_SR_FWD_CTL1_PORT_DIS(n)		BIT((n)+4)
+
+#define DS90_SR_FWD_CTL2		0x21
+#define DS90_SR_FWD_STS			0x22
+
+#define DS90_SR_INTERRUPT_CTL		0x23
+#define DS90_SR_INTERRUPT_CTL_INT_EN		BIT(7)
+#define DS90_SR_INTERRUPT_CTL_IE_CSI_TX0	BIT(4)
+#define DS90_SR_INTERRUPT_CTL_IE_RX(n)		BIT((n)) /* rxport[n] IRQ */
+#define DS90_SR_INTERRUPT_CTL_ALL		0x83 // TODO 0x93 to enable CSI
+
+#define DS90_SR_INTERRUPT_STS		0x24
+#define DS90_SR_INTERRUPT_STS_INT		BIT(7)
+#define DS90_SR_INTERRUPT_STS_IS_CSI_TX0	BIT(4)
+#define DS90_SR_INTERRUPT_STS_IS_RX(n)		BIT((n)) /* rxport[n] IRQ */
+
+#define DS90_SR_TS_CONFIG		0x25
+#define DS90_SR_TS_CONTROL		0x26
+#define DS90_SR_TS_LINE_HI		0x27
+#define DS90_SR_TS_LINE_LO		0x28
+#define DS90_SR_TS_STATUS		0x29
+#define DS90_SR_TIMESTAMP_P0_HI		0x2A
+#define DS90_SR_TIMESTAMP_P0_LO		0x2B
+#define DS90_SR_TIMESTAMP_P1_HI		0x2C
+#define DS90_SR_TIMESTAMP_P1_LO		0x2D
+
+#define DS90_TR_CSI_CTL			0x33
+#define DS90_TR_CSI_CTL_CSI_CAL_EN		BIT(6)
+#define DS90_TR_CSI_CTL_CSI_ENABLE		BIT(0)
+
+#define DS90_TR_CSI_CTL2		0x34
+#define DS90_TR_CSI_STS			0x35
+#define DS90_TR_CSI_TX_ICR		0x36
+
+#define DS90_TR_CSI_TX_ISR		0x37
+#define DS90_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR	BIT(3)
+#define DS90_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR	BIT(1)
+
+#define DS90_TR_CSI_TEST_CTL		0x38
+#define DS90_TR_CSI_TEST_PATT_HI	0x39
+#define DS90_TR_CSI_TEST_PATT_LO	0x3A
+
+#define DS90_XR_AEQ_CTL1		0x42
+#define DS90_XR_AEQ_ERR_THOLD		0x43
+#define DS90_XR_FPD3_CAP		0x4A
+#define DS90_XR_RAW_EMBED_DTYPE	0x4B
+
+#define DS90_SR_FPD3_PORT_SEL		0x4C
+
+#define DS90_RR_RX_PORT_STS1		0x4D
+#define DS90_RR_RX_PORT_STS1_BCC_CRC_ERROR	BIT(5)
+#define DS90_RR_RX_PORT_STS1_LOCK_STS_CHG	BIT(4)
+#define DS90_RR_RX_PORT_STS1_BCC_SEQ_ERROR	BIT(3)
+#define DS90_RR_RX_PORT_STS1_PARITY_ERROR	BIT(2)
+#define DS90_RR_RX_PORT_STS1_PORT_PASS		BIT(1)
+#define DS90_RR_RX_PORT_STS1_LOCK_STS		BIT(0)
+
+#define DS90_RR_RX_PORT_STS2		0x4E
+#define DS90_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE	BIT(7)
+#define DS90_RR_RX_PORT_STS2_LINE_LEN_CHG	BIT(6)
+#define DS90_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR	BIT(5)
+#define DS90_RR_RX_PORT_STS2_BUFFER_ERROR	BIT(4)
+#define DS90_RR_RX_PORT_STS2_CSI_ERROR		BIT(3)
+#define DS90_RR_RX_PORT_STS2_FREQ_STABLE	BIT(2)
+#define DS90_RR_RX_PORT_STS2_CABLE_FAULT	BIT(1)
+#define DS90_RR_RX_PORT_STS2_LINE_CNT_CHG	BIT(0)
+
+#define DS90_RR_RX_FREQ_HIGH		0x4F
+#define DS90_RR_RX_FREQ_LOW		0x50
+#define DS90_RR_SENSOR_STS_0		0x51
+#define DS90_RR_SENSOR_STS_1		0x52
+#define DS90_RR_SENSOR_STS_2		0x53
+#define DS90_RR_SENSOR_STS_3		0x54
+#define DS90_RR_RX_PAR_ERR_HI		0x55
+#define DS90_RR_RX_PAR_ERR_LO		0x56
+#define DS90_RR_BIST_ERR_COUNT		0x57
+
+#define DS90_RR_BCC_CONFIG		0x58
+#define DS90_RR_BCC_CONFIG_I2C_PASS_THROUGH	BIT(6)
+
+#define DS90_RR_DATAPATH_CTL1		0x59
+#define DS90_RR_DATAPATH_CTL2		0x5A
+#define DS90_RR_SER_ID			0x5B
+#define DS90_RR_SER_ALIAS_ID		0x5C
+
+/* For these two register sets: n < DS90_NUM_SLAVE_ALIASES */
+#define DS90_RR_SLAVE_ID(n)		(0x5D + (n))
+#define DS90_RR_SLAVE_ALIAS(n)		(0x65 + (n))
+
+#define DS90_RR_PORT_CONFIG		0x6D
+#define DS90_RR_BC_GPIO_CTL(n)		(0x6E + (n)) /* n < 2 */
+#define DS90_RR_RAW10_ID		0x70
+#define DS90_RR_RAW12_ID		0x71
+#define DS90_RR_CSI_VC_MAP		0x72
+#define DS90_RR_LINE_COUNT_HI		0x73
+#define DS90_RR_LINE_COUNT_LO		0x74
+#define DS90_RR_LINE_LEN_1		0x75
+#define DS90_RR_LINE_LEN_0		0x76
+#define DS90_RR_FREQ_DET_CTL		0x77
+#define DS90_RR_MAILBOX_1		0x78
+#define DS90_RR_MAILBOX_2		0x79
+
+#define DS90_RR_CSI_RX_STS		0x7A
+#define DS90_RR_CSI_RX_STS_LENGTH_ERR		BIT(3)
+#define DS90_RR_CSI_RX_STS_CKSUM_ERR		BIT(2)
+#define DS90_RR_CSI_RX_STS_ECC2_ERR		BIT(1)
+#define DS90_RR_CSI_RX_STS_ECC1_ERR		BIT(0)
+
+#define DS90_RR_CSI_ERR_COUNTER	0x7B
+#define DS90_RR_PORT_CONFIG2		0x7C
+#define DS90_RR_PORT_PASS_CTL		0x7D
+#define DS90_RR_SEN_INT_RISE_CTL	0x7E
+#define DS90_RR_SEN_INT_FALL_CTL	0x7F
+
+#define DS90_XR_REFCLK_FREQ		0xA5
+
+#define DS90_SR_IND_ACC_CTL		0xB0
+#define DS90_SR_IND_ACC_CTL_IA_AUTO_INC		BIT(1)
+
+#define DS90_SR_IND_ACC_ADDR		0xB1
+#define DS90_SR_IND_ACC_DATA		0xB2
+#define DS90_SR_BIST_CONTROL		0xB3
+#define DS90_SR_MODE_IDX_STS		0xB8
+#define DS90_SR_LINK_ERROR_COUNT	0xB9
+#define DS90_SR_FPD3_ENC_CTL		0xBA
+#define DS90_SR_FV_MIN_TIME		0xBC
+#define DS90_SR_GPIO_PD_CTL		0xBE
+
+#define DS90_RR_PORT_DEBUG		0xD0
+#define DS90_RR_AEQ_CTL2		0xD2
+#define DS90_RR_AEQ_STATUS		0xD3
+#define DS90_RR_AEQ_BYPASS		0xD4
+#define DS90_RR_AEQ_MIN_MAX		0xD5
+#define DS90_RR_PORT_ICR_HI		0xD8
+#define DS90_RR_PORT_ICR_LO		0xD9
+#define DS90_RR_PORT_ISR_HI		0xDA
+#define DS90_RR_PORT_ISR_LO		0xDB
+#define DS90_RR_FC_GPIO_STS		0xDC
+#define DS90_RR_FC_GPIO_ICR		0xDD
+#define DS90_RR_SEN_INT_RISE_STS	0xDE
+#define DS90_RR_SEN_INT_FALL_STS	0xDF
+
+#define DS90_SR_FPD3_RX_ID0		0xF0
+#define DS90_SR_FPD3_RX_ID1		0xF1
+#define DS90_SR_FPD3_RX_ID2		0xF2
+#define DS90_SR_FPD3_RX_ID3		0xF3
+#define DS90_SR_FPD3_RX_ID4		0xF4
+#define DS90_SR_FPD3_RX_ID5		0xF5
+#define DS90_SR_I2C_RX_ID(n)		(0xF8 + (n)) /* < DS90_FPD_RX_NPORTS */
+
+/* DS90_IR_PGEN_*: Indirect Registers for Test Pattern Generator */
+
+#define DS90_IR_PGEN_CTL		0x01
+#define DS90_IR_PGEN_CTL_PGEN_ENABLE		BIT(0)
+
+#define DS90_IR_PGEN_CFG		0x02
+#define DS90_IR_PGEN_CSI_DI		0x03
+#define DS90_IR_PGEN_LINE_SIZE1		0x04
+#define DS90_IR_PGEN_LINE_SIZE0		0x05
+#define DS90_IR_PGEN_BAR_SIZE1		0x06
+#define DS90_IR_PGEN_BAR_SIZE0		0x07
+#define DS90_IR_PGEN_ACT_LPF1		0x08
+#define DS90_IR_PGEN_ACT_LPF0		0x09
+#define DS90_IR_PGEN_TOT_LPF1		0x0A
+#define DS90_IR_PGEN_TOT_LPF0		0x0B
+#define DS90_IR_PGEN_LINE_PD1		0x0C
+#define DS90_IR_PGEN_LINE_PD0		0x0D
+#define DS90_IR_PGEN_VBP		0x0E
+#define DS90_IR_PGEN_VFP		0x0F
+#define DS90_IRT_PGEN_COLOR(n)		(0x10 + (n)) /* n < 15 */
+
+/**
+ * struct ds90_rxport_info - Info for instantiating rxports from device tree
+ * local_name:       DT name of the RX port
+ * remote_name:      DT name of the remote serializer
+ * local_def_alias:  Fallback I2C alias for the RX port if not found in DT
+ * remote_def_alias: Fallback I2C alias for the remote deserializer if not
+ *                   found in DT
+ */
+struct ds90_rxport_info {
+	const char *local_name;
+	const char *remote_name;
+	u8 local_def_alias;
+	u8 remote_def_alias;
+};
+
+struct ds90_rxport {
+	/* Errors and anomalies counters */
+	u64 bcc_crc_error_count;
+	u64 bcc_seq_error_count;
+	u64 line_len_unstable_count;
+	u64 line_len_chg_count;
+	u64 fpd3_encode_error_count;
+	u64 buffer_error_count;
+	u64 line_cnt_chg_count;
+	u64 csi_rx_sts_length_err_count;
+	u64 csi_rx_sts_cksum_err_count;
+	u64 csi_rx_sts_ecc2_err_count;
+	u64 csi_rx_sts_ecc1_err_count;
+
+	struct gpio_chip        gpio_chip;
+	char                    gpio_chip_name[64];
+
+	struct i2c_client      *reg_client; /* for per-port local registers */
+
+	struct device_node     *remote_of_node; /* "remote-chip" OF node */
+	struct i2c_client      *ser_client; /* remote serializer */
+	unsigned short          ser_alias; /* ser i2c alias (lower 7 bits) */
+	bool                    locked;
+
+	struct ds90_data *ds90;
+	unsigned short nport; /* RX port number, and index in ds90->rxport[] */
+};
+
+struct ds90_csitxport {
+	u32                     data_rate; /* Nominal data rate (Gb/s) */
+};
+
+struct ds90_data {
+	struct i2c_client      *client;  /* for shared local registers */
+	struct gpio_desc       *reset_gpio;
+	struct task_struct     *kthread;
+	struct i2c_atr         *atr;
+	struct ds90_rxport     *rxport[DS90_FPD_RX_NPORTS];
+	struct ds90_csitxport   csitxport;
+
+	struct v4l2_subdev          sd;
+	struct media_pad            pads[DS90_NPORTS];
+	struct v4l2_mbus_framefmt   fmt[DS90_NPORTS];
+	struct v4l2_ctrl_handler    ctrl_handler;
+
+	unsigned long               refclk;
+
+	/* Address Translator alias-to-slave map table */
+	size_t       atr_alias_num; /* Number of aliases configured */
+	u16          atr_alias_id[DS90_MAX_POOL_ALIASES]; /* 0 = no alias */
+	u16          atr_slave_id[DS90_MAX_POOL_ALIASES]; /* 0 = not in use */
+	struct mutex alias_table_lock;
+};
+
+#define sd_to_ds90(_sd) container_of(_sd, struct ds90_data, sd)
+
+enum {
+	TEST_PATTERN_DISABLED = 0,
+	TEST_PATTERN_V_COLOR_BARS_1,
+	TEST_PATTERN_V_COLOR_BARS_2,
+	TEST_PATTERN_V_COLOR_BARS_4,
+	TEST_PATTERN_V_COLOR_BARS_8,
+};
+
+static const char * const ds90_tpg_qmenu[] = {
+	"Disabled",
+	"1 vertical color bar",
+	"2 vertical color bars",
+	"4 vertical color bars",
+	"8 vertical color bars",
+};
+
+/* -----------------------------------------------------------------------------
+ * Basic device access
+ */
+
+static int ds90_read(const struct ds90_data *ds90,
+		     const struct i2c_client *client,
+		     u8 reg, u8 *val)
+{
+	int ret = i2c_smbus_read_byte_data(client, reg);
+
+	if (ret < 0) {
+		dev_err(&ds90->client->dev,
+			"%s[0x%02x]: cannot read register 0x%02x (%d)!\n",
+			__func__, client->addr, reg, ret);
+	} else {
+		*val = ret;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int ds90_read_shared(const struct ds90_data *ds90, u8 reg, u8 *val)
+{
+	return ds90_read(ds90, ds90->client, reg, val);
+}
+
+static int ds90_read_rxport(const struct ds90_data *ds90, int nport,
+			    u8 reg, u8 *val)
+{
+	return ds90_read(ds90, ds90->rxport[nport]->reg_client, reg, val);
+}
+
+static int ds90_write(const struct ds90_data *ds90,
+		      const struct i2c_client *client,
+		      u8 reg, u8 val)
+{
+	int ret = i2c_smbus_write_byte_data(client, reg, val);
+
+	if (ret < 0)
+		dev_err(&ds90->client->dev,
+			"%s[0x%02x]: cannot write register 0x%02x (%d)!\n",
+			__func__, client->addr, reg, ret);
+	else
+		ret = 0;
+
+	return ret;
+}
+
+static int ds90_write_shared(const struct ds90_data *ds90, u8 reg, u8 val)
+{
+	return ds90_write(ds90, ds90->client, reg, val);
+}
+
+static int ds90_write_rxport(const struct ds90_data *ds90, int nport,
+			     u8 reg, u8 val)
+{
+	return ds90_write(ds90, ds90->rxport[nport]->reg_client, reg, val);
+}
+
+static int ds90_write_ind8(const struct ds90_data *ds90, u8 reg, u8 val)
+{
+	int err;
+
+	err = ds90_write_shared(ds90, DS90_SR_IND_ACC_ADDR, reg);
+	if (!err)
+		err = ds90_write_shared(ds90, DS90_SR_IND_ACC_DATA, val);
+	return err;
+}
+
+/* Assumes IA_AUTO_INC is set in DS90_SR_IND_ACC_CTL */
+static int ds90_write_ind16(const struct ds90_data *ds90, u8 reg, u16 val)
+{
+	int err;
+
+	err = ds90_write_shared(ds90, DS90_SR_IND_ACC_ADDR, reg);
+	if (!err)
+		err = ds90_write_shared(ds90, DS90_SR_IND_ACC_DATA, val >> 8);
+	if (!err)
+		err = ds90_write_shared(ds90, DS90_SR_IND_ACC_DATA, val & 0xff);
+	return err;
+}
+
+static int ds90_update_bits(const struct ds90_data *ds90,
+			    const struct i2c_client *client,
+			    u8 reg, u8 mask, u8 val)
+{
+	int ret = i2c_smbus_read_byte_data(client, reg);
+
+	if (ret < 0) {
+		dev_err(&ds90->client->dev,
+			"%s[0x%02x]: cannot read register 0x%02x (%d)!\n",
+			__func__, client->addr, reg, ret);
+		return ret;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, reg,
+					(ret & ~mask) | (val & mask));
+	if (ret < 0) {
+		dev_err(&ds90->client->dev,
+			"%s[0x%02x]: cannot write register 0x%02x (%d)!\n",
+			__func__, client->addr, reg, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ds90_update_bits_shared(const struct ds90_data *ds90,
+				   u8 reg, u8 mask, u8 val)
+{
+	return ds90_update_bits(ds90, ds90->client,
+				reg, mask, val);
+}
+
+static int ds90_update_bits_rxport(const struct ds90_data *ds90, int nport,
+				   u8 reg, u8 mask, u8 val)
+{
+	return ds90_update_bits(ds90, ds90->rxport[nport]->reg_client,
+				reg, mask, val);
+}
+
+static void ds90_reset(const struct ds90_data *ds90, bool keep_reset)
+{
+	gpiod_set_value_cansleep(ds90->reset_gpio, 1);
+	usleep_range(3000, 6000); /* min 2 ms */
+
+	if (!keep_reset) {
+		gpiod_set_value_cansleep(ds90->reset_gpio, 0);
+		usleep_range(2000, 4000); /* min 1 ms */
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * I2C-ATR (address translator)
+ */
+
+static int ds90_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
+				  const struct i2c_board_info *info,
+				  const struct i2c_client *client,
+				  u16 *alias_id)
+{
+	struct ds90_data *ds90 = i2c_atr_get_clientdata(atr);
+	struct ds90_rxport *rxport = ds90->rxport[chan_id];
+	struct device *dev = &ds90->client->dev;
+	u16 alias = 0;
+	int reg_idx;
+	int pool_idx;
+	int err = 0;
+
+	dev_dbg(dev, "rx%d: %s\n", chan_id, __func__);
+
+	mutex_lock(&ds90->alias_table_lock);
+
+	/* Find unused alias in table */
+
+	for (pool_idx = 0; pool_idx < ds90->atr_alias_num; pool_idx++)
+		if (ds90->atr_slave_id[pool_idx] == 0)
+			break;
+
+	if (pool_idx == ds90->atr_alias_num) {
+		dev_warn(dev, "rx%d: alias pool exhausted\n", rxport->nport);
+		err = -EADDRNOTAVAIL;
+		goto out;
+	}
+
+	alias = ds90->atr_alias_id[pool_idx];
+
+	/* Find first unused alias register */
+
+	for (reg_idx = 0; reg_idx < DS90_NUM_SLAVE_ALIASES; reg_idx++) {
+		u8 regval;
+
+		err = ds90_read_rxport(ds90, chan_id,
+				       DS90_RR_SLAVE_ALIAS(reg_idx), &regval);
+		if (!err && regval == 0)
+			break;
+	}
+
+	if (reg_idx == DS90_NUM_SLAVE_ALIASES) {
+		dev_warn(dev, "rx%d: all aliases in use\n", rxport->nport);
+		err = -EADDRNOTAVAIL;
+		goto out;
+	}
+
+	/* Map alias to slave */
+
+	ds90_write_rxport(ds90, chan_id,
+			  DS90_RR_SLAVE_ID(reg_idx), client->addr << 1);
+	ds90_write_rxport(ds90, chan_id,
+			  DS90_RR_SLAVE_ALIAS(reg_idx), alias << 1);
+
+	ds90->atr_slave_id[pool_idx] = client->addr;
+
+	*alias_id = alias; /* tell the atr which alias we chose */
+
+	dev_info(dev, "rx%d: client 0x%02x mapped at alias 0x%02x (%s)\n",
+		 rxport->nport, client->addr, alias, client->name);
+
+out:
+	mutex_unlock(&ds90->alias_table_lock);
+	return err;
+}
+
+static void ds90_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
+				   const struct i2c_client *client)
+{
+	struct ds90_data *ds90 = i2c_atr_get_clientdata(atr);
+	struct ds90_rxport *rxport = ds90->rxport[chan_id];
+	struct device *dev = &ds90->client->dev;
+	u16 alias = 0;
+	int reg_idx;
+	int pool_idx;
+
+	mutex_lock(&ds90->alias_table_lock);
+
+	/* Find alias mapped to this client */
+
+	for (pool_idx = 0; pool_idx < ds90->atr_alias_num; pool_idx++)
+		if (ds90->atr_slave_id[pool_idx] == client->addr)
+			break;
+
+	if (pool_idx == ds90->atr_alias_num) {
+		dev_err(dev, "rx%d: client 0x%02x is not mapped!\n",
+			rxport->nport, client->addr);
+		goto out;
+	}
+
+	alias = ds90->atr_alias_id[pool_idx];
+
+	/* Find alias register used for this client */
+
+	for (reg_idx = 0; reg_idx < DS90_NUM_SLAVE_ALIASES; reg_idx++) {
+		u8 regval;
+		int err;
+
+		err = ds90_read_rxport(ds90, chan_id,
+				       DS90_RR_SLAVE_ALIAS(reg_idx), &regval);
+		if (!err && regval == (alias << 1))
+			break;
+	}
+
+	if (reg_idx == DS90_NUM_SLAVE_ALIASES) {
+		dev_err(dev,
+			"rx%d: cannot find alias 0x%02x reg (client 0x%02x)!\n",
+			rxport->nport, alias, client->addr);
+		goto out;
+	}
+
+	/* Unmap */
+
+	ds90_write_rxport(ds90, chan_id, DS90_RR_SLAVE_ALIAS(reg_idx), 0);
+	ds90->atr_slave_id[pool_idx] = 0;
+
+	dev_info(dev, "rx%d: client 0x%02x unmapped from alias 0x%02x (%s)\n",
+		 rxport->nport, client->addr, alias, client->name);
+
+out:
+	mutex_unlock(&ds90->alias_table_lock);
+}
+
+static const struct i2c_atr_ops ds90_atr_ops = {
+	.attach_client = ds90_atr_attach_client,
+	.detach_client = ds90_atr_detach_client,
+};
+
+/* -----------------------------------------------------------------------------
+ * CSI ports
+ */
+
+static int ds90_csiport_probe_one(struct ds90_data *ds90,
+				  const struct device_node *np)
+{
+	struct device *dev = &ds90->client->dev;
+	struct ds90_csitxport *csitxport = &ds90->csitxport;
+
+	if (of_property_read_u32(np, "data-rate", &csitxport->data_rate) != 0) {
+		dev_err(dev, "OF: %s: missing \"data-rate\" node\n",
+			of_node_full_name(np));
+		return -EINVAL;
+	}
+
+	if (csitxport->data_rate != 1600000000 &&
+	    csitxport->data_rate !=  800000000 &&
+	    csitxport->data_rate !=  400000000) {
+		dev_err(dev, "OF: %s: invalid \"data-rate\" node\n",
+			of_node_full_name(np));
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "Nominal data rate: %u", csitxport->data_rate);
+
+	return 0;
+}
+
+static void ds90_csi_handle_events(struct ds90_data *ds90)
+{
+	struct device *dev = &ds90->client->dev;
+	u8 csi_tx_isr;
+	int err;
+
+	err = ds90_read_shared(ds90, DS90_TR_CSI_TX_ISR, &csi_tx_isr);
+
+	if (!err) {
+		if (csi_tx_isr & DS90_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
+			dev_warn(dev, "CSI_SYNC_ERROR\n");
+
+		if (csi_tx_isr & DS90_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
+			dev_warn(dev, "CSI_PASS_ERROR\n");
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * GPIO CHIP: control GPIOs on the remote side
+ */
+
+static int ds90_gpio_direction_out(struct gpio_chip *chip,
+				   unsigned int offset, int value)
+{
+	struct ds90_rxport *rxport = gpiochip_get_data(chip);
+	unsigned int reg_addr = DS90_RR_BC_GPIO_CTL(offset / 2);
+	unsigned int reg_shift = (offset % 2) * 4;
+
+	ds90_update_bits_rxport(rxport->ds90, rxport->nport, reg_addr,
+				0xf << reg_shift,
+				(0x8 + !!value) << reg_shift);
+	return 0;
+}
+
+static void ds90_gpio_set(struct gpio_chip *chip,
+			  unsigned int offset, int value)
+{
+	ds90_gpio_direction_out(chip, offset, value);
+}
+
+static int ds90_gpio_of_xlate(struct gpio_chip *chip,
+			      const struct of_phandle_args *gpiospec,
+			      u32 *flags)
+{
+	struct ds90_rxport *rxport = gpiochip_get_data(chip);
+	u32 bank = gpiospec->args[0];
+
+	if (bank != rxport->nport)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[2];
+
+	return gpiospec->args[1];
+}
+
+static int ds90_gpiochip_probe(struct ds90_data *ds90, int nport)
+{
+	struct ds90_rxport *rxport = ds90->rxport[nport];
+	struct gpio_chip *gc = &rxport->gpio_chip;
+	struct device *dev = &ds90->client->dev;
+	int err;
+
+	scnprintf(rxport->gpio_chip_name, sizeof(rxport->gpio_chip_name),
+		  "%s:rx%d", dev_name(dev), nport);
+
+	gc->label               = rxport->gpio_chip_name;
+	gc->parent              = dev;
+	gc->owner               = THIS_MODULE;
+	gc->base                = -1;
+	gc->can_sleep           = 1;
+	gc->ngpio               = DS90_NUM_BC_GPIOS;
+	gc->direction_output    = ds90_gpio_direction_out;
+	gc->set                 = ds90_gpio_set;
+	gc->of_xlate            = ds90_gpio_of_xlate;
+	gc->of_node             = ds90->client->dev.of_node;
+	gc->of_gpio_n_cells     = 3;
+
+	err = gpiochip_add_data(gc, rxport);
+	if (err) {
+		dev_err(dev, "rx%d: Failed to add GPIOs: %d\n", nport, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void ds90_gpiochip_remove(struct ds90_data *ds90, int nport)
+{
+	struct ds90_rxport *rxport = ds90->rxport[nport];
+	struct gpio_chip *gc = &rxport->gpio_chip;
+
+	gpiochip_remove(gc);
+}
+
+/* -----------------------------------------------------------------------------
+ * RX ports
+ */
+
+static ssize_t locked_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf);
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf);
+
+static struct device_attribute dev_attr_locked[] = {
+	__ATTR_RO(locked),
+	__ATTR_RO(locked),
+};
+
+static struct device_attribute dev_attr_status[] = {
+	__ATTR_RO(status),
+	__ATTR_RO(status),
+};
+
+static struct attribute *ds90_rxport0_attrs[] = {
+	&dev_attr_locked[0].attr,
+	&dev_attr_status[0].attr,
+	NULL
+};
+
+static struct attribute *ds90_rxport1_attrs[] = {
+	&dev_attr_locked[1].attr,
+	&dev_attr_status[1].attr,
+	NULL
+};
+
+static ssize_t locked_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	int nport = (attr - dev_attr_locked);
+	const struct ds90_data *ds90 = dev_get_drvdata(dev);
+	const struct ds90_rxport *rxport = ds90->rxport[nport];
+
+	return scnprintf(buf, PAGE_SIZE, "%d", rxport->locked);
+}
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	int nport = (attr - dev_attr_status);
+	const struct ds90_data *ds90 = dev_get_drvdata(dev);
+	const struct ds90_rxport *rxport = ds90->rxport[nport];
+
+	return scnprintf(buf, PAGE_SIZE,
+			 "bcc_crc_error_count = %llu\n"
+			 "bcc_seq_error_count = %llu\n"
+			 "line_len_unstable_count = %llu\n"
+			 "line_len_chg_count = %llu\n"
+			 "fpd3_encode_error_count = %llu\n"
+			 "buffer_error_count = %llu\n"
+			 "line_cnt_chg_count = %llu\n"
+			 "csi_rx_sts_length_err_count = %llu\n"
+			 "csi_rx_sts_cksum_err_count = %llu\n"
+			 "csi_rx_sts_ecc2_err_count = %llu\n"
+			 "csi_rx_sts_ecc1_err_count = %llu\n",
+			 rxport->bcc_crc_error_count,
+			 rxport->bcc_seq_error_count,
+			 rxport->line_len_unstable_count,
+			 rxport->line_len_chg_count,
+			 rxport->fpd3_encode_error_count,
+			 rxport->buffer_error_count,
+			 rxport->line_cnt_chg_count,
+			 rxport->csi_rx_sts_length_err_count,
+			 rxport->csi_rx_sts_cksum_err_count,
+			 rxport->csi_rx_sts_ecc2_err_count,
+			 rxport->csi_rx_sts_ecc1_err_count);
+}
+
+struct attribute_group ds90_rxport_attr_group[] = {
+	{ .name = "rx0", .attrs = ds90_rxport0_attrs },
+	{ .name = "rx1", .attrs = ds90_rxport1_attrs },
+};
+
+/*
+ * Instantiate serializer and i2c adapter for the just-locked remote
+ * end.
+ *
+ * @note Must be called with ds90->alias_table_lock not held! The added i2c
+ * adapter will probe new slaves, which can request i2c transfers, ending
+ * up in calling ds90_atr_attach_client() where the lock is taken.
+ */
+static int ds90_rxport_add_serializer(struct ds90_data *ds90, int nport)
+{
+	struct ds90_rxport *rxport = ds90->rxport[nport];
+	struct device *dev = &ds90->client->dev;
+	struct i2c_board_info ser_info = { .type = "ds90ub953-q1",
+					   .of_node = rxport->remote_of_node,
+					   // TODO is this OK?
+					   .platform_data = &ds90->refclk };
+	int err;
+
+	/*
+	 * Adding the serializer under rxport->adap would be cleaner,
+	 * but it would need tweaks to bypass the alias table. Adding
+	 * to the upstream adapter is way simpler.
+	 */
+	ser_info.addr = rxport->ser_alias;
+	rxport->ser_client = i2c_new_device(ds90->client->adapter, &ser_info);
+	if (!rxport->ser_client) {
+		dev_err(dev, "rx%d: cannot add %s i2c device",
+			nport, ser_info.type);
+		return -EIO;
+	}
+
+	dev_info(dev, "rx%d: remote serializer at alias 0x%02x\n",
+		 nport, rxport->ser_client->addr);
+
+	return err;
+}
+
+static void ds90_rxport_remove_serializer(struct ds90_data *ds90, int nport)
+{
+	struct ds90_rxport *rxport = ds90->rxport[nport];
+
+	if (rxport->ser_client) {
+		i2c_unregister_device(rxport->ser_client);
+		rxport->ser_client = NULL;
+	}
+}
+
+/*
+ * Return the local alias for a given remote serializer.
+ * Get it from devicetree, if absent fallback to the default.
+ */
+static unsigned short
+ds90_rxport_get_remote_alias(struct ds90_data *ds90,
+			     const struct ds90_rxport_info *info)
+{
+	struct device_node *np = ds90->client->dev.of_node;
+	u32 alias = info->remote_def_alias;
+	int i;
+
+	if (np) {
+		i = of_property_match_string(np, "reg-names",
+					     info->remote_name);
+		if (i >= 0)
+			of_property_read_u32_index(np, "reg", i, &alias);
+	}
+
+	return alias;
+}
+
+static int ds90_rxport_probe_one(struct ds90_data *ds90,
+				 const struct device_node *np,
+				 unsigned int nport)
+{
+	struct device *dev = &ds90->client->dev;
+	const struct ds90_rxport_info *info;
+	struct ds90_rxport *rxport;
+	int err;
+
+	static const struct ds90_rxport_info rxport_info[DS90_FPD_RX_NPORTS] = {
+		{ "rxport0", "ser0", 0x40, 0x50 },
+		{ "rxport1", "ser1", 0x41, 0x51 },
+	};
+
+	if (ds90->rxport[nport]) {
+		dev_err(dev, "OF: %s: reg value %d is duplicated\n",
+			of_node_full_name(np), nport);
+		return -EADDRINUSE;
+	}
+
+	rxport = kzalloc(sizeof(*rxport), GFP_KERNEL);
+	if (!rxport)
+		return -ENOMEM;
+
+	ds90->rxport[nport] = rxport;
+
+	info = &rxport_info[nport];
+
+	rxport->nport     = nport;
+	rxport->ds90      = ds90;
+	rxport->ser_alias = ds90_rxport_get_remote_alias(ds90, info);
+
+	rxport->remote_of_node = of_get_child_by_name(np, "remote-chip");
+	if (!rxport->remote_of_node) {
+		dev_err(dev, "OF: %s: missing remote-chip child\n",
+			of_node_full_name(np));
+		err = -EINVAL;
+		goto err_remote_chip;
+	}
+
+	/* Initialize access to local registers */
+	rxport->reg_client = i2c_new_secondary_device(ds90->client,
+						      info->local_name,
+						      info->local_def_alias);
+	if (!rxport->reg_client) {
+		err = -ENOMEM;
+		goto err_new_secondary_device;
+	}
+	ds90_write_shared(ds90, DS90_SR_I2C_RX_ID(nport),
+			  rxport->reg_client->addr << 1);
+
+	err = ds90_gpiochip_probe(ds90, nport);
+	if (err)
+		goto err_gpiochip_probe;
+
+	/* Enable all interrupt sources from this port */
+	ds90_write_rxport(ds90, nport, DS90_RR_PORT_ICR_HI, 0x07);
+	ds90_write_rxport(ds90, nport, DS90_RR_PORT_ICR_LO, 0x7f);
+
+	/* Set pass-through, but preserve BC_FREQ_SELECT strapping options */
+	ds90_update_bits_rxport(ds90, nport, DS90_RR_BCC_CONFIG,
+				DS90_RR_BCC_CONFIG_I2C_PASS_THROUGH, ~0);
+
+	/* Enable I2C communication to the serializer via the alias addr */
+	ds90_write_rxport(ds90, nport,
+			  DS90_RR_SER_ALIAS_ID, rxport->ser_alias << 1);
+
+	err = sysfs_create_group(&dev->kobj, &ds90_rxport_attr_group[nport]);
+	if (err) {
+		dev_err(dev, "rx%d: failed creating sysfs group", nport);
+		goto err_sysfs;
+	}
+
+	err = i2c_atr_add_adapter(ds90->atr, nport);
+	if (err) {
+		dev_err(dev, "rx%d: cannot add adapter", nport);
+		goto err_add_adapter;
+	}
+
+	dev_info(dev, "rx%d: at alias 0x%02x\n",
+		 nport, rxport->reg_client->addr);
+
+	return 0;
+
+err_add_adapter:
+	sysfs_remove_group(&dev->kobj, &ds90_rxport_attr_group[nport]);
+err_sysfs:
+	ds90_gpiochip_remove(ds90, nport);
+err_gpiochip_probe:
+	i2c_unregister_device(rxport->reg_client);
+err_new_secondary_device:
+	of_node_put(rxport->remote_of_node);
+err_remote_chip:
+	ds90->rxport[nport] = NULL;
+	kfree(rxport);
+	return err;
+}
+
+static void ds90_rxport_remove_one(struct ds90_data *ds90, int nport)
+{
+	struct ds90_rxport *rxport = ds90->rxport[nport];
+	struct device *dev = &ds90->client->dev;
+
+	i2c_atr_del_adapter(ds90->atr, nport);
+	ds90_rxport_remove_serializer(ds90, nport);
+	ds90_gpiochip_remove(ds90, nport);
+	i2c_unregister_device(rxport->reg_client);
+	sysfs_remove_group(&dev->kobj, &ds90_rxport_attr_group[nport]);
+	of_node_put(rxport->remote_of_node);
+	kfree(rxport);
+}
+
+static int ds90_atr_probe(struct ds90_data *ds90)
+{
+	struct i2c_adapter *parent_adap = ds90->client->adapter;
+	struct device *dev = &ds90->client->dev;
+
+	ds90->atr = i2c_atr_new(parent_adap, dev, &ds90_atr_ops,
+				DS90_FPD_RX_NPORTS);
+	if (IS_ERR(ds90->atr))
+		return PTR_ERR(ds90->atr);
+
+	i2c_atr_set_clientdata(ds90->atr, ds90);
+
+	return 0;
+}
+
+static void ds90_atr_remove(struct ds90_data *ds90)
+{
+	i2c_atr_delete(ds90->atr);
+	ds90->atr = NULL;
+}
+
+static void ds90_rxport_handle_events(struct ds90_data *ds90, int nport)
+{
+	struct ds90_rxport *rxport = ds90->rxport[nport];
+	struct device *dev = &ds90->client->dev;
+	u8 rx_port_sts1;
+	u8 rx_port_sts2;
+	u8 csi_rx_sts;
+	bool locked;
+	int err = 0;
+
+	/* Read interrupts (also clears most of them) */
+	if (!err)
+		err = ds90_read_rxport(ds90, nport,
+				       DS90_RR_RX_PORT_STS1, &rx_port_sts1);
+	if (!err)
+		err = ds90_read_rxport(ds90, nport,
+				       DS90_RR_RX_PORT_STS2, &rx_port_sts2);
+	if (!err)
+		err = ds90_read_rxport(ds90, nport,
+				       DS90_RR_CSI_RX_STS, &csi_rx_sts);
+
+	if (err)
+		return;
+
+	if (rx_port_sts1 & DS90_RR_RX_PORT_STS1_BCC_CRC_ERROR)
+		rxport->bcc_crc_error_count++;
+
+	if (rx_port_sts1 & DS90_RR_RX_PORT_STS1_BCC_SEQ_ERROR)
+		rxport->bcc_seq_error_count++;
+
+	if (rx_port_sts2 & DS90_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE)
+		rxport->line_len_unstable_count++;
+
+	if (rx_port_sts2 & DS90_RR_RX_PORT_STS2_LINE_LEN_CHG)
+		rxport->line_len_chg_count++;
+
+	if (rx_port_sts2 & DS90_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR)
+		rxport->fpd3_encode_error_count++;
+
+	if (rx_port_sts2 & DS90_RR_RX_PORT_STS2_BUFFER_ERROR)
+		rxport->buffer_error_count++;
+
+	if (rx_port_sts2 & DS90_RR_RX_PORT_STS2_LINE_CNT_CHG)
+		rxport->line_cnt_chg_count++;
+
+	if (csi_rx_sts & DS90_RR_CSI_RX_STS_LENGTH_ERR)
+		rxport->csi_rx_sts_length_err_count++;
+
+	if (csi_rx_sts & DS90_RR_CSI_RX_STS_CKSUM_ERR)
+		rxport->csi_rx_sts_cksum_err_count++;
+
+	if (csi_rx_sts & DS90_RR_CSI_RX_STS_ECC2_ERR)
+		rxport->csi_rx_sts_ecc2_err_count++;
+
+	if (csi_rx_sts & DS90_RR_CSI_RX_STS_ECC1_ERR)
+		rxport->csi_rx_sts_ecc1_err_count++;
+
+	/* Update locked status */
+	locked = rx_port_sts1 & DS90_RR_RX_PORT_STS1_LOCK_STS;
+	if (locked && !rxport->locked) {
+		dev_info(dev, "rx%d: LOCKED\n", nport);
+		/* See note about locking in ds90_rxport_add_serializer()! */
+		ds90_rxport_add_serializer(ds90, nport);
+		sysfs_notify(&dev->kobj,
+			     ds90_rxport_attr_group[nport].name, "locked");
+	} else if (!locked && rxport->locked) {
+		dev_info(dev, "rx%d: NOT LOCKED\n", nport);
+		ds90_rxport_remove_serializer(ds90, nport);
+		sysfs_notify(&dev->kobj,
+			     ds90_rxport_attr_group[nport].name, "locked");
+	}
+	rxport->locked = locked;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2
+ */
+
+static void ds90_set_tpg(struct ds90_data *ds90, int tpg_num)
+{
+	/*
+	 * Note: no need to write DS90_REG_IND_ACC_CTL: the only indirect
+	 * registers target we use is "CSI-2 Pattern Generator & Timing
+	 * Registers", which is the default
+	 */
+
+	if (tpg_num == 0) {
+		/* TPG off, enable forwarding from FPD-3 RX ports */
+		ds90_write_shared(ds90, DS90_SR_FWD_CTL1, 0x00);
+
+		ds90_write_ind8(ds90, DS90_IR_PGEN_CTL, 0x00);
+		return;
+	} else {
+		/* TPG on */
+
+		u8 vbp = 33;
+		u8 vfp = 10;
+		u16 blank_lines = vbp + vfp + 2; /* total blanking lines */
+
+		u16 width  = ds90->fmt[DS90_NPORTS - 1].width;
+		u16 height = ds90->fmt[DS90_NPORTS - 1].height;
+		u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
+		u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
+		u8 num_cbars = 1 << cbars_idx;
+
+		u16 line_size = width * bytespp;      /* Line size [bytes] */
+		u16 bar_size = line_size / num_cbars; /* cbar size [bytes] */
+		u16 act_lpf = height;                 /* active lines/frame */
+		u16 tot_lpf = act_lpf + blank_lines;  /* tot lines/frame */
+		/* Line period in 10-ns units */
+		u16 line_pd = 100000000 / 60 / tot_lpf;
+
+		/* Disable forwarding from FPD-3 RX ports */
+		ds90_write_shared(ds90,
+				  DS90_SR_FWD_CTL1,
+				  DS90_SR_FWD_CTL1_PORT_DIS(0) |
+				  DS90_SR_FWD_CTL1_PORT_DIS(1));
+
+		/* Access Indirect Pattern Gen */
+		ds90_write_shared(ds90,
+				  DS90_SR_IND_ACC_CTL,
+				  DS90_SR_IND_ACC_CTL_IA_AUTO_INC | 0);
+
+		ds90_write_ind8(ds90,
+				DS90_IR_PGEN_CTL,
+				DS90_IR_PGEN_CTL_PGEN_ENABLE);
+
+		/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
+		ds90_write_ind8(ds90, DS90_IR_PGEN_CFG, cbars_idx << 4 | 0x2);
+		ds90_write_ind8(ds90, DS90_IR_PGEN_CSI_DI, 0x1e);
+
+		ds90_write_ind16(ds90, DS90_IR_PGEN_LINE_SIZE1, line_size);
+		ds90_write_ind16(ds90, DS90_IR_PGEN_BAR_SIZE1,  bar_size);
+		ds90_write_ind16(ds90, DS90_IR_PGEN_ACT_LPF1,   act_lpf);
+		ds90_write_ind16(ds90, DS90_IR_PGEN_TOT_LPF1,   tot_lpf);
+		ds90_write_ind16(ds90, DS90_IR_PGEN_LINE_PD1,   line_pd);
+		ds90_write_ind8(ds90,  DS90_IR_PGEN_VBP,        vbp);
+		ds90_write_ind8(ds90,  DS90_IR_PGEN_VFP,        vfp);
+	}
+}
+
+static int ds90_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ds90_data *ds90 = container_of(ctrl->handler, struct ds90_data,
+					      ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ds90_set_tpg(ds90, ctrl->val);
+		break;
+	}
+	return 0;
+}
+
+static int ds90_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ds90_data *ds90 = sd_to_ds90(sd);
+	unsigned int csi_ctl = DS90_TR_CSI_CTL_CSI_ENABLE;
+	unsigned int speed_select = 3;
+
+	if (enable) {
+		switch (ds90->csitxport.data_rate) {
+		case 1600000000:
+			speed_select = 0;
+			break;
+		case  800000000:
+			speed_select = 2;
+			break;
+		case  400000000:
+			speed_select = 3;
+			break;
+		}
+
+		/*
+		 * From the datasheet: "initial CSI Skew-Calibration
+		 * sequence [...] should be set when operating at 1.6 Gbps"
+		 */
+		if (speed_select == 0)
+			csi_ctl |= DS90_TR_CSI_CTL_CSI_CAL_EN;
+
+		ds90_write_shared(ds90, DS90_SR_CSI_PLL_CTL, speed_select);
+		ds90_write_shared(ds90, DS90_TR_CSI_CTL, csi_ctl);
+	} else {
+		ds90_write_shared(ds90, DS90_TR_CSI_CTL, 0);
+	}
+
+	return 0;
+}
+
+static struct v4l2_mbus_framefmt *
+ds90_get_pad_format(struct ds90_data *ds90,
+		    struct v4l2_subdev_pad_config *cfg,
+		    unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&ds90->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &ds90->fmt[pad];
+	default:
+		return NULL;
+	}
+}
+
+static int ds90_get_fmt(struct v4l2_subdev *sd,
+			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_format *format)
+{
+	struct ds90_data *ds90 = sd_to_ds90(sd);
+	struct v4l2_mbus_framefmt *cfg_fmt;
+
+	if (format->pad >= DS90_NPORTS)
+		return -EINVAL;
+
+	cfg_fmt = ds90_get_pad_format(ds90, cfg, format->pad, format->which);
+	if (!cfg_fmt)
+		return -EINVAL;
+
+	format->format = *cfg_fmt;
+
+	return 0;
+}
+
+static void ds90_init_format(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width		= 1920;
+	fmt->height		= 1080;
+	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
+	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
+	fmt->field		= V4L2_FIELD_NONE;
+}
+
+static const struct v4l2_ctrl_ops ds90_ctrl_ops = {
+	.s_ctrl		= ds90_s_ctrl,
+};
+
+static const struct v4l2_subdev_video_ops ds90_video_ops = {
+	.s_stream	= ds90_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ds90_pad_ops = {
+	.get_fmt	= ds90_get_fmt,
+};
+
+static const struct v4l2_subdev_ops ds90_subdev_ops = {
+	.video		= &ds90_video_ops,
+	.pad		= &ds90_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * Core
+ */
+
+static irqreturn_t ds90_handle_events(int irq, void *arg)
+{
+	struct ds90_data *ds90 = arg;
+	u8 int_sts;
+	int err;
+	int i;
+
+	err = ds90_read_shared(ds90, DS90_SR_INTERRUPT_STS, &int_sts);
+
+	if (!err && int_sts) {
+		if (int_sts & DS90_SR_INTERRUPT_STS_IS_CSI_TX0)
+			ds90_csi_handle_events(ds90);
+
+		for (i = 0; i < DS90_FPD_RX_NPORTS; i++)
+			if (int_sts & DS90_SR_INTERRUPT_STS_IS_RX(i) &&
+			    ds90->rxport[i])
+				ds90_rxport_handle_events(ds90, i);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int ds90_run(void *arg)
+{
+	struct ds90_data *ds90 = arg;
+
+	while (1) {
+		if (kthread_should_stop())
+			break;
+
+		ds90_handle_events(0, ds90);
+
+		msleep(1000);
+	}
+
+	return 0;
+}
+
+static void ds90_remove_ports(struct ds90_data *ds90)
+{
+	int i;
+
+	for (i = 0; i < DS90_FPD_RX_NPORTS; i++)
+		if (ds90->rxport[i])
+			ds90_rxport_remove_one(ds90, i);
+
+	/* CSI ports have no _remove_one(). No rollback needed. */
+}
+
+static int ds90_parse_dt(struct ds90_data *ds90)
+{
+	struct device_node *np = ds90->client->dev.of_node;
+	struct device *dev = &ds90->client->dev;
+	struct device_node *ep_np = NULL;
+	int err = 0;
+	int n;
+
+	if (!np) {
+		dev_err(dev, "OF: no device tree node!\n");
+		return -ENOENT;
+	}
+
+	n = of_property_read_variable_u16_array(np, "i2c-alias-pool",
+						ds90->atr_alias_id,
+						2, DS90_MAX_POOL_ALIASES);
+	if (n < 0)
+		dev_warn(dev,
+			 "OF: no i2c-alias-pool, can't access remote I2C slaves");
+
+	ds90->atr_alias_num = n;
+
+	dev_dbg(dev, "i2c-alias-pool has %zu aliases", ds90->atr_alias_num);
+
+	for_each_endpoint_of_node(np, ep_np) {
+		struct of_endpoint ep;
+
+		of_graph_parse_endpoint(ep_np, &ep);
+
+		if (ep.port >= DS90_NPORTS) {
+			dev_err(dev,
+				"OF: %s: missing or invalid reg property\n",
+				of_node_full_name(np));
+			return -EINVAL;
+		}
+
+		if (ep.port < DS90_FPD_RX_NPORTS)
+			err = ds90_rxport_probe_one(ds90, ep_np, ep.port);
+		else
+			err = ds90_csiport_probe_one(ds90, ep_np);
+
+		if (err) {
+			of_node_put(ep_np);
+			break;
+		}
+	}
+
+	if (err)
+		ds90_remove_ports(ds90);
+
+	return err;
+}
+
+static int ds90_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ds90_data *ds90;
+	struct clk *clk;
+	u8 rev_mask;
+	int err;
+	int i;
+
+	ds90 = devm_kzalloc(dev, sizeof(*ds90), GFP_KERNEL);
+	if (!ds90)
+		return -ENOMEM;
+
+	ds90->client = client;
+	i2c_set_clientdata(client, ds90);
+	mutex_init(&ds90->alias_table_lock);
+
+	/* get reset pin from DT */
+	ds90->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ds90->reset_gpio)) {
+		err = PTR_ERR(ds90->reset_gpio);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Cannot get reset GPIO (%d)", err);
+		return err;
+	}
+
+	ds90_reset(ds90, false);
+
+	clk = clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		err = PTR_ERR(clk);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Cannot get REFCLK (%d)", err);
+		return err;
+	}
+	ds90->refclk = clk_get_rate(clk);
+	clk_put(clk);
+	dev_dbg(dev, "REFCLK %lu", ds90->refclk);
+
+	/* Runtime check register accessibility */
+	err = ds90_read_shared(ds90, DS90_SR_REV_MASK, &rev_mask);
+	if (err) {
+		dev_err(dev, "Cannot read first register (%d), abort\n", err);
+		goto err_reg_read;
+	}
+
+	err = ds90_atr_probe(ds90);
+	if (err)
+		goto err_atr_probe;
+
+	err = ds90_parse_dt(ds90);
+	if (err)
+		goto err_parse_dt;
+
+	/* V4L2 */
+
+	for (i = 0; i < DS90_NPORTS; i++)
+		ds90_init_format(&ds90->fmt[i]);
+
+	v4l2_i2c_subdev_init(&ds90->sd, client, &ds90_subdev_ops);
+	v4l2_ctrl_handler_init(&ds90->ctrl_handler,
+			       ARRAY_SIZE(ds90_tpg_qmenu) - 1);
+	ds90->sd.ctrl_handler = &ds90->ctrl_handler;
+
+	v4l2_ctrl_new_std_menu_items(&ds90->ctrl_handler, &ds90_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ds90_tpg_qmenu) - 1, 0, 0,
+				     ds90_tpg_qmenu);
+
+	if (ds90->ctrl_handler.error) {
+		err = ds90->ctrl_handler.error;
+		goto err_add_ctrls;
+	}
+
+	/* Let both the I2C client and the subdev point to us */
+	i2c_set_clientdata(client, ds90); /* v4l2_i2c_subdev_init writes it */
+	v4l2_set_subdevdata(&ds90->sd, ds90);
+
+	ds90->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ds90->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	for (i = 0; i < DS90_NPORTS; i++)
+		ds90->pads[i].flags = (i < DS90_FPD_RX_NPORTS) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	err = media_entity_pads_init(&ds90->sd.entity, DS90_NPORTS, ds90->pads);
+	if (err)
+		goto err_pads_init;
+
+	err = v4l2_async_register_subdev(&ds90->sd);
+	if (err) {
+		dev_err(dev, "v4l2_async_register_subdev error %d\n", err);
+		goto err_register_subdev;
+	}
+
+	/* Kick off */
+
+	if (client->irq) {
+		dev_info(dev, "using IRQ %d\n", client->irq);
+
+		err = devm_request_threaded_irq(dev, client->irq,
+						NULL, ds90_handle_events,
+						IRQF_ONESHOT, client->name,
+						ds90);
+		if (err) {
+			dev_err(dev, "Cannot enable IRQ (%d)\n", err);
+			goto err_irq;
+		}
+
+		/* Disable GPIO3 as input */
+		ds90_update_bits_shared(ds90, DS90_SR_GPIO_INPUT_CTL,
+					BIT(3), 0);
+		/* Enable GPIO3 as output, active low interrupt */
+		ds90_write_shared(ds90, DS90_SR_GPIO_PIN_CTL(3), 0xd1);
+
+		ds90_write_shared(ds90, DS90_SR_INTERRUPT_CTL,
+				  DS90_SR_INTERRUPT_CTL_ALL);
+	} else {
+		/* No IRQ, fallback to polling */
+
+		ds90->kthread = kthread_run(ds90_run, ds90, dev_name(dev));
+		if (IS_ERR(ds90->kthread)) {
+			err = PTR_ERR(ds90->kthread);
+			dev_err(dev, "Cannot create kthread (%d)\n", err);
+			goto err_kthread;
+		}
+		dev_info(dev, "using polling mode\n");
+	}
+
+	/* By default enable forwarding from both ports */
+	ds90_write_shared(ds90, DS90_SR_FWD_CTL1, 0x00);
+
+	dev_info(dev, "Successfully probed (rev/mask %02x)\n", rev_mask);
+
+	return 0;
+
+err_kthread:
+err_irq:
+	v4l2_async_unregister_subdev(&ds90->sd);
+err_register_subdev:
+	media_entity_cleanup(&ds90->sd.entity);
+err_pads_init:
+err_add_ctrls:
+	v4l2_ctrl_handler_free(&ds90->ctrl_handler);
+	ds90_remove_ports(ds90);
+err_parse_dt:
+	ds90_atr_remove(ds90);
+err_atr_probe:
+err_reg_read:
+	ds90_reset(ds90, true);
+	mutex_destroy(&ds90->alias_table_lock);
+	return err;
+}
+
+static int ds90_remove(struct i2c_client *client)
+{
+	struct ds90_data *ds90 = i2c_get_clientdata(client);
+
+	dev_info(&client->dev, "Removing\n");
+
+	if (ds90->kthread)
+		kthread_stop(ds90->kthread);
+	v4l2_async_unregister_subdev(&ds90->sd);
+	media_entity_cleanup(&ds90->sd.entity);
+	v4l2_ctrl_handler_free(&ds90->ctrl_handler);
+	ds90_remove_ports(ds90);
+	ds90_atr_remove(ds90);
+	ds90_reset(ds90, true);
+	mutex_destroy(&ds90->alias_table_lock);
+
+	return 0;
+}
+
+static const struct i2c_device_id ds90_id[] = {
+	{ "ds90ub954-q1", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ds90_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id ds90_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ds90_dt_ids);
+#endif
+
+static struct i2c_driver ds90ub954_driver = {
+	.probe_new	= ds90_probe,
+	.remove		= ds90_remove,
+	.id_table	= ds90_id,
+	.driver = {
+		.name	= "ds90ub954",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(ds90_dt_ids),
+	},
+};
+
+module_i2c_driver(ds90ub954_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Texas Instruments DS90UB954-Q1 CSI-2 dual deserializer driver");
+MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
-- 
2.17.1

