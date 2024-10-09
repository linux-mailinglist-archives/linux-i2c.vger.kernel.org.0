Return-Path: <linux-i2c+bounces-7289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7FA996724
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E96B20C87
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9056E191F68;
	Wed,  9 Oct 2024 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="og5cD5ou"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB118FDDC;
	Wed,  9 Oct 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469422; cv=none; b=UwQk3CfLZf5y547CsECHn7HR4PctkJBOqGm6sfu4D8Nh46ibVfLIFP/1xwYyyG8ILf4aawOxnJzHB+UzqK/mTJluxFZdPivA8/URGXS9ufckBwzKHJ6kVRYgLk6ceMaEABKFO7B4/rHdWOaIfAekjED7AMVeg3abexslWsa9m3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469422; c=relaxed/simple;
	bh=Olp5EwdvvkcdWx4Um1FowhF/GtYV24TawE4qMAcHWmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbb6sPz6Yc0pXqL6JW9N4c6nHUjVxiRZYmxs2rXtdPafX3XuyTQ36WrWGlbneF/N7Eg4DeZqSDibzKMS8N5HJe/v0GlqRBGy1QfS9y93+MjCMDAso3lBGU9t8LW0qrz2/0hT1rc0fgDFktDRGxwBXJHI9cLPdPEnW2U1RSk6yxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=og5cD5ou; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1A3EC0005;
	Wed,  9 Oct 2024 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iESo5G7yB8Huxqo8RT5l/9twIQ+BPxWkXsgQj+Afnmg=;
	b=og5cD5ouK7G/7e2Jcykmwe5oCh1x150S4iqYjEyXVZ+xFiGWfdjy8qAalE5708/HWta/as
	9CjAaZ2MuI+A2sEfaJgT9x98Dwocb5KwtmFGN2gmus1k5Bz8LK/R5s9NRRaSqe4On4ZT8k
	WdWfzZbCg5xIjxI76rY7is/E7LIXki/YO5r47NYRTD/rC4i7q3tDq/QEnrfKIl0g8+yGE3
	nnanSRuNYARm4rZRCtSCF2y7UazhPyZpsaG28mlUwbWckcGXPxQb3VTE/jOqI0fmXsKeIH
	X/f1qiPpzhkAuMywOaF6x7b9JjPYE6fXTXEZjwdFlXJy+rzAgyneg/p/6/rFPA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 12:23:32 +0200
Subject: [PATCH v2 6/6] i2c: nomadik: support >=1MHz speed modes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v2-6-ac9230a8dac5@bootlin.com>
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
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

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b2b9da0b32ed903c080f4bdc427ea0dd7b031b49..0c1ea6c6d75e16b0336debe92829f33c512aaea0 100644
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
 
@@ -452,33 +452,22 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * generate the mask for baud rate counters. The controller
 	 * has two baud rate counters. One is used for High speed
 	 * operation, and the other is for std, fast mode, fast mode
-	 * plus operation. Currently we do not supprt high speed mode
-	 * so set brcr1 to 0.
+	 * plus operation.
 	 *
 	 * BRCR is a clock divider amount. Pick highest value that
 	 * leads to rate strictly below target.
 	 */
-	brcr1 = FIELD_PREP(I2C_BRCR_BRCNT1, 0);
-	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq * div) + 1);
+	brcr = i2c_clk / (priv->clk_freq * div) + 1;
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
@@ -1019,11 +1008,14 @@ static void nmk_i2c_of_probe(struct device_node *np,
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


