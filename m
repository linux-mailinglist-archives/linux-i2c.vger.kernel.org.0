Return-Path: <linux-i2c+bounces-13144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A681CB9D14C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 04:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C3BC4E1822
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCAD2E06ED;
	Thu, 25 Sep 2025 02:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GQOpqdFx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB42DF158;
	Thu, 25 Sep 2025 02:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765857; cv=none; b=aWlMpl8bs/tvo3FxtoFhUHJHTwbw+K0gpi3KbCjeWGVIe3W8WVlZR76/0WxTI5vSfBUKnNvmoX3AmTpKQ8TIm/Tam9AZA6G/g6BYinNy8RxL6ap+eFqlLGxRuPjq0MXwtIsaWmOiBU1oz+O5ShJIM+HmmQqW8ucqy176MioRD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765857; c=relaxed/simple;
	bh=U76QuT7JICe2JP5jkSYV5h7YBjEqEQjtWQwAmDeAFzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoU/PgCR98nnUCKl6z72SaqysBsXls2WeID9Qcedfr4HDMdiBa54wzZLVbG4sToh9GRLZRg5UNRNE4NmN+j1WRzIu7XRmyVEJLLIXyVg6kq2vwFUSQDOosfoA+GC1bD1YRO+bPwaruumPEqwZyT7nOgWZ5wzBBmVm9dlAUF+XBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GQOpqdFx; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765778;
	bh=1KsJMLqOB+u3J/gF0MlnyVaqsPiP/oP+O4pKKWVSnEc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GQOpqdFxKpB1xpbEsB0EAmPVsJ3Jf9ltjaGjwfdwu+woFf5wCy4UlUhMKc+nAi7Db
	 8goBi5ANMTj3TvCkMX5Kt1ur3ZUIMKRhCJv5cjQlg88wdTIC3g3Q/1VoRBH/Osj89Z
	 BGyiJmqVu5U4z0ubhVmCsFFS4EPA4Dc1F6uIgZtY=
X-QQ-mid: zesmtpsz2t1758765771t7a28c126
X-QQ-Originating-IP: vXd1G9O85E8x9eSw9HQJ4hr/ejxddrJUfUIh74fhGXA=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13308766498198353500
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:29 +0800
Subject: [PATCH v2 5/6] i2c: spacemit: ensure SDA is released after bus
 reset
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-k1-i2c-atomic-v2-5-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=3300;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=U76QuT7JICe2JP5jkSYV5h7YBjEqEQjtWQwAmDeAFzM=;
 b=kIO/V/LCx3uaDcEmRxN2MMsbgr+q2EJ2NUWziOFpqR95PubY+F7cGE8hVb8v92y+4mMCwgM6d
 ve0fjgbFbQlBdTApV3fJH+GKCGW5oSkMjgTICCr/2ByHvF1yVcFXFha
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MKaKt7QzEqH0rlICUlK46KzMGGhq/EHbg0xSjTrsmjp6Idf6KzyP5+/i
	B9F5+Wby5Xyn7kcg+j1+/feZkDvFi0/VoB2qefH1bRY/eEn10qe50u06G0/OjZmuvNsPaqR
	/BH5Nx48AA7PP8UX/oyWJwdziCTUwgs4IZ2tbbvkE8sbh6pVB8yaXcOPUxAS8TgKHkasu21
	U3dUUJyZz7tEi0FYR0N8yzGmdjKJC0dInOgYGsyNXA5PoBJn/FTfyIFv+GsrREmsrAbn9H1
	+AJPmgiZ/mraO9+E9QrL42Z090d7o+SGOFDfOrT6j5r8O4Q7jRgLEKeXJ1c5Rwwqk2w00Ex
	S/KtAdBauyyN3AONDTrcYrqYqgn+mCqiJ8BMHQqpXwHW71Bkd9CVjqImToVmeRyJ/FX2YUf
	fYo6YORrAQcqQkFjiz3u3a9jOOtgCnv0bQ/cT4liQQo6Ct2p89QQ5RC0E4jSyVzalX8eyhK
	3vN4qhUGX7FUPxjZr1uhaXdFZlvrlrsyc0gP29n21cU1h3yCWpYgwu5V7SsSYkmCBAIpi2n
	h1JQBhEh8aI5BvHCbDNAAAj/nUSIY9wtl/mfvbbF/lr+EApSAMWN77txKIDP4FzpQmY3MNM
	WPJOvmpUIeOXIs4slBX4KM3ZZjpQeR6NuTJ1RqtpS3imCwV6oNZLRkL0j6e45oQlB1tGyFO
	03Zh4sKONOvNXMKs8BpidAxe/Kqq2HQXtLPU8M7vM+5xB9vJFNRJ+QDYYOiUlNLxGHrSAeC
	zizXRElGVZRcrPKHPmd8Mu1/f4ioMMnQ/ZD2/0n1PIDH65kfNYQVlR2or73AX7Eg860yDOu
	rwJdAxh97WSWQARS5VnYJ9NKZ3RWK6+3w1ypZl6IdDi1s09f/YeLfrKgYMXc/QKNS30kRW5
	WNFSNA4I5wMeGKi3Ysd78ECfOJDTKO/tQDgb0BSNpq1RO1Vvcu1f821rf6VgC//z0aDCEFa
	GhXtMXE7xTFNTiflRJMTsfcb4Xh1n+3h2CIVNpHhlHBXq04Z6RhkJYWfHmGT/Nu7ZtBNQJl
	74kf2m1rDTVFhtRlD6ohQtZsZzsGM91vk3OBNiOo9v3lOW4lyL7npNQ9vjostzKADcs6p9/
	C0ennMUviY/
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

