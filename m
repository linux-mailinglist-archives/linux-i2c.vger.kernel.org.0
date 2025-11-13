Return-Path: <linux-i2c+bounces-14077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0191C57CE3
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 14:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7398423323
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Nov 2025 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0892351FAB;
	Thu, 13 Nov 2025 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VSLxr6KF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7576033F8D2;
	Thu, 13 Nov 2025 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040246; cv=none; b=pO08QLZUaUTMASzeolUoPm2V2XjHgQVCi+xSDBwaf8+EycxuVH1HTIdjAB/vJK/Awc9/3hSujLOFd0mdH59iYREqjW9aNcTsLbWKY5NmHm4CUp9iy02eWP/TG0sGDv4QX9JMBEgM1Kt5/Pqd7iCdi+Zii2Qbk0UGYA8GCxfv3Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040246; c=relaxed/simple;
	bh=/a60LCG9PrF70ChplJbx/syVHIICzDVRIa3uNVVUQus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iRkSqdo8zpjyTqsCVo4o5WvTE2IzuNRyYVAdB19nvt0egiZYU+ip9tf+RsmodaPTpRvuCnFfzkRgMfaw5xGlORwG1XNB33b3icpgcfz4hRPUN9OACkc6lDSBx8aHYJCJ7dl7vLHBcVO/7hfVBu6JWUvGs3e5hMtwRzJs48lOUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VSLxr6KF; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763040129;
	bh=iiQHeHD/K/spNsUBdxVuSJcnkwG9NvxKtgVBuXpJ5UA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VSLxr6KFFOhXnCD61Lo1g/KdAmhdIrkadD3MiXist87pOW2cvdUhqM4T97vvLYuz+
	 bYtwPQOtHCFPQVE3mI+G3wfPTqEHHh8TN2s8u/6slkes/0nYUi5TdySO+IKXHKXXmk
	 AgzEdzrVy0EZt6heri3VMFPd8IxDMRX5U60JxaW8=
X-QQ-mid: zesmtpip3t1763040119tba5b044c
X-QQ-Originating-IP: WSzQyCAMDRB+Hc9NMdMMaxfI+JAuDSF0OGMd4+PLci0=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Nov 2025 21:21:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8025135946155333244
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 13 Nov 2025 21:21:50 +0800
Subject: [PATCH v2] i2c: spacemit: fix detect issue
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAG3bFWkC/3XMywqDMBCF4VeRWXfE8U5XvkfpIiZjHapGkiiC+
 O4NXXXT5Q/nfCd4dsIe7skJjnfxYpcY+S0BParlxSgmNuRZXhFRgYMc+CY0HFgHHJRMm2Osi7I
 tuKyobnuI39VxHH7dxzP24OyMYXSsfrTsn7YTEvZ91qjWNIYb3U2ybEfqV6V5lpBqO8N1fQCli
 VWMvQAAAA==
