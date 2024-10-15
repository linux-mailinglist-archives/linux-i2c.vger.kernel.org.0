Return-Path: <linux-i2c+bounces-7377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B499DFB7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 09:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47C121C214BA
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 07:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A341AB6FC;
	Tue, 15 Oct 2024 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEkBIbEC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EEA1AB6CC;
	Tue, 15 Oct 2024 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728978719; cv=none; b=tMzw7i5/Y9SzsGlKlcUB1Z+PDtdtVzIl0EkWOobR1pKWbgSbumd+CZn6UIaOg4XUHwUrd5qwq6px5bOe0SNnbou94VRWr77LsohbfM+AbyxrNSSihT3gCjSl3EJUXkjdHltqnUn5fohB90KRd6MzTyracOHJv9ZFkzq2cLxzaqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728978719; c=relaxed/simple;
	bh=2Kwk1vYzcl5d6YoRVICa38BYA9G2P9HXMOSZUSZ+Mu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CWJerWUd/gpwWqRn5LakxIveHLs0Fdw/u8p7NWwloFFZGvQ+YB7HPAFrlO2HGQYlHjv+SYnJwDw27Tk0VvPU01HthPj8oSuA6na8MvmlcGa16KOYP2G8uVX8yJDxEAYC/DEjrWG48+/WNamHwwiMpIqDgtPFGF89NsGbg96TcVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEkBIbEC; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-717d73e251aso2468110a34.3;
        Tue, 15 Oct 2024 00:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728978716; x=1729583516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SF0Mf2U/GpvdWD9wFKxO0ml0H/meA8B3swGEt0Tf44U=;
        b=QEkBIbEClQxHFXQ31uB+UroPTdjtXD+/eoFiiIVLxN50qUvf2oxnBFqszUY4j/x//4
         VultfcLoDKzl6NUmMEPoqhfIF1mNTEdmwzEBIuwfIwpFpzrMJUxg0+u1wd1cItTmZtd1
         +pmqpB+4q+1XgWNNMeXgyS5z7/ymnqsCpvpvN/UaeNPWz0l+jCK+9BaFmo/F3KTXR1Sq
         GRPGo7vx1RPTVyslFajoLvNNauL4F3iX4uJY/VVmjTypaqm4pt6bGrLF/kiKOlH5LDvk
         R9XTsZxGf7oiYdapqAE4CSup44C83HIpf1RT1EtIm7XwbMxmNv27ANbDPtTmf8b/IdcG
         fv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978716; x=1729583516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF0Mf2U/GpvdWD9wFKxO0ml0H/meA8B3swGEt0Tf44U=;
        b=khy5xRWfzFLn0NfOc2tfiNSnRcinRg8zO2lkxlWj7MP8B22YednPpbuAqW3g0of52d
         JmVarVCjsh6ThKfzFwQ8wOW1k9z9mk8/2LxYgPHB5tGz3hTk0yrIb9fTcVyZFV+qQXN9
         WyKLya2Gl/41R0svFH4BTi/L2I06uOUHCbXbZWhuglLbY2IFLB+4J0zY0YmEFi3icpid
         2Q2qMn+ZBFllGkp0sTxCM01QWof9ml2vO8fBqMcJLC5KA3n5iFr47/dgJF5G8WfAFaN7
         VyUZPShd1ECvLlNamrAVE1wiF2T3qN/xfUttTxI5TOM/ZrmesG2sVYS6bu/8uH7RgP20
         q25Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCZA4gGrtIlLKOsuF0rrRv2xux7e3BzTLynvjcWTU6T37IFuMLHem6tkmX4R7k6I9Y4Bm2CJrP9DINGvtL@vger.kernel.org, AJvYcCVHn0oFPCjqVvA/AZsUQoKrcOZXzJ6SHGGwywfy46oUwhAxggbFSEypU+n/+9xNQS9yX32UF5Vkjs2q@vger.kernel.org, AJvYcCW5yrUfPLJ5C/h1+Zg4STTIrSb9U+Jc9VrzZZPpRhZ/adwP/RCvRzNmuHP/VlTa1Hgt4p/th/v6wbEk@vger.kernel.org
X-Gm-Message-State: AOJu0YyUFkeUlil8HHsV5+Ztopvy3o8ofbrZumjLWwLSUXkf6/hhd1yV
	naKhj1Sv+ZVG4878073RohP/XmE0Vzrt6yhe6rMHQx1TEmbjOITR
