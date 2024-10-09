Return-Path: <linux-i2c+bounces-7288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F3996720
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 910ADB2A64B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF000191478;
	Wed,  9 Oct 2024 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T9vRPdRi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC5118EFF9;
	Wed,  9 Oct 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469421; cv=none; b=pr/GCn12qFCSH8YIpaxgOLGSJIMStsmzRKQDj7lSPEk2KnDpNZuD9Wo6aLC7MjkDl9j7ecGpiP2bq1uNCga3gLDvJgM+E9ENhDEBkk7NrLfOi/Evier/fSwIUGEHIm1YMdBtDuBV6W251BMSsSJ8xFxQbrJH4b0LS9SzIhtEcfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469421; c=relaxed/simple;
	bh=tQRb8t9Bgm9pTxnllpvl7n/2CRPhE+WTxJ55NgaJtb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ALACF8JMIkz6SRjtL74BvlKdkhEwceqpyFchyYkYMt5HSxHfQ1w8hIcsh8fU3hV1H1RzmH375zMDCyXFlVKkatVvIWqS4nxdc8BBjaAsgCp7Yl7hFrEF7sUzmKrXXiY0IaH09XByyijqEX10w0VprNaF7b0z6X2TM3vOec03G+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T9vRPdRi; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D749C000D;
	Wed,  9 Oct 2024 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BV6jtGBlKFIHxumMjV1kYyi9dXX5jMmSnqUBcSCcyT4=;
	b=T9vRPdRiFoyAgmJHbkPIWpP17ik6oZp5Jh8CbHNa3CLZxmANyGkn44dth9algKv03fh1XK
	kvgTofQ+xvG1Ll9LZloX/bNUCxKbgVEyQf/SRFfB8iaqne9ol8Bt7ARp2BY3WkQwNCD6Co
	2b3GL0sotik4uGPv+9U68OsbViQKJX6f7deTnN33to/aB1wx5MKLkg+fFDsV3agUBdvyPr
	tPmIuuJDQWGicMLrXPsoavsQOjg/Hm2IaKJMJHPMsRZwKoe4ZTg/45eHRQDtp2o/UwDN0w
	52XVKgSlnDVjXzukdvSPd1nGbuQZcRgdygvevvqD1hsvVY3970inXYJJ+qwHMQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 12:23:31 +0200
Subject: [PATCH v2 5/6] i2c: nomadik: fix BRCR computation
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v2-5-ac9230a8dac5@bootlin.com>
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

This is much less of an issue with slower bus rates (ie those currently
supported), because the gap from one divider to the next is much
smaller. It however keeps us from always using bus rates superior to
the target.

This fix is required for later on supporting faster bus rates:
I2C_FREQ_MODE_FAST_PLUS (1MHz) and I2C_FREQ_MODE_HIGH_SPEED (3.4MHz).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 8f52ae4d6285af2dd2b3dc7070672757e831a019..b2b9da0b32ed903c080f4bdc427ea0dd7b031b49 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -454,9 +454,12 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * operation, and the other is for std, fast mode, fast mode
 	 * plus operation. Currently we do not supprt high speed mode
 	 * so set brcr1 to 0.
+	 *
+	 * BRCR is a clock divider amount. Pick highest value that
+	 * leads to rate strictly below target.
 	 */
 	brcr1 = FIELD_PREP(I2C_BRCR_BRCNT1, 0);
-	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq * div));
+	brcr2 = FIELD_PREP(I2C_BRCR_BRCNT2, i2c_clk / (priv->clk_freq * div) + 1);
 
 	/* set the baud rate counter register */
 	writel((brcr1 | brcr2), priv->virtbase + I2C_BRCR);

-- 
2.46.2


