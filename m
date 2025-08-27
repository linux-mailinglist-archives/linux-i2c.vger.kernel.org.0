Return-Path: <linux-i2c+bounces-12440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D3B37C10
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5005460B27
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 07:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F29431CA77;
	Wed, 27 Aug 2025 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mSRQuziy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1B31A540;
	Wed, 27 Aug 2025 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280451; cv=none; b=WbIT76qZua6Srkch8JzqSmIp4CfoLN6rhWS8ZTJFmlz8peRi6aPToxQbpBiPPb9XS9N2RWLWWDxEWZzKjDyWJFdrpVg0SC4FnlXJnStiK7VGUPTpElIXq/1IwGf2OCR1fCPLwlCkVHOG4r/XDlUWkB+Rj0JOZK68TWgnpMP0HVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280451; c=relaxed/simple;
	bh=N/MIBGWdKMusWYQh+IE7iWqeuc/rxrsn46nwIp2rkh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ87NFLrrJN6SirT/kLl/pgRHzGRGRDSsPjFPPmuUddcUQ87px5EtSyiH7/jJhGwbJeKqS+oTEaz+gfBkuIqDfqnpDN5Hn5+9MEu6XzcD1ZjsTbzPzmtPRsgkaOUXe45lFoR4aVD+XAg8F2xfoT9BWA7dbSYR5F8IB+lHMc85Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mSRQuziy; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280380;
	bh=dZxBMt86SKCOY/w9ehAJ3MRPpPBc0NxW//Q8PLXehac=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=mSRQuziy5Yf8B5+st4QKRAqBeVbXr1LgK8l6wYnZzuZ+bId6SHErHznZKnhVPb98v
	 nDTcq7k51USk0Q+/m38gf0Gg/tjycrwrHi5goeoKoIPiyEDk23Pan0G1b69a1neE5W
	 bRu6wlJMNCAFP0btbio6RIXDYrSYMQRlOSGoYE4Q=
X-QQ-mid: zesmtpgz5t1756280373t997deac4
X-QQ-Originating-IP: eGdDigAjQ7bi+vHd1UWDFlX21gqYJLpym9L+1kE6YKU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7939611079706169338
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:12 +0800
Subject: [PATCH 5/6] i2c: spacemit: ensure SDA is released after bus reset
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-k1-i2c-atomic-v1-5-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=3354;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=N/MIBGWdKMusWYQh+IE7iWqeuc/rxrsn46nwIp2rkh8=;
 b=Ls/K6GXozvyjgJrMx+La90IrRGLCE0mHghea4y/6w4HrQLk/PPk3a8tKHS40YJbMBVu5yhmGb
 buX3D46J7S1DMicQ/+EnfV6Z26hm7ozie6c0OIGhr1AaX6YqGbHjpsU
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N8arHCzhf4/cmIVcGeLtNQIiaiYPkkgUUhAfUvCuOyuIAnf1iG8c3m+t
	z4RJwfVL/Z/LzLIguRwb24+e/FwLjgQHUGo6jR6dFBUU0UYWFMKW68NoY64Xm1ZLz5Q9Bri
	Zp15oc8Ro0qaIo4C2gQuZvIcLfUnE0z0Gb3p3VtLrw551BSxUt3Qzn5AMrzlkq+6oh3355X
	XeT6KNvdjAIsrTUeSH0ae9DN5TqZ9tLFfvofaNYZDmbAjCtfwV9iesIWf1V/uDEC5VELt0l
	09bNb+qSORiivkobuhGCDrYkh2U4oYbF/K3dyfQXLzh4lutyBlWpf2+oCrLgfRcW8pTvBUZ
	trZPl9whI9qEYEqvUOMff4b3K2+m8vefgVbCt20bcVrZ3skikFuMyPMjw9+9JACZ0ZW03xZ
	BnlCmCpAtzp4Au4Kc8qLZFcEG0hyqZN4GNNdej7PqVrjfleJ1pVaBkO6jpPqfFsPI2rOIbU
	ZAdaX5gqBdS5/MD8JI/7Vvm3Nzc4JN20b05ODesF5penlEL6VIUfS/goZ+ir8BqvCw6B0H2
	U/5k6n1VrynaeOLVDIS0TkQjmsHf9P9vOHhs+2mheuAThHrkZooONWwqicCH3wieWPTsrtM
	vFEhorqXwBwkIJrDp02eo0EyITtmwv7L9hu6xMSTLh0UV0rVlfY+EZ8gkH5h5JyyOzQtLyS
	1ccfepyfY7wdGTXSKii3qW1IjSzb9KjKfEFqco6ouXPDhN9idBYMIR0QtzQQmnCi58j+HIO
	9I/mh/W90c1mFcJUsRMs4p5pcbDcSzF4sz4P8aNr/pSOClvYEDVDhlr0KPrYKwWMTshv3VE
	uZRv+S9A7DYkSGE+Nbd6WlupH8OBgv93DqDZEwTNr1Mlz3zhgVrc6qinLeGrKCh1uhYRJA0
	BwHekUUcTLcBQLQGsmC6KOfEaial2AOns62Wh41yjdhbfVjGbYPtpJ35MUKhKhCJYfOX8qv
	fbAK+jJdHqNepkpG7B3K+yKxrW/GJb6GmQCo8BBz8Flv3nRV32CDn0AgHusrCAONPIoLvIa
	p2nGFBgopjT9ypvV9H+Nl9RTDQVcXfWF097TrxETiuZJfF65WtCzEl3MfDA51X0dEWXrq6o
	MTHJjlk/JZwSfpuBHENE95XQ9UTa6oYRQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
 drivers/i2c/busses/i2c-k1.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 4d78ee7b6929ee43771e500d4f85d9e55e68b221..d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f 100644
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
@@ -78,6 +80,7 @@
 					SPACEMIT_SR_ALD)
 
 #define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
+#define SPACEMIT_RCR_FIELD_RST_CYC		GENMASK(3, 0)	/* bypass the SDA glitch fix */
 
 /* SPACEMIT_IBMR register fields */
 #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
@@ -91,6 +94,8 @@
 
 #define SPACEMIT_SR_ERR	(SPACEMIT_SR_BED | SPACEMIT_SR_RXOV | SPACEMIT_SR_ALD)
 
+#define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
+
 enum spacemit_i2c_state {
 	SPACEMIT_STATE_IDLE,
 	SPACEMIT_STATE_START,
@@ -163,6 +168,7 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
 static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 {
 	u32 status;
+	u8 clk_cnt;
 
 	/* if bus is locked, reset unit. 0: locked */
 	status = readl(i2c->base + SPACEMIT_IBMR);
@@ -172,6 +178,21 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 	spacemit_i2c_reset(i2c);
 	usleep_range(10, 20);
 
+	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
+		status = readl(i2c->base + SPACEMIT_IBMR);
+		if (status & SPACEMIT_BMR_SDA)
+			break;
+
+		/* There's nothing left to save here, we are about to exit */
+		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
+		       i2c->base + SPACEMIT_IRCR);
+		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
+		usleep_range(20, 30);
+	}
+
+	if (clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX)
+		return;
+
 	/* check sda again here */
 	status = readl(i2c->base + SPACEMIT_IBMR);
 	if (!(status & SPACEMIT_BMR_SDA))

-- 
2.50.1


