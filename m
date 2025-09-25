Return-Path: <linux-i2c+bounces-13140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD49B9D134
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 04:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 891983A9E4A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B42F2DF152;
	Thu, 25 Sep 2025 02:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="o/zX0XCP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135212DD5F3;
	Thu, 25 Sep 2025 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765843; cv=none; b=FYfX52Nye03tw+dpZRlxMU/OUQzcBeMtiJhuMa6eJItqdnFKuTrNQ5k1VLBGFWgMMzke8YFSH1FPIEFPXJMwD7KMo82phG9d0BO74NjyF75EZvdMzzoyeLQXTG656Oi4JHla42EQ8Tk6+/tI+UYa3Wnqe+2rT/JKYfmFEE824cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765843; c=relaxed/simple;
	bh=/fqMb32wsVo9/6JmtmD4yszqbt0NSqRc/0EKOr4c+p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=geIsB3r7TOxJk7Uyo7aNUDRifQ5JSOkKOP29LuwwAx8JFjCGTZ5oDqUnKwGF99WUjF0WfluGXN7kH+xvm77rg5QrdH4mSRNsXEC93iG+5T9icT23etS+s3yFq1HO+d4yVlplz+jDwX3MG4xNEf27D5ux6yc3HBBQkFM39ifPNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=o/zX0XCP; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765766;
	bh=6HiClnou0nH6C3uh9A5W6JJdfMjsorNR8TwVlwrmpiI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=o/zX0XCPkfI7q9OW2VpbdDK4vWM8l0IlWl0cD8TyJMnqqKPnAUTc3hvrI99c9fS1n
	 tsqfy3EY8IAkdcKAcoypo1MYXr98DSDnxWU3xxG5r58Q1MFTe75EHpOxtV7ISfGuV0
	 vT/5mqh3vAWNObQfyNvJjLx0qpUqdCkDN8K04V14=
X-QQ-mid: esmtpgz10t1758765765t5102a920
X-QQ-Originating-IP: Z7YqWUUkcsKFSs6xAN7RT58+TlKj3vGC/pMbOsWnz6c=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11634990285186739956
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:27 +0800
Subject: [PATCH v2 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-k1-i2c-atomic-v2-3-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=2454;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=/fqMb32wsVo9/6JmtmD4yszqbt0NSqRc/0EKOr4c+p4=;
 b=jiUE8EP+MWVQPxo7jJUbbQ6aP+ZcLjlh/v6BRMezRH0J5Pr03xLCE+8cgrFLkwzQ7yBVp9ssV
 jNTD0XFi7EHAwSkz54ET6BxMqNQJ11WcpWXHJWdvtIyB8ULzXV5P8iN
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MW5S8H8h8jGb339dTgarddnbb+99hEByb8I7kqns+RefRunh1n8jY1dy
	YEtE+WzN6plvs8dsnPzgP9dHjBBd33RaMHRHXEBz3oc6oEX5UjZLg+Oe6X4rP9vD45pF7rq
	tk1QL5GJJrxGzScVgXqaykkbW2GAnQA6IGCvJ1aBdfnYvs7uLn03hPssam2oBN8XttabW8r
	0/kUVwc/QKMEgujyXvWL4LkeTq/yAj00RpJBL44Ztjwmjl4mM+LfRaq2jfu7hrFJOyNGAGL
	JIHk4E+UOs30EPiyJ+GaFP7a1p5Z2u3ljwEKKKWhVQiDnC6K9oWOND0EHw5+kFr7xOSuv+1
	WZD9UHZ8CMybXUacCWgBiAUwglBIJ4xJlk2usPD/VpxIbpz7bT/iQqoCKF1rj8kdPbihxh8
	dxsahjS2XF2zA8KEZ1DZ96UG8ReRK7df8rDIR/pZaBmUerv9FWByun4lMz3cCjMftGPewre
	zmfZj1tooc5wPHicqQfRgo6DX5w8s6sHZhAVtBA8axq7lSEusGO+tE1YPOj1Mbvyy8YUjID
	ngePVU/89wJ5AMuL5WykYB0jg6kaBA1jwIJ9ibHqmjx0AD5VZi513m0roil0DollOVQz2ac
	Y24Ps4PreiWI+mn2Aday43W2qLzlvO2//UoStBN88zLsL4DtKFR9ddEOHTlwrubDp3FT1tO
	lQcS42EXJnuYf0O1CvOMA1+9V6//ZUAVBw3+2639gg8gYiHP/ceyqqoW5T+xbg6XNHiHc1n
	LT9FOTrxOl6daXWglHz3HDfeZn7iZ6UctjrFzLeB2zwa+Z9XdRBcEUUndmmdD7o58G46EJx
	DPigqLNraaQDkoR4Sd3R0guIsRw1HwmudhCaB5z4NxHfUsK1YG81DGYGmtiV+5bqgmndRu3
	va1jblRden8Ji9YXspjZEA0Z79BR9cS/OYGtAN+qSFFU0WLen3bY5pvUnWixRAcIMWT2bU4
	2Gl2TboL+KwowGo9g1SusezzVh6rsZay+otBejZ/35OMBbEFkkmY/V88TwT9vF6/Kra1WSg
	YrNnFYK48ahfWRmv7/gGXOI4fEy0LoRt1zrSAVtszUZthVVu3YMDN5rYF4STy0eT8bVfAXu
	5pKHCNNPYRyAvl5z+0nAgdANGhZoer2tRTMoSeYtPHOgWtQvHXblTHtAFsg3iUt+nVyWQE1
	MbVdYKKbu0QULTs=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
---
There are the restart waveforms before [1] and after [2] disabling the fix.

Link:
https://psce.pw/839rzq [1]
https://psce.pw/839s4q [2]

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 84f132d0504dc992f2f961253b011b86afcc2bbc..9bf9f01aa68bde6460e50c6983edc3f705b12eea 100644
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
2.51.0


