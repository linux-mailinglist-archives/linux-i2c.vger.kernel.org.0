Return-Path: <linux-i2c+bounces-2228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA8873E00
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F94A1C230C4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A45140E22;
	Wed,  6 Mar 2024 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ji3OMBF9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF313E7CD;
	Wed,  6 Mar 2024 17:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747977; cv=none; b=dhTK4/BisGF2urY8vWidV15U4dQoEXUfJ2dy3nMvkBS6d0rf6kwxsSObSriaufQD4iCP7PYM1eFgie+CvMUl2AU/KFWkC4Prxroqs0rKeBT+w/vVbe8Q2dlBsHwSPIZ3dqWlKo8oJN/aiE7L9YadlwbOabde8lmp1IpOalbzLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747977; c=relaxed/simple;
	bh=/e84P/owXhlh++tw7rvGRQ64kKz8dN+PoJFWEp8EyIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=InQgbsAsm7opm+H+1mgpGA+MkbEFmy5eNb7PYjdq3cbA6YDYJZdOkotysXYpTECoyGrMRRjWQFQ3tW6y5rnoGc4tVcJ9EhNfO9DZ7PdlBLxiGZe37NpORUx4ME7B+4WwWI5UipVrZ7fTESsEUOQ3BN9gTn/A9srsVxO0mtVCyqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ji3OMBF9; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC2C040004;
	Wed,  6 Mar 2024 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRiNeZgV6eBZpUWar1JZGPdnG7GRdzz01xQrVaFgykE=;
	b=Ji3OMBF9sh5AUUIrSf+SHwWCBVQbHN2yjqFDrGf6bsfe4EZlx1MqJwUDbZDoEoXUvMVcrs
	O4RXeBdjOeBcahOsp+5dYJo97Wqpk3SPjmJFwICXVdZf/vPETQHe7Ah8LD+ztGN7lc8aIt
	5eVmemBd8Je7K4rKPG85K5oBjf0MlcLmxvNbX3FYTP1bvqEKsDZS6DC6KbTcTWdUk4UY3H
	+IAbuJuf8UZcEc4IkpXEzcyZIhP0PRf7c/Ex8O64/fSXv1qkziKtmBVk5VkCP90fX5K9B9
	Hrugjol1r02k+29Emtr9BnQluYeemmvX2hIACSB3eLHogye9H5/I210WTsB6jQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:26 +0100
Subject: [PATCH v3 06/11] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-6-605f866aa4ec@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

The FIFO flush function uses a jiffies amount to detect timeouts as the
flushing is async. Replace with ktime to get more accurate precision
and support short timeouts.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 2ba7d082e205..020beb8ffa17 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -225,8 +225,8 @@ static inline void i2c_clr_bit(void __iomem *reg, u32 mask)
 static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
 {
 #define LOOP_ATTEMPTS 10
+	ktime_t timeout;
 	int i;
-	unsigned long timeout;
 
 	/*
 	 * flush the transmit and receive FIFO. The flushing
@@ -238,9 +238,9 @@ static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
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


