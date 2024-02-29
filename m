Return-Path: <linux-i2c+bounces-2068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4986D1B0
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C6C2826D9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E70313C9DE;
	Thu, 29 Feb 2024 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OO3hwQ08"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBB7E10E;
	Thu, 29 Feb 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230262; cv=none; b=Mqty2sO5Z3/13+hVl/hpTzTCvyRNw7G4WpwvmBZaQdG8L6isdltFiVnPCW40xto7A79fIoushh3AGBbJgoSEMrt6rXKwNor4Xodl70IVvFN0PihyoKQ4Ieb1IG36QMt1nhfKl5/TI1UN7bYqQ5WQ/BIT4VI6l+88CujFX3YfJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230262; c=relaxed/simple;
	bh=h+SPw0GdFvm0QNkB7z2Z691z87obygwWxn7jzpzmhYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s6GYxf/+tIpMx8LtjkEHF1sPCGTd3x2l6iSJ7uzKQtBMuPREncibin5WBJEvz33D2lZRlMqKdC6nHkxii/Smdt+CUmZ9tdvoZTwn7rlI7uOh559ADBm76tSOA4QQuYFnQWYYcAWF8tfxcug8TN89MigNfAvZWz9nkngJcHPze0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OO3hwQ08; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8B9D6000D;
	Thu, 29 Feb 2024 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KjP0tKD670ot1mY6zPPbSUpgJRRflTSHBgbfRubJdc=;
	b=OO3hwQ08HWAyapA/2XepbuagNM2zP1pxIlO8mrWqHd+LCRlzIUf0wbHfUQiX/H8vMQEJbM
	jiK4GuNALRnuV0HyyIj8DO298cKZV8OkaW+qpDWKncMDYFKX7sR6YxzcbOV3KDyBveLnRK
	OKpQ4huodC9QD68KyaUEAStQHGeJVkaThwKPZ8M6PQqNJOYTL4WEROfJ5wS7fr+npsb4i4
	WHpe34vjgsngwacZrHY97OA8fz84MzK3GSdQY4PVImxhLpQSZ2KkKNjo9FnZB1SGCKsGJL
	kjQkFVkI2ya/cdaCZZEb70771Z8cTZznf1gL2fslCYnSxwzXduerUHyUZiPp2w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:56 +0100
Subject: [PATCH v2 08/11] i2c: nomadik: fetch i2c-transfer-timeout-us
 property from devicetree
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-8-b32ed18c098c@bootlin.com>
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

Allow overriding the default timeout value (200ms) from devicetree,
using the generic i2c-transfer-timeout-us property.

The i2c_adapter->timeout field is an unaccurate jiffies amount;
i2c-nomadik uses hrtimers for timeouts below one jiffy.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index afd54999bbbb..2d3247979e45 100644
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
+	if (!of_property_read_u32(np, "i2c-transfer-timeout-us", &timeout_usecs))
+		priv->timeout_usecs = timeout_usecs;
+	else
+		priv->timeout_usecs = 200 * USEC_PER_MSEC;
 }
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)

-- 
2.44.0


