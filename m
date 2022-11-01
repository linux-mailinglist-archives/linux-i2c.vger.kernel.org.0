Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9077614BA7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiKANVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiKANVV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:21:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F9512AB8;
        Tue,  1 Nov 2022 06:21:05 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 360EA330C;
        Tue,  1 Nov 2022 14:21:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308861;
        bh=YFFuIWqs2aYwS0fJwW055Z1+fPlZH+uxesXjVSpRBCA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iIw526ZZw7RAOsS66f76HeT0lsnl/RSce4+nFkw3Cq28rCxYPhpGfkfPFx+a9A07z
         z636PH6BwK7mvl0g2JoSG9mKT/tfn0RUpTKkcLsuYd6vPfTbnEGLtXK9PtqYPDuS9B
         uwsAzT2Y+avATBfGECQ6lkKmUt7UDbwck2HaVXKU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 6/8] media: i2c: add DS90UB960 driver
Date:   Tue,  1 Nov 2022 15:20:30 +0200
Message-Id: <20221101132032.1542416-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add driver for TI DS90UB960 FPDLink-3 Deserializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/Kconfig     |   16 +
 drivers/media/i2c/Makefile    |    2 +
 drivers/media/i2c/ds90ub960.c | 4198 +++++++++++++++++++++++++++++++++
 include/media/i2c/ds90ub9xx.h |   16 +
 4 files changed, 4232 insertions(+)
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 include/media/i2c/ds90ub9xx.h

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7806d4b81716..2a78889e3487 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1595,4 +1595,20 @@ config VIDEO_THS7303
 
 endmenu
 
