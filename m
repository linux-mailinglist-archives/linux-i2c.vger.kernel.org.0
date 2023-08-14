Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EF977B44B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 10:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbjHNIkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 04:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbjHNIkf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 04:40:35 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2C410F
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 01:40:29 -0700 (PDT)
X-ASG-Debug-ID: 1692002424-1eb14e747d198d0001-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx2.zhaoxin.com with ESMTP id QNUa3PgrGl7aHe0j (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 14 Aug 2023 16:40:24 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 14 Aug
 2023 16:40:24 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 zxbjmbx1.zhaoxin.com (10.29.252.163) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 14 Aug 2023 16:40:23 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From:   Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.163
To:     <andi.shyti@kernel.org>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
Subject: [PATCH v2 2/2] i2c: add support for Zhaoxin I2C controller
Date:   Mon, 14 Aug 2023 16:40:19 +0800
X-ASG-Orig-Subj: [PATCH v2 2/2] i2c: add support for Zhaoxin I2C controller
Message-ID: <4b85bcdfb1d04ccba7988ed7931c33b7531a0a4c.1691999569.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
References: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1692002424
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 13829
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.112729
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add Zhaoxin I2C controller driver. It provides the access to the i2c
busses, which connects to the touchpad, eeprom, etc.

Zhaoxin I2C controller provides two modes of operation:
FIFO mode: works in access requests without restart.
Byte mode: same IP with i2c-wmt and use driver i2c-viai2c-common.

Zhaoxin I2C controller has two separate busses, so may accommodate up
to two I2C adapters. Those adapters are listed in the ACPI namespace
with the "IIC1D17" HID, and probed by a platform driver.

The driver works with IRQ mode, and supports basic I2C features. Flags
I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
the unsupported access.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 MAINTAINERS                            |   7 +
 drivers/i2c/busses/Kconfig             |  11 +
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-viai2c-common.c |  12 +-
 drivers/i2c/busses/i2c-viai2c-common.h |  11 +
 drivers/i2c/busses/i2c-wmt.c           |   2 +
 drivers/i2c/busses/i2c-zhaoxin.c       | 274 +++++++++++++++++++++++++
 7 files changed, 315 insertions(+), 3 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b3648da1c5b2..bb65f7d748eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9864,6 +9864,13 @@ L:	linux-i2c@vger.kernel.org
 F:	Documentation/i2c/busses/i2c-ismt.rst
 F:	drivers/i2c/busses/i2c-ismt.c
 
+I2C/SMBUS ZHAOXIN DRIVER
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
index b810030b21cd..4941093299b2 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -347,6 +347,17 @@ config I2C_SCMI
 	  To compile this driver as a module, choose M here:
 	  the module will be called i2c-scmi.
 
+config I2C_ZHAOXIN
+	tristate "Zhaoxin I2C Interface"
+	depends on PCI || COMPILE_TEST
+	select I2C_VIAI2C_COMMON
+	help
+	  If you say yes to this option, support will be included for the
+	  ZHAOXIN I2C interface
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-zhaoxin.
+
 endif # ACPI
 
 comment "Mac SMBus host controller drivers"
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index b7e20c3531b5..47bfab15b0a1 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
+obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index ffba29ce17c5..9d400ab10c25 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -53,7 +53,8 @@ static int via_i2c_write(struct via_i2c *i2c, struct i2c_msg *pmsg, int last)
 		writew(pmsg->buf[0], base + VIAI2C_CDR);
 	}
 
