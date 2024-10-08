Return-Path: <linux-i2c+bounces-7271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CD99457A
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 12:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA9A1F2300A
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25261D2F7C;
	Tue,  8 Oct 2024 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ldUoZrFe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57503192B6F;
	Tue,  8 Oct 2024 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383395; cv=none; b=LwePZwJwDovqoXc7RqJzLmHBiRPsWqCE3s6BDxYQ0/q/4Mqq3+IIPhN8jcjurh4L8gUSmTzSL8nptOf2gJmZbA3ll3QXBLNc8AVPaaCd07Kf+QwLjyVdLKaj2wlCXWpT9qNpF70cqpXBBUS7tr0b2w9u/MyXTekZ1Y55gKFNUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383395; c=relaxed/simple;
	bh=5a0Oxf7lFMAgi2SILZFtB1/bra4shl5qEpwMA/a01jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LH7WRCyjmmIXzj8Hd8dtH1yehfa/xys6R5sAeZFR1PdD28qk96C6DA/5ziFeW3J2MQkF+zI5U/9gEPs2bqYSj54MEc8SYVmxp3rNYO+A+iJhF6zPt2VSfe5iQCMCAmi9HPCwoRvUaXZq3GDLdO3Zt8u8AsEXA7iej4yb0GyATbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ldUoZrFe; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45EEEE000D;
	Tue,  8 Oct 2024 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728383385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANQX8H7crnEHXkyTrpbWnxCPQMuaKFHhdRyusFeiLjE=;
	b=ldUoZrFei8MWb9I7J39PmFVdEQubxARTCjr9daNCIvTUXc18GUm0WZnEr1qCPG83UXGMmY
	mNdWfc64N3H57bgBsq+hCv/AjRPAZsAJiVggLUfoOSRBTRzrxDuFDIihgfXWKfSp+lS7FQ
	+lPc3Pyiib3wGbUZGgpvRIawbvt/ZFYkq3VhJ5Hgqu+fQFijIB3BiE+ywpgoS0CVw5PuTX
	3x5t1lS3SvY8ECgJkfDmpZr7tBJSexZmo2wIORGMVEfASUWuegIHlqEzZmPQ4Ry30II2Qw
	hZnlJ5o6sGI8ggVF8jT2K6sC6p9olLZAcbvsont0B/4jDwm0ojcFIApuG21JjQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 08 Oct 2024 12:29:43 +0200
Subject: [PATCH 4/4] i2c: nomadik: support >=1MHz speed modes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241008-mbly-i2c-v1-4-a06c1317a2f7@bootlin.com>
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
In-Reply-To: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
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
index 68ce39352d67477fa22424e2dc0f8d1741498cd1..82571983bbca5ebcd8a689d4d717ea96eb3d2ad2 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -396,7 +396,7 @@ static u32 load_i2c_mcr_reg(struct nmk_i2c_dev *priv, u16 flags)
  */
 static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 {
-	u32 brcr1, brcr2;
+	u32 brcr;
 	u32 i2c_clk, div;
 	u32 ns;
 	u16 slsu;
@@ -443,7 +443,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	/*
 	 * The spec says, in case of std. mode the divider is
 	 * 2 whereas it is 3 for fast and fastplus mode of
-	 * operation. TODO - high speed support.
+	 * operation.
 	 */
 	div = (priv->clk_freq > I2C_MAX_STANDARD_MODE_FREQ) ? 3 : 2;
 
@@ -451,33 +451,22 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
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
@@ -1018,11 +1007,14 @@ static void nmk_i2c_of_probe(struct device_node *np,
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


