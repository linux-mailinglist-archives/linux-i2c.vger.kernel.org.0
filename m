Return-Path: <linux-i2c+bounces-2224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE5873DF3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528141C22EC9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D46C13E7FF;
	Wed,  6 Mar 2024 17:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EeMcSO/Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B413BAFF;
	Wed,  6 Mar 2024 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747975; cv=none; b=l2gbGBFIXDO/OcZrn3O5jVCOlgD4Zqz4tp4RjZ/4/WuDhagMz/i/kjIFS439gHpvA9KZ1vCYGwCdJQAmpRfeQEtKPvYvoSC1HnL5rH5D20OlPCLSG3fv3eSIMLPhTbTUzW+YqHx3S4Gjt/8sTN4rZ96lS08tfNkYJuuT3KKPaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747975; c=relaxed/simple;
	bh=Qej72pu6fdEoExRl4XZge95DmomLyzVUsKj6WDVS3LM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDUR0hkJnY35lhfp7rvZLlW5OSI0Oo0td3PS5GoekrOdfqHqs3zFVjRJVK7Vd3SHgTiYqsL4lPeOoNmQY/H0Q5XwImzZHtb7XoKRQF8HIUTeCmo/BV88cJvxGXCFbI+TvpEyji9+GJRwbxdN6AEM1Dh6qovlxIvrVjpCN6nipgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EeMcSO/Y; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B346540008;
	Wed,  6 Mar 2024 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0ffeOdFEjtETEHTnybwbTHjIFfmL7GLD1gS8KdoDac=;
	b=EeMcSO/Yy06+qf/DHw76+ToS+Zz1hhGnAfcaMj4XGf7lzeat/0syaGtwRCZNKvSUQmNK+M
	Nf0kopX9N0P2k0wMEbr6q5dxOC0BKJn+JOeZipYZzXD247HJUzfnh/9AIEZ3BRw0q1ftNb
	phtQL1j4kh/MKYnSs4EzR65VFY83uZDw3p5S+i/g0nk4dkbrvjMJAXuhiG33qP4k261Ga2
	AgjS3CumKTyu7xt1e3ufc1aX4OCtVqKnBEk+rtYin1MNP7cdqnOh+X37++mj0Hg/Za0KxV
	sC/RCtQmrAb7RtBIk3j4j0xwtidrBJEW9dGNEEkWYba9zJWnc3lTD73F9DmhUg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:23 +0100
Subject: [PATCH v3 03/11] i2c: nomadik: simplify IRQ masking logic
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-3-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
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

IRQ_MASK and I2C_CLEAR_ALL_INTS both mask available interrupts. IRQ_MASK
removes top options (bits 29-31). I2C_CLEAR_ALL_INTS removes reserved
options including top bits. Keep the latter.

31  29  27  25  23  21  19  17  15  13  11  09  07  05  03  01
  30  28  26  24  22  20  18  16  14  12  10  08  06  04  02  00
--- IRQ_MASK: --------------------------------------------------
      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
0 0 0
--- I2C_CLEAR_ALL_INTS: ----------------------------------------
      1     1 1       1 1 1 1 1                   1 1 1 1 1 1 1
0 0 0   0 0     0 0 0           0 0 0 0 0 0 0 0 0

Notice I2C_CLEAR_ALL_INTS is more restrictive than IRQ_MASK.

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


