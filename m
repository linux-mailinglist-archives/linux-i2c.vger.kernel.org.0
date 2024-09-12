Return-Path: <linux-i2c+bounces-6647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E592977094
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6351528868F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D571C2DC0;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBgovuk4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4711C245C;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=Z77oj/vo73MUMiq0yIqC8cre1KDHeQeeXQ1oT1pHJSv0sb/WmiSBdqpu3orDrymVZaFkmXozUnDSZXDG6yeLJIYQOGWpwtyoxVUE1iQw1oeirdCvwMKTvtdkQHIgUwioESDqUVzF2RkH2Wn+lX7B2jXe5Q1b3ZZ3MAkHxZ9hPuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=oSjrrK3HqKhPT33RcO6IzP0otSDj5oLxA3L//E5mLLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlLosKJTPuFyZbHUmAisqMVXNf34Z2lRbSMaGONRO1ahOX4t5TuRlAipxD2weGVnwfXq0GvOzK36gUxZrQvaDgnvIK2h2ROV52xCqwjHgNzVxkxpkgcYibJT2BAG6s9qeLIakV7/9Jk1izZdNMEBhUv2BJqpp60+NtvW2lsXLNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBgovuk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A5D9C4DE1D;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=oSjrrK3HqKhPT33RcO6IzP0otSDj5oLxA3L//E5mLLM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=ZBgovuk4Hmeg31duJmpMD5IkpfU1yqAXvOUqprtaGW7lnQ/i4A7hMLDuaVdTTfmdl
	 xm0uyrsh6hsIHwYn7AjuDjUi8POBe3jhXSUomB0l5MbYL3d3hrzR0S649xhYSdcBHD
	 zgihQ9G35kZ6Ax5wrDNHT7LNKuUK/CCtIZUQInDl4d4oe3QttARxl315wZDlTPCXjC
	 Sxg77EdYyLhxzuyZrI3D0hot7hsgXJIRguMhvA2gL69DuwauG8twOk1SR65NMBaL2+
	 Og4tAeP6bVsSKEDED4ea3Ecft9pU2rAGTcxgsxZzjQ7soFrR4SqRUftBIeHvID5/EW
	 R0J+i569YU2zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E269EEE25C;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:00 +0100
Subject: [PATCH 15/21] i2c: Add driver for ADI ADSP-SC5xx platforms
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-test-v1-15-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=30323;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=3JNx5RiekCNc4Kpql+FHMF5vouOGWncXg0juhBgUj+k=;
 b=6/RCpfUMh/Zue+vifS5T5HepAnaEA6vIxJmq7ObeaWwcWW79yzW3TpgFjeP61ysJTAof/L/un
 UNPr8cBh6ohDBn4LpmAAXKg0qKhzapdh46srJPDla/DB9jGsu4Dn4mn
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add support for I2C on SC5xx

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
---
 drivers/i2c/busses/Kconfig       |  17 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-adi-twi.c | 940 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 958 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a723b31925fd86b26ef0b8d3b8a19..f672a2c715ca15ece74ee694596318976da88dfd 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -518,6 +518,23 @@ config I2C_BRCMSTB
 
 	  If you do not need I2C interface, say N.
 
+config I2C_ADI_TWI
+     tristate "ADI TWI I2C support"
+     depends on ARCH_SC59X_64 || ARCH_SC59X
+     help
+       This is the I2C bus driver for ADI on-chip TWI interface.
+
+       This driver can also be built as a module.  If so, the module
+       will be called i2c-adi-twi.
+
+config I2C_ADI_TWI_CLK_KHZ
+    int "ADI TWI I2C clock (kHz)"
+    depends on I2C_ADI_TWI
+    range 21 400
+    default 50
+    help
+      The unit of the TWI clock is kHz.
+
 config I2C_CADENCE
 	tristate "Cadence I2C Controller"
 	depends on ARCH_ZYNQ || ARM64 || XTENSA || RISCV || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 78d0561339e5beadcb810196be1139a4248469b4..421d637cfbc91af5a69895e76a255b2ef47f4081 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
 obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
 obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
 obj-$(CONFIG_I2C_BCM_IPROC)	+= i2c-bcm-iproc.o
+obj-$(CONFIG_I2C_ADI_TWI)	+= i2c-adi-twi.o
 obj-$(CONFIG_I2C_CADENCE)	+= i2c-cadence.o
 obj-$(CONFIG_I2C_CBUS_GPIO)	+= i2c-cbus-gpio.o
 obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
