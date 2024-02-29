Return-Path: <linux-i2c+bounces-2065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5539C86D1A6
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD0261F23D83
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E3E134428;
	Thu, 29 Feb 2024 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jvWIYsar"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BA4757F1;
	Thu, 29 Feb 2024 18:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230260; cv=none; b=U/dCCyyqmDWzuU9SZ43Beun26Cup6siyacR8f47uGQZskQsCcZqK8QHRKPV+20tOn2XSNYKYh+HRtKcIgveqh+1wb+GBL7HOJX1zyqC220TFbzmsvGXd3Dgj1zkqRt7ySbXoRKHRiCNOU/7FU1bgtfA6PehKPfStbS7q8ts8fSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230260; c=relaxed/simple;
	bh=f9/C0SGslGCRQI6/zJMaALntQykyMzeQEi5nn/tuW94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0PMNQDcMLuD6a/9CgfsJFQZbWIhsbRppquqiKQPmqV6QiTc2b/ajEy0VK2CfbBDOb3Qv7drGdcSbhX44G0Zk54g/jwr0oPs4HGHP9RLmJwvNjooz0iVb3ztIl2sHC6Wd95tmhKTm0KSaZO7iuFZJYcJjM0mBpgVLPjNieiIqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jvWIYsar; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E24DA60007;
	Thu, 29 Feb 2024 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCjh0+aS/A+7IMKQA2FEgABFQthhNr9Va5KccghwM7w=;
	b=jvWIYsarYxq+v2re+BGMJ5xGczbolXPAw9yNLdoliaYq6qYvVxeFKC1eh4wIDKtm4wEwiB
	e1cIvfpW1NGjDZ8SDauH0J2RrSFnG6PGiKtMzJzfniECT0TfspwDCOfvqBlw6Nz4EJFCYY
	ow2MFwEUWhWfvsNbG7nnd5RGaYddWNy9xMdZ/2tWLKXPCj40Q5o822tPvcsV6eu/Q3PaXD
	Fd+dLqowyHUwTq7nKb16ifPzkXAkI7IWmGaDtKP3JyZSTFsLOIKv8GPkv/cDk/SS1LxWXF
	cWt08nUhAz10JkycyOEDAvfUBpk+r23dnj871apdVDLDvERL8+311RpgC3l7/Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:51 +0100
Subject: [PATCH v2 03/11] i2c: nomadik: rename private struct pointers from
 dev to priv
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-3-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Disambiguate the usage of dev as a variable name; it is usually best to
keep it reserved for struct device pointers. Avoid having multiple
names for the same struct pointer (previously: dev, nmk, nmk_i2c).

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 428 +++++++++++++++++++--------------------
 1 file changed, 214 insertions(+), 214 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b10574d42b7a..cd511c884f99 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -206,12 +206,12 @@ static inline void i2c_clr_bit(void __iomem *reg, u32 mask)
 
 /**
  * flush_i2c_fifo() - This function flushes the I2C FIFO
- * @dev: private data of I2C Driver
+ * @priv: private data of I2C Driver
  *
  * This function flushes the I2C Tx and Rx FIFOs. It returns
  * 0 on successful flushing of FIFO
  */
