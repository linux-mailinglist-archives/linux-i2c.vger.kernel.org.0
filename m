Return-Path: <linux-i2c+bounces-9331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC4A2B8D2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 03:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3A83A81C1
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 02:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230E9154439;
	Fri,  7 Feb 2025 02:19:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38751494DD;
	Fri,  7 Feb 2025 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894791; cv=none; b=L+pkGTCb8z5lYqeY4ZAiScy8U5g6Y6Jv9X4lvK2bUHt1NsDh72Hiye2DugFAcVcNn4VGJHymB5IRITzAXOFHWPlXRVNpDfGgFCBp+NAHrhZkM5r05CeYkt81qaXE3GSKFEQiZwP17XTLMkMX3QeaHfBB/O1RYZZ3sFj8iTQmvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894791; c=relaxed/simple;
	bh=eR4anf1bgG7Yg1uOAlmbrvrh5k4eQlcgOwBRH9j+I+8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J3xhRmP3QNw0K0ZjF6lNxLUHrYyk3FeCL5nI1XMgqzqaeRzYpVfbaldGbSh+bO91kCz6jrLg/3V7/kn2Plgeyq0TA1axjkU81NWDhViFlRAD2vn0+TeashW2syYX3NNI9QPGr5m4pU5lVVMp3A22FAgmZP573qf2nMhE33W/sLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5172JV4Q093088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 10:19:31 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 7 Feb 2025
 10:19:31 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 2/2] i2c: atciic100: add Andes I2C driver support
Date: Fri, 7 Feb 2025 10:19:23 +0800
Message-ID: <20250207021923.2912373-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207021923.2912373-1-ben717@andestech.com>
References: <20250207021923.2912373-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 5172JV4Q093088

Add support for Andes I2C driver.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 MAINTAINERS                        |   1 +
 drivers/i2c/busses/Kconfig         |  10 +
 drivers/i2c/busses/Makefile        |   1 +
 drivers/i2c/busses/i2c-atciic100.c | 346 +++++++++++++++++++++++++++++
 4 files changed, 358 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-atciic100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 544251a03c7d..939ff77eed19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1639,6 +1639,7 @@ ANDES TECHNOLOGY I2C DRIVER
 M:	Ben Zong-You Xie <ben717@andestech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
+F:	drivers/i2c/busses/i2c-atciic100.c
 
 ANDROID DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fc438f445771..93edb62c7d3f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1422,6 +1422,16 @@ config I2C_ACORN
 
 	  If you don't know, say Y.
 
+config I2C_ATCIIC100
+	tristate "Andes I2C Controller"
+	depends on OF && HAS_IOMEM
+	help
+	  If you say yes to this option, support will be included for the
+	  Andes I2C controller.
+
+	  This support is also available as a module.  If so, the module
+	  will be called i2c-atciic100.
+
 config I2C_ELEKTOR
 	tristate "Elektor ISA card"
 	depends on ISA && HAS_IOPORT_MAP && BROKEN_ON_SMP
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1c2a4510abe4..58756a80c11f 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -143,6 +143,7 @@ obj-$(CONFIG_I2C_VIPERBOARD)	+= i2c-viperboard.o
 
 # Other I2C/SMBus bus drivers
 obj-$(CONFIG_I2C_ACORN)		+= i2c-acorn.o
+obj-$(CONFIG_I2C_ATCIIC100)	+= i2c-atciic100.o
 obj-$(CONFIG_I2C_BCM_KONA)	+= i2c-bcm-kona.o
 obj-$(CONFIG_I2C_BRCMSTB)	+= i2c-brcmstb.o
 obj-$(CONFIG_I2C_CROS_EC_TUNNEL)	+= i2c-cros-ec-tunnel.o
