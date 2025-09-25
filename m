Return-Path: <linux-i2c+bounces-13146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB569B9D158
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 04:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16EBB1890755
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763002DFA4A;
	Thu, 25 Sep 2025 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QFgCEzwa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CDD2DFA27;
	Thu, 25 Sep 2025 02:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765868; cv=none; b=ESpjuN2ZNtTJzlt1UP77dRWKNU/nuLlDHo8HdJKnl2eD/AJdipzQxuPJNkoYsIo+/fiCJ3pohFtdgxhfm5aoKFtI32/eFRw467peEZP3szSHQKlpj8sViu3oEM45YOG3QB0LDiAChmHT20eZiHoiDdZSJnc1fdfoMhXfcAtF6+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765868; c=relaxed/simple;
	bh=orfxUZAN9ENtIRyIBDyaG8LPgHTS7y+7tVQ5jSZVtx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYkjju34XpRyAmxXN0/osiQPpu3pRELCzefi+IFefbFJenQiiVj01BvYXU1mr2KaFdRIQHgAK+BumK2T/qqvtP7LxAbQyjjcDoJuuzCMmRN9jRl6veJpO8VrkFHOt1yK4N2gikulh8rwXAqA0bAZpzpm6F7U+HCkJ8d3bI2NeaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QFgCEzwa; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765769;
	bh=h3cW27SXbsqGTltt39dUcB7YJzVKi9Mc+FNjv7vBZlQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=QFgCEzwajVkp8QGxwoX/7TImy/1jrN/7BE7Hla6giPDm2BossOEc1h5UV3y1ScxcZ
	 8Hzkk4VccuPYx1f74RclD9+Pypc65DbZP7LtjtOUh7UNywFdx8xjpWU5QWoeD/9/T6
	 y3XoeeAAqbx0nWLvTa4xvEOu310EKQvVsbvk01G8=
X-QQ-mid: zesmtpsz6t1758765762t608c1dd0
X-QQ-Originating-IP: CbNUCiAaXQIGMkj9gt1uh/UQmXiUzOTj+ZXduFCmD5E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11990918805540806889
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:26 +0800
Subject: [PATCH v2 2/6] i2c: spacemit: remove stop function to avoid bus
 error
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-k1-i2c-atomic-v2-2-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=2447;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=orfxUZAN9ENtIRyIBDyaG8LPgHTS7y+7tVQ5jSZVtx8=;
 b=WdSz14k6VohnJbKdrg89Te75ED1NF0lEXgbvV3WeI7EnWoiXlwAM/ZiQP3otUrQV0+fEfiQre
 M0eUD4CyCdAApSEk405op78iPX/xNl0gLSTYfzksdEhyHVZrae27kiY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ObVxCvuFqsx4mO+7fMHf+z4OQCPnb/0sM+lAS9Fz2lsxT4clVE0YId8O
	GADOnRWPdStOhQZbUwUQHH1hqVRG33yNaSeLkzpF4g/lpoaaoQrVLT46PSnujOL35fXm3+m
	cV9W3cjyBPHJkPr8VxKvVZ5v78oIHJX6ckjeT9EnKtlZ0dMWHr986slRY0HuAwa0L2kYrsg
	DHhqS/aKF13hoyNz021/6kpxGNsyxW2z4MOn/SSiBKO8LhfVf/N2OBjYRRKtbg0oOj1PShc
	YLgiAABTaF0AkbSmy+GkpE2IpxE8rV4X6GmmAuCuH0l+As+HJLkckOaz/GfItmv0C/jOJtl
	+S4IRacoCuZvvDyplMc0yac2zXgmEcgjO5PGsiqQdoro/erdXrHedqSy3hlMJbFDQPo3dr9
	DqkYnFyOYgCPtv2f/ODXYfZZ5wMkILOYQn0cIrsjzfbH8tvJBZxOPRnj6TFOFomiDCaKrOB
	WSiCB91+m6g961PCAid+VDQWuWtR3W3FtTwP87SmAjkkQ0KOQumN7TDxqnYu0f3cyPiPCED
	dgJ+702yO57cz3oMDyy17yMFhFqMb3KNMFmzBrKmY2wQoEVCMW9OiB1la5EER4F0pnrUiDQ
	554QAPAsE5DLb9Ki8o6I3enwOhUIOrfKT8KTFhS4R0ZDV6IycPs3EkujfveZVn16eAl4zYL
	Qflch4UK+eJtrflsH6Zyzg+Dfb4p4Y9jHOYXfY44KXwfcs+RWV4Sch1fWJiB99BC8OeYCFy
	JW9n3gQtdjRmMhQwBoiE863IwL6k2NKq9WUeDduJkoOxDCOeSOtRMJNlsw3pf6HnsuK/gCZ
	NPX0qvG4i2rSFk8boeN9FcrzUK8DoiVNDNJejBRgUyO5UpgkAPFZJ3azHK3n8kVJQ2ZwyBo
	EoDNtBFGp+ArHjR80pmnAZytMENlcMEUsHypAutV//z/Mpcs+Z/fbixz54mUqHO5yEGu4cN
	diVqyVkL0n62GW5Gp6qRBnzBwQ7OxFHnYpuZFP5q39GHIjmRJlOfMgFnFaBRZhAuNjm2I3P
	Yc8k1ooxkT5WdWaUiYRyNoO6hCYsyVwRdn70wccH1Q8f+pnESjvR2hjF7gf7fzbm/nxCge/
	q6ti0uAG6Kn8u3Odazf54br2ZcaMIX9yE7RjLJPpCChzoj+hMykmAY=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Previously, STOP handling was split into two separate steps:
  1) clear TB/STOP/START/ACK bits
  2) issue STOP by calling spacemit_i2c_stop()

This left a small window where the control register was updated
twice, which can confuse the controller. While this race has not
been observed with interrupt-driven transfers, it reliably causes
bus errors in PIO mode.

Inline the STOP sequence into the IRQ handler and ensure that
control register bits are updated atomically in a single writel().

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index ee08811f4087c8e709d25dd314854ed643cc5a47..84f132d0504dc992f2f961253b011b86afcc2bbc 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -267,19 +267,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
-static void spacemit_i2c_stop(struct spacemit_i2c_dev *i2c)
-{
-	u32 val;
-
-	val = readl(i2c->base + SPACEMIT_ICR);
-	val |= SPACEMIT_CR_STOP | SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
-
-	if (i2c->read)
-		val |= SPACEMIT_CR_ACKNAK;
-
-	writel(val, i2c->base + SPACEMIT_ICR);
-}
-
 static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 {
 	unsigned long time_left;
@@ -412,7 +399,6 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 
 	val = readl(i2c->base + SPACEMIT_ICR);
 	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
-	writel(val, i2c->base + SPACEMIT_ICR);
 
 	switch (i2c->state) {
 	case SPACEMIT_STATE_START:
@@ -429,14 +415,16 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	}
 
 	if (i2c->state != SPACEMIT_STATE_IDLE) {
+		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
+
 		if (spacemit_i2c_is_last_msg(i2c)) {
 			/* trigger next byte with stop */
-			spacemit_i2c_stop(i2c);
-		} else {
-			/* trigger next byte */
-			val |= SPACEMIT_CR_ALDIE | SPACEMIT_CR_TB;
-			writel(val, i2c->base + SPACEMIT_ICR);
+			val |= SPACEMIT_CR_STOP;
+
+			if (i2c->read)
+				val |= SPACEMIT_CR_ACKNAK;
 		}
+		writel(val, i2c->base + SPACEMIT_ICR);
 	}
 
 err_out:

-- 
2.51.0


