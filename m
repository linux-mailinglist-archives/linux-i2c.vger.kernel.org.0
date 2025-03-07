Return-Path: <linux-i2c+bounces-9754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA86A568A6
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Mar 2025 14:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 754B1178D16
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Mar 2025 13:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365F321A435;
	Fri,  7 Mar 2025 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bad9TxbT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D521A445;
	Fri,  7 Mar 2025 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353412; cv=none; b=UTvF4K4pNowdANxvrm3voAODYMRuLYjusoXkMAFGyd43KXeh6cRXkEDvz/7nll//C74z0zICodIXnz8f75E+DGONizpZlEpMHGwVK9MhPc4cvGCu6btaWE6DCVccB81ZaIl4+SpRD/M8IX4cEGapUGWF3QpMFCLXJNarUrlHPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353412; c=relaxed/simple;
	bh=sgsadTwwgq/XWsfw4TFlRKeDYQbR51Wv9V3/aiDoG2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNlBUH4kV7FZR+3NcIJZ+JIh7AUz0NMhgNWYyIzS5ZuF+Xgwfx8rdKzDmEHxd5CYTIyyCSf35ttZ1AIus+qC1nVO+gVnFDmMuuz4ewiRZjyRYw5AXypBmMq7P5+f/moRCJLne+56oGWKDbf1YaGPK21V8UmO9r6Q3d5qTdWMnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bad9TxbT; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so3527867a91.0;
        Fri, 07 Mar 2025 05:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741353408; x=1741958208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzja5MTwmKusdpgio0+yGK24Gu9ZSgnAl6PDC2ElthI=;
        b=bad9TxbTT2t//t+aUbgT11ua7kTX0ZSr6osPUl3VOZdX/pxZ2fKPjE5q//RcpuRQ1Q
         0V7tTymRIY2lk0+UfdRxU/1HIvYCcFuB8IEFVn3QcYFO7jmQ6XSe8I6i022OAkSFKYKx
         LE5/JhkLff3e2sSZSsTKKMmzqKAJbMqsZwX+gz/4cg2G2WTyKI1I6LyohMeFn/U1S3t+
         Uj6wGjYZQo873hyyJEjgrqrrTghNgOhz+bBG2a1rO9N5j72k9DEsuRwlUE8+aAtil5Ie
         DcU9gtoFGoeAR5g9jHGDqxMtMHooJE43DpSVrpNu7s/NDS2lGdb7WIilv33HcavFrVyX
         BCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353408; x=1741958208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzja5MTwmKusdpgio0+yGK24Gu9ZSgnAl6PDC2ElthI=;
        b=N3EMkBRzBJaNPpkBA7zv9k5ffHlF1hXFbpxL0c5ZXf/PA+jtAlcIxVe8BOySLc7Onc
         v5CssKkK7dlIBVsshnhDZaXdJEvr58FMJq6STLZkXXGdNUarvMIfaoTqpqfKCwqV2ktM
         8vPI6iaraThCIxLSeiGG/8ApFG9IDa3wbZYSFRg4frL5bZqpVcCk+uK7YezkUA2O1ou3
         ycAbCFK5mZ3eBOw11BBZCuN4HRgs1fY55HSKMDJCi4E/EddPWq5HSgqfVlM96k5N2/oX
         kRPP5SY+jTM8jq+v60dLCLNzJg+N6gih/hAA1pREk19y5ZqP7/L4ANSLm4hyFeC4vcEw
         80+g==
X-Forwarded-Encrypted: i=1; AJvYcCV+SXhe+AQR00Zmq8kZmmOhuyAr9Tr9HMdLEyoSOFvbI3gtl/ys9rXCs5VWtZArVGTXs/02QfXBdKXW/5fg@vger.kernel.org, AJvYcCVfHsUw93tXg+kx81TM6/JGkYdxtOvQR3pKe574SidqKoLRm5g/da30z2PvjRUYWqj1yyoItlAV0dk+@vger.kernel.org, AJvYcCW/Jx1PazZ3XJbRgB2T+r94fPtkkAhJzy2irx/KQPn65YWbSKnO5GHKfei6N/HQ76FxawMZozVEwK6f@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0DD6L3q6XgRj8A4LKDDrvdp50yULo6iXqfXfPzU1BVKV5WVw
	9Md5twRSvGsA3yPzqfo+B1raSRcZEmVdmYkGTfKJcuhc+0Vjl89f
