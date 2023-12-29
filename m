Return-Path: <linux-i2c+bounces-1065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690B81FD3B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 07:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06361F21842
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 06:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76397749E;
	Fri, 29 Dec 2023 06:30:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC96FC4
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 06:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703831444-086e230f270a520002-PT6Irj
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id RxF53RvuJDMdnjF7 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 29 Dec 2023 14:30:46 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Dec
 2023 14:30:44 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 29 Dec 2023 14:30:43 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v6 8/8] i2c: add zhaoxin i2c controller driver
Date: Fri, 29 Dec 2023 14:30:39 +0800
X-ASG-Orig-Subj: [PATCH v6 8/8] i2c: add zhaoxin i2c controller driver
Message-ID: <a0e5f3ac6b344c5891367f5efe5edee80a7ce958.1703830854.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1703831444
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 14889
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118704
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Add Zhaoxin I2C controller driver. It provides the access to the i2c
busses, which connects to the touchpad, eeprom, I2S, etc.

Zhaoxin I2C controller has two separate busses, so may accommodate up
to two I2C adapters. Those adapters are listed in the ACPI namespace
with the "IIC1D17" HID, and probed by a platform driver.

The driver works with IRQ mode, and supports basic I2C features. Flags
I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
the unsupported access.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 MAINTAINERS                            |   8 +
 drivers/i2c/busses/Kconfig             |  10 +
 drivers/i2c/busses/Makefile            |   2 +
 drivers/i2c/busses/i2c-viai2c-common.c |  21 +-
 drivers/i2c/busses/i2c-viai2c-common.h |   6 +
 drivers/i2c/busses/i2c-zhaoxin-plt.c   | 298 +++++++++++++++++++++++++
 6 files changed, 340 insertions(+), 5 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin-plt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c3005c2c9dd2..aa1a7f314b41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10023,6 +10023,14 @@ L:	linux-i2c@vger.kernel.org
 F:	Documentation/i2c/busses/i2c-ismt.rst
 F:	drivers/i2c/busses/i2c-ismt.c
 
+I2C/SMBUS ZHAOXIN DRIVER
+M:	Hans Hu <hanshu@zhaoxin.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+W:	https://www.zhaoxin.com
+F:	drivers/i2c/busses/i2c-viai2c-common.c
+F:	drivers/i2c/busses/i2c-zhaoxin.c
+
 I2C/SMBUS STUB DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 28eb48dd5b32..6ccc9f858c90 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -336,6 +336,16 @@ config I2C_VIAPRO
 
 if ACPI
 
+config I2C_ZHAOXIN
+	tristate "Zhaoxin I2C Interface"
+	depends on PCI || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  ZHAOXIN I2C interface
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-zhaoxin.
+
 comment "ACPI drivers"
 
 config I2C_SCMI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 2ac59c585c08..1d2d7e9e576e 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,6 +29,8 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
+i2c-zhaoxin-objs := i2c-zhaoxin-plt.o i2c-viai2c-common.o
+obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 930f4c5c1797..5e31c5efd10e 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -5,7 +5,7 @@
 #define VIAI2C_TIMEOUT			(msecs_to_jiffies(1000))
 #define VIAI2C_STRETCHING_TIMEOUT	200
 
-static int viai2c_wait_bus_ready(struct viai2c *i2c)
+int viai2c_wait_bus_ready(struct viai2c *i2c)
 {
 	unsigned long timeout;
 	void __iomem *base = i2c->base;
@@ -23,7 +23,7 @@ static int viai2c_wait_bus_ready(struct viai2c *i2c)
 	return 0;
 }
 
