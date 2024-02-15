Return-Path: <linux-i2c+bounces-1756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A2856A1D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6591F237B4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57881386DB;
	Thu, 15 Feb 2024 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VVirSm/5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2462136998;
	Thu, 15 Feb 2024 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015962; cv=none; b=WxyRyBPNKx/7so4DmieIfw+pQi6PyJG1eCpg6m2DEqxl2JBzhK11wy1O1Obt19Mv+8D+x5bNDpBvm29Gg9TLyIWNhT6htWlx54SlPNfaurA4I4aNVgq0Xze6wCeG5J2fDaxiXHxjU6lByvbRn/r+t4zRrgQCzYq+RIdxJDmnaVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015962; c=relaxed/simple;
	bh=TaXBLcdwB0iajjq4hAf4xi1UGkcYXdp9p2lw37QXnrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJa45ucfKgohH8EAOxLEVhNDT371N2TZbG8vZOerJfo4goJ1mc6dtv8oXsKUGvD8Y/aCRHqZ0aljF63f7o8yIveg75LNNMdk+iyppz75iB5SQTdsFXXIDZMhIJMnGqO7YLZDUkFdtdxMEXM5s0JwqG9ynDFmWO/PkC/K4hcsmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VVirSm/5; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2D8DE0017;
	Thu, 15 Feb 2024 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ch8tjKPy7nBDupOpE8cNjrCAOYNZCyjkUOP1wYjWAEI=;
	b=VVirSm/5GxKXpZJE22DcH0Nr7q0tP0ItL/g2COO4hLKbCUakOI72ciJOJb6n4LTX5WHQEY
	Y6CCjcskndgXiFrKn8fzmupYoJo4nUTnu6KWCjP6MXaRX3cHj1Zy0my9c1h0LQuhjNbEM5
	I6q1o+vrhk1I6vTB41bl46pL0Ha+SEc/iHKBUWdqwNB1fpPRcaE5A7unoIa00lGzTtjrTH
	LJ/fDgej+wiP09v3pBBDGogbantMurLecZH2xD9Q/eqRfdo5pYkbmWSgBGicYnfiYZoMI4
	CWXRJZMHuQk1q1eQi5RNQps1U5Jb2xaQ0x5IWhZmSRc3N1J1/TKrJwRubKWVTA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:13 +0100
Subject: [PATCH 06/13] i2c: nomadik: use bitops helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-6-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
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
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Constant register bit fields are declared using hardcoded hex values;
replace them by calls to BIT() and GENMASK(). Replace custom GEN_MASK()
macro by the generic FIELD_PREP(). Replace manual bit manipulations by
the generic FIELD_GET() macro.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 150 ++++++++++++++++++++-------------------
 1 file changed, 77 insertions(+), 73 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 80bdf7e42613..aa68ab402b10 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -9,6 +9,7 @@
  * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
  * Author: Sachin Verma <sachin.verma@st.com>
  */
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/amba/bus.h>
@@ -42,54 +43,59 @@
 #define I2C_ICR		(0x038)
 
 /* Control registers */
