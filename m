Return-Path: <linux-i2c+bounces-7291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 517BC996729
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 837C61C23C4E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D31192580;
	Wed,  9 Oct 2024 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BHzMpDl6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCA618EFFB;
	Wed,  9 Oct 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469425; cv=none; b=jAka0EucFB4tWqQJww2Ym0aILcwt9MU+pZawUvRuSBce0JkWripHc85Aga3j87ECZa/WwzVbHBQg+UA/bu58u3+fZ8Dcj9I/S8zBL1eyZTwROXFpOYx57cOHg/REhTWd7y758zan2KgSoiBrthX2EBg6yAR5BzbUCSowJ1h7f8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469425; c=relaxed/simple;
	bh=dkTSaolvKShmPE1pq7mHXITqc04AwoI+FTjdp4fPjXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bh8sJwvtv1vU/Aih9dyeR6YzLTMyEEqkT78QSgnmeWvl8tI2N+dHX4mjJ4GZTlL4u48GSYdoAmTz4s8JSI85guIEgUFFvZQUuL3RgP6hd9GHaeFNpIDQQgZljznON0rigVqqZT2XhQ9uW7XIb1vs5aC83AFa/us9/tFvaURqK3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BHzMpDl6; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8753DC0006;
	Wed,  9 Oct 2024 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEnoUjAe0Fmg2cvSQx8nvgrabVcBeuNsNvfPdJB+sc0=;
	b=BHzMpDl6D19l57ssAOfyE8oP5ucN0qm5K2BXloajfsl1aIuLU25uTEwm1XdaVG6PX6rj2K
	by6xBW09IZmYJJRqTQCv9Mn7ogvFHhB1Yp3q7PvqhAOgfXAP6Wy/6V38D4vGSZpo1osgvQ
	mcJ2NPfgzMcW1GKWENMY/XQP7qjvpNvxEDunp/jz6WJdhZ6r4bvyFzlJtrcXuu5BFq3/Zc
	V3Eeafpfp+Svt4FGCawzMYcb9RpZusKZTn34c3ynE01oY8Cnwil1VolRbZQ+wNb76xy0t5
	SeFVSXG1l8FbBXoe1mfNxGXC7IpQfMh9K8Pz17gNU/BB4elxm5d7dzyeuY2cgQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 12:23:30 +0200
Subject: [PATCH v2 4/6] i2c: nomadik: support Mobileye EyeQ6H I2C
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v2-4-ac9230a8dac5@bootlin.com>
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

Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
and readb() by reusing the same `priv->has_32b_bus` flag.

It does NOT need to write speed-mode specific value into a register;
therefore it does not depend on the mobileye,olb DT property.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index c40328d1bca6cdefc61906cf9160f8411e37922a..8f52ae4d6285af2dd2b3dc7070672757e831a019 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -6,10 +6,10 @@
  * I2C master mode controller driver, used in Nomadik 8815
  * and Ux500 platforms.
  *
- * The Mobileye EyeQ5 platform is also supported; it uses
+ * The Mobileye EyeQ5 and EyeQ6H platforms are also supported; they use
  * the same Ux500/DB8500 IP block with two quirks:
  *  - The memory bus only supports 32-bit accesses.
- *  - A register must be configured for the I2C speed mode;
+ *  - (only EyeQ5) A register must be configured for the I2C speed mode;
  *    it is located in a shared register region called OLB.
  *
  * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
@@ -1075,6 +1075,10 @@ static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
 		.compatible = "mobileye,eyeq5-i2c",
 		.data = (void *)(NMK_I2C_EYEQ_FLAG_32B_BUS | NMK_I2C_EYEQ_FLAG_IS_EYEQ5),
 	},
+	{
+		.compatible = "mobileye,eyeq6h-i2c",
+		.data = (void *)NMK_I2C_EYEQ_FLAG_32B_BUS,
+	},
 };
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)

-- 
2.46.2


