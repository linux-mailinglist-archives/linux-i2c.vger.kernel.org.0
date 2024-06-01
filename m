Return-Path: <linux-i2c+bounces-3739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7278D71C1
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 22:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A537A1F21ACE
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2024 20:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E29218AEA;
	Sat,  1 Jun 2024 20:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="WVPdt+D/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx02lb.world4you.com (mx02lb.world4you.com [81.19.149.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BBD12B89
	for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2024 20:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717272258; cv=none; b=rfGioXigvehODCxgRpjH0FGiLgi4Zz1ORolMYpk9DoY8K7ovrPp1Qzq8x1Rhc2g8Z8+fOnntxICRdFeNezrcbKe1ygbtr1aalBgFaautB1sm18tX3tF6LLnX3e/Blsz7MqW4UMNijt+jKy+UzH/HSz1xW1uc7xWYTKMvk/c+X5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717272258; c=relaxed/simple;
	bh=8ABnIgt51iWz3zoeovS7Y86MNBzXXF1DK6L0OgWEVPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WOWXH3KLWUu8YDnHNhZeWPF7a1ErX2EDf2V949mng4lai6Tq2GYqqz1jmay2dc9ENKvTBBB8atSyHrxBiSZbqs7xiVSrnX1r76oXLG/Mo1p1ptDuXbVnffqFi08PIL8A4nyKDqV6nBVPIbh3yLry3tXfW3h1yRkbI1T/C/EuA4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=WVPdt+D/; arc=none smtp.client-ip=81.19.149.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CCzByU6SJ6OiMWuevT+8ZGKWIMZpKXl/RSZJrxz+ThY=; b=WVPdt+D/rg1+6wrODKoB+Z5N1l
	+vvIi6mXow7G90BovHBY+X3XYq9RmFKMsxSAtiVw1eH7HMiUKGh5Y9cT9B7mgxSrVJmonIV2Jl4wI
	6m0tDFG5AGiMZ7JwckDzdEt/QC0ofqJl0MrB3jQuRkxkbHYBjGX+ssM1+iIyq/CHjvks=;
Received: from 88-117-63-44.adsl.highway.telekom.at ([88.117.63.44] helo=hornet.engleder.at)
	by mx02lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sDUPX-0002J3-1A;
	Sat, 01 Jun 2024 21:29:03 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH 1/2] i2c: keba: Add KEBA I2C controller support
Date: Sat,  1 Jun 2024 21:28:45 +0200
Message-Id: <20240601192846.68146-2-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240601192846.68146-1-gerhard@engleder-embedded.com>
References: <20240601192846.68146-1-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-ACL-Warn: X-W4Y-Internal

From: Gerhard Engleder <eg@keba.com>

The KEBA I2C controller is found in the system FPGA of KEBA PLC devices.
It is used to connect EEPROMs and hardware monitoring chips.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
 drivers/i2c/busses/Kconfig             |  10 +
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-keba.c          | 585 +++++++++++++++++++++++++
 include/linux/platform_data/i2c-keba.h |  23 +
 4 files changed, 619 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-keba.c
 create mode 100644 include/linux/platform_data/i2c-keba.h

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..be2611a33503 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -770,6 +770,16 @@ config I2C_JZ4780
 
 	 If you don't know what to do here, say N.
 
+config I2C_KEBA
+	tristate "KEBA I2C controller support"
+	depends on HAS_IOMEM
+	help
+	  This driver supports the I2C controller found in KEBA system FPGA
+	  devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-keba.
+
 config I2C_KEMPLD
 	tristate "Kontron COM I2C Controller"
 	depends on MFD_KEMPLD
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3d65934f5eb4..6c3dfa7936c7 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_I2C_IMX)		+= i2c-imx.o
 obj-$(CONFIG_I2C_IMX_LPI2C)	+= i2c-imx-lpi2c.o
 obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
+obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
new file mode 100644
index 000000000000..5f76f0ddeccf
--- /dev/null
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) KEBA AG 2012
+ * Copyright (C) KEBA Industrial Automation Gmbh 2024
+ *
+ * Driver for KEBA I2C controller FPGA IP core
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/i2c.h>
+#include <linux/platform_data/i2c-keba.h>
+
+#define KI2C "i2c-keba"
+
+#define KI2C_CAPABILITY_REG	0x02
+#define KI2C_CONTROL_REG	0x04
+#define KI2C_CONTROL_DC_REG	0x05
+#define KI2C_STATUS_REG		0x08
+#define KI2C_STATUS_DC_REG	0x09
+#define KI2C_DATA_REG		0x0c
+
+#define KI2C_CAPABILITY_CRYPTO	0x01
+#define KI2C_CAPABILITY_DC	0x02
+
+#define KI2C_CONTROL_MEN	0x01
+#define KI2C_CONTROL_MSTA	0x02
+#define KI2C_CONTROL_RSTA	0x04
+#define KI2C_CONTROL_MTX	0x08
+#define KI2C_CONTROL_TXAK	0x10
+
+#define KI2C_STATUS_IN_USE	0x01
+#define KI2C_STATUS_ACK_CYC	0x02
+#define KI2C_STATUS_RXAK	0x04
+#define KI2C_STATUS_MCF		0x08
+
+#define KI2C_DC_SDA		0x01
+#define KI2C_DC_SCL		0x02
+
+#define KI2C_INUSE_SLEEP_US	(2 * USEC_PER_MSEC)
+#define KI2C_INUSE_TIMEOUT_US	(10 * USEC_PER_SEC)
+
+#define KI2C_POLL_DELAY_US	5
+
+struct ki2c {
+	struct platform_device *pdev;
+	void __iomem *base;
+	struct i2c_adapter adapter;
+
+	struct i2c_client **client;
+	int client_size;
+};
+
+static int ki2c_inuse_lock(struct ki2c *ki2c)
+{
+	u8 sts;
+	int ret;
+
+	/* The I2C controller has an IN_USE bit for locking access to the
+	 * controller. This enables the use of I2C controller by other none
+	 * Linux processors.
+	 *
+	 * If the I2C controller is free, then the first read returns
+	 * IN_USE == 0. After that the I2C controller is locked and further
+	 * reads of IN_USE return 1.
+	 *
+	 * The I2C controller is unlocked by writing 1 into IN_USE.
+	 */
+	ret = readb_poll_timeout(ki2c->base + KI2C_STATUS_REG,
+				 sts, (sts & KI2C_STATUS_IN_USE) == 0,
+				 KI2C_INUSE_SLEEP_US, KI2C_INUSE_TIMEOUT_US);
+	if (ret != 0)
+		dev_warn(&ki2c->pdev->dev, "%s err!\n", __func__);
+
+	return ret;
+}
+
+static void ki2c_inuse_unlock(struct ki2c *ki2c)
+{
+	/* unlock the controller by writing 1 into IN_USE */
+	iowrite8(KI2C_STATUS_IN_USE, ki2c->base + KI2C_STATUS_REG);
+}
+
+static int ki2c_wait_for_bit(u8 mask, void __iomem *addr, unsigned long timeout)
+{
+	u8 val;
+
+	return readb_poll_timeout(addr, val, (val & mask), KI2C_POLL_DELAY_US,
+				  jiffies_to_usecs(timeout));
+}
+
+static int ki2c_wait_for_mcf(struct ki2c *ki2c)
+{
+	return ki2c_wait_for_bit(KI2C_STATUS_MCF, ki2c->base + KI2C_STATUS_REG,
+				 ki2c->adapter.timeout);
+}
+
+static int ki2c_wait_for_data(struct ki2c *ki2c)
+{
+	int ret;
+
+	ret = ki2c_wait_for_mcf(ki2c);
+	if (ret < 0)
+		return ret;
+
+	return ki2c_wait_for_bit(KI2C_STATUS_ACK_CYC,
+				 ki2c->base + KI2C_STATUS_REG,
+				 ki2c->adapter.timeout);
+}
+
+static int ki2c_wait_for_data_ack(struct ki2c *ki2c)
+{
+	int ret;
+
+	ret = ki2c_wait_for_data(ki2c);
+	if (ret < 0)
+		return ret;
+
+	/* RXAK == 0 means ACK reveived */
+	if (ioread8(ki2c->base + KI2C_STATUS_REG) & KI2C_STATUS_RXAK)
+		return -EIO;
+
+	return 0;
+}
+
+static int ki2c_has_capability(struct ki2c *ki2c, unsigned int cap)
+{
+	return (ioread8(ki2c->base + KI2C_CAPABILITY_REG) & cap) != 0;
+}
+
+static int ki2c_get_scl(struct ki2c *ki2c)
+{
+	/* capability KI2C_CAPABILITY_DC required */
+	return (ioread8(ki2c->base + KI2C_STATUS_DC_REG) & KI2C_DC_SCL) != 0;
+}
+
+static int ki2c_get_sda(struct ki2c *ki2c)
+{
+	/* capability KI2C_CAPABILITY_DC required */
+	return (ioread8(ki2c->base + KI2C_STATUS_DC_REG) & KI2C_DC_SDA) != 0;
+}
+
+static void ki2c_set_scl(struct ki2c *ki2c, int val)
+{
+	u8 control_dc;
+
+	/* capability KI2C_CAPABILITY_DC and KI2C_CONTROL_MEN = 0 reqired */
+	control_dc = ioread8(ki2c->base + KI2C_CONTROL_DC_REG);
+	if (val)
+		control_dc |= KI2C_DC_SCL;
+	else
+		control_dc &= ~KI2C_DC_SCL;
+	iowrite8(control_dc, ki2c->base + KI2C_CONTROL_DC_REG);
+}
+
+/*
+ * Resetting bus bitwise is done by checking SDA and applying clock cycles as
+ * long as SDA is low. 9 clock cycles are applied at most.
+ *
+ * Clock cycles are generated and ndelay() determines the duration of clock
+ * cycles. Generated clock rate is 100 KHz and so duration of both clock levels
+ * is: delay in ns = (10^6 / 100) / 2
+ */
+#define KI2C_RECOVERY_CLK_CNT	9
+#define KI2C_RECOVERY_NDELAY	5000
+static int ki2c_reset_bus_bitwise(struct ki2c *ki2c)
+{
+	int count = 0;
+	int val = 1;
+	int ret = 0;
+
+	/* disable I2C controller (MEN = 0) to get direct access to SCL/SDA */
+	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
+
+	/* generate clock cycles */
+	ki2c_set_scl(ki2c, val);
+	ndelay(KI2C_RECOVERY_NDELAY);
+	while (count++ < KI2C_RECOVERY_CLK_CNT * 2) {
+		if (val) {
+			/* SCL shouldn't be low here */
+			if (!ki2c_get_scl(ki2c)) {
+				dev_err(&ki2c->pdev->dev,
+					"SCL is stuck low!\n");
+				ret = -EBUSY;
+				break;
+			}
+
+			/* break if SDA is high */
+			if (ki2c_get_sda(ki2c))
+				break;
+		}
+
+		val = !val;
+		ki2c_set_scl(ki2c, val);
+		ndelay(KI2C_RECOVERY_NDELAY);
+	}
+
+	if (!ki2c_get_sda(ki2c)) {
+		dev_err(&ki2c->pdev->dev, "SDA is still low!\n");
+		ret = -EBUSY;
+	}
+
+	/* reenable controller */
+	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);
+
+	return ret;
+}
+
+/*
+ * Resetting bus bytewise is done by writing start bit, 9 data bits and stop
+ * bit.
+ *
+ * This is not 100% safe. If slave is an EEPROM and a write access was
+ * interrupted during the ACK cycle, this approach might not be able to recover
+ * the bus. The reason is, that after the 9 clock cycles the EEPROM will be in
+ * ACK cycle again and will hold SDA low like it did before the start of the
+ * routine. Furthermore the EEPROM might get written one additional byte with
+ * 0xff into it. Thus, use bitwise approach whenever possible, especially when
+ * EEPROMs are on the bus.
+ */
+static int ki2c_reset_bus_bytewise(struct ki2c *ki2c)
+{
+	int ret;
+
+	/* hold data line high for 9 clock cycles */
+	iowrite8(0xFF, ki2c->base + KI2C_DATA_REG);
+
+	/* create start condition */
+	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MTX | KI2C_CONTROL_MSTA | KI2C_CONTROL_TXAK,
+		 ki2c->base + KI2C_CONTROL_REG);
+	ret = ki2c_wait_for_mcf(ki2c);
+	if (ret < 0)
+		return ret;
+
+	/* create stop condition */
+	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MTX | KI2C_CONTROL_TXAK,
+		 ki2c->base + KI2C_CONTROL_REG);
+	ret = ki2c_wait_for_mcf(ki2c);
+
+	return ret;
+}
+
+static int ki2c_reset_bus(struct ki2c *ki2c)
+{
+	int ret;
+
+	ret = ki2c_inuse_lock(ki2c);
+	if (ret < 0)
+		return ret;
+
+	/* If the I2C controller is capable of direct control of SCL/SDA, then a
+	 * bitwise reset is used. Otherwise fall back to bytewise reset.
+	 */
+	if (ki2c_has_capability(ki2c, KI2C_CAPABILITY_DC))
+		ret = ki2c_reset_bus_bitwise(ki2c);
+	else
+		ret = ki2c_reset_bus_bytewise(ki2c);
+
+	ki2c_inuse_unlock(ki2c);
+
+	return ret;
+}
+
+static void ki2c_write_target_addr(struct ki2c *ki2c, struct i2c_msg *m)
+{
+	u8 addr;
+
+	addr = m->addr << 1;
+	/* Bit 0 signals RD/WR */
+	if (m->flags & I2C_M_RD)
+		addr |= 0x01;
+
+	iowrite8(addr, ki2c->base + KI2C_DATA_REG);
+}
+
+static int ki2c_start_addr(struct ki2c *ki2c, struct i2c_msg *m)
+{
+	int ret;
+
+	/* Store target address byte in the controller. This has to be done
+	 * before sending START condition.
+	 */
+	ki2c_write_target_addr(ki2c, m);
+
+	/* enable controller for TX */
+	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MTX,
+		 ki2c->base + KI2C_CONTROL_REG);
+
+	/* send START condition and target address byte */
+	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MTX | KI2C_CONTROL_MSTA,
+		 ki2c->base + KI2C_CONTROL_REG);
+
+	ret = ki2c_wait_for_data_ack(ki2c);
+	if (ret < 0)
+		/* For EEPROMs this is normal behavior during internal write
+		 * operation.
+		 */
+		dev_dbg(&ki2c->pdev->dev, "%s wait for ACK err at 0x%02x!\n",
+			__func__, m->addr);
+
+	return ret;
+}
+
+static int ki2c_repstart_addr(struct ki2c *ki2c, struct i2c_msg *m)
+{
+	int ret;
+
+	/* repeated start and write is not supported */
+	if ((m->flags & I2C_M_RD) == 0) {
+		dev_warn(&ki2c->pdev->dev,
+			 "Repeated start not supported for writes\n");
+		return -EINVAL;
+	}
+
+	/* send repeated start */
+	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_RSTA,
+		 ki2c->base + KI2C_CONTROL_REG);
+
+	ret = ki2c_wait_for_mcf(ki2c);
+	if (ret < 0) {
+		dev_warn(&ki2c->pdev->dev, "%s wait for MCF err at 0x%02x!\n",
+			 __func__, m->addr);
+		return ret;
+	}
+
+	/* write target-address byte */
+	ki2c_write_target_addr(ki2c, m);
+
+	ret = ki2c_wait_for_data_ack(ki2c);
+	if (ret < 0)
+		dev_warn(&ki2c->pdev->dev, "%s wait for ACK err at 0x%02x!\n",
+			 __func__, m->addr);
+
+	return ret;
+}
+
+static void ki2c_stop(struct ki2c *ki2c)
+{
+	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);
+	ki2c_wait_for_mcf(ki2c);
+}
+
+static int ki2c_write(struct ki2c *ki2c, const u8 *data, int len)
+{
+	int ret;
+
+	for (int i = 0; i < len; i++) {
+		/* write data byte */
+		iowrite8(data[i], ki2c->base + KI2C_DATA_REG);
+
+		ret = ki2c_wait_for_data_ack(ki2c);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ki2c_read(struct ki2c *ki2c, u8 *data, int len)
+{
+	u8 control;
+	int ret;
+
+	if (len == 0)
+		return 0;	/* nothing to do */
+
+	control = KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA;
+
+	/* if just one byte => send tx-nack after transfer */
+	if (len == 1)
+		control |= KI2C_CONTROL_TXAK;
+
+	iowrite8(control, ki2c->base + KI2C_CONTROL_REG);
+
+	/* dummy read to start transfer on bus */
+	ioread8(ki2c->base + KI2C_DATA_REG);
+
+	for (int i = 0; i < len; i++) {
+		ret = ki2c_wait_for_data(ki2c);
+		if (ret < 0)
+			return ret;
+
+		/* send tx-nack after transfer of last byte */
+		if (i == len - 2)
+			iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_TXAK,
+				 ki2c->base + KI2C_CONTROL_REG);
+
+		/* switch to TX on last byte, so that reading DATA-register
+		 * does not trigger another read transfer.
+		 */
+		if (i == len - 1)
+			iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MSTA | KI2C_CONTROL_MTX,
+				 ki2c->base + KI2C_CONTROL_REG);
+
+		/* read byte and start next transfer (if not last byte) */
+		data[i] = ioread8(ki2c->base + KI2C_DATA_REG);
+	}
+
+	return len;
+}
+
+static int ki2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct ki2c *ki2c = i2c_get_adapdata(adap);
+	int ret;
+
+	ret = ki2c_inuse_lock(ki2c);
+	if (ret < 0)
+		return ret;
+
+	for (int i = 0; i < num; i++) {
+		struct i2c_msg *m = &msgs[i];
+
+		if (i == 0)
+			ret = ki2c_start_addr(ki2c, m);
+		else
+			ret = ki2c_repstart_addr(ki2c, m);
+		if (ret < 0)
+			break;
+
+		if (m->flags & I2C_M_RD)
+			ret = ki2c_read(ki2c, m->buf, m->len);
+		else
+			ret = ki2c_write(ki2c, m->buf, m->len);
+		if (ret < 0)
+			break;
+	}
+
+	ki2c_stop(ki2c);
+
+	ki2c_inuse_unlock(ki2c);
+
+	return (ret < 0) ? ret : num;
+}
+
+static void ki2c_unregister_devices(struct ki2c *ki2c)
+{
+	for (int i = 0; i < ki2c->client_size; i++) {
+		struct i2c_client *client = ki2c->client[i];
+
+		if (client)
+			i2c_unregister_device(client);
+	}
+}
+
+static int ki2c_register_devices(struct ki2c *ki2c,
+				 struct i2c_keba_platform_data *pdata)
+{
+	/* register all I2C devices from platform_data array */
+	for (int i = 0; i < ki2c->client_size; i++) {
+		struct i2c_client *client;
+		unsigned short const addr_list[2] = { pdata->info[i].addr,
+						      I2C_CLIENT_END };
+
+		client = i2c_new_scanned_device(&ki2c->adapter, &pdata->info[i],
+						addr_list, NULL);
+		if (!IS_ERR(client)) {
+			ki2c->client[i] = client;
+		} else if (PTR_ERR(client) != -ENODEV) {
+			ki2c_unregister_devices(ki2c);
+
+			return PTR_ERR(client);
+		}
+	}
+
+	return 0;
+}
+
+static u32 ki2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm ki2c_algo = {
+	.master_xfer   = ki2c_xfer,
+	.functionality = ki2c_func,
+};
+
+static int ki2c_probe(struct platform_device *pdev)
+{
+	struct i2c_keba_platform_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct i2c_adapter *adap;
+	struct resource *io;
+	struct ki2c *ki2c;
+	int ret;
+
+	pdata = dev->platform_data;
+	if (pdata == 0) {
+		dev_err(dev, "Platform data not found!\n");
+		return -ENODEV;
+	}
+
+	ki2c = devm_kzalloc(dev, sizeof(*ki2c), GFP_KERNEL);
+	if (!ki2c)
+		return -ENOMEM;
+	ki2c->pdev = pdev;
+	ki2c->client = devm_kcalloc(dev, pdata->info_size,
+				    sizeof(*ki2c->client), GFP_KERNEL);
+	if (!ki2c->client)
+		return -ENOMEM;
+	ki2c->client_size = pdata->info_size;
+	platform_set_drvdata(pdev, ki2c);
+
+	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ki2c->base = devm_ioremap_resource(dev, io);
+	if (IS_ERR(ki2c->base))
+		return PTR_ERR(ki2c->base);
+
+	/* enable controller */
+	iowrite8(KI2C_CONTROL_MEN, ki2c->base + KI2C_CONTROL_REG);
+
+	adap = &ki2c->adapter;
+	strscpy(adap->name, "KEBA I2C adapter", sizeof(adap->name));
+	adap->owner = THIS_MODULE;
+	adap->class = I2C_CLASS_HWMON;
+	adap->algo = &ki2c_algo;
+	adap->dev.parent = dev;
+
+	i2c_set_adapdata(adap, ki2c);
+
+	/* reset bus before probing I2C devices */
+	ret = ki2c_reset_bus(ki2c);
+	if (ret) {
+		dev_err(dev, "Failed to reset bus (%d)!\n", ret);
+		goto out_disable;
+	}
+
+	ret = i2c_add_adapter(adap);
+	if (ret) {
+		dev_err(dev, "Failed to add adapter (%d)!\n", ret);
+		goto out_disable;
+	}
+
+	ret = ki2c_register_devices(ki2c, pdata);
+	if (ret) {
+		dev_err(dev, "Failed to register devices (%d)!\n", ret);
+		goto out_delete;
+	}
+
+	return 0;
+
+out_delete:
+	i2c_del_adapter(adap);
+out_disable:
+	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
+	return ret;
+}
+
+static int ki2c_remove(struct platform_device *pdev)
+{
+	struct ki2c *ki2c = platform_get_drvdata(pdev);
+
+	ki2c_unregister_devices(ki2c);
+
+	i2c_del_adapter(&ki2c->adapter);
+
+	/* disable controller */
+	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
+
+	platform_set_drvdata(pdev, 0);
+
+	return 0;
+}
+
+static struct platform_device_id ki2c_devtype[] = {
+	{ .name = KI2C },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, ki2c_devtype);
+
+static struct platform_driver ki2c_driver = {
+	.driver = {
+		.name = KI2C,
+	},
+	.probe = ki2c_probe,
+	.remove = ki2c_remove,
+};
+module_platform_driver(ki2c_driver);
+
+MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
+MODULE_DESCRIPTION("KEBA I2C bus controller driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/i2c-keba.h b/include/linux/platform_data/i2c-keba.h
new file mode 100644
index 000000000000..99d54bcb6ed9
--- /dev/null
+++ b/include/linux/platform_data/i2c-keba.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) KEBA AG 2012
+ * Copyright (C) KEBA Industrial Automation Gmbh 2024
+ *
+ * Platform data for KEBA I2C controller FPGA IP core
+ */
+
+#ifndef __LINUX_PLATFORM_DATA_I2C_KEBA_H
+#define __LINUX_PLATFORM_DATA_I2C_KEBA_H
+
+/**
+ * Platform data for KEBA I2C controller
+ *
+ * @info I2C devices to be probed
+ * @info_size size of info array
+ */
+struct i2c_keba_platform_data {
+	struct i2c_board_info *info;
+	int info_size;
+};
+
+#endif /* __LINUX_PLATFORM_DATA_I2C_KEBA_H */
-- 
2.39.2


