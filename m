Return-Path: <linux-i2c+bounces-7309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B036F996D10
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E282A1C22A6B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 14:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380811A0BDC;
	Wed,  9 Oct 2024 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iAQ96K4o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485D199FCC;
	Wed,  9 Oct 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482475; cv=none; b=T6DrDCMXlulmOJTUTb69RHBJ9Rz71BgVwvxlyoywVq9jrjiK4iH5fIkHNzqq8l3NPgLGusrSiWoViWGHudXQi5Pfh7pB9DI+CczKF3yeQ8/WOwOwQ3AyAS3Bvc9/dLnLAJsEWTH9iqr7XtMyBhT2elwycMG0d5dzP1o6oTgWmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482475; c=relaxed/simple;
	bh=p+Ur6Pon0boWoB29NiZyqCLsNliG7afgQ+2OrjsUK2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hj0s+byiQwFSJsIaSODsaAIOfAbCK2dshrxFinZn1kgP4wJDpqx4q6LG9cCGxGGQSls7QmFHEw3KU5dXfwTJEM2cZCurqPbxhdZ3hGsH2D9zhPh6syi5O1zWEw/Hnk2yAtjgSxmnNq/ojSAFeZaL9EBJogPva+OhlYyPglkuBrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iAQ96K4o; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77EEC1BF20D;
	Wed,  9 Oct 2024 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728482471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=21HMetQOB+SaHvQI49UY0p8Ueen8RrlyJb33LwQyLmE=;
	b=iAQ96K4opWXLxs+g8ssUsorkBfi3YbyCkyZ/iAdhAMOpzQ+lVw2hR/MAMmm8wXXUMcKJmc
	yQqjrM9z+NDI1KW2Pq35sMwD3GIY4rzeR8kNshzaPsBjClcROU1COWTzwwuBt+B1MB6Kep
	WxRrkQebHBfe0ub1xb3UFBVkXTmnMpq2cTRDzuAWAfBXYgF++x/jG0ZgPztCCgqDN0KnrU
	tzchQ4Q206nthTtc61aXfLa7tP1Xy0HJz40rCH9+/jLOZGlSP6ZFzvHrL2azDXOKyPbGm3
	PiAsMqvQm9CPKIXS4pEqI0nypV0OHgzz16Kf237yaHvxHk5YxYyOwKpd4u3W5Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 16:01:11 +0200
Subject: [PATCH v3 5/6] i2c: nomadik: fix BRCR computation
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v3-5-e7fd13bcf1c4@bootlin.com>
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

Current BRCR computation is:

    brcr = floor(i2cclk / (clkfreq * div))

With brcr: "baud rate counter", an internal clock divider,
 and i2cclk: input clock rate (24MHz, 38.4MHz or 48MHz),
 and clkfreq: desired bus rate,
 and div: speed-mode dependent divider (2 for standard, 3 otherwise).

Assume i2cclk=48MHz, clkfreq=3.4MHz, div=3,
  then brcr = floor(48MHz / (3.4MHz * 3)) = 4
   and resulting bus rate = 48MHz / (4 * 3) = 4MHz

Assume i2cclk=38.4MHz, clkfreq=1.0MHz, div=3,
  then brcr = floor(38.4MHz / (1.0MHz * 3)) = 12
   and resulting bus rate = 38.4MHz / (12 * 3) = 1066kHz

The current computation means we always pick the smallest divider that
gives a bus rate above target. We should instead pick the largest
divider that gives a bus rate below target, using:

    brcr = floor(i2cclk / (clkfreq * div)) + 1

If we redo the above examples:

Assume i2cclk=48MHz, clkfreq=3.4MHz, div=3,
  then brcr = floor(48MHz / (3.4MHz * 3)) + 1 = 5
   and resulting bus rate = 48MHz / (5 * 3) = 3.2MHz

Assume i2cclk=38.4MHz, clkfreq=1.0MHz, div=3,
  then brcr = floor(38.4MHz / (1.0MHz * 3)) + 1 = 13
   and resulting bus rate = 38.4MHz / (13 * 3) = 985kHz

In kernel C code, floor(x)   is DIV_ROUND_DOWN() and,
                  floor(x)+1 is DIV_ROUND_UP().

This is much less of an issue with slower bus rates (ie those currently
supported), because the gap from one divider to the next is much
smaller. It however keeps us from always using bus rates superior to
the target.

This fix is required for later on supporting faster bus rates:
I2C_FREQ_MODE_FAST_PLUS (1MHz) and I2C_FREQ_MODE_HIGH_SPEED (3.4MHz).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 8f52ae4d6285af2dd2b3dc7070672757e831a019..90e3390cd66de5b3aa47d94de7fb30e1d67ac70e 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -454,9 +454,13 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * operation, and the other is for std, fast mode, fast mode
 	 * plus operation. Currently we do not supprt high speed mode
 	 * so set brcr1 to 0.
+	 *
+	 * BRCR is a clock divider amount. Pick highest value that
+	 * leads to rate strictly below target. Eg when asking for
+	 * 400kHz you want a bus rate <=400kHz (and not >=400kHz).
 	 */
 	brcr1 = FIELD_PREP(I2C_BRCR_BRCNT1, 0);
-	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq * div));
+	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, DIV_ROUND_UP(i2c_clk, priv->clk_freq * div));
 
 	/* set the baud rate counter register */
 	writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);

-- 
2.46.2


