Return-Path: <linux-i2c+bounces-2814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E889B62D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 04:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC4F28182B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 02:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE341860;
	Mon,  8 Apr 2024 02:55:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377F8494
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712544906; cv=none; b=YhydW5hgCwV3fLBeUN6wKxcCxjLHLGZiEXcfefYz2kesdJQcaMjY4v8KAT3ZS3Q8WTODTo4EWjSjvL64fGrz2v3IpNHm2eU0cf8644D/Nl7FGRh6ww5Qo4NQhyEFtU5t+52TcGRPWIryj9a772OtvK0uVfMnpPu62kkRO40wQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712544906; c=relaxed/simple;
	bh=2/6e5h1maycnkzbtvKi6EnYvv4W+DeAopb/rb8P7DeA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyCkgatSSSqHrG+sAan3OKpstoRrUrxNo17np8c33h1vTHwscnZxdwzRNrOW+he1OEhZ/sTDhKeqqZVbFd/nGtnGhoBSqZPbV2J5AOoDGFvpJE6pW91ipI2YtV0s48TWcWsbbuui7Fph9Hc/X4B4wlREiAF+Z8pg9sa9wfWsaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1712544893-086e23661834350002-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id ln0raOdiRyMKkrFx (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 08 Apr 2024 10:54:53 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:54:53 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 8 Apr 2024 10:54:52 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
Subject: [PATCH v10 6/6] i2c: add zhaoxin i2c controller driver
Date: Mon, 8 Apr 2024 10:54:48 +0800
X-ASG-Orig-Subj: [PATCH v10 6/6] i2c: add zhaoxin i2c controller driver
Message-ID: <dcc0972defb620f1e95f4e0bc74317003e325335.1712479417.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
References: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1712544893
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 16095
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123213
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Add Zhaoxin I2C controller driver. It provides the access to the i2c
busses, which connects to the touchpad, eeprom, I2S, etc.

Zhaoxin I2C controller has two separate busses, so may accommodate up
to two I2C adapters. Those adapters are listed in the ACPI namespace
with the IIC1D17 HID, and probed by a platform driver.

The driver works with IRQ mode, and supports basic I2C features. Flags
I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
the unsupported access.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 MAINTAINERS                             |   8 +
 drivers/i2c/busses/Kconfig              |  10 +
 drivers/i2c/busses/Makefile             |   2 +
 drivers/i2c/busses/i2c-viai2c-common.c  |  31 ++-
 drivers/i2c/busses/i2c-viai2c-common.h  |   9 +
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 298 ++++++++++++++++++++++++
 6 files changed, 353 insertions(+), 5 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 97fcb8d38210..134c83409a3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10265,6 +10265,14 @@ L:	linux-i2c@vger.kernel.org
 F:	Documentation/i2c/busses/i2c-ismt.rst
 F:	drivers/i2c/busses/i2c-ismt.c
 
+I2C/SMBUS ZHAOXIN DRIVER
+M:	Hans Hu <hanshu@zhaoxin.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+W:	https://www.zhaoxin.com
+F:	drivers/i2c/busses/i2c-viai2c-common.c
+F:	drivers/i2c/busses/i2c-viai2c-zhaoxin.c
+
 I2C/SMBUS STUB DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 97989c914260..cc781f8ec714 100644
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
index 63c7bbad8134..3d65934f5eb4 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -29,6 +29,8 @@ obj-$(CONFIG_I2C_SIS630)	+= i2c-sis630.o
 obj-$(CONFIG_I2C_SIS96X)	+= i2c-sis96x.o
 obj-$(CONFIG_I2C_VIA)		+= i2c-via.o
 obj-$(CONFIG_I2C_VIAPRO)	+= i2c-viapro.o
+i2c-zhaoxin-objs := i2c-viai2c-zhaoxin.o i2c-viai2c-common.o
+obj-$(CONFIG_I2C_ZHAOXIN)	+= i2c-zhaoxin.o
 
 # Mac SMBus host controller drivers
 obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 22a2e31e9c14..1844d13f1f79 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -60,7 +60,7 @@ static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 	return i2c->ret;
 }
 