-static int flush_i2c_fifo(struct nmk_i2c_dev *dev)
+static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
 {
 #define LOOP_ATTEMPTS 10
 	int i;
@@ -224,19 +224,19 @@ static int flush_i2c_fifo(struct nmk_i2c_dev *dev)
 	 * bits, until then no one must access Tx, Rx FIFO and
 	 * should poll on these bits waiting for the completion.
 	 */
-	writel((I2C_CR_FTX | I2C_CR_FRX), dev->virtbase + I2C_CR);
+	writel((I2C_CR_FTX | I2C_CR_FRX), priv->virtbase + I2C_CR);
 
 	for (i = 0; i < LOOP_ATTEMPTS; i++) {
-		timeout = jiffies + dev->adap.timeout;
+		timeout = jiffies + priv->adap.timeout;
 
 		while (!time_after(jiffies, timeout)) {
-			if ((readl(dev->virtbase + I2C_CR) &
+			if ((readl(priv->virtbase + I2C_CR) &
 				(I2C_CR_FTX | I2C_CR_FRX)) == 0)
-					return 0;
+				return 0;
 		}
 	}
 
-	dev_err(&dev->adev->dev,
+	dev_err(&priv->adev->dev,
 		"flushing operation timed out giving up after %d attempts",
 		LOOP_ATTEMPTS);
 
@@ -245,45 +245,45 @@ static int flush_i2c_fifo(struct nmk_i2c_dev *dev)
 
 /**
  * disable_all_interrupts() - Disable all interrupts of this I2c Bus
- * @dev: private data of I2C Driver
+ * @priv: private data of I2C Driver
  */
-static void disable_all_interrupts(struct nmk_i2c_dev *dev)
+static void disable_all_interrupts(struct nmk_i2c_dev *priv)
 {
 	u32 mask = IRQ_MASK(0);
-	writel(mask, dev->virtbase + I2C_IMSCR);
+	writel(mask, priv->virtbase + I2C_IMSCR);
 }
 
 /**
  * clear_all_interrupts() - Clear all interrupts of I2C Controller
- * @dev: private data of I2C Driver
+ * @priv: private data of I2C Driver
  */
-static void clear_all_interrupts(struct nmk_i2c_dev *dev)
+static void clear_all_interrupts(struct nmk_i2c_dev *priv)
 {
 	u32 mask;
 	mask = IRQ_MASK(I2C_CLEAR_ALL_INTS);
-	writel(mask, dev->virtbase + I2C_ICR);
+	writel(mask, priv->virtbase + I2C_ICR);
 }
 
 /**
  * init_hw() - initialize the I2C hardware
- * @dev: private data of I2C Driver
+ * @priv: private data of I2C Driver
  */
-static int init_hw(struct nmk_i2c_dev *dev)
+static int init_hw(struct nmk_i2c_dev *priv)
 {
 	int stat;
 
-	stat = flush_i2c_fifo(dev);
+	stat = flush_i2c_fifo(priv);
 	if (stat)
 		goto exit;
 
 	/* disable the controller */
-	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
+	i2c_clr_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	disable_all_interrupts(dev);
+	disable_all_interrupts(priv);
 
-	clear_all_interrupts(dev);
+	clear_all_interrupts(priv);
 
-	dev->cli.operation = I2C_NO_OPERATION;
+	priv->cli.operation = I2C_NO_OPERATION;
 
 exit:
 	return stat;
@@ -294,15 +294,15 @@ static int init_hw(struct nmk_i2c_dev *dev)
 
 /**
  * load_i2c_mcr_reg() - load the MCR register
- * @dev: private data of controller
+ * @priv: private data of controller
  * @flags: message flags
  */
-static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *dev, u16 flags)
+static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *priv, u16 flags)
 {
 	u32 mcr = 0;
 	unsigned short slave_adr_3msb_bits;
 
-	mcr |= GEN_MASK(dev->cli.slave_adr, I2C_MCR_A7, 1);
+	mcr |= GEN_MASK(priv->cli.slave_adr, I2C_MCR_A7, 1);
 
 	if (unlikely(flags & I2C_M_TEN)) {
 		/* 10-bit address transaction */
@@ -313,7 +313,7 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *dev, u16 flags)
 		 * the extension (MSB bits) of the 7 bit address loaded
 		 * in A7
 		 */
-		slave_adr_3msb_bits = (dev->cli.slave_adr >> 7) & 0x7;
+		slave_adr_3msb_bits = (priv->cli.slave_adr >> 7) & 0x7;
 
 		mcr |= GEN_MASK(slave_adr_3msb_bits, I2C_MCR_EA10, 8);
 	} else {
@@ -325,40 +325,40 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *dev, u16 flags)
 	mcr |= GEN_MASK(0, I2C_MCR_SB, 11);
 
 	/* check the operation, master read/write? */
-	if (dev->cli.operation == I2C_WRITE)
+	if (priv->cli.operation == I2C_WRITE)
 		mcr |= GEN_MASK(I2C_WRITE, I2C_MCR_OP, 0);
 	else
 		mcr |= GEN_MASK(I2C_READ, I2C_MCR_OP, 0);
 
 	/* stop or repeated start? */
-	if (dev->stop)
+	if (priv->stop)
 		mcr |= GEN_MASK(1, I2C_MCR_STOP, 14);
 	else
 		mcr &= ~(GEN_MASK(1, I2C_MCR_STOP, 14));
 
-	mcr |= GEN_MASK(dev->cli.count, I2C_MCR_LENGTH, 15);
+	mcr |= GEN_MASK(priv->cli.count, I2C_MCR_LENGTH, 15);
 
 	return mcr;
 }
 
 /**
  * setup_i2c_controller() - setup the controller
- * @dev: private data of controller
+ * @priv: private data of controller
  */
-static void setup_i2c_controller(struct nmk_i2c_dev *dev)
+static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 {
 	u32 brcr1, brcr2;
 	u32 i2c_clk, div;
 	u32 ns;
 	u16 slsu;
 
-	writel(0x0, dev->virtbase + I2C_CR);
-	writel(0x0, dev->virtbase + I2C_HSMCR);
-	writel(0x0, dev->virtbase + I2C_TFTR);
-	writel(0x0, dev->virtbase + I2C_RFTR);
-	writel(0x0, dev->virtbase + I2C_DMAR);
+	writel(0x0, priv->virtbase + I2C_CR);
+	writel(0x0, priv->virtbase + I2C_HSMCR);
+	writel(0x0, priv->virtbase + I2C_TFTR);
+	writel(0x0, priv->virtbase + I2C_RFTR);
+	writel(0x0, priv->virtbase + I2C_DMAR);
 
-	i2c_clk = clk_get_rate(dev->clk);
+	i2c_clk = clk_get_rate(priv->clk);
 
 	/*
 	 * set the slsu:
@@ -373,7 +373,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
 	 * slsu = cycles / (1000000000 / f) + 1
 	 */
 	ns = DIV_ROUND_UP_ULL(1000000000ULL, i2c_clk);
-	switch (dev->sm) {
+	switch (priv->sm) {
 	case I2C_FREQ_MODE_FAST:
 	case I2C_FREQ_MODE_FAST_PLUS:
 		slsu = DIV_ROUND_UP(100, ns); /* Fast */
@@ -388,15 +388,15 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
 	}
 	slsu += 1;
 
-	dev_dbg(&dev->adev->dev, "calculated SLSU = %04x\n", slsu);
-	writel(slsu << 16, dev->virtbase + I2C_SCR);
+	dev_dbg(&priv->adev->dev, "calculated SLSU = %04x\n", slsu);
+	writel(slsu << 16, priv->virtbase + I2C_SCR);
 
 	/*
 	 * The spec says, in case of std. mode the divider is
 	 * 2 whereas it is 3 for fast and fastplus mode of
 	 * operation. TODO - high speed support.
 	 */
-	div = (dev->clk_freq > I2C_MAX_STANDARD_MODE_FREQ) ? 3 : 2;
+	div = (priv->clk_freq > I2C_MAX_STANDARD_MODE_FREQ) ? 3 : 2;
 
 	/*
 	 * generate the mask for baud rate counters. The controller
@@ -406,10 +406,10 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
 	 * so set brcr1 to 0.
 	 */
 	brcr1 = 0 << 16;
-	brcr2 = (i2c_clk/(dev->clk_freq * div)) & 0xffff;
+	brcr2 = (i2c_clk / (priv->clk_freq * div)) & 0xffff;
 
 	/* set the baud rate counter register */
-	writel((brcr1 | brcr2), dev->virtbase + I2C_BRCR);
+	writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);
 
 	/*
 	 * set the speed mode. Currently we support
@@ -417,125 +417,124 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
 	 * TODO - support for fast mode plus (up to 1Mb/s)
 	 * and high speed (up to 3.4 Mb/s)
 	 */
-	if (dev->sm > I2C_FREQ_MODE_FAST) {
-		dev_err(&dev->adev->dev,
+	if (priv->sm > I2C_FREQ_MODE_FAST) {
+		dev_err(&priv->adev->dev,
 			"do not support this mode defaulting to std. mode\n");
 		brcr2 = i2c_clk / (I2C_MAX_STANDARD_MODE_FREQ * 2) & 0xffff;
-		writel((brcr1 | brcr2), dev->virtbase + I2C_BRCR);
+		writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);
 		writel(I2C_FREQ_MODE_STANDARD << 4,
-				dev->virtbase + I2C_CR);
+				priv->virtbase + I2C_CR);
 	}
-	writel(dev->sm << 4, dev->virtbase + I2C_CR);
+	writel(priv->sm << 4, priv->virtbase + I2C_CR);
 
 	/* set the Tx and Rx FIFO threshold */
-	writel(dev->tft, dev->virtbase + I2C_TFTR);
-	writel(dev->rft, dev->virtbase + I2C_RFTR);
+	writel(priv->tft, priv->virtbase + I2C_TFTR);
+	writel(priv->rft, priv->virtbase + I2C_RFTR);
 }
 
 /**
  * read_i2c() - Read from I2C client device
- * @dev: private data of I2C Driver
+ * @priv: private data of I2C Driver
  * @flags: message flags
  *
  * This function reads from i2c client device when controller is in
  * master mode. There is a completion timeout. If there is no transfer
  * before timeout error is returned.
  */
-static int read_i2c(struct nmk_i2c_dev *dev, u16 flags)
+static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 {
 	int status = 0;
 	u32 mcr, irq_mask;
 	unsigned long timeout;
 
-	mcr = load_i2c_mcr_reg(dev, flags);
-	writel(mcr, dev->virtbase + I2C_MCR);
+	mcr = load_i2c_mcr_reg(priv, flags);
+	writel(mcr, priv->virtbase + I2C_MCR);
 
 	/* load the current CR value */
-	writel(readl(dev->virtbase + I2C_CR) | DEFAULT_I2C_REG_CR,
-			dev->virtbase + I2C_CR);
+	writel(readl(priv->virtbase + I2C_CR) | DEFAULT_I2C_REG_CR,
+	       priv->virtbase + I2C_CR);
 
 	/* enable the controller */
-	i2c_set_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
+	i2c_set_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	init_completion(&dev->xfer_complete);
+	init_completion(&priv->xfer_complete);
 
 	/* enable interrupts by setting the mask */
 	irq_mask = (I2C_IT_RXFNF | I2C_IT_RXFF |
 			I2C_IT_MAL | I2C_IT_BERR);
 
-	if (dev->stop || !dev->vendor->has_mtdws)
+	if (priv->stop || !priv->vendor->has_mtdws)
 		irq_mask |= I2C_IT_MTD;
 	else
 		irq_mask |= I2C_IT_MTDWS;
 
 	irq_mask = I2C_CLEAR_ALL_INTS & IRQ_MASK(irq_mask);
 
-	writel(readl(dev->virtbase + I2C_IMSCR) | irq_mask,
-			dev->virtbase + I2C_IMSCR);
+	writel(readl(priv->virtbase + I2C_IMSCR) | irq_mask,
+	       priv->virtbase + I2C_IMSCR);
 
 	timeout = wait_for_completion_timeout(
-		&dev->xfer_complete, dev->adap.timeout);
+		&priv->xfer_complete, priv->adap.timeout);
 
 	if (timeout == 0) {
 		/* Controller timed out */
-		dev_err(&dev->adev->dev, "read from slave 0x%x timed out\n",
-				dev->cli.slave_adr);
+		dev_err(&priv->adev->dev, "read from slave 0x%x timed out\n",
+			priv->cli.slave_adr);
 		status = -ETIMEDOUT;
 	}
 	return status;
 }
 
-static void fill_tx_fifo(struct nmk_i2c_dev *dev, int no_bytes)
+static void fill_tx_fifo(struct nmk_i2c_dev *priv, int no_bytes)
 {
 	int count;
 
 	for (count = (no_bytes - 2);
 			(count > 0) &&
-			(dev->cli.count != 0);
+			(priv->cli.count != 0);
 			count--) {
 		/* write to the Tx FIFO */
-		writeb(*dev->cli.buffer,
-			dev->virtbase + I2C_TFR);
-		dev->cli.buffer++;
-		dev->cli.count--;
-		dev->cli.xfer_bytes++;
+		writeb(*priv->cli.buffer, priv->virtbase + I2C_TFR);
+		priv->cli.buffer++;
+		priv->cli.count--;
+		priv->cli.xfer_bytes++;
 	}
 
 }
 
 /**
  * write_i2c() - Write data to I2C client.
- * @dev: private data of I2C Driver
+ * @priv: private data of I2C Driver
  * @flags: message flags
  *
  * This function writes data to I2C client
  */
-static int write_i2c(struct nmk_i2c_dev *dev, u16 flags)
+static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 {
 	u32 status = 0;
 	u32 mcr, irq_mask;
 	unsigned long timeout;
 
-	mcr = load_i2c_mcr_reg(dev, flags);
+	mcr = load_i2c_mcr_reg(priv, flags);
 
-	writel(mcr, dev->virtbase + I2C_MCR);
+	writel(mcr, priv->virtbase + I2C_MCR);
 
 	/* load the current CR value */
-	writel(readl(dev->virtbase + I2C_CR) | DEFAULT_I2C_REG_CR,
-			dev->virtbase + I2C_CR);
+	writel(readl(priv->virtbase + I2C_CR) | DEFAULT_I2C_REG_CR,
+	       priv->virtbase + I2C_CR);
 
 	/* enable the controller */
-	i2c_set_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
+	i2c_set_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	init_completion(&dev->xfer_complete);
+	init_completion(&priv->xfer_complete);
 
 	/* enable interrupts by settings the masks */
 	irq_mask = (I2C_IT_TXFOVR | I2C_IT_MAL | I2C_IT_BERR);
 
 	/* Fill the TX FIFO with transmit data */
-	fill_tx_fifo(dev, MAX_I2C_FIFO_THRESHOLD);
+	fill_tx_fifo(priv, MAX_I2C_FIFO_THRESHOLD);
 
-	if (dev->cli.count != 0)
+	if (priv->cli.count != 0)
 		irq_mask |= I2C_IT_TXFNE;
 
 	/*
@@ -543,23 +542,23 @@ static int write_i2c(struct nmk_i2c_dev *dev, u16 flags)
 	 * set the MTDWS bit (Master Transaction Done Without Stop)
 	 * to start repeated start operation
 	 */
-	if (dev->stop || !dev->vendor->has_mtdws)
+	if (priv->stop || !priv->vendor->has_mtdws)
 		irq_mask |= I2C_IT_MTD;
 	else
 		irq_mask |= I2C_IT_MTDWS;
 
 	irq_mask = I2C_CLEAR_ALL_INTS & IRQ_MASK(irq_mask);
 
-	writel(readl(dev->virtbase + I2C_IMSCR) | irq_mask,
-			dev->virtbase + I2C_IMSCR);
+	writel(readl(priv->virtbase + I2C_IMSCR) | irq_mask,
+	       priv->virtbase + I2C_IMSCR);
 
 	timeout = wait_for_completion_timeout(
-		&dev->xfer_complete, dev->adap.timeout);
+		&priv->xfer_complete, priv->adap.timeout);
 
 	if (timeout == 0) {
 		/* Controller timed out */
-		dev_err(&dev->adev->dev, "write to slave 0x%x timed out\n",
-				dev->cli.slave_adr);
+		dev_err(&priv->adev->dev, "write to slave 0x%x timed out\n",
+			priv->cli.slave_adr);
 		status = -ETIMEDOUT;
 	}
 
@@ -568,28 +567,28 @@ static int write_i2c(struct nmk_i2c_dev *dev, u16 flags)
 
 /**
  * nmk_i2c_xfer_one() - transmit a single I2C message
- * @dev: device with a message encoded into it
+ * @priv: device with a message encoded into it
  * @flags: message flags
  */
-static int nmk_i2c_xfer_one(struct nmk_i2c_dev *dev, u16 flags)
+static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 {
 	int status;
 
 	if (flags & I2C_M_RD) {
 		/* read operation */
-		dev->cli.operation = I2C_READ;
-		status = read_i2c(dev, flags);
+		priv->cli.operation = I2C_READ;
+		status = read_i2c(priv, flags);
 	} else {
 		/* write operation */
-		dev->cli.operation = I2C_WRITE;
-		status = write_i2c(dev, flags);
+		priv->cli.operation = I2C_WRITE;
+		status = write_i2c(priv, flags);
 	}
 
-	if (status || (dev->result)) {
+	if (status || priv->result) {
 		u32 i2c_sr;
 		u32 cause;
 
-		i2c_sr = readl(dev->virtbase + I2C_SR);
+		i2c_sr = readl(priv->virtbase + I2C_SR);
 		/*
 		 * Check if the controller I2C operation status
 		 * is set to ABORT(11b).
@@ -597,15 +596,15 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *dev, u16 flags)
 		if (((i2c_sr >> 2) & 0x3) == 0x3) {
 			/* get the abort cause */
 			cause =	(i2c_sr >> 4) & 0x7;
-			dev_err(&dev->adev->dev, "%s\n",
+			dev_err(&priv->adev->dev, "%s\n",
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
 				abort_causes[cause]);
 		}
 
-		(void) init_hw(dev);
+		init_hw(priv);
 
-		status = status ? status : dev->result;
+		status = status ? status : priv->result;
 	}
 
 	return status;
@@ -663,24 +662,24 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 {
 	int status = 0;
 	int i;
-	struct nmk_i2c_dev *dev = i2c_get_adapdata(i2c_adap);
+	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
 	int j;
 
-	pm_runtime_get_sync(&dev->adev->dev);
+	pm_runtime_get_sync(&priv->adev->dev);
 
 	/* Attempt three times to send the message queue */
 	for (j = 0; j < 3; j++) {
 		/* setup the i2c controller */
-		setup_i2c_controller(dev);
+		setup_i2c_controller(priv);
 
 		for (i = 0; i < num_msgs; i++) {
-			dev->cli.slave_adr	= msgs[i].addr;
-			dev->cli.buffer		= msgs[i].buf;
-			dev->cli.count		= msgs[i].len;
-			dev->stop = (i < (num_msgs - 1)) ? 0 : 1;
-			dev->result = 0;
+			priv->cli.slave_adr	= msgs[i].addr;
+			priv->cli.buffer		= msgs[i].buf;
+			priv->cli.count		= msgs[i].len;
+			priv->stop = (i < (num_msgs - 1)) ? 0 : 1;
+			priv->result = 0;
 
-			status = nmk_i2c_xfer_one(dev, msgs[i].flags);
+			status = nmk_i2c_xfer_one(priv, msgs[i].flags);
 			if (status != 0)
 				break;
 		}
@@ -688,7 +687,7 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 			break;
 	}
 
-	pm_runtime_put_sync(&dev->adev->dev);
+	pm_runtime_put_sync(&priv->adev->dev);
 
 	/* return the no. messages processed */
 	if (status)
@@ -699,14 +698,14 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 /**
  * disable_interrupts() - disable the interrupts
- * @dev: private data of controller
+ * @priv: private data of controller
  * @irq: interrupt number
  */
-static int disable_interrupts(struct nmk_i2c_dev *dev, u32 irq)
+static int disable_interrupts(struct nmk_i2c_dev *priv, u32 irq)
 {
 	irq = IRQ_MASK(irq);
-	writel(readl(dev->virtbase + I2C_IMSCR) & ~(I2C_CLEAR_ALL_INTS & irq),
-			dev->virtbase + I2C_IMSCR);
+	writel(readl(priv->virtbase + I2C_IMSCR) & ~(I2C_CLEAR_ALL_INTS & irq),
+	       priv->virtbase + I2C_IMSCR);
 	return 0;
 }
 
@@ -723,17 +722,18 @@ static int disable_interrupts(struct nmk_i2c_dev *dev, u32 irq)
  */
 static irqreturn_t i2c_irq_handler(int irq, void *arg)
 {
-	struct nmk_i2c_dev *dev = arg;
+	struct nmk_i2c_dev *priv = arg;
+	struct device *dev = &priv->adev->dev;
 	u32 tft, rft;
 	u32 count;
 	u32 misr, src;
 
 	/* load Tx FIFO and Rx FIFO threshold values */
-	tft = readl(dev->virtbase + I2C_TFTR);
-	rft = readl(dev->virtbase + I2C_RFTR);
+	tft = readl(priv->virtbase + I2C_TFTR);
+	rft = readl(priv->virtbase + I2C_RFTR);
 
 	/* read interrupt status register */
-	misr = readl(dev->virtbase + I2C_MISR);
+	misr = readl(priv->virtbase + I2C_MISR);
 
 	src = __ffs(misr);
 	switch ((1 << src)) {
@@ -741,20 +741,20 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	/* Transmit FIFO nearly empty interrupt */
 	case I2C_IT_TXFNE:
 	{
-		if (dev->cli.operation == I2C_READ) {
+		if (priv->cli.operation == I2C_READ) {
 			/*
 			 * in read operation why do we care for writing?
 			 * so disable the Transmit FIFO interrupt
 			 */
-			disable_interrupts(dev, I2C_IT_TXFNE);
+			disable_interrupts(priv, I2C_IT_TXFNE);
 		} else {
-			fill_tx_fifo(dev, (MAX_I2C_FIFO_THRESHOLD - tft));
+			fill_tx_fifo(priv, (MAX_I2C_FIFO_THRESHOLD - tft));
 			/*
 			 * if done, close the transfer by disabling the
 			 * corresponding TXFNE interrupt
 			 */
-			if (dev->cli.count == 0)
-				disable_interrupts(dev,	I2C_IT_TXFNE);
+			if (priv->cli.count == 0)
+				disable_interrupts(priv,	I2C_IT_TXFNE);
 		}
 	}
 	break;
@@ -768,60 +768,59 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	case I2C_IT_RXFNF:
 		for (count = rft; count > 0; count--) {
 			/* Read the Rx FIFO */
-			*dev->cli.buffer = readb(dev->virtbase + I2C_RFR);
-			dev->cli.buffer++;
+			*priv->cli.buffer = readb(priv->virtbase + I2C_RFR);
+			priv->cli.buffer++;
 		}
-		dev->cli.count -= rft;
-		dev->cli.xfer_bytes += rft;
+		priv->cli.count -= rft;
+		priv->cli.xfer_bytes += rft;
 		break;
 
 	/* Rx FIFO full */
 	case I2C_IT_RXFF:
 		for (count = MAX_I2C_FIFO_THRESHOLD; count > 0; count--) {
-			*dev->cli.buffer = readb(dev->virtbase + I2C_RFR);
-			dev->cli.buffer++;
+			*priv->cli.buffer = readb(priv->virtbase + I2C_RFR);
+			priv->cli.buffer++;
 		}
-		dev->cli.count -= MAX_I2C_FIFO_THRESHOLD;
-		dev->cli.xfer_bytes += MAX_I2C_FIFO_THRESHOLD;
+		priv->cli.count -= MAX_I2C_FIFO_THRESHOLD;
+		priv->cli.xfer_bytes += MAX_I2C_FIFO_THRESHOLD;
 		break;
 
 	/* Master Transaction Done with/without stop */
 	case I2C_IT_MTD:
 	case I2C_IT_MTDWS:
-		if (dev->cli.operation == I2C_READ) {
-			while (!(readl(dev->virtbase + I2C_RISR)
+		if (priv->cli.operation == I2C_READ) {
+			while (!(readl(priv->virtbase + I2C_RISR)
 				 & I2C_IT_RXFE)) {
-				if (dev->cli.count == 0)
+				if (priv->cli.count == 0)
 					break;
-				*dev->cli.buffer =
-					readb(dev->virtbase + I2C_RFR);
-				dev->cli.buffer++;
-				dev->cli.count--;
-				dev->cli.xfer_bytes++;
+				*priv->cli.buffer =
+					readb(priv->virtbase + I2C_RFR);
+				priv->cli.buffer++;
+				priv->cli.count--;
+				priv->cli.xfer_bytes++;
 			}
 		}
 
-		disable_all_interrupts(dev);
-		clear_all_interrupts(dev);
+		disable_all_interrupts(priv);
+		clear_all_interrupts(priv);
 
-		if (dev->cli.count) {
-			dev->result = -EIO;
-			dev_err(&dev->adev->dev,
-				"%lu bytes still remain to be xfered\n",
-				dev->cli.count);
-			(void) init_hw(dev);
+		if (priv->cli.count) {
+			priv->result = -EIO;
+			dev_err(dev, "%lu bytes still remain to be xfered\n",
+				priv->cli.count);
+			init_hw(priv);
 		}
-		complete(&dev->xfer_complete);
+		complete(&priv->xfer_complete);
 
 		break;
 
 	/* Master Arbitration lost interrupt */
 	case I2C_IT_MAL:
-		dev->result = -EIO;
-		(void) init_hw(dev);
+		priv->result = -EIO;
+		init_hw(priv);
 
-		i2c_set_bit(dev->virtbase + I2C_ICR, I2C_IT_MAL);
-		complete(&dev->xfer_complete);
+		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_MAL);
+		complete(&priv->xfer_complete);
 
 		break;
 
@@ -831,13 +830,13 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	 * during the transaction.
 	 */
 	case I2C_IT_BERR:
-		dev->result = -EIO;
+		priv->result = -EIO;
 		/* get the status */
-		if (((readl(dev->virtbase + I2C_SR) >> 2) & 0x3) == I2C_ABORT)
-			(void) init_hw(dev);
+		if (((readl(priv->virtbase + I2C_SR) >> 2) & 0x3) == I2C_ABORT)
+			init_hw(priv);
 
-		i2c_set_bit(dev->virtbase + I2C_ICR, I2C_IT_BERR);
-		complete(&dev->xfer_complete);
+		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_BERR);
+		complete(&priv->xfer_complete);
 
 		break;
 
@@ -847,11 +846,11 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	 * the Tx FIFO is full.
 	 */
 	case I2C_IT_TXFOVR:
-		dev->result = -EIO;
-		(void) init_hw(dev);
+		priv->result = -EIO;
+		init_hw(priv);
 
-		dev_err(&dev->adev->dev, "Tx Fifo Over run\n");
-		complete(&dev->xfer_complete);
+		dev_err(dev, "Tx Fifo Over run\n");
+		complete(&priv->xfer_complete);
 
 		break;
 
@@ -863,10 +862,10 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	case I2C_IT_RFSE:
 	case I2C_IT_WTSR:
 	case I2C_IT_STD:
-		dev_err(&dev->adev->dev, "unhandled Interrupt\n");
+		dev_err(dev, "unhandled Interrupt\n");
 		break;
 	default:
-		dev_err(&dev->adev->dev, "spurious Interrupt..\n");
+		dev_err(dev, "spurious Interrupt..\n");
 		break;
 	}
 
@@ -893,9 +892,9 @@ static int nmk_i2c_resume_early(struct device *dev)
 static int nmk_i2c_runtime_suspend(struct device *dev)
 {
 	struct amba_device *adev = to_amba_device(dev);
-	struct nmk_i2c_dev *nmk_i2c = amba_get_drvdata(adev);
+	struct nmk_i2c_dev *priv = amba_get_drvdata(adev);
 
-	clk_disable_unprepare(nmk_i2c->clk);
+	clk_disable_unprepare(priv->clk);
 	pinctrl_pm_select_idle_state(dev);
 	return 0;
 }
@@ -903,10 +902,10 @@ static int nmk_i2c_runtime_suspend(struct device *dev)
 static int nmk_i2c_runtime_resume(struct device *dev)
 {
 	struct amba_device *adev = to_amba_device(dev);
-	struct nmk_i2c_dev *nmk_i2c = amba_get_drvdata(adev);
+	struct nmk_i2c_dev *priv = amba_get_drvdata(adev);
 	int ret;
 
-	ret = clk_prepare_enable(nmk_i2c->clk);
+	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(dev, "can't prepare_enable clock\n");
 		return ret;
@@ -914,9 +913,9 @@ static int nmk_i2c_runtime_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	ret = init_hw(nmk_i2c);
+	ret = init_hw(priv);
 	if (ret) {
-		clk_disable_unprepare(nmk_i2c->clk);
+		clk_disable_unprepare(priv->clk);
 		pinctrl_pm_select_idle_state(dev);
 	}
 
@@ -939,107 +938,108 @@ static const struct i2c_algorithm nmk_i2c_algo = {
 };
 
 static void nmk_i2c_of_probe(struct device_node *np,
-			     struct nmk_i2c_dev *nmk)
+			     struct nmk_i2c_dev *priv)
 {
 	/* Default to 100 kHz if no frequency is given in the node */
-	if (of_property_read_u32(np, "clock-frequency", &nmk->clk_freq))
-		nmk->clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
+	if (of_property_read_u32(np, "clock-frequency", &priv->clk_freq))
+		priv->clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 
 	/* This driver only supports 'standard' and 'fast' modes of operation. */
-	if (nmk->clk_freq <= I2C_MAX_STANDARD_MODE_FREQ)
-		nmk->sm = I2C_FREQ_MODE_STANDARD;
+	if (priv->clk_freq <= I2C_MAX_STANDARD_MODE_FREQ)
+		priv->sm = I2C_FREQ_MODE_STANDARD;
 	else
-		nmk->sm = I2C_FREQ_MODE_FAST;
-	nmk->tft = 1; /* Tx FIFO threshold */
-	nmk->rft = 8; /* Rx FIFO threshold */
-	nmk->timeout = 200; /* Slave response timeout(ms) */
+		priv->sm = I2C_FREQ_MODE_FAST;
+	priv->tft = 1; /* Tx FIFO threshold */
+	priv->rft = 8; /* Rx FIFO threshold */
+	priv->timeout = 200; /* Slave response timeout(ms) */
 }
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int ret = 0;
+	struct nmk_i2c_dev *priv;
 	struct device_node *np = adev->dev.of_node;
-	struct nmk_i2c_dev	*dev;
+	struct device *dev = &adev->dev;
 	struct i2c_adapter *adap;
 	struct i2c_vendor_data *vendor = id->data;
 	u32 max_fifo_threshold = (vendor->fifodepth / 2) - 1;
 
-	dev = devm_kzalloc(&adev->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev)
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	dev->vendor = vendor;
-	dev->adev = adev;
-	nmk_i2c_of_probe(np, dev);
+	priv->vendor = vendor;
+	priv->adev = adev;
+	nmk_i2c_of_probe(np, priv);
 
-	if (dev->tft > max_fifo_threshold) {
-		dev_warn(&adev->dev, "requested TX FIFO threshold %u, adjusted down to %u\n",
-			 dev->tft, max_fifo_threshold);
-		dev->tft = max_fifo_threshold;
+	if (priv->tft > max_fifo_threshold) {
+		dev_warn(dev, "requested TX FIFO threshold %u, adjusted down to %u\n",
+			 priv->tft, max_fifo_threshold);
+		priv->tft = max_fifo_threshold;
 	}
 
-	if (dev->rft > max_fifo_threshold) {
-		dev_warn(&adev->dev, "requested RX FIFO threshold %u, adjusted down to %u\n",
-			dev->rft, max_fifo_threshold);
-		dev->rft = max_fifo_threshold;
+	if (priv->rft > max_fifo_threshold) {
+		dev_warn(dev, "requested RX FIFO threshold %u, adjusted down to %u\n",
+			 priv->rft, max_fifo_threshold);
+		priv->rft = max_fifo_threshold;
 	}
 
-	amba_set_drvdata(adev, dev);
+	amba_set_drvdata(adev, priv);
 
-	dev->virtbase = devm_ioremap(&adev->dev, adev->res.start,
-				resource_size(&adev->res));
-	if (!dev->virtbase)
+	priv->virtbase = devm_ioremap(dev, adev->res.start,
+				      resource_size(&adev->res));
+	if (!priv->virtbase)
 		return -ENOMEM;
 
-	dev->irq = adev->irq[0];
-	ret = devm_request_irq(&adev->dev, dev->irq, i2c_irq_handler, 0,
-				DRIVER_NAME, dev);
+	priv->irq = adev->irq[0];
+	ret = devm_request_irq(dev, priv->irq, i2c_irq_handler, 0,
+			       DRIVER_NAME, priv);
 	if (ret)
-		return dev_err_probe(&adev->dev, ret,
-				     "cannot claim the irq %d\n", dev->irq);
+		return dev_err_probe(dev, ret,
+				     "cannot claim the irq %d\n", priv->irq);
 
-	dev->clk = devm_clk_get_enabled(&adev->dev, NULL);
-	if (IS_ERR(dev->clk))
-		return dev_err_probe(&adev->dev, PTR_ERR(dev->clk),
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "could enable i2c clock\n");
 
-	init_hw(dev);
+	init_hw(priv);
 
-	adap = &dev->adap;
+	adap = &priv->adap;
 	adap->dev.of_node = np;
-	adap->dev.parent = &adev->dev;
+	adap->dev.parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;
-	adap->timeout = msecs_to_jiffies(dev->timeout);
+	adap->timeout = msecs_to_jiffies(priv->timeout);
 	snprintf(adap->name, sizeof(adap->name),
 		 "Nomadik I2C at %pR", &adev->res);
 
-	i2c_set_adapdata(adap, dev);
+	i2c_set_adapdata(adap, priv);
 
-	dev_info(&adev->dev,
+	dev_info(dev,
 		 "initialize %s on virtual base %p\n",
-		 adap->name, dev->virtbase);
+		 adap->name, priv->virtbase);
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
 		return ret;
 
-	pm_runtime_put(&adev->dev);
+	pm_runtime_put(dev);
 
 	return 0;
 }
 
 static void nmk_i2c_remove(struct amba_device *adev)
 {
-	struct nmk_i2c_dev *dev = amba_get_drvdata(adev);
+	struct nmk_i2c_dev *priv = amba_get_drvdata(adev);
 
-	i2c_del_adapter(&dev->adap);
-	flush_i2c_fifo(dev);
-	disable_all_interrupts(dev);
-	clear_all_interrupts(dev);
+	i2c_del_adapter(&priv->adap);
+	flush_i2c_fifo(priv);
+	disable_all_interrupts(priv);
+	clear_all_interrupts(priv);
 	/* disable the controller */
-	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
+	i2c_clr_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 }
 
 static struct i2c_vendor_data vendor_stn8815 = {

-- 
2.44.0