After performing a conditional bus reset, the controller must ensure
that the SDA line is actually released.

Previously, the reset routine only performed a single check,
which could leave the bus in a locked state in some situations.

This patch introduces a loop that toggles the reset cycle and issues
a reset request up to SPACEMIT_BUS_RESET_CLK_CNT_MAX times, checking
SDA after each attempt. If SDA is released before the maximum count,
the function returns early. Otherwise, a warning is emitted.

This change improves bus recovery reliability.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 848dfaf634f63021bc565f2c0a1c93f9f33665dd..6b918770e612e098b8ad17418f420d87c94df166 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024-2025 Troy Mitchell <troymitchell988@gmail.com>
  */
 
+#include <linux/bitfield.h>
  #include <linux/clk.h>
  #include <linux/i2c.h>
  #include <linux/iopoll.h>
@@ -26,7 +27,8 @@
 #define SPACEMIT_CR_MODE_FAST    BIT(8)		/* bus mode (master operation) */
 /* Bit 9 is reserved */
 #define SPACEMIT_CR_UR           BIT(10)	/* unit reset */
-/* Bits 11-12 are reserved */
+#define SPACEMIT_CR_RSTREQ	 BIT(11)	/* i2c bus reset request */
+/* Bit 12 is reserved */
 #define SPACEMIT_CR_SCLE         BIT(13)	/* master clock enable */
 #define SPACEMIT_CR_IUE          BIT(14)	/* unit enable */
 /* Bits 15-17 are reserved */
@@ -78,6 +80,8 @@
 					SPACEMIT_SR_ALD)
 
 #define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
+/* the cycles of SCL during bus reset */
+#define SPACEMIT_RCR_FIELD_RST_CYC		GENMASK(3, 0)
 
 /* SPACEMIT_IBMR register fields */
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
@@ -91,6 +95,8 @@
 
 #define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
 
+#define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
+
 enum spacemit_i2c_state {
 	SPACEMIT_STATE_IDLE,
 	SPACEMIT_STATE_START,
@@ -163,6 +169,7 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
 static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 {
 	u32 status;
+	u8 clk_cnt;
 
 	/* if bus is locked, reset unit. 0: locked */
 	status = readl(i2c->base + SPACEMIT_IBMR);
@@ -172,6 +179,18 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 	spacemit_i2c_reset(i2c);
 	usleep_range(10, 20);
 
+	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
+		status = readl(i2c->base + SPACEMIT_IBMR);
+		if (status & SPACEMIT_BMR_SDA)
+			return;
+
+		/* There's nothing left to save here, we are about to exit */
+		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
+		       i2c->base + SPACEMIT_IRCR);
+		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
+		usleep_range(20, 30);
+	}
+
 	/* check sda again here */
 	status = readl(i2c->base + SPACEMIT_IBMR);
 	if (!(status & SPACEMIT_BMR_SDA))

-- 
2.51.0


