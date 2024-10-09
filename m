Return-Path: <linux-i2c+bounces-7310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2C996D12
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F041281CCC
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 14:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CF01A254F;
	Wed,  9 Oct 2024 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V9WBB2Io"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE819AD86;
	Wed,  9 Oct 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482475; cv=none; b=JTTBLjxbMIxFricqxvyxdUvWezM2GEG0dcLtaRpIiOmSjbgbNYsM4TkPXws1s6DfZipYdyaLhJEvROnW1xekr/d8JdNGlfjlZYa42X2w+xG9bZ2I3LzP7Pj0mJ5Kh9CSzg6nxbwAfs4LC8WQirRdPZPS77LBjR3QjsJzwjLADkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482475; c=relaxed/simple;
	bh=9kaHINEv4/7SSdXuzvpM/8FbTviCbgIiOfx2HjQC/Us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyZtXFAnToN2E1L9nk/Yy4l9T2vAbygG9/ra/A83lSExhMYINcYh6V0gsXqlkumQATa0dgxb7l9p/fsxJwr5j8SwXsbaTHI3jr+sJhx+oqy59pmDO7MyYEcV+Av1/OxLVO142KZC99b0l+ZF5eSRuYatlvZ4q9ItCxEE8OqQs5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V9WBB2Io; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E36B1BF20F;
	Wed,  9 Oct 2024 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728482471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KN4a14PZ8SWOObiK/DnNIgNJ+gCkWYqBAi+54cWiank=;
	b=V9WBB2Io+6zw/6SSxWaygTW2qxD+pr0kCkqPuKUogz+niFRH/WqurvOvsNdkgvY+v9WG++
	7quuOThLEQrCPzWM8Ot/8Psm8WFsex3ibZ0F+KTBbJqVY6NIW1zVhQ1GOEmiZkYdkyyKtX
	0FGJwbqLQqLcXO7LFQdM1PKyQj8aBwhI7bs8FaW4wprwJlp9d4/OQvaVQnN0kRbNHWYMvk
	l1vxqOQxE4OBHnrNR1Sp8ON8mOLGnVWKtQO1zO0/iCnT9anaXAn+RmNRQ97nNr2LoE53os
	TnBMJ3AF0UVw3zmaJb08+DptPEPfKb+2nR0sh8WHXaG3h2oD1nzFtrzSjdnw6Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 16:01:12 +0200
Subject: [PATCH v3 6/6] i2c: nomadik: support >=1MHz speed modes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v3-6-e7fd13bcf1c4@bootlin.com>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

 - BRCR value must go into the BRCR1 field when in high-speed mode.
   It goes into BRCR2 otherwise.

 - Remove fallback to standard mode if priv->sm > I2C_FREQ_MODE_FAST.

 - Set SM properly in probe; previously it only checked STANDARD versus
   FAST. Now we set STANDARD, FAST, FAST_PLUS or HIGH_SPEED.

 - Remove all comment sections saying we only support low-speeds.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 90e3390cd66de5b3aa47d94de7fb30e1d67ac70e..efb33802804fdde82fe6d38d4f89d0b898f1667e 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -397,7 +397,7 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *priv, u16 flags)
  */
 static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 {
-	u32 brcr1, brcr2;
+	u32 brcr;
 	u32 i2c_clk, div;
 	u32 ns;
 	u16 slsu;
@@ -444,7 +444,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	/*
 	 * The spec says, in case of std. mode the divider is
 	 * 2 whereas it is 3 for fast and fastplus mode of
-	 * operation. TODO - high speed support.
+	 * operation.
 	 */
 	div = (priv->clk_freq > I2C_MAX_STANDARD_MODE_FREQ) ? 3 : 2;
 
@@ -452,34 +452,23 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * generate the mask for baud rate counters. The controller
 	 * has two baud rate counters. One is used for High speed
 	 * operation, and the other is for std, fast mode, fast mode
-	 * plus operation. Currently we do not supprt high speed mode
-	 * so set brcr1 to 0.
+	 * plus operation.
 	 *
 	 * BRCR is a clock divider amount. Pick highest value that
 	 * leads to rate strictly below target. Eg when asking for
 	 * 400kHz you want a bus rate <=400kHz (and not >=400kHz).
 	 */
-	brcr1 = FIELD_PREP(I2C_BRCR_BRCNT1, 0);
-	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, DIV_ROUND_UP(i2c_clk, priv->clk_freq * div));
+	brcr = DIV_ROUND_UP(i2c_clk, priv->clk_freq * div);
+
+	if (priv->sm == I2C_FREQ_MODE_HIGH_SPEED)
+		brcr = FIELD_PREP(I2C_BRCR_BRCNT1, brcr);
+	else
+		brcr = FIELD_PREP(I2C_BRCR_BRCNT2, brcr);
 
 	/* set the baud rate counter register */
-	writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);
+	writel(brcr, priv->virtbase + I2C_BRCR);
 
-	/*
-	 * set the speed mode. Currently we support
-	 * only standard and fast mode of operation
-	 * TODO - support for fast mode plus (up to 1Mb/s)
-	 * and high speed (up to 3.4 Mb/s)
-	 */
-	if (priv->sm > I2C_FREQ_MODE_FAST) {
-		dev_err(&priv->adev->dev,
-			"do not support this mode defaulting to std. mode\n");
-		brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2,
-				   i2c_clk / (I2C_MAX_STANDARD_MODE_FREQ * 2));
-		writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);
-		writel(FIELD_PREP(I2C_CR_SM, I2C_FREQ_MODE_STANDARD),
-		       priv->virtbase + I2C_CR);
-	}
+	/* set the speed mode */
 	writel(FIELD_PREP(I2C_CR_SM, priv->sm), priv->virtbase + I2C_CR);
 
 	/* set the Tx and Rx FIFO threshold */
@@ -1020,11 +1009,14 @@ static void nmk_i2c_of_probe(struct device_node *np,
 	if (of_property_read_u32(np, "clock-frequency", &priv->clk_freq))
 		priv->clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 
-	/* This driver only supports 'standard' and 'fast' modes of operation. */
 	if (priv->clk_freq <= I2C_MAX_STANDARD_MODE_FREQ)
 		priv->sm = I2C_FREQ_MODE_STANDARD;
-	else
+	else if (priv->clk_freq <= I2C_MAX_FAST_MODE_FREQ)
 		priv->sm = I2C_FREQ_MODE_FAST;
+	else if (priv->clk_freq <= I2C_MAX_FAST_MODE_PLUS_FREQ)
+		priv->sm = I2C_FREQ_MODE_FAST_PLUS;
+	else
+		priv->sm = I2C_FREQ_MODE_HIGH_SPEED;
 	priv->tft = 1; /* Tx FIFO threshold */
 	priv->rft = 8; /* Rx FIFO threshold */
 

-- 
2.46.2