X-Change-ID: 20251113-fix-k1-detect-failure-63483e45168b
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763040115; l=3381;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=/a60LCG9PrF70ChplJbx/syVHIICzDVRIa3uNVVUQus=;
 b=DM8fHhZFeWQXvqw7nbmlAsyJlUSjCgsIBu/safkH52iUImXXhZH5f3ebQmsasy+Mthz7ir5FA
 tbmrLiWBoRhDZuGZCUJSXXktiIPpOq6lUSbKg5fd75d2sYjDV33dgft
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NCMb4wasipbGbqoHIyEbzxZ4qZVClhsnRcSodWTTvyZc7Dj3SX8Mx9gL
	Xj1tMAuJZtpwAFUJccUmc8TL8DstggYJn6TVgP5UWHHVQJNPDuMiYt5VCzzmdyky8CeHRXM
	hcugu67WB8Ey5AAh2gwXStczaVh2C4QEclDpZZO0PufCpvxrJVY5DjPE//DJFAidjF5g0rG
	8L/UGIaDJClytMoyfmq2whIHbfbugYOP/bfkaZrj3ktSHeHQ6Mj2W2NSt3Ub/xT1ksoNeqG
	PX+5szexPebvyBnP5IOJLDFBoOg2TzCHPndCKqI6hETYb87laynjSt2dPIIYy762ilumhZr
	YfVuuxfd5oE+upn4hBSaJXr4qd6wkuQJYAQxrKSZwI+4wot9ficKUotlZmvX6DFSkKYMHYq
	C+b25c0RkW6ZDFh4et6sitgoMlQ3jPTfZeoKNbtEireoj9HhmZ8AXqC/zeJ0Hf6mnI9JE7V
	7mHzZ95QHjbCIjjlK0k80EiuMEjT0QqKolFzLYgHoeAo9Sig/xER9OTz8hj3UnkLMdwUB+9
	rE5Rbezb6HD7GqfXPTSY8pbNCTJU5dwAOZKF1aOjXQFwerBRqY6zjR+cu4zI53MCYV5rsa7
	aH5dgQZFLq+OMXG+qKVXAdQrS5muB7eiPTJX6g8Efo2eigXXONi3NkbaOR6SQHxQ0apInzy
	mhd3RD7OxYnGVqrT/HpnC2sdiXuSAnfyF4MC0mMUTVmvym0oai8Ky2xsxacigO9avD7qQZf
	Fz8tUEc4PAL1HsQ92uqWFDKyUDlpTaGwFhxPN+QbbuWWIiEAF0EiHLPprgwhAobL2ZKMqZa
	N2Mjw0fXWl9r1vSn0qE/KKJaAP3DCM7e55TRQLntsbOApBEk3Rtxr3SLR4etEH1nA/iOsvO
	CQkpeE1p0jaOMZg77i9gft0jK0ZmwzHR9+d2CKrXUpJhRBJMGYGUdKum3CpEBqcJD0qBfX+
	yUWkQfiiqkI14IXA7URh90YStSqWC9E4FIBaQ9pH3gVdlwA61Vb5ITcV9WFxOfvki/z5lnS
	BlnMDORJWKCKL+iW+iuXeCIoU3GoiBk7XOchsEs7HvHaLL+Xvmp7Us0sjJ0QXE7DSwdIiif
	LTfA6IzXiE0xulVo2LmSabasKKsBp2gaTShFVMRfqQIHcxV/3qBbvwbAaQy3naT2B60qZma
	pjVPHyEMFvlgXDWXK+4YbnMWbBHs9bjCjuoJ
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This commit addresses two issues causing i2c detect to fail.

The identified issues are:

1. Incorrect error handling for BED (Bus Error No ACK/NAK):
   Before this commit, Both ALD (Arbitration Loss Detected) and
   BED returned -EAGAIN.
2. Missing interrupt status clear after initialization in xfer():
   On the K1 SoC, simply fixing the first issue changed the error
   from -EAGAIN to -ETIMEOUT. Through tracing, it was determined that
   this is likely due to MSD (Master Stop Detected) latency issues.

   That means the MSD bit in the ISR may still be set on the next transfer.
   As a result, the controller won't work — we can see from the scope that
   it doesn't issue any signal.
   (This only occurs during rapid consecutive I2C transfers.
   That explains why the issue only shows up with i2cdetect.)

With these two fixes, i2c device detection now functions correctly on the K1 SoC.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- handle ALD and BED errors separately in spacemit_i2c_handle_err()
- move clear_int_status() above spacemit_i2c_init()
- move clear_int_status() from xfer() into spacemit_i2c_init()
- Link to v1: https://lore.kernel.org/all/20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com/
---
 drivers/i2c/busses/i2c-k1.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612e098b8ad17418f420d87c94df166..d42c03ef5db5984ea8e06b3d7eb485b4f899e616 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -158,11 +158,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
 {
 	dev_dbg(i2c->dev, "i2c error status: 0x%08x\n", i2c->status);
 
-	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
+	/* Arbitration Loss Detected */
+	if (i2c->status & SPACEMIT_SR_ALD) {
 		spacemit_i2c_reset(i2c);
 		return -EAGAIN;
 	}
 
+	/* Bus Error No ACK/NAK */
+	if (i2c->status & SPACEMIT_SR_BED)
+		spacemit_i2c_reset(i2c);
+
 	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
 }
 
@@ -224,6 +229,12 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
 	}
 }
 
+static inline void
+spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
+{
+	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
+}
+
 static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 {
 	u32 val;
@@ -267,12 +278,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val = readl(i2c->base + SPACEMIT_IRCR);
 	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
 	writel(val, i2c->base + SPACEMIT_IRCR);
-}
 
-static inline void
-spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
-{
-	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
+	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
 }
 
 static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)

---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251113-fix-k1-detect-failure-63483e45168b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


