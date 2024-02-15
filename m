Return-Path: <linux-i2c+bounces-1763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BBC856A3D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96FCD1C21439
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7D113B784;
	Thu, 15 Feb 2024 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dIxHuc+q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18DA13A88D;
	Thu, 15 Feb 2024 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015968; cv=none; b=jEBEkaUbUNNu5zLp07WOj6yslSF/CfbD6wxEOEDJaFdjlKMERwsCNttyDl6PKWQLISkXAMId1+k2Ho+uEhiPvk1JyGxupDKMXvw4Hw3/GQ/ZTPvMQK+O78ex4G1zDxZTGsDNPJElS0WYJkDljucc/bQR+/N4qFqO4+ZJrHTCF8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015968; c=relaxed/simple;
	bh=5i1uaFrLcLf+bPBJaKLNupRCnV7d8Nq2qANsFmWqLIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnYbG6C4H6lan7lchSKQXjLk2+jEYJEdwJJkA4d/s7xl8a1m5MSJSIIAUUE36TlrCcso100BUmP4CrF2KvCPa0bOta8xH59FEos0/acET1+I+OTbDM0QK7EIkkx7dLw+rM6cJ7ElvISwnll9DPid5lnREJn1jEmL+QO0WU7swqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dIxHuc+q; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E7D8E001B;
	Thu, 15 Feb 2024 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5W2sSL7KXTa75TLd1u49SS6u6N4gKtVqD7M4RKYa2bU=;
	b=dIxHuc+q76e9Fo3tmpFDzwS3cGp4P0feO83Vi9KUPUUJCSaPlNMCIY0cNUIxKQr0bIc1Sn
	bXtUYDJs4Y+ZW9cILDmc4atXws9VkQ82t2IxUVlbTKGbdUXLmqZ9M96uzRZk753owpssG6
	kAqWRvnh7b9Atpw6YwozbTkGZ3T5i9QZ3QriHJ19lIElgeJwdsey20ZbOp3q4FTsXwpXUB
	YiJ1gUavaooMS4VFu7kVZAfrPyAB5PDK+pcKQmVsFrUoYeyPlZpcfH+/aWhOUwJOn3eLwW
	ZeZVhbkdNQr2PLYoWVTJjMIVw0A5yDRWukutqJHs+QbSWnSRZBmlsOT7eVQICw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:15 +0100
Subject: [PATCH 08/13] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-8-19a336e91dca@bootlin.com>
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

The FIFO flush function uses a jiffies amount to detect timeouts as the
flushing is async. Replace with ktime to get more accurate precision
and support short timeouts.

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
2.43.1