-static int viai2c_wait_status(struct viai2c *i2c)
+int viai2c_wait_status(struct viai2c *i2c)
 {
 	int ret = 0;
 	unsigned long time_left;
@@ -71,6 +71,9 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 
 	/* save the status and write-clear it */
 	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
+	if (!i2c->cmd_status)
+		return IRQ_NONE;
+
 	writew(i2c->cmd_status, i2c->base + VIAI2C_REG_ISR);
 
 	complete(&i2c->complete);
@@ -139,6 +142,8 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 		if (xfer_len == pmsg->len) {
 			if (i2c->platform == VIAI2C_PLAT_WMT && !last)
 				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+			else if (i2c->platform == VIAI2C_PLAT_ZHAOXIN && last)
+				writeb(VIAI2C_CR_TX_END, base + VIAI2C_REG_CR);
 		} else {
 			writew(pmsg->buf[xfer_len] & 0xFF,
 					base + VIAI2C_REG_CDR);
@@ -150,7 +155,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, bool last)
 	return 0;
 }
 
-static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
+static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg, bool first)
 {
 	u16 val, tcr_val = i2c->tcr;
 	int ret;
@@ -175,7 +180,8 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 
 	writew(tcr_val, base + VIAI2C_REG_TCR);
 
-	if (i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) {
+	if ((i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART))
+	   || (i2c->platform == VIAI2C_PLAT_ZHAOXIN && !first)) {
 		val = readw(base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, base + VIAI2C_REG_CR);
@@ -218,7 +224,7 @@ int viai2c_xfer(struct i2c_adapter *adap,
 		}
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = viai2c_read(i2c, pmsg);
+			ret = viai2c_read(i2c, pmsg, i == 0);
 		else
 			ret = viai2c_write(i2c, pmsg, (i + 1) == num);
 	}
@@ -246,6 +252,11 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 		i2c->irq = irq_of_parse_and_map(np, 0);
 		if (!i2c->irq)
 			return -EINVAL;
+	} else if (plat == VIAI2C_PLAT_ZHAOXIN) {
+		irq_flags = IRQF_SHARED;
+		i2c->irq = platform_get_irq(pdev, 0);
+		if (i2c->irq < 0)
+			return i2c->irq;
 	} else
 		return dev_err_probe(&pdev->dev, -EINVAL,
 				"wrong platform type\n");
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index 6d210e562c9a..bcff7026e2b8 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -51,6 +51,7 @@
 
 enum {
 	VIAI2C_PLAT_WMT = 1,
+	VIAI2C_PLAT_ZHAOXIN
 };
 
 struct viai2c {
@@ -65,8 +66,13 @@ struct viai2c {
 	ktime_t			ti;
 	ktime_t			to;
 	int			platform;
+	u8			hrv;
+	u16			tr;
+	u16			mcr;
 };
 
+int viai2c_wait_status(struct viai2c *i2c);
+int viai2c_wait_bus_ready(struct viai2c *i2c);
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
 int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat);
 