X-Google-Smtp-Source: AGHT+IH96M/DehVwXT7Gatj/wVVu7TXtgUCpIpeRyysA44aQrPStuZaecJ1/c85f++WaAc7s0EvxoA==
X-Received: by 2002:a05:6358:848c:b0:1c3:6deb:6996 with SMTP id e5c5f4694b2df-1c36deb6c96mr33950255d.23.1728978715929;
        Tue, 15 Oct 2024 00:51:55 -0700 (PDT)
Received: from troy-WUJIE14-PRO.. ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a4243sm682134b3a.131.2024.10.15.00.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 00:51:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Date: Tue, 15 Oct 2024 15:51:34 +0800
Message-Id: <20241015075134.1449458-3-TroyMitchell988@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces basic I2C support for the SpacemiT K1 SoC,
utilizing interrupts for transfers.

The driver has been tested using i2c-tools on a Bananapi-F3 board,
and basic I2C read/write operations have been confirmed to work.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 drivers/i2c/busses/Kconfig  |  18 +
 drivers/i2c/busses/Makefile |   1 +
 drivers/i2c/busses/i2c-k1.c | 694 ++++++++++++++++++++++++++++++++++++
 3 files changed, 713 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-k1.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 53f18b351f53..cfa5cda9c8d8 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -800,6 +800,24 @@ config I2C_KEMPLD
 	  This driver can also be built as a module. If so, the module
 	  will be called i2c-kempld.
 
+config I2C_K1
+	tristate "Spacemit K1 I2C adapter"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	help
+	  This option enables support for the I2C interface on the Spacemit K1
+	  platform.
+
+	  If you enable this configuration, the kernel will include support for
+	  the I2C adapter specific to the Spacemit K1 platform. This driver ca
+	  be used to manage I2C bus transactions, which are necessary for
+	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
+	  devices.
+
+	  This driver can also be compiled as a module. If you choose to build
+	  it as a module, the resulting kernel module will be named `i2c-k1`.
+	  Loading this module will enable the I2C functionality for the K1
+	  platform dynamically, without requiring a rebuild of the kernel.
+
 config I2C_LPC2K
 	tristate "I2C bus support for NXP LPC2K/LPC178x/18xx/43xx"
 	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index ecc07c50f2a0..682e10435a7f 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
 obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