+#
+# Video serializers and deserializers (e.g. FPDLink)
+#
+
+menu "Video serializers and deserializers"
+
+config VIDEO_DS90UB960
+	tristate "TI DS90UB960 Deserializer"
+	depends on OF_GPIO
+	select I2C_ATR
+	help
+	  Device driver for the Texas Instruments DS90UB960
+	  FPD-Link III Deserializer
+
+endmenu
+
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 0a2933103dd9..2735b00437bb 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -142,3 +142,5 @@ obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_VS6624) += vs6624.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
+obj-$(CONFIG_VIDEO_DS90UB960)	+= ds90ub960.o
+
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
new file mode 100644
index 000000000000..c653474b5efc
--- /dev/null
+++ b/drivers/media/i2c/ds90ub960.c
@@ -0,0 +1,4198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Texas Instruments DS90UB960-Q1 video deserializer
+ *
+ * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
+ * Copyright (c) 2022 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c-atr.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include <media/i2c/ds90ub9xx.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#define UB960_POLL_TIME_MS	500
+
+#define UB960_MAX_RX_NPORTS	4
+#define UB960_MAX_TX_NPORTS	2
+#define UB960_MAX_NPORTS	(UB960_MAX_RX_NPORTS + UB960_MAX_TX_NPORTS)
+
+#define UB960_MAX_PORT_ALIASES	8
+#define UB960_MAX_POOL_ALIASES	(UB960_MAX_RX_NPORTS * UB960_MAX_PORT_ALIASES)
+
+#define UB960_NUM_BC_GPIOS		4
+
+/*
+ * Register map
+ *
+ * 0x00-0x32   Shared (UB960_SR)
+ * 0x33-0x3A   CSI-2 TX (per-port paged on DS90UB960, shared on 954) (UB960_TR)
+ * 0x4C        Shared (UB960_SR)
+ * 0x4D-0x7F   FPD-Link RX, per-port paged (UB960_RR)
+ * 0xB0-0xBF   Shared (UB960_SR)
+ * 0xD0-0xDF   FPD-Link RX, per-port paged (UB960_RR)
+ * 0xF0-0xF5   Shared (UB960_SR)
+ * 0xF8-0xFB   Shared (UB960_SR)
+ * All others  Reserved
+ *
+ * Register prefixes:
+ * UB960_SR_* = Shared register
+ * UB960_RR_* = FPD-Link RX, per-port paged register
+ * UB960_TR_* = CSI-2 TX, per-port paged register
+ * UB960_XR_* = Reserved register
+ * UB960_IR_* = Indirect register
+ */
+
+#define UB960_SR_I2C_DEV_ID			0x00
+#define UB960_SR_RESET				0x01
+#define UB960_SR_GEN_CONFIG			0x02
+#define UB960_SR_REV_MASK			0x03
+#define UB960_SR_DEVICE_STS			0x04
+#define UB960_SR_PAR_ERR_THOLD_HI		0x05
+#define UB960_SR_PAR_ERR_THOLD_LO		0x06
+#define UB960_SR_BCC_WDOG_CTL			0x07
+#define UB960_SR_I2C_CTL1			0x08
+#define UB960_SR_I2C_CTL2			0x09
+#define UB960_SR_SCL_HIGH_TIME			0x0A
+#define UB960_SR_SCL_LOW_TIME			0x0B
+#define UB960_SR_RX_PORT_CTL			0x0C
+#define UB960_SR_IO_CTL				0x0D
+#define UB960_SR_GPIO_PIN_STS			0x0E
+#define UB960_SR_GPIO_INPUT_CTL			0x0F
+#define UB960_SR_GPIO_PIN_CTL(n)		(0x10 + (n)) /* n < UB960_NUM_GPIOS */
+#define UB960_SR_FS_CTL				0x18
+#define UB960_SR_FS_HIGH_TIME_1			0x19
+#define UB960_SR_FS_HIGH_TIME_0			0x1A
+#define UB960_SR_FS_LOW_TIME_1			0x1B
+#define UB960_SR_FS_LOW_TIME_0			0x1C
+#define UB960_SR_MAX_FRM_HI			0x1D
+#define UB960_SR_MAX_FRM_LO			0x1E
+#define UB960_SR_CSI_PLL_CTL			0x1F
+
+#define UB960_SR_FWD_CTL1			0x20
+#define UB960_SR_FWD_CTL1_PORT_DIS(n)		BIT((n) + 4)
+
+#define UB960_SR_FWD_CTL2			0x21
+#define UB960_SR_FWD_STS			0x22
+
+#define UB960_SR_INTERRUPT_CTL			0x23
+#define UB960_SR_INTERRUPT_CTL_INT_EN		BIT(7)
+#define UB960_SR_INTERRUPT_CTL_IE_CSI_TX0	BIT(4)
+#define UB960_SR_INTERRUPT_CTL_IE_RX(n)		BIT((n)) /* rxport[n] IRQ */
+#define UB960_SR_INTERRUPT_CTL_ALL		0x83 /* TODO 0x93 to enable CSI */
+
+#define UB960_SR_INTERRUPT_STS			0x24
+#define UB960_SR_INTERRUPT_STS_INT		BIT(7)
+#define UB960_SR_INTERRUPT_STS_IS_CSI_TX(n)	BIT(4 + (n)) /* txport[n] IRQ */
+#define UB960_SR_INTERRUPT_STS_IS_RX(n)		BIT((n)) /* rxport[n] IRQ */
+
+#define UB960_SR_TS_CONFIG			0x25
+#define UB960_SR_TS_CONTROL			0x26
+#define UB960_SR_TS_LINE_HI			0x27
+#define UB960_SR_TS_LINE_LO			0x28
+#define UB960_SR_TS_STATUS			0x29
+#define UB960_SR_TIMESTAMP_P0_HI		0x2A
+#define UB960_SR_TIMESTAMP_P0_LO		0x2B
+#define UB960_SR_TIMESTAMP_P1_HI		0x2C
+#define UB960_SR_TIMESTAMP_P1_LO		0x2D
+
+#define UB960_SR_CSI_PORT_SEL			0x32
+
+#define UB960_TR_CSI_CTL			0x33
+#define UB960_TR_CSI_CTL_CSI_CAL_EN		BIT(6)
+#define UB960_TR_CSI_CTL_CSI_ENABLE		BIT(0)
+
+#define UB960_TR_CSI_CTL2			0x34
+#define UB960_TR_CSI_STS			0x35
+#define UB960_TR_CSI_TX_ICR			0x36
+
+#define UB960_TR_CSI_TX_ISR			0x37
+#define UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR	BIT(3)
+#define UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR	BIT(1)
+
+#define UB960_TR_CSI_TEST_CTL			0x38
+#define UB960_TR_CSI_TEST_PATT_HI		0x39
+#define UB960_TR_CSI_TEST_PATT_LO		0x3A
+
+#define UB960_XR_SFILTER_CFG			0x41
+#define UB960_XR_AEQ_CTL1			0x42
+#define UB960_XR_AEQ_ERR_THOLD			0x43
+
+#define UB960_RR_BCC_ERR_CTL			0x46
+#define UB960_RR_BCC_STATUS			0x47
+#define UB960_RR_BCC_STATUS_SEQ_ERROR		BIT(5)
+#define UB960_RR_BCC_STATUS_MASTER_ERR		BIT(4)
+#define UB960_RR_BCC_STATUS_MASTER_TO		BIT(3)
+#define UB960_RR_BCC_STATUS_SLAVE_ERR		BIT(2)
+#define UB960_RR_BCC_STATUS_SLAVE_TO		BIT(1)
+#define UB960_RR_BCC_STATUS_RESP_ERR		BIT(0)
+
+#define UB960_RR_FPD3_CAP			0x4A
+#define UB960_RR_RAW_EMBED_DTYPE		0x4B
+
+#define UB960_SR_FPD3_PORT_SEL			0x4C
+
+#define UB960_RR_RX_PORT_STS1			0x4D
+#define UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR	BIT(5)
+#define UB960_RR_RX_PORT_STS1_LOCK_STS_CHG	BIT(4)
+#define UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR	BIT(3)
+#define UB960_RR_RX_PORT_STS1_PARITY_ERROR	BIT(2)
+#define UB960_RR_RX_PORT_STS1_PORT_PASS		BIT(1)
+#define UB960_RR_RX_PORT_STS1_LOCK_STS		BIT(0)
+
+#define UB960_RR_RX_PORT_STS2			0x4E
+#define UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE	BIT(7)
+#define UB960_RR_RX_PORT_STS2_LINE_LEN_CHG	BIT(6)
+#define UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR	BIT(5)
+#define UB960_RR_RX_PORT_STS2_BUFFER_ERROR	BIT(4)
+#define UB960_RR_RX_PORT_STS2_CSI_ERROR		BIT(3)
+#define UB960_RR_RX_PORT_STS2_FREQ_STABLE	BIT(2)
+#define UB960_RR_RX_PORT_STS2_CABLE_FAULT	BIT(1)
+#define UB960_RR_RX_PORT_STS2_LINE_CNT_CHG	BIT(0)
+
+#define UB960_RR_RX_FREQ_HIGH			0x4F
+#define UB960_RR_RX_FREQ_LOW			0x50
+#define UB960_RR_SENSOR_STS_0			0x51
+#define UB960_RR_SENSOR_STS_1			0x52
+#define UB960_RR_SENSOR_STS_2			0x53
+#define UB960_RR_SENSOR_STS_3			0x54
+#define UB960_RR_RX_PAR_ERR_HI			0x55
+#define UB960_RR_RX_PAR_ERR_LO			0x56
+#define UB960_RR_BIST_ERR_COUNT			0x57
+
+#define UB960_RR_BCC_CONFIG			0x58
+#define UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH	BIT(6)
+
+#define UB960_RR_DATAPATH_CTL1			0x59
+#define UB960_RR_DATAPATH_CTL2			0x5A
+#define UB960_RR_SER_ID				0x5B
+#define UB960_RR_SER_ALIAS_ID			0x5C
+
+/* For these two register sets: n < UB960_MAX_PORT_ALIASES */
+#define UB960_RR_SLAVE_ID(n)			(0x5D + (n))
+#define UB960_RR_SLAVE_ALIAS(n)			(0x65 + (n))
+
+#define UB960_RR_PORT_CONFIG			0x6D
+#define UB960_RR_BC_GPIO_CTL(n)			(0x6E + (n)) /* n < 2 */
+#define UB960_RR_RAW10_ID			0x70
+#define UB960_RR_RAW12_ID			0x71
+#define UB960_RR_CSI_VC_MAP			0x72
+#define UB960_RR_LINE_COUNT_HI			0x73
+#define UB960_RR_LINE_COUNT_LO			0x74
+#define UB960_RR_LINE_LEN_1			0x75
+#define UB960_RR_LINE_LEN_0			0x76
+#define UB960_RR_FREQ_DET_CTL			0x77
+#define UB960_RR_MAILBOX_1			0x78
+#define UB960_RR_MAILBOX_2			0x79
+
+#define UB960_RR_CSI_RX_STS			0x7A
+#define UB960_RR_CSI_RX_STS_LENGTH_ERR		BIT(3)
+#define UB960_RR_CSI_RX_STS_CKSUM_ERR		BIT(2)
+#define UB960_RR_CSI_RX_STS_ECC2_ERR		BIT(1)
+#define UB960_RR_CSI_RX_STS_ECC1_ERR		BIT(0)
+
+#define UB960_RR_CSI_ERR_COUNTER		0x7B
+#define UB960_RR_PORT_CONFIG2			0x7C
+#define UB960_RR_PORT_PASS_CTL			0x7D
+#define UB960_RR_SEN_INT_RISE_CTL		0x7E
+#define UB960_RR_SEN_INT_FALL_CTL		0x7F
+
+#define UB960_SR_CSI_FRAME_COUNT_HI(n)		(0x90 + 8 * (n))
+#define UB960_SR_CSI_FRAME_COUNT_LO(n)		(0x91 + 8 * (n))
+#define UB960_SR_CSI_FRAME_ERR_COUNT_HI(n)	(0x92 + 8 * (n))
+#define UB960_SR_CSI_FRAME_ERR_COUNT_LO(n)	(0x93 + 8 * (n))
+#define UB960_SR_CSI_LINE_COUNT_HI(n)		(0x94 + 8 * (n))
+#define UB960_SR_CSI_LINE_COUNT_LO(n)		(0x95 + 8 * (n))
+#define UB960_SR_CSI_LINE_ERR_COUNT_HI(n)	(0x96 + 8 * (n))
+#define UB960_SR_CSI_LINE_ERR_COUNT_LO(n)	(0x97 + 8 * (n))
+
+#define UB960_XR_REFCLK_FREQ			0xA5	/* UB960 */
+
+#define UB960_RR_VC_ID_MAP(x)			(0xa0 + (x)) /* UB9702 */
+
+#define UB960_SR_IND_ACC_CTL			0xB0
+#define UB960_SR_IND_ACC_CTL_IA_AUTO_INC	BIT(1)
+
+#define UB960_SR_IND_ACC_ADDR			0xB1
+#define UB960_SR_IND_ACC_DATA			0xB2
+#define UB960_SR_BIST_CONTROL			0xB3
+#define UB960_SR_MODE_IDX_STS			0xB8
+#define UB960_SR_LINK_ERROR_COUNT		0xB9
+#define UB960_SR_FPD3_ENC_CTL			0xBA
+#define UB960_SR_FV_MIN_TIME			0xBC
+#define UB960_SR_GPIO_PD_CTL			0xBE
+
+#define UB960_SR_FPD_RATE_CFG			0xc2	/* UB9702 */
+#define UB960_SR_CSI_PLL_DIV			0xc9	/* UB9702 */
+
+#define UB960_RR_PORT_DEBUG			0xD0
+#define UB960_RR_AEQ_CTL2			0xD2
+#define UB960_RR_AEQ_STATUS			0xD3
+#define UB960_RR_AEQ_BYPASS			0xD4
+#define UB960_RR_AEQ_MIN_MAX			0xD5
+#define UB960_RR_SFILTER_STS_0			0xD6
+#define UB960_RR_SFILTER_STS_1			0xD7
+#define UB960_RR_PORT_ICR_HI			0xD8
+#define UB960_RR_PORT_ICR_LO			0xD9
+#define UB960_RR_PORT_ISR_HI			0xDA
+#define UB960_RR_PORT_ISR_LO			0xDB
+#define UB960_RR_FC_GPIO_STS			0xDC
+#define UB960_RR_FC_GPIO_ICR			0xDD
+#define UB960_RR_SEN_INT_RISE_STS		0xDE
+#define UB960_RR_SEN_INT_FALL_STS		0xDF
+
+#define UB960_RR_CHANNEL_MODE			0xe4	/* UB9702 */
+
+#define UB960_SR_FPD3_RX_ID(n)			(0xF0 + (n))
+
+#define UB960_SR_I2C_RX_ID(n)			(0xF8 + (n)) /* < UB960_FPD_RX_NPORTS */
+
+/* Indirect register blocks */
+#define UB960_IND_TARGET_PAT_GEN		0x00
+#define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
+#define UB960_IND_TARGET_CSI_CSIPLL_REG_1	0x92	/* UB9702 */
+#define UB960_IND_TARGET_CSI_ANA		0x07
+
+/* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */
+
+#define UB960_IR_PGEN_CTL			0x01
+#define UB960_IR_PGEN_CTL_PGEN_ENABLE		BIT(0)
+
+#define UB960_IR_PGEN_CFG			0x02
+#define UB960_IR_PGEN_CSI_DI			0x03
+#define UB960_IR_PGEN_LINE_SIZE1		0x04
+#define UB960_IR_PGEN_LINE_SIZE0		0x05
+#define UB960_IR_PGEN_BAR_SIZE1			0x06
+#define UB960_IR_PGEN_BAR_SIZE0			0x07
+#define UB960_IR_PGEN_ACT_LPF1			0x08
+#define UB960_IR_PGEN_ACT_LPF0			0x09
+#define UB960_IR_PGEN_TOT_LPF1			0x0A
+#define UB960_IR_PGEN_TOT_LPF0			0x0B
+#define UB960_IR_PGEN_LINE_PD1			0x0C
+#define UB960_IR_PGEN_LINE_PD0			0x0D
+#define UB960_IR_PGEN_VBP			0x0E
+#define UB960_IR_PGEN_VFP			0x0F
+#define UB960_IR_PGEN_COLOR(n)			(0x10 + (n)) /* n < 15 */
+
+#define UB960_IR_RX_ANA_STROBE_SET_CLK		0x08
+#define UB960_IR_RX_ANA_STROBE_SET_DATA		0x09
+
+/* EQ related */
+
+#define UB960_MIN_AEQ_STROBE_POS -7
+#define UB960_MAX_AEQ_STROBE_POS 7
+
+#define UB960_MIN_MANUAL_STROBE_POS -(7 + 6)
+#define UB960_MAX_MANUAL_STROBE_POS (7 + 6)
+#define UB960_NUM_MANUAL_STROBE_POS (UB960_MAX_MANUAL_STROBE_POS - UB960_MIN_MANUAL_STROBE_POS + 1)
+
+#define UB960_MIN_EQ_LEVEL 0
+#define UB960_MAX_EQ_LEVEL 14
+#define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
+
+struct ub960_hw_data {
+	const char *model;
+	u8 num_rxports;
+	u8 num_txports;
+	bool ub9702;
+	bool fpdlink4;
+};
+
+enum ub960_rxport_mode {
+	RXPORT_MODE_RAW10 = 0,
+	RXPORT_MODE_RAW12_HF = 1,
+	RXPORT_MODE_RAW12_LF = 2,
+	RXPORT_MODE_CSI2_SYNC = 3,
+	RXPORT_MODE_CSI2_ASYNC = 4,
+	RXPORT_MODE_LAST = RXPORT_MODE_CSI2_ASYNC,
+};
+
+enum ub960_rxport_cdr {
+	RXPORT_CDR_FPD3 = 0,
+	RXPORT_CDR_FPD4 = 1,
+	RXPORT_CDR_LAST = RXPORT_CDR_FPD4,
+};
+
+struct ub960_rxport {
+	struct ub960_data      *priv;
+	u8                      nport;	/* RX port number, and index in priv->rxport[] */
+
+	struct v4l2_subdev     *sd;	/* Connected subdev */
+	struct fwnode_handle   *fwnode;
+
+	enum ub960_rxport_mode  rx_mode;
+	enum ub960_rxport_cdr	cdr_mode;
+
+	struct device_node     *remote_of_node;	/* 'serializer' OF node */
+	struct i2c_client      *ser_client;	/* Serializer */
+	unsigned short          ser_alias;	/* Serializer i2c alias (lower 7 bits) */
+
+	struct regulator	*vpoc;
+
+	/* EQ settings */
+	struct {
+		bool manual_eq;
+
+		s8 strobe_pos;
+
+		union {
+			struct {
+				u8 eq_level_min;
+				u8 eq_level_max;
+			} aeq;
+
+			struct {
+				u8 eq_level;
+			} manual;
+		};
+	} eq;
+
+	struct ds90ub9xx_platform_data ser_platform_data;
+};
+
+struct ub960_asd {
+	struct v4l2_async_subdev base;
+	struct ub960_rxport *rxport;
+};
+
+static inline struct ub960_asd *to_ub960_asd(struct v4l2_async_subdev *asd)
+{
+	return container_of(asd, struct ub960_asd, base);
+}
+
+struct ub960_txport {
+	struct ub960_data      *priv;
+	u8                      nport;	/* TX port number, and index in priv->txport[] */
+
+	u32 num_data_lanes;
+};
+
+struct atr_alias_table_entry {
+	u16 alias_id;	/* Alias ID from DT */
+
+	bool reserved;
+	u8 nport;
+	u8 slave_id;	/* i2c client's local i2c address */
+	u8 port_reg_idx;
+};
+
+struct atr_alias_table {
+	/* Protects fields in this struct */
+	struct mutex lock;
+
+	size_t num_entries;
+	struct atr_alias_table_entry *entries;
+};
+
+struct ub960_data {
+	const struct ub960_hw_data	*hw_data;
+	struct i2c_client	*client; /* for shared local registers */
+	struct regmap		*regmap;
+
+	/* lock for register access */
+	struct mutex		reg_lock;
+
+	struct clk		*refclk;
+
+	struct regulator	*vddio;
+
+	struct gpio_desc	*pd_gpio;
+	struct delayed_work	poll_work;
+	struct i2c_atr		*atr;
+	struct ub960_rxport	*rxports[UB960_MAX_RX_NPORTS];
+	struct ub960_txport	*txports[UB960_MAX_TX_NPORTS];
+
+	struct v4l2_subdev	sd;
+	struct media_pad	pads[UB960_MAX_NPORTS];
+
+	struct v4l2_ctrl_handler   ctrl_handler;
+	struct v4l2_async_notifier notifier;
+
+	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
+	s64 tx_link_freq[1];
+
+	struct atr_alias_table	atr_alias_table;
+
+	u8 current_read_rxport;
+	u8 current_write_rxport_mask;
+
+	u8 current_read_csiport;
+	u8 current_write_csiport_mask;
+
+	u8 current_indirect_target;
+
+	bool streaming;
+
+	u8 stored_fwd_ctl;
+
+	u64 stream_enable_mask[UB960_MAX_NPORTS];
+
+	/* These are common to all ports */
+	struct {
+		bool manual;
+
+		s8 min;
+		s8 max;
+	} strobe;
+};
+
+static void ub960_reset(struct ub960_data *priv, bool reset_regs);
+
+static inline struct ub960_data *sd_to_ub960(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ub960_data, sd);
+}
+
+enum {
+	TEST_PATTERN_DISABLED = 0,
+	TEST_PATTERN_V_COLOR_BARS_1,
+	TEST_PATTERN_V_COLOR_BARS_2,
+	TEST_PATTERN_V_COLOR_BARS_4,
+	TEST_PATTERN_V_COLOR_BARS_8,
+};
+
+static const char * const ub960_tpg_qmenu[] = {
+	"Disabled",
+	"1 vertical color bar",
+	"2 vertical color bars",
+	"4 vertical color bars",
+	"8 vertical color bars",
+};
+
+static inline bool ub960_pad_is_sink(struct ub960_data *priv, u32 pad)
+{
+	return pad < priv->hw_data->num_rxports;
+}
+
+static inline bool ub960_pad_is_source(struct ub960_data *priv, u32 pad)
+{
+	return pad >= priv->hw_data->num_rxports &&
+	       pad < (priv->hw_data->num_rxports + priv->hw_data->num_txports);
+}
+
+static inline unsigned int ub960_pad_to_port(struct ub960_data *priv, u32 pad)
+{
+	if (ub960_pad_is_sink(priv, pad))
+		return pad;
+	else
+		return pad - priv->hw_data->num_rxports;
+}
+
+struct ub960_format_info {
+	u32 code;
+	u32 bpp;
+	u8 datatype;
+	bool meta;
+};
+
+static const struct ub960_format_info ub960_formats[] = {
+	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .datatype = 0x1e, },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .datatype = 0x1e, },
+	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .datatype = 0x1e, },
+	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .datatype = 0x1e, },
+
+	/* Legacy */
+	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .bpp = 16, .datatype = 0x1e, },
+	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .bpp = 16, .datatype = 0x1e, },
+	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .bpp = 16, .datatype = 0x1e, },
+	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .bpp = 16, .datatype = 0x1e, },
+
+	/* RAW */
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .datatype = 0x2c, },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .datatype = 0x2c, },
+};
+
+static const struct ub960_format_info *ub960_find_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ub960_formats); ++i) {
+		if (ub960_formats[i].code == code)
+			return &ub960_formats[i];
+	}
+
+	return NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * Basic device access
+ */
+
+static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_read(priv->regmap, reg, &v);
+	if (ret)
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+	else
+		*val = v;
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_write(struct ub960_data *priv, u8 reg, u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret)
+		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	if (ret)
+		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int _ub960_rxport_select(struct ub960_data *priv, u8 nport)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	if (priv->current_read_rxport == nport &&
+	    priv->current_write_rxport_mask == BIT(nport))
+		return 0;
+
+	ret = regmap_write(priv->regmap, UB960_SR_FPD3_PORT_SEL,
+			   (nport << 4) | (1 << nport));
+	if (ret) {
+		dev_err(dev, "%s: cannot select rxport %d (%d)!\n", __func__,
+			nport, ret);
+		return ret;
+	}
+
+	priv->current_read_rxport = nport;
+	priv->current_write_rxport_mask = BIT(nport);
+
+	return 0;
+}
+
+static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg, u8 *val)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	_ub960_rxport_select(priv, nport);
+
+	ret = regmap_read(priv->regmap, reg, &v);
+	if (ret)
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+	else
+		*val = v;
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg, u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	_ub960_rxport_select(priv, nport);
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret)
+		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
+				    u8 mask, u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	_ub960_rxport_select(priv, nport);
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+
+	if (ret)
+		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int _ub960_csiport_select(struct ub960_data *priv, u8 nport)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	if (priv->current_read_csiport == nport &&
+	    priv->current_write_csiport_mask == BIT(nport))
+		return 0;
+
+	ret = regmap_write(priv->regmap, UB960_SR_CSI_PORT_SEL,
+			   (nport << 4) | (1 << nport));
+	if (ret) {
+		dev_err(dev, "%s: cannot select csi port %d (%d)!\n", __func__,
+			nport, ret);
+		return ret;
+	}
+
+	priv->current_read_csiport = nport;
+	priv->current_write_csiport_mask = BIT(nport);
+
+	return 0;
+}
+
+static int ub960_csiport_read(struct ub960_data *priv, u8 nport, u8 reg,
+			      u8 *val)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	_ub960_csiport_select(priv, nport);
+
+	ret = regmap_read(priv->regmap, reg, &v);
+	if (ret)
+		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+	else
+		*val = v;
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_csiport_write(struct ub960_data *priv, u8 nport, u8 reg,
+			       u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	_ub960_csiport_select(priv, nport);
+
+	ret = regmap_write(priv->regmap, reg, val);
+	if (ret)
+		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_csiport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
+				     u8 mask, u8 val)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	_ub960_csiport_select(priv, nport);
+
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+
+	if (ret)
+		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
+			__func__, reg, ret);
+
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int _ub960_select_ind_reg_block(struct ub960_data *priv, u8 block)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	if (priv->current_indirect_target == block)
+		return 0;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_CTL, block << 2);
+	if (ret) {
+		dev_err(dev, "%s: cannot select indirect target %u (%d)!\n",
+			__func__, block, ret);
+		return ret;
+	}
+
+	priv->current_indirect_target = block;
+
+	return 0;
+}
+
+static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val)
+{
+	unsigned int v;
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub960_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
+	if (ret)
+		goto out;
+
+	*val = v;
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub960_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_write_ind16(struct ub960_data *priv, u8 block, u8 reg, u16 val)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub960_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val >> 8);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg + 1);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val & 0xff);
+	if (ret)
+		goto out;
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
+				 u8 mask, u8 val)
+{
+	int ret;
+	u32 v;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = _ub960_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
+	if (ret)
+		goto out;
+
+	v &= ~mask;
+	v |= val;
+
+	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, v);
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * I2C-ATR (address translator)
+ */
+
+static int ub960_atr_attach_client(struct i2c_atr *atr, u32 chan_id,
+				   const struct i2c_board_info *info,
+				   const struct i2c_client *client,
+				   u16 *alias_id)
+{
+	struct ub960_data *priv = i2c_atr_get_clientdata(atr);
+	struct ub960_rxport *rxport = priv->rxports[chan_id];
+	struct device *dev = &priv->client->dev;
+	struct atr_alias_table_entry *entry = NULL;
+	unsigned int reg_idx;
+	unsigned int pool_idx;
+	u16 alias;
+	int ret = 0;
+	u8 port_reg_idx_mask = 0;
+
+	dev_dbg(dev, "rx%d: %s\n", chan_id, __func__);
+
+	mutex_lock(&priv->atr_alias_table.lock);
+
+	/*
+	 * Go through the alias table and:
+	 *	1. Look for an unreserved entry
+	 *	2. Construct a bitmask of port's used alias entries
+	 */
+
+	for (pool_idx = 0; pool_idx < priv->atr_alias_table.num_entries; pool_idx++) {
+		struct atr_alias_table_entry *e;
+
+		e = &priv->atr_alias_table.entries[pool_idx];
+
+		if (!entry && !e->reserved)
+			entry = e;
+
+		if (e->reserved && e->nport == rxport->nport)
+			port_reg_idx_mask |= BIT(e->port_reg_idx);
+	}
+
+	if (!entry) {
+		dev_err(dev, "rx%d: alias pool exhausted\n", rxport->nport);
+		ret = -EADDRNOTAVAIL;
+		goto out;
+	}
+
+	if (port_reg_idx_mask == (1 << UB960_MAX_PORT_ALIASES) - 1) {
+		dev_err(dev, "rx%d: all aliases in use\n", rxport->nport);
+		ret = -EADDRNOTAVAIL;
+		goto out;
+	}
+
+	alias = entry->alias_id;
+
+	reg_idx = ffz(port_reg_idx_mask);
+
+	entry->reserved = true;
+	entry->nport = rxport->nport;
+	entry->slave_id = client->addr;
+	entry->port_reg_idx = reg_idx;
+
+	/* Map alias to slave */
+
+	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
+			   client->addr << 1);
+	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
+			   alias << 1);
+
+	*alias_id = alias; /* tell the atr which alias we chose */
+
+	dev_dbg(dev, "rx%d: client 0x%02x mapped at alias 0x%02x (%s)\n",
+		rxport->nport, client->addr, alias, client->name);
+
+out:
+	mutex_unlock(&priv->atr_alias_table.lock);
+	return ret;
+}
+
+static void ub960_atr_detach_client(struct i2c_atr *atr, u32 chan_id,
+				    const struct i2c_client *client)
+{
+	struct ub960_data *priv = i2c_atr_get_clientdata(atr);
+	struct ub960_rxport *rxport = priv->rxports[chan_id];
+	struct device *dev = &priv->client->dev;
+	struct atr_alias_table_entry *entry;
+	unsigned int reg_idx;
+	unsigned int pool_idx;
+	u16 alias = 0;
+
+	dev_dbg(dev, "rx%d: %s\n", chan_id, __func__);
+
+	mutex_lock(&priv->atr_alias_table.lock);
+
+	/* Find alias mapped to this client */
+
+	for (pool_idx = 0; pool_idx < priv->atr_alias_table.num_entries; pool_idx++) {
+		entry = &priv->atr_alias_table.entries[pool_idx];
+
+		if (entry->reserved && entry->nport == rxport->nport &&
+		    entry->slave_id == client->addr)
+			break;
+	}
+
+	if (pool_idx == priv->atr_alias_table.num_entries) {
+		dev_err(dev, "rx%d: client 0x%02x is not mapped!\n",
+			rxport->nport, client->addr);
+		goto out;
+	}
+
+	alias = entry->alias_id;
+
+	reg_idx = entry->port_reg_idx;
+
+	/* Unmap */
+
+	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
+
+	entry->reserved = false;
+
+	dev_dbg(dev, "rx%d: client 0x%02x unmapped from alias 0x%02x (%s)\n",
+		rxport->nport, client->addr, alias, client->name);
+
+out:
+	mutex_unlock(&priv->atr_alias_table.lock);
+}
+
+static const struct i2c_atr_ops ub960_atr_ops = {
+	.attach_client = ub960_atr_attach_client,
+	.detach_client = ub960_atr_detach_client,
+};
+
+/* -----------------------------------------------------------------------------
+ * CSI ports
+ */
+
+static int ub960_parse_dt_txport(struct ub960_data *priv,
+				 const struct device_node *np, u8 nport)
+{
+	struct device *dev = &priv->client->dev;
+	struct ub960_txport *txport;
+	int ret;
+	u64 freq;
+
+	if (priv->txports[nport]) {
+		dev_err(dev, "OF: %s: duplicate tx port\n",
+			of_node_full_name(np));
+		return -EADDRINUSE;
+	}
+
+	txport = kzalloc(sizeof(*txport), GFP_KERNEL);
+	if (!txport)
+		return -ENOMEM;
+
+	txport->priv = priv;
+	txport->nport = nport;
+
+	priv->txports[nport] = txport;
+
+	ret = of_property_count_u32_elems(np, "data-lanes");
+
+	if (ret <= 0) {
+		dev_err(dev, "OF: %s: failed to parse data-lanes: %d\n",
+			of_node_full_name(np), ret);
+		goto err_free_txport;
+	}
+
+	txport->num_data_lanes = ret;
+
+	ret = of_property_count_u64_elems(np, "link-frequencies");
+	if (ret < 0) {
+		dev_err(dev, "OF: %s: failed to parse link-frequencies: %d\n",
+			of_node_full_name(np), ret);
+		goto err_free_txport;
+	}
+
+	if (ret != 1) {
+		dev_err(dev, "OF: %s: link-frequencies must contain a single frequency: %d\n",
+			of_node_full_name(np), ret);
+		goto err_free_txport;
+	}
+
+	ret = of_property_read_u64(np, "link-frequencies", &freq);
+	if (ret) {
+		dev_err(dev, "OF: %s: failed to read link frequency: %d\n",
+			of_node_full_name(np), ret);
+		goto err_free_txport;
+	}
+
+	if (of_property_read_u32(np, "link-frequencies", &priv->tx_data_rate) != 0) {
+		dev_err(dev, "OF: %s: missing \"data-rate\" node\n",
+			of_node_full_name(np));
+		return -EINVAL;
+	}
+
+	priv->tx_link_freq[0] = freq;
+	priv->tx_data_rate = freq * 2;
+
+	if (priv->tx_data_rate != 1600000000 &&
+	    priv->tx_data_rate != 1200000000 &&
+	    priv->tx_data_rate != 800000000 &&
+	    priv->tx_data_rate != 400000000) {
+		dev_err(dev, "OF: %s: invalid \"link-frequencies\" value\n",
+			of_node_full_name(np));
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "Nominal data rate: %u", priv->tx_data_rate);
+
+	return 0;
+
+err_free_txport:
+	kfree(txport);
+
+	return ret;
+}
+
+static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
+{
+	struct device *dev = &priv->client->dev;
+	u8 csi_tx_isr;
+	int ret;
+
+	ret = ub960_csiport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
+
+	if (!ret) {
+		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
+			dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
+
+		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
+			dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * RX ports
+ */
+
+static void ub960_rxport_clear_errors(struct ub960_data *priv,
+				      unsigned int nport)
+{
+	u8 v;
+
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &v);
+
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v);
+	ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v);
+
+	ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
+}
+
+static void ub960_clear_rx_errors(struct ub960_data *priv)
+{
+	unsigned int nport;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport)
+		ub960_rxport_clear_errors(priv, nport);
+}
+
+static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
+				       unsigned int nport, s8 *strobe_pos)
+{
+	u8 v;
+	u8 clk_delay, data_delay;
+	int ret;
+
+	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+		       UB960_IR_RX_ANA_STROBE_SET_CLK, &v);
+
+	clk_delay = v & BIT(3) ? 0 : 6;
+
+	ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+		       UB960_IR_RX_ANA_STROBE_SET_DATA, &v);
+
+	data_delay = v & BIT(3) ? 0 : 6;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v);
+	if (ret)
+		return ret;
+
+	clk_delay += v & 0x7;
+
+	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
+	if (ret)
+		return ret;
+
+	data_delay += v & 0x7;
+
+	*strobe_pos = data_delay - clk_delay;
+
+	return 0;
+}
+
+static void ub960_rxport_set_strobe_pos(struct ub960_data *priv,
+					unsigned int nport, s8 strobe_pos)
+{
+	u8 clk_delay, data_delay;
+
+	if (WARN_ON(strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
+		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS))
+		return;
+
+	clk_delay = BIT(3);
+	data_delay = BIT(3);
+
+	if (strobe_pos < -7)
+		clk_delay = abs(strobe_pos) - 6;
+	else if (strobe_pos > 7)
+		data_delay = strobe_pos - 6;
+	else if (strobe_pos < 0)
+		clk_delay = abs(strobe_pos) | BIT(3);
+	else if (strobe_pos > 0)
+		data_delay = strobe_pos | BIT(3);
+
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay);
+
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay);
+}
+
+static void ub960_rxport_set_strobe_range(struct ub960_data *priv,
+					  s8 strobe_min, s8 strobe_max)
+{
+	WARN_ON(strobe_min < UB960_MIN_AEQ_STROBE_POS);
+	WARN_ON(strobe_max > UB960_MAX_AEQ_STROBE_POS);
+
+	strobe_min += 7;
+	strobe_max += 7;
+
+	ub960_write(priv, UB960_XR_SFILTER_CFG,
+		    (u8)strobe_min | ((u8)strobe_max << 4));
+}
+
+static int ub960_rxport_get_eq_level(struct ub960_data *priv,
+				     unsigned int nport, u8 *eq_level)
+{
+	int ret;
+	u8 v;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_STATUS, &v);
+	if (ret)
+		return ret;
+
+	*eq_level = (v & 0x7) + ((v >> 3) & 0x7);
+
+	return 0;
+}
+
+static void ub960_rxport_set_eq_level(struct ub960_data *priv,
+				      unsigned int nport, u8 eq_level)
+{
+	u8 eq_stage_1_select_value, eq_stage_2_select_value;
+	u8 v;
+
+	if (eq_level <= 7) {
+		eq_stage_1_select_value = eq_level;
+		eq_stage_2_select_value = 0;
+	} else {
+		eq_stage_1_select_value = 7;
+		eq_stage_2_select_value = eq_level - 7;
+	}
+
+	WARN_ON(eq_stage_1_select_value > 7);
+	WARN_ON(eq_stage_2_select_value > 7);
+
+	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+
+	v &= ~((0x7 << 5) | (0x7 << 1));
+	v |= eq_stage_1_select_value << 5;
+	v |= eq_stage_2_select_value << 1;
+	v |= BIT(0); /* Enable AEQ Bypass */
+
+	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
+}
+
+static void ub960_rxport_set_eq_range(struct ub960_data *priv,
+				      unsigned int nport, u8 eq_min, u8 eq_max)
+{
+	ub960_rxport_write(priv, nport, UB960_RR_AEQ_MIN_MAX,
+			   eq_min | (eq_max << 4));
+
+	/* Enable AEQ min setting */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_CTL2, BIT(2),
+				 BIT(2));
+}
+
+static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
+{
+	struct ub960_rxport *rxport = priv->rxports[nport];
+
+	/* We also set common settings here. Should be moved elsewhere. */
+
+	if (priv->strobe.manual) {
+		/* Disable AEQ_SFILTER_EN */
+		ub960_update_bits(priv, UB960_XR_AEQ_CTL1, BIT(0), 0);
+	} else {
+		/* Enable SFILTER and error control */
+		ub960_write(priv, UB960_XR_AEQ_CTL1, (0x7 << 4) | BIT(0));
+
+		/* Set AEQ strobe range */
+		ub960_rxport_set_strobe_range(priv, priv->strobe.min,
+					      priv->strobe.max);
+	}
+
+	/* The rest are port specific */
+
+	if (priv->strobe.manual)
+		ub960_rxport_set_strobe_pos(priv, nport, rxport->eq.strobe_pos);
+	else
+		ub960_rxport_set_strobe_pos(priv, nport, 0);
+
+	if (rxport->eq.manual_eq) {
+		ub960_rxport_set_eq_level(priv, nport,
+					  rxport->eq.manual.eq_level);
+
+		/* Enable AEQ Bypass */
+		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
+					 BIT(0), BIT(0));
+	} else {
+		ub960_rxport_set_eq_range(priv, nport,
+					  rxport->eq.aeq.eq_level_min,
+					  rxport->eq.aeq.eq_level_max);
+
+		/* Disable AEQ Bypass */
+		ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
+					 BIT(0), 0);
+	}
+}
+
+static int ub960_rxport_link_ok(struct ub960_data *priv, unsigned int nport,
+				bool *ok)
+{
+	u8 rx_port_sts1, rx_port_sts2;
+	unsigned int parity_errors;
+	u8 csi_rx_sts;
+	u8 csi_err_cnt;
+	u8 v1, v2;
+	u8 bcc_sts;
+	int ret;
+	bool errors;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
+				&rx_port_sts1);
+	if (ret)
+		return ret;
+
+	if (!(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS)) {
+		*ok = false;
+		return 0;
+	}
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
+				&rx_port_sts2);
+	if (ret)
+		return ret;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS, &csi_rx_sts);
+	if (ret)
+		return ret;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER,
+				&csi_err_cnt);
+	if (ret)
+		return ret;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS, &bcc_sts);
+	if (ret)
+		return ret;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
+	if (ret)
+		return ret;
+
+	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
+	if (ret)
+		return ret;
+
+	parity_errors = (v1 << 8) | v2;
+
+	errors = (rx_port_sts1 & 0x2c) || (rx_port_sts2 & 0x20) ||
+		 (bcc_sts & 0x3f) || (csi_rx_sts & 0xf) || csi_err_cnt ||
+		 parity_errors;
+
+	*ok = !errors;
+
+	return 0;
+}
+
+/*
+ * Wait for the RX ports to lock, have no errors and have stable strobe position
+ * and EQ level.
+ */
+static int ub960_rxport_wait_locks(struct ub960_data *priv,
+				   unsigned long port_mask,
+				   unsigned int *lock_mask)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned long timeout;
+	unsigned int link_ok_mask;
+	unsigned int missing;
+	unsigned int loops;
+	u8 nport;
+	int ret;
+
+	if (port_mask == 0)
+		return 0;
+
+	if (port_mask >= BIT(priv->hw_data->num_rxports))
+		return -EINVAL;
+
+	timeout = jiffies + msecs_to_jiffies(1000);
+	loops = 0;
+	link_ok_mask = 0;
+
+	while (time_before(jiffies, timeout)) {
+		missing = 0;
+
+		for_each_set_bit(nport, &port_mask,
+				 priv->hw_data->num_rxports) {
+			struct ub960_rxport *rxport = priv->rxports[nport];
+			bool ok;
+
+			if (!rxport)
+				continue;
+
+			ret = ub960_rxport_link_ok(priv, nport, &ok);
+			if (ret)
+				return ret;
+
+			if (!ok || !(link_ok_mask & BIT(nport)))
+				missing++;
+
+			if (ok)
+				link_ok_mask |= BIT(nport);
+			else
+				link_ok_mask &= ~BIT(nport);
+		}
+
+		loops++;
+
+		if (missing == 0)
+			break;
+
+		msleep(50);
+	}
+
+	if (lock_mask)
+		*lock_mask = link_ok_mask;
+
+	dev_dbg(dev, "Wait locks done in %u loops\n", loops);
+	for_each_set_bit(nport, &port_mask, priv->hw_data->num_rxports) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+		s8 strobe_pos, eq_level;
+		u8 v1, v2;
+
+		if (!rxport)
+			continue;
+
+		if (!(link_ok_mask & BIT(nport))) {
+			dev_dbg(dev, "\trx%u: not locked\n", nport);
+			continue;
+		}
+
+		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
+
+		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+		if (ret)
+			return ret;
+
+		ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
+		if (ret)
+			return ret;
+
+		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
+			nport, strobe_pos, eq_level,
+			v1 * 1000000 + v2 * 1000000 / 256);
+	}
+
+	return 0;
+}
+
+static int ub960_init_atr(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct i2c_adapter *parent_adap = priv->client->adapter;
+
+	priv->atr = i2c_atr_new(parent_adap, dev, &ub960_atr_ops,
+				priv->hw_data->num_rxports);
+	if (IS_ERR(priv->atr))
+		return PTR_ERR(priv->atr);
+
+	i2c_atr_set_clientdata(priv->atr, priv);
+
+	return 0;
+}
+
+static void ub960_uninit_atr(struct ub960_data *priv)
+{
+	i2c_atr_delete(priv->atr);
+	priv->atr = NULL;
+}
+
+static unsigned long ub960_calc_bc_clk_rate_ub960(struct ub960_data *priv,
+						  struct ub960_rxport *rxport)
+{
+	unsigned int mult;
+	unsigned int div;
+
+	switch (rxport->rx_mode) {
+	case RXPORT_MODE_RAW10:
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+		mult = 1;
+		div = 10;
+		break;
+
+	case RXPORT_MODE_CSI2_SYNC:
+		mult = 2;
+		div = 1;
+		break;
+
+	case RXPORT_MODE_CSI2_ASYNC:
+		mult = 2;
+		div = 5;
+		break;
+
+	default:
+		WARN_ON(true);
+		return 0;
+	}
+
+	return clk_get_rate(priv->refclk) * mult / div;
+}
+
+static unsigned long ub960_calc_bc_clk_rate_ub9702(struct ub960_data *priv,
+						   struct ub960_rxport *rxport)
+{
+	switch (rxport->rx_mode) {
+	case RXPORT_MODE_RAW10:
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+		return 2359400;
+
+	case RXPORT_MODE_CSI2_SYNC:
+		return 47187500;
+
+	case RXPORT_MODE_CSI2_ASYNC:
+		return 9437500;
+
+	default:
+		WARN_ON(true);
+		return 0;
+	}
+}
+
+static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
+{
+	struct ub960_rxport *rxport = priv->rxports[nport];
+	struct device *dev = &priv->client->dev;
+	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser_platform_data;
+	struct i2c_board_info ser_info = {
+		.of_node = rxport->remote_of_node,
+		.platform_data = ser_pdata,
+	};
+
+	ser_pdata->port = nport;
+	ser_pdata->atr = priv->atr;
+	if (priv->hw_data->ub9702)
+		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
+	else
+		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
+
+	/*
+	 * Adding the serializer under rxport->adap would be cleaner, but it
+	 * would need tweaks to bypass the alias table. Adding to the
+	 * upstream adapter is way simpler.
+	 */
+	ser_info.addr = rxport->ser_alias;
+	rxport->ser_client =
+		i2c_new_client_device(priv->client->adapter, &ser_info);
+	if (!rxport->ser_client) {
+		dev_err(dev, "rx%d: cannot add %s i2c device", nport,
+			ser_info.type);
+		return -EIO;
+	}
+
+	dev_dbg(dev, "rx%d: remote serializer at alias 0x%02x (%u-%04x)\n",
+		nport, rxport->ser_client->addr,
+		rxport->ser_client->adapter->nr, rxport->ser_client->addr);
+
+	return 0;
+}
+
+static void ub960_rxport_remove_serializer(struct ub960_data *priv, u8 nport)
+{
+	struct ub960_rxport *rxport = priv->rxports[nport];
+
+	i2c_unregister_device(rxport->ser_client);
+	rxport->ser_client = NULL;
+}
+
+/* Add serializer i2c devices for all initialized ports */
+static int ub960_rxport_add_serializers(struct ub960_data *priv)
+{
+	unsigned int nport;
+	int ret;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport)
+			continue;
+
+		ret = ub960_rxport_add_serializer(priv, nport);
+		if (ret)
+			goto err_remove_sers;
+	}
+
+	return 0;
+
+err_remove_sers:
+	for (; nport > 0; --nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport - 1];
+
+		if (!rxport)
+			continue;
+
+		rxport = priv->rxports[nport - 1];
+		if (!rxport)
+			continue;
+
+		ub960_rxport_remove_serializer(priv, nport - 1);
+	}
+
+	return ret;
+}
+
+static void ub960_rxport_remove_serializers(struct ub960_data *priv)
+{
+	unsigned int nport;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport)
+			continue;
+
+		ub960_rxport_remove_serializer(priv, nport);
+	}
+}
+
+static void ub960_init_tx_port(struct ub960_data *priv,
+			       struct ub960_txport *txport)
+{
+	unsigned int nport = txport->nport;
+	u8 csi_ctl = 0;
+
+	/*
+	 * From the datasheet: "initial CSI Skew-Calibration
+	 * sequence [...] should be set when operating at 1.6 Gbps"
+	 */
+	if (priv->tx_data_rate == 1600000000)
+		csi_ctl |= UB960_TR_CSI_CTL_CSI_CAL_EN;
+
+	csi_ctl |= (4 - txport->num_data_lanes) << 4;
+
+	ub960_csiport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl);
+}
+
+static int ub960_init_tx_ports(struct ub960_data *priv)
+{
+	unsigned int nport;
+	u8 speed_select;
+	u8 pll_div;
+
+	/* TX ports */
+
+	switch (priv->tx_data_rate) {
+	case 1600000000:
+	default:
+		speed_select = 0;
+		pll_div = 0x10;
+		break;
+	case 1200000000:
+		speed_select = 1;
+		break;
+	case 800000000:
+		speed_select = 2;
+		pll_div = 0x10;
+		break;
+	case 400000000:
+		speed_select = 3;
+		pll_div = 0x10;
+		break;
+	}
+
+	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
+
+	if (priv->hw_data->ub9702) {
+		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
+
+		switch (priv->tx_data_rate) {
+		case 1600000000:
+		default:
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x80);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
+			break;
+		case 800000000:
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0x90);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4F, 0x2A);
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x4B, 0x2A);
+			break;
+		case 400000000:
+			ub960_write_ind(priv, UB960_IND_TARGET_CSI_ANA, 0x92, 0xA0);
+			break;
+		}
+	}
+
+	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+		struct ub960_txport *txport = priv->txports[nport];
+
+		if (!txport)
+			continue;
+
+		ub960_init_tx_port(priv, txport);
+	}
+
+	return 0;
+}
+
+static void ub960_init_rx_port_ub960(struct ub960_data *priv,
+				     struct ub960_rxport *rxport)
+{
+	unsigned int nport = rxport->nport;
+	u32 bc_freq_val;
+
+	/*
+	 * Back channel frequency select.
+	 * Override FREQ_SELECT from the strap.
+	 * 0 - 2.5 Mbps (DS90UB913A-Q1 / DS90UB933-Q1)
+	 * 2 - 10 Mbps
+	 * 6 - 50 Mbps (DS90UB953-Q1)
+	 *
+	 * Note that changing this setting will result in some errors on the back
+	 * channel for a short period of time.
+	 */
+
+	switch (rxport->rx_mode) {
+	default:
+		WARN_ON(true);
+		fallthrough;
+
+	case RXPORT_MODE_RAW10:
+	case RXPORT_MODE_RAW12_HF:
+	case RXPORT_MODE_RAW12_LF:
+		bc_freq_val = 0;
+		break;
+
+	case RXPORT_MODE_CSI2_ASYNC:
+		bc_freq_val = 2;
+		break;
+
+	case RXPORT_MODE_CSI2_SYNC:
+		bc_freq_val = 6;
+		break;
+	}
+
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
+				 bc_freq_val);
+
+	switch (rxport->rx_mode) {
+	default:
+		WARN_ON(true);
+		fallthrough;
+
+	case RXPORT_MODE_RAW10:
+		/* FPD3_MODE = RAW10 Mode (DS90UB913A-Q1 / DS90UB933-Q1 compatible) */
+		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG, 0x3,
+					 0x3);
+
+		/*
+		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
+		 * 0b10 : 8-bit processing using upper 8 bits
+		 */
+		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
+					 0x3 << 6, 0x2 << 6);
+
+		break;
+
+	case RXPORT_MODE_CSI2_SYNC:
+	case RXPORT_MODE_CSI2_ASYNC:
+		/* CSI-2 Mode (DS90UB953-Q1 compatible) */
+		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG, 0x3,
+					 0x0);
+
+		break;
+	}
+
+	/* LV_POLARITY & FV_POLARITY */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3, 0x1);
+
+	/* Enable all interrupt sources from this port */
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f);
+
+	/* Enable I2C_PASS_THROUGH */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH);
+
+	/* Enable I2C communication to the serializer via the alias addr */
+	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
+			   rxport->ser_alias << 1);
+
+	/* Configure EQ related settings */
+	ub960_rxport_config_eq(priv, nport);
+
+	/* Enable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
+}
+
+static void ub960_init_rx_port_ub9702_fpd3(struct ub960_data *priv,
+					   struct ub960_rxport *rxport)
+{
+	unsigned int nport = rxport->nport;
+	u8 bc_freq_val;
+	u8 fpd_func_mode;
+
+	switch (rxport->rx_mode) {
+	case RXPORT_MODE_RAW10:
+		bc_freq_val = 0;
+		fpd_func_mode = 5;
+		break;
+
+	case RXPORT_MODE_RAW12_HF:
+		bc_freq_val = 0;
+		fpd_func_mode = 4;
+		break;
+
+	case RXPORT_MODE_RAW12_LF:
+		bc_freq_val = 0;
+		fpd_func_mode = 6;
+		break;
+
+	case RXPORT_MODE_CSI2_SYNC:
+		bc_freq_val = 6;
+		fpd_func_mode = 2;
+		break;
+
+	case RXPORT_MODE_CSI2_ASYNC:
+		bc_freq_val = 2;
+		fpd_func_mode = 2;
+		break;
+
+	default:
+		WARN_ON(true);
+		break;
+	}
+
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
+				 bc_freq_val);
+	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, fpd_func_mode);
+
+	/* set serdes_eq_mode = 1 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xA8, 0x80);
+
+	/* enable serdes driver */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x0D, 0x7F);
+
+	/* set serdes_eq_offset=4 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x04);
+
+	/* init default serdes_eq_max in 0xA9 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xA9, 0x23);
+
+	/* init serdes_eq_min in 0xAA */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xAA, 0);
+
+	/* serdes_driver_ctl2 control: DS90UB953-Q1/DS90UB933-Q1/DS90UB913A-Q1 */
+	ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1b,
+			      BIT(3), BIT(3));
+
+	/* RX port to half-rate */
+	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
+			  1 << (nport * 2));
+}
+
+static void ub960_init_rx_port_ub9702_fpd4_aeq(struct ub960_data *priv,
+					       struct ub960_rxport *rxport)
+{
+	unsigned int nport = rxport->nport;
+	bool first_time_power_up = true;
+
+	if (first_time_power_up) {
+		u8 v;
+
+		/* AEQ init */
+		ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2C, &v);
+
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, v);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, v + 1);
+
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x00);
+	}
+
+	/* enable serdes_eq_ctl2 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x9E, 0x00);
+
+	/* enable serdes_eq_ctl1 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x90, 0x40);
+
+	/* enable serdes_eq_en */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2E, 0x40);
+
+	/* disable serdes_eq_override */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0xF0, 0x00);
+
+	/* disable serdes_gain_override */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x71, 0x00);
+}
+
+static void ub960_init_rx_port_ub9702_fpd4(struct ub960_data *priv,
+					   struct ub960_rxport *rxport)
+{
+	unsigned int nport = rxport->nport;
+	u8 bc_freq_val;
+
+	switch (rxport->rx_mode) {
+	case RXPORT_MODE_RAW10:
+		bc_freq_val = 0;
+		break;
+
+	case RXPORT_MODE_RAW12_HF:
+		bc_freq_val = 0;
+		break;
+
+	case RXPORT_MODE_RAW12_LF:
+		bc_freq_val = 0;
+		break;
+
+	case RXPORT_MODE_CSI2_SYNC:
+		bc_freq_val = 6;
+		break;
+
+	case RXPORT_MODE_CSI2_ASYNC:
+		bc_freq_val = 2;
+		break;
+
+	default:
+		WARN_ON(true);
+		break;
+	}
+
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG, 0x7,
+				 bc_freq_val);
+
+	/* FPD4 Sync Mode */
+	ub960_rxport_write(priv, nport, UB960_RR_CHANNEL_MODE, 0);
+
+	/* add serdes_eq_offset of 4 */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x2B, 0x04);
+
+	/* FPD4 serdes_start_eq in 0x27: assign default */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x27, 0x0);
+	/* FPD4 serdes_end_eq in 0x28: assign default */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x28, 0x23);
+
+	/* set serdes_driver_mode into FPD IV mode */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x04, 0x00);
+	/* set FPD PBC drv into FPD IV mode */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x1B, 0x00);
+
+	/* set serdes_system_init to 0x2f */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x21, 0x2f);
+	/* set serdes_system_rst in reset mode */
+	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0xC1);
+
+	/* RX port to 7.55G mode */
+	ub960_update_bits(priv, UB960_SR_FPD_RATE_CFG, 0x3 << (nport * 2),
+			  0 << (nport * 2));
+
+	ub960_init_rx_port_ub9702_fpd4_aeq(priv, rxport);
+}
+
+static void ub960_init_rx_port_ub9702(struct ub960_data *priv,
+				      struct ub960_rxport *rxport)
+{
+	unsigned int nport = rxport->nport;
+
+	if (rxport->cdr_mode == RXPORT_CDR_FPD3)
+		ub960_init_rx_port_ub9702_fpd3(priv, rxport);
+	else /* RXPORT_CDR_FPD4 */
+		ub960_init_rx_port_ub9702_fpd4(priv, rxport);
+
+	switch (rxport->rx_mode) {
+	default:
+		WARN_ON(true);
+		fallthrough;
+
+	case RXPORT_MODE_RAW10:
+		/*
+		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
+		 * 0b10 : 8-bit processing using upper 8 bits
+		 */
+		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
+					 0x3 << 6, 0x2 << 6);
+
+		break;
+
+	case RXPORT_MODE_CSI2_SYNC:
+	case RXPORT_MODE_CSI2_ASYNC:
+
+		break;
+	}
+
+	/* LV_POLARITY & FV_POLARITY */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2, 0x3, 0x1);
+
+	/* Enable all interrupt sources from this port */
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_HI, 0x07);
+	ub960_rxport_write(priv, nport, UB960_RR_PORT_ICR_LO, 0x7f);
+
+	/* Enable I2C_PASS_THROUGH */
+	ub960_rxport_update_bits(priv, nport, UB960_RR_BCC_CONFIG,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH,
+				 UB960_RR_BCC_CONFIG_I2C_PASS_THROUGH);
+
+	/* Enable I2C communication to the serializer via the alias addr */
+	ub960_rxport_write(priv, nport, UB960_RR_SER_ALIAS_ID,
+			   rxport->ser_alias << 1);
+
+	/* Enable RX port */
+	ub960_update_bits(priv, UB960_SR_RX_PORT_CTL, BIT(nport), BIT(nport));
+
+	if (rxport->cdr_mode == RXPORT_CDR_FPD4) {
+		/* unreset 960 AEQ */
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport), 0x25, 0x41);
+	}
+}
+
+static int ub960_init_rx_ports(struct ub960_data *priv)
+{
+	unsigned int nport;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport)
+			continue;
+
+		if (priv->hw_data->ub9702)
+			ub960_init_rx_port_ub9702(priv, rxport);
+		else
+			ub960_init_rx_port_ub960(priv, rxport);
+	}
+
+	return 0;
+}
+
+static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
+{
+	struct device *dev = &priv->client->dev;
+	u8 rx_port_sts1;
+	u8 rx_port_sts2;
+	u8 csi_rx_sts;
+	u8 bcc_sts;
+	int ret = 0;
+
+	/* Read interrupts (also clears most of them) */
+	if (!ret)
+		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
+					&rx_port_sts1);
+	if (!ret)
+		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
+					&rx_port_sts2);
+	if (!ret)
+		ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS,
+					&csi_rx_sts);
+	if (!ret)
+		ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS,
+					&bcc_sts);
+
+	if (ret)
+		return;
+
+	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_PARITY_ERROR) {
+		u8 v1, v2;
+
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
+		dev_err(dev, "RX%u parity errors: %u\n", nport, (v1 << 8) | v2);
+	}
+
+	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR)
+		dev_err(dev, "RX%u BCC CRC error\n", nport);
+
+	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR)
+		dev_err(dev, "RX%u BCC SEQ error\n", nport);
+
+	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE)
+		dev_err(dev, "RX%u line length unstable\n", nport);
+
+	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR)
+		dev_err(dev, "RX%u FPD3 encode error\n", nport);
+
+	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_BUFFER_ERROR)
+		dev_err(dev, "RX%u buffer error\n", nport);
+
+	if (csi_rx_sts)
+		dev_err(dev, "RX%u CSI error: %#02x\n", nport, csi_rx_sts);
+
+	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC1_ERR)
+		dev_err(dev, "RX%u CSI ECC1 error\n", nport);
+
+	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC2_ERR)
+		dev_err(dev, "RX%u CSI ECC2 error\n", nport);
+
+	if (csi_rx_sts & UB960_RR_CSI_RX_STS_CKSUM_ERR)
+		dev_err(dev, "RX%u CSI checksum error\n", nport);
+
+	if (csi_rx_sts & UB960_RR_CSI_RX_STS_LENGTH_ERR)
+		dev_err(dev, "RX%u CSI length error\n", nport);
+
+	if (bcc_sts)
+		dev_err(dev, "RX%u BCC error: %#02x\n", nport, bcc_sts);
+
+	if (bcc_sts & UB960_RR_BCC_STATUS_RESP_ERR)
+		dev_err(dev, "RX%u BCC response error", nport);
+
+	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_TO)
+		dev_err(dev, "RX%u BCC slave timeout", nport);
+
+	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_ERR)
+		dev_err(dev, "RX%u BCC slave error", nport);
+
+	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_TO)
+		dev_err(dev, "RX%u BCC master timeout", nport);
+
+	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_ERR)
+		dev_err(dev, "RX%u BCC master error", nport);
+
+	if (bcc_sts & UB960_RR_BCC_STATUS_SEQ_ERROR)
+		dev_err(dev, "RX%u BCC sequence error", nport);
+
+	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_CHG) {
+		u8 v1, v2;
+
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
+		dev_dbg(dev, "RX%u line len changed: %u\n", nport,
+			(v1 << 8) | v2);
+	}
+
+	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_CNT_CHG) {
+		u8 v1, v2;
+
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
+		dev_dbg(dev, "RX%u line count changed: %u\n", nport,
+			(v1 << 8) | v2);
+	}
+
+	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS_CHG) {
+		dev_dbg(dev, "RX%u: %s, %s, %s, %s\n", nport,
+			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS) ? "locked" : "unlocked",
+			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_PORT_PASS) ? "passed" : "not passed",
+			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_CABLE_FAULT) ? "no clock" : "clock ok",
+			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_FREQ_STABLE) ? "stable freq" : "unstable freq");
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2
+ */
+
+static void ub960_get_vc_maps(struct ub960_data *priv,
+			      struct v4l2_subdev_state *state, u8 *vc)
+{
+	const struct v4l2_subdev_krouting *routing = &state->routing;
+	u8 cur_vc[UB960_MAX_TX_NPORTS] = { 0 };
+	u8 handled_mask = 0;
+	unsigned int i;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+		unsigned int rx, tx;
+
+		rx = ub960_pad_to_port(priv, route->sink_pad);
+
+		if (BIT(rx) & handled_mask)
+			continue;
+
+		tx = ub960_pad_to_port(priv, route->source_pad);
+
+		vc[rx] = cur_vc[tx]++;
+		handled_mask |= BIT(rx);
+	}
+}
+
+static int ub960_enable_tx_port(struct ub960_data *priv, unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "enable TX port %u\n", nport);
+
+	ub960_csiport_update_bits(priv, nport, UB960_TR_CSI_CTL,
+				  UB960_TR_CSI_CTL_CSI_ENABLE,
+				  UB960_TR_CSI_CTL_CSI_ENABLE);
+
+	return 0;
+}
+
+static void ub960_disable_tx_port(struct ub960_data *priv, unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "disable TX port %u\n", nport);
+
+	ub960_csiport_update_bits(priv, nport, UB960_TR_CSI_CTL,
+				  UB960_TR_CSI_CTL_CSI_ENABLE, 0);
+}
+
+static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "enable RX port %u\n", nport);
+
+	/* Enable forwarding */
+	ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport), 0);
+
+	return 0;
+}
+
+static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "disable RX port %u\n", nport);
+
+	/* Disable forwarding */
+	ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport),
+			  BIT(4 + nport));
+}
+
+static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
+					       struct v4l2_subdev_state *state)
+{
+	const struct v4l2_subdev_krouting *routing = &state->routing;
+	unsigned int i;
+	unsigned int nport;
+	u8 fwd_ctl;
+	u32 active_tx_mask = 0;
+	struct {
+		u32 num_streams;
+		u8 pixel_dt;
+		u8 meta_dt;
+		u32 meta_lines;
+		u32 tx_port;
+	} rx_data[UB960_MAX_RX_NPORTS] = { 0 };
+	u8 vc_map[UB960_MAX_RX_NPORTS] = { 0 };
+
+	ub960_get_vc_maps(priv, state, vc_map);
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+		struct ub960_rxport *rxport;
+		struct ub960_txport *txport;
+		struct v4l2_mbus_framefmt *fmt;
+		const struct ub960_format_info *ub960_fmt;
+		unsigned int nport;
+
+		nport = ub960_pad_to_port(priv, route->sink_pad);
+
+		rxport = priv->rxports[nport];
+		if (!rxport)
+			return -EINVAL;
+
+		txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
+		if (!txport)
+			return -EINVAL;
+
+		active_tx_mask |= BIT(ub960_pad_to_port(priv, route->source_pad));
+
+		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
+
+		rx_data[nport].num_streams++;
+
+		/* For the rest, we are only interested in parallel busses */
+		if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
+		    rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
+			continue;
+
+		if (rx_data[nport].num_streams > 2)
+			return -EPIPE;
+
+		fmt = v4l2_subdev_state_get_stream_format(state, route->sink_pad,
+							  route->sink_stream);
+		if (!fmt)
+			return -EPIPE;
+
+		ub960_fmt = ub960_find_format(fmt->code);
+		if (!ub960_fmt)
+			return -EPIPE;
+
+		if (ub960_fmt->meta) {
+			if (fmt->height > 3) {
+				dev_err(&priv->client->dev,
+					"Unsupported metadata height %u\n",
+					fmt->height);
+				return -EPIPE;
+			}
+
+			rx_data[nport].meta_dt = ub960_fmt->datatype;
+			rx_data[nport].meta_lines = fmt->height;
+		} else {
+			rx_data[nport].pixel_dt = ub960_fmt->datatype;
+		}
+	}
+
+	/* Configure RX ports */
+
+	fwd_ctl = 0;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+		u8 vc = vc_map[nport];
+
+		if (rx_data[nport].num_streams == 0)
+			continue;
+
+		switch (rxport->rx_mode) {
+		default:
+			WARN_ON(true);
+			fallthrough;
+
+		case RXPORT_MODE_RAW10:
+			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
+					   rx_data[nport].pixel_dt | (vc << 6));
+
+			ub960_rxport_write(priv, rxport->nport,
+				UB960_RR_RAW_EMBED_DTYPE,
+				(rx_data[nport].meta_lines << 6) | rx_data[nport].meta_dt);
+
+			break;
+
+		case RXPORT_MODE_CSI2_SYNC:
+		case RXPORT_MODE_CSI2_ASYNC:
+			if (!priv->hw_data->ub9702) {
+				/* Map all VCs from this port to the same VC */
+				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
+						   (vc << 6) | (vc << 4) |
+							   (vc << 2) | (vc << 0));
+			} else {
+				unsigned int i;
+
+				/* Map all VCs from this port to VC(nport) */
+				for (i = 0; i < 8; ++i)
+					ub960_rxport_write(priv, nport,
+						UB960_RR_VC_ID_MAP(i), nport);
+			}
+
+			break;
+		}
+
+		/* Forwarding */
+
+		fwd_ctl |= BIT(4 + nport); /* forward disable */
+
+		if (rx_data[nport].tx_port == 1)
+			fwd_ctl |= BIT(nport); /* forward to TX1 */
+		else
+			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
+	}
+
+	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
+
+	return 0;
+}
+
+static void ub960_update_streaming_status(struct ub960_data *priv)
+{
+	unsigned int i;
+	bool streaming = false;
+
+	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
+		if (priv->stream_enable_mask[i]) {
+			streaming = true;
+			break;
+		}
+	}
+
+	priv->streaming = streaming;
+}
+
+static int ub960_enable_streams(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state, u32 source_pad,
+				u64 source_streams_mask)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+	struct device *dev = &priv->client->dev;
+	const struct v4l2_subdev_krouting *routing;
+	unsigned int source_stream;
+	int ret;
+	u64 sink_streams[UB960_MAX_RX_NPORTS] = { 0 };
+	unsigned int nport;
+	unsigned int failed_port;
+
+	dev_dbg(dev, "Enable streams %u:%#llx\n", source_pad,
+		source_streams_mask);
+
+	if (priv->stream_enable_mask[source_pad] & source_streams_mask) {
+		dev_err(dev,
+			"cannot enable already enabled streams on pad %u mask %#llx\n",
+			source_pad, source_streams_mask);
+		return -EBUSY;
+	}
+
+	routing = &state->routing;
+
+	if (!priv->streaming) {
+		dev_dbg(dev, "Prepare for streaming\n");
+		ret = ub960_configure_ports_for_streaming(priv, state);
+		if (ret)
+			return ret;
+	}
+
+	/* Enable TX port if not yet enabled */
+	if (!priv->stream_enable_mask[source_pad]) {
+		ret = ub960_enable_tx_port(priv,
+					   ub960_pad_to_port(priv, source_pad));
+		if (ret)
+			return ret;
+	}
+
+	priv->stream_enable_mask[source_pad] |= source_streams_mask;
+
+	/* Collect sink streams per pad which we need to enable */
+	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
+	     ++source_stream) {
+		struct v4l2_subdev_route *route;
+
+		if (!(source_streams_mask & BIT_ULL(source_stream)))
+			continue;
+
+		for_each_active_route(routing, route) {
+			if (!(route->source_pad == source_pad) ||
+			    !(route->source_stream == source_stream))
+				continue;
+
+			nport = ub960_pad_to_port(priv, route->sink_pad);
+
+			sink_streams[nport] |= BIT_ULL(route->sink_stream);
+		}
+	}
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct v4l2_subdev *source_sd;
+		struct media_pad *source_sd_pad;
+
+		if (!sink_streams[nport])
+			continue;
+
+		/* Enable the RX port if not yet enabled */
+		if (!priv->stream_enable_mask[nport]) {
+			ret = ub960_enable_rx_port(priv, nport);
+			if (ret) {
+				failed_port = nport;
+				goto err;
+			}
+		}
+
+		priv->stream_enable_mask[nport] |= sink_streams[nport];
+
+		dev_dbg(dev, "Enable RX port %u streams %#llx\n", nport,
+			sink_streams[nport]);
+
+		source_sd_pad = media_pad_remote_pad_first(&priv->pads[nport]);
+		source_sd = priv->rxports[nport]->sd;
+
+		ret = v4l2_subdev_enable_streams(
+			source_sd, source_sd_pad->index, sink_streams[nport]);
+		if (ret) {
+			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
+
+			if (!priv->stream_enable_mask[nport])
+				ub960_disable_rx_port(priv, nport);
+
+			failed_port = nport;
+			goto err;
+		}
+	}
+
+	priv->streaming = true;
+
+	return 0;
+
+err:
+	for (nport = 0; nport < failed_port; ++nport) {
+		struct v4l2_subdev *source_sd;
+		struct media_pad *source_sd_pad;
+
+		if (!sink_streams[nport])
+			continue;
+
+		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
+			sink_streams[nport]);
+
+		source_sd_pad = media_pad_remote_pad_first(&priv->pads[nport]);
+		source_sd = priv->rxports[nport]->sd;
+
+		ret = v4l2_subdev_disable_streams(
+			source_sd, source_sd_pad->index, sink_streams[nport]);
+		WARN_ON(ret);
+
+		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
+
+		/* Disable RX port if no active streams */
+		if (!priv->stream_enable_mask[nport])
+			ub960_disable_rx_port(priv, nport);
+	}
+
+	priv->stream_enable_mask[source_pad] &= ~source_streams_mask;
+
+	if (!priv->stream_enable_mask[source_pad])
+		ub960_disable_tx_port(priv,
+				      ub960_pad_to_port(priv, source_pad));
+
+	ub960_update_streaming_status(priv);
+
+	return ret;
+}
+
+static int ub960_disable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 source_pad, u64 source_streams_mask)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+	struct device *dev = &priv->client->dev;
+	const struct v4l2_subdev_krouting *routing;
+	int ret;
+	unsigned int source_stream;
+	u64 sink_streams[UB960_MAX_RX_NPORTS] = { 0 };
+	unsigned int nport;
+
+	dev_dbg(dev, "Disable streams %u:%#llx\n", source_pad,
+		source_streams_mask);
+
+	if ((priv->stream_enable_mask[source_pad] & source_streams_mask) != source_streams_mask) {
+		dev_err(dev,
+			"cannot disable already disabled streams on pad %u mask %#llx\n",
+			source_pad, source_streams_mask);
+		return -EBUSY;
+	}
+
+	routing = &state->routing;
+
+	/* Collect sink streams per pad which we need to disable */
+	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
+	     ++source_stream) {
+		struct v4l2_subdev_route *route;
+
+		if (!(source_streams_mask & BIT_ULL(source_stream)))
+			continue;
+
+		for_each_active_route(routing, route) {
+			if (!(route->source_pad == source_pad) ||
+			    !(route->source_stream == source_stream))
+				continue;
+
+			nport = ub960_pad_to_port(priv, route->sink_pad);
+
+			sink_streams[nport] |= BIT_ULL(route->sink_stream);
+		}
+	}
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct v4l2_subdev *source_sd;
+		struct media_pad *source_sd_pad;
+
+		if (!sink_streams[nport])
+			continue;
+
+		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
+			sink_streams[nport]);
+
+		source_sd_pad = media_pad_remote_pad_first(&priv->pads[nport]);
+		source_sd = priv->rxports[nport]->sd;
+
+		ret = v4l2_subdev_disable_streams(
+			source_sd, source_sd_pad->index, sink_streams[nport]);
+		WARN_ON(ret);
+
+		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
+
+		/* Disable RX port if no active streams */
+		if (!priv->stream_enable_mask[nport])
+			ub960_disable_rx_port(priv, nport);
+	}
+
+	/* Disable TX port if no active streams */
+
+	priv->stream_enable_mask[source_pad] &= ~source_streams_mask;
+
+	if (!priv->stream_enable_mask[source_pad])
+		ub960_disable_tx_port(priv,
+				      ub960_pad_to_port(priv, source_pad));
+
+	ub960_update_streaming_status(priv);
+
+	return 0;
+}
+
+static int ub960_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	u64 pad_stream_masks[UB960_MAX_TX_NPORTS] = { 0 };
+	unsigned int nport;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	routing = &state->routing;
+
+	for_each_active_route(routing, route)
+		pad_stream_masks[ub960_pad_to_port(priv, route->source_pad)] |=
+			BIT_ULL(route->source_stream);
+
+	if (enable) {
+		for (nport = 0; nport < UB960_MAX_TX_NPORTS; ++nport) {
+			if (pad_stream_masks[nport] == 0)
+				continue;
+
+			ret = ub960_enable_streams(
+				sd, state, priv->hw_data->num_rxports + nport,
+				pad_stream_masks[nport]);
+
+			if (ret) {
+				for (; nport > 0; --nport) {
+					if (pad_stream_masks[nport - 1] == 0)
+						continue;
+
+					ub960_disable_streams(
+						sd, state,
+						priv->hw_data->num_rxports +
+							nport - 1,
+						pad_stream_masks[nport - 1]);
+				}
+
+				break;
+			}
+		}
+	} else {
+		for (nport = 0; nport < UB960_MAX_TX_NPORTS; ++nport) {
+			if (pad_stream_masks[nport] == 0)
+				continue;
+
+			ub960_disable_streams(
+				sd, state, priv->hw_data->num_rxports + nport,
+				pad_stream_masks[nport]);
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops ub960_video_ops = {
+	.s_stream = ub960_s_stream,
+};
+
+static int _ub960_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_krouting *routing)
+{
+	const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	/*
+	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
+	 * frame desc is made dynamically allocated.
+	 */
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -E2BIG;
+
+	/*
+	 * TODO: We need a new flag to validate that all streams from a sink pad
+	 * go to a single source pad.
+	 */
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ub960_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
+		return -EBUSY;
+
+	return _ub960_set_routing(sd, state, routing);
+}
+
+static int ub960_get_source_frame_desc(struct ub960_data *priv,
+				       struct v4l2_mbus_frame_desc *desc,
+				       u8 nport)
+{
+	struct v4l2_subdev *sd;
+	struct media_pad *pad;
+	int ret;
+
+	pad = media_pad_remote_pad_first(&priv->pads[nport]);
+	if (!pad)
+		return -EPIPE;
+
+	sd = priv->rxports[nport]->sd;
+
+	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad->index, desc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+	const struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+	struct device *dev = &priv->client->dev;
+	u8 vc_map[UB960_MAX_RX_NPORTS] = { 0 };
+
+	dev_dbg(dev, "%s for pad %d\n", __func__, pad);
+
+	if (!ub960_pad_is_source(priv, pad))
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
+
+	ub960_get_vc_maps(priv, state, vc_map);
+
+	routing = &state->routing;
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		struct v4l2_mbus_frame_desc source_fd;
+		unsigned int j;
+		unsigned int nrxport;
+
+		if (route->source_pad != pad)
+			continue;
+
+		ret = ub960_get_source_frame_desc(priv, &source_fd,
+						  route->sink_pad);
+		if (ret) {
+			dev_err(dev,
+				"Failed to get source frame desc for port %u\n",
+				route->sink_pad);
+			goto out;
+		}
+
+		for (j = 0; j < source_fd.num_entries; ++j)
+			if (source_fd.entry[j].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[j];
+				break;
+			}
+
+		if (!source_entry) {
+			dev_err(dev,
+				"Failed to find stream from source frame desc\n");
+			ret = -EPIPE;
+			goto out;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+
+		fd->entry[fd->num_entries].flags =
+			V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		fd->entry[fd->num_entries].length = source_entry->length;
+		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
+
+		nrxport = ub960_pad_to_port(priv, route->sink_pad);
+
+		fd->entry[fd->num_entries].bus.csi2.vc = vc_map[nrxport];
+
+		if (source_fd.type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+			fd->entry[fd->num_entries].bus.csi2.dt =
+				source_entry->bus.csi2.dt;
+		} else {
+			const struct ub960_format_info *ub960_fmt;
+			struct v4l2_mbus_framefmt *fmt;
+
+			fmt = v4l2_subdev_state_get_stream_format(
+				state, pad, route->source_stream);
+
+			if (!fmt) {
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ub960_fmt = ub960_find_format(fmt->code);
+			if (!ub960_fmt) {
+				dev_err(dev, "Unable to find format\n");
+				ret = -EINVAL;
+				goto out;
+			}
+
+			fd->entry[fd->num_entries].bus.csi2.dt =
+				ub960_fmt->datatype;
+		}
+
+		fd->num_entries++;
+	}
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int ub960_set_fmt(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_state *state,
+			 struct v4l2_subdev_format *format)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (ub960_pad_is_source(priv, format->pad))
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	/* TODO: implement fmt validation */
+
+	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+						  format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int ub960_init_cfg(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = 0,
+			.sink_stream = 0,
+			.source_pad = priv->hw_data->num_rxports,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _ub960_set_routing(sd, state, &routing);
+}
+
+static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
+	.enable_streams = ub960_enable_streams,
+	.disable_streams = ub960_disable_streams,
+
+	.set_routing = ub960_set_routing,
+	.get_frame_desc = ub960_get_frame_desc,
+
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ub960_set_fmt,
+
+	.init_cfg = ub960_init_cfg,
+};
+
+static int ub960_log_status(struct v4l2_subdev *sd)
+{
+	struct ub960_data *priv = sd_to_ub960(sd);
+	struct device *dev = &priv->client->dev;
+	struct v4l2_subdev_state *state;
+	unsigned int nport;
+	u8 v = 0, v1 = 0, v2 = 0;
+	unsigned int i;
+	char id[7];
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for (i = 0; i < 6; ++i)
+		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
+	id[6] = 0;
+
+	dev_info(dev, "ID '%s'\n", id);
+
+	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+		struct ub960_txport *txport = priv->txports[nport];
+
+		dev_info(dev, "TX %u\n", nport);
+
+		if (!txport) {
+			dev_info(dev, "\tNot initialized\n");
+			continue;
+		}
+
+		ub960_csiport_read(priv, nport, UB960_TR_CSI_STS, &v);
+		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1), v & (u8)BIT(0));
+
+		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport), &v1);
+		ub960_read(priv, UB960_SR_CSI_FRAME_COUNT_LO(nport), &v2);
+		dev_info(dev, "\tframe counter %u\n", (v1 << 8) | v2);
+
+		ub960_read(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport), &v1);
+		ub960_read(priv, UB960_SR_CSI_FRAME_ERR_COUNT_LO(nport), &v2);
+		dev_info(dev, "\tframe error counter %u\n", (v1 << 8) | v2);
+
+		ub960_read(priv, UB960_SR_CSI_LINE_COUNT_HI(nport), &v1);
+		ub960_read(priv, UB960_SR_CSI_LINE_COUNT_LO(nport), &v2);
+		dev_info(dev, "\tline counter %u\n", (v1 << 8) | v2);
+
+		ub960_read(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport), &v1);
+		ub960_read(priv, UB960_SR_CSI_LINE_ERR_COUNT_LO(nport), &v2);
+		dev_info(dev, "\tline error counter %u\n", (v1 << 8) | v2);
+	}
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+		u8 eq_level;
+		s8 strobe_pos;
+		unsigned int i;
+
+		dev_info(dev, "RX %u\n", nport);
+
+		if (!rxport) {
+			dev_info(dev, "\tNot initialized\n");
+			continue;
+		}
+
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1, &v);
+
+		if (v & UB960_RR_RX_PORT_STS1_LOCK_STS)
+			dev_info(dev, "\tLocked\n");
+		else
+			dev_info(dev, "\tNot locked\n");
+
+		dev_info(dev, "\trx_port_sts1 %#x\n", v);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2, &v);
+		dev_info(dev, "\trx_port_sts2 %#x\n", v);
+
+		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
+		dev_info(dev, "\tlink freq %u MHz\n", v1 * 1000000 + v2 * 1000000 / 256);
+
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
+		dev_info(dev, "\tparity errors %u\n", (v1 << 8) | v2);
+
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
+		dev_info(dev, "\tlines per frame %u\n", (v1 << 8) | v2);
+
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
+		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
+		dev_info(dev, "\tbytes per line %u\n", (v1 << 8) | v2);
+
+		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
+		dev_info(dev, "\tcsi_err_counter %u\n", v);
+
+		/* Strobe */
+
+		ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+
+		dev_info(dev, "\t%s strobe\n",
+			 (v & BIT(0)) ? "Adaptive" : "Manual");
+
+		if (v & BIT(0)) {
+			ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+
+			dev_info(dev, "\tStrobe range [%d, %d]\n",
+				 (v & 0xf) - 7, ((v >> 4) & 0xf) - 7);
+		}
+
+		ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+
+		dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
+
+		/* EQ */
+
+		ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+
+		dev_info(dev, "\t%s EQ\n",
+			 (v & BIT(0)) ? "Manual" : "Adaptive");
+
+		if (!(v & BIT(0))) {
+			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX,
+					  &v);
+
+			dev_info(dev, "\tEQ range [%u, %u]\n", v & 0xf,
+				 (v >> 4) & 0xf);
+		}
+
+		ub960_rxport_get_eq_level(priv, nport, &eq_level);
+
+		dev_info(dev, "\tEQ level %u\n", eq_level);
+
+		/* GPIOs */
+		for (i = 0; i < UB960_NUM_BC_GPIOS; ++i) {
+			u8 ctl_reg;
+			u8 ctl_shift;
+
+			ctl_reg = UB960_RR_BC_GPIO_CTL(i / 2);
+			ctl_shift = (i % 2) * 4;
+
+			ub960_rxport_read(priv, nport, ctl_reg, &v);
+
+			dev_info(dev, "\tGPIO%u: mode %u\n", i,
+				 (v >> ctl_shift) & 0xf);
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops ub960_subdev_core_ops = {
+	.log_status		= ub960_log_status,
+	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops ub960_subdev_ops = {
+	.core		= &ub960_subdev_core_ops,
+	.video		= &ub960_video_ops,
+	.pad		= &ub960_pad_ops,
+};
+
+static const struct media_entity_operations ub960_entity_ops = {
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
+};
+
+static void ub960_enable_tpg(struct ub960_data *priv, int tpg_num)
+{
+	/*
+	 * Note: no need to write UB960_REG_IND_ACC_CTL: the only indirect
+	 * registers target we use is "CSI-2 Pattern Generator & Timing
+	 * Registers", which is the default
+	 */
+
+	/*
+	 * TPG can only provide a single stream per CSI TX port. If
+	 * multiple streams are currently enabled, only the first
+	 * one will use the TPG, other streams will be halted.
+	 */
+
+	struct v4l2_mbus_framefmt *fmt;
+	u8 vbp, vfp;
+	u16 blank_lines;
+	u16 width;
+	u16 height;
+
+	u16 bytespp = 2; /* For MEDIA_BUS_FMT_UYVY8_1X16 */
+	u8 cbars_idx = tpg_num - TEST_PATTERN_V_COLOR_BARS_1;
+	u8 num_cbars = 1 << cbars_idx;
+
+	u16 line_size;	/* Line size [bytes] */
+	u16 bar_size;	/* cbar size [bytes] */
+	u16 act_lpf;	/* active lines/frame */
+	u16 tot_lpf;	/* tot lines/frame */
+	u16 line_pd;	/* Line period in 10-ns units */
+
+	struct v4l2_subdev_state *state;
+
+	state = v4l2_subdev_get_locked_active_state(&priv->sd);
+
+	vbp = 33;
+	vfp = 10;
+	blank_lines = vbp + vfp + 2; /* total blanking lines */
+
+	fmt = v4l2_subdev_state_get_stream_format(state, 4, 0);
+	if (!fmt) {
+		dev_err(&priv->client->dev, "failed to enable TPG\n");
+		return;
+	}
+
+	width = fmt->width;
+	height = fmt->height;
+
+	line_size = width * bytespp;
+	bar_size = line_size / num_cbars;
+	act_lpf = height;
+	tot_lpf = act_lpf + blank_lines;
+	line_pd = 100000000 / 60 / tot_lpf;
+
+	/* Disable forwarding from FPD-3 RX ports */
+	ub960_read(priv, UB960_SR_FWD_CTL1, &priv->stored_fwd_ctl);
+	ub960_write(priv, UB960_SR_FWD_CTL1, 0xf << 4);
+
+	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CTL,
+			UB960_IR_PGEN_CTL_PGEN_ENABLE);
+
+	/* YUV422 8bit: 2 bytes/block, CSI-2 data type 0x1e */
+	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CFG,
+			cbars_idx << 4 | 0x2);
+	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CSI_DI,
+			0x1e);
+
+	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
+			  UB960_IR_PGEN_LINE_SIZE1, line_size);
+	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
+			  UB960_IR_PGEN_BAR_SIZE1, bar_size);
+	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
+			  UB960_IR_PGEN_ACT_LPF1, act_lpf);
+	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
+			  UB960_IR_PGEN_TOT_LPF1, tot_lpf);
+	ub960_write_ind16(priv, UB960_IND_TARGET_PAT_GEN,
+			  UB960_IR_PGEN_LINE_PD1, line_pd);
+	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_VBP, vbp);
+	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_VFP, vfp);
+}
+
+static void ub960_disable_tpg(struct ub960_data *priv)
+{
+	/* TPG off, enable forwarding from FPD-3 RX ports */
+	ub960_write(priv, UB960_SR_FWD_CTL1, priv->stored_fwd_ctl);
+
+	ub960_write_ind(priv, UB960_IND_TARGET_PAT_GEN, UB960_IR_PGEN_CTL, 0x00);
+}
+
+static int ub960_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ub960_data *priv =
+		container_of(ctrl->handler, struct ub960_data, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		if (ctrl->val == 0)
+			ub960_disable_tpg(priv);
+		else
+			ub960_enable_tpg(priv, ctrl->val);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ub960_ctrl_ops = {
+	.s_ctrl = ub960_s_ctrl,
+};
+
+/* -----------------------------------------------------------------------------
+ * Core
+ */
+
+static irqreturn_t ub960_handle_events(int irq, void *arg)
+{
+	struct ub960_data *priv = arg;
+	unsigned int i;
+	u8 int_sts;
+	int ret;
+
+	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts);
+
+	if (!ret && int_sts) {
+		u8 fwd_sts;
+
+		dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
+
+		ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
+
+		dev_dbg(&priv->client->dev, "FWD_STS %#x\n", fwd_sts);
+
+		for (i = 0; i < priv->hw_data->num_txports; ++i) {
+			if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
+				ub960_csi_handle_events(priv, i);
+		}
+
+		for (i = 0; i < priv->hw_data->num_rxports; i++) {
+			if (!priv->rxports[i])
+				continue;
+
+			if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
+				ub960_rxport_handle_events(priv, i);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void ub960_handler_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct ub960_data *priv =
+		container_of(dwork, struct ub960_data, poll_work);
+
+	ub960_handle_events(0, priv);
+
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(UB960_POLL_TIME_MS));
+}
+
+static void ub960_txport_free_ports(struct ub960_data *priv)
+{
+	unsigned int nport;
+
+	for (nport = 0; nport < priv->hw_data->num_txports; nport++) {
+		struct ub960_txport *txport = priv->txports[nport];
+
+		if (!txport)
+			continue;
+
+		kfree(txport);
+		priv->txports[nport] = NULL;
+	}
+}
+
+static void ub960_rxport_free_ports(struct ub960_data *priv)
+{
+	unsigned int nport;
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
+		struct ub960_rxport *rxport = priv->rxports[nport];
+
+		if (!rxport)
+			continue;
+
+		if (rxport->vpoc)
+			regulator_disable(rxport->vpoc);
+
+		fwnode_handle_put(rxport->fwnode);
+		of_node_put(rxport->remote_of_node);
+
+		kfree(rxport);
+		priv->rxports[nport] = NULL;
+	}
+}
+
+static int ub960_parse_dt_base(struct ub960_data *priv)
+{
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	size_t table_size;
+	u16 *aliases;
+	int ret;
+
+	ret = of_property_count_u16_elems(np, "i2c-alias-pool");
+	if (ret < 0) {
+		dev_err(dev, "Failed to count 'i2c-alias-pool' property: %d\n",
+			ret);
+		return ret;
+	}
+
+	table_size = ret;
+	priv->atr_alias_table.num_entries = ret;
+
+	if (!table_size)
+		return 0;
+
+	priv->atr_alias_table.entries =
+		devm_kcalloc(dev, table_size,
+			     sizeof(struct atr_alias_table_entry), GFP_KERNEL);
+	if (!priv->atr_alias_table.entries)
+		return -ENOMEM;
+
+	aliases = kcalloc(table_size, sizeof(u16), GFP_KERNEL);
+	if (!aliases)
+		return -ENOMEM;
+
+	ret = of_property_read_u16_array(np, "i2c-alias-pool", aliases,
+					 table_size);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read 'i2c-alias-pool' property: %d\n",
+			ret);
+		kfree(aliases);
+		return ret;
+	}
+
+	for (unsigned int i = 0; i < table_size; ++i)
+		priv->atr_alias_table.entries[i].alias_id = aliases[i];
+
+	kfree(aliases);
+
+	dev_dbg(dev, "i2c-alias-pool has %zu aliases", table_size);
+
+	return 0;
+}
+
+static int ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
+						 struct device_node *np,
+						 struct ub960_rxport *rxport)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+	u32 rx_mode;
+	u32 cdr_mode;
+	s32 strobe_pos;
+	u32 eq_level;
+	unsigned int nport = rxport->nport;
+
+	ret = of_property_read_u32(np, "cdr-mode", &cdr_mode);
+	if (ret == -EINVAL) {
+		cdr_mode = RXPORT_CDR_FPD3;
+	} else if (ret < 0) {
+		dev_err(dev, "Failed to get RX port CDR mode: %d\n", ret);
+		return ret;
+	}
+
+	if (cdr_mode > RXPORT_CDR_LAST) {
+		dev_err(dev, "Bad RX port cdr %u\n", cdr_mode);
+		return -EINVAL;
+	}
+
+	if (!priv->hw_data->fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+		dev_err(dev, "FPD-Link 4 CDR not supported on RX port %u\n",
+			nport);
+		return -EINVAL;
+	}
+
+	rxport->cdr_mode = cdr_mode;
+
+	ret = of_property_read_u32(np, "rx-mode", &rx_mode);
+	if (ret < 0) {
+		dev_err(dev, "Missing RX port RX mode: %d\n", ret);
+		return ret;
+	}
+
+	if (rx_mode > RXPORT_MODE_LAST) {
+		dev_err(dev, "Bad RX port RX mode %u\n", rx_mode);
+		return -EINVAL;
+	}
+
+	rxport->rx_mode = rx_mode;
+
+	/* EQ & Strobe related */
+
+	/* Defaults */
+	rxport->eq.manual_eq = false;
+	rxport->eq.aeq.eq_level_min = UB960_MIN_EQ_LEVEL;
+	rxport->eq.aeq.eq_level_max = UB960_MAX_EQ_LEVEL;
+
+	ret = of_property_read_s32(np, "strobe-pos", &strobe_pos);
+	if (ret) {
+		if (ret != -EINVAL) {
+			dev_err(dev, "Failed to read 'strobe-pos': %d\n", ret);
+			return ret;
+		}
+	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
+		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
+		dev_err(dev, "Illegal 'strobe-pos' value: %d\n", strobe_pos);
+	} else {
+		// NOTE: ignored unless global manual strobe pos is set
+		rxport->eq.strobe_pos = strobe_pos;
+		if (!priv->strobe.manual)
+			dev_warn(dev, "'strobe-pos' ignored as 'manual-strobe' not set\n");
+	}
+
+	ret = of_property_read_u32(np, "eq-level", &eq_level);
+	if (ret) {
+		if (ret != -EINVAL) {
+			dev_err(dev, "Failed to read 'eq-level': %d\n", ret);
+			return ret;
+		}
+	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
+		dev_err(dev, "Illegal 'eq-level' value: %d\n", eq_level);
+	} else {
+		rxport->eq.manual_eq = true;
+		rxport->eq.manual.eq_level = eq_level;
+	}
+
+	return 0;
+}
+
+static int ub960_parse_dt_rxport(struct ub960_data *priv,
+				 struct device_node *np)
+{
+	const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
+							"vpoc2", "vpoc3" };
+	struct device *dev = &priv->client->dev;
+	unsigned int nport;
+	int ret;
+	struct ub960_rxport *rxport;
+	u32 ser_i2c_alias;
+	struct device_node *ep_np;
+	struct fwnode_handle *remote_ep_node;
+
+	ret = of_property_read_u32(np, "reg", &nport);
+	if (ret) {
+		dev_err(dev, "Failed to get link reg\n");
+		return ret;
+	}
+
+	if (priv->rxports[nport]) {
+		dev_err(dev, "OF: %s: reg value %d is duplicated\n",
+			of_node_full_name(np), nport);
+		return -EADDRINUSE;
+	}
+
+	rxport = kzalloc(sizeof(*rxport), GFP_KERNEL);
+	if (!rxport)
+		return -ENOMEM;
+
+	priv->rxports[nport] = rxport;
+
+	rxport->nport = nport;
+	rxport->priv = priv;
+
+	ret = ub960_parse_dt_rxport_link_properties(priv, np, rxport);
+	if (ret)
+		goto err_free_rxport;
+
+	ret = of_property_read_u32(np, "i2c-alias", &ser_i2c_alias);
+	if (ret) {
+		dev_err(dev, "Failed to get serializer i2c-alias: %d\n", ret);
+		goto err_free_rxport;
+	}
+	rxport->ser_alias = ser_i2c_alias;
+
+	rxport->vpoc = devm_regulator_get_optional(dev, vpoc_names[nport]);
+	if (IS_ERR(rxport->vpoc)) {
+		ret = PTR_ERR(rxport->vpoc);
+		if (ret == -ENODEV) {
+			rxport->vpoc = NULL;
+		} else {
+			dev_err(dev, "Failed to get VPOC supply: %d\n", ret);
+			goto err_free_rxport;
+		}
+	}
+
+	rxport->remote_of_node = of_get_child_by_name(np, "serializer");
+	if (!rxport->remote_of_node) {
+		dev_err(dev, "OF: %s: missing remote-chip child\n",
+			of_node_full_name(np));
+		ret = -EINVAL;
+		goto err_free_rxport;
+	}
+
+	/* We also parse the endpoint data here */
+
+	ep_np = of_graph_get_endpoint_by_regs(priv->client->dev.of_node, nport, 0);
+	if (!ep_np) {
+		dev_err(dev, "Missing OF graph endpoint for link %u\n", nport);
+		ret = -EINVAL;
+		goto err_ser_node_put;
+	}
+
+	remote_ep_node = fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep_np));
+
+	of_node_put(ep_np);
+
+	if (!remote_ep_node) {
+		dev_err(dev, "No remote endpoint for rxport%d\n", nport);
+		ret = -ENODEV;
+		goto err_ser_node_put;
+	}
+
+	rxport->fwnode = remote_ep_node;
+
+	// XXX enable somewhere else?
+	if (rxport->vpoc) {
+		ret = regulator_enable(rxport->vpoc);
+		if (ret)
+			goto err_ep_node_put;
+	}
+
+	return 0;
+
+err_ep_node_put:
+	fwnode_handle_put(rxport->fwnode);
+err_ser_node_put:
+	of_node_put(rxport->remote_of_node);
+err_free_rxport:
+	priv->rxports[nport] = NULL;
+	kfree(rxport);
+	return ret;
+}
+
+static struct device_node *
+ub960_of_get_link_by_regs(struct device_node *links_np, unsigned int nport)
+{
+	struct device_node *link_np;
+	int ret;
+
+	for_each_child_of_node(links_np, link_np) {
+		u32 link_num;
+
+		if (!of_node_name_eq(link_np, "link"))
+			continue;
+
+		ret = of_property_read_u32(link_np, "reg", &link_num);
+		if (ret)
+			return NULL;
+
+		if (nport == link_num) {
+			of_node_get(link_np);
+			return link_np;
+		}
+	}
+
+	return NULL;
+}
+
+static int ub960_parse_dt_rxports(struct ub960_data *priv)
+{
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	struct device_node *links_np;
+	unsigned int nport;
+	int ret;
+
+	links_np = of_get_child_by_name(np, "links");
+	if (!links_np) {
+		dev_err(dev, "links node missing\n");
+		return -ENODEV;
+	}
+
+	/* Defaults, recommended by TI */
+	priv->strobe.min = 2;
+	priv->strobe.max = 3;
+
+	priv->strobe.manual = of_property_read_bool(links_np, "manual-strobe");
+
+	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
+		struct device_node *link_np;
+
+		link_np = ub960_of_get_link_by_regs(links_np, nport);
+		if (!link_np)
+			continue;
+
+		ret = ub960_parse_dt_rxport(priv, link_np);
+
+		of_node_put(link_np);
+
+		if (ret) {
+			dev_err(dev, "Failed to parse link node\n");
+			goto err_put_links;
+		}
+	}
+
+	of_node_put(links_np);
+
+	return 0;
+
+err_put_links:
+	of_node_put(links_np);
+
+	return ret;
+}
+
+static int ub960_parse_dt_txports(struct ub960_data *priv)
+{
+	struct device_node *np = priv->client->dev.of_node;
+	u32 nport;
+	int ret;
+
+	for (nport = 0; nport < priv->hw_data->num_txports; ++nport) {
+		struct device_node *ep_np;
+
+		ep_np = of_graph_get_endpoint_by_regs(np, nport + priv->hw_data->num_rxports, 0);
+		if (!ep_np)
+			continue;
+
+		ret = ub960_parse_dt_txport(priv, ep_np, nport);
+
+		of_node_put(ep_np);
+
+		if (ret)
+			break;
+	}
+
+	return 0;
+}
+
+static int ub960_parse_dt(struct ub960_data *priv)
+{
+	struct device_node *np = priv->client->dev.of_node;
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	if (!np) {
+		dev_err(dev, "OF: no device tree node!\n");
+		return -ENOENT;
+	}
+
+	ret = ub960_parse_dt_base(priv);
+	if (ret)
+		return ret;
+
+	ret = ub960_parse_dt_rxports(priv);
+	if (ret)
+		return ret;
+
+	ret = ub960_parse_dt_txports(priv);
+	if (ret)
+		goto err_free_rxports;
+
+	return 0;
+
+err_free_rxports:
+	ub960_rxport_free_ports(priv);
+
+	return ret;
+}
+
+static int ub960_notify_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *subdev,
+			      struct v4l2_async_subdev *asd)
+{
+	struct ub960_data *priv = sd_to_ub960(notifier->sd);
+	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
+	struct device *dev = &priv->client->dev;
+	u8 nport = rxport->nport;
+	unsigned int src_pad;
+	unsigned int i;
+	int ret;
+
+	dev_dbg(dev, "Bind %s\n", subdev->name);
+
+	ret = media_entity_get_fwnode_pad(&subdev->entity, rxport->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(dev, "Failed to find pad for %s\n", subdev->name);
+		return ret;
+	}
+
+	rxport->sd = subdev;
+	src_pad = ret;
+
+	ret = media_create_pad_link(&rxport->sd->entity, src_pad,
+				    &priv->sd.entity, nport,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(dev, "Unable to link %s:%u -> %s:%u\n",
+			rxport->sd->name, src_pad, priv->sd.name, nport);
+		return ret;
+	}
+
+	dev_dbg(dev, "Bound %s pad: %u on index %u\n", subdev->name, src_pad,
+		nport);
+
+	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
+		if (priv->rxports[i] && !priv->rxports[i]->sd) {
+			dev_dbg(dev, "Waiting for more subdevs to be bound\n");
+			return 0;
+		}
+	}
+
+	dev_dbg(dev, "All subdevs bound\n");
+
+	return 0;
+}
+
+static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_subdev *asd)
+{
+	struct ub960_data *priv = sd_to_ub960(notifier->sd);
+	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "Unbind %s\n", subdev->name);
+
+	rxport->sd = NULL;
+}
+
+static const struct v4l2_async_notifier_operations ub960_notify_ops = {
+	.bound = ub960_notify_bound,
+	.unbind = ub960_notify_unbind,
+};
+
+static int ub960_v4l2_notifier_register(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int i;
+	int ret;
+
+	v4l2_async_nf_init(&priv->notifier);
+
+	for (i = 0; i < priv->hw_data->num_rxports; ++i) {
+		struct ub960_rxport *rxport = priv->rxports[i];
+		struct ub960_asd *asd;
+
+		if (!rxport)
+			continue;
+
+		asd = v4l2_async_nf_add_fwnode(&priv->notifier, rxport->fwnode,
+					       struct ub960_asd);
+		if (IS_ERR(asd)) {
+			dev_err(dev, "Failed to add subdev for source %u: %ld",
+				i, PTR_ERR(asd));
+			v4l2_async_nf_cleanup(&priv->notifier);
+			return PTR_ERR(asd);
+		}
+
+		asd->rxport = rxport;
+	}
+
+	priv->notifier.ops = &ub960_notify_ops;
+
+	ret = v4l2_async_subdev_nf_register(&priv->sd, &priv->notifier);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev_notifier");
+		v4l2_async_nf_cleanup(&priv->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ub960_v4l2_notifier_unregister(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+
+	dev_dbg(dev, "Unregister async notif\n");
+
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+}
+
+static int ub960_create_subdev(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int i;
+	int ret;
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
+	v4l2_ctrl_handler_init(&priv->ctrl_handler,
+			       ARRAY_SIZE(ub960_tpg_qmenu) - 1);
+	priv->sd.ctrl_handler = &priv->ctrl_handler;
+
+	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub960_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ub960_tpg_qmenu) - 1, 0, 0,
+				     ub960_tpg_qmenu);
+
+	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
+			       ARRAY_SIZE(priv->tx_link_freq) - 1, 0,
+			       priv->tx_link_freq);
+
+	if (priv->ctrl_handler.error) {
+		ret = priv->ctrl_handler.error;
+		goto err_free_ctrl;
+	}
+
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS |
+		V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->sd.entity.ops = &ub960_entity_ops;
+
+	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
+		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	}
+
+	ret = media_entity_pads_init(&priv->sd.entity,
+				     priv->hw_data->num_rxports +
+					     priv->hw_data->num_txports,
+				     priv->pads);
+	if (ret)
+		goto err_free_ctrl;
+
+	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
+
+	ret = v4l2_subdev_init_finalize(&priv->sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = ub960_v4l2_notifier_register(priv);
+	if (ret) {
+		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
+		goto err_free_state;
+	}
+
+	ret = v4l2_async_register_subdev(&priv->sd);
+	if (ret) {
+		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
+		goto err_unreg_notif;
+	}
+
+	return 0;
+
+err_unreg_notif:
+	ub960_v4l2_notifier_unregister(priv);
+err_free_state:
+	v4l2_subdev_cleanup(&priv->sd);
+err_entity_cleanup:
+	media_entity_cleanup(&priv->sd.entity);
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+
+	return ret;
+}
+
+static void ub960_destroy_subdev(struct ub960_data *priv)
+{
+	ub960_v4l2_notifier_unregister(priv);
+	v4l2_async_unregister_subdev(&priv->sd);
+
+	v4l2_subdev_cleanup(&priv->sd);
+
+	media_entity_cleanup(&priv->sd.entity);
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+}
+
+static const struct regmap_config ub960_regmap_config = {
+	.name = "ds90ub960",
+
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0xff,
+
+	/*
+	 * We do locking in the driver to cover the TX/RX port selection and the
+	 * indirect register access.
+	 */
+	.disable_locking = true,
+};
+
+static void ub960_reset(struct ub960_data *priv, bool reset_regs)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned int v;
+	int ret;
+	u8 bit;
+
+	bit = reset_regs ? BIT(1) : BIT(0);
+
+	ub960_write(priv, UB960_SR_RESET, bit);
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
+				       (v & bit) == 0, 2000, 100000);
+
+	mutex_unlock(&priv->reg_lock);
+
+	if (ret)
+		dev_err(dev, "reset failed: %d\n", ret);
+}
+
+static int ub960_get_hw_resources(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	int ret;
+
+	priv->regmap = devm_regmap_init_i2c(priv->client, &ub960_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->vddio = devm_regulator_get(dev, "vddio");
+	if (IS_ERR(priv->vddio)) {
+		dev_err(dev, "cannot get VDDIO regulator\n");
+		return PTR_ERR(priv->vddio);
+	}
+
+	/* get power-down pin from DT */
+	priv->pd_gpio =
+		devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->pd_gpio)) {
+		ret = PTR_ERR(priv->pd_gpio);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Cannot get powerdown GPIO (%d)", ret);
+		return ret;
+	}
+
+	priv->refclk = devm_clk_get(dev, "refclk");
+	if (IS_ERR(priv->refclk)) {
+		ret = PTR_ERR(priv->refclk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Cannot get REFCLK (%d)", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ub960_enable_core_hw(struct ub960_data *priv)
+{
+	struct device *dev = &priv->client->dev;
+	u8 rev_mask;
+	int ret;
+	u8 dev_sts;
+	u8 refclk_freq;
+
+	ret = regulator_enable(priv->vddio);
+	if (ret) {
+		dev_err(dev, "failed to enable VDDIO regulator\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->refclk);
+	if (ret) {
+		dev_err(dev, "Failed to renable refclk: %d\n", ret);
+		goto err_disable_vddio;
+	}
+
+	if (priv->pd_gpio) {
+		gpiod_set_value_cansleep(priv->pd_gpio, 1);
+		/* wait min 2 ms for reset to complete */
+		usleep_range(2000, 5000);
+		gpiod_set_value_cansleep(priv->pd_gpio, 0);
+		/* wait min 2 ms for power up to finish */
+		usleep_range(2000, 5000);
+	}
+
+	ub960_reset(priv, true);
+
+	/* Runtime check register accessibility */
+	ret = ub960_read(priv, UB960_SR_REV_MASK, &rev_mask);
+	if (ret) {
+		dev_err(dev, "Cannot read first register (%d), abort\n", ret);
+		goto err_pd_gpio;
+	}
+
+	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
+		rev_mask);
+
+	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts);
+	if (ret)
+		goto err_pd_gpio;
+
+	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
+	if (ret)
+		goto err_pd_gpio;
+
+	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
+		!!(dev_sts & BIT(4)), refclk_freq,
+		clk_get_rate(priv->refclk) / 1000000);
+
+	/* Disable all RX ports by default */
+	ub960_write(priv, UB960_SR_RX_PORT_CTL, 0);
+
+	return 0;
+
+err_pd_gpio:
+	if (priv->pd_gpio)
+		gpiod_set_value_cansleep(priv->pd_gpio, 1);
+
+	clk_disable_unprepare(priv->refclk);
+err_disable_vddio:
+	regulator_disable(priv->vddio);
+
+	return ret;
+}
+
+static void ub960_disable_core_hw(struct ub960_data *priv)
+{
+	if (priv->pd_gpio)
+		gpiod_set_value_cansleep(priv->pd_gpio, 1);
+
+	clk_disable_unprepare(priv->refclk);
+
+	regulator_disable(priv->vddio);
+}
+
+static int ub960_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ub960_data *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+
+	priv->hw_data = of_device_get_match_data(dev);
+	if (!priv->hw_data)
+		return -ENODEV;
+
+	mutex_init(&priv->reg_lock);
+	mutex_init(&priv->atr_alias_table.lock);
+
+	INIT_DELAYED_WORK(&priv->poll_work, ub960_handler_work);
+
+	/*
+	 * Initialize these to invalid values so that the first reg writes will
+	 * configure the target.
+	 */
+	priv->current_indirect_target = 0xff;
+	priv->current_read_rxport = 0xff;
+	priv->current_write_rxport_mask = 0xff;
+	priv->current_read_csiport = 0xff;
+	priv->current_write_csiport_mask = 0xff;
+
+	ret = ub960_get_hw_resources(priv);
+	if (ret)
+		goto err_mutex_destroy;
+
+	ret = ub960_enable_core_hw(priv);
+	if (ret)
+		goto err_mutex_destroy;
+
+	/* release GPIO lock */
+	if (priv->hw_data->ub9702)
+		ub960_update_bits(priv, UB960_SR_RESET, BIT(5), BIT(5));
+
+	ret = ub960_parse_dt(priv);
+	if (ret)
+		goto err_disable_core_hw;
+
+	ret = ub960_init_tx_ports(priv);
+	if (ret)
+		goto err_free_ports;
+
+	ret = ub960_init_rx_ports(priv);
+	if (ret)
+		goto err_free_ports;
+
+	ub960_reset(priv, false);
+
+	ub960_rxport_wait_locks(priv, 0xf, NULL);
+
+	/*
+	 * Clear any errors caused by switching the RX port settings while
+	 * probing.
+	 */
+	ub960_clear_rx_errors(priv);
+
+	ret = ub960_init_atr(priv);
+	if (ret)
+		goto err_free_ports;
+
+	ret = ub960_rxport_add_serializers(priv);
+	if (ret)
+		goto err_uninit_atr;
+
+	ret = ub960_create_subdev(priv);
+	if (ret)
+		goto err_free_sers;
+
+	if (client->irq) {
+		dev_dbg(dev, "using IRQ %d\n", client->irq);
+
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						ub960_handle_events,
+						IRQF_ONESHOT, client->name,
+						priv);
+		if (ret) {
+			dev_err(dev, "Cannot enable IRQ (%d)\n", ret);
+			goto err_irq;
+		}
+
+		/* Disable GPIO3 as input */
+		ub960_update_bits(priv, UB960_SR_GPIO_INPUT_CTL, BIT(3), 0);
+		/* Enable GPIO3 as output, active low interrupt */
+		ub960_write(priv, UB960_SR_GPIO_PIN_CTL(3), 0xd1);
+
+		ub960_write(priv, UB960_SR_INTERRUPT_CTL,
+			    UB960_SR_INTERRUPT_CTL_ALL);
+	} else {
+		/* No IRQ, fallback to polling */
+		schedule_delayed_work(&priv->poll_work,
+				      msecs_to_jiffies(UB960_POLL_TIME_MS));
+
+		dev_dbg(dev, "using polling mode\n");
+	}
+
+	dev_info(dev, "Successfully probed\n");
+
+	return 0;
+
+err_irq:
+	ub960_destroy_subdev(priv);
+err_free_sers:
+	ub960_rxport_remove_serializers(priv);
+err_uninit_atr:
+	ub960_uninit_atr(priv);
+err_free_ports:
+	ub960_rxport_free_ports(priv);
+	ub960_txport_free_ports(priv);
+err_disable_core_hw:
+	ub960_disable_core_hw(priv);
+err_mutex_destroy:
+	mutex_destroy(&priv->atr_alias_table.lock);
+	mutex_destroy(&priv->reg_lock);
+	return ret;
+}
+
+static void ub960_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ub960_data *priv = sd_to_ub960(sd);
+
+	dev_dbg(&client->dev, "Removing\n");
+
+	cancel_delayed_work_sync(&priv->poll_work);
+
+	ub960_destroy_subdev(priv);
+	ub960_rxport_remove_serializers(priv);
+	ub960_uninit_atr(priv);
+	ub960_rxport_free_ports(priv);
+	ub960_txport_free_ports(priv);
+	ub960_disable_core_hw(priv);
+	mutex_destroy(&priv->atr_alias_table.lock);
+	mutex_destroy(&priv->reg_lock);
+
+	dev_dbg(&client->dev, "Remove done\n");
+}
+
+static const struct ub960_hw_data ds90ub960_hw = {
+	.model = "ub960",
+	.num_rxports = 4,
+	.num_txports = 2,
+};
+
+static const struct ub960_hw_data ds90ub9702_hw = {
+	.model = "ub9702",
+	.num_rxports = 4,
+	.num_txports = 2,
+	.ub9702 = true,
+	.fpdlink4 = true,
+};
+
+static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub960-q1", 0 },
+	{ "ds90ub9702-q1", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ub960_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
+	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ub960_dt_ids);
+#endif
+
+static struct i2c_driver ds90ub960_driver = {
+	.probe_new	= ub960_probe,
+	.remove		= ub960_remove,
+	.id_table	= ub960_id,
+	.driver = {
+		.name	= "ds90ub960",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(ub960_dt_ids),
+	},
+};
+
+module_i2c_driver(ds90ub960_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Texas Instruments DS90UB960-Q1 FPDLink-3 deserializer driver");
+MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
diff --git a/include/media/i2c/ds90ub9xx.h b/include/media/i2c/ds90ub9xx.h
new file mode 100644
index 000000000000..42d47d732c03
--- /dev/null
+++ b/include/media/i2c/ds90ub9xx.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __MEDIA_I2C_DS90UB9XX_H__
+#define __MEDIA_I2C_DS90UB9XX_H__
+
+#include <linux/types.h>
+
+struct i2c_atr;
+
+struct ds90ub9xx_platform_data {
+	u32 port;
+	struct i2c_atr *atr;
+	unsigned long bc_rate;
+};
+
+#endif /* __MEDIA_I2C_DS90UB9XX_H__ */
-- 
2.34.1