-static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
+static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg, bool first)
 {
 	u16 val, tcr_val = i2c->tcr;
 
@@ -81,7 +81,8 @@ static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 
 	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
-	if (i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) {
+	if ((i2c->platform == VIAI2C_PLAT_WMT && (pmsg->flags & I2C_M_NOSTART)) ||
+	    (i2c->platform == VIAI2C_PLAT_ZHAOXIN && !first)) {
 		val = readw(i2c->base + VIAI2C_REG_CR);
 		val |= VIAI2C_CR_CPU_RDY;
 		writew(val, i2c->base + VIAI2C_REG_CR);
@@ -100,6 +101,7 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	int ret = 0;
 	struct viai2c *i2c = i2c_get_adapdata(adap);
 
+	i2c->mode = VIAI2C_BYTE_MODE;
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 		if (i2c->platform == VIAI2C_PLAT_WMT && !(pmsg->flags & I2C_M_NOSTART)) {
@@ -112,7 +114,7 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		i2c->xfered_len = 0;
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = viai2c_read(i2c, pmsg);
+			ret = viai2c_read(i2c, pmsg, i == 0);
 		else
 			ret = viai2c_write(i2c, pmsg, (i + 1) == num);
 	}
@@ -157,6 +159,8 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 		if ((i2c->xfered_len + 1) == msg->len) {
 			if (i2c->platform == VIAI2C_PLAT_WMT && !i2c->last)
 				writew(VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
+			else if (i2c->platform == VIAI2C_PLAT_ZHAOXIN && i2c->last)
+				writeb(VIAI2C_CR_TX_END, base + VIAI2C_REG_CR);
 		} else {
 			writew(msg->buf[i2c->xfered_len + 1] & 0xFF, base + VIAI2C_REG_CDR);
 			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE, base + VIAI2C_REG_CR);
@@ -168,6 +172,11 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 	return i2c->xfered_len == msg->len;
 }
 
+int __weak viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq)
+{
+	return 0;
+}
+
 static irqreturn_t viai2c_isr(int irq, void *data)
 {
 	struct viai2c *i2c = data;
@@ -175,6 +184,9 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 
 	/* save the status and write-clear it */
 	status = readw(i2c->base + VIAI2C_REG_ISR);
+	if (!status && i2c->platform == VIAI2C_PLAT_ZHAOXIN)
+		return IRQ_NONE;
+
 	writew(status, i2c->base + VIAI2C_REG_ISR);
 
 	i2c->ret = 0;
@@ -184,8 +196,12 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 	if (i2c->platform == VIAI2C_PLAT_WMT && (status & VIAI2C_ISR_SCL_TIMEOUT))
 		i2c->ret = -ETIMEDOUT;
 
-	if (!i2c->ret)
-		i2c->ret = viai2c_irq_xfer(i2c);
+	if (!i2c->ret) {
+		if (i2c->mode == VIAI2C_BYTE_MODE)
+			i2c->ret = viai2c_irq_xfer(i2c);
+		else
+			i2c->ret = viai2c_fifo_irq_xfer(i2c, true);
+	}
 
 	/* All the data has been successfully transferred or error occurred */
 	if (i2c->ret)
@@ -214,6 +230,11 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 		i2c->irq = irq_of_parse_and_map(np, 0);
 		if (!i2c->irq)
 			return -EINVAL;
+	} else if (plat == VIAI2C_PLAT_ZHAOXIN) {
+		irq_flags = IRQF_SHARED;
+		i2c->irq = platform_get_irq(pdev, 0);
+		if (i2c->irq < 0)
+			return i2c->irq;
 	} else {
 		return dev_err_probe(&pdev->dev, -EINVAL, "wrong platform type\n");
 	}
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index cfe5ab2bd779..81e827c54434 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -52,6 +52,12 @@
 
 enum {
 	VIAI2C_PLAT_WMT,
+	VIAI2C_PLAT_ZHAOXIN
+};
+
+enum {
+	VIAI2C_BYTE_MODE,
+	VIAI2C_FIFO_MODE
 };
 
 struct viai2c {
@@ -66,11 +72,14 @@ struct viai2c {
 	struct i2c_msg		*msg;
 	int			ret;
 	bool			last;
+	unsigned int		mode;
 	unsigned int		platform;
+	void			*pltfm_priv;
 };
 
 int viai2c_wait_bus_not_busy(struct viai2c *i2c);
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
 int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat);
+int viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
new file mode 100644
index 000000000000..7e3ac2a3e1fd
--- /dev/null
+++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright(c) 2024 Shanghai Zhaoxin Semiconductor Corporation.
+ *                    All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include "i2c-viai2c-common.h"
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
+
+#define ZXI2C_FIFO_SIZE		32
+
+struct viai2c_zhaoxin {
+	u8			hrv;
+	u16			tr;
+	u16			mcr;
+	u16			xfer_len;
+};
+
+/* 'irq == true' means in interrupt context */
+int viai2c_fifo_irq_xfer(struct viai2c *i2c, bool irq)
+{
+	u16 i;
+	u8 tmp;
+	struct i2c_msg *msg = i2c->msg;
+	void __iomem *base = i2c->base;
+	bool read = !!(msg->flags & I2C_M_RD);
+	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
+
+	if (irq) {
+		/* get the received data */
+		if (read)
+			for (i = 0; i < priv->xfer_len; i++)
+				msg->buf[i2c->xfered_len + i] = ioread8(base + ZXI2C_REG_HRDR);
+
+		i2c->xfered_len += priv->xfer_len;
+		if (i2c->xfered_len == msg->len)
+			return 1;
+	}
+
+	/* reset fifo buffer */
+	tmp = ioread8(base + ZXI2C_REG_HCR);
+	iowrite8(tmp | ZXI2C_HCR_RST_FIFO, base + ZXI2C_REG_HCR);
+
+	/* set xfer len */
+	priv->xfer_len = min_t(u16, msg->len - i2c->xfered_len, ZXI2C_FIFO_SIZE);
+	if (read) {
+		iowrite8(priv->xfer_len - 1, base + ZXI2C_REG_HRLR);
+	} else {
+		iowrite8(priv->xfer_len - 1, base + ZXI2C_REG_HTLR);
+		/* set write data */
+		for (i = 0; i < priv->xfer_len; i++)
+			iowrite8(msg->buf[i2c->xfered_len + i], base + ZXI2C_REG_HTDR);
+	}
+
+	/* prepare to stop transmission */
+	if (priv->hrv && msg->len == (i2c->xfered_len + priv->xfer_len)) {
+		tmp = ioread8(base + VIAI2C_REG_CR);
+		tmp |= read ? VIAI2C_CR_RX_END : VIAI2C_CR_TX_END;
+		iowrite8(tmp, base + VIAI2C_REG_CR);
+	}
+
+	if (irq) {
+		/* continue transmission */
+		tmp = ioread8(base + VIAI2C_REG_CR);
+		iowrite8(tmp |= VIAI2C_CR_CPU_RDY, base + VIAI2C_REG_CR);
+	} else {
+		u16 tcr_val = i2c->tcr;
+
+		/* start transmission */
+		tcr_val |= read ? VIAI2C_TCR_READ : 0;
+		writew(tcr_val | msg->addr, base + VIAI2C_REG_TCR);
+	}
+
+	return 0;
+}
+
+static int zxi2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	u8 tmp;
+	int ret;
+	struct viai2c *i2c = (struct viai2c *)i2c_get_adapdata(adap);
+	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
+	void __iomem *base = i2c->base;
+
+	ret = viai2c_wait_bus_not_busy(i2c);
+	if (ret)
+		return ret;
+
+	tmp = ioread8(base + VIAI2C_REG_CR);
+	tmp &= ~(VIAI2C_CR_RX_END | VIAI2C_CR_TX_END);
+
+	if (num == 1 && msgs->len >= 2 && (priv->hrv || msgs->len <= ZXI2C_FIFO_SIZE)) {
+		/* enable fifo mode */
+		iowrite16(ZXI2C_CR_FIFO_MODE | tmp, base + VIAI2C_REG_CR);
+		/* clear irq status */
+		iowrite8(ZXI2C_IRQ_MASK, base + VIAI2C_REG_ISR);
+		/* enable fifo irq */
+		iowrite8(VIAI2C_ISR_NACK_ADDR | ZXI2C_IRQ_FIFOEND, base + VIAI2C_REG_IMR);
+
+		i2c->msg = msgs;
+		i2c->mode = VIAI2C_FIFO_MODE;
+		priv->xfer_len = 0;
+		i2c->xfered_len = 0;
+
+		viai2c_fifo_irq_xfer(i2c, 0);
+
+		if (!wait_for_completion_timeout(&i2c->complete, VIAI2C_TIMEOUT))
+			return -ETIMEDOUT;
+
+		ret = i2c->ret;
+	} else {
+		/* enable byte mode */
+		iowrite16(tmp, base + VIAI2C_REG_CR);
+		/* clear irq status */
+		iowrite8(ZXI2C_IRQ_MASK, base + VIAI2C_REG_ISR);
+		/* enable byte irq */
+		iowrite8(VIAI2C_ISR_NACK_ADDR | VIAI2C_IMR_BYTE, base + VIAI2C_REG_IMR);
+
+		ret = viai2c_xfer(adap, msgs, num);
+		if (ret == -ETIMEDOUT)
+			iowrite16(tmp | VIAI2C_CR_END_MASK, base + VIAI2C_REG_CR);
+	}
+	/* dis interrupt */
+	iowrite8(0, base + VIAI2C_REG_IMR);
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
+static void zxi2c_set_bus_speed(struct viai2c *i2c)
+{
+	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
+
+	iowrite16(priv->tr, i2c->base + VIAI2C_REG_TR);
+	iowrite8(ZXI2C_CLK_50M, i2c->base + ZXI2C_REG_CLK);
+	iowrite16(priv->mcr, i2c->base + VIAI2C_REG_MCR);
+}
+
+static void zxi2c_get_bus_speed(struct viai2c *i2c)
+{
+	u8 i, count;
+	u8 fstp;
+	const u32 *params;
+	struct viai2c_zhaoxin *priv = i2c->pltfm_priv;
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
+		dev_warn(i2c->dev, "FW FSTP[%x] might cause wrong timings, dropped\n", fstp);
+		priv->tr = params[2] | 0xff00;
+	} else {
+		priv->tr = fstp | 0xff00;
+	}
+
+	i2c->tcr = params[1];
+	priv->mcr = ioread16(i2c->base + VIAI2C_REG_MCR);
+	/* for Hs-mode, use 0x80 as master code */
+	if (params[0] == I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		priv->mcr |= ZXI2C_HS_MASTER_CODE;
+
+	dev_info(i2c->dev, "speed mode is %s\n", i2c_freq_mode_string(params[0]));
+}
+
+static int zxi2c_probe(struct platform_device *pdev)
+{
+	int error;
+	struct viai2c *i2c;
+	struct i2c_adapter *adap;
+	struct viai2c_zhaoxin *priv;
+
+	error = viai2c_init(pdev, &i2c, VIAI2C_PLAT_ZHAOXIN);
+	if (error)
+		return error;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	i2c->pltfm_priv = priv;
+
+	zxi2c_get_bus_speed(i2c);
+	zxi2c_set_bus_speed(i2c);
+
+	priv->hrv = ioread8(i2c->base + ZXI2C_REG_REV);
+
+	adap = &i2c->adapter;
+	adap->owner = THIS_MODULE;
+	adap->algo = &zxi2c_algorithm;
+	adap->quirks = &zxi2c_quirks;
+	adap->dev.parent = &pdev->dev;
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	snprintf(adap->name, sizeof(adap->name), "zhaoxin-%s-%s",
+		 dev_name(pdev->dev.parent), dev_name(i2c->dev));
+	i2c_set_adapdata(adap, i2c);
+
+	return devm_i2c_add_adapter(&pdev->dev, adap);
+}
+
+static int __maybe_unused zxi2c_resume(struct device *dev)
+{
+	struct viai2c *i2c = dev_get_drvdata(dev);
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
+		.name = "i2c_zhaoxin",
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


