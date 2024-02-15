Return-Path: <linux-i2c+bounces-1758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096D856A24
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32E1F1C23A01
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E62139588;
	Thu, 15 Feb 2024 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X05Jz2dA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A2137C59;
	Thu, 15 Feb 2024 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015963; cv=none; b=LyJ7zafEJz/OHm6oTw2Mt/B/cDfXMNlIZXSZqKREtKo+cXBDSaGeAoJRuSmOSDmqF0R4krYT79oRbbRybiTfATHPjzXD2L3EVbWiFETIJ2SyDTlMBSpoIzq6fo3pXXly8L2G+7IFGCcq1TwYqumxj/tP4LO6ED3ON5lhz6EywOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015963; c=relaxed/simple;
	bh=89bCy4HxE92AdAoVyq7hD/JI8ZtUqitna8+RsdSL2u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuniABeq+yALyEhmw5D5SdAL9Y7Mb45b3qtBBbyybbCIjNhbxtlGTVHqHl6eSTMKwbBuaDAo/SSzWJjc3sdfAfe7HxWqw6vQMJ/PgRk1XNtl/WRgRwWz4XiuYfd4dr4RAOnSDzy8XowG9faYPzbe9en1LVIRU/fqaa//a9kSeUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X05Jz2dA; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15314E001C;
	Thu, 15 Feb 2024 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UI781RDrcik2RYtu08sBCE4vst1s92iXfDeWJ+Uj5KU=;
	b=X05Jz2dAVG/OH6mW1jIs5toXJymKoVNLKETT2ySNywm1E39ztnrDGFF0D8gM52fJK4ht8S
	GlsXS6EtRyAI8NqrY7PgfJyUBMVvBViA4JsdVZMN8W4ulmO2shWGGWJTXehc4x2dooC8NX
	RyILp5eN8NororpKPh7LTYt/9AsFMA78CfPfFEPhOA7YEiS4k1UBJrjJ2FYQJALUz5OCTO
	106oqSyERyYZ3k+PHU2UTSe1t9JkdECSBZzOQtF/UYVaoB/j9Zsd90zu1q6phsU06un7z8
	jWPCIyvX5HbtAgH44bQ3QaTbUckQBQRXspjG5PwyVBOkvn2LeXW5npVDH7SNYg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:16 +0100
Subject: [PATCH 09/13] i2c: nomadik: fetch timeout-usecs property from
 devicetree
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-9-19a336e91dca@bootlin.com>
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

Allow overriding the default timeout value (200ms) from devicetree,
using the timeout-usecs property.

The i2c_adapter->timeout field is an unaccurate jiffies amount;
i2c-nomadik uses hrtimers for timeouts below one jiffy.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index afd54999bbbb..23e12c570457 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -964,6 +964,8 @@ static const struct i2c_algorithm nmk_i2c_algo = {
 static void nmk_i2c_of_probe(struct device_node *np,
 			     struct nmk_i2c_dev *priv)
 {
+	u32 timeout_usecs;
+
 	/* Default to 100 kHz if no frequency is given in the node */
 	if (of_property_read_u32(np, "clock-frequency", &priv->clk_freq))
 		priv->clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
@@ -975,7 +977,12 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->sm = I2C_FREQ_MODE_FAST;
 	priv->tft = 1; /* Tx FIFO threshold */
 	priv->rft = 8; /* Rx FIFO threshold */
-	priv->timeout_usecs = 200 * USEC_PER_MSEC; /* Slave response timeout */
+
+	/* Slave response timeout */
+	if (!of_property_read_u32(np, "timeout-usecs", &timeout_usecs))
+		priv->timeout_usecs = timeout_usecs;
+	else
+		priv->timeout_usecs = 200 * USEC_PER_MSEC;
 }
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)

-- 
2.43.1


