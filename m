Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE4072F9BD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 11:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbjFNJu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 05:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243511AbjFNJtj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 05:49:39 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E782106
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 02:49:07 -0700 (PDT)
X-ASG-Debug-ID: 1686736140-1eb14e2b4a11ad0001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id CPJu9N48vhMqxOse (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Wed, 14 Jun 2023 17:49:00 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 14 Jun
 2023 17:48:59 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 14 Jun 2023 17:48:58 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To:     <andi.shyti@kernel.org>
CC:     <krzk@kernel.org>, <TonyWWang@zhaoxin.com>, <cobechen@zhaoxin.com>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v6] i2c: add support for Zhaoxin I2C controller
Date:   Wed, 14 Jun 2023 17:48:58 +0800
X-ASG-Orig-Subj: [PATCH v6] i2c: add support for Zhaoxin I2C controller
Message-ID: <20230614094858.317652-1-hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
References: <20230614073433.280501-1-hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1686736140
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 22030
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.110026
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Zhaoxin I2C controller driver. It provides the access to the i2c
busses, which connects to the touchpad, eeprom, etc.

Zhaoxin I2C controller has two separate busses, so may accommodate up
to two I2C adapters. Those adapters are listed in the ACPI namespace
with the "IIC1D17" HID, and probed by a platform driver.

The driver works with IRQ mode, and supports basic I2C features. Flags
I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
the unsupported access.

Change since v5:
  * update some style issue
  * add comment for some code
  Link: https://lore.kernel.org/all/20230614073433.280501-1-hanshu-oc@zhaoxin.com/

Change since v4:
  * delete platform check in probe()
  * move config interface under ACPI in Kconfig file
  * add irq disable when access error
  * fix some trivial issues
  Link: https://lore.kernel.org/all/20230609031625.6928-1-hanshu-oc@zhaoxin.com/

Change since v3:
  * add maintainer for Zhaoxin I2C driver
  * add COMPILE_TEST in Kconfig
  * rename some marco and func with prefix zxi2c & ZXI2C
  * define some params and id as marco
  * remove redundant codes, MODULE_VERSION, .remove, etc.
  * reset fifo only once per access
  * enhance the process that the device is not ready
  * delete prints in zxi2c_probe(), system will prints when it goes wrong
  * fix other trivial issues checkout by coccinelle/sparse/smatch
  Link: https://lore.kernel.org/all/20230602050103.11223-1-hanshu-oc@zhaoxin.com/

Change since v2:
  * fixed some code style issues
  * check if "timeout == 0" first, then check if event $condition is true
  Link: https://lore.kernel.org/all/20230531110058.n7ubjp2kzlx7tuoc@intel.intel/

Change since v1:
  * remove some useless include files and sort the rest.
  * use mmio bar distinguish host index.
  * use pci-dev's name and i2c-dev's name rename adapter's name.
  * remove some debug code, fix some code style issue.
  Link: https://lore.kernel.org/all/20230504060043.13155-1-hanshu-oc@zhaoxin.com/

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 MAINTAINERS                      |   7 +
 drivers/i2c/busses/Kconfig       |  12 +-
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-zhaoxin.c | 599 +++++++++++++++++++++++++++++++
 4 files changed, 618 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f794002a192e..8dab881d5bf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9768,6 +9768,13 @@ L:	linux-i2c@vger.kernel.org
 F:	Documentation/i2c/busses/i2c-ismt.rst
 F:	drivers/i2c/busses/i2c-ismt.c
 
+ZHAOXIN I2C CONTROLLER DRIVER
+M:	Hans Hu <hanshu@zhaoxin.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+W:	https://www.zhaoxin.com
+F:	drivers/i2c/busses/i2c-zhaoxin.c
+
 I2C/SMBUS STUB DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 87600b4aacb3..854a0dcf56a8 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -333,7 +333,7 @@ config I2C_VIAPRO
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-viapro.
 
-if ACPI
+if ACPI || COMPILE_TEST
 
 comment "ACPI drivers"
 
@@ -347,6 +347,16 @@ config I2C_SCMI
 	  To compile this driver as a module, choose M here:
 	  the module will be called i2c-scmi.
 