-#define I2C_CR_PE		(0x1 << 0)	/* Peripheral Enable */
-#define I2C_CR_OM		(0x3 << 1)	/* Operating mode */
-#define I2C_CR_SAM		(0x1 << 3)	/* Slave addressing mode */
-#define I2C_CR_SM		(0x3 << 4)	/* Speed mode */
-#define I2C_CR_SGCM		(0x1 << 6)	/* Slave general call mode */
-#define I2C_CR_FTX		(0x1 << 7)	/* Flush Transmit */
-#define I2C_CR_FRX		(0x1 << 8)	/* Flush Receive */
-#define I2C_CR_DMA_TX_EN	(0x1 << 9)	/* DMA Tx enable */
-#define I2C_CR_DMA_RX_EN	(0x1 << 10)	/* DMA Rx Enable */
-#define I2C_CR_DMA_SLE		(0x1 << 11)	/* DMA sync. logic enable */
-#define I2C_CR_LM		(0x1 << 12)	/* Loopback mode */
-#define I2C_CR_FON		(0x3 << 13)	/* Filtering on */
-#define I2C_CR_FS		(0x3 << 15)	/* Force stop enable */
+#define I2C_CR_PE		BIT(0)		/* Peripheral Enable */
+#define I2C_CR_OM		GENMASK(2, 1)	/* Operating mode */
+#define I2C_CR_SAM		BIT(3)		/* Slave addressing mode */
+#define I2C_CR_SM		GENMASK(5, 4)	/* Speed mode */
+#define I2C_CR_SGCM		BIT(6)		/* Slave general call mode */
+#define I2C_CR_FTX		BIT(7)		/* Flush Transmit */
+#define I2C_CR_FRX		BIT(8)		/* Flush Receive */
+#define I2C_CR_DMA_TX_EN	BIT(9)		/* DMA Tx enable */
+#define I2C_CR_DMA_RX_EN	BIT(10)		/* DMA Rx Enable */
+#define I2C_CR_DMA_SLE		BIT(11)		/* DMA sync. logic enable */
+#define I2C_CR_LM		BIT(12)		/* Loopback mode */
+#define I2C_CR_FON		GENMASK(14, 13)	/* Filtering on */
+#define I2C_CR_FS		GENMASK(16, 15)	/* Force stop enable */
+
+/* Slave control register (SCR) */
+#define I2C_SCR_SLSU		GENMASK(31, 16)	/* Slave data setup time */
 
 /* Master controller (MCR) register */
-#define I2C_MCR_OP		(0x1 << 0)	/* Operation */
-#define I2C_MCR_A7		(0x7f << 1)	/* 7-bit address */
-#define I2C_MCR_EA10		(0x7 << 8)	/* 10-bit Extended address */
-#define I2C_MCR_SB		(0x1 << 11)	/* Extended address */
-#define I2C_MCR_AM		(0x3 << 12)	/* Address type */
-#define I2C_MCR_STOP		(0x1 << 14)	/* Stop condition */
-#define I2C_MCR_LENGTH		(0x7ff << 15)	/* Transaction length */
+#define I2C_MCR_OP		BIT(0)		/* Operation */
+#define I2C_MCR_A7		GENMASK(7, 1)	/* 7-bit address */
+#define I2C_MCR_EA10		GENMASK(10, 8)	/* 10-bit Extended address */
+#define I2C_MCR_SB		BIT(11)		/* Extended address */
+#define I2C_MCR_AM		GENMASK(13, 12)	/* Address type */
+#define I2C_MCR_STOP		BIT(14)		/* Stop condition */
+#define I2C_MCR_LENGTH		GENMASK(25, 15)	/* Transaction length */
 
 /* Status register (SR) */
-#define I2C_SR_OP		(0x3 << 0)	/* Operation */
-#define I2C_SR_STATUS		(0x3 << 2)	/* controller status */
-#define I2C_SR_CAUSE		(0x7 << 4)	/* Abort cause */
-#define I2C_SR_TYPE		(0x3 << 7)	/* Receive type */
-#define I2C_SR_LENGTH		(0x7ff << 9)	/* Transfer length */
+#define I2C_SR_OP		GENMASK(1, 0)	/* Operation */
+#define I2C_SR_STATUS		GENMASK(3, 2)	/* controller status */
+#define I2C_SR_CAUSE		GENMASK(6, 4)	/* Abort cause */
+#define I2C_SR_TYPE		GENMASK(8, 7)	/* Receive type */
+#define I2C_SR_LENGTH		GENMASK(19, 9)	/* Transfer length */
+
+/* Baud-rate counter register (BRCR) */
+#define I2C_BRCR_BRCNT1		GENMASK(31, 16)	/* Baud-rate counter 1 */
+#define I2C_BRCR_BRCNT2		GENMASK(15, 0)	/* Baud-rate counter 2 */
 
 /* Interrupt mask set/clear (IMSCR) bits */
