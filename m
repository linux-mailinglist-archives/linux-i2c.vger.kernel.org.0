Return-Path: <linux-i2c+bounces-2067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776086D1AD
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226B7284C95
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3F13C9C5;
	Thu, 29 Feb 2024 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ckm51Utd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403C7A15C;
	Thu, 29 Feb 2024 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230261; cv=none; b=rdACjDPJdP1eptgQUNhMRieWfgjFbtEs+29MI1ikJignz1CE+VDXWY5QCPTUemGuJ5AogSFj6kCUOZdi4PaPGFG+5QTGFbDHRRyotlCZ8LmMFAxLPsgWAgt5Uz6COT//1LrbEuLmuhHLxBOl2YrR8WztoDtgyV6+VIQjb4mLIUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230261; c=relaxed/simple;
	bh=E6JIr8h+OwWIEYevpKG0zN3Nj02fkHMXvYMjPiDM944=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtNYFEv0X6gICJJvMBPkYl4iIac+kS4Y0bnNI5klI0D3AKeDo5ucC6kcPlBQbhcQLzIJVDgiE8UEPGKrhPL4SFfZC6nKCdbTDJcLModrKmIp3xjCr/ZFHK5AcLncYe6y5GVgtkm5lupZrsxYqwXlNBL+4mjVZGBLd0oz7Cawmrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ckm51Utd; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A6BF60008;
	Thu, 29 Feb 2024 18:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvp7WvCSrLtX8t3FL321hrxMmXFJgNTHJeZP7j1HXbE=;
	b=Ckm51UtdhLlYjy1+GbXevZeyNXA0eukCYSQhGmLH4wBsZhILrXTbpeMH2vErQhfebIR53U
	CR6+RgyMrcCuYFhHc8ePO50DzVGbY3HepxKSmoOgpVUSKs78fHepcik9/YndIWTs9xkjTd
	NIIaZAkB4cZcy+dha9TUY1uJCN4GxTlg1RObJxgLY+SYP21oa86NDdcoFf3r1eQ91xllej
	3g6LLV+teBzdM521+U61+iXYwm84AHTGl0GDFabJqfXXvtxO8Dx6WvUoEwJX5NMbMWiyPd
	9rTC21hsGuNSoQ3P0JC1xyYM9C0WnjbL6uC56HERTpvjvYVI2DaKsS9+mc/8SQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:55 +0100
Subject: [PATCH v2 07/11] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-7-b32ed18c098c@bootlin.com>
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

The FIFO flush function uses a jiffies amount to detect timeouts as the
flushing is async. Replace with ktime to get more accurate precision
and support short timeouts.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index e68b8e0d7919..afd54999bbbb 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -219,8 +219,8 @@ static inline void i2c_clr_bit(void __iomem *reg, u32 mask)
 static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
 {
 #define LOOP_ATTEMPTS 10
+	ktime_t timeout;
 	int i;
-	unsigned long timeout;
 
 	/*
 	 * flush the transmit and receive FIFO. The flushing
@@ -232,9 +232,9 @@ static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
 	writel((I2C_CR_FTX | I2C_CR_FRX), priv->virtbase + I2C_CR);
 
 	for (i = 0; i < LOOP_ATTEMPTS; i++) {
-		timeout = jiffies + priv->adap.timeout;
+		timeout = ktime_add_us(ktime_get(), priv->timeout_usecs);
 
-		while (!time_after(jiffies, timeout)) {
+		while (ktime_after(timeout, ktime_get())) {
 			if ((readl(priv->virtbase + I2C_CR) &
 				(I2C_CR_FTX | I2C_CR_FRX)) == 0)
 				return 0;

-- 
2.44.0


