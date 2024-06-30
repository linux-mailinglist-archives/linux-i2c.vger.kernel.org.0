Return-Path: <linux-i2c+bounces-4510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6991D415
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jun 2024 23:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E7F4B20DB2
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jun 2024 21:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC6446444;
	Sun, 30 Jun 2024 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="I2a06YO9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx18lb.world4you.com (mx18lb.world4you.com [81.19.149.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A47D3BBED
	for <linux-i2c@vger.kernel.org>; Sun, 30 Jun 2024 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719781344; cv=none; b=aImfP5Zs4YMYYvt6eNn+yq2ttOjy1UwGsWzmGxlK5+glvcpBfPvHOlBaeCmZyaOVO/JNpXhb9cVpi5q1yyz1QVXGAWq5GNC92TsnqyNWDOiXrkKAYvV0RlzNf5l+Aj2aGveG/eZFNe5hIfRyiUqqZ1sdHwi/JYSys7KGNLIVHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719781344; c=relaxed/simple;
	bh=2AYYuyATeFEhaIzzmeJX+pmhgmalAdmMO6gaTeJ0k7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oW9rOvN5Drp7PGwY63kCu41RwKlRr0GhvXgQaLfV6eXMpjbEciMNc9qipRRsWQYTV0Vdsqy8gILqsKfxdGZ79c4AFw1Mc03Sk2ZDxRPWMoDclzURloNMXZ3isq5uFOOUYncr8Ks0nRsKtkwfDgYWe16pu+l1fL5BNiFwb+kgvL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=I2a06YO9; arc=none smtp.client-ip=81.19.149.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cs5bjuctF4VTm2TSpx8+eTNlnVio3h/qRd6iIrY0pvc=; b=I2a06YO9ZPHXGhyitcT6iWz0qV
	7SIoagYjb7NqopOdD3YA+orKiv34S4ZB4x8bylxG75gf/MSKOObznWL66BVOBbvASQlXDVfzvx90a
	Hq+BfkaAoL6FcMuBdF2lkAT+K5+FSn6+Jtng0AuznCnOuqz56tGm4BUVjcQot6P4S8dc=;
Received: from 88-117-61-57.adsl.highway.telekom.at ([88.117.61.57] helo=hornet.engleder.at)
	by mx18lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1sO0Wd-0004cO-0S;
	Sun, 30 Jun 2024 21:47:51 +0200
From: Gerhard Engleder <gerhard@engleder-embedded.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Gerhard Engleder <eg@keba.com>
Subject: [PATCH v2 2/2] i2c: keba: Add KEBA I2C controller support
Date: Sun, 30 Jun 2024 21:47:40 +0200
Message-Id: <20240630194740.7137-3-gerhard@engleder-embedded.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240630194740.7137-1-gerhard@engleder-embedded.com>
References: <20240630194740.7137-1-gerhard@engleder-embedded.com>
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
It is used to connect EEPROMs and hardware monitoring chips. The

It is a simple I2C controller with a fixed bus speed of 100 kbit/s. The
whole message transmission is executed by the driver. The driver
triggers all steps over control, status and data register. There are no
FIFOs or interrupts.

Signed-off-by: Gerhard Engleder <eg@keba.com>
---
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-keba.c | 595 ++++++++++++++++++++++++++++++++++
 3 files changed, 606 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-keba.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 85b57d2ec998..d01aaeb8edbd 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -771,6 +771,16 @@ config I2C_JZ4780
 
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
index 78d0561339e5..ecc07c50f2a0 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_I2C_IMX)		+= i2c-imx.o
 obj-$(CONFIG_I2C_IMX_LPI2C)	+= i2c-imx-lpi2c.o
 obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
+obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
new file mode 100644
index 000000000000..f608df394593
--- /dev/null
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -0,0 +1,595 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) KEBA Industrial Automation Gmbh 2024
+ *
+ * Driver for KEBA I2C controller FPGA IP core
+ */
+
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/misc/keba.h>
+
+#define KI2C "i2c-keba"
+
+#define KI2C_CAPABILITY_REG		0x02
+#define   KI2C_CAPABILITY_CRYPTO	0x01
+#define   KI2C_CAPABILITY_DC		0x02
+
+#define KI2C_CONTROL_REG	0x04
+#define   KI2C_CONTROL_MEN	0x01
+#define   KI2C_CONTROL_MSTA	0x02
+#define   KI2C_CONTROL_RSTA	0x04
+#define   KI2C_CONTROL_MTX	0x08
+#define   KI2C_CONTROL_TXAK	0x10
+
+#define KI2C_CONTROL_DC_REG	0x05
+#define   KI2C_CONTROL_DC_SDA	0x01
+#define   KI2C_CONTROL_DC_SCL	0x02
+
+#define KI2C_STATUS_REG		0x08
+#define   KI2C_STATUS_IN_USE	0x01
+#define   KI2C_STATUS_ACK_CYC	0x02
+#define   KI2C_STATUS_RXAK	0x04
+#define   KI2C_STATUS_MCF	0x08
+
+#define KI2C_STATUS_DC_REG	0x09
+#define   KI2C_STATUS_DC_SDA	0x01
+#define   KI2C_STATUS_DC_SCL	0x02
+
+#define KI2C_DATA_REG		0x0c
+
+#define KI2C_INUSE_SLEEP_US	(2 * USEC_PER_MSEC)
+#define KI2C_INUSE_TIMEOUT_US	(10 * USEC_PER_SEC)
+
+#define KI2C_POLL_DELAY_US	5
+
+struct ki2c {
+	struct keba_i2c_auxdev *auxdev;
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
+	/*
+	 * The I2C controller has an IN_USE bit for locking access to the
+	 * controller. This enables the use of I2C controller by other none
+	 * Linux processors.
+	 *
+	 * If the I2C controller is free, then the first read returns
+	 * IN_USE == 0. After that the I2C controller is locked and further
+	 * reads of IN_USE return 1.
+	 *
+	 * The I2C controller is unlocked by writing 1 into IN_USE.
+	 *
+	 * The IN_USE bit acts as a hardware semaphore for the I2C controller.
+	 * Poll for semaphore, but sleep while polling to free the CPU.
+	 */
+	ret = readb_poll_timeout(ki2c->base + KI2C_STATUS_REG,
+				 sts, (sts & KI2C_STATUS_IN_USE) == 0,
+				 KI2C_INUSE_SLEEP_US, KI2C_INUSE_TIMEOUT_US);
+	if (ret != 0)
+		dev_warn(&ki2c->auxdev->auxdev.dev, "%s err!\n", __func__);
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
+static int ki2c_wait_for_bit(void __iomem *addr, u8 mask, unsigned long timeout)
+{
+	u8 val;
+
+	return readb_poll_timeout(addr, val, (val & mask), KI2C_POLL_DELAY_US,
+				  jiffies_to_usecs(timeout));
+}
+
+static int ki2c_wait_for_mcf(struct ki2c *ki2c)
+{
+	return ki2c_wait_for_bit(ki2c->base + KI2C_STATUS_REG, KI2C_STATUS_MCF,
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
+	return ki2c_wait_for_bit(ki2c->base + KI2C_STATUS_REG,
+				 KI2C_STATUS_ACK_CYC,
+				 ki2c->adapter.timeout);
+}
+
+static int ki2c_wait_for_data_ack(struct ki2c *ki2c)
+{
+	unsigned int reg;
+	int ret;
+
+	ret = ki2c_wait_for_data(ki2c);
+	if (ret < 0)
+		return ret;
+
+	/* RXAK == 0 means ACK reveived */
+	reg = ioread8(ki2c->base + KI2C_STATUS_REG);
+	if (reg & KI2C_STATUS_RXAK)
+		return -EIO;
+
+	return 0;
+}
+
+static int ki2c_has_capability(struct ki2c *ki2c, unsigned int cap)
+{
+	unsigned int reg = ioread8(ki2c->base + KI2C_CAPABILITY_REG);
+
+	return (reg & cap) != 0;
+}
+
+static int ki2c_get_scl(struct ki2c *ki2c)
+{
+	unsigned int reg = ioread8(ki2c->base + KI2C_STATUS_DC_REG);
+
+	/* capability KI2C_CAPABILITY_DC required */
+	return (reg & KI2C_STATUS_DC_SCL) != 0;
+}
+
+static int ki2c_get_sda(struct ki2c *ki2c)
+{
+	unsigned int reg = ioread8(ki2c->base + KI2C_STATUS_DC_REG);
+
+	/* capability KI2C_CAPABILITY_DC required */
+	return (reg & KI2C_STATUS_DC_SDA) != 0;
+}
+
+static void ki2c_set_scl(struct ki2c *ki2c, int val)
+{
+	u8 control_dc;
+
+	/* capability KI2C_CAPABILITY_DC and KI2C_CONTROL_MEN = 0 reqired */
+	control_dc = ioread8(ki2c->base + KI2C_CONTROL_DC_REG);
+	if (val)
+		control_dc |= KI2C_CONTROL_DC_SCL;
+	else
+		control_dc &= ~KI2C_CONTROL_DC_SCL;
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
+				dev_err(&ki2c->auxdev->auxdev.dev,
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
+		dev_err(&ki2c->auxdev->auxdev.dev, "SDA is still low!\n");
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
+	if (ret < 0) {
+		dev_err(&ki2c->auxdev->auxdev.dev, "Start condition failed\n");
+
+		return ret;
+	}
+
+	/* create stop condition */
+	iowrite8(KI2C_CONTROL_MEN | KI2C_CONTROL_MTX | KI2C_CONTROL_TXAK,
+		 ki2c->base + KI2C_CONTROL_REG);
+	ret = ki2c_wait_for_mcf(ki2c);
+	if (ret < 0)
+		dev_err(&ki2c->auxdev->auxdev.dev, "Stop condition failed\n");
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
+	/*
+	 * If the I2C controller is capable of direct control of SCL/SDA, then a
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
+	/*
+	 * Store target address byte in the controller. This has to be done
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
+		/*
+		 * For EEPROMs this is normal behavior during internal write
+		 * operation.
+		 */
+		dev_dbg(&ki2c->auxdev->auxdev.dev,
+			"%s wait for ACK err at 0x%02x!\n", __func__, m->addr);
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
+		dev_warn(&ki2c->auxdev->auxdev.dev,
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
+		dev_warn(&ki2c->auxdev->auxdev.dev,
+			 "%s wait for MCF err at 0x%02x!\n", __func__, m->addr);
+		return ret;
+	}
+
+	/* write target-address byte */
+	ki2c_write_target_addr(ki2c, m);
+
+	ret = ki2c_wait_for_data_ack(ki2c);
+	if (ret < 0)
+		dev_warn(&ki2c->auxdev->auxdev.dev,
+			 "%s wait for ACK err at 0x%02x!\n", __func__, m->addr);
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
+		/*
+		 * switch to TX on last byte, so that reading DATA-register
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
+static int ki2c_register_devices(struct ki2c *ki2c)
+{
+	struct i2c_board_info *info = ki2c->auxdev->info;
+
+	/* register all I2C devices from platform_data array */
+	for (int i = 0; i < ki2c->client_size; i++) {
+		struct i2c_client *client;
+		unsigned short const addr_list[2] = { info[i].addr,
+						      I2C_CLIENT_END };
+
+		client = i2c_new_scanned_device(&ki2c->adapter, &info[i],
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
+static int ki2c_probe(struct auxiliary_device *auxdev,
+		      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &auxdev->dev;
+	struct i2c_adapter *adap;
+	struct ki2c *ki2c;
+	int ret;
+
+	ki2c = devm_kzalloc(dev, sizeof(*ki2c), GFP_KERNEL);
+	if (!ki2c)
+		return -ENOMEM;
+	ki2c->auxdev = container_of(auxdev, struct keba_i2c_auxdev, auxdev);
+	ki2c->client = devm_kcalloc(dev, ki2c->auxdev->info_size,
+				    sizeof(*ki2c->client), GFP_KERNEL);
+	if (!ki2c->client)
+		return -ENOMEM;
+	ki2c->client_size = ki2c->auxdev->info_size;
+	auxiliary_set_drvdata(auxdev, ki2c);
+
+	ki2c->base = devm_ioremap_resource(dev, &ki2c->auxdev->io);
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
+	if (ret)
+		goto out_disable;
+
+	ret = i2c_add_adapter(adap);
+	if (ret) {
+		dev_err(dev, "Failed to add adapter (%d)!\n", ret);
+		goto out_disable;
+	}
+
+	ret = ki2c_register_devices(ki2c);
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
+static void ki2c_remove(struct auxiliary_device *auxdev)
+{
+	struct ki2c *ki2c = auxiliary_get_drvdata(auxdev);
+
+	ki2c_unregister_devices(ki2c);
+
+	i2c_del_adapter(&ki2c->adapter);
+
+	/* disable controller */
+	iowrite8(0, ki2c->base + KI2C_CONTROL_REG);
+
+	auxiliary_set_drvdata(auxdev, NULL);
+}
+
+static const struct auxiliary_device_id ki2c_devtype_aux[] = {
+	{ .name = "keba.i2c" },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, ki2c_devtype_aux);
+
+static struct auxiliary_driver ki2c_driver_aux = {
+	.name = KI2C,
+	.id_table = ki2c_devtype_aux,
+	.probe = ki2c_probe,
+	.remove = ki2c_remove,
+};
+module_auxiliary_driver(ki2c_driver_aux);
+
+MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
+MODULE_DESCRIPTION("KEBA I2C bus controller driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2