-#define I2C_IT_TXFE		(0x1 << 0)
-#define I2C_IT_TXFNE		(0x1 << 1)
-#define I2C_IT_TXFF		(0x1 << 2)
-#define I2C_IT_TXFOVR		(0x1 << 3)
-#define I2C_IT_RXFE		(0x1 << 4)
-#define I2C_IT_RXFNF		(0x1 << 5)
-#define I2C_IT_RXFF		(0x1 << 6)
-#define I2C_IT_RFSR		(0x1 << 16)
-#define I2C_IT_RFSE		(0x1 << 17)
-#define I2C_IT_WTSR		(0x1 << 18)
-#define I2C_IT_MTD		(0x1 << 19)
-#define I2C_IT_STD		(0x1 << 20)
-#define I2C_IT_MAL		(0x1 << 24)
-#define I2C_IT_BERR		(0x1 << 25)
-#define I2C_IT_MTDWS		(0x1 << 28)
-
-#define GEN_MASK(val, mask, sb)  (((val) << (sb)) & (mask))
+#define I2C_IT_TXFE		BIT(0)
+#define I2C_IT_TXFNE		BIT(1)
+#define I2C_IT_TXFF		BIT(2)
+#define I2C_IT_TXFOVR		BIT(3)
+#define I2C_IT_RXFE		BIT(4)
+#define I2C_IT_RXFNF		BIT(5)
+#define I2C_IT_RXFF		BIT(6)
+#define I2C_IT_RFSR		BIT(16)
+#define I2C_IT_RFSE		BIT(17)
+#define I2C_IT_WTSR		BIT(18)
+#define I2C_IT_MTD		BIT(19)
+#define I2C_IT_STD		BIT(20)
+#define I2C_IT_MAL		BIT(24)
+#define I2C_IT_BERR		BIT(25)
+#define I2C_IT_MTDWS		BIT(28)
 
 /* some bits in ICR are reserved */
 #define I2C_CLEAR_ALL_INTS	0x131f007f
@@ -284,7 +290,7 @@ static int init_hw(struct nmk_i2c_dev *priv)
 }
 
 /* enable peripheral, master mode operation */
-#define DEFAULT_I2C_REG_CR	((1 << 1) | I2C_CR_PE)
+#define DEFAULT_I2C_REG_CR	(FIELD_PREP(I2C_CR_OM, 0b01) | I2C_CR_PE)
 
 /**
  * load_i2c_mcr_reg() - load the MCR register
@@ -296,41 +302,42 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *priv, u16 flags)
 	u32 mcr = 0;
 	unsigned short slave_adr_3msb_bits;
 
-	mcr |= GEN_MASK(priv->cli.slave_adr, I2C_MCR_A7, 1);
+	mcr |= FIELD_PREP(I2C_MCR_A7, priv->cli.slave_adr);
 
 	if (unlikely(flags & I2C_M_TEN)) {
 		/* 10-bit address transaction */
-		mcr |= GEN_MASK(2, I2C_MCR_AM, 12);
+		mcr |= FIELD_PREP(I2C_MCR_AM, 2);
 		/*
 		 * Get the top 3 bits.
 		 * EA10 represents extended address in MCR. This includes
 		 * the extension (MSB bits) of the 7 bit address loaded
 		 * in A7
 		 */
-		slave_adr_3msb_bits = (priv->cli.slave_adr >> 7) & 0x7;
+		slave_adr_3msb_bits = FIELD_GET(GENMASK(9, 7),
+						priv->cli.slave_adr);
 
-		mcr |= GEN_MASK(slave_adr_3msb_bits, I2C_MCR_EA10, 8);
+		mcr |= FIELD_PREP(I2C_MCR_EA10, slave_adr_3msb_bits);
 	} else {
 		/* 7-bit address transaction */
-		mcr |= GEN_MASK(1, I2C_MCR_AM, 12);
+		mcr |= FIELD_PREP(I2C_MCR_AM, 1);
 	}
 
 	/* start byte procedure not applied */
-	mcr |= GEN_MASK(0, I2C_MCR_SB, 11);
+	mcr |= FIELD_PREP(I2C_MCR_SB, 0);
 
 	/* check the operation, master read/write? */
 	if (priv->cli.operation == I2C_WRITE)
-		mcr |= GEN_MASK(I2C_WRITE, I2C_MCR_OP, 0);
+		mcr |= FIELD_PREP(I2C_MCR_OP, I2C_WRITE);
 	else
-		mcr |= GEN_MASK(I2C_READ, I2C_MCR_OP, 0);
+		mcr |= FIELD_PREP(I2C_MCR_OP, I2C_READ);
 
 	/* stop or repeated start? */
 	if (priv->stop)
