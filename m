Return-Path: <linux-i2c+bounces-2063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F97A86D19E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A04F2877DB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC527D07F;
	Thu, 29 Feb 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CjkDBqWT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBDB7827A;
	Thu, 29 Feb 2024 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230259; cv=none; b=AuYVTaYHzgpahn6MXconR0QcyjyI4ukTupe4h68s4KXy6M8ZebN2UYdGtkVAfFceBigNaT6/v4W7vHuh1eP2E+Y1lV2x3QApvOZQ/1V1z242xvMxQs0fvWY9yvS2tENOJTnjCHRbHVXGLEMn4+Bgjg/Bu/hNLU41BDtTqjZqgHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230259; c=relaxed/simple;
	bh=MOkti5POBNAAPodBmKTRKlIVoSockxo5dnR5oUDn8/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnV4E/5zHRtk2MtwM7h7+0uuw/Vx9RRcBnHIVbQBhfrank/g2kJhLVoMRpVdRwUPBQsCpLPemMxzT40F0clsAkBj1Yy0g9GUuF4PM/965L7Aof+mrxIZsP5CjSgR49x+vCa1iexJohQVZAnNG5rSa5dQDnWpSF8a/hzEuGbGenc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CjkDBqWT; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4B286000A;
	Thu, 29 Feb 2024 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ty2EJ876o5Kn9zQBvjF0tUqOXzfEY6odYnS7MMMrsVs=;
	b=CjkDBqWTQO8VkImGA2epQhUPlTMDUTn99AN5BljtdS+um7gvcinAzduZxh/ogpVeUsXxBn
	60xkeuZf41hMFyl8dLuzO5K5MeN1jx1uixbmKHbmUjAbtiU0OX/KKHGDXNC4395GlGuZ2v
	mUroovnuHzB/1pkJJ9ePn6I9ewxFLPY8LxNMK1+YTd0I7jxMARlOu53GBOqYndii9BadzJ
	8Zt18n6se8rdZ/4v7cLCBXVIWbUUM3eLOtaIiaCqb0nTo8ZvsDkXrbnr1J3jpAUi+B5JF7
	5/zRpEhb5Ongp2bZ4YvCA5/OZ+e3DkxmSv4LP9jMelz/yxhestxicVxe2aafOQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:52 +0100
Subject: [PATCH v2 04/11] i2c: nomadik: simplify IRQ masking logic
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-4-b32ed18c098c@bootlin.com>
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

IRQ_MASK and I2C_CLEAR_ALL_INTS are redundant. One masks the top three
bits off as reserved, the other one masks the reserved IRQs inside the
u32. Get rid of IRQ_MASK and only use the most restrictive mask.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index cd511c884f99..80bdf7e42613 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -94,9 +94,6 @@
 /* some bits in ICR are reserved */
 #define I2C_CLEAR_ALL_INTS	0x131f007f
 
-/* first three msb bits are reserved */
-#define IRQ_MASK(mask)		(mask & 0x1fffffff)
-
 /* maximum threshold value */
 #define MAX_I2C_FIFO_THRESHOLD	15
 
@@ -249,8 +246,7 @@ static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
  */
 static void disable_all_interrupts(struct nmk_i2c_dev *priv)
 {
-	u32 mask = IRQ_MASK(0);
-	writel(mask, priv->virtbase + I2C_IMSCR);
+	writel(0, priv->virtbase + I2C_IMSCR);
 }
 
 /**
@@ -259,9 +255,7 @@ static void disable_all_interrupts(struct nmk_i2c_dev *priv)
  */
 static void clear_all_interrupts(struct nmk_i2c_dev *priv)
 {
-	u32 mask;
-	mask = IRQ_MASK(I2C_CLEAR_ALL_INTS);
-	writel(mask, priv->virtbase + I2C_ICR);
+	writel(I2C_CLEAR_ALL_INTS, priv->virtbase + I2C_ICR);
 }
 
 /**
@@ -468,7 +462,7 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	else
 		irq_mask |= I2C_IT_MTDWS;
 
-	irq_mask = I2C_CLEAR_ALL_INTS & IRQ_MASK(irq_mask);
+	irq_mask &= I2C_CLEAR_ALL_INTS;
 
 	writel(readl(priv->virtbase + I2C_IMSCR) | irq_mask,
 	       priv->virtbase + I2C_IMSCR);
@@ -547,7 +541,7 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	else
 		irq_mask |= I2C_IT_MTDWS;
 
-	irq_mask = I2C_CLEAR_ALL_INTS & IRQ_MASK(irq_mask);
+	irq_mask &= I2C_CLEAR_ALL_INTS;
 
 	writel(readl(priv->virtbase + I2C_IMSCR) | irq_mask,
 	       priv->virtbase + I2C_IMSCR);
@@ -703,8 +697,8 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
  */
 static int disable_interrupts(struct nmk_i2c_dev *priv, u32 irq)
 {
-	irq = IRQ_MASK(irq);
-	writel(readl(priv->virtbase + I2C_IMSCR) & ~(I2C_CLEAR_ALL_INTS & irq),
+	irq &= I2C_CLEAR_ALL_INTS;
+	writel(readl(priv->virtbase + I2C_IMSCR) & ~irq,
 	       priv->virtbase + I2C_IMSCR);
 	return 0;
 }

-- 
2.44.0