-	if (!(pmsg->flags & I2C_M_NOSTART)) {
+	if (!(pmsg->flags & I2C_M_NOSTART)
+	   && (i2c->platform & VIAI2C_PLAT_WMT)) {
 		val = readb(base + VIAI2C_CR);
 		val &= ~VIAI2C_CR_TX_END;
 		val |= VIAI2C_CR_CPU_RDY;
@@ -94,8 +95,10 @@ static int via_i2c_write(struct via_i2c *i2c, struct i2c_msg *pmsg, int last)
 		}
 
 		if (xfer_len == pmsg->len) {
-			if (last != 1)
+			if (last != 1 && (i2c->platform & VIAI2C_PLAT_WMT))
 				writeb(VIAI2C_CR_ENABLE, base + VIAI2C_CR);
+			else if (last && (i2c->platform & VIAI2C_PLAT_ZHAOXIN))
+				writeb(VIAI2C_CR_TX_END, base + VIAI2C_CR);
 		} else {
 			writeb(pmsg->buf[xfer_len] & 0xFF, base + VIAI2C_CDR);
 			writeb(VIAI2C_CR_CONTINUE_MASK, base + VIAI2C_CR);
@@ -159,7 +162,8 @@ int via_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	for (i = 0; ret >= 0 && i < num; i++) {
 		struct i2c_msg * pmsg = &msgs[i];
 
-		if (!(pmsg->flags & I2C_M_NOSTART)) {
+		if (!(pmsg->flags & I2C_M_NOSTART)
+		   && (i2c->platform & VIAI2C_PLAT_WMT)) {
 			ret = via_i2c_wait_bus_ready(i2c);
 			if (ret < 0)
 				return ret;
@@ -181,6 +185,8 @@ static irqreturn_t via_i2c_isr(int irq, void *data)
 
 	/* save the status and write-clear it */
 	i2c->event = readw(i2c->base + VIAI2C_ISR);
+	if (!i2c->event)
+		return IRQ_NONE;
 	writew(i2c->event, i2c->base + VIAI2C_ISR);
 
 	complete(&i2c->complete);
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index f3a86f005eb9..c81018b440b2 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -46,6 +46,11 @@
 
 #define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
 
+enum {
+	VIAI2C_PLAT_WMT,
+	VIAI2C_PLAT_ZHAOXIN
+};
+
 struct via_i2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
@@ -55,6 +60,12 @@ struct via_i2c {
 	int			irq;
 	u16			event;
 	u16			tcr;
+	bool			platform;
+	u16			tr;
+	u16			mcr;
+	u16			csr;
+	u8			fstp;
+	u8			hrv;
 };
 
 int via_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index d282f2146fb3..c9c3d27e8331 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -78,6 +78,8 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	i2c_dev->platform = VIAI2C_PLAT_WMT;
+
 	i2c_dev->clk = of_clk_get(np, 0);
 	if (IS_ERR(i2c_dev->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
diff --git a/drivers/i2c/busses/i2c-zhaoxin.c b/drivers/i2c/busses/i2c-zhaoxin.c
new file mode 100644
index 000000000000..73b10af9a7b9
--- /dev/null
+++ b/drivers/i2c/busses/i2c-zhaoxin.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright(c) 2023 Shanghai Zhaoxin Semiconductor Corporation.
+ *                    All rights reserved.
+ */
+
+#include <linux/pci.h>
+#include "i2c-viai2c-common.h"
+
+#define ZXI2C_NAME		"Zhaoxin-I2C"
+
+/*
+ * zhaoxin custom registers and bits
+ */
+/* reg CR Bit fields */
+#define ZXI2C_CR_FIFO_EN		BIT(14)
+/* reg ISR Bit fields */
+#define ZXI2C_ISR_FIFO			BIT(3)
+/* reg IMR Bit fields */
+#define ZXI2C_IMR_FIFO			BIT(3)
+#define ZXI2C_IMR_FIFO_MASK		(BIT(3) | VIAI2C_IMR_ADDRNACK)
+#define ZXI2C_IMR_BYTE_MASK		(BIT(1) | VIAI2C_IMR_ADDRNACK)
+#define ZXI2C_CS		0x10
+#define   ZXI2C_CS_CLK_50M		BIT(0)
+#define ZXI2C_REV		0x11
+#define ZXI2C_HCR		0x12
+#define   ZXI2C_HCR_FIFO_RST		GENMASK(1, 0)
+#define ZXI2C_HTDR		0x13
+#define ZXI2C_HRDR		0x14
+#define ZXI2C_HTLR		0x15
+#define ZXI2C_HRLR		0x16
+#define ZXI2C_HWCNTR		0x18
+#define ZXI2C_HRCNTR		0x19
+
+/* parameters Constants */
+#define ZXI2C_GOLD_FSTP_100K	0xF3
+#define ZXI2C_GOLD_FSTP_400K	0x38
+#define ZXI2C_GOLD_FSTP_1M	0x13
+#define ZXI2C_GOLD_FSTP_3400K	0x37
+#define ZXI2C_HS_MASTER_CODE	(0x08 << 8)
+
+#define ZXI2C_FIFO_SIZE		32
+
+#define zxi2c			via_i2c
+
+static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msg)
+{
+	int err;
+	u16 i, finished;
+	u16 tcr_val = i2c->tcr;
+	void __iomem *base = i2c->base;
+	int read = !!(msg->flags & I2C_M_RD);
+
+	/* reset fifo settings */
+	iowrite8(ZXI2C_HCR_FIFO_RST, base + ZXI2C_HCR);
+	/* select fifo mode */
+	iowrite16(ZXI2C_CR_FIFO_EN, i2c->base + VIAI2C_CR);
+	/* enable fifo interrupt */
+	iowrite8(ZXI2C_IMR_FIFO_MASK, base + VIAI2C_IMR);
+
+	/* sets the transmission length, direction, and the data to be sent */
+	if (read) {
+		tcr_val |= VIAI2C_TCR_READ;
+		iowrite8(msg->len - 1, base + ZXI2C_HRLR);
+	} else {
+
+		iowrite8(msg->len - 1, base + ZXI2C_HTLR);
+		for (i = 0; i < msg->len; i++)
+			iowrite8(msg->buf[i], base + ZXI2C_HTDR);
+	}
+	/* set slave addr */
+	tcr_val |= (msg->addr & VIAI2C_TCR_ADDR_MASK);
+
+	reinit_completion(&i2c->complete);
+
+	/* a write to the TCR triggers the transfer start */
+	iowrite16(tcr_val, i2c->base + VIAI2C_TCR);
+
+	err = via_i2c_wait_event(i2c, ZXI2C_ISR_FIFO);
+	if (err)
+		return err;
+
+	/* Gets the length and data that has been transferred */
+	if (read) {
+		finished = ioread8(base + ZXI2C_HRCNTR);
+		for (i = 0; i < finished; i++)
+			msg->buf[i] = ioread8(base + ZXI2C_HRDR);
+	} else {
+		finished = ioread8(base + ZXI2C_HWCNTR);
+	}
+
+	/* check if data NACK during transmitting */
+	if (finished != msg->len) {
+		dev_err(i2c->dev, "only %s %d/%d bytes\n",
+			read ? "read" : "write", finished, msg->len);
+		return -EAGAIN;
+	}
+
+	return 1;
+}
+
+static int zxi2c_byte_xfer(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num)
+{
+	int err;
+	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
+
+	/* select byte mode */
+	iowrite16(0, i2c->base + VIAI2C_CR);
+	/* enable interrupt */
+	iowrite8(ZXI2C_IMR_BYTE_MASK, i2c->base + VIAI2C_IMR);
+
+	err = via_i2c_xfer(adap, msgs, num);
+	/* kill unfinished transfer signal */
+	if (err < 0)
+		iowrite16(VIAI2C_CR_END_MASK, i2c->base + VIAI2C_CR);
+
+	return err;
+}
+
+static int zxi2c_master_xfer(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num)
+{
+	int err;
+	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
+
+	err = via_i2c_wait_bus_ready(i2c);
+	if (err)
+		return err;
+
+	if (num == 1 && msgs->len <= ZXI2C_FIFO_SIZE && msgs->len >= 2)
+		err = zxi2c_fifo_xfer(i2c, msgs);
+	else
+		err = zxi2c_byte_xfer(adap, msgs, num);
+	/*
+	 * fifo or byte interrupts have been enabled inside the xfer functions.
+	 * To make the code more concise, we put the disable action here
+	 */
+	iowrite8(0, i2c->base + VIAI2C_IMR);
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
+static const u32 zxi2c_speed_params_table[][3] = {
+	/* speed, ZXI2C_TCR, ZXI2C_FSTP */
+	{ I2C_MAX_STANDARD_MODE_FREQ, 0, ZXI2C_GOLD_FSTP_100K },
+	{ I2C_MAX_FAST_MODE_FREQ, VIAI2C_TCR_FAST, ZXI2C_GOLD_FSTP_400K },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, VIAI2C_TCR_FAST, ZXI2C_GOLD_FSTP_1M },
+	{ I2C_MAX_HIGH_SPEED_MODE_FREQ, VIAI2C_TCR_HS_MODE | VIAI2C_TCR_FAST,
+	  ZXI2C_GOLD_FSTP_3400K },
+};
+
+static void zxi2c_set_bus_speed(struct zxi2c *i2c)
+{
+	iowrite16(i2c->tr, i2c->base + VIAI2C_TR);
+	iowrite8(ZXI2C_CS_CLK_50M, i2c->base + ZXI2C_CS);
+	iowrite16(i2c->mcr, i2c->base + VIAI2C_MCR);
+}
+
+static void zxi2c_get_bus_speed(struct zxi2c *i2c)
+{
+	u8 i, count;
+	u8 fstp;
+	const u32 *params;
+	u32 acpi_speed = i2c_acpi_find_bus_speed(i2c->dev);
+
+	count = ARRAY_SIZE(zxi2c_speed_params_table);
+	for (i = 0; i < count; i++)
+		if (acpi_speed == zxi2c_speed_params_table[i][0])
+			break;
+	/* if not found, use 400k as default */
+	i = i < count ? i : 1;
+
+	params = zxi2c_speed_params_table[i];
+	fstp = ioread8(i2c->base + VIAI2C_TR);
+	if (abs(fstp - params[2]) > 0x10) {
+		/*
+		 * if BIOS setting value far from golden value,
+		 * use golden value and warn user
+		 */
+		dev_warn(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
+				params[0], fstp, params[2]);
+		i2c->tr = params[2] | 0xff00;
+	} else {
+		i2c->tr = fstp | 0xff00;
+	}
+
+	i2c->tcr = params[1];
+	i2c->mcr = ioread16(i2c->base + VIAI2C_MCR);
+	/* for Hs-mode, use 0000 1000 as master code */
+	if (params[0] == I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		i2c->mcr |= ZXI2C_HS_MASTER_CODE;
+
+	dev_info(i2c->dev, "speed mode is %s\n",
+			i2c_freq_mode_string(params[0]));
+}
+
+static int zxi2c_probe(struct platform_device *pdev)
+{
+	int err = 0;
+	struct zxi2c *i2c;
+	struct pci_dev *pci;
+
+	err = via_i2c_init(pdev, &i2c);
+	if (err)
+		return err;
+
+	i2c->platform = VIAI2C_PLAT_ZHAOXIN;
+	i2c->hrv = ioread8(i2c->base + ZXI2C_REV);
+	i2c->csr = ioread16(i2c->base + VIAI2C_CSR);
+
+	zxi2c_get_bus_speed(i2c);
+	zxi2c_set_bus_speed(i2c);
+
+	i2c->adapter.owner = THIS_MODULE;
+	i2c->adapter.algo = &zxi2c_algorithm;
+	i2c->adapter.retries = 2;
+	i2c->adapter.quirks = &zxi2c_quirks;
+	i2c->adapter.dev.parent = &pdev->dev;
+	ACPI_COMPANION_SET(&i2c->adapter.dev, ACPI_COMPANION(&pdev->dev));
+	pci = to_pci_dev(pdev->dev.parent);
+	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name), "%s-%s-%s",
+			ZXI2C_NAME, dev_name(&pci->dev), dev_name(i2c->dev));
+	i2c_set_adapdata(&i2c->adapter, i2c);
+
+	return devm_i2c_add_adapter(&pdev->dev, &i2c->adapter);
+}
+
+static int zxi2c_resume(struct device *dev)
+{
+	struct zxi2c *i2c = dev_get_drvdata(dev);
+
+	iowrite16(i2c->csr, i2c->base + VIAI2C_CSR);
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