diff --git a/drivers/i2c/busses/i2c-zhaoxin-plt.c b/drivers/i2c/busses/i2c-zhaoxin-plt.c
new file mode 100644
index 000000000000..110a575df201
--- /dev/null
+++ b/drivers/i2c/busses/i2c-zhaoxin-plt.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright(c) 2021 Shanghai Zhaoxin Semiconductor Corporation.
+ *                    All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include "i2c-viai2c-common.h"
+
+#define ZX_I2C_NAME             "i2c_zhaoxin"
+
+/*
+ * registers
+ */
+/* Zhaoxin specific register bit fields */
+/* REG_CR Bit fields */
+#define   ZXI2C_CR_MST_RST		BIT(7)
+#define   ZXI2C_CR_FIFO_MODE		BIT(14)
+/* REG_ISR/IMR Bit fields */
+#define   ZXI2C_IRQ_FIFONACK		BIT(4)
+#define   ZXI2C_IRQ_FIFOEND		BIT(3)
+#define   ZXI2C_IRQ_MASK		(VIAI2C_ISR_MASK_ALL \
+					| ZXI2C_IRQ_FIFOEND \
+					| ZXI2C_IRQ_FIFONACK)
+/* Zhaoxin specific registers */
+#define ZXI2C_REG_CLK		0x10
+#define   ZXI2C_CLK_50M			BIT(0)
+#define ZXI2C_REG_REV		0x11
+#define ZXI2C_REG_HCR		0x12
+#define   ZXI2C_HCR_RST_FIFO		GENMASK(1, 0)
+#define ZXI2C_REG_HTDR		0x13
+#define ZXI2C_REG_HRDR		0x14
+#define ZXI2C_REG_HTLR		0x15
+#define ZXI2C_REG_HRLR		0x16
+#define ZXI2C_REG_HWCNTR	0x18
+#define ZXI2C_REG_HRCNTR	0x19
+
+/* parameters Constants */
+#define ZXI2C_GOLD_FSTP_100K	0xF3
+#define ZXI2C_GOLD_FSTP_400K	0x38
+#define ZXI2C_GOLD_FSTP_1M	0x13
+#define ZXI2C_GOLD_FSTP_3400K	0x37
+#define ZXI2C_HS_MASTER_CODE	(0x08 << 8)
+#define ZXI2C_FIFO_SIZE		32
+
+/* Structure definition */
+#define zxi2c viai2c
+
+static int zxi2c_fifo_xfer(struct zxi2c *i2c, struct i2c_msg *msg)
+{
+	u16 xfered_len = 0;
+	u16 byte_left = msg->len;
+	u16 tcr_val = i2c->tcr;
+	void __iomem *base = i2c->base;
+	bool read = !!(msg->flags & I2C_M_RD);
+
+	i2c->ti = ktime_get();
+	while (byte_left) {
+		u16 i;
+		u8 tmp;
+		int error;
+		u16 xfer_len = min_t(u16, byte_left, ZXI2C_FIFO_SIZE);
+
+		byte_left -= xfer_len;
+
+		/* reset fifo buffer */
+		tmp = ioread8(base + ZXI2C_REG_HCR);
+		iowrite8(tmp | ZXI2C_HCR_RST_FIFO, base + ZXI2C_REG_HCR);
+
+		/* set xfer len */
+		if (read) {
+			iowrite8(xfer_len - 1, base + ZXI2C_REG_HRLR);
+		} else {
+			iowrite8(xfer_len - 1, base + ZXI2C_REG_HTLR);
+			/* set write data */
+			for (i = 0; i < xfer_len; i++)
+				iowrite8(msg->buf[xfered_len + i],
+						base + ZXI2C_REG_HTDR);
+		}
+
+		/* prepare to stop transmission */
+		if (i2c->hrv && !byte_left) {
+			tmp = ioread8(i2c->base + VIAI2C_REG_CR);
+			tmp |= read ? VIAI2C_CR_RX_END : VIAI2C_CR_TX_END;
+			iowrite8(tmp, base + VIAI2C_REG_CR);
+		}
+
+		reinit_completion(&i2c->complete);
+
+		if (xfered_len) {
+			/* continue transmission */
+			tmp = ioread8(i2c->base + VIAI2C_REG_CR);
+			iowrite8(tmp |= VIAI2C_CR_CPU_RDY,
+					i2c->base + VIAI2C_REG_CR);
+		} else {
+			/* start transmission */
+			tcr_val |= (read ? VIAI2C_TCR_MASTER_READ : 0);
+			writew(tcr_val | msg->addr, base + VIAI2C_REG_TCR);
+		}
+
+		error = viai2c_wait_status(i2c);
+		if (error)
+			return error;
+
+		/* get the received data */
+		if (read)
+			for (i = 0; i < xfer_len; i++)
+				msg->buf[xfered_len + i] =
+					ioread8(base + ZXI2C_REG_HRDR);
+
+		xfered_len += xfer_len;
+	}
+
+	return 1;
+}
+
+static int zxi2c_master_xfer(struct i2c_adapter *adap,
+			struct i2c_msg *msgs, int num)
+{
+	u8 tmp;
+	int ret;
+	struct zxi2c *i2c = (struct zxi2c *)i2c_get_adapdata(adap);
+
+	ret = viai2c_wait_bus_ready(i2c);
+	if (ret)
+		return ret;
+
+	tmp = ioread8(i2c->base + VIAI2C_REG_CR);
+	tmp &= ~(VIAI2C_CR_RX_END | VIAI2C_CR_TX_END);
+
+	if (num == 1 && msgs->len >= 2 &&
+	   (i2c->hrv || msgs->len <= ZXI2C_FIFO_SIZE)) {
+		/* enable fifo mode */
+		iowrite16(ZXI2C_CR_FIFO_MODE | tmp, i2c->base + VIAI2C_REG_CR);
+		/* clear irq status */
+		iowrite8(ZXI2C_IRQ_MASK, i2c->base + VIAI2C_REG_ISR);
+		/* enable fifo irq */
+		iowrite8(VIAI2C_ISR_NACK_ADDR | ZXI2C_IRQ_FIFOEND,
+				i2c->base + VIAI2C_REG_IMR);
+
+		i2c->ti = i2c->to = ktime_get();
+		ret = zxi2c_fifo_xfer(i2c, msgs);
+	} else {
+		/* enable byte mode */
+		iowrite16(tmp, i2c->base + VIAI2C_REG_CR);
+		/* clear irq status */
+		iowrite8(ZXI2C_IRQ_MASK, i2c->base + VIAI2C_REG_ISR);
+		/* enable byte irq */
+		iowrite8(VIAI2C_ISR_NACK_ADDR | VIAI2C_IMR_BYTE,
+				i2c->base + VIAI2C_REG_IMR);
+
+		ret = viai2c_xfer(adap, msgs, num);
+		if (ret < 0)
+			iowrite16(tmp | VIAI2C_CR_END_MASK,
+					i2c->base + VIAI2C_REG_CR);
+		/* make sure the state machine is stopped */
+		usleep_range(1, 2);
+	}
+	/* dis interrupt */
+	iowrite8(0, i2c->base + VIAI2C_REG_IMR);
+
+	return ret;
+}
+
+static u32 zxi2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm zxi2c_algorithm = {
+	.master_xfer	= zxi2c_master_xfer,
+	.functionality	= zxi2c_func,
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
+	iowrite16(i2c->tr, i2c->base + VIAI2C_REG_TR);
+	iowrite8(ZXI2C_CLK_50M, i2c->base + ZXI2C_REG_CLK);
+	iowrite16(i2c->mcr, i2c->base + VIAI2C_REG_MCR);
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
+	fstp = ioread8(i2c->base + VIAI2C_REG_TR);
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
+	i2c->mcr = ioread16(i2c->base + VIAI2C_REG_MCR);
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
+	int error;
+	struct zxi2c *i2c;
+	struct pci_dev *pci;
+	struct i2c_adapter *adap;
+
+	error = viai2c_init(pdev, &i2c, VIAI2C_PLAT_ZHAOXIN);
+	if (error)
+		return error;
+
+	zxi2c_get_bus_speed(i2c);
+	zxi2c_set_bus_speed(i2c);
+
+	i2c->hrv = ioread8(i2c->base + ZXI2C_REG_REV);
+
+	adap = &i2c->adapter;
+	adap->owner = THIS_MODULE;
+	adap->algo = &zxi2c_algorithm;
+	adap->retries = 2;
+	adap->quirks = &zxi2c_quirks;
+	adap->dev.parent = &pdev->dev;
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	pci = to_pci_dev(pdev->dev.parent);
+	snprintf(adap->name, sizeof(adap->name), "zhaoxin-%s-%s",
+		dev_name(&pci->dev), dev_name(i2c->dev));
+	i2c_set_adapdata(adap, i2c);
+
+	return devm_i2c_add_adapter(&pdev->dev, adap);
+}
+
+static int __maybe_unused zxi2c_resume(struct device *dev)
+{
+	struct zxi2c *i2c = dev_get_drvdata(dev);
+
+	iowrite8(ZXI2C_CR_MST_RST, i2c->base + VIAI2C_REG_CR);
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
+	{"IIC1D17", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, zxi2c_acpi_match);
+
+static struct platform_driver zxi2c_driver = {
+	.probe = zxi2c_probe,
+	.driver = {
+		.name = ZX_I2C_NAME,
+		.acpi_match_table = zxi2c_acpi_match,
+		.pm = &zxi2c_pm,
+	},
+};
+
+module_platform_driver(zxi2c_driver);
+
+MODULE_AUTHOR("HansHu@zhaoxin.com");
+MODULE_DESCRIPTION("Shanghai Zhaoxin IIC driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