X-Gm-Gg: ASbGncvXEwadb1UWouEvlFQNbcMDHQjhylqEp6iPwOI4xY1x+Zx3R6YkQFP9ugL8lsy
	N7Oxo5nJgGjWgvAXj2RlbLD8qZRNhbKR4DVp8GZWoKASQ+fILKfBWmq6UmFio+hXD+gB5JXfu2e
	5C9umURyNspvbXx8eQyICJC9IL6JyJQaopylv3aECY7WE2CEmfmhWpt7Iph5komC4hOnV56g6FB
	zgWyjMSYmvt2YVLEC08HWMObAyhdew68L5IxkXkhpuYWVzHtL9mbM3rR9fZhjDI/pxe89AQRx6Z
	5qEc8lL5v0zLVHuSI/ur3JovRsOd
X-Google-Smtp-Source: AGHT+IE+QPBrIGp/dtmnVoBNMSEI48iDBTNS8PjVZotmvs3U67peoFEl0Z12pFBy40vFPdbrReU57Q==
X-Received: by 2002:a17:90b:1d0a:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2ff7ce457acmr5221230a91.4.1741353408158;
        Fri, 07 Mar 2025 05:16:48 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693f7cebsm2984589a91.45.2025.03.07.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:16:47 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Fri, 07 Mar 2025 21:13:47 +0800
Subject: [PATCH v6 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-k1-i2c-master-v6-2-34f17d2dae1c@gmail.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
In-Reply-To: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741353244; l=20443;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=sgsadTwwgq/XWsfw4TFlRKeDYQbR51Wv9V3/aiDoG2A=;
 b=SOEaH2avZ+orX3dh2vwml042emN63e+p/iuaRakR19JpfDJ3jE8qGzOfiHR59Lz2CC8Tj7gk6
 6mjIF39ypHeAjUOA8C1T7UnSy4hYI9j1aoX5MTmj4n7EgfkpJnZAsO6
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

This patch introduces basic I2C support for the SpacemiT K1 SoC,
utilizing interrupts for transfers.

The driver has been tested using i2c-tools on a Bananapi-F3 board,
and basic I2C read/write operations have been confirmed to work.

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/Kconfig  |  17 ++
 drivers/i2c/busses/Makefile |   1 +
 drivers/i2c/busses/i2c-k1.c | 601 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 619 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fc438f4457713d5559d163840a7b11e8cdbb8f58..12d0e99566d8625aa374279956b71a4034ded4ac 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -783,6 +783,23 @@ config I2C_JZ4780
 
 	 If you don't know what to do here, say N.
 
+config I2C_K1
+	tristate "Spacemit K1 I2C adapter"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF
+	help
+	  This option enables support for the I2C interface on the Spacemit K1
+	  platform.
+
+	  If you enable this configuration, the kernel will include support for
+	  the I2C adapter specific to the Spacemit K1 platform. This driver can
+	  be used to manage I2C bus transactions, which are necessary for
+	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
+	  devices.
+
+	  This driver can also be built as a module.  If so, the
+	  module will be called `i2c-k1`.
+
 config I2C_KEBA
 	tristate "KEBA I2C controller support"
 	depends on HAS_IOMEM
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1c2a4510abe44a689dfe67d2d64cf0cf3434f510..c1252e2b779e2e47492d66179b442f2202ec0416 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_I2C_IMX)		+= i2c-imx.o
 obj-$(CONFIG_I2C_IMX_LPI2C)	+= i2c-imx-lpi2c.o
 obj-$(CONFIG_I2C_IOP3XX)	+= i2c-iop3xx.o
 obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
+obj-$(CONFIG_I2C_K1)		+= i2c-k1.o
 obj-$(CONFIG_I2C_KEBA)		+= i2c-keba.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
