Return-Path: <linux-i2c+bounces-12436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB652B37C02
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D92D6856ED
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 07:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F67B31A545;
	Wed, 27 Aug 2025 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KnA0Opp0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917A319879;
	Wed, 27 Aug 2025 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280442; cv=none; b=bQ4/MQ36ul9U6Ktc6sE67rOrERdYJ/BPVIhFFbCY5AjXTe9xIQN0+nGx8LWc3mn60U6D3vSNG9moJkCrqso3R0LI9ChEHMYslj8Uor462iZBD+H05SHMWua4AqltVw4a/XsFq2aWOL8IPOQUJI5Q/fWT9kFCzO8ucA2pt+w87s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280442; c=relaxed/simple;
	bh=XOadE6q3hu9FC4+hTj5B4E1CAH50HQ7DCsTZxRN6P5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0xOv/PMGuteIL+Nza8tEOO5sEUWYNDZnctQeg/nugWxnpReYGH4QUtXpsDp04XzGNJyE1caE2cz95jbdqTHxi2L+ddEoE2igzxl3dtv4FYsmlihLnI5NPohIoDP24Zh+qyrxiAgphNTmqW8f6rMLvHo69RFpIr9K6TGsyhtXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KnA0Opp0; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280373;
	bh=nKPBFDqV4arLHxi9pnW8A0Xaua5oHEAMsVmNRknIIhU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=KnA0Opp0Y2oPPj2kRutvUvQQwpR7MQdNwQxA7S0Q5TS1jkAG18e9fkAP0+YO9jpfo
	 6UlOvnNn9wrl99dveSLPXm8aPoxvKFTcUl7S8pV6V14N3OwTeGeIekhpyqlevVni/a
	 urxwiWJIw0V08IHDu/QgHGi9sLAVnV9ZSmTDewnQ=
X-QQ-mid: esmtpgz13t1756280367t3f9802a7
X-QQ-Originating-IP: Gt/FPg+zJdLaLf1gU3G30sXjbP02MyYwIclFs2aVKNY=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2985033504381610877
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:10 +0800
Subject: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid restart
 delay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=2255;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=XOadE6q3hu9FC4+hTj5B4E1CAH50HQ7DCsTZxRN6P5w=;
 b=Y9zQihml6SFgzLnNFvIYUCpA939k2Lzx7ML2GodAd0uKVXap/b6Ez47Q1y4B/U9tU8+wDNoK2
 aTOGsgN494GCFus4VUCGlCjGEwRSQHzOsUm10u3OjlutLh+l17Xn7T4
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2QhaCakBTCB0FjQaqcoMM1c7I9ZPm44zlRnzzVP87jDti
	VUKuVVXZVX0C6OGD2Ghkl+2xAZY+XuE/QUYxJRgXCEuqtM+RRv1/dzSND8Bk5O0LsyDIUdG
	iWpuzWj+/bhVKu5biftADdtHD8RMRflttEV+rfwuHf1cwrb9MHSWbD6/0bUyYkwXL/kpu9w
	RlnIb00jfsChiJt5+j3Q3rULDkFTIrNFqvDoO6msmDJ8ydUiP1kPKAqcpSxHW4Ng3hQMV7N
	/DauvBnxT2isMHGzXHddt4zGU7UaLgACaxUa2fmJSXlzKcy3LCw1KsdeDJxIm0oy1uicXLM
	E5/JRfZRGRvm8Ia1yrCkCm8nNfaMbS2DAHAQN2L+yMyeDEQ6BklgF/HkJh3SJVSPxJKPVqX
	sLItFZG78YHYSdy6jAt/675dBNyTP4UszOVpxPhXyODek5ALmDWXDRtRmQjpsP3f4WbMvcx
	uBBTk3agLCFae8DRvAGJ5BScmoUfJMaDw0BggxWs20VNc1/0ULsXzpLSxj8fxL+F3gN6O9L
	mjklHjZ1djI/jJfVW8rMzX3HmgBC3rZNofUapSbe6278zfBKg0iOK5tOl9iDt1cMcglZlO2
	rKJnMXMhdD2f+wp/6gP2fgnGoGr8QbnUx36W/+lXOwCZgGBh+YRuz0Hkbs3dNx0+Dl/vp2i
	+/W3F5rc8Nh3MiIKZyjMJDMdyWG5J/9+bcH0ujqMovyL8kr08TArOHbLTNyTEgPSHRflMFR
	0vqywq2pKX4ButIbKvDTV4xK8j4R04KWQK+XqgvvNSgkoGs7MHQRwJdL7nqQMozsLTQRGu5
	Geh3c0XJZoutQ+V1XDpG8x/aSdPvms99AHlQ6wU89hig0o1mIxOwQaY3gQq0+F4HlJ9bsHK
	0V+OAjNZh2Xw1zpodKlpr+L5+a31MWRxHnhV6XbRMv37REFoJfcnrJN4l1EbWd0y5bYrvgz
	TuFYwb1xpIAFKY8zWTGrHqY1RVTE4y3uCqV3n3V4eTqJYGLL1QpUbEo84FVQLt+1J2C1MV5
	W1pxAM0EAQxvhWlPxjRVR/PU5BlvCuP15kMDou3w2f7rYW2xQwPAGh//AKyUZVxyumzJkLI
	uWbRcg4LrPZwNt5i13AjkaHLy166NB7Dg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

The K1 I2C controller has an SDA glitch fix that introduces a small
delay on restart signals. While this feature can suppress glitches
on SDA when SCL = 0, it also delays the restart signal, which may
cause unexpected behavior in some transfers.

The glitch itself does not affect normal I2C operation, because
the I2C specification allows SDA to change while SCL is low.

To ensure correct transmission for every message, we disable the
SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
initialization.

This guarantees that restarts are issued promptly without
unintended delays.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -14,6 +14,7 @@
 #define SPACEMIT_ICR		 0x0		/* Control register */
 #define SPACEMIT_ISR		 0x4		/* Status register */
 #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
+#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
 #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
 
 /* SPACEMIT_ICR register fields */
@@ -76,6 +77,8 @@
 					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
 					SPACEMIT_SR_ALD)
 
+#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
+
 /* SPACEMIT_IBMR register fields */
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
 #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
@@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
+
+	/*
+	 * The glitch fix in the K1 I2C controller introduces a delay
+	 * on restart signals, so we disable the fix here.
+	 */
+	val = readl(i2c->base + SPACEMIT_IRCR);
+	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
+	writel(val, i2c->base + SPACEMIT_IRCR);
 }
 
 static inline void

-- 
2.50.1


