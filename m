Return-Path: <linux-i2c+bounces-1754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E7856A15
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2711F2147C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7935A138497;
	Thu, 15 Feb 2024 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dU6jtuPy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EFD136644;
	Thu, 15 Feb 2024 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015961; cv=none; b=P42UrXSoe0LpViqIt+IfUsTbwLMdP0Mp9p6bt8bHYnrMcvmlOXs47gSHJmCpy0hjyYLcvr/e9rzwp4jI8x5cxqpvQXdEKqX2QdRU62otovdHQvM6pRK9f4HRQi58iJ1/SRZDxfzXN4s9yX0Rw87nOe57ss4KHG6bGK/BqTMJxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015961; c=relaxed/simple;
	bh=p4+YmJ//W4/C2NnX+iwxmBA71H8qzZZas5Ie+2nLBMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nK/SwP6T0VPh8ZRoH9bcMkuDlFgM+ICKbpNZYsLe272LPZzjG6pSvk/tMjo0MuUKitqyDVOgYUgoQ/ahMYeSsB7Dd9Lv6psOMSNHr4zNpIMm/lBj9Id4O+L4o6RbrEqxVQk8fD3hFfqzBxH0h0fZL9VVOSO7yZsdE0OscS51PQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dU6jtuPy; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4674AE001D;
	Thu, 15 Feb 2024 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHgj/sUog/rIQGKTCVoK5NCE+i8l4ZPuQCIx37ekvXk=;
	b=dU6jtuPytIjrJ86JqQdnSkLy2orKj5Tn7kipaiTwv24WiH+am/zNL+XZ4M6MHWelu0N/iS
	Er9NbbIoONbESW4ObrKYr+kqMSy1gyK3dD5NMkBmprxyFB5Wf+uUyyG2H9yrDhSH078GPR
	NpOBGpN0wVmDdH0BdoCmj/FuYizDiyIEn1ZtupEGOSpirqPuD6tFqWEn/mAHTcAG8L2XKk
	WDSxOH0LGZWSl/aJG/vZTRbm+8ImntQv419T6ZuGT6B6w1wwau4fWUKpfIPMnaUCauNTst
	2givAYmLI/XDKDRpy6K9XQECSrbF1QcSiwwzHkw/njAID0Y9MLAbe3LRe9FWyQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:12 +0100
Subject: [PATCH 05/13] i2c: nomadik: simplify IRQ masking logic
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-5-19a336e91dca@bootlin.com>
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

IRQ_MASK and I2C_CLEAR_ALL_INTS are redundant. One masks the top three
bits off as reserved, the other one masks the reserved IRQs inside the
u32. Get rid of IRQ_MASK and only use the most restrictive mask.

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
2.43.1