+config I2C_ZHAOXIN
+	tristate "ZHAOXIN I2C Interface"
+	depends on PCI || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  ZHAOXIN I2C interface
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-zhaoxin.
+
 endif # ACPI
 
 comment "Mac SMBus host controller drivers"
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index af56fe2c75c0..cc470ce470ca 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
+obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
new file mode 100644
index 000000000000..bd5432bec7be
--- /dev/null
+++ b/drivers/i2c/busses/i2c-zhaoxin.c
@@ -0,0 +1,599 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  i2c-zhaoxin-i2c.c - Zhaoxin I2C controller driver
+ *
+ *  Copyright(c) 2023 Shanghai Zhaoxin Semiconductor Corporation.
+ *                    All rights reserved.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+
+#define ZXI2C_NAME              "Zhaoxin-I2C"
+
+/*
+ * registers
+ */
+/* I2C MMIO Address Constants */
+#define ZXI2C_CR_L                     0x00
+#define   ZXI2C_CPU_RDY          BIT(3)
+#define   ZXI2C_TX_END           BIT(2)
+#define   ZXI2C_RX_ACK           BIT(1)
+#define ZXI2C_CR_H                     0x01
+#define   ZXI2C_FIFO_EN          BIT(6)
+#define ZXI2C_SLVADDR                  0x02
+#define ZXI2C_TCR                      0x03
+#define   ZXI2C_FAST_SEL         BIT(7)
+#define   ZXI2C_MASTER_RECV      BIT(6)
+#define   ZXI2C_HS_SEL           BIT(5)
+#define ZXI2C_SR                       0x04
+#define   ZXI2C_SDA_I            BIT(3)
+#define   ZXI2C_SCL_I            BIT(2)
+#define   ZXI2C_READY            BIT(1)
+#define   ZXI2C_RCV_NACK         BIT(0)
+#define ZXI2C_ISR                      0x06
+#define   ZXI2C_STS_BYTENACK     BIT(5)
+#define   ZXI2C_STS_FIFONACK     BIT(4)
+#define   ZXI2C_STS_FIFOEND      BIT(3)
+#define   ZXI2C_SCL_TIMEOUT      BIT(2)
+#define   ZXI2C_STS_BYTEEND      BIT(1)
+#define   ZXI2C_STS_ADDRNACK     BIT(0)
+#define   ZXI2C_STS_MASK         GENMASK(3, 0)
+#define ZXI2C_IMR                      0x08
+#define   ZXI2C_EN_FIFOEND       BIT(3)
+#define   ZXI2C_EN_TIMEOUT       BIT(2)
+#define   ZXI2C_EN_BYTEEND       BIT(1)
+#define   ZXI2C_EN_ADDRNACK      BIT(0)
+#define ZXI2C_M2C                      0x0A
+#define ZXI2C_C2M                      0x0B
+#define ZXI2C_FSTP                     0x0C
+#define ZXI2C_SCLTP                    0x0D
+#define ZXI2C_MCR                      0x0E
+#define   ZXI2C_DYCLK_EN         BIT(0)
+#define ZXI2C_MST_CODE                 0x0F
+#define ZXI2C_CS                       0x10
+#define   ZXI2C_CLKSEL_50M       BIT(0)
+#define ZXI2C_REV                      0x11
+#define ZXI2C_HCR                      0x12
+#define   ZXI2C_FIFO_RST         GENMASK(1, 0)
+#define ZXI2C_HTDR                      0x13
+#define ZXI2C_HRDR                      0x14
+#define ZXI2C_HTLR                      0x15
+#define ZXI2C_HRLR                      0x16
+#define ZXI2C_HWCNTR                    0x18
+#define ZXI2C_HRCNTR                    0x19
+
+#define ZXI2C_HOST0_BAR_OFFSET   0x200
+#define ZXI2C_HOST1_BAR_OFFSET   0x220
+#define ZXI2C_HOST_RST_GEG       0x4F
+#define ZXI2C_HOST0_RST_BITMASK  BIT(5)
+#define ZXI2C_HOST1_RST_BITMASK  BIT(4)
+
+#define ZXI2C_RST_MASK           0xC1
+#define ZXI2C_WR_STP_MASK        0x45
+#define ZXI2C_FIFO_SIZE          32
+#define ZXI2C_TIMEOUT            1000
+#define ZXI2C_GOLDEN_FSTP_100K   0xF3
+#define ZXI2C_GOLDEN_FSTP_400K   0x38
+#define ZXI2C_GOLDEN_FSTP_1M     0x13
+#define ZXI2C_GOLDEN_FSTP_3400K  0x37
+#define ZXI2C_HS_MASTER_CODE     0x08
+
+struct zxi2c {
+	/* controller resources information */
+	struct device *dev;
+	struct pci_dev *pci;
+	struct i2c_adapter adap;
+	void __iomem *regs;
+	int irq;
+	u8 hrv;
+	u32 speed;
+	u8 fstp;		/* freq control by BIOS */
+	u8 reset_bitmask;
+
+	/* process control information */
+	u8 event;
+	u16 byte_left;
+	wait_queue_head_t waitq;
+
+	/* processing msg information */
+	u8 addr;
+	u16 len;
+	bool is_read;
+	bool is_last_msg;
+	u8 dynamic;
+};
+
+#define zxi2c_set_byte(r, d)        iowrite8(d, r + ZXI2C_M2C)
+#define zxi2c_get_byte(r)           ioread8(r + ZXI2C_C2M)
+#define zxi2c_is_ready(r)           (ioread8(r + ZXI2C_SR) & ZXI2C_READY)
+#define zxi2c_is_nack(r)            (ioread8(r + ZXI2C_SR) & ZXI2C_RCV_NACK)
+#define zxi2c_get_irq_status(r)     ioread8(r + ZXI2C_ISR)
+#define zxi2c_get_revison(r)        ioread8(r + ZXI2C_REV)
+#define zxi2c_clear_status(r)       iowrite8(ZXI2C_STS_MASK, r + ZXI2C_ISR)
+#define zxi2c_set_fifo_byte(r, d)   iowrite8(d, r + ZXI2C_HTDR)
+#define zxi2c_get_fifo_byte(r)      ioread8(r + ZXI2C_HRDR)
+#define zxi2c_set_fifo_wr_len(r, d) iowrite8(d, r + ZXI2C_HTLR)
+#define zxi2c_set_fifo_rd_len(r, d) iowrite8(d, r + ZXI2C_HRLR)
+#define zxi2c_get_fifo_wr_cnt(r)    ioread8(r + ZXI2C_HWCNTR)
+#define zxi2c_get_fifo_rd_cnt(r)    ioread8(r + ZXI2C_HRCNTR)
+#define zxi2c_master_reset(r)       iowrite8(ZXI2C_RST_MASK, r + ZXI2C_CR_L)
+#define zxi2c_set_dyn_clk(r, d)     iowrite8(d, r + ZXI2C_MCR)
+#define zxi2c_get_dyn_clk(r)        ioread8(r + ZXI2C_MCR)
+#define zxi2c_stop_wr(r)            iowrite8(ZXI2C_WR_STP_MASK, r + ZXI2C_CR_L)
+#define zxi2c_get_fstp_value(r)     ioread8(r + ZXI2C_FSTP)
+#define zxi2c_en_fifo_mode(r)       iowrite8(ZXI2C_FIFO_EN, r + ZXI2C_CR_H)
+#define zxi2c_en_byte_mode(r)       iowrite8(0, r + ZXI2C_CR_H)
+
+static inline void zxi2c_prepare_next_read(void __iomem *regs, u16 left)
+{
+	u8 tmp = ioread8(regs + ZXI2C_CR_L);
+
+	if (left > 1)
+		tmp &= ~ZXI2C_RX_ACK;
+	else
+		tmp |= ZXI2C_RX_ACK;
+
+	iowrite8(tmp, regs + ZXI2C_CR_L);
+}
+
+static inline void zxi2c_enable_irq(void __iomem *regs, u8 type, int enable)
+{
+	if (enable)
+		iowrite8(ZXI2C_EN_ADDRNACK | type, regs + ZXI2C_IMR);
+	else
+		iowrite8(0, regs + ZXI2C_IMR);
+}
+
+static inline void zxi2c_continue(struct zxi2c *i2c)
+{
+	u8 tmp;
+
+	i2c->event = 0;
+	tmp = ioread8(i2c->regs + ZXI2C_CR_L);
+	iowrite8(tmp |= ZXI2C_CPU_RDY, i2c->regs + ZXI2C_CR_L);
+}
+
+static void zxi2c_reset_fifo(struct zxi2c *i2c)
+{
+	u8 tmp;
+	void __iomem *regs = i2c->regs;
+
+	tmp = ioread8(regs + ZXI2C_HCR);
+	iowrite8(tmp | ZXI2C_FIFO_RST, regs + ZXI2C_HCR);
+	if (ioread8(regs + ZXI2C_HCR) & ZXI2C_FIFO_RST)
+		dev_warn(i2c->dev, "%s failed\n", __func__);
+}
+
+static void zxi2c_set_wr(void __iomem *regs, bool is_read)
+{
+	u8 tmp;
+
+	tmp = ioread8(regs + ZXI2C_TCR);
+	if (is_read)
+		tmp |= ZXI2C_MASTER_RECV;
+	else
+		tmp &= ~ZXI2C_MASTER_RECV;
+	iowrite8(tmp, regs + ZXI2C_TCR);
+}
+
+static void zxi2c_start(struct zxi2c *i2c)
+{
+	i2c->event = 0;
+	iowrite8(i2c->addr & 0x7f, i2c->regs + ZXI2C_SLVADDR);
+}
+
+static const u32 zxi2c_speed_params_table[][3] = {
+	/* speed, ZXI2C_TCR, ZXI2C_FSTP, ZXI2C_CS, ZXI2C_SCLTP */
+	{ I2C_MAX_STANDARD_MODE_FREQ, 0, ZXI2C_GOLDEN_FSTP_100K },
+	{ I2C_MAX_FAST_MODE_FREQ, ZXI2C_FAST_SEL, ZXI2C_GOLDEN_FSTP_400K },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, ZXI2C_FAST_SEL, ZXI2C_GOLDEN_FSTP_1M },
+	{ I2C_MAX_HIGH_SPEED_MODE_FREQ, ZXI2C_HS_SEL, ZXI2C_GOLDEN_FSTP_3400K },
+};
+
+static void zxi2c_set_bus_speed(struct zxi2c *i2c)
+{
+	u8 i, count;
+	const u32 *params = NULL;
+
+	count = ARRAY_SIZE(zxi2c_speed_params_table);
+	for (i = 0; i < count; i++)
+		if (zxi2c_speed_params_table[i][0] == i2c->speed) {
+			params = zxi2c_speed_params_table[i];
+			break;
+		}
+
+	iowrite8(params[1], i2c->regs + ZXI2C_TCR);
+	if (abs(i2c->fstp - params[2]) > 0x10) {
+		/*
+		 * if BIOS setting value far from golden value,
+		 * use golden value and warn user
+		 */
+		dev_warn_once(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
+				i2c->speed, i2c->fstp, params[2]);
+		iowrite8(params[2], i2c->regs + ZXI2C_FSTP);
+	} else {
+		iowrite8(i2c->fstp, i2c->regs + ZXI2C_FSTP);
+	}
+
+	iowrite8(ZXI2C_CLKSEL_50M, i2c->regs + ZXI2C_CS);
+	iowrite8(0xff, i2c->regs + ZXI2C_SCLTP);
+	/* for Hs-mode, use 0000 1000 as master code */
+	if (i2c->speed == I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		iowrite8(ZXI2C_HS_MASTER_CODE, i2c->regs + ZXI2C_MST_CODE);
+}
+
+static void zxi2c_get_bus_speed(struct zxi2c *i2c)
+{
+	u8 i, count;
+	u32 acpi_speed = i2c_acpi_find_bus_speed(i2c->dev);
+
+	count = ARRAY_SIZE(zxi2c_speed_params_table);
+	for (i = 0; i < count; i++)
+		if (acpi_speed == zxi2c_speed_params_table[i][0])
+			break;
+
+	/* if not found, use 400k as default */
+	i2c->speed = i < count ? acpi_speed : I2C_MAX_FAST_MODE_FREQ;
+
+	dev_info(i2c->dev, "speed mode is %s\n",
+			i2c_freq_mode_string(i2c->speed));
+}
+
+static void zxi2c_module_reset(struct zxi2c *i2c)
+{
+	u8 tmp;
+	u8 bitmask = i2c->reset_bitmask;
+
+	pci_read_config_byte(i2c->pci, ZXI2C_HOST_RST_GEG, &tmp);
+	pci_write_config_byte(i2c->pci, ZXI2C_HOST_RST_GEG, tmp & ~bitmask);
+	usleep_range(3000, 5000);
+	pci_write_config_byte(i2c->pci, ZXI2C_HOST_RST_GEG, tmp | bitmask);
+	usleep_range(3000, 5000);
+
+	zxi2c_set_dyn_clk(i2c->regs, i2c->dynamic);
+}
+
+static irqreturn_t zxi2c_irq_handle(int irq, void *dev_id)
+{
+	struct zxi2c *i2c = (struct zxi2c *)dev_id;
+	void __iomem *regs = i2c->regs;
+	u8 status = zxi2c_get_irq_status(regs);
+
+	if ((status & ZXI2C_STS_MASK) == 0)
+		return IRQ_NONE;
+
+	if (status & ZXI2C_SCL_TIMEOUT)
+		dev_warn_ratelimited(i2c->dev, "timeout(HW), ID: 0x%X\n", i2c->addr);
+
+	if (status & ZXI2C_STS_ADDRNACK) {
+		dev_dbg_ratelimited(i2c->dev, "addr NACK, ID: 0x%X\n", i2c->addr);
+	} else if (status & ZXI2C_STS_BYTEEND) {
+		i2c->byte_left--;
+		if (!i2c->is_read) {
+			if (zxi2c_is_nack(regs)) {
+				status = ZXI2C_STS_BYTENACK;
+				i2c->byte_left++;
+				dev_err_ratelimited(i2c->dev, "data NACK, ID: 0x%X\n",
+					i2c->addr);
+			} else if (i2c->byte_left == 0 && i2c->is_last_msg) {
+				zxi2c_stop_wr(regs);
+			}
+		}
+	}
+
+	i2c->event = status;
+	zxi2c_clear_status(regs);
+	wake_up(&i2c->waitq);
+
+	return IRQ_HANDLED;
+}
+
+static int zxi2c_wait_event(struct zxi2c *i2c, u8 event)
+{
+	int timeout;
+
+	timeout = wait_event_interruptible_timeout(i2c->waitq,
+			i2c->event != 0,
+			msecs_to_jiffies(ZXI2C_TIMEOUT));
+
+	if (timeout == 0) {
+		dev_err(i2c->dev, "timeout(SW), ID: 0x%X\n", i2c->addr);
+		/* Clock streching timeout, do recovery */
+		if (!zxi2c_is_nack(i2c->regs))
+			dev_err(i2c->dev, "device hang? reset, ID: 0x%X\n",
+				i2c->addr);
+
+		zxi2c_master_reset(i2c->regs);
+		zxi2c_set_bus_speed(i2c);
+
+		return -EIO;
+	}
+
+	if (i2c->event & event) {
+		if (timeout == 1)
+			dev_warn(i2c->dev, "thread may be blocked\n");
+		return 0;
+	}
+
+	return -EIO;
+}
+
+static int zxi2c_byte_xfer(struct zxi2c *i2c, struct i2c_msg *msgs, int num)
+{
+	u8 index;
+	int ret = 0;
+	void __iomem *regs = i2c->regs;
+
+	zxi2c_en_byte_mode(regs);
+	zxi2c_enable_irq(regs, ZXI2C_EN_BYTEEND, true);
+
+	for (index = 0; index < num; index++) {
+		u16 i;
+		int err = 0;
+		struct i2c_msg *msg;
+
+		msg = msgs + index;
+		i2c->addr = msg->addr;
+		i2c->is_read = !!(msg->flags & I2C_M_RD);
+		i2c->byte_left = i2c->len = msg->len;
+
+		zxi2c_set_wr(regs, i2c->is_read);
+		if (i2c->is_read) {
+			zxi2c_prepare_next_read(regs, i2c->byte_left);
+			zxi2c_start(i2c);
+			/* create restart for non-first msg */
+			if (index)
+				zxi2c_continue(i2c);
+
+			for (i = 0; i < msg->len; i++) {
+				err = zxi2c_wait_event(i2c, ZXI2C_STS_BYTEEND);
+				if (err)
+					break;
+
+				msg->buf[i] = zxi2c_get_byte(regs);
+				if (i2c->byte_left == 0)
+					break;
+
+				zxi2c_prepare_next_read(regs, i2c->byte_left);
+				zxi2c_continue(i2c);
+			}
+		} else {
+			zxi2c_set_byte(regs, msg->buf[0]);
+			/* mark whether this is the last msg */
+			i2c->is_last_msg = index == !!(num - 1);
+			zxi2c_start(i2c);
+			/* create restart for non-first msg */
+			if (index)
+				zxi2c_continue(i2c);
+
+			for (i = 1; i <= msg->len; i++) {
+				err = zxi2c_wait_event(i2c, ZXI2C_STS_BYTEEND);
+				if (err)
+					break;
+
+				if (i2c->byte_left == 0)
+					break;
+				zxi2c_set_byte(regs, msg->buf[i]);
+				zxi2c_continue(i2c);
+			}
+		}
+
+		if (err) {
+			/* check if NACK during transmitting */
+			u16 finished = msg->len - i2c->byte_left;
+
+			if (finished)
+				dev_err(i2c->dev,
+					"%s: %s finished %d bytes: %*ph\n",
+					__func__,
+					i2c->is_read ? "read" : "write",
+					finished, finished, msg->buf);
+			return err;
+		}
+		ret++;
+	}
+
+	return ret;
+}
+
+static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msgs)
+{
+	void __iomem *regs = i2c->regs;
+	struct i2c_msg *msg = msgs;
+	int i;
+	u8 finished;
+	int err;
+
+	i2c->addr = msg->addr;
+	i2c->is_read = !!(msg->flags & I2C_M_RD);
+	i2c->len = msg->len;
+
+	zxi2c_reset_fifo(i2c);
+	zxi2c_en_fifo_mode(regs);
+	zxi2c_enable_irq(regs, ZXI2C_EN_FIFOEND, true);
+
+	zxi2c_set_wr(regs, i2c->is_read);
+	if (i2c->is_read) {
+		zxi2c_set_fifo_rd_len(regs, msg->len - 1);
+	} else {
+		zxi2c_set_fifo_wr_len(regs, msg->len - 1);
+		for (i = 0; i < msg->len; i++)
+			zxi2c_set_fifo_byte(regs, msg->buf[i]);
+	}
+
+	zxi2c_start(i2c);
+	err = zxi2c_wait_event(i2c, ZXI2C_STS_FIFOEND);
+	if (err)
+		return err;
+
+	if (i2c->is_read) {
+		finished = zxi2c_get_fifo_rd_cnt(regs);
+		for (i = 0; i < finished; i++)
+			msg->buf[i] = zxi2c_get_fifo_byte(regs);
+	} else {
+		finished = zxi2c_get_fifo_wr_cnt(regs);
+	}
+
+	/* check if NACK during transmitting */
+	if (finished != msg->len) {
+		if (finished)
+			dev_err(i2c->dev,
+				"%s: %s only finished %d/%d bytes: %*ph\n",
+				__func__, i2c->is_read ? "read" : "write",
+				finished, msg->len, finished, msg->buf);
+		return -EAGAIN;
+	}
+
+	return 1;
+}
+
+static int zxi2c_master_xfer(struct i2c_adapter *adap,
+			     struct i2c_msg *msgs, int num)
+{
+	int err;
+	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
+
+	if (!zxi2c_is_ready(i2c->regs)) {
+		dev_warn(i2c->dev, "controller not ready\n");
+		zxi2c_module_reset(i2c);
+		if (!zxi2c_is_ready(i2c->regs)) {
+			dev_err(i2c->dev, "controller can't reset to ready\n");
+			return -EBUSY;
+		}
+		zxi2c_set_bus_speed(i2c);
+	}
+
+	if (num == 1 && msgs->len <= ZXI2C_FIFO_SIZE && msgs->len >= 3)
+		err = zxi2c_fifo_xfer(i2c, msgs);
+	else
+		err = zxi2c_byte_xfer(i2c, msgs, num);
+
+	/*
+	 * fifo or byte interrupts have been enabled inside the xfer functions.
+	 * To make the code more concise, we put the disable action here
+	 */
+	zxi2c_enable_irq(i2c->regs, ZXI2C_EN_FIFOEND | ZXI2C_EN_BYTEEND, false);
+	return err;
+}
+
+static u32 zxi2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm zxi2c_algorithm = {
+	.master_xfer = zxi2c_master_xfer,
+	.functionality = zxi2c_func,
+};
+
+static const struct i2c_adapter_quirks zxi2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN | I2C_AQ_COMB_WRITE_THEN_READ,
+};
+
+static int zxi2c_parse_resources(struct zxi2c *i2c)
+{
+	struct platform_device *pdev = to_platform_device(i2c->dev);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(i2c->regs))
+		return PTR_ERR(i2c->regs);
+
+	if (res->start & ZXI2C_HOST1_BAR_OFFSET)
+		i2c->reset_bitmask = ZXI2C_HOST1_RST_BITMASK;
+	else if (res->start & ZXI2C_HOST0_BAR_OFFSET)
+		i2c->reset_bitmask = ZXI2C_HOST0_RST_BITMASK;
+	else
+		return dev_err_probe(i2c->dev, -ENODEV,
+				"addr:0x%lx is not expected\n",
+				(unsigned long)res->start);
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return i2c->irq;
+
+	i2c->hrv = zxi2c_get_revison(i2c->regs);
+	i2c->dynamic = zxi2c_get_dyn_clk(i2c->regs);
+
+	i2c->fstp = zxi2c_get_fstp_value(i2c->regs);
+	zxi2c_get_bus_speed(i2c);
+	zxi2c_set_bus_speed(i2c);
+
+	return 0;
+}
+
+static int zxi2c_probe(struct platform_device *pdev)
+{
+	int err = 0;
+	struct zxi2c *i2c;
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->pci = to_pci_dev(pdev->dev.parent);
+	i2c->dev = &pdev->dev;
+	err = zxi2c_parse_resources(i2c);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, (void *)i2c);
+
+	err = devm_request_irq(&pdev->dev, i2c->irq, zxi2c_irq_handle,
+			     IRQF_SHARED, pdev->name, i2c);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				"failure requesting irq %d\n", i2c->irq);
+
+	init_waitqueue_head(&i2c->waitq);
+
+	i2c->adap.owner = THIS_MODULE;
+	i2c->adap.algo = &zxi2c_algorithm;
+	i2c->adap.retries = 2;
+	i2c->adap.quirks = &zxi2c_quirks;
+	i2c->adap.dev.parent = &pdev->dev;
+	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));
+	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s-%s-%s", ZXI2C_NAME,
+		       dev_name(&i2c->pci->dev), dev_name(i2c->dev));
+	i2c_set_adapdata(&i2c->adap, i2c);
+
+	return devm_i2c_add_adapter(&pdev->dev, &i2c->adap);
+}
+
+static int zxi2c_resume(struct device *dev)
+{
+	struct zxi2c *i2c = dev_get_drvdata(dev);
+
+	zxi2c_module_reset(i2c);
+	zxi2c_set_bus_speed(i2c);
+
+	return 0;
+}
+
+static const struct dev_pm_ops zxi2c_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, zxi2c_resume)
+};
+
+static const struct acpi_device_id zxi2c_acpi_match[] = {
+	{ "IIC1D17", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
+
+static struct platform_driver zxi2c_driver = {
+	.probe = zxi2c_probe,
+	.driver = {
+		.name = ZXI2C_NAME,
+		.acpi_match_table = zxi2c_acpi_match,
+		.pm = &zxi2c_pm,
+	},
+};
+module_platform_driver(zxi2c_driver);
+
+MODULE_AUTHOR("HansHu@zhaoxin.com");
+MODULE_DESCRIPTION("Shanghai Zhaoxin IIC driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