diff --git a/drivers/i2c/busses/i2c-atciic100.c b/drivers/i2c/busses/i2c-atciic100.c
new file mode 100644
index 000000000000..cfb18b3b506e
--- /dev/null
+++ b/drivers/i2c/busses/i2c-atciic100.c
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * I2C Support for Andes ATCIIC100 two-wire interface (TWI)
+ *
+ * Copyright (C) 2025 Andes Technology Corporation.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define	ATCIIC100_CFG_REG		0x10
+#define ATCIIC100_CFG_FIFOSIZE		GENMASK(1, 0)
+
+#define	ATCIIC100_INTEN_REG		0x14
+#define	ATCIIC100_INTEN_FIFO_EMPTY	BIT(0)
+#define	ATCIIC100_INTEN_FIFO_FULL	BIT(1)
+#define	ATCIIC100_INTEN_CMPL		BIT(9)
+
+#define	ATCIIC100_STATUS_REG		0x18
+#define ATCIIC100_STATUS_FIFO_EMPTY	BIT(0)
+#define ATCIIC100_STATUS_FIFO_FULL	BIT(1)
+#define ATCIIC100_STATUS_ADDR_HIT	BIT(3)
+#define ATCIIC100_STATUS_CMPL		BIT(9)
+#define ATCIIC100_STATUS_W1C		GENMASK(9, 3)
+
+#define	ATCIIC100_ADDR_REG		0x1C
+
+#define	ATCIIC100_DATA_REG		0x20
+
+#define	ATCIIC100_CTRL_REG		0x24
+#define ATCIIC100_CTRL_DATA_CNT		GENMASK(7, 0)
+#define ATCIIC100_CTRL_DIR		BIT(8)
+#define ATCIIC100_CTRL_PHASE		GENMASK(12, 9)
+
+#define	ATCIIC100_CMD_REG		0x28
+#define ATCIIC100_CMD_ACTION		GENMASK(2, 0)
+#define ATCIIC100_CMD_ACTION_TRANS	BIT(0)
+
+#define	ATCIIC100_SETUP_REG		0x2C
+#define ATCIIC100_SETUP_IICEN		BIT(0)
+#define ATCIIC100_SETUP_REQ		BIT(2)
+
+#define ATCIIC100_TIMEOUT_US		400000
+#define ATCIIC100_TIMEOUT		usecs_to_jiffies(ATCIIC100_TIMEOUT_US)
+
+#define ATCIIC100_MAX_DATA_LEN		256
+
+struct atciic100 {
+	struct i2c_adapter	adap;
+	struct completion	complete;
+	spinlock_t		lock;
+	void __iomem		*base;
+	u8			*buf;
+	int			irq;
+	u16			buf_len;
+	u8			fifo_size;
+	bool			addr_hit;
+	bool			xfer_done;
+};
+
+static void atciic100_xfer_common(struct atciic100 *i2c, u32 status)
+{
+	unsigned long flags;
+	u32 val;
+	u8 fsize = i2c->fifo_size;
+
+	spin_lock_irqsave(&i2c->lock, flags);
+
+	if (status & ATCIIC100_STATUS_FIFO_EMPTY) { /* Data transmit */
+		/* The last write to FIFO */
+		if (i2c->buf_len <= fsize) {
+			fsize = i2c->buf_len;
+			val = readl(i2c->base + ATCIIC100_INTEN_REG) &
+			      ~ATCIIC100_INTEN_FIFO_EMPTY;
+			writel(val, i2c->base + ATCIIC100_INTEN_REG);
+		}
+
+		while (fsize--) {
+			writel(*i2c->buf++, i2c->base + ATCIIC100_DATA_REG);
+			i2c->buf_len--;
+		}
+	} else if (status & ATCIIC100_STATUS_FIFO_FULL) { /* Data receive */
+		while (fsize--) {
+			*i2c->buf++ = readl(i2c->base + ATCIIC100_DATA_REG);
+			i2c->buf_len--;
+		}
+	}
+
+	if (status & ATCIIC100_STATUS_CMPL) {
+		/* Write 1 to clear all status */
+		writel(ATCIIC100_STATUS_W1C, i2c->base + ATCIIC100_STATUS_REG);
+
+		i2c->xfer_done = true;
+		if (status & ATCIIC100_STATUS_ADDR_HIT)
+			i2c->addr_hit = true;
+
+		/* For the last read, retrieve all remaining data in FIFO. */
+		while (i2c->buf_len--)
+			*i2c->buf++ = readl(i2c->base + ATCIIC100_DATA_REG);
+
+	}
+
+	spin_unlock_irqrestore(&i2c->lock, flags);
+}
+
+static irqreturn_t atciic100_irq_handler(int irq, void *data)
+{
+	struct atciic100 *i2c = data;
+	u32 status = readl(i2c->base + ATCIIC100_STATUS_REG);
+
+	atciic100_xfer_common(i2c, status);
+	if (i2c->xfer_done) {
+		/* Disable all interrupts */
+		writel(0, i2c->base + ATCIIC100_INTEN_REG);
+		if (i2c->addr_hit)
+			complete(&i2c->complete);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int atciic100_xfer_wait(struct atciic100 *i2c, struct i2c_msg *msg)
+{
+	u32 val;
+
+	/*
+	 * Set the data count.
+	 * If there are 256 bytes to be transmitted/received, write 0 to the
+	 * data count field.
+	 */
+	val = readl(i2c->base + ATCIIC100_CTRL_REG) |
+	      (i2c->buf_len & ATCIIC100_CTRL_DATA_CNT);
+
+	/* Set the transaction direction */
+	if (msg->flags & I2C_M_RD)
+		val |= ATCIIC100_CTRL_DIR;
+	else
+		val &= ~ATCIIC100_CTRL_DIR;
+
+	/* Enable all phases choices */
+	val |= ATCIIC100_CTRL_PHASE;
+	writel(val, i2c->base + ATCIIC100_CTRL_REG);
+
+	/* Write the address of the target device to the address register */
+	writel(msg->addr, i2c->base + ATCIIC100_ADDR_REG);
+
+	/* Enable the completion and FIFO empty/full interrupts */
+	if (i2c->irq > 0) {
+		val = readl(i2c->base + ATCIIC100_INTEN_REG);
+		val |= (msg->flags & I2C_M_RD) ? ATCIIC100_INTEN_FIFO_FULL
+					       : ATCIIC100_INTEN_FIFO_EMPTY;
+		val |= ATCIIC100_INTEN_CMPL;
+		writel(val, i2c->base + ATCIIC100_INTEN_REG);
+	}
+
+	/* Issue the transaction */
+	writel(ATCIIC100_CMD_ACTION_TRANS, i2c->base + ATCIIC100_CMD_REG);
+
+	if (i2c->irq > 0) {
+		unsigned long time_left;
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							ATCIIC100_TIMEOUT);
+		if (!time_left)
+			return -ETIMEDOUT;
+
+		reinit_completion(&i2c->complete);
+	} else {
+		u32 cond = ATCIIC100_STATUS_CMPL;
+		unsigned long timeout;
+
+		cond |= (msg->flags & I2C_M_RD) ? ATCIIC100_STATUS_FIFO_FULL
+						: ATCIIC100_STATUS_FIFO_EMPTY;
+		while (!i2c->xfer_done) {
+			timeout = readl_poll_timeout_atomic(
+					i2c->base + ATCIIC100_STATUS_REG,
+					val, val & cond,
+					10, ATCIIC100_TIMEOUT_US);
+
+			if (timeout)
+				return -ETIMEDOUT;
+
+			atciic100_xfer_common(i2c, val);
+		}
+
+		if (!i2c->addr_hit)
+			return -ENXIO;
+	}
+
+	/* Check if all data is successfully transmitted. */
+	if (readl(i2c->base + ATCIIC100_CTRL_REG) & ATCIIC100_CTRL_DATA_CNT)
+		return -EIO;
+
+	return 0;
+}
+
+static int atciic100_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
+			  int num)
+{
+	int i, ret;
+	struct atciic100 *i2c = i2c_get_adapdata(adap);
+
+	for (i = 0; i < num; i++) {
+		struct i2c_msg *m = &msg[i];
+
+		i2c->addr_hit = false;
+		i2c->buf = m->buf;
+		i2c->buf_len = m->len;
+		i2c->xfer_done = false;
+		ret = atciic100_xfer_wait(i2c, m);
+		if (ret < 0)
+			return ret;
+	}
+
+	return num;
+}
+
+static u32 atciic100_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static struct i2c_algorithm atciic100_algo = {
+	.xfer = atciic100_xfer,
+	.functionality = atciic100_func,
+};
+
+static const struct i2c_adapter_quirks atciic100_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+	.max_write_len = ATCIIC100_MAX_DATA_LEN,
+	.max_read_len = ATCIIC100_MAX_DATA_LEN,
+};
+
+static int atciic100_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 val;
+	struct atciic100 *i2c;
+	struct i2c_adapter *adap;
+	struct device *dev = &pdev->dev;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(i2c->base))
+		return PTR_ERR(i2c->base);
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq > 0) {
+		ret = devm_request_irq(dev, i2c->irq, atciic100_irq_handler, 0,
+				       dev_name(dev), i2c);
+		if (ret < 0) {
+			return dev_err_probe(dev, ret,
+					     "unable to request irq %d\n",
+					     i2c->irq);
+		}
+	} else {
+		dev_warn(dev, "no irq resource, falling back to poll mode\n");
+	}
+
+	spin_lock_init(&i2c->lock);
+	init_completion(&i2c->complete);
+
+	adap = &i2c->adap;
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+	adap->algo = &atciic100_algo;
+	adap->class = I2C_CLASS_HWMON;
+	adap->dev.parent = dev;
+	adap->dev.of_node = dev->of_node;
+	adap->owner = THIS_MODULE;
+	adap->quirks = &atciic100_quirks;
+	adap->retries = 1;
+	adap->timeout = ATCIIC100_TIMEOUT;
+
+	i2c_set_adapdata(adap, i2c);
+	platform_set_drvdata(pdev, i2c);
+	ret = devm_i2c_add_adapter(dev, adap);
+	if (ret)
+		return dev_err_probe(dev, ret, "i2c add adapter failed\n");
+
+	/* Get FIFO size */
+	i2c->fifo_size = 2 << (readl(i2c->base + ATCIIC100_CFG_REG) &
+			       ATCIIC100_CFG_FIFOSIZE);
+
+	/* Configure ATCIIC100 as a controller and enable ATCIIC100 */
+	val = readl(i2c->base + ATCIIC100_SETUP_REG) | ATCIIC100_SETUP_IICEN
+						     | ATCIIC100_SETUP_REQ;
+	writel(val, i2c->base + ATCIIC100_SETUP_REG);
+	return 0;
+}
+
+static void atciic100_remove(struct platform_device *pdev)
+{
+	u32 val;
+	struct atciic100 *i2c = platform_get_drvdata(pdev);
+
+	/* Disable ATCIIC100 */
+	val = readl(i2c->base + ATCIIC100_SETUP_REG) & ~ATCIIC100_SETUP_IICEN;
+	writel(val, i2c->base + ATCIIC100_SETUP_REG);
+
+	i2c_del_adapter(&i2c->adap);
+}
+
+static const struct of_device_id atciic100_dt[] = {
+	{ .compatible = "andestech,atciic100" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, atciic100_dt);
+
+static struct platform_driver atciic100_platform_driver = {
+	.driver		= {
+		.name	= "atciic100",
+		.of_match_table	= of_match_ptr(atciic100_dt),
+	},
+	.probe		= atciic100_probe,
+	.remove		= atciic100_remove,
+};
+
+/* I2C may be needed to bring up other drivers */
+static int __init atciic100_init_driver(void)
+{
+	return platform_driver_register(&atciic100_platform_driver);
+}
+subsys_initcall(atciic100_init_driver);
+
+static void __exit atciic100_exit_driver(void)
+{
+	platform_driver_unregister(&atciic100_platform_driver);
+}
+module_exit(atciic100_exit_driver);
+
+MODULE_AUTHOR("Ben Zong-You Xie <ben717@andestech.com>");
+MODULE_DESCRIPTION("Andes ATCIIC100 I2C bus adapter");
+MODULE_LICENSE("GPL");
+
-- 
2.34.1


