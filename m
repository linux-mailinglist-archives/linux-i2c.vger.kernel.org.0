Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344E7E2646
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 00:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405661AbfJWWPE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Oct 2019 18:15:04 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:53303 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405897AbfJWWPE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Oct 2019 18:15:04 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from kblaiech@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 24 Oct 2019 00:14:53 +0200
Received: from farm-1.mtbu.labs.mlnx (farm-1.mtbu.labs.mlnx [10.15.2.31])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id x9NMEqYU019142;
        Wed, 23 Oct 2019 18:14:52 -0400
Received: (from kblaiech@localhost)
        by farm-1.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id x9NMEqA2007548;
        Wed, 23 Oct 2019 18:14:52 -0400
From:   Khalil Blaiech <kblaiech@mellanox.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Woods <dwoods@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Michael Shych <michaelsh@mellanox.com>
Cc:     Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org,
        arm-soc <arm@kernel.org>
Subject: [PATCH v6 1/2] i2c: i2c-mlx: I2C SMBus driver for Mellanox BlueField SoC
Date:   Wed, 23 Oct 2019 18:14:41 -0400
Message-Id: <4c2f30c9c42531f816e4cabe2db33d22f73213c5.1571868492.git.kblaiech@mellanox.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1571868492.git.kblaiech@mellanox.com>
References: <cover.1571868492.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1571868492.git.kblaiech@mellanox.com>
References: <cover.1571868492.git.kblaiech@mellanox.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added BlueField I2C driver to offer master and slave support for
Mellanox BlueField SoCs.  The driver implements an SMBus adapter
and interfaces to multiple busses that can be probed using both
ACPI and Device Tree infrastructures.

Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
---
 drivers/i2c/busses/Kconfig   |   13 +
 drivers/i2c/busses/Makefile  |    1 +
 drivers/i2c/busses/i2c-mlx.c | 2568 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2582 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-mlx.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 146ce40..ce9d714 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -722,6 +722,19 @@ config I2C_LPC2K
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-lpc2k.
 
+config I2C_MELLANOX
+        tristate "Mellanox BlueField I2C controller"
+        depends on (MELLANOX_PLATFORM && ARM64) || COMPILE_TEST
+        help
+          Enabling this option will add specific I2C SMBus support for Mellanox
+          BlueField system.
+
+          This driver can also be built as a module.  If so, the module will be
+          called i2c-mlx.
+
+          This driver implements an I2C SMBus host controller and enables both
+          master and slave functions.
+
 config I2C_MESON
 	tristate "Amlogic Meson I2C controller"
 	depends on ARCH_MESON || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3ab8aeb..0595976 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
+obj-$(CONFIG_I2C_MELLANOX)	+= i2c-mlx.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
 obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
 obj-$(CONFIG_I2C_MT65XX)	+= i2c-mt65xx.o