-		mcr |= GEN_MASK(1, I2C_MCR_STOP, 14);
+		mcr |= FIELD_PREP(I2C_MCR_STOP, 1);
 	else
-		mcr &= ~(GEN_MASK(1, I2C_MCR_STOP, 14));
+		mcr &= ~FIELD_PREP(I2C_MCR_STOP, 1);
 
-	mcr |= GEN_MASK(priv->cli.count, I2C_MCR_LENGTH, 15);
+	mcr |= FIELD_PREP(I2C_MCR_LENGTH, priv->cli.count);
 
 	return mcr;
 }
@@ -383,7 +390,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	slsu += 1;
 
 	dev_dbg(&priv->adev->dev, "calculated SLSU = %04x\n", slsu);
-	writel(slsu << 16, priv->virtbase + I2C_SCR);
+	writel(FIELD_PREP(I2C_SCR_SLSU, slsu), priv->virtbase + I2C_SCR);
 
 	/*
 	 * The spec says, in case of std. mode the divider is
@@ -399,8 +406,8 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * plus operation. Currently we do not supprt high speed mode
 	 * so set brcr1 to 0.
 	 */
-	brcr1 = 0 << 16;
-	brcr2 = (i2c_clk / (priv->clk_freq * div)) & 0xffff;
+	brcr1 = FIELD_PREP(I2C_BRCR_BRCNT1, 0);
+	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq * div));
 
 	/* set the baud rate counter register */
 	writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);
@@ -414,12 +421,13 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	if (priv->sm > I2C_FREQ_MODE_FAST) {
 		dev_err(&priv->adev->dev,
 			"do not support this mode defaulting to std. mode\n");
-		brcr2 = i2c_clk / (I2C_MAX_STANDARD_MODE_FREQ * 2) & 0xffff;
+		brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2,
+				   i2c_clk / (I2C_MAX_STANDARD_MODE_FREQ * 2));
 		writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);
-		writel(I2C_FREQ_MODE_STANDARD << 4,
-				priv->virtbase + I2C_CR);
+		writel(FIELD_PREP(I2C_CR_SM, I2C_FREQ_MODE_STANDARD),
+		       priv->virtbase + I2C_CR);
 	}
-	writel(priv->sm << 4, priv->virtbase + I2C_CR);
+	writel(FIELD_PREP(I2C_CR_SM, priv->sm), priv->virtbase + I2C_CR);
 
 	/* set the Tx and Rx FIFO threshold */
 	writel(priv->tft, priv->virtbase + I2C_TFTR);
@@ -583,13 +591,8 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 		u32 cause;
 
 		i2c_sr = readl(priv->virtbase + I2C_SR);
-		/*
-		 * Check if the controller I2C operation status
-		 * is set to ABORT(11b).
-		 */
-		if (((i2c_sr >> 2) & 0x3) == 0x3) {
-			/* get the abort cause */
-			cause =	(i2c_sr >> 4) & 0x7;
+		if (FIELD_GET(I2C_SR_STATUS, i2c_sr) == I2C_ABORT) {
+			cause = FIELD_GET(I2C_SR_CAUSE, i2c_sr);
 			dev_err(&priv->adev->dev, "%s\n",
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
@@ -730,7 +733,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	misr = readl(priv->virtbase + I2C_MISR);
 
 	src = __ffs(misr);
-	switch ((1 << src)) {
+	switch (BIT(src)) {
 
 	/* Transmit FIFO nearly empty interrupt */
 	case I2C_IT_TXFNE:
@@ -824,15 +827,16 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	 * during the transaction.
 	 */
 	case I2C_IT_BERR:
+	{
+		u32 sr = readl(priv->virtbase + I2C_SR);
 		priv->result = -EIO;
-		/* get the status */
-		if (((readl(priv->virtbase + I2C_SR) >> 2) & 0x3) == I2C_ABORT)
+		if (FIELD_GET(I2C_SR_STATUS, sr) == I2C_ABORT)
 			init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_BERR);
 		complete(&priv->xfer_complete);
-
-		break;
+	}
+	break;
 
 	/*
 	 * Tx FIFO overrun interrupt.

-- 
2.43.1