diff --git a/drivers/i2c/busses/i2c-adi-twi.c b/drivers/i2c/busses/i2c-adi-twi.c
new file mode 100644
index 0000000000000000000000000000000000000000..4af3991f5fc8709df196f58816ed7a96fd1dac2d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-adi-twi.c
@@ -0,0 +1,940 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ADI On-Chip Two Wire Interface Driver
+ *
+ * Copyright 2022-2024 - Analog Devices Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+#include <linux/of_device.h>
+#include <linux/clk.h>
+
+
+/* TWI_PRESCALE Masks */
+#define	TWI_ENA		0x0080	/* TWI Enable */
+
+/* TWI_MASTER_CTL Masks	*/
+#define	MEN		0x0001	/* Master Mode Enable          */
+#define	MDIR		0x0004	/* Master Transmit Direction (RX/TX*) */
+#define	FAST		0x0008	/* Use Fast Mode Timing Specs  */
+#define	STOP		0x0010	/* Issue Stop Condition        */
+#define	RSTART		0x0020	/* Repeat Start or Stop* At End Of Transfer */
+#define	SDAOVR		0x4000	/* Serial Data Override        */
+#define	SCLOVR		0x8000	/* Serial Clock Override       */
+
+/* TWI_MASTER_STAT Masks */
+#define	LOSTARB		0x0002	/* Lost Arbitration Indicator (Xfer Aborted) */
+#define	ANAK		0x0004	/* Address Not Acknowledged    */
+#define	DNAK		0x0008	/* Data Not Acknowledged       */
+#define	BUFRDERR	0x0010	/* Buffer Read Error           */
+#define	BUFWRERR	0x0020	/* Buffer Write Error          */
+#define	SDASEN		0x0040	/* Serial Data Sense           */
+#define	BUSBUSY		0x0100	/* Bus Busy Indicator          */
+
+/* TWI_INT_SRC and TWI_INT_ENABLE Masks	*/
+#define	MCOMP		0x0010	/* Master Transfer Complete    */
+#define	MERR		0x0020	/* Master Transfer Error       */
+#define	XMTSERV		0x0040	/* Transmit FIFO Service       */
+#define	RCVSERV		0x0080	/* Receive FIFO Service        */
+
+/* TWI_FIFO_STAT Masks */
+#define	XMTSTAT		0x0003	/* Transmit FIFO Status                  */
+#define	XMT_FULL	0x0003	/* Transmit FIFO Full (2 Bytes To Write) */
+#define	RCVSTAT		0x000C	/* Receive FIFO Status                   */
+
+/* SMBus mode*/
+#define TWI_I2C_MODE_STANDARD		1
+#define TWI_I2C_MODE_STANDARDSUB	2
+#define TWI_I2C_MODE_COMBINED		3
+#define TWI_I2C_MODE_REPEAT		4
+
+/*
+ * ADI twi registers layout
+ */
+struct adi_twi_regs {
+	u16 clkdiv;
+	u16 dummy1;
+	u16 control;
+	u16 dummy2;
+	u16 slave_ctl;
+	u16 dummy3;
+	u16 slave_stat;
+	u16 dummy4;
+	u16 slave_addr;
+	u16 dummy5;
+	u16 master_ctl;
+	u16 dummy6;
+	u16 master_stat;
+	u16 dummy7;
+	u16 master_addr;
+	u16 dummy8;
+	u16 int_stat;
+	u16 dummy9;
+	u16 int_mask;
+	u16 dummy10;
+	u16 fifo_ctl;
+	u16 dummy11;
+	u16 fifo_stat;
+	u16 dummy12;
+	u32 __pad[20];
+	u16 xmt_data8;
+	u16 dummy13;
+	u16 xmt_data16;
+	u16 dummy14;
+	u16 rcv_data8;
+	u16 dummy15;
+	u16 rcv_data16;
+	u16 dummy16;
+};
+
+struct adi_twi_iface {
+	int			irq;
+	spinlock_t		lock;
+	char			read_write;
+	u8			command;
+	u8			*transPtr;
+	int			readNum;
+	int			writeNum;
+	int			cur_mode;
+	int			manual_stop;
+	int			result;
+	unsigned int		twi_clk;
+	struct i2c_adapter	adap;
+	struct completion	complete;
+	struct i2c_msg		*pmsg;
+	int			msg_num;
+	int			cur_msg;
+	u16			saved_clkdiv;
+	u16			saved_control;
+	struct adi_twi_regs __iomem *regs_base;
+	struct clk *sclk;
+};
+
+static void adi_twi_handle_interrupt(struct adi_twi_iface *iface,
+					unsigned short twi_int_status,
+					bool polling)
+{
+	u16 writeValue;
+	unsigned short mast_stat = ioread16(&iface->regs_base->master_stat);
+
+	if (twi_int_status & XMTSERV) {
+		if (iface->writeNum <= 0) {
+			/* start receive immediately after complete sending in
+			 * combine mode.
+			 */
+			if (iface->cur_mode == TWI_I2C_MODE_COMBINED) {
+				writeValue = ioread16(&iface->regs_base->master_ctl) | MDIR;
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+			} else if (iface->manual_stop) {
+				writeValue = ioread16(&iface->regs_base->master_ctl) | STOP;
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+			} else if (iface->cur_mode == TWI_I2C_MODE_REPEAT &&
+				   iface->cur_msg + 1 < iface->msg_num) {
+
+				if (iface->pmsg[iface->cur_msg + 1].flags & I2C_M_RD) {
+					writeValue = ioread16(&iface->regs_base->master_ctl)
+							      | MDIR;
+					iowrite16(writeValue, &iface->regs_base->master_ctl);
+				} else {
+					writeValue = ioread16(&iface->regs_base->master_ctl)
+							      & ~MDIR;
+					iowrite16(writeValue, &iface->regs_base->master_ctl);
+				}
+
+			}
+		}
+		/* Transmit next data */
+		while (iface->writeNum > 0 &&
+		       (ioread16(&iface->regs_base->fifo_stat) & XMTSTAT) != XMT_FULL) {
+			iowrite16(*(iface->transPtr++), &iface->regs_base->xmt_data8);
+			iface->writeNum--;
+		}
+	}
+	if (twi_int_status & RCVSERV) {
+		while (iface->readNum > 0 &&
+		       (ioread16(&iface->regs_base->fifo_stat) & RCVSTAT)) {
+			/* Receive next data */
+			*(iface->transPtr) = ioread16(&iface->regs_base->rcv_data8);
+			if (iface->cur_mode == TWI_I2C_MODE_COMBINED) {
+				/* Change combine mode into sub mode after
+				 * read first data.
+				 */
+				iface->cur_mode = TWI_I2C_MODE_STANDARDSUB;
+				/* Get read number from first byte in block
+				 * combine mode.
+				 */
+				if (iface->readNum == 1 && iface->manual_stop)
+					iface->readNum = *iface->transPtr + 1;
+			}
+			iface->transPtr++;
+			iface->readNum--;
+		}
+
+		if (iface->readNum == 0) {
+			if (iface->manual_stop) {
+				/* Temporary workaround to avoid possible bus stall -
+				 * Flush FIFO before issuing the STOP condition
+				 */
+				ioread16(&iface->regs_base->rcv_data16);
+				writeValue = ioread16(&iface->regs_base->master_ctl) | STOP;
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+			} else if (iface->cur_mode == TWI_I2C_MODE_REPEAT &&
+					iface->cur_msg + 1 < iface->msg_num) {
+				if (iface->pmsg[iface->cur_msg + 1].flags & I2C_M_RD) {
+					writeValue = ioread16(&iface->regs_base->master_ctl) |
+						     MDIR;
+					iowrite16(writeValue, &iface->regs_base->master_ctl);
+				} else {
+					writeValue = ioread16(&iface->regs_base->master_ctl) &
+						     ~MDIR;
+					iowrite16(writeValue, &iface->regs_base->master_ctl);
+				}
+			}
+		}
+	}
+	if (twi_int_status & MERR) {
+		iowrite16(0, &iface->regs_base->int_mask);
+		iowrite16(0x3e, &iface->regs_base->master_stat);
+		iowrite16(0, &iface->regs_base->master_ctl);
+		iface->result = -EIO;
+
+		if (mast_stat & LOSTARB)
+			dev_dbg(&iface->adap.dev, "Lost Arbitration\n");
+		if (mast_stat & ANAK)
+			dev_dbg(&iface->adap.dev, "Address Not Acknowledged\n");
+		if (mast_stat & DNAK)
+			dev_dbg(&iface->adap.dev, "Data Not Acknowledged\n");
+		if (mast_stat & BUFRDERR)
+			dev_dbg(&iface->adap.dev, "Buffer Read Error\n");
+		if (mast_stat & BUFWRERR)
+			dev_dbg(&iface->adap.dev, "Buffer Write Error\n");
+
+		/* Faulty slave devices, may drive SDA low after a transfer
+		 * finishes. To release the bus this code generates up to 9
+		 * extra clocks until SDA is released.
+		 */
+
+		if (ioread16(&iface->regs_base->master_stat) & SDASEN) {
+			int cnt = 9;
+
+			do {
+				iowrite16(SCLOVR, &iface->regs_base->master_ctl);
+				udelay(6);
+				iowrite16(0, &iface->regs_base->master_ctl);
+				udelay(6);
+			} while ((ioread16(&iface->regs_base->master_stat) & SDASEN) && cnt--);
+
+			iowrite16(SDAOVR | SCLOVR, &iface->regs_base->master_ctl);
+			udelay(6);
+			iowrite16(SDAOVR, &iface->regs_base->master_ctl);
+			udelay(6);
+			iowrite16(0, &iface->regs_base->master_ctl);
+		}
+
+		/* If it is a quick transfer, only address without data,
+		 * not an err, return 1.
+		 */
+		if (iface->cur_mode == TWI_I2C_MODE_STANDARD &&
+			iface->transPtr == NULL &&
+			(twi_int_status & MCOMP) && (mast_stat & DNAK))
+			iface->result = 1;
+
+		if (!polling)
+			complete(&iface->complete);
+		return;
+	}
+	if (twi_int_status & MCOMP) {
+		if (twi_int_status & (XMTSERV | RCVSERV) &&
+			(ioread16(&iface->regs_base->master_ctl) & MEN) == 0 &&
+			(iface->cur_mode == TWI_I2C_MODE_REPEAT ||
+			iface->cur_mode == TWI_I2C_MODE_COMBINED)) {
+			iface->result = -1;
+			iowrite16(0, &iface->regs_base->int_mask);
+			iowrite16(0, &iface->regs_base->master_ctl);
+		} else if (iface->cur_mode == TWI_I2C_MODE_COMBINED) {
+			if (iface->readNum == 0) {
+				/* set the read number to 1 and ask for manual
+				 * stop in block combine mode
+				 */
+				iface->readNum = 1;
+				iface->manual_stop = 1;
+				writeValue = ioread16(&iface->regs_base->master_ctl) | (0xff << 6);
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+			} else {
+				/* set the readd number in other
+				 * combine mode.
+				 */
+				writeValue = (ioread16(&iface->regs_base->master_ctl)
+					     & (~(0xff << 6))) | (iface->readNum << 6);
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+			}
+			/* remove restart bit and enable master receive */
+			writeValue = ioread16(&iface->regs_base->master_ctl) & ~RSTART;
+			iowrite16(writeValue, &iface->regs_base->master_ctl);
+		} else if (iface->cur_mode == TWI_I2C_MODE_REPEAT &&
+				iface->cur_msg + 1 < iface->msg_num) {
+			iface->cur_msg++;
+			iface->transPtr = iface->pmsg[iface->cur_msg].buf;
+			iface->writeNum = iface->readNum =
+				iface->pmsg[iface->cur_msg].len;
+			/* Set Transmit device address */
+			iowrite16(iface->pmsg[iface->cur_msg].addr, &iface->regs_base->master_addr);
+			if (iface->pmsg[iface->cur_msg].flags & I2C_M_RD)
+				iface->read_write = I2C_SMBUS_READ;
+			else {
+				iface->read_write = I2C_SMBUS_WRITE;
+				/* Transmit first data */
+				if (iface->writeNum > 0) {
+					iowrite16(*(iface->transPtr++),
+						 &iface->regs_base->xmt_data8);
+					iface->writeNum--;
+				}
+			}
+
+			if (iface->pmsg[iface->cur_msg].len <= 255) {
+				writeValue = (ioread16(&iface->regs_base->master_ctl)
+					     & (~(0xff << 6)))
+					     | (iface->pmsg[iface->cur_msg].len << 6);
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+				iface->manual_stop = 0;
+			} else {
+				writeValue = (ioread16(&iface->regs_base->master_ctl)
+					     | (0xff << 6));
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+				iface->manual_stop = 1;
+			}
+
+			/* remove restart bit before last message */
+			if (iface->cur_msg + 1 == iface->msg_num) {
+				writeValue = ioread16(&iface->regs_base->master_ctl) & ~RSTART;
+				iowrite16(writeValue, &iface->regs_base->master_ctl);
+			}
+
+		} else {
+			iface->result = 1;
+			iowrite16(0, &iface->regs_base->int_mask);
+			iowrite16(0, &iface->regs_base->master_ctl);
+		}
+		if (!polling)
+			complete(&iface->complete);
+	}
+}
+
+/* Interrupt handler */
+static irqreturn_t adi_twi_handle_all_interrupts(struct adi_twi_iface *iface,
+						 bool polling)
+{
+	irqreturn_t handled = IRQ_NONE;
+	unsigned short twi_int_status;
+
+	while (1) {
+		twi_int_status = ioread16(&iface->regs_base->int_stat);
+		if (!twi_int_status)
+			return handled;
+		/* Clear interrupt status */
+		iowrite16(twi_int_status, &iface->regs_base->int_stat);
+		adi_twi_handle_interrupt(iface, twi_int_status, polling);
+		handled = IRQ_HANDLED;
+	}
+}
+
+static irqreturn_t adi_twi_interrupt_entry(int irq, void *dev_id)
+{
+	struct adi_twi_iface *iface = dev_id;
+	unsigned long flags;
+	irqreturn_t handled;
+
+	spin_lock_irqsave(&iface->lock, flags);
+	handled = adi_twi_handle_all_interrupts(iface, false);
+	spin_unlock_irqrestore(&iface->lock, flags);
+	return handled;
+}
+
+/*
+ * One i2c master transfer
+ */
+static int adi_twi_do_master_xfer(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num, bool polling)
+{
+	struct adi_twi_iface *iface = adap->algo_data;
+	struct i2c_msg *pmsg;
+	int rc = 0;
+	u16 writeValue;
+
+	if (!(ioread16(&iface->regs_base->control) & TWI_ENA))
+		return -ENXIO;
+
+	if (ioread16(&iface->regs_base->master_stat) & BUSBUSY)
+		return -EAGAIN;
+
+	iface->pmsg = msgs;
+	iface->msg_num = num;
+	iface->cur_msg = 0;
+
+	pmsg = &msgs[0];
+	if (pmsg->flags & I2C_M_TEN) {
+		dev_err(&adap->dev, "10 bits addr not supported!\n");
+		return -EINVAL;
+	}
+
+	if (iface->msg_num > 1)
+		iface->cur_mode = TWI_I2C_MODE_REPEAT;
+	iface->manual_stop = 0;
+	iface->transPtr = pmsg->buf;
+	iface->writeNum = iface->readNum = pmsg->len;
+	iface->result = 0;
+	if (!polling)
+		init_completion(&(iface->complete));
+	/* Set Transmit device address */
+	iowrite16(pmsg->addr, &iface->regs_base->master_addr);
+
+	/* FIFO Initiation. Data in FIFO should be
+	 *  discarded before start a new operation.
+	 */
+	iowrite16(0x3, &iface->regs_base->fifo_ctl);
+	iowrite16(0, &iface->regs_base->fifo_ctl);
+
+	if (pmsg->flags & I2C_M_RD)
+		iface->read_write = I2C_SMBUS_READ;
+	else {
+		iface->read_write = I2C_SMBUS_WRITE;
+		/* Transmit first data */
+		if (iface->writeNum > 0) {
+			iowrite16(*(iface->transPtr++), &iface->regs_base->xmt_data8);
+			iface->writeNum--;
+		}
+	}
+
+	/* clear int stat */
+	iowrite16(MERR | MCOMP | XMTSERV | RCVSERV, &iface->regs_base->int_stat);
+
+	/* Interrupt mask . Enable XMT, RCV interrupt */
+	iowrite16(MCOMP | MERR | RCVSERV | XMTSERV, &iface->regs_base->int_mask);
+
+	if (pmsg->len <= 255)
+		iowrite16(pmsg->len << 6, &iface->regs_base->master_ctl);
+	else {
+		iowrite16(0xff << 6, &iface->regs_base->master_ctl);
+		iface->manual_stop = 1;
+	}
+
+	/* Master enable */
+	writeValue = ioread16(&iface->regs_base->master_ctl) |
+		     MEN |
+		     ((iface->msg_num > 1) ? RSTART : 0) |
+		     ((iface->read_write == I2C_SMBUS_READ) ? MDIR : 0) |
+		     ((iface->twi_clk > 100) ? FAST : 0);
+
+	iowrite16(writeValue, &iface->regs_base->master_ctl);
+
+	if (polling) {
+		int timeout = 50000;
+
+		for (;;) {
+			irqreturn_t handled = adi_twi_handle_all_interrupts(
+								iface, true);
+			if (handled == IRQ_HANDLED && iface->result)
+				break;
+			if (--timeout == 0) {
+				iface->result = -1;
+				dev_err(&adap->dev, "master polling timeout");
+				break;
+			}
+		}
+	} else { /* interrupt driven */
+		while (!iface->result) {
+			if (!wait_for_completion_timeout(&iface->complete,
+				adap->timeout)) {
+				iface->result = -1;
+				dev_err(&adap->dev, "master transfer timeout");
+			}
+		}
+	}
+
+	if (iface->result == 1)
+		rc = iface->cur_msg + 1;
+	else
+		rc = iface->result;
+
+	return rc;
+}
+
+/*
+ * Generic i2c master transfer entrypoint
+ */
+static int adi_twi_master_xfer(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num)
+{
+	return adi_twi_do_master_xfer(adap, msgs, num, false);
+}
+
+static int adi_twi_master_xfer_atomic(struct i2c_adapter *adap,
+				struct i2c_msg *msgs, int num)
+{
+	return adi_twi_do_master_xfer(adap, msgs, num, true);
+}
+
+/*
+ * One I2C SMBus transfer
+ */
+static int adi_twi_do_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+			unsigned short flags, char read_write,
+			u8 command, int size, union i2c_smbus_data *data,
+			bool polling)
+{
+	struct adi_twi_iface *iface = adap->algo_data;
+	int rc = 0;
+	u16 writeValue;
+
+	if (!(ioread16(&iface->regs_base->control) & TWI_ENA))
+		return -ENXIO;
+
+	if (ioread16(&iface->regs_base->master_stat) & BUSBUSY)
+		return -EAGAIN;
+
+	iface->writeNum = 0;
+	iface->readNum = 0;
+
+	/* Prepare datas & select mode */
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		iface->transPtr = NULL;
+		iface->cur_mode = TWI_I2C_MODE_STANDARD;
+		break;
+	case I2C_SMBUS_BYTE:
+		if (data == NULL)
+			iface->transPtr = NULL;
+		else {
+			if (read_write == I2C_SMBUS_READ)
+				iface->readNum = 1;
+			else
+				iface->writeNum = 1;
+			iface->transPtr = &data->byte;
+		}
+		iface->cur_mode = TWI_I2C_MODE_STANDARD;
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			iface->readNum = 1;
+			iface->cur_mode = TWI_I2C_MODE_COMBINED;
+		} else {
+			iface->writeNum = 1;
+			iface->cur_mode = TWI_I2C_MODE_STANDARDSUB;
+		}
+		iface->transPtr = &data->byte;
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			iface->readNum = 2;
+			iface->cur_mode = TWI_I2C_MODE_COMBINED;
+		} else {
+			iface->writeNum = 2;
+			iface->cur_mode = TWI_I2C_MODE_STANDARDSUB;
+		}
+		iface->transPtr = (u8 *)&data->word;
+		break;
+	case I2C_SMBUS_PROC_CALL:
+		iface->writeNum = 2;
+		iface->readNum = 2;
+		iface->cur_mode = TWI_I2C_MODE_COMBINED;
+		iface->transPtr = (u8 *)&data->word;
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			iface->readNum = 0;
+			iface->cur_mode = TWI_I2C_MODE_COMBINED;
+		} else {
+			iface->writeNum = data->block[0] + 1;
+			iface->cur_mode = TWI_I2C_MODE_STANDARDSUB;
+		}
+		iface->transPtr = data->block;
+		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (read_write == I2C_SMBUS_READ) {
+			iface->readNum = data->block[0];
+			iface->cur_mode = TWI_I2C_MODE_COMBINED;
+		} else {
+			iface->writeNum = data->block[0];
+			iface->cur_mode = TWI_I2C_MODE_STANDARDSUB;
+		}
+		iface->transPtr = (u8 *)&data->block[1];
+		break;
+	default:
+		return -1;
+	}
+
+	iface->result = 0;
+	iface->manual_stop = 0;
+	iface->read_write = read_write;
+	iface->command = command;
+	if (!polling)
+		init_completion(&(iface->complete));
+
+	/* FIFO Initiation. Data in FIFO should be discarded before
+	 * start a new operation.
+	 */
+	iowrite16(0x3, &iface->regs_base->fifo_ctl);
+	iowrite16(0, &iface->regs_base->fifo_ctl);
+
+	/* clear int stat */
+	iowrite16(MERR | MCOMP | XMTSERV | RCVSERV, &iface->regs_base->int_stat);
+
+	/* Set Transmit device address */
+	iowrite16(addr, &iface->regs_base->master_addr);
+
+	switch (iface->cur_mode) {
+	case TWI_I2C_MODE_STANDARDSUB:
+		iowrite16(iface->command, &iface->regs_base->xmt_data8);
+
+		writeValue = MCOMP | MERR;
+		if (iface->read_write == I2C_SMBUS_READ)
+			writeValue |= RCVSERV;
+		else
+			writeValue |= XMTSERV;
+
+		iowrite16(writeValue, &iface->regs_base->int_mask);
+
+		if (iface->writeNum + 1 <= 255)
+			iowrite16((iface->writeNum + 1) << 6, &iface->regs_base->master_ctl);
+		else {
+			iowrite16(0xff << 6, &iface->regs_base->master_ctl);
+			iface->manual_stop = 1;
+		}
+		/* Master enable */
+		writeValue = ioread16(&iface->regs_base->master_ctl) | MEN;
+		if (iface->twi_clk > 100)
+			writeValue |= FAST;
+		iowrite16(writeValue, &iface->regs_base->master_ctl);
+		break;
+	case TWI_I2C_MODE_COMBINED:
+		iowrite16(iface->command, &iface->regs_base->xmt_data8);
+		iowrite16(MCOMP | MERR | RCVSERV | XMTSERV, &iface->regs_base->int_mask);
+
+		if (iface->writeNum > 0)
+			iowrite16((iface->writeNum + 1) << 6, &iface->regs_base->master_ctl);
+		else
+			iowrite16(0x1 << 6, &iface->regs_base->master_ctl);
+		/* Master enable */
+		writeValue = ioread16(&iface->regs_base->master_ctl) | MEN | RSTART;
+		if (iface->twi_clk > 100)
+			writeValue |= FAST;
+		iowrite16(writeValue, &iface->regs_base->master_ctl);
+		break;
+	default:
+		iowrite16(0, &iface->regs_base->master_ctl);
+		if (size != I2C_SMBUS_QUICK) {
+			/* Don't access xmit data register when this is a
+			 * read operation.
+			 */
+			if (iface->read_write != I2C_SMBUS_READ) {
+				if (iface->writeNum > 0) {
+					iowrite16(*(iface->transPtr++),
+						  &iface->regs_base->xmt_data8);
+					if (iface->writeNum <= 255)
+						iowrite16(iface->writeNum << 6,
+							  &iface->regs_base->master_ctl);
+					else {
+						iowrite16(0xff << 6, &iface->regs_base->master_ctl);
+						iface->manual_stop = 1;
+					}
+					iface->writeNum--;
+				} else {
+					iowrite16(iface->command, &iface->regs_base->xmt_data8);
+					iowrite16(1 << 6, &iface->regs_base->master_ctl);
+				}
+			} else {
+				if (iface->readNum > 0 && iface->readNum <= 255)
+					iowrite16(iface->readNum << 6,
+						  &iface->regs_base->master_ctl);
+				else if (iface->readNum > 255) {
+					iowrite16(0xff << 6, &iface->regs_base->master_ctl);
+					iface->manual_stop = 1;
+				} else
+					break;
+			}
+		}
+		writeValue = MCOMP | MERR;
+		if (iface->read_write == I2C_SMBUS_READ)
+			writeValue |= RCVSERV;
+		else
+			writeValue |= XMTSERV;
+		iowrite16(writeValue, &iface->regs_base->int_mask);
+
+		/* Master enable */
+		writeValue = ioread16(&iface->regs_base->master_ctl) | MEN |
+			     ((iface->read_write == I2C_SMBUS_READ) ? MDIR : 0) |
+			     ((iface->twi_clk > 100) ? FAST : 0);
+		iowrite16(writeValue, &iface->regs_base->master_ctl);
+		break;
+	}
+
+	if (polling) {
+		int timeout = 50000;
+
+		for (;;) {
+			irqreturn_t handled = adi_twi_handle_all_interrupts(
+								iface, true);
+			if (handled == IRQ_HANDLED && iface->result)
+				break;
+			if (--timeout == 0) {
+				iface->result = -1;
+				dev_err(&adap->dev, "smbus polling timeout");
+				break;
+			}
+		}
+	} else { /* interrupt driven */
+		while (!iface->result) {
+			if (!wait_for_completion_timeout(&iface->complete,
+				adap->timeout)) {
+				iface->result = -1;
+				dev_err(&adap->dev, "smbus transfer timeout");
+			}
+		}
+	}
+
+	rc = (iface->result >= 0) ? 0 : -1;
+
+	return rc;
+}
+
+/*
+ * Generic I2C SMBus transfer entrypoint
+ */
+static int adi_twi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+			unsigned short flags, char read_write,
+			u8 command, int size, union i2c_smbus_data *data)
+{
+	return adi_twi_do_smbus_xfer(adap, addr, flags,
+			read_write, command, size, data, false);
+}
+
+static int adi_twi_smbus_xfer_atomic(struct i2c_adapter *adap, u16 addr,
+			unsigned short flags, char read_write,
+			u8 command, int size, union i2c_smbus_data *data)
+{
+	return adi_twi_do_smbus_xfer(adap, addr, flags,
+			read_write, command, size, data, true);
+}
+
+/*
+ * Return what the adapter supports
+ */
+static u32 adi_twi_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
+	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_PROC_CALL |
+	       I2C_FUNC_I2C | I2C_FUNC_SMBUS_I2C_BLOCK;
+}
+
+static const struct i2c_algorithm adi_twi_algorithm = {
+	.master_xfer	    = adi_twi_master_xfer,
+	.master_xfer_atomic = adi_twi_master_xfer_atomic,
+	.smbus_xfer	    = adi_twi_smbus_xfer,
+	.smbus_xfer_atomic  = adi_twi_smbus_xfer_atomic,
+	.functionality	    = adi_twi_functionality,
+};
+
+#ifdef CONFIG_PM_SLEEP
+static int i2c_adi_twi_suspend(struct device *dev)
+{
+	struct adi_twi_iface *iface = dev_get_drvdata(dev);
+
+	iface->saved_clkdiv = ioread16(&iface->regs_base->clkdiv);
+	iface->saved_control = ioread16(&iface->regs_base->control);
+
+	free_irq(iface->irq, iface);
+
+	/* Disable TWI */
+	iowrite16(iface->saved_control & ~TWI_ENA, &iface->regs_base->control);
+
+	return 0;
+}
+
+static int i2c_adi_twi_resume(struct device *dev)
+{
+	struct adi_twi_iface *iface = dev_get_drvdata(dev);
+
+	int rc = request_irq(iface->irq, adi_twi_interrupt_entry,
+		0, to_platform_device(dev)->name, iface);
+	if (rc) {
+		dev_err(dev, "Can't get IRQ %d !\n", iface->irq);
+		return -ENODEV;
+	}
+
+	/* Resume TWI interface clock as specified */
+	iowrite16(iface->saved_clkdiv, &iface->regs_base->clkdiv);
+
+	/* Resume TWI */
+	iowrite16(iface->saved_control, &iface->regs_base->control);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(i2c_adi_twi_pm,
+			 i2c_adi_twi_suspend, i2c_adi_twi_resume);
+#define I2C_ADI_TWI_PM_OPS	(&i2c_adi_twi_pm)
+#else
+#define I2C_ADI_TWI_PM_OPS	NULL
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id adi_twi_of_match[] = {
+	{
+		.compatible = "adi,twi",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, adi_twi_of_match);
+#endif
+
+static int i2c_adi_twi_probe(struct platform_device *pdev)
+{
+	struct adi_twi_iface *iface;
+	struct i2c_adapter *p_adap;
+	struct resource *res;
+	const struct of_device_id *match;
+	struct device_node *node = pdev->dev.of_node;
+	int rc;
+	unsigned int clkhilow;
+	u16 writeValue;
+
+	iface = devm_kzalloc(&pdev->dev, sizeof(*iface), GFP_KERNEL);
+	if (!iface)
+		return -ENOMEM;
+
+	spin_lock_init(&(iface->lock));
+
+	match = of_match_device(of_match_ptr(adi_twi_of_match), &pdev->dev);
+	if (match) {
+		if (of_property_read_u32(node, "clock-khz",
+			&iface->twi_clk))
+			iface->twi_clk = 50;
+	} else
+		iface->twi_clk = CONFIG_I2C_ADI_TWI_CLK_KHZ;
+
+	iface->sclk = devm_clk_get(&pdev->dev, "sclk0");
+	if (IS_ERR(iface->sclk)) {
+		if (PTR_ERR(iface->sclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Missing i2c clock\n");
+		return PTR_ERR(iface->sclk);
+	}
+
+	/* Find and map our resources */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(&pdev->dev, "Cannot get IORESOURCE_MEM\n");
+		return -ENOENT;
+	}
+
+	iface->regs_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(iface->regs_base)) {
+		dev_err(&pdev->dev, "Cannot map IO\n");
+		return PTR_ERR(iface->regs_base);
+	}
+
+	iface->irq = platform_get_irq(pdev, 0);
+	if (iface->irq < 0) {
+		dev_err(&pdev->dev, "No IRQ specified\n");
+		return -ENOENT;
+	}
+
+	p_adap = &iface->adap;
+	p_adap->nr = pdev->id;
+	strscpy(p_adap->name, pdev->name, sizeof(p_adap->name));
+	p_adap->algo = &adi_twi_algorithm;
+	p_adap->algo_data = iface;
+	p_adap->class = I2C_CLASS_DEPRECATED;
+	p_adap->dev.parent = &pdev->dev;
+	p_adap->dev.of_node = node;
+	p_adap->timeout = 5 * HZ;
+	p_adap->retries = 3;
+
+	rc = devm_request_irq(&pdev->dev, iface->irq, adi_twi_interrupt_entry,
+		0, pdev->name, iface);
+	if (rc) {
+		dev_err(&pdev->dev, "Can't get IRQ %d !\n", iface->irq);
+		rc = -ENODEV;
+		goto out_error;
+	}
+
+	/* Set TWI internal clock as 10MHz */
+	clk_prepare_enable(iface->sclk);
+	if (rc) {
+		dev_err(&pdev->dev, "Could not enable sclk\n");
+		goto out_error;
+	}
+
+	writeValue = ((clk_get_rate(iface->sclk) / 1000 / 1000 + 5) / 10) & 0x7F;
+	iowrite16(writeValue, &iface->regs_base->control);
+
+	/*
+	 * We will not end up with a CLKDIV=0 because no one will specify
+	 * 20kHz SCL or less in Kconfig now. (5 * 1000 / 20 = 250)
+	 */
+	clkhilow = ((10 * 1000 / iface->twi_clk) + 1) / 2;
+
+	/* Set Twi interface clock as specified */
+	writeValue = (clkhilow << 8) | clkhilow;
+	iowrite16(writeValue, &iface->regs_base->clkdiv);
+
+	/* Enable TWI */
+	writeValue = ioread16(&iface->regs_base->control) | TWI_ENA;
+	iowrite16(writeValue, &iface->regs_base->control);
+
+	rc = i2c_add_numbered_adapter(p_adap);
+	if (rc < 0)
+		goto disable_clk;
+
+	platform_set_drvdata(pdev, iface);
+
+	dev_info(&pdev->dev, "ADI on-chip I2C TWI Controller, regs_base@%p\n",
+		iface->regs_base);
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(iface->sclk);
+
+out_error:
+	return rc;
+}
+
+static void i2c_adi_twi_remove(struct platform_device *pdev)
+{
+	struct adi_twi_iface *iface = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(iface->sclk);
+	i2c_del_adapter(&(iface->adap));
+}
+
+static struct platform_driver i2c_adi_twi_driver = {
+	.probe		= i2c_adi_twi_probe,
+	.remove		= i2c_adi_twi_remove,
+	.driver		= {
+		.name	= "i2c-adi-twi",
+		.pm	= I2C_ADI_TWI_PM_OPS,
+		.of_match_table = of_match_ptr(adi_twi_of_match),
+	},
+};
+
+static int __init i2c_adi_twi_init(void)
+{
+	return platform_driver_register(&i2c_adi_twi_driver);
+}
+
+static void __exit i2c_adi_twi_exit(void)
+{
+	platform_driver_unregister(&i2c_adi_twi_driver);
+}
+
+subsys_initcall(i2c_adi_twi_init);
+module_exit(i2c_adi_twi_exit);
+
+MODULE_AUTHOR("Bryan Wu, Sonic Zhang");
+MODULE_DESCRIPTION("ADI on-chip I2C TWI Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:i2c-adi-twi");
\ No newline at end of file

-- 
2.25.1