diff --git a/drivers/i2c/busses/i2c-mlx.c b/drivers/i2c/busses/i2c-mlx.c
new file mode 100644
index 0000000..efdefcf
--- /dev/null
+++ b/drivers/i2c/busses/i2c-mlx.c
@@ -0,0 +1,2568 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Mellanox i2c bus driver
+ *
+ *  Copyright (C) 2019 Mellanox Technologies, Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/string.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/acpi.h>
+#include <linux/mutex.h>
+
+/* Defines what functionality is present */
+#define MLX_I2C_FUNC_SMBUS_BLOCK \
+	(I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL)
+
+#define MLX_I2C_FUNC_SMBUS_DEFAULT \
+	(I2C_FUNC_SMBUS_BYTE      | I2C_FUNC_SMBUS_BYTE_DATA | \
+	 I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_I2C_BLOCK | \
+	 I2C_FUNC_SMBUS_PROC_CALL)
+
+#define MLX_I2C_FUNC_ALL \
+	(MLX_I2C_FUNC_SMBUS_DEFAULT | MLX_I2C_FUNC_SMBUS_BLOCK | \
+	 I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SLAVE)
+
+#define MLX_I2C_SMBUS_MAX        3
+
+/*
+ * Shared resources info in BlueField platforms
+ */
+
+#define I2C_COALESCE_TYU_ADDR    0x02801300
+#define I2C_COALESCE_TYU_SIZE    0x010
+
+#define I2C_GPIO_TYU_ADDR        0x02802000
+#define I2C_GPIO_TYU_SIZE        0x100
+
+#define I2C_COREPLL_TYU_ADDR     0x02800358
+#define I2C_COREPLL_TYU_SIZE     0x008
+
+#define I2C_COREPLL_YU_ADDR      0x02800c14
+#define I2C_COREPLL_YU_SIZE      0x00c
+
+#define I2C_SHARED_RES_MAX       3
+
+/*
+ * Note that the following SMBus, CAUSE, GPIO and PLL register addresses
+ * refer to their respective offsets relative to the corresponding
+ * memory-mapped region whose addresses are specified in either the DT or
+ * the ACPI tables or above.
+ */
+
+/*
+ * Configuration for PLL:
+ */
+
+/*
+ * SMBus Master core clock frequency. Timing configurations are
+ * strongly dependent on the core clock frequency of the SMBus
+ * Master. Default value is set to 400MHz.
+ */
+#define BLUEFIELD_TYU_PLL_OUT_FREQ  (400 * 1000 * 1000)
+/* Reference clock for Bluefield 1 - 156 MHz */
+#define BLUEFIELD_TYU_PLL_IN_FREQ   (156 * 1000 * 1000)
+/* Reference clock for BlueField 2 - 200 MHz */
+#define BLUEFIELD_YU_PLL_IN_FREQ    (200 * 1000 * 1000)
+
+/* PLL registers */
+#define I2C_CORE_PLL_REG0		0x0
+#define I2C_CORE_PLL_REG1		0x4
+#define I2C_CORE_PLL_REG2		0x8
+
+/*
+ * Configuration for cause:
+ */
+
+/* OR cause register */
+#define I2C_CAUSE_OR_EVTEN2_BITS    0x0c
+#define I2C_CAUSE_OR_EVTEN1_BITS    0x10
+#define I2C_CAUSE_OR_EVTEN0_BITS    0x14
+#define I2C_CAUSE_OR_CLEAR_BITS     0x18
+
+/* Arbiter Cause Register */
+#define I2C_CAUSE_ARBITER_BITS      0x1c
+
+/*
+ * Cause Status flags. Note that those bits might be considered
+ * as interrupt enabled bits.
+ */
+#define CAUSE_TRANSACTION_ENDED     0x001 /* Transaction ended with STOP */
+#define CAUSE_M_ARBITRATION_LOST    0x002 /* Master arbitration lost */
+#define CAUSE_UNEXPECTED_START      0x004 /* Unexpected start detected */
+#define CAUSE_UNEXPECTED_STOP       0x008 /* Unexpected stop detected */
+#define CAUSE_WAIT_FOR_FW_DATA      0x010 /* Wait for transfer continuation */
+#define CAUSE_PUT_STOP_FAILED       0x020 /* Failed to generate STOP */
+#define CAUSE_PUT_START_FAILED      0x040 /* Failed to generate START */
+#define CAUSE_CLK_TOGGLE_DONE       0x080 /* Clock toggle completed */
+#define CAUSE_M_FW_TIMEOUT          0x100 /* Transfer timeout occurred */
+#define CAUSE_M_GW_BUSY_FALL        0x200 /* Master busy bit reset */
+
+#define CAUSE_MASTER_ARBITER_BITS_MASK     0x000003ff /* 10 bits */
+
+/*
+ * Slave cause status flags. Note that those bits might be considered
+ * as interrupt enabled bits.
+ */
+
+/* Write transaction received successfully */
+#define CAUSE_WRITE_SUCCESS         0x000001
+/* Write transaction terminated due to unexpected token */
+#define CAUSE_WRITE_UNEXPECTED_TOK  0x000002
+/* External master is trying to write more than 128 Bytes */
+#define CAUSE_WRITE_TOO_LONG        0x000004
+/* Read transaction ended successfully with NACK */
+#define CAUSE_READ_SUCCESS_NACK     0x000008
+/* Read transaction ended unexpected with NACK */
+#define CAUSE_READ_UNEXPECTED_NACK  0x000010
+/* Transaction failed due to arbitration lost */
+#define CAUSE_S_ARBITRATION_LOST    0x000080
+/* Read transaction terminated due to unexpected start */
+#define CAUSE_READ_UNEXPECTED_START 0x000100
+/* Read transaction terminated due to unexpected stop */
+#define CAUSE_READ_UNEXPECTED_STOP  0x000200
+/* Read transaction aborted due to stretch timeout */
+#define CAUSE_READ_TIMEOUT          0x000400
+/* Waiting for ACK/NACK */
+#define CAUSE_WAIT_FOR_ACK_NACK     0x001000
+/* Read transaction received, waiting for response */
+#define CAUSE_READ_WAIT_FW_RESPONSE 0x002000
+/* Write transaction aborted due to stretch timeout */
+#define CAUSE_WRITE_TIMEOUT         0x004000
+/* Incorrect slave address at the beginning of read phase */
+#define CAUSE_BAD_SLAVE_ADDRESS     0x008000
+/* SCL is idle while SDA is driven by slave */
+#define CAUSE_SCL_IDLE_SLAVE_SDA    0x010000
+/* Timeout while waiting for response */
+#define CAUSE_S_FW_TIMEOUT          0x020000
+/* Slave busy bit reset */
+#define CAUSE_S_GW_BUSY_FALL        0x040000
+/* Master acked last written byte, need to supply more bytes */
+#define CAUSE_MASTER_EXPECTING_DATA 0x080000
+/* Master nacked byte but didn't generate stop */
+#define CAUSE_NO_STOP_AFTER_NACK    0x100000
+
+#define CAUSE_SLAVE_ARBITER_BITS_MASK     0x001fffff /* 21 bits */
+
+/* Cause Coalesce registers */
+#define I2C_CAUSE_COALESCE_0        0x00
+#define I2C_CAUSE_COALESCE_1        0x04
+#define I2C_CAUSE_COALESCE_2        0x08
+
+#define I2C_CAUSE_TYU_SLAVE_BIT   MLX_I2C_SMBUS_MAX
+#define I2C_CAUSE_YU_SLAVE_BIT    1
+
+/*
+ * Configuration for GPIO:
+ */
+/* Functional enable register */
+#define I2C_GPIO_0_FUNC_EN_0    0x28
+/* Force OE enable register */
+#define I2C_GPIO_0_FORCE_OE_EN  0x30
+/*
+ * Note that Smbus GWs are on GPIOs 30:25. Two pins are used to control
+ * SDA/SCL lines:
+ *
+ *  SMBUS GW0 -> bits[26:25]
+ *  SMBUS GW1 -> bits[28:27]
+ *  SMBUS GW2 -> bits[30:29]
+ */
+#define I2C_GPIO_SMBUS_GW_PINS(num) (25 + ((num) << 1))
+
+/* gw_id can be 0,1 or 2 */
+#define I2C_GPIO_SMBUS_GW_MASK(num) \
+	(0xffffffff & (~(0x3 << I2C_GPIO_SMBUS_GW_PINS(num))))
+
+#define I2C_GPIO_SMBUS_GW_RESET_PINS(num, val) \
+	((val) & I2C_GPIO_SMBUS_GW_MASK((num)))
+
+#define I2C_GPIO_SMBUS_GW_ASSERT_PINS(num, val) \
+	((val) | (0x3 << I2C_GPIO_SMBUS_GW_PINS((num))))
+
+/*
+ * SMBus Timing Parameters:
+ */
+#define SMBUS_TIMER_SCL_LOW_SCL_HIGH    0x00
+#define SMBUS_TIMER_FALL_RISE_SPIKE     0x04
+#define SMBUS_TIMER_THOLD               0x08
+#define SMBUS_TIMER_TSETUP_START_STOP   0x0c
+#define SMBUS_TIMER_TSETUP_DATA         0x10
+#define SMBUS_THIGH_MAX_TBUF            0x14
+#define SMBUS_SCL_LOW_TIMEOUT           0x18
+
+/*
+ * Defines SMBus operating frequency and core clock frequency.
+ * According to ADB files, default values are compliant to 100KHz SMBus
+ * @ 400MHz core clock. The driver should be able to calculate core
+ * frequency based on PLL parameters.
+ */
+#define MLX_I2C_COREPLL_FREQ          BLUEFIELD_TYU_PLL_OUT_FREQ
+
+#define MLX_I2C_TIMING_CONFIG_HZ      100000
+
+/* Core PLL frequency  */
+static u64 corepll_frequency;
+
+/* SMBus SCL clock high period setup */
+enum {
+	SMBUS_SCL_HIGH_100KHZ  = 4810,
+	SMBUS_SCL_HIGH_400KHZ  = 1011,
+	SMBUS_SCL_HIGH_1000KHZ = 600
+};
+
+/*
+ * SMBus Master GW Registers:
+ */
+
+/* SMBus Master GW */
+#define SMBUS_MASTER_GW     0x200
+/* Number of bytes received and sent */
+#define SMBUS_RS_BYTES      0x300
+/* Packet error check (PEC) value */
+#define SMBUS_MASTER_PEC    0x304
+/* Status bits (ACK/NACK/FW Timeout) */
+#define SMBUS_MASTER_STATUS 0x308
+/* Shift left GW data bytes */
+#define SMBUS_READ_SHIFT    0x30c
+/* SMbus Master Finite State Machine */
+#define SMBUS_MASTER_FSM    0x310
+/* Toggle Clock */
+#define SMBUS_MASTER_CLK    0x314
+/* SDA and SCL configuration */
+#define SMBUS_MASTER_CFG    0x318
+/*
+ * When enabled, the master will issue a stop condition in case of
+ * timeout while waiting for FW response.
+ */
+#define SMBUS_EN_FW_TIMEOUT 0x31c
+
+/* SMBus Master GW control bits offset in SMBUS_MASTER_GW[31:3] */
+#define MASTER_LOCK_BIT_OFF         31	/* Lock bit */
+#define MASTER_BUSY_BIT_OFF         30	/* Busy bit */
+#define MASTER_START_BIT_OFF        29	/* Control start */
+#define MASTER_CTL_WRITE_BIT_OFF    28	/* Control write phase */
+#define MASTER_WRITE_BIT_OFF        21	/* Control write bytes */
+#define MASTER_SEND_PEC_BIT_OFF     20	/* Send PEC byte when set to 1 */
+#define MASTER_CTL_READ_BIT_OFF     19	/* Control read phase */
+#define MASTER_PARSE_EXP_BIT_OFF    11	/* Control parse expected bytes */
+#define MASTER_SLV_ADDR_BIT_OFF     12	/* Slave address */
+#define MASTER_READ_BIT_OFF         4	/* Control read bytes */
+#define MASTER_STOP_BIT_OFF         3	/* Control stop */
+
+/* SMBus Master GW Data descriptor */
+#define MASTER_DATA_DESC_ADDR   0x280	/* Address */
+#define MASTER_DATA_DESC_SIZE   0x80	/* Data descriptor size in bytes */
+#define MASTER_CTL_DATA_MAX_SIZE    4	/* Control data size in bytes */
+#define MASTER_DATA_W_OFF \
+	(MASTER_DATA_DESC_ADDR + MASTER_CTL_DATA_MAX_SIZE)
+
+/* Maximum bytes to read/write per SMBus transaction */
+#define MASTER_DATA_R_LENGTH  MASTER_DATA_DESC_SIZE
+#define MASTER_DATA_W_LENGTH (MASTER_DATA_DESC_SIZE - 1)
+
+/* SMBus Master GW Status flags */
+#define SMBUS_STATUS_BYTE_CNT_DONE  0x1 /* All bytes were transmitted */
+#define SMBUS_STATUS_NACK_RCV       0x2 /* NACK received */
+#define SMBUS_STATUS_READ_ERR       0x4 /* Slave's byte count > 128 bytes */
+#define SMBUS_STATUS_FW_TIMEOUT     0x8 /* Timeout occurred */
+
+#define SMBUS_MASTER_STATUS_MASK        0x0000000f /* 4 bits */
+
+#define SMBUS_MASTER_FSM_STOP_MASK      0x80000000
+#define SMBUS_MASTER_FSM_PS_STATE_MASK  0x00008000
+
+/*
+ * SMBus Slave Parameters:
+ */
+
+/* SMBus slave GW */
+#define SMBUS_SLAVE_GW              0x400
+/* Number of bytes received and sent from/to master */
+#define SMBUS_SLAVE_RS_MASTER_BYTES 0x500
+/* Packet error check (PEC) value */
+#define SMBUS_SLAVE_PEC             0x504
+/* Shift left GW data bytes */
+#define SMBUS_SLAVE_READ_SHIFT      0x508
+/* SMbus Slave Finite State Machine (FSM) */
+#define SMBUS_SLAVE_FSM             0x510
+/* SMBus CR Master configuration register */
+#define SMBUS_SLAVE_CRMASTER_CFG    0x524
+/*
+ * When enabled, FSM will return to idle in case of stretch timeout
+ * while waiting for FW response.
+ */
+#define SMBUS_SLAVE_EN_FW_TIMEOUT   0x528
+/*
+ * Should be set when all raised causes handled, and cleared by HW on
+ * every new cause.
+ */
+#define SMBUS_SLAVE_READY           0x52c
+/* SMBus Device Default Address as defined in SMBus spec */
+#define SMBUS_SLAVE_ARP_ADDR        0x530
+/* If set, then the Slave is in middle of ARP transaction */
+#define SMBUS_SLAVE_ARP_STATUS      0x534
+/* Slave cause register */
+#define SMBUS_SLAVE_CAUSE           0x53c
+/* SMBus CR Master FSM */
+#define SMBUS_SLAVE_CRMASTER_FSM    0x540
+/* Slave SDA and SCL output */
+#define SMBUS_SLAVE_CLK_OUTPUT      0x544
+
+/* SMBus Slave GW control bits offset in SMBUS_SLAVE_GW[31:19] */
+#define SLAVE_LOCK_BIT_OFF         31	/* Lock bit                    */
+#define SLAVE_BUSY_BIT_OFF         30	/* Busy bit                    */
+#define SLAVE_WRITE_BIT_OFF        29	/* Control write enable        */
+#define SLAVE_WRITE_BYTES_BIT_OFF  22	/* Number of bytes to write    */
+#define SLAVE_SEND_PEC_BIT_OFF     21	/* Send PEC byte when set to 1 */
+#define SLAVE_NACK_BIT_OFF         20	/* Nack bit                    */
+#define SLAVE_CONT_WRITE_BIT_OFF   19	/* Continue write transaction  */
+
+/* SMBus Slave GW Data descriptor */
+#define SLAVE_DATA_DESC_ADDR   0x480	/* Address */
+#define SLAVE_DATA_DESC_SIZE   0x80	/* Data descriptor size in bytes */
+#define SLAVE_DATA_DESC_SKIP   1 /* Bytes to skip within data descriptor */
+
+/* SMbus Slave configuration registers */
+#define SMBUS_SLAVE_ADDR_CFG        0x514
+#define SMBUS_SLAVE_ADDR_CNT        16
+#define SMBUS_SLAVE_ADDR_EN_BIT     7
+#define SMBUS_SLAVE_ADDR_MASK       0x7f
+
+/*
+ * Timeout is given in microsends. Note also that timeout handling is not
+ * exact.
+ */
+#define SMBUS_TIMEOUT   (300 * 1000) /* 300ms */
+
+/* Encapsulates timing parameters */
+struct mlx_i2c_timings {
+	u16 scl_high;		/* Clock high period    */
+	u16 scl_low;		/* Clock low period     */
+	u8  sda_rise;		/* Data Rise Time       */
+	u8  sda_fall;		/* Data Fall Time       */
+	u8  scl_rise;		/* Clock Rise Time      */
+	u8  scl_fall;		/* Clock Fall Time      */
+	u16 hold_start;		/* Hold time after (REPEATED) START */
+	u16 hold_data;		/* Data hold time       */
+	u16 setup_start;	/* REPEATED START Condition setup time  */
+	u16 setup_stop;		/* STOP Condition setup time            */
+	u16 setup_data;		/* Data setup time      */
+	u16 pad;		/* Padding              */
+	u16 buf;		/* Bus free time between STOP and START */
+	u16 thigh_max;		/* Thigh max            */
+	u32 timeout;		/* Detect clock low timeout */
+};
+
+enum {
+	I2C_F_READ               = 0x01,
+	I2C_F_WRITE              = 0x02,
+	I2C_F_NORESTART          = 0x08,
+	I2C_F_SMBUS_OPERATION    = 0x10,
+	I2C_F_SMBUS_BLOCK        = 0x20,
+	I2C_F_SMBUS_PEC          = 0x40,
+	I2C_F_SMBUS_PROCESS_CALL = 0x80
+};
+
+struct mlx_smbus_operation {
+	u32  flags;
+	u32  length;		/* buffer length in bytes */
+	u8  *buffer;
+};
+
+#define I2C_SMBUS_OPERATION_CNT        3
+
+struct mlx_smbus_request {
+	u8 slave;
+	u8 operation_cnt;
+	struct mlx_smbus_operation operation[I2C_SMBUS_OPERATION_CNT];
+};
+
+struct mlx_i2c_resource {
+	void __iomem *io;
+	struct resource *params;
+	struct mutex *lock;
+	u8 type;
+};
+
+/* List of chip resources that are being accessed by the driver. */
+enum {
+	I2C_SMBUS_RES,
+	I2C_MST_CAUSE_RES,
+	I2C_SLV_CAUSE_RES,
+	I2C_COALESCE_RES,
+	I2C_COREPLL_RES,
+	I2C_GPIO_RES,
+	I2C_END_RES
+};
+
+/*
+ * Helper macro to define an I2C resource parameters.
+ */
+#define MLX_I2C_RES_PARAMS(addr, size, str) \
+	{ \
+		.start = (addr), \
+		.end   = (addr) + (size) - 1, \
+		.name  = (str) \
+	}
+
+static struct resource coalesce_tyu_params = MLX_I2C_RES_PARAMS(
+	I2C_COALESCE_TYU_ADDR, I2C_COALESCE_TYU_SIZE, "COALESCE_MEM");
+static struct resource corepll_tyu_params  = MLX_I2C_RES_PARAMS(
+	I2C_COREPLL_TYU_ADDR,  I2C_COREPLL_TYU_SIZE,  "COREPLL_MEM");
+static struct resource corepll_yu_params   = MLX_I2C_RES_PARAMS(
+	I2C_COREPLL_YU_ADDR,   I2C_COREPLL_YU_SIZE,   "COREPLL_MEM");
+static struct resource gpio_tyu_params     = MLX_I2C_RES_PARAMS(
+	I2C_GPIO_TYU_ADDR,     I2C_GPIO_TYU_SIZE,     "GPIO_MEM");
+
+static DEFINE_MUTEX(coalesce_lock);
+static DEFINE_MUTEX(corepll_lock);
+static DEFINE_MUTEX(gpio_lock);
+
+/* Mellanox BlueField chip type. */
+enum mlx_chip_type {
+	MLX_BLUEFILED1_CHIP,
+	MLX_BLUEFILED2_CHIP
+};
+
+struct mlx_chip_info {
+	enum mlx_chip_type type;
+	/* Chip shared resources that are being used by the I2C controller. */
+	struct mlx_i2c_resource *shared_res[I2C_SHARED_RES_MAX];
+
+	/* Callback to calculate the core PLL frequency. */
+	u64 (*calculate_freq)(struct mlx_i2c_resource *corepll_res);
+};
+
+struct mlx_i2c_priv {
+	struct mlx_chip_info *chip;
+	struct i2c_adapter adap;
+	struct mlx_i2c_resource *smbus;
+	struct mlx_i2c_resource *mst_cause;
+	struct mlx_i2c_resource *slv_cause;
+	struct mlx_i2c_resource *coalesce;
+	u64 frequency; /* Core frequency in Hz */
+	int bus; /* physical bus identifier */
+	struct i2c_client *slave;
+};
+
+static struct mlx_i2c_resource coalesce_res[] = {
+	[MLX_BLUEFILED1_CHIP] = {
+		.params = &coalesce_tyu_params,
+		.lock   = &coalesce_lock,
+		.type   = I2C_COALESCE_RES
+	},
+	{}
+};
+
+static struct mlx_i2c_resource corepll_res[] = {
+	[MLX_BLUEFILED1_CHIP] = {
+		.params = &corepll_tyu_params,
+		.lock   = &corepll_lock,
+		.type   = I2C_COREPLL_RES
+	},
+	[MLX_BLUEFILED2_CHIP] = {
+		.params = &corepll_yu_params,
+		.lock   = &corepll_lock,
+		.type   = I2C_COREPLL_RES,
+	}
+};
+
+static struct mlx_i2c_resource gpio_res[] = {
+	[MLX_BLUEFILED1_CHIP] = {
+		.params = &gpio_tyu_params,
+		.lock   = &gpio_lock,
+		.type   = I2C_GPIO_RES
+	},
+	{}
+};
+
+static u8 i2c_bus_count;
+
+static DEFINE_MUTEX(i2c_bus_lock);
+
+/* Polling frequency in microseconds */
+#define POLL_FREQ_IN_USEC        200
+
+static void smbus_write(void __iomem *io, int reg, u32 val)
+{
+	writel(val, io + reg);
+}
+
+static u32 smbus_read(void __iomem *io, int reg)
+{
+	return readl(io + reg);
+}
+
+/*
+ * This function is used to read data from Master GW Data Descriptor.
+ * Data bytes in the Master GW Data Descriptor are shifted left so the
+ * data starts at the MSB of the descriptor registers as set by the
+ * underlying hardware. TYU_READ_DATA enables byte swapping while
+ * reading data bytes, and MUST be called by the SMBus read routines
+ * to copy data from the 32 * 32-bit HW Data registers a.k.a Master GW
+ * Data Descriptor.
+ */
+static u32 smbus_read_data(void __iomem *io, int reg)
+{
+	return be32_to_cpu(smbus_read(io, reg));
+}
+
+/*
+ * This function is used to write data to the Master GW Data Descriptor.
+ * Data copied to the Master GW Data Descriptor MUST be shifted left so
+ * the data starts at the MSB of the descriptor registers as required by
+ * the underlying hardware. TYU_WRITE_DATA enables byte swapping when
+ * writing data bytes, and MUST be called by the SMBus write routines to
+ * copy data to the 32 * 32-bit HW Data registers a.k.a Master GW Data
+ * Descriptor.
+ */
+static void smbus_write_data(void __iomem *io, int reg, u32 val)
+{
+	smbus_write(io, reg, cpu_to_be32(val));
+}
+
+/*
+ * I2C SMBus operations
+ */
+
+/*
+ * Function to poll a set of bits at a specific address; it checks whether
+ * the bits are equal to zero when eq_zero is set to 'true', and not equal
+ * to zero when eq_zero is set to 'false'.
+ * Note that the timeout is given in microseconds.
+ */
+static u32 mlx_smbus_poll(void __iomem *io, u32 addr, u32 mask,
+			  bool eq_zero, u32  timeout)
+{
+	u32 bits;
+
+	timeout = (timeout / POLL_FREQ_IN_USEC) + 1;
+
+	do {
+		bits = smbus_read(io, addr) & mask;
+		if (eq_zero ? bits == 0 : bits != 0)
+			return eq_zero ? 1 : bits;
+		udelay(POLL_FREQ_IN_USEC);
+	} while (timeout-- != 0);
+
+	return 0;
+}
+
+/*
+ * SW must make sure that the SMBus Master GW is idle before starting
+ * a transaction. Accordingly, this function polls the Master FSM stop
+ * bit; it returns false when the bit is asserted, true if not.
+ */
+static bool mlx_smbus_master_wait_for_idle(struct mlx_i2c_priv *priv)
+{
+	u32 addr    = SMBUS_MASTER_FSM;
+	u32 mask    = SMBUS_MASTER_FSM_STOP_MASK;
+	u32 timeout = SMBUS_TIMEOUT;
+
+	if (mlx_smbus_poll(priv->smbus->io, addr, mask, true, timeout))
+		return true;
+
+	return false;
+}
+
+/*
+ * Poll SMBus master status and return transaction status,
+ * i.e. whether succeeded or failed. I2C and SMBus fault codes
+ * are returned as negative numbers from most calls, with zero
+ * or some positive number indicating a non-fault return.
+ */
+static int mlx_i2c_smbus_check_status(struct mlx_i2c_priv *priv)
+{
+	u32 cause_status_bits;
+	u32 master_status_bits;
+
+	/*
+	 * GW busy bit is raised by the driver and cleared by the HW
+	 * when the transaction is completed. The busy bit is a good
+	 * indicator of transaction status. So poll the busy bit, and
+	 * then read the cause and master status bits to determine if
+	 * errors occurred during the transaction.
+	 */
+	mlx_smbus_poll(priv->smbus->io, SMBUS_MASTER_GW,
+		       1 << MASTER_BUSY_BIT_OFF, true,
+		       SMBUS_TIMEOUT);
+
+	/* Read cause status bits */
+	cause_status_bits =
+		smbus_read(priv->mst_cause->io, I2C_CAUSE_ARBITER_BITS) &
+		CAUSE_MASTER_ARBITER_BITS_MASK;
+
+	/*
+	 * Parse both Cause and Master GW bits, then return transaction status.
+	 */
+
+	master_status_bits  = smbus_read(priv->smbus->io, SMBUS_MASTER_STATUS);
+	master_status_bits &= SMBUS_MASTER_STATUS_MASK;
+
+	/*
+	 * When transaction ended with STOP, all bytes were transmitted,
+	 * and no NACK received, then the transaction ended successfully.
+	 * On the other hand, when the GW is configured with the stop bit
+	 * de-asserted then the SMBus expects the following GW configuration
+	 * for transfer continuation.
+	 */
+	if ((cause_status_bits & CAUSE_WAIT_FOR_FW_DATA) ||
+	    ((cause_status_bits & CAUSE_TRANSACTION_ENDED) &&
+	     (master_status_bits & SMBUS_STATUS_BYTE_CNT_DONE) &&
+	     !(master_status_bits & SMBUS_STATUS_NACK_RCV)))
+		return 0;
+
+	/*
+	 * In case of timeout on GW busy, the ISR will clear busy bit but
+	 * transaction ended bits cause will not be set so the transaction
+	 * fails. Then, we must check Master GW status bits.
+	 */
+	if ((master_status_bits & (SMBUS_STATUS_NACK_RCV |
+				   SMBUS_STATUS_READ_ERR |
+				   SMBUS_STATUS_FW_TIMEOUT)) &&
+	    (cause_status_bits & (CAUSE_TRANSACTION_ENDED |
+				  CAUSE_M_GW_BUSY_FALL)))
+		return -EIO;
+
+	if (cause_status_bits & (CAUSE_M_ARBITRATION_LOST |
+				 CAUSE_UNEXPECTED_START |
+				 CAUSE_UNEXPECTED_STOP  |
+				 CAUSE_PUT_STOP_FAILED  |
+				 CAUSE_PUT_START_FAILED |
+				 CAUSE_CLK_TOGGLE_DONE  |
+				 CAUSE_M_FW_TIMEOUT))
+		return -EAGAIN;
+
+	return  -ETIMEDOUT;
+}
+
+static void mlx_smbus_write_data(struct mlx_i2c_priv *priv,
+				 const u8 *data, u8 length, u32 addr)
+{
+	u32 data32;
+	u8  offset;
+
+	/* Copy data bytes from 4-byte aligned source buffer */
+	for (offset = 0; offset < round_up(length, 4); offset += 4) {
+		data32 = *((u32 *)(data + offset));
+		smbus_write_data(priv->smbus->io, addr + offset, data32);
+	}
+}
+
+static void mlx_smbus_read_data(struct mlx_i2c_priv *priv,
+				u8 *data, u8 length, u32 addr)
+{
+	u32 data32;
+	u8  byte, offset;
+
+	for (offset = 0; offset < (length & ~0x3); offset += 4) {
+		data32 = smbus_read_data(priv->smbus->io, addr + offset);
+		*((u32 *)(data + offset)) = data32;
+	}
+
+	if (!(length & 0x3))
+		return;
+
+	data32 = smbus_read_data(priv->smbus->io, addr + offset);
+
+	for (byte = 0; byte < (length & 0x3); byte++) {
+		data[offset + byte] = data32 & 0xff;
+		data32 >>= 8;
+	}
+}
+
+static int mlx_smbus_enable(struct mlx_i2c_priv *priv, u8 slave,
+			    u8 len, u8 block_en, u8 pec_en, bool read)
+{
+	u32 command;
+
+	/* Set Master GW control word */
+	command  = 0;
+	command |= 0x1   << MASTER_LOCK_BIT_OFF;
+	command |= 0x1   << MASTER_BUSY_BIT_OFF;
+	command |= slave << MASTER_SLV_ADDR_BIT_OFF;
+	command |= 0x1   << MASTER_START_BIT_OFF;
+	command |= 0x1   << MASTER_STOP_BIT_OFF;
+	if (read) {
+		command |= len << MASTER_READ_BIT_OFF;
+		command |= 1   << MASTER_CTL_READ_BIT_OFF;
+	} else {
+		command |= len << MASTER_WRITE_BIT_OFF;
+		command |= 1   << MASTER_CTL_WRITE_BIT_OFF;
+	}
+	command |= block_en << MASTER_PARSE_EXP_BIT_OFF;
+	command |= pec_en   << MASTER_SEND_PEC_BIT_OFF;
+
+	/* Clear status bits  */
+	smbus_write(priv->smbus->io, SMBUS_MASTER_STATUS, 0x0);
+	/* Set the cause data */
+	smbus_write(priv->smbus->io, I2C_CAUSE_OR_CLEAR_BITS, ~0x0);
+	/* Zero PEC byte */
+	smbus_write(priv->smbus->io, SMBUS_MASTER_PEC, 0x0);
+	/* Zero byte count    */
+	smbus_write(priv->smbus->io, SMBUS_RS_BYTES, 0x0);
+
+	/* GW activation */
+	smbus_write(priv->smbus->io, SMBUS_MASTER_GW, command);
+
+	/*
+	 * Poll master status and check status bits. An ACK is sent when
+	 * completing writing data to the bus (Master 'byte_count_done' bit
+	 * is set to 1).
+	 */
+	return mlx_i2c_smbus_check_status(priv);
+}
+
+static int mlx_smbus_start_transaction(struct mlx_i2c_priv *priv,
+				       struct mlx_smbus_request *request)
+{
+	struct mlx_smbus_operation *operation;
+	u8  data_desc[MASTER_DATA_DESC_SIZE] = { 0 };
+	u8  op_idx, data_idx, data_len, write_len, read_len;
+	u8  read_en, write_en, block_en, pec_en;
+	u8  slave, flags, addr;
+	u8 *read_buf;
+	int ret = 0;
+
+	if (request->operation_cnt > I2C_SMBUS_OPERATION_CNT)
+		return -EINVAL;
+
+	read_buf  = NULL;
+	data_idx  = 0;
+	read_en   = write_en = 0;
+	write_len = read_len = 0;
+	block_en  = 0;
+	pec_en    = 0;
+	slave     = request->slave & 0x7f;
+	addr      = slave << 1;
+
+	/* First of all, check whether the HW is idle */
+	if (WARN_ON(!mlx_smbus_master_wait_for_idle(priv)))
+		return -EBUSY;
+
+	/* Set first byte */
+	data_desc[data_idx++] = addr;
+
+	for (op_idx = 0; op_idx < request->operation_cnt; op_idx++) {
+		operation = &request->operation[op_idx];
+		flags     = operation->flags;
+
+		/*
+		 * Note that read and write operations might be handled by a
+		 * single command. If the I2C_F_SMBUS_OPERATION is set then
+		 * write command byte and set the optional SMBus specific bits
+		 * such as block_en and pec_en. These bits MUST be submitted by
+		 * the first operation only.
+		 */
+		if (op_idx == 0 && flags & I2C_F_SMBUS_OPERATION) {
+			block_en = flags & I2C_F_SMBUS_BLOCK;
+			pec_en   = flags & I2C_F_SMBUS_PEC;
+		}
+
+		if (flags & I2C_F_WRITE) {
+			write_en   = 1;
+			write_len += operation->length;
+			memcpy(data_desc + data_idx,
+			       operation->buffer, operation->length);
+			data_idx  += operation->length;
+		}
+		/*
+		 * We assume that read operations are performed only once per
+		 * SMBus transaction. *TBD* protect this statement so it won't
+		 * be executed twice? or return an error if we try to read more
+		 * than once?
+		 */
+		if (flags & I2C_F_READ) {
+			read_en  = 1;
+			/* Subtract 1 as required by HW */
+			read_len = operation->length - 1;
+			read_buf = operation->buffer;
+		}
+	}
+
+	/* Set Master GW data descriptor */
+	data_len = write_len + 1;	/* add one byte of the slave address */
+	/*
+	 * Note that data_len cannot be 0. Indeed, the slave address byte
+	 * must be written to the data registers.
+	 */
+	mlx_smbus_write_data(priv, (const u8 *)data_desc, data_len,
+			     MASTER_DATA_DESC_ADDR);
+
+	if (write_en) {
+		ret = mlx_smbus_enable(priv, slave, write_len, block_en,
+				       pec_en, 0);
+		if (ret != 0)
+			return ret;
+	}
+
+	if (read_en) {
+		/* Write slave address to Master GW data descriptor */
+		mlx_smbus_write_data(priv, (const u8 *)&addr, 1,
+				     MASTER_DATA_DESC_ADDR);
+		ret = mlx_smbus_enable(priv, slave, read_len, block_en,
+				       pec_en, 1);
+		if (ret == 0) {
+			/* Get Master GW data descriptor */
+			mlx_smbus_read_data(priv, data_desc, read_len + 1,
+					    MASTER_DATA_DESC_ADDR);
+
+			/* Get data from Master GW data descriptor */
+			memcpy(read_buf, data_desc, read_len + 1);
+		}
+
+		/*
+		 * After a read operation the SMBus FSM ps (present state)
+		 * needs to be 'manually' reset. This should be removed in
+		 * next tag integration.
+		 */
+		smbus_write(priv->smbus->io, SMBUS_MASTER_FSM,
+			    SMBUS_MASTER_FSM_PS_STATE_MASK);
+	}
+
+	return ret;
+}
+
+/*
+ * I2C SMBus protocols
+ */
+
+static void mlx_smbus_quick_command(struct mlx_smbus_request *request,
+				    u8 read)
+{
+	/*
+	 * QuickWrite:         OperationCount=1,
+	 *                     LengthInBytes=0,   Flags=I2C_F_WRITE
+	 *
+	 * QuickRead:          OperationCount=1,
+	 *                     LengthInBytes=0,   Flags=I2C_F_WRITE
+	 *                                            | I2C_F_READ
+	 */
+	request->operation_cnt = 1;
+
+	request->operation[0].length = 0;
+	request->operation[0].flags  = I2C_F_WRITE;
+	request->operation[0].flags |= (read) ? I2C_F_READ : 0;
+}
+
+static void mlx_smbus_byte_func(struct mlx_smbus_request *request,
+				u8 *data, bool read, bool pec_check)
+{
+	/*
+	 * ReceiveByte:        OperationCount=1,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_READ
+	 * ReceiveByte+PEC:    OperationCount=1,
+	 *                     LengthInBytes=2,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_READ
+	 *                                            | I2C_F_SMBUS_PEC
+	 *
+	 *
+	 * SendByte:           OperationCount=1,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 * SendByte+PEC:       OperationCount=1,
+	 *                     LengthInBytes=2,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 */
+
+	request->operation_cnt = 1;
+
+	request->operation[0].length  = 1;
+	request->operation[0].length += (pec_check);
+
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION;
+	request->operation[0].flags |= (read) ? I2C_F_READ : I2C_F_WRITE;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+
+	request->operation[0].buffer = data;
+}
+
+static void mlx_smbus_data_byte_func(struct mlx_smbus_request *request,
+				     u8 *command,
+				     u8 *data, bool read, bool pec_check)
+{
+	/*
+	 * ReadDataByte:       OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=1,   Flags=I2C_F_READ
+	 * ReadDataByte+PEC:   OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=2,   Flags=I2C_F_READ
+	 *
+	 *
+	 * WriteDataByte:      OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=1,   Flags=I2C_F_WRITE
+	 * WriteDataByte+PEC:  OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=2,   Flags=I2C_F_WRITE
+	 */
+
+	request->operation_cnt = 2;
+
+	request->operation[0].length = 1;
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION | I2C_F_WRITE;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+	request->operation[0].buffer = command;
+
+	request->operation[1].length  = 1;
+	request->operation[1].length += (pec_check);
+	request->operation[1].flags   = (read) ? I2C_F_READ : I2C_F_WRITE;
+	request->operation[1].buffer  = data;
+}
+
+static void mlx_smbus_data_word_func(struct mlx_smbus_request *request,
+				     u8 *command,
+				     u8 *data, bool read, bool pec_check)
+{
+	/*
+	 * ReadDataWord:       OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=2,   Flags=I2C_F_READ
+	 * ReadDataWord+PEC:   OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=3,   Flags=I2C_F_READ
+	 *
+	 *
+	 * WriteDataWord:      OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=2,   Flags=I2C_F_WRITE
+	 * WriteDataWord+PEC:  OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=3,   Flags=I2C_F_WRITE
+	 */
+
+	request->operation_cnt = 2;
+
+	request->operation[0].length = 1;
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION | I2C_F_WRITE;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+	request->operation[0].buffer = command;
+
+	request->operation[1].length  = 2;
+	request->operation[1].length += (pec_check);
+	request->operation[1].flags   = (read) ? I2C_F_READ : I2C_F_WRITE;
+	request->operation[1].buffer  = data;
+}
+
+static void mlx_smbus_i2c_block_func(struct mlx_smbus_request *request,
+				     u8 *command,
+				     u8 *data,
+				     u8 *data_len, bool read, bool pec_check)
+{
+	/*
+	 * ReadBlock:          OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=N,   Flags=I2C_F_READ
+	 * ReadBlock+PEC:      OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=N+1, Flags=I2C_F_READ
+	 *
+	 *
+	 * WriteBlock:         OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=N,   Flags=I2C_F_WRITE
+	 * WriteBlock+PEC:     OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=N+1, Flags=I2C_F_WRITE
+	 */
+
+	request->operation_cnt = 2;
+
+	request->operation[0].length = 1;
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION | I2C_F_WRITE;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+	request->operation[0].buffer = command;
+
+	/*
+	 * As specified in the standard, the max number of bytes to read/write
+	 * per block operation is 32 bytes. In Golan code, the controller can
+	 * read up to 128 bytes and write up to 127 bytes.
+	 */
+	request->operation[1].length =
+	    (((*data_len) + (pec_check)) > I2C_SMBUS_BLOCK_MAX) ?
+	    I2C_SMBUS_BLOCK_MAX : ((*data_len) + (pec_check));
+	request->operation[1].flags  = (read) ? I2C_F_READ : I2C_F_WRITE;
+	/*
+	 * Skip the first data byte, which corresponds to the number of bytes
+	 * to read/write.
+	 */
+	request->operation[1].buffer = data + 1;
+
+	*data_len = request->operation[1].length;
+
+	/* Set the number of byte to read. This will be used by userspace. */
+	if (read)
+		data[0] = *data_len;
+}
+
+static void mlx_smbus_block_func(struct mlx_smbus_request *request,
+				 u8 *command,
+				 u8 *data,
+				 u8 *data_len, bool read, bool pec_check)
+{
+	/*
+	 * ReadBlock:          OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_BLOCK
+	 *                     LengthInBytes=N,   Flags=I2C_F_READ
+	 * ReadBlock+PEC:      OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_BLOCK
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=N+1, Flags=I2C_F_READ
+	 *
+	 *
+	 * WriteBlock:         OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_BLOCK
+	 *                     LengthInBytes=N,   Flags=I2C_F_WRITE
+	 * WriteBlock+PEC:     OperationCount=2,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_BLOCK
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=N+1, Flags=I2C_F_WRITE
+	 */
+
+	request->operation_cnt = 2;
+
+	request->operation[0].length = 1;
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION | I2C_F_WRITE;
+	request->operation[0].flags |= I2C_F_SMBUS_BLOCK;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+	request->operation[0].buffer = command;
+
+	request->operation[1].length =
+	    (((*data_len) + (pec_check)) > I2C_SMBUS_BLOCK_MAX) ?
+	    I2C_SMBUS_BLOCK_MAX : ((*data_len) + (pec_check));
+	request->operation[1].flags  = (read) ? I2C_F_READ : I2C_F_WRITE;
+	request->operation[1].buffer = data + 1;
+
+	*data_len = request->operation[1].length;
+
+	/* Set the number of bytes to read. This will be used by userspace. */
+	if (read)
+		data[0] = *data_len;
+}
+
+static void
+mlx_smbus_process_call_func(struct mlx_smbus_request *request,
+			    u8 *command, u8 *data, bool pec_check)
+{
+	/*
+	 * ProcessCall:        OperationCount=3,
+	 *                     LengthInBytes=2,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                     LengthInBytes=2,   Flags=I2C_F_WRITE
+	 *                     LengthInBytes=2,   Flags=I2C_F_READ
+	 * ProcessCall+PEC:    OperationCount=3,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=2, Flags=I2C_F_WRITE
+	 *                     LengthInBytes=3, Flags=I2C_F_READ
+	 */
+
+	request->operation_cnt = 3;
+
+	request->operation[0].length = 1;
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION | I2C_F_WRITE;
+	request->operation[0].flags |= I2C_F_SMBUS_BLOCK;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+	request->operation[0].buffer = command;
+
+	request->operation[1].length = 2;
+	request->operation[1].flags  = I2C_F_WRITE;
+	request->operation[1].buffer = data;
+
+	request->operation[2].length = 3;
+	request->operation[2].flags  = I2C_F_READ;
+	request->operation[2].buffer = data;
+}
+
+static void
+mlx_smbus_blk_process_call_func(struct mlx_smbus_request *request,
+				u8 *command,
+				u8 *data, u8 *data_len, bool pec_check)
+{
+	/*
+	 * BlkProcessCall:     OperationCount=3,
+	 *                     LengthInBytes=2,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_BLOCK
+	 *                     LengthInBytes=N,   Flags=I2C_F_WRITE
+	 *                     LengthInBytes=N,   Flags=I2C_F_READ
+	 * BlkProcessCall+PEC: OperationCount=3,
+	 *                     LengthInBytes=1,   Flags=I2C_F_SMBUS_OPERATION
+	 *                                            | I2C_F_WRITE
+	 *                                            | I2C_F_SMBUS_BLOCK
+	 *                                            | I2C_F_SMBUS_PEC
+	 *                     LengthInBytes=N,   Flags=I2C_F_WRITE
+	 *                     LengthInBytes=N+1, Flags=I2C_F_READ
+	 */
+
+	u32 length;
+
+	request->operation_cnt = 3;
+
+	request->operation[0].length = 1;
+	request->operation[0].flags  = I2C_F_SMBUS_OPERATION | I2C_F_WRITE;
+	request->operation[0].flags |= I2C_F_SMBUS_BLOCK;
+	request->operation[0].flags |= (pec_check) ? I2C_F_SMBUS_PEC : 0;
+	request->operation[0].buffer = command;
+
+	length = (((*data_len) + (pec_check)) > I2C_SMBUS_BLOCK_MAX) ?
+	    I2C_SMBUS_BLOCK_MAX : ((*data_len) + (pec_check));
+
+	request->operation[1].length = length - (pec_check);
+	request->operation[1].flags  = I2C_F_WRITE;
+	request->operation[1].buffer = data;
+
+	request->operation[2].length = length;
+	request->operation[2].flags  = I2C_F_READ;
+	request->operation[2].buffer = data;
+
+	*data_len = length;	/* including PEC byte */
+}
+
+/*
+ * Initialization functions
+ */
+
+static bool mlx_i2c_has_chip_type(struct mlx_i2c_priv *priv, u8 type)
+{
+	return (priv->chip->type == type);
+}
+
+static
+struct mlx_i2c_resource *mlx_i2c_get_shared_resource(struct mlx_i2c_priv *priv,
+						     u8 type)
+{
+	struct mlx_chip_info *chip = priv->chip;
+	struct mlx_i2c_resource *res;
+	u8 res_idx = 0;
+
+	for (res_idx = 0; res_idx < I2C_SHARED_RES_MAX; res_idx++) {
+		res = chip->shared_res[res_idx];
+		if (res->type == type)
+			return res;
+	}
+
+	return NULL;
+}
+
+static int mlx_i2c_init_resource(struct platform_device *pdev,
+				 struct mlx_i2c_resource **res,
+				 u8 type)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *tmp_res;
+
+	if (!res || *res || type >= I2C_END_RES)
+		return -EINVAL;
+
+	tmp_res = devm_kzalloc(dev, sizeof(struct mlx_i2c_resource),
+			       GFP_KERNEL);
+	if (!tmp_res)
+		return -ENOMEM;
+
+	tmp_res->params = platform_get_resource(pdev, IORESOURCE_MEM, type);
+	if (!tmp_res->params) {
+		devm_kfree(dev, tmp_res);
+		return -EIO;
+	}
+
+	tmp_res->io = devm_ioremap_resource(dev, tmp_res->params);
+	if (IS_ERR(tmp_res->io)) {
+		devm_kfree(dev, tmp_res);
+		return PTR_ERR(tmp_res->io);
+	}
+
+	tmp_res->type = type;
+
+	*res = tmp_res;
+
+	return 0;
+}
+
+static u32 mlx_i2c_get_ticks(struct mlx_i2c_priv *priv, u64 nanoseconds,
+			     bool minimum)
+{
+	u64 frequency;
+	u32 ticks;
+
+	/*
+	 * Compute ticks as follow:
+	 *
+	 *           Ticks
+	 * Time = --------- x 10^9    =>    Ticks = Time x Frequency x 10^-9
+	 *         Frequency
+	 *
+	 */
+
+	frequency = priv->frequency;
+
+	ticks     = (nanoseconds * frequency) / 1000000000;
+	/*
+	 * The number of ticks is rounded down and if minimum is equal to 1
+	 * then add one tick
+	 */
+	if (minimum)
+		ticks += 1;
+
+	return ticks;
+}
+
+static u32 mlx_i2c_set_timer(struct mlx_i2c_priv *priv,
+			     u64  nsec,
+			     bool opt,
+			     u32  mask,
+			     u8   offset)
+{
+	return ((mlx_i2c_get_ticks(priv, nsec, opt) & mask) << offset);
+}
+
+static void mlx_i2c_set_timings(struct mlx_i2c_priv *priv,
+				struct mlx_i2c_timings *timings)
+{
+	u32 timer;
+
+	timer  = mlx_i2c_set_timer(priv, timings->scl_high,
+				   false, 0xffff,  0);
+	timer |= mlx_i2c_set_timer(priv, timings->scl_low,
+				   false, 0xffff, 16);
+	smbus_write(priv->smbus->io, SMBUS_TIMER_SCL_LOW_SCL_HIGH, timer);
+
+	timer  = mlx_i2c_set_timer(priv, timings->sda_rise, false, 0xff,  0);
+	timer |= mlx_i2c_set_timer(priv, timings->sda_fall, false, 0xff,  8);
+	timer |= mlx_i2c_set_timer(priv, timings->scl_rise, false, 0xff, 16);
+	timer |= mlx_i2c_set_timer(priv, timings->scl_fall, false, 0xff, 24);
+	smbus_write(priv->smbus->io, SMBUS_TIMER_FALL_RISE_SPIKE, timer);
+
+	timer  = mlx_i2c_set_timer(priv, timings->hold_start,
+				   true, 0xffff,  0);
+	timer |= mlx_i2c_set_timer(priv, timings->hold_data,
+				   true, 0xffff, 16);
+	smbus_write(priv->smbus->io, SMBUS_TIMER_THOLD, timer);
+
+	timer  = mlx_i2c_set_timer(priv, timings->setup_start,
+				   true, 0xffff,  0);
+	timer |= mlx_i2c_set_timer(priv, timings->setup_stop,
+				   true, 0xffff, 16);
+	smbus_write(priv->smbus->io, SMBUS_TIMER_TSETUP_START_STOP, timer);
+
+	timer = mlx_i2c_set_timer(priv, timings->setup_data, true, 0xffff, 0);
+	smbus_write(priv->smbus->io, SMBUS_TIMER_TSETUP_DATA, timer);
+
+	timer  = mlx_i2c_set_timer(priv, timings->buf,
+				   false, 0xffff,  0);
+	timer |= mlx_i2c_set_timer(priv, timings->thigh_max,
+				   false, 0xffff, 16);
+	smbus_write(priv->smbus->io, SMBUS_THIGH_MAX_TBUF, timer);
+
+	timer = timings->timeout;
+	smbus_write(priv->smbus->io, SMBUS_SCL_LOW_TIMEOUT, timer);
+}
+
+static int mlx_i2c_init_timings(struct platform_device *pdev,
+				struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_timings timings;
+	u32 config_khz;
+	int ret;
+
+	/*
+	 * Smbus Timing initialization
+	 */
+
+	ret = device_property_read_u32(dev, "clock-frequency", &config_khz);
+	if (ret < 0)
+		config_khz = MLX_I2C_TIMING_CONFIG_HZ;
+
+	switch (config_khz) {
+	default:
+		/* Default settings is 100 KHz */
+		pr_warn("Illegal value %d: defaulting to 100 KHz\n",
+			config_khz);
+
+		/* FALLTHROUGH */
+
+	case 100000:
+		timings.scl_high    = SMBUS_SCL_HIGH_100KHZ;
+		timings.scl_low     = 5000;
+		timings.hold_start  = 4000;
+		timings.setup_start = 4800;
+		timings.setup_stop  = 4000;
+		timings.setup_data  = 250;
+		break;
+
+	case 400000:
+		timings.scl_high    = SMBUS_SCL_HIGH_400KHZ;
+		timings.scl_low     = 1300;
+		timings.hold_start  = 600;
+		timings.setup_start = 700;
+		timings.setup_stop  = 600;
+		timings.setup_data  = 100;
+		break;
+
+	case 1000000:
+		timings.scl_high    = SMBUS_SCL_HIGH_1000KHZ;
+		timings.scl_low     = 1300;
+		timings.hold_start  = 600;
+		timings.setup_start = 600;
+		timings.setup_stop  = 600;
+		timings.setup_data  = 100;
+		break;
+	}
+
+	timings.sda_rise  = timings.sda_fall = 50;
+	timings.scl_rise  = timings.scl_fall = 50;
+	timings.hold_data = 300;
+	timings.buf       = 20000;
+	timings.thigh_max = 5000;
+	/*
+	 * Note that the SCL_LOW_TIMEOUT value is not related to the bus
+	 * frequency, it is impacted by the time it takes the driver to
+	 * complete data transmission before transaction abort.
+	 */
+	timings.timeout   = 106500;
+
+	mlx_i2c_set_timings(priv, &timings);
+
+	return 0;
+}
+
+static int mlx_i2c_get_gpio(struct platform_device *pdev,
+			    struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *gpio_res;
+	struct resource	*params;
+	resource_size_t size;
+
+	gpio_res = mlx_i2c_get_shared_resource(priv, I2C_GPIO_RES);
+	if (!gpio_res)
+		return -EPERM;
+
+	/*
+	 * The GPIO region in TYU space is shared among I2C busses.
+	 * This function MUST be serialized to avoid racing when
+	 * claiming the memory region and/or setting up the GPIO.
+	 */
+	lockdep_assert_held(gpio_res->lock);
+
+	/* Check whether the memory map exist */
+	if (gpio_res->io)
+		return 0;
+
+	params = gpio_res->params;
+	size   = resource_size(params);
+
+	if (!devm_request_mem_region(dev, params->start, size, params->name))
+		return -EFAULT;
+
+	gpio_res->io = devm_ioremap_nocache(dev, params->start, size);
+	if (IS_ERR(gpio_res->io)) {
+		devm_release_mem_region(dev, params->start, size);
+		return PTR_ERR(gpio_res->io);
+	}
+
+	return 0;
+}
+
+static int mlx_i2c_release_gpio(struct platform_device *pdev,
+				struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *gpio_res;
+	struct resource	*params;
+
+	gpio_res = mlx_i2c_get_shared_resource(priv, I2C_GPIO_RES);
+
+	mutex_lock(gpio_res->lock);
+
+	if (gpio_res->io) {
+		/* Release the GPIO resource */
+		params = gpio_res->params;
+		devm_iounmap(dev, gpio_res->io);
+		devm_release_mem_region(dev, params->start,
+					resource_size(params));
+	}
+
+	mutex_unlock(gpio_res->lock);
+
+	return 0;
+}
+
+static int mlx_i2c_get_corepll(struct platform_device *pdev,
+			       struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *corepll_res;
+	struct resource *params;
+	resource_size_t size;
+
+	corepll_res = mlx_i2c_get_shared_resource(priv, I2C_COREPLL_RES);
+	if (!corepll_res)
+		return -EPERM;
+
+	/*
+	 * The COREPLL region in TYU space is shared among I2C busses.
+	 * This function MUST be serialized to avoid racing when
+	 * claiming the memory region.
+	 */
+	lockdep_assert_held(corepll_res->lock);
+
+	/* Check whether the memory map exist */
+	if (corepll_res->io)
+		return 0;
+
+	params = corepll_res->params;
+	size   = resource_size(params);
+
+	if (!devm_request_mem_region(dev, params->start, size, params->name))
+		return -EFAULT;
+
+	corepll_res->io = devm_ioremap_nocache(dev, params->start, size);
+	if (IS_ERR(corepll_res->io)) {
+		devm_release_mem_region(dev, params->start, size);
+		return PTR_ERR(corepll_res->io);
+	}
+
+	return 0;
+}
+
+static int mlx_i2c_release_corepll(struct platform_device *pdev,
+				   struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *corepll_res;
+	struct resource *params;
+
+	corepll_res = mlx_i2c_get_shared_resource(priv, I2C_COREPLL_RES);
+
+	mutex_lock(corepll_res->lock);
+
+	if (corepll_res->io) {
+		/* Release the CorePLL resource */
+		params = corepll_res->params;
+		devm_iounmap(dev, corepll_res->io);
+		devm_release_mem_region(dev, params->start,
+					resource_size(params));
+	}
+
+	mutex_unlock(corepll_res->lock);
+
+	return 0;
+}
+
+static int mlx_i2c_init_master(struct platform_device *pdev,
+				struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *gpio_res;
+	u32 config_reg;
+	int ret;
+
+	/* This configuration is only needed for BlueField 1. */
+	if (!mlx_i2c_has_chip_type(priv, MLX_BLUEFILED1_CHIP))
+		return 0;
+
+	gpio_res = mlx_i2c_get_shared_resource(priv, I2C_GPIO_RES);
+	if (!gpio_res)
+		return -EPERM;
+
+	/*
+	 * The GPIO region in TYU space is shared among I2C busses.
+	 * This function MUST be serialized to avoid racing when
+	 * claiming the memory region and/or setting up the GPIO.
+	 */
+
+	mutex_lock(gpio_res->lock);
+
+	ret = mlx_i2c_get_gpio(pdev, priv);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get gpio resource");
+		mutex_unlock(gpio_res->lock);
+		return ret;
+	}
+
+	/*
+	 * Smbus master initialization
+	 */
+
+	/*
+	 * TYU - Configuration for GPIO pins. Those pins must be asserted in
+	 * I2C_GPIO_0_FUNC_EN_0, i.e. GPIO 0 is controlled by HW, and must
+	 * be reset in I2C_GPIO_0_FORCE_OE_EN, i.e. GPIO_OE will be driven
+	 * instead of HW_OE.
+	 * For now, we do not reset the GPIO state when the driver is removed.
+	 * First, it is not necessary to disable the bus since we are using
+	 * the same busses. Then, some busses might be shared among Linux and
+	 * platform firmware; disabling the bus might compromise the system
+	 * functionality.
+	 */
+	config_reg = smbus_read(gpio_res->io, I2C_GPIO_0_FUNC_EN_0);
+	config_reg = I2C_GPIO_SMBUS_GW_ASSERT_PINS(priv->bus, config_reg);
+	smbus_write(gpio_res->io, I2C_GPIO_0_FUNC_EN_0, config_reg);
+
+	config_reg = smbus_read(gpio_res->io, I2C_GPIO_0_FORCE_OE_EN);
+	config_reg = I2C_GPIO_SMBUS_GW_RESET_PINS(priv->bus, config_reg);
+	smbus_write(gpio_res->io, I2C_GPIO_0_FORCE_OE_EN, config_reg);
+
+	mutex_unlock(gpio_res->lock);
+
+	return 0;
+}
+
+static u64 calculate_freq_from_tyu(struct mlx_i2c_resource *corepll_res)
+{
+	u64 core_frequency, pad_frequency;
+	u32 corepll_val;
+	u16 core_f;
+	u8  core_od, core_r;
+
+	pad_frequency = BLUEFIELD_TYU_PLL_IN_FREQ;
+
+	corepll_val  = smbus_read(corepll_res->io, I2C_CORE_PLL_REG1);
+
+	/* Get Core PLL configuration bits */
+	core_f  = (corepll_val >>  3) & 0x1fff; /* 13 bits */
+	core_od = (corepll_val >> 16) & 0x000f; /*  4 bits */
+	core_r  = (corepll_val >> 20) & 0x003f; /*  6 bits */
+
+	/*
+	 * Compute PLL output frequency as follow:
+	 *
+	 *                                       CORE_F + 1
+	 * PLL_OUT_FREQ = PLL_IN_FREQ * ----------------------------
+	 *                              (CORE_R + 1) * (CORE_OD + 1)
+	 *
+	 * Where PLL_OUT_FREQ and PLL_IN_FREQ refer to CoreFrequency
+	 * and PadFrequency, respectively.
+	 */
+	core_frequency  = pad_frequency * (core_f + 1);
+	core_frequency /= ((core_r + 1) * (core_od + 1));
+
+	return core_frequency;
+}
+
+static u64 calculate_freq_from_yu(struct mlx_i2c_resource *corepll_res)
+{
+	u64 corepll_frequency, pad_frequency;
+	u32 corepll_reg1_val, corepll_reg2_val;
+	u32 core_f;
+	u8  core_od, core_r;
+
+	pad_frequency = BLUEFIELD_YU_PLL_IN_FREQ;
+
+	corepll_reg1_val = smbus_read(corepll_res->io, I2C_CORE_PLL_REG1);
+	corepll_reg2_val = smbus_read(corepll_res->io, I2C_CORE_PLL_REG2);
+
+	/* Get Core PLL configuration bits */
+	core_f  =  corepll_reg1_val        & 0x3ffffff; /* 26 bits */
+	core_r  = (corepll_reg1_val >> 26) & 0x000003f; /*  6 bits */
+	core_od = (corepll_reg2_val >>  1) & 0x000000f; /*  4 bits */
+
+	/*
+	 * Compute PLL output frequency as follow:
+	 *
+	 *                                     CORE_F / 16384
+	 * PLL_OUT_FREQ = PLL_IN_FREQ * ----------------------------
+	 *                              (CORE_R + 1) * (CORE_OD + 1)
+	 *
+	 * Where PLL_OUT_FREQ and PLL_IN_FREQ refer to CoreFrequency
+	 * and PadFrequency, respectively.
+	 */
+	corepll_frequency  = (pad_frequency * core_f) / 16384;
+	corepll_frequency /= ((core_r + 1) * (core_od + 1));
+
+	return corepll_frequency;
+}
+
+static int mlx_i2c_calculate_corepll_freq(struct platform_device *pdev,
+					  struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_chip_info *chip = priv->chip;
+	struct mlx_i2c_resource *corepll_res;
+	u64 *freq = &priv->frequency;
+	int ret;
+
+	corepll_res = mlx_i2c_get_shared_resource(priv, I2C_COREPLL_RES);
+	if (!corepll_res)
+		return -EPERM;
+
+	/*
+	 * First, check whether the TYU core Clock frequency is set.
+	 * The TYU core frequency is the same for all I2C busses; when
+	 * the first device gets probed the frequency is determined and
+	 * stored into a globally visible variable. So, first of all,
+	 * check whether the frequency is already set. Here, we assume
+	 * that the frequency is expected to be greater than 0.
+	 */
+	mutex_lock(corepll_res->lock);
+	if (!corepll_frequency) {
+		if (!chip->calculate_freq) {
+			mutex_unlock(corepll_res->lock);
+			return -EPERM;
+		}
+
+		ret = mlx_i2c_get_corepll(pdev, priv);
+		if (ret < 0) {
+			dev_err(dev, "Failed to get corePLL resource");
+			mutex_unlock(corepll_res->lock);
+			return ret;
+		}
+
+		corepll_frequency = chip->calculate_freq(corepll_res);
+	}
+	mutex_unlock(corepll_res->lock);
+
+	*freq = corepll_frequency;
+
+	return 0;
+}
+
+static int mlx_slave_enable(struct mlx_i2c_priv *priv, u8 addr)
+{
+	u8   reg, reg_cnt, byte, addr_tmp, reg_avail, byte_avail;
+	bool exist, avail, disabled;
+	u32  slave_reg, slave_reg_tmp, slave_reg_avail;
+
+	exist    = false;
+	avail    = false;
+	disabled = false;
+
+	if (!priv)
+		return -EPERM;
+
+	reg_cnt = SMBUS_SLAVE_ADDR_CNT >> 2;
+
+	/*
+	 * Read the slave registers. There are 4 * 32-bit slave registers.
+	 * Each slave register can hold up to 4 * 8-bit slave configuration
+	 * (7-bit address, 1 status bit (1 if enabled, 0 if not)).
+	 */
+	for (reg = 0; reg < reg_cnt; reg++) {
+		slave_reg = smbus_read(priv->smbus->io,
+				       SMBUS_SLAVE_ADDR_CFG + (reg * 0x4));
+		/*
+		 * Each register holds 4 slave addresses. So, we have to keep
+		 * the byte order consistent with the value read in order to
+		 * update the register correctly, if needed.
+		 */
+		slave_reg_tmp = slave_reg;
+		for (byte = 0; byte < 4; byte++) {
+			addr_tmp = slave_reg_tmp & 0xff;
+
+			/*
+			 * Mark the first available slave address slot, i.e. its
+			 * enabled bit should be unset. This slot might be used
+			 * later on to register our slave.
+			 */
+			if (!avail &&
+			    !(addr_tmp & (1 << SMBUS_SLAVE_ADDR_EN_BIT))) {
+				avail           = true;
+				reg_avail       = reg;
+				byte_avail      = byte;
+				slave_reg_avail = slave_reg;
+			}
+
+			/*
+			 * Parse slave address bytes and check whether the
+			 * slave address already exists and it's enabled,
+			 * i.e. most significant bit is set.
+			 */
+			if ((addr_tmp & SMBUS_SLAVE_ADDR_MASK) == addr) {
+				if (addr_tmp & (1 << SMBUS_SLAVE_ADDR_EN_BIT))
+					return 0;
+				disabled = true;
+				break;
+			}
+
+			/* Parse next byte */
+			slave_reg_tmp >>= 8;
+		}
+
+		/* Exit the loop if the slave address is found */
+		if (disabled)
+			break;
+	}
+
+	if (!avail && !disabled)
+		return -EINVAL;         /* No room for a new slave address */
+
+	if (avail && !disabled) {
+		reg  = reg_avail;
+		byte = byte_avail;
+		/* Set the slave address */
+		slave_reg_avail &= ~(SMBUS_SLAVE_ADDR_MASK << (byte * 8));
+		slave_reg_avail |= (addr << (byte * 8));
+		slave_reg        = slave_reg_avail;
+	}
+
+	/* Enable the slave address and update the register */
+	slave_reg |= ((1 << SMBUS_SLAVE_ADDR_EN_BIT) << (byte * 8));
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_ADDR_CFG + (reg * 0x4),
+		    slave_reg);
+
+	return 0;
+}
+
+static int mlx_slave_disable(struct mlx_i2c_priv *priv)
+{
+	struct i2c_client *client = priv->slave;
+	u8   addr, addr_tmp, reg, reg_cnt, slave_byte;
+	bool exist;
+	u32  slave_reg, slave_reg_tmp;
+
+	exist = false;
+
+	addr    = client->addr;
+	reg_cnt = SMBUS_SLAVE_ADDR_CNT >> 2;
+
+	/*
+	 * Read the slave registers. There are 4 * 32-bit slave registers.
+	 * Each slave register can hold up to 4 * 8-bit slave configuration
+	 * (7-bit address, 1 status bit (1 if enabled, 0 if not)).
+	 */
+	for (reg = 0; reg < reg_cnt; reg++) {
+		slave_reg = smbus_read(priv->smbus->io,
+				       SMBUS_SLAVE_ADDR_CFG + (reg * 0x4));
+
+		/* Check whether the address slots are empty */
+		if (slave_reg == 0)
+			continue;
+
+		/*
+		 * Each register holds 4 slave addresses. So, we have to keep
+		 * the byte order consistent with the value read in order to
+		 * update the register correctly, if needed.
+		 */
+		slave_reg_tmp = slave_reg;
+		slave_byte    = 0;
+		while (slave_reg_tmp != 0) {
+			addr_tmp = slave_reg_tmp & SMBUS_SLAVE_ADDR_MASK;
+			/*
+			 * Parse slave address bytes and check whether the
+			 * slave address already exists.
+			 */
+			if (addr_tmp == addr) {
+				exist = true;
+				break;
+			}
+
+			/* Parse next byte */
+			slave_reg_tmp >>= 8;
+			slave_byte     += 1;
+		}
+
+		/* Exit the loop if the slave address is found */
+		if (exist)
+			break;
+	}
+
+	if (!exist)
+		return 0;	/* slave is not registered, nothing to do */
+
+	/* Cleanup the slave address slot. */
+	slave_reg &= ~(0xFF << (slave_byte * 8));
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_ADDR_CFG + (reg * 0x4),
+		    slave_reg);
+
+	return 0;
+}
+
+static int mlx_i2c_init_coalesce(struct platform_device *pdev,
+				 struct mlx_i2c_priv *priv)
+{
+	struct mlx_i2c_resource *coalesce_res;
+	struct resource *params;
+	resource_size_t size;
+	int ret = 0;
+
+	/*
+	 * Unlike BlueField-1 platform, the coalesce registers is expected
+	 * as a dedicated resource in the next generations of BlueField.
+	 */
+	if (mlx_i2c_has_chip_type(priv, MLX_BLUEFILED1_CHIP)) {
+		coalesce_res =
+			mlx_i2c_get_shared_resource(priv, I2C_COALESCE_RES);
+		if (!coalesce_res)
+			return -EPERM;
+
+		/*
+		 * The Cause Coalesce group in TYU space is shared among
+		 * I2C busses. This function MUST be serialized to avoid
+		 * racing when claiming the memory region.
+		 */
+		lockdep_assert_held(gpio_res->lock);
+
+		/* Check whether the memory map exist */
+		if (coalesce_res->io)
+			return 0;
+
+		params = coalesce_res->params;
+		size   = resource_size(params);
+
+		if (!request_mem_region(params->start, size, params->name))
+			return -EFAULT;
+
+		coalesce_res->io = ioremap_nocache(params->start, size);
+		if (IS_ERR(coalesce_res->io)) {
+			release_mem_region(params->start, size);
+			return PTR_ERR(coalesce_res->io);
+		}
+
+		priv->coalesce = coalesce_res;
+
+	} else {
+		ret = mlx_i2c_init_resource(pdev, &priv->coalesce,
+					    I2C_COALESCE_RES);
+	}
+
+	return ret;
+}
+
+static int mlx_i2c_release_coalesce(struct platform_device *pdev,
+				    struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	struct mlx_i2c_resource *coalesce_res;
+	struct resource *params;
+	resource_size_t size;
+
+	coalesce_res = priv->coalesce;
+
+	if (coalesce_res->io) {
+		params = coalesce_res->params;
+		size   = resource_size(params);
+		if (mlx_i2c_has_chip_type(priv, MLX_BLUEFILED1_CHIP)) {
+			mutex_lock(coalesce_res->lock);
+			iounmap(coalesce_res->io);
+			release_mem_region(params->start, size);
+			mutex_unlock(coalesce_res->lock);
+		} else {
+			devm_release_mem_region(dev, params->start, size);
+		}
+	}
+
+	return 0;
+}
+
+static int mlx_i2c_init_slave(struct platform_device *pdev,
+			      struct mlx_i2c_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	u32 int_reg;
+	int ret;
+
+	/*
+	 * Smbus slave initialization
+	 */
+
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_FSM, 0); /* reset FSM */
+
+	/*
+	 * Enable slave cause interrupt bits. Drive CAUSE_READ_WAIT_FW_RESPONSE
+	 * and CAUSE_WRITE_SUCCESS, these are enabled when an external masters
+	 * issue a Read and Write, respectively. But, clear all interrupts
+	 * first.
+	 */
+	smbus_write(priv->slv_cause->io, I2C_CAUSE_OR_CLEAR_BITS, ~0);
+	int_reg = CAUSE_READ_WAIT_FW_RESPONSE | CAUSE_WRITE_SUCCESS;
+	smbus_write(priv->slv_cause->io, I2C_CAUSE_OR_EVTEN0_BITS, int_reg);
+
+	/* Finally, set the 'ready' bit to start handling transactions */
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_READY, 0x1);
+
+	/* Initialize the cause coalesce resource */
+	ret = mlx_i2c_init_coalesce(pdev, priv);
+	if (ret < 0) {
+		dev_err(dev, "failed to initialize cause coalesce\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static bool mlnx_i2c_has_coalesce(struct mlx_i2c_priv *priv, bool *read,
+				  bool *write)
+{
+	struct mlx_chip_info *chip = priv->chip;
+	u32 coalesce0_reg, cause_reg;
+	u8  slave_shift, is_set;
+
+	*read  = *write = false;
+
+	slave_shift = (chip != MLX_BLUEFILED1_CHIP) ? I2C_CAUSE_YU_SLAVE_BIT :
+		(priv->bus + I2C_CAUSE_TYU_SLAVE_BIT);
+
+	coalesce0_reg =	smbus_read(priv->coalesce->io, I2C_CAUSE_COALESCE_0);
+	is_set = coalesce0_reg & (1 << slave_shift);
+
+	if (!is_set)
+		return false;
+
+	/* Check the source of the interrupt, i.e. whether a Read or Write */
+	cause_reg = smbus_read(priv->slv_cause->io, I2C_CAUSE_ARBITER_BITS);
+	if (cause_reg & CAUSE_READ_WAIT_FW_RESPONSE)
+		*read = true;
+	else if (cause_reg & CAUSE_WRITE_SUCCESS)
+		*write = true;
+
+	/* Clear cause bits */
+	smbus_write(priv->slv_cause->io, I2C_CAUSE_OR_CLEAR_BITS, ~0x0);
+
+	return true;
+}
+
+static bool mlx_smbus_slave_wait_for_idle(struct mlx_i2c_priv *priv,
+					  u32 timeout)
+{
+	u32 addr = I2C_CAUSE_ARBITER_BITS;
+	u32 mask = CAUSE_S_GW_BUSY_FALL;
+
+	if (mlx_smbus_poll(priv->slv_cause->io, addr, mask, false, timeout))
+		return true;
+
+	return false;
+}
+
+/* Send byte to 'external' smbus master */
+static int mlx_smbus_irq_send(struct mlx_i2c_priv *priv, u8 recv_bytes)
+{
+	struct i2c_client *slave = priv->slave;
+	u8   data_desc[SLAVE_DATA_DESC_SIZE] = { 0 };
+	u32  control32, data32;
+	u8   write_size, pec_en, addr, byte, value, byte_cnt;
+	int  ret;
+
+	if (!slave)
+		return -EINVAL;
+
+	addr = byte = 0;
+
+	/*
+	 * Read bytes received from the external master. These bytes should
+	 * be located in the first data descriptor register of the slave GW.
+	 * These bytes are the slave address byte and the internal register
+	 * address, if supplied.
+	 */
+	if (recv_bytes > 0) {
+		data32 = smbus_read_data(priv->smbus->io, SLAVE_DATA_DESC_ADDR);
+
+		/* Parse the received bytes */
+		switch (recv_bytes) {
+		case 2:
+			byte = (data32 >> 8) & 0xff;
+			/* fall-through */
+		case 1:
+			addr = (data32 & 0xff) >> 1;
+		}
+
+		/* Check whether it's our slave address. */
+		if (slave->addr != addr)
+			return -EINVAL;
+	}
+
+	/*
+	 * I2C read transactions may start by a WRITE followed by a READ.
+	 * Indeed, most slave devices would expect the internal address
+	 * following the slave address byte. So, write that byte first,
+	 * and then, send the requested data bytes to the master.
+	 */
+	if (recv_bytes > 1) {
+		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		value = byte;
+		ret   = i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED,
+					&value);
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * Now, send data to the master; currently, the driver supports
+	 * READ_BYTE, READ_WORD and BLOCK READ protocols. Note that the
+	 * hardware can send up to 128 bytes per transfer. That is the
+	 * size of its data registers.
+	 */
+	i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
+	for (byte_cnt = 0; byte_cnt < SLAVE_DATA_DESC_SIZE; byte_cnt++) {
+		data_desc[byte_cnt] = value;
+		i2c_slave_event(slave, I2C_SLAVE_READ_PROCESSED, &value);
+	}
+
+	/* Send a stop condition to the backend. */
+	i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+
+	/*
+	 * Handle the actual transfer.
+	 */
+
+	/* Set the number of bytes to write to master */
+	write_size = (byte_cnt - 1) & 0x7f;
+
+	/* Write data to Slave GW data descriptor */
+	mlx_smbus_write_data(priv, data_desc, byte_cnt, SLAVE_DATA_DESC_ADDR);
+
+	pec_en = 0; /* Disable PEC since it is not supported */
+
+	/* Prepare control word */
+	control32  = 0;
+	control32 |= 0          << SLAVE_LOCK_BIT_OFF;
+	control32 |= 1          << SLAVE_BUSY_BIT_OFF;
+	control32 |= 1          << SLAVE_WRITE_BIT_OFF;
+	control32 |= write_size << SLAVE_WRITE_BYTES_BIT_OFF;
+	control32 |= pec_en     << SLAVE_SEND_PEC_BIT_OFF;
+
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_GW, control32);
+
+	/*
+	 * Wait until the transfer is completed; the driver will wait
+	 * until the GW is idle, a cause will rise on fall of GW busy.
+	 */
+	mlx_smbus_slave_wait_for_idle(priv, SMBUS_TIMEOUT);
+
+	/* Release the Slave GW */
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_RS_MASTER_BYTES, 0x0);
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_PEC,             0x0);
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_READY,           0x1);
+
+	return 0;
+}
+
+/* Receive bytes from 'external' smbus master */
+static int mlx_smbus_irq_recv(struct mlx_i2c_priv *priv, u8 recv_bytes)
+{
+	struct i2c_client *slave = priv->slave;
+	u8   data_desc[SLAVE_DATA_DESC_SIZE] = { 0 };
+	u8   value, byte, addr;
+	int  ret = 0;
+
+	if (!slave)
+		return -EINVAL;
+
+	/* Read data from Slave GW data descriptor */
+	mlx_smbus_read_data(priv, data_desc, recv_bytes, SLAVE_DATA_DESC_ADDR);
+
+	/* Check whether its our slave address */
+	addr = data_desc[0] >> 1;
+	if (slave->addr != addr)
+		return -EINVAL;
+
+	/*
+	 * Notify the slave backend; another I2C master wants to write data
+	 * to us. This event is sent once the slave address and the write bit
+	 * is detected.
+	 */
+	i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+	/* Send the received data to the slave backend */
+	for (byte = 1; byte < recv_bytes; byte++) {
+		value = data_desc[byte];
+		ret   = i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED,
+					&value);
+		if (ret < 0)
+			break;
+	}
+
+	/* Send a stop condition to the backend */
+	i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+
+	/* Release the Slave GW */
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_RS_MASTER_BYTES, 0x0);
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_PEC,             0x0);
+	smbus_write(priv->smbus->io, SMBUS_SLAVE_READY,           0x1);
+
+	return ret;
+}
+
+static irqreturn_t mlx_smbus_irq(int irq, void *ptr)
+{
+	struct mlx_i2c_priv *priv = ptr;
+	bool read, write, irq_is_set;
+	u32  rw_bytes_reg;
+	u8   recv_bytes;
+
+	/*
+	 * Read TYU interrupt register and determine the source of the
+	 * interrupt. Based on the source of the interrupt one of the
+	 * following actions are performed:
+	 *  - Receive data and send response to master.
+	 *  - Send data and release slave GW.
+	 *
+	 * Handle read/write transaction only. CRmaster and Iarp requests
+	 * are ignored for now.
+	 */
+	irq_is_set = mlnx_i2c_has_coalesce(priv, &read, &write);
+	if (!irq_is_set || (!read && !write)) {
+		/* Nothing to do here, interrupt was not from this device */
+		return IRQ_NONE;
+	}
+
+	/*
+	 * The SMBUS_SLAVE_RS_MASTER_BYTES includes the number of bytes
+	 * from/to master. These are defined by 8-bits each. If the lower
+	 * 8 bits are set, then the master expect to read N bytes from the
+	 * slave, if the higher 8 bits are sent then the slave expect N
+	 * bytes from the master.
+	 */
+	rw_bytes_reg = smbus_read(priv->smbus->io, SMBUS_SLAVE_RS_MASTER_BYTES);
+	recv_bytes   = (rw_bytes_reg >> 8) & 0xff;
+
+	/*
+	 * For now, the slave supports 128 bytes transfer. Discard remaining
+	 * data bytes if the master wrote more than SLAVE_DATA_DESC_SIZE, i.e,
+	 * the actual size of the slave data descriptor.
+	 *
+	 * Note that we will never expect to transfer more than 128 bytes; as
+	 * specified in the SMBus standard, block transactions cannot exceed
+	 * 32 bytes.
+	 */
+	recv_bytes = (recv_bytes > SLAVE_DATA_DESC_SIZE) ?
+		SLAVE_DATA_DESC_SIZE : recv_bytes;
+
+	if (read)
+		mlx_smbus_irq_send(priv, recv_bytes);
+
+	if (write)
+		mlx_smbus_irq_recv(priv, recv_bytes);
+
+	return IRQ_HANDLED;
+}
+
+/* Return negative errno on error */
+static s32 mlx_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+			      unsigned short flags, char read_write,
+			      u8 command, int size,
+			      union i2c_smbus_data *data)
+{
+	struct mlx_smbus_request  request = { 0 };
+	struct mlx_i2c_priv      *priv;
+	bool read, pec;
+	u8   byte_cnt;
+
+	request.slave = addr;
+
+	read = (read_write == I2C_SMBUS_READ);
+	pec  = flags & I2C_FUNC_SMBUS_PEC;
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		mlx_smbus_quick_command(&request, read);
+		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		break;
+
+	case I2C_SMBUS_BYTE:
+		mlx_smbus_byte_func(&request, (read) ? &data->byte : &command,
+				    read, pec);
+		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+			(read) ? "read" : "write", addr);
+		break;
+
+	case I2C_SMBUS_BYTE_DATA:
+		mlx_smbus_data_byte_func(&request, &command, &data->byte,
+					 read, pec);
+		dev_dbg(&adap->dev,
+			"smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+			(read) ? "read" : "write", command, addr);
+		break;
+
+	case I2C_SMBUS_WORD_DATA:
+		mlx_smbus_data_word_func(&request, &command,
+					 (u8 *)&data->word, read, pec);
+		dev_dbg(&adap->dev,
+			"smbus %s word data at 0x%02x, slave 0x%02x.\n",
+			(read) ? "read" : "write", command, addr);
+		break;
+
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		byte_cnt = data->block[0];
+		mlx_smbus_i2c_block_func(&request, &command, data->block,
+					 &byte_cnt, read, pec);
+		dev_dbg(&adap->dev,
+		 "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+			(read) ? "read" : "write", byte_cnt, command, addr);
+		break;
+
+	case I2C_SMBUS_BLOCK_DATA:
+		byte_cnt = (read) ? I2C_SMBUS_BLOCK_MAX : data->block[0];
+		mlx_smbus_block_func(&request, &command, data->block,
+				     &byte_cnt, read, pec);
+		dev_dbg(&adap->dev,
+		 "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+			(read) ? "read" : "write", byte_cnt, command, addr);
+		break;
+
+	case I2C_FUNC_SMBUS_PROC_CALL:
+		mlx_smbus_process_call_func(&request, &command,
+					    (u8 *)&data->word, pec);
+		dev_dbg(&adap->dev,
+			"process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+			command, addr);
+		break;
+
+	case I2C_FUNC_SMBUS_BLOCK_PROC_CALL:
+		byte_cnt = data->block[0];
+		mlx_smbus_blk_process_call_func(&request, &command,
+						data->block, &byte_cnt, pec);
+		dev_dbg(&adap->dev,
+			"block process call, wr/rd %d bytes, slave 0x%02x.\n",
+			byte_cnt, addr);
+		break;
+
+	default:
+		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
+			size);
+		return -EOPNOTSUPP;
+	}
+
+	priv = i2c_get_adapdata(adap);
+
+	return mlx_smbus_start_transaction(priv, &request);
+}
+
+static int mlx_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct mlx_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
+	int ret;
+
+	if (priv->slave)
+		return -EBUSY;
+
+	/*
+	 * Do not support ten bit chip address and do not use Packet Error
+	 * Checking (PEC).
+	 */
+	if (slave->flags & (I2C_CLIENT_TEN | I2C_CLIENT_PEC))
+		return -EAFNOSUPPORT;
+
+	ret = mlx_slave_enable(priv, slave->addr);
+	if (ret < 0)
+		return ret;
+
+	priv->slave = slave;
+
+	return 0;
+}
+
+static int mlx_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct mlx_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
+	int ret;
+
+	WARN_ON(!priv->slave);
+
+	/* Unregister slave, i.e. disable the slave address in hardware. */
+	ret = mlx_slave_disable(priv);
+	if (ret < 0)
+		return ret;
+
+	priv->slave = NULL;
+
+	return 0;
+}
+
+static u32 mlx_i2c_functionality(struct i2c_adapter *adap)
+{
+	return MLX_I2C_FUNC_ALL;
+}
+
+static struct mlx_chip_info chip[] = {
+	[MLX_BLUEFILED1_CHIP] = {
+		.type = MLX_BLUEFILED1_CHIP,
+		.shared_res = {
+			[0] = &coalesce_res[MLX_BLUEFILED1_CHIP],
+			[1] = &corepll_res[MLX_BLUEFILED1_CHIP],
+			[2] = &gpio_res[MLX_BLUEFILED1_CHIP]
+		},
+		.calculate_freq = calculate_freq_from_tyu
+	},
+	[MLX_BLUEFILED2_CHIP] = {
+		.type = MLX_BLUEFILED2_CHIP,
+		.shared_res = {
+			[0] = &corepll_res[MLX_BLUEFILED2_CHIP]
+		},
+		.calculate_freq = calculate_freq_from_yu
+	}
+};
+
+static const struct i2c_algorithm mlx_i2c_algo = {
+	.smbus_xfer    = mlx_i2c_smbus_xfer,
+	.functionality = mlx_i2c_functionality,
+	.reg_slave     = mlx_i2c_reg_slave,
+	.unreg_slave   = mlx_i2c_unreg_slave,
+};
+
+static const struct of_device_id mlx_i2c_dt_ids[] = {
+	{
+		.compatible = "mellanox,i2c-mlxbf1",
+		.data       = &chip[MLX_BLUEFILED1_CHIP]
+	},
+	{
+		.compatible = "mellanox,i2c-mlxbf2",
+		.data       = &chip[MLX_BLUEFILED2_CHIP]
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mlx_i2c_dt_ids);
+
+static const struct acpi_device_id mlx_i2c_acpi_ids[] = {
+	{ "MLNXBF03", (kernel_ulong_t)&chip[MLX_BLUEFILED1_CHIP] },
+	{ "MLNXBF23", (kernel_ulong_t)&chip[MLX_BLUEFILED2_CHIP] },
+	{},
+};
+
+MODULE_DEVICE_TABLE(acpi, mlx_i2c_acpi_ids);
+
+static int mlx_i2c_acpi_probe(struct device *dev, struct mlx_i2c_priv *priv)
+{
+	struct acpi_device *adev;
+	const struct acpi_device_id *aid;
+	unsigned long bus_id = 0;
+	const char *uid;
+	int ret;
+
+	if (acpi_disabled)
+		return -ENOENT;
+
+	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return -ENODEV;
+
+	aid = acpi_match_device(mlx_i2c_acpi_ids, dev);
+	if (!aid)
+		return -ENODEV;
+
+	priv->chip = (struct mlx_chip_info *)aid->driver_data;
+
+	uid = acpi_device_uid(adev);
+	if (!uid || !(*uid)) {
+		dev_err(dev, "cannot retrieve _UID\n");
+		return -ENODEV;
+	}
+
+	ret = kstrtoul(uid, 0, &bus_id);
+	if (ret == 0)
+		priv->bus = bus_id;
+
+	return ret;
+}
+
+static int mlx_i2c_of_probe(struct device *dev, struct mlx_i2c_priv *priv)
+{
+	const struct of_device_id *oid;
+	int bus_id = -1;
+
+	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
+		oid = of_match_node(mlx_i2c_dt_ids, dev->of_node);
+		if (!oid)
+			return -ENODEV;
+
+		priv->chip = (struct mlx_chip_info *)oid->data;
+
+		bus_id = of_alias_get_id(dev->of_node, "i2c");
+		if (bus_id >= 0)
+			priv->bus = bus_id;
+	}
+
+	if (WARN(bus_id < 0, "couldn't get bus id"))
+		return bus_id;
+
+	return 0;
+}
+
+static int mlx_i2c_probe(struct platform_device *pdev)
+{
+	struct mlx_i2c_priv *priv;
+	struct i2c_adapter  *adap;
+	struct device       *dev = &pdev->dev;
+	int irq, ret;
+
+	priv = devm_kzalloc(dev, sizeof(struct mlx_i2c_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = mlx_i2c_acpi_probe(dev, priv);
+	if (ret < 0)
+		ret = mlx_i2c_of_probe(dev, priv);
+
+	if (ret < 0)
+		return ret;
+
+	/* Smbus region */
+	ret = mlx_i2c_init_resource(pdev, &priv->smbus,
+				    I2C_SMBUS_RES);
+	if (ret < 0) {
+		dev_err(dev, "Cannot fetch smbus resource info");
+		return ret;
+	}
+
+	/* Smbus master cause region */
+	ret = mlx_i2c_init_resource(pdev, &priv->mst_cause,
+				    I2C_MST_CAUSE_RES);
+	if (ret < 0) {
+		dev_err(dev, "Cannot fetch cause master resource info");
+		return ret;
+	}
+
+	/* Smbus slave cause region */
+	ret = mlx_i2c_init_resource(pdev, &priv->slv_cause,
+				    I2C_SLV_CAUSE_RES);
+	if (ret < 0) {
+		dev_err(dev, "Cannot fetch cause slave resource info");
+		return ret;
+	}
+
+	adap              = &priv->adap;
+	adap->owner       = THIS_MODULE;
+	adap->class       = I2C_CLASS_HWMON;
+	adap->algo        = &mlx_i2c_algo;
+	adap->dev.parent  = dev;
+	adap->dev.of_node = dev->of_node;
+	adap->nr          = priv->bus;
+
+	snprintf(adap->name, sizeof(adap->name), "i2c%d", adap->nr);
+	i2c_set_adapdata(adap, priv);
+
+	/* Read Core PLL frequency */
+	ret = mlx_i2c_calculate_corepll_freq(pdev, priv);
+	if (ret < 0) {
+		dev_err(dev, "cannot get core clock frequency\n");
+		/* Set to default value */
+		priv->frequency = MLX_I2C_COREPLL_FREQ;
+	}
+
+	/*
+	 * Initialize master.
+	 * Note that a physical bus might be shared among Linux and firmware
+	 * (e.g., ATF). Thus, the bus should be initialized and ready and
+	 * bus initialization would be unnecessary. This requires additional
+	 * knowledge about physical busses. But, since an extra initialization
+	 * does not really hurt, then keep the code as is.
+	 */
+	ret = mlx_i2c_init_master(pdev, priv);
+	if (ret < 0) {
+		dev_err(dev, "failed to initialize smbus master %d",
+			priv->bus);
+		return ret;
+	}
+
+	/* Configure timing */
+	mlx_i2c_init_timings(pdev, priv);
+
+	/* Initialize slave gw */
+	mlx_i2c_init_slave(pdev, priv);
+
+	irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(dev, irq, mlx_smbus_irq,
+			       IRQF_SHARED | IRQF_PROBE_SHARED,
+			       dev_name(dev), priv);
+	if (ret < 0) {
+		dev_err(dev, "cannot get irq %d\n", irq);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = i2c_add_numbered_adapter(adap);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&i2c_bus_lock);
+	i2c_bus_count++;
+	mutex_unlock(&i2c_bus_lock);
+	dev_info(dev, "probed\n");
+
+	return 0;
+}
+
+static int mlx_i2c_remove(struct platform_device *pdev)
+{
+	struct mlx_i2c_priv *priv = platform_get_drvdata(pdev);
+	struct device       *dev = &pdev->dev;
+	struct resource     *params;
+
+	/* Release the smbus region */
+	params = priv->smbus->params;
+	devm_release_mem_region(dev, params->start, resource_size(params));
+
+	/* Release the cause master region */
+	params = priv->mst_cause->params;
+	devm_release_mem_region(dev, params->start, resource_size(params));
+
+	/* Release the cause slave region */
+	params = priv->slv_cause->params;
+	devm_release_mem_region(dev, params->start, resource_size(params));
+
+	/*
+	 * Release shared resources. This should be done when releasing
+	 * the I2C controller.
+	 */
+	mutex_lock(&i2c_bus_lock);
+	if (--i2c_bus_count == 0) {
+		mlx_i2c_release_coalesce(pdev, priv);
+		mlx_i2c_release_corepll(pdev, priv);
+		mlx_i2c_release_gpio(pdev, priv);
+	}
+	mutex_unlock(&i2c_bus_lock);
+
+	i2c_del_adapter(&priv->adap);
+
+	return 0;
+}
+
+static struct platform_driver mlx_i2c_driver = {
+	.probe  = mlx_i2c_probe,
+	.remove = mlx_i2c_remove,
+	.driver = {
+		   .name = "i2c-mlx",
+		   .of_match_table   = mlx_i2c_dt_ids,
+		   .acpi_match_table = ACPI_PTR(mlx_i2c_acpi_ids),
+		   },
+};
+
+module_platform_driver(mlx_i2c_driver);
+
+MODULE_DESCRIPTION("Mellanox I2C bus driver");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_LICENSE("GPL v2");
-- 
2.1.2