+obj-$(CONFIG_I2C_K1)		+= i2c-k1.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
new file mode 100644
index 000000000000..85053530d9b0
--- /dev/null
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -0,0 +1,694 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
+ */
+
+ #include <linux/clk.h>
+ #include <linux/i2c.h>
+ #include <linux/iopoll.h>
+ #include <linux/module.h>
+ #include <linux/of_address.h>
+ #include <linux/platform_device.h>
+
+/* spacemit i2c registers */
+#define ICR          0x0		/* Control Register */
+#define ISR          0x4		/* Status Register */
+#define ISAR         0x8		/* Slave Address Register */
+#define IDBR         0xc		/* Data Buffer Register */
+#define ILCR         0x10		/* Load Count Register */
+#define IWCR         0x14		/* Wait Count Register */
+#define IRST_CYC     0x18		/* Bus reset cycle counter */
+#define IBMR         0x1c		/* Bus monitor register */
+#define IWFIFO       0x20		/* Write FIFO Register */
+#define IWFIFO_WPTR  0x24		/* Write FIFO Write Pointer Register */
+#define IWFIFO_RPTR  0x28		/* Write FIFO Read Pointer Register */
+#define IRFIFO       0x2c		/* Read FIFO Register */
+#define IRFIFO_WPTR  0x30		/* Read FIFO Write Pointer Register */
+#define IRFIFO_RPTR  0x34		/* Read FIFO Read Pointer Register */
+
+/* register ICR fields */
+#define CR_START        BIT(0)		/* start bit */
+#define CR_STOP         BIT(1)		/* stop bit */
+#define CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
+#define CR_TB           BIT(3)		/* transfer byte bit */
+#define CR_TXBEGIN      BIT(4)		/* transaction begin */
+#define CR_FIFOEN       BIT(5)		/* enable FIFO mode */
+#define CR_GPIOEN       BIT(6)		/* enable GPIO mode for SCL in HS */
+#define CR_DMAEN        BIT(7)		/* enable DMA for TX and RX FIFOs */
+#define CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
+#define CR_MODE_HIGH    BIT(9)		/* bus mode (master operation) */
+#define CR_UR           BIT(10)		/* unit reset */
+#define CR_RSTREQ       BIT(11)		/* i2c bus reset request */
+#define CR_MA           BIT(12)		/* master abort */
+#define CR_SCLE         BIT(13)		/* master clock enable */
+#define CR_IUE          BIT(14)		/* unit enable */
+#define CR_HS_STRETCH   BIT(16)		/* I2C hs stretch */
+#define CR_ALDIE        BIT(18)		/* enable arbitration interrupt */
+#define CR_DTEIE        BIT(19)		/* enable tx interrupts */
+#define CR_DRFIE        BIT(20)		/* enable rx interrupts */
+#define CR_GCD          BIT(21)		/* general call disable */
+#define CR_BEIE         BIT(22)		/* enable bus error ints */
+#define CR_SADIE        BIT(23)		/* slave address detected int enable */
+#define CR_SSDIE        BIT(24)		/* slave STOP detected int enable */
+#define CR_MSDIE        BIT(25)		/* master STOP detected int enable */
+#define CR_MSDE         BIT(26)		/* master STOP detected enable */
+#define CR_TXDONEIE     BIT(27)		/* transaction done int enable */
+#define CR_TXEIE        BIT(28)		/* transmit FIFO empty int enable */
+#define CR_RXHFIE       BIT(29)		/* receive FIFO half-full int enable */
+#define CR_RXFIE        BIT(30)		/* receive FIFO full int enable */
+#define CR_RXOVIE       BIT(31)		/* receive FIFO overrun int enable */
+
+/* register ISR fields */
+#define SR_RWM          BIT(13)		/* read/write mode */
+#define SR_ACKNAK       BIT(14)		/* ACK/NACK status */
+#define SR_UB           BIT(15)		/* unit busy */
+#define SR_IBB          BIT(16)		/* i2c bus busy */
+#define SR_EBB          BIT(17)		/* early bus busy */
+#define SR_ALD          BIT(18)		/* arbitration loss detected */
+#define SR_ITE          BIT(19)		/* tx buffer empty */
+#define SR_IRF          BIT(20)		/* rx buffer full */
+#define SR_GCAD         BIT(21)		/* general call address detected */
+#define SR_BED          BIT(22)		/* bus error no ACK/NAK */
+#define SR_SAD          BIT(23)		/* slave address detected */
+#define SR_SSD          BIT(24)		/* slave stop detected */
+#define SR_MSD          BIT(26)		/* master stop detected */
+#define SR_TXDONE       BIT(27)		/* transaction done */
+#define SR_TXE          BIT(28)		/* tx FIFO empty */
+#define SR_RXHF         BIT(29)		/* rx FIFO half-full */
+#define SR_RXF          BIT(30)		/* rx FIFO full */
+#define SR_RXOV         BIT(31)		/* RX FIFO overrun */
+
+/* register ILCR fields */
+#define LCR_SLV         0x000001FF	/* SLV: bit[8:0] */
+#define LCR_FLV         0x0003FE00	/* FLV: bit[17:9] */
+#define LCR_HLVH        0x07FC0000	/* HLVH: bit[26:18] */
+#define LCR_HLVL        0xF8000000	/* HLVL: bit[31:27] */
+
+/* register IWCR fields */
+#define WCR_COUNT       0x0000001F	/* COUNT: bit[4:0] */
+#define WCR_COUNT1      0x000003E0	/* HS_COUNT1: bit[9:5] */
+#define WCR_COUNT2      0x00007C00	/* HS_COUNT2: bit[14:10] */
+
+/* register IBMR fields */
+#define BMR_SDA         BIT(0)		/* SDA line level */
+#define BMR_SCL         BIT(1)		/* SCL line level */
+
+/* register IWFIFO fields */
+#define WFIFO_DATA_MSK      0x000000FF  /* data: bit[7:0] */
+#define WFIFO_CTRL_MSK      0x000003E0  /* control: bit[11:8] */
+#define WFIFO_CTRL_START    BIT(8)      /* start bit */
+#define WFIFO_CTRL_STOP     BIT(9)      /* stop bit */
+#define WFIFO_CTRL_ACKNAK   BIT(10)     /* send ACK(0) or NAK(1) */
+#define WFIFO_CTRL_TB       BIT(11)     /* transfer byte bit */
+
+/* status register init value */
+#define I2C_INT_STATUS_MASK    0xfffc0000  /* SR bits[31:18] */
+#define I2C_INT_CTRL_MASK      (CR_ALDIE | CR_DTEIE | CR_DRFIE | \
+				CR_BEIE | CR_TXDONEIE | CR_TXEIE | \
+				CR_RXHFIE | CR_RXFIE | CR_RXOVIE | \
+				CR_MSDIE)
+
+/* i2c bus recover timeout: us */
+#define I2C_BUS_RECOVER_TIMEOUT		(100000)
+
+#define I2C_FAST_MODE_FREQ		(400000)
+
+enum spacemit_i2c_state {
+	STATE_IDLE,
+	STATE_START,
+	STATE_READ,
+	STATE_WRITE,
+};
+
+enum spacemit_i2c_dir {
+	DIR_WRITE,
+	DIR_READ
+};
+
+/* i2c-spacemit driver's main struct */
+struct spacemit_i2c_dev {
+	struct device *dev;
+	struct i2c_adapter adapt;
+
+	/* hardware resources */
+	void __iomem *base;
+	int irq;
+
+	struct i2c_msg *msgs;
+	int msg_num;
+	struct i2c_msg *cur_msg;
+
+	/* index of the current message being processed */
+	int msg_idx;
+	u8 *msg_buf;
+	/* the number of unprocessed bytes remaining in each message  */
+	size_t unprocessed;
+
+	enum spacemit_i2c_state state;
+	enum spacemit_i2c_dir dir;
+	struct completion complete;
+	u32 status;
+	u32 err;
+};
+
+static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c);
+
+static inline u32 spacemit_i2c_read_reg(struct spacemit_i2c_dev *i2c, int reg)
+{
+	return readl(i2c->base + reg);
+}
+
+static inline void
+spacemit_i2c_write_reg(struct spacemit_i2c_dev *i2c, int reg, u32 val)
+{
+	writel(val, i2c->base + reg);
+}
+
+static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = spacemit_i2c_read_reg(i2c, ICR);
+	spacemit_i2c_write_reg(i2c, ICR, val | CR_IUE);
+}
+
+static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = spacemit_i2c_read_reg(i2c, ICR);
+	val &= ~CR_IUE;
+	spacemit_i2c_write_reg(i2c, ICR, val);
+}
+
+static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
+{
+	spacemit_i2c_write_reg(i2c, ICR, CR_UR);
+	udelay(5);
+	spacemit_i2c_write_reg(i2c, ICR, 0);
+}
+
+static void spacemit_i2c_bus_reset(struct spacemit_i2c_dev *i2c)
+{
+	u32 status;
+
+	/* if bus is locked, reset unit. 0: locked */
+	status = spacemit_i2c_read_reg(i2c, IBMR);
+
+	if ((status & BMR_SDA) && (status & BMR_SCL))
+		return;
+
+	spacemit_i2c_reset(i2c);
+	usleep_range(10, 20);
+
+	/* check scl status again */
+	status = spacemit_i2c_read_reg(i2c, IBMR);
+
+	if (!(status & BMR_SCL))
+		dev_alert(i2c->dev, "unit reset failed\n");
+}
+
+static int spacemit_i2c_recover_bus_busy(struct spacemit_i2c_dev *i2c)
+{
+	int ret = 0;
+	u32 val;
+
+	val = spacemit_i2c_read_reg(i2c, ISR);
+
+	if (likely(!(val & (SR_UB | SR_IBB))))
+		return 0;
+
+	ret = readl_poll_timeout(i2c->base + ISR,
+				 val,
+				 !(val & (SR_UB | SR_IBB)),
+				 1500,
+				 I2C_BUS_RECOVER_TIMEOUT);
+
+	if (unlikely(ret)) {
+		spacemit_i2c_reset(i2c);
+		ret = -EAGAIN;
+	}
+
+	return ret;
+}
+
+static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
+{
+	/* in case bus is not released after transfer completes */
+	if (unlikely(spacemit_i2c_read_reg(i2c, ISR) & SR_EBB)) {
+		spacemit_i2c_bus_reset(i2c);
+		usleep_range(90, 150);
+	}
+}
+
+static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
+{
+	u32 val = 0;
+
+	/*
+	 * Unmask interrupt bits for all xfer mode:
+	 * bus error, arbitration loss detected.
+	 * For transaction complete signal, we use master stop
+	 * interrupt, so we don't need to unmask CR_TXDONEIE.
+	 */
+	val |= CR_BEIE | CR_ALDIE;
+
+	/*
+	 * Unmask interrupt bits for interrupt xfer mode:
+	 * DBR rx full.
+	 * For tx empty interrupt CR_DTEIE, we only
+	 * need to enable when trigger byte transfer to start
+	 * data sending.
+	 */
+	val |= CR_DRFIE;
+
+	/* set speed bits: default fast mode */
+	val |= CR_MODE_FAST;
+
+	/* disable response to general call */
+	val |= CR_GCD;
+
+	/* enable SCL clock output */
+	val |= CR_SCLE;
+
+	/* enable master stop detected */
+	val |= CR_MSDE | CR_MSDIE;
+
+	spacemit_i2c_write_reg(i2c, ICR, val);
+}
+
+static inline void
+spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
+{
+	spacemit_i2c_write_reg(i2c, ISR, mask & I2C_INT_STATUS_MASK);
+}
+
+static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
+{
+	u32 slave_addr_rw, val;
+
+	i2c->dir = i2c->cur_msg->flags & I2C_M_RD;
+	i2c->state = STATE_START;
+
+	if (i2c->cur_msg->flags & I2C_M_RD)
+		slave_addr_rw = ((i2c->cur_msg->addr & 0x7f) << 1) | 1;
+	else
+		slave_addr_rw = (i2c->cur_msg->addr & 0x7f) << 1;
+
+	spacemit_i2c_write_reg(i2c, IDBR, slave_addr_rw);
+
+	val = spacemit_i2c_read_reg(i2c, ICR);
+
+	/* send start pulse */
+	val &= ~CR_STOP;
+	val |= CR_START | CR_TB | CR_DTEIE;
+	spacemit_i2c_write_reg(i2c, ICR, val);
+}
+
+static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = spacemit_i2c_read_reg(i2c, ICR);
+
+	val |= CR_STOP | CR_ALDIE | CR_TB;
+
+	if (i2c->dir == DIR_READ)
+		val |= CR_ACKNAK;
+
+	spacemit_i2c_write_reg(i2c, ICR, val);
+}
+
+static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long time_left;
+
+	if (unlikely(i2c->err))
+		return -1;
+
+	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
+		i2c->cur_msg = i2c->msgs + i2c->msg_idx;
+		i2c->msg_buf = i2c->cur_msg->buf;
+		i2c->err = 0;
+		i2c->status = 0;
+		i2c->unprocessed = i2c->cur_msg->len;
+
+		reinit_completion(&i2c->complete);
+
+		spacemit_i2c_start(i2c);
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							i2c->adapt.timeout);
+
+		if (unlikely(time_left == 0)) {
+			dev_alert(i2c->dev, "msg completion timeout\n");
+			spacemit_i2c_bus_reset(i2c);
+			spacemit_i2c_reset(i2c);
+			return -ETIMEDOUT;
+		}
+
+		if (unlikely(i2c->err))
+			return spacemit_i2c_handle_err(i2c);
+	}
+
+	return 0;
+}
+
+static int spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->dir == DIR_READ) {
+		if (i2c->unprocessed == 1 && i2c->msg_idx == i2c->msg_num - 1)
+			return 1;
+		return 0;
+	} else if (i2c->dir == DIR_WRITE) {
+		if (!i2c->unprocessed && i2c->msg_idx == i2c->msg_num - 1)
+			return 1;
+		return 0;
+	}
+	return 0;
+}
+
+static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
+{
+	/* if transfer completes, ISR will handle it */
+	if (i2c->status & SR_MSD)
+		return;
+
+	if (i2c->unprocessed) {
+		spacemit_i2c_write_reg(i2c, IDBR, *i2c->msg_buf++);
+		i2c->unprocessed--;
+		return;
+	}
+
+	/* STATE_IDLE avoids trigger next byte */
+	i2c->state = STATE_IDLE;
+	complete(&i2c->complete);
+}
+
+static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->unprocessed) {
+		*i2c->msg_buf++ = spacemit_i2c_read_reg(i2c, IDBR);
+		i2c->unprocessed--;
+	}
+
+	/* if transfer completes, ISR will handle it */
+	if (i2c->status & (SR_MSD | SR_ACKNAK))
+		return;
+
+	/* it has to append stop bit in icr that read last byte */
+	if (i2c->unprocessed)
+		return;
+
+	/* STATE_IDLE avoids trigger next byte */
+	i2c->state = STATE_IDLE;
+	complete(&i2c->complete);
+}
+
+static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->dir == DIR_READ) {
+		i2c->state = STATE_READ;
+		return;
+	}
+
+	if (i2c->dir == DIR_WRITE) {
+		i2c->state = STATE_WRITE;
+		spacemit_i2c_handle_write(i2c);
+	}
+}
+
+static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
+{
+	if (!i2c->err)
+		return 0;
+
+	dev_dbg(i2c->dev, "i2c error status: 0x%08x\n",	i2c->status);
+
+	if (i2c->err & (SR_BED | SR_ALD))
+		spacemit_i2c_reset(i2c);
+
+	if (i2c->err & (SR_RXOV | SR_ALD))
+		return -EAGAIN;
+
+	return (i2c->status & SR_ACKNAK) ? -ENXIO : -EIO;
+}
+
+static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+	/*
+	 * send transaction complete signal:
+	 * error happens, detect master stop
+	 */
+	if (likely(i2c->err || (i2c->status & SR_MSD))) {
+		/*
+		 * Here the transaction is already done, we don't need any
+		 * other interrupt signals from now, in case any interrupt
+		 * happens before spacemit_i2c_xfer to disable irq and i2c unit,
+		 * we mask all the interrupt signals and clear the interrupt
+		 * status.
+		 */
+		val = spacemit_i2c_read_reg(i2c, ICR);
+		val &= ~I2C_INT_CTRL_MASK;
+		spacemit_i2c_write_reg(i2c, ICR, val);
+
+		spacemit_i2c_clear_int_status(i2c, I2C_INT_STATUS_MASK);
+
+		i2c->state = STATE_IDLE;
+		complete(&i2c->complete);
+	}
+}
+
+static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
+{
+	struct spacemit_i2c_dev *i2c = devid;
+	u32 status, val;
+
+	status = spacemit_i2c_read_reg(i2c, ISR);
+
+	if (!status)
+		return IRQ_HANDLED;
+
+	i2c->status = status;
+
+	i2c->err = status & (SR_BED | SR_RXOV | SR_ALD);
+
+	spacemit_i2c_clear_int_status(i2c, status);
+
+	if (unlikely(i2c->err))
+		goto err_out;
+
+	val = spacemit_i2c_read_reg(i2c, ICR);
+
+	val &= ~(CR_TB | CR_ACKNAK | CR_STOP | CR_START);
+	spacemit_i2c_write_reg(i2c, ICR, val);
+
+	switch (i2c->state) {
+	case STATE_START:
+		spacemit_i2c_handle_start(i2c);
+		break;
+	case STATE_READ:
+		spacemit_i2c_handle_read(i2c);
+		break;
+	case STATE_WRITE:
+		spacemit_i2c_handle_write(i2c);
+		break;
+	default:
+		break;
+	}
+
+	if (i2c->state != STATE_IDLE) {
+		if (spacemit_i2c_is_last_msg(i2c)) {
+			/* trigger next byte with stop */
+			spacemit_i2c_stop(i2c);
+		} else {
+			/* trigger next byte */
+			val |= CR_ALDIE | CR_TB;
+			spacemit_i2c_write_reg(i2c, ICR, val);
+		}
+	}
+
+err_out:
+	spacemit_i2c_err_check(i2c);
+	return IRQ_HANDLED;
+}
+
+static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long timeout;
+	int idx = 0, cnt = 0, freq;
+
+	while (idx < i2c->msg_num) {
+		cnt += (i2c->msgs + idx)->len + 1;
+
+		idx++;
+	}
+
+	freq = I2C_FAST_MODE_FREQ;
+
+	timeout = cnt * 9 * USEC_PER_SEC / freq;
+
+	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 2) / i2c->msg_num;
+}
+
+static inline int spacemit_i2c_xfer_core(struct spacemit_i2c_dev *i2c)
+{
+	int ret = 0;
+
+	spacemit_i2c_reset(i2c);
+
+	spacemit_i2c_calc_timeout(i2c);
+
+	spacemit_i2c_init(i2c);
+
+	spacemit_i2c_enable(i2c);
+	enable_irq(i2c->irq);
+
+	/* i2c wait for bus busy */
+	ret = spacemit_i2c_recover_bus_busy(i2c);
+
+	if (unlikely(ret))
+		return ret;
+
+	ret = spacemit_i2c_xfer_msg(i2c);
+
+	if (unlikely(ret < 0)) {
+		dev_dbg(i2c->dev, "i2c transfer error\n");
+		/* timeout error should not be overridden, and the transfer
+		 * error will be confirmed by err handle function latter,
+		 * the reset should be invalid argument error.
+		 */
+		if (ret != -ETIMEDOUT)
+			ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int
+spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg msgs[], int num)
+{
+	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
+	int ret;
+
+	i2c->msgs = msgs;
+	i2c->msg_num = num;
+
+	ret = spacemit_i2c_xfer_core(i2c);
+
+	if (likely(!ret))
+		spacemit_i2c_check_bus_release(i2c);
+
+	disable_irq(i2c->irq);
+
+	spacemit_i2c_disable(i2c);
+
+	if (unlikely((ret == -ETIMEDOUT || ret == -EAGAIN)))
+		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%x\n",
+			  ret, i2c->err);
+
+	return ret < 0 ? ret : num;
+}
+
+static u32 spacemit_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+}
+
+static const struct i2c_algorithm spacemit_i2c_algo = {
+	.xfer = spacemit_i2c_xfer,
+	.functionality = spacemit_i2c_func,
+};
+
+static int spacemit_i2c_probe(struct platform_device *pdev)
+{
+	struct spacemit_i2c_dev *i2c;
+	struct device_node *of_node = pdev->dev.of_node;
+	struct clk *clk;
+	int ret = 0;
+
+	i2c = devm_kzalloc(&pdev->dev,
+			   sizeof(struct spacemit_i2c_dev),
+			   GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->dev = &pdev->dev;
+
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
+	if (!i2c->base) {
+		ret = PTR_ERR(i2c->base);
+		return dev_err_probe(&pdev->dev, ret, "failed to do ioremap");
+	}
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0) {
+		ret = i2c->irq;
+		return dev_err_probe(&pdev->dev, ret, "failed to get irq resource");
+	}
+
+	ret = devm_request_irq(i2c->dev, i2c->irq,
+			       spacemit_i2c_irq_handler,
+			       IRQF_NO_SUSPEND | IRQF_ONESHOT,
+			       dev_name(i2c->dev), i2c);
+
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to request irq");
+
+	disable_irq(i2c->irq);
+
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		return dev_err_probe(&pdev->dev, ret, "failed to enable clock");
+	}
+
+	i2c_set_adapdata(&i2c->adapt, i2c);
+	i2c->adapt.owner = THIS_MODULE;
+	i2c->adapt.algo = &spacemit_i2c_algo;
+	i2c->adapt.dev.parent = i2c->dev;
+	i2c->adapt.nr = pdev->id;
+
+	i2c->adapt.dev.of_node = of_node;
+	i2c->adapt.algo_data = i2c;
+
+	strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
+
+	init_completion(&i2c->complete);
+
+	ret = i2c_add_numbered_adapter(&i2c->adapt);
+
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
+
+	platform_set_drvdata(pdev, i2c);
+
+	return 0;
+}
+
+static void spacemit_i2c_remove(struct platform_device *pdev)
+{
+	struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&i2c->adapt);
+}
+
+static const struct of_device_id spacemit_i2c_dt_match[] = {
+	{ .compatible = "spacemit,k1-i2c", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_i2c_dt_match);
+
+static struct platform_driver spacemit_i2c_driver = {
+	.probe = spacemit_i2c_probe,
+	.remove_new = spacemit_i2c_remove,
+	.driver = {
+		.name = "i2c-k1",
+		.of_match_table = spacemit_i2c_dt_match,
+	},
+};
+module_platform_driver(spacemit_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
-- 
2.34.1