new file mode 100644
index 0000000000000000000000000000000000000000..1ef98a303fb14ce10d283225ce0617a0b9f405f7
--- /dev/null
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -0,0 +1,601 @@
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
+#define SPACEMIT_ICR		 0x0		/* Control Register */
+#define SPACEMIT_ISR		 0x4		/* Status Register */
+#define SPACEMIT_IDBR		 0xc		/* Data Buffer Register */
+#define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
+
+/* SPACEMIT_ICR register fields */
+#define SPACEMIT_CR_START        BIT(0)		/* start bit */
+#define SPACEMIT_CR_STOP         BIT(1)		/* stop bit */
+#define SPACEMIT_CR_ACKNAK       BIT(2)		/* send ACK(0) or NAK(1) */
+#define SPACEMIT_CR_TB           BIT(3)		/* transfer byte bit */
+/* Bits 4-7 are reserved */
+#define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
+/* Bit 9 is reserved */
+#define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
+/* Bits 11-12 are reserved */
+#define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
+#define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
+/* Bits 15-17 are reserved */
+#define SPACEMIT_CR_ALDIE        BIT(18)	/* enable arbitration interrupt */
+#define SPACEMIT_CR_DTEIE        BIT(19)	/* enable tx interrupts */
+#define SPACEMIT_CR_DRFIE        BIT(20)	/* enable rx interrupts */
+#define SPACEMIT_CR_GCD          BIT(21)	/* general call disable */
+#define SPACEMIT_CR_BEIE         BIT(22)	/* enable bus error ints */
+/* Bits 23-24 are reserved */
+#define SPACEMIT_CR_MSDIE        BIT(25)	/* master STOP detected int enable */
+#define SPACEMIT_CR_MSDE         BIT(26)	/* master STOP detected enable */
+#define SPACEMIT_CR_TXDONEIE     BIT(27)	/* transaction done int enable */
+#define SPACEMIT_CR_TXEIE        BIT(28)	/* transmit FIFO empty int enable */
+#define SPACEMIT_CR_RXHFIE       BIT(29)	/* receive FIFO half-full int enable */
+#define SPACEMIT_CR_RXFIE        BIT(30)	/* receive FIFO full int enable */
+#define SPACEMIT_CR_RXOVIE       BIT(31)	/* receive FIFO overrun int enable */
+
+#define SPACEMIT_I2C_INT_CTRL_MASK	(SPACEMIT_CR_ALDIE | SPACEMIT_CR_DTEIE | \
+					 SPACEMIT_CR_DRFIE | SPACEMIT_CR_BEIE | \
+					 SPACEMIT_CR_TXDONEIE | SPACEMIT_CR_TXEIE | \
+					 SPACEMIT_CR_RXHFIE | SPACEMIT_CR_RXFIE | \
+					 SPACEMIT_CR_RXOVIE | SPACEMIT_CR_MSDIE)
+
+/* SPACEMIT_ISR register fields */
+/* Bits 0-13 are reserved */
+#define SPACEMIT_SR_ACKNAK       BIT(14)	/* ACK/NACK status */
+#define SPACEMIT_SR_UB           BIT(15)	/* unit busy */
+#define SPACEMIT_SR_IBB          BIT(16)	/* i2c bus busy */
+#define SPACEMIT_SR_EBB          BIT(17)	/* early bus busy */
+#define SPACEMIT_SR_ALD          BIT(18)	/* arbitration loss detected */
+#define SPACEMIT_SR_ITE          BIT(19)	/* tx buffer empty */
+#define SPACEMIT_SR_IRF          BIT(20)	/* rx buffer full */
+#define SPACEMIT_SR_GCAD         BIT(21)	/* general call address detected */
+#define SPACEMIT_SR_BED          BIT(22)	/* bus error no ACK/NAK */
+#define SPACEMIT_SR_SAD          BIT(23)	/* slave address detected */
+#define SPACEMIT_SR_SSD          BIT(24)	/* slave stop detected */
+/* Bit 25 is reserved */
+#define SPACEMIT_SR_MSD          BIT(26)	/* master stop detected */
+#define SPACEMIT_SR_TXDONE       BIT(27)	/* transaction done */
+#define SPACEMIT_SR_TXE          BIT(28)	/* tx FIFO empty */
+#define SPACEMIT_SR_RXHF         BIT(29)	/* rx FIFO half-full */
+#define SPACEMIT_SR_RXF          BIT(30)	/* rx FIFO full */
+#define SPACEMIT_SR_RXOV         BIT(31)	/* RX FIFO overrun */
+
+#define SPACEMIT_I2C_INT_STATUS_MASK	(SPACEMIT_SR_RXOV | SPACEMIT_SR_RXF | SPACEMIT_SR_RXHF | \
+					SPACEMIT_SR_TXE | SPACEMIT_SR_TXDONE | SPACEMIT_SR_MSD | \
+					SPACEMIT_SR_SSD | SPACEMIT_SR_SAD | SPACEMIT_SR_BED | \
+					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
+					SPACEMIT_SR_ALD)
+
+/* SPACEMIT_IBMR register fields */
+#define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
+#define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
+
+/* i2c bus recover timeout: us */
+#define SPACEMIT_I2C_BUS_BUSY_TIMEOUT	100000
+
+#define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
+
+#define SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ	100000
+#define SPACEMIT_I2C_MAX_FAST_MODE_FREQ		400000
+
+enum spacemit_i2c_state {
+	STATE_IDLE,
+	STATE_START,
+	STATE_READ,
+	STATE_WRITE,
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
+	u32 clock_freq;
+
+	struct i2c_msg *msgs;
+	int msg_num;
+
+	/* index of the current message being processed */
+	int msg_idx;
+	u8 *msg_buf;
+	/* the number of unprocessed bytes remaining in each message  */
+	size_t unprocessed;
+
+	enum spacemit_i2c_state state;
+	bool read;
+	struct completion complete;
+	u32 status;
+};
+
+static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val |= SPACEMIT_CR_IUE;
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~SPACEMIT_CR_IUE;
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
+{
+	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
+	udelay(5);
+	writel(0, i2c->base + SPACEMIT_ICR);
+}
+
+static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
+{
+	dev_dbg(i2c->dev, "i2c error status: 0x%08x\n", i2c->status);
+
+	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
+		spacemit_i2c_reset(i2c);
+		return -EAGAIN;
+	}
+
+	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
+}
+
+static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
+{
+	u32 status;
+
+	/* if bus is locked, reset unit. 0: locked */
+	status = readl(i2c->base + SPACEMIT_IBMR);
+	if ((status & SPACEMIT_BMR_SDA) && (status & SPACEMIT_BMR_SCL))
+		return;
+
+	spacemit_i2c_reset(i2c);
+	usleep_range(10, 20);
+
+	/* check scl status again */
+	status = readl(i2c->base + SPACEMIT_IBMR);
+	if (!(status & SPACEMIT_BMR_SCL))
+		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
+}
+
+static int spacemit_i2c_wait_bus_busy(struct spacemit_i2c_dev *i2c)
+{
+	int ret;
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ISR);
+	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
+		return 0;
+
+	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	if (ret)
+		spacemit_i2c_reset(i2c);
+
+	return ret;
+}
+
+static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
+{
+	/* in case bus is not released after transfer completes */
+	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
+		spacemit_i2c_conditionally_reset_bus(i2c);
+		usleep_range(90, 150);
+	}
+}
+
+static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	/*
+	 * Unmask interrupt bits for all xfer mode:
+	 * bus error, arbitration loss detected.
+	 * For transaction complete signal, we use master stop
+	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
+	 */
+	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
+
+	/*
+	 * Unmask interrupt bits for interrupt xfer mode:
+	 * DBR rx full.
+	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
+	 * need to enable when trigger byte transfer to start
+	 * data sending.
+	 */
+	val |= SPACEMIT_CR_DRFIE;
+
+	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
+		val |= SPACEMIT_CR_MODE_FAST;
+
+	/* disable response to general call */
+	val |= SPACEMIT_CR_GCD;
+
+	/* enable SCL clock output */
+	val |= SPACEMIT_CR_SCLE;
+
+	/* enable master stop detected */
+	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static inline void
+spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
+{
+	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
+}
+
+static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
+{
+	u32 slave_addr_rw, val;
+	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
+
+	i2c->read = !!(cur_msg->flags & I2C_M_RD);
+
+	i2c->state = STATE_START;
+
+	slave_addr_rw = (cur_msg->addr & 0x7f) << 1;
+	if (cur_msg->flags & I2C_M_RD)
+		slave_addr_rw |= 1;
+
+	writel(slave_addr_rw, i2c->base + SPACEMIT_IDBR);
+
+	/* send start pulse */
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~SPACEMIT_CR_STOP;
+	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
+
+	if (i2c->read)
+		val |= SPACEMIT_CR_ACKNAK;
+
+	writel(val, i2c->base + SPACEMIT_ICR);
+}
+
+static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long time_left;
+
+	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
+		i2c->msg_buf = (i2c->msgs + i2c->msg_idx)->buf;
+		i2c->status = 0;
+		i2c->unprocessed = (i2c->msgs + i2c->msg_idx)->len;
+
+		reinit_completion(&i2c->complete);
+
+		spacemit_i2c_start(i2c);
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							i2c->adapt.timeout);
+		if (time_left == 0) {
+			dev_err(i2c->dev, "msg completion timeout\n");
+			spacemit_i2c_conditionally_reset_bus(i2c);
+			spacemit_i2c_reset(i2c);
+			return -ETIMEDOUT;
+		}
+
+		if (i2c->status & SPACEMIT_SR_ERR)
+			return spacemit_i2c_handle_err(i2c);
+	}
+
+	return 0;
+}
+
+static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->msg_idx != i2c->msg_num - 1)
+		return false;
+
+	if (i2c->read)
+		return i2c->unprocessed == 1;
+
+	return !i2c->unprocessed;
+}
+
+static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
+{
+	/* if transfer completes, SPACEMIT_ISR will handle it */
+	if (i2c->status & SPACEMIT_SR_MSD)
+		return;
+
+	if (i2c->unprocessed) {
+		writel(*i2c->msg_buf++, i2c->base + SPACEMIT_IDBR);
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
+		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
+		i2c->unprocessed--;
+	}
+
+	/* if transfer completes, SPACEMIT_ISR will handle it */
+	if (i2c->status & (SPACEMIT_SR_MSD | SPACEMIT_SR_ACKNAK))
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
+	i2c->state = i2c->read ? STATE_READ : STATE_WRITE;
+	if (i2c->state == STATE_WRITE)
+		spacemit_i2c_handle_write(i2c);
+}
+
+static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	/*
+	 * send transaction complete signal:
+	 * error happens, detect master stop
+	 */
+	if (!(i2c->status & (SPACEMIT_SR_ERR | SPACEMIT_SR_MSD)))
+		return;
+
+	/*
+	 * Here the transaction is already done, we don't need any
+	 * other interrupt signals from now, in case any interrupt
+	 * happens before spacemit_i2c_xfer to disable irq and i2c unit,
+	 * we mask all the interrupt signals and clear the interrupt
+	 * status.
+	 */
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~SPACEMIT_I2C_INT_CTRL_MASK;
+	writel(val, i2c->base + SPACEMIT_ICR);
+
+	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
+
+	i2c->state = STATE_IDLE;
+	complete(&i2c->complete);
+}
+
+static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
+{
+	struct spacemit_i2c_dev *i2c = devid;
+	u32 status, val;
+
+	status = readl(i2c->base + SPACEMIT_ISR);
+	if (!status)
+		return IRQ_HANDLED;
+
+	i2c->status = status;
+
+	spacemit_i2c_clear_int_status(i2c, status);
+
+	if (i2c->status & SPACEMIT_SR_ERR)
+		goto err_out;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
+	writel(val, i2c->base + SPACEMIT_ICR);
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
+			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
+			writel(val, i2c->base + SPACEMIT_ICR);
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
+	int idx = 0, cnt = 0;
+
+	while (idx < i2c->msg_num) {
+		cnt += (i2c->msgs + idx)->len + 1;
+		idx++;
+	}
+
+	/*
+	 * multiply by 9 because each byte in I2C transmission requires
+	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
+	 */
+	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
+
+	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 2) / i2c->msg_num;
+}
+
+static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
+	int ret;
+
+	i2c->msgs = msgs;
+	i2c->msg_num = num;
+
+	spacemit_i2c_calc_timeout(i2c);
+
+	spacemit_i2c_init(i2c);
+
+	spacemit_i2c_enable(i2c);
+
+	ret = spacemit_i2c_wait_bus_busy(i2c);
+	if (!ret)
+		spacemit_i2c_xfer_msg(i2c);
+
+	if (ret < 0)
+		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
+	else if (ret)
+		spacemit_i2c_check_bus_release(i2c);
+
+	spacemit_i2c_disable(i2c);
+
+	if (ret == -ETIMEDOUT || ret == -EAGAIN)
+		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
+			  ret, i2c->status & SPACEMIT_SR_ERR);
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
+	struct clk *clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = pdev->dev.of_node;
+	struct spacemit_i2c_dev *i2c;
+	int ret;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read clock-frequency property");
+
+	/* For now, this driver doesn't support high-speed. */
+	if (i2c->clock_freq < 1 || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
+		dev_warn(dev, "unsupport clock frequency: %d, default: %d",
+			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
+		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
+	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
+		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
+	}
+
+	i2c->dev = &pdev->dev;
+
+	i2c->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(i2c->base))
+		return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
+
+	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
+			       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq");
+
+	clk = devm_clk_get_enabled(dev, "func");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
+
+	clk = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
+
+	spacemit_i2c_reset(i2c);
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
+	platform_set_drvdata(pdev, i2c);
+
+	ret = i2c_add_numbered_adapter(&i2c->adapt);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
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
+static const struct of_device_id spacemit_i2c_of_match[] = {
+	{ .compatible = "spacemit,k1-i2c", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
+
+static struct platform_driver spacemit_i2c_driver = {
+	.probe = spacemit_i2c_probe,
+	.remove = spacemit_i2c_remove,
+	.driver = {
+		.name = "i2c-k1",
+		.of_match_table = spacemit_i2c_of_match,
+	},
+};
+module_platform_driver(spacemit_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");

-- 
2.34.1


