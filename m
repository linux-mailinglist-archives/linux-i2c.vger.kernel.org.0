Return-Path: <linux-i2c+bounces-13947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E4C2A40C
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 08:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D0E8E4E8D9E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 07:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10773F9FB;
	Mon,  3 Nov 2025 07:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="d3LsbCOR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827C8BEC;
	Mon,  3 Nov 2025 07:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762153685; cv=none; b=CDC0ZeAOT+SqdXtqKUpypOP+XjvwhmOm1JH0dUZF1NuFsnXKwn9P8PU5iKuK0+1mqpTi6BCLMdPVrBZ5hCqQw5ahaXy1FG40rZhDFoxhujaIn383WskzWFzVZZmDcFioklUtVSOG8KDt/KeUs1bnLTwvvy5wPJvsiGooghlNaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762153685; c=relaxed/simple;
	bh=2vc8dJMZd6FC7filclH3xokq3Yh9OgHdz+OEBsr598U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HynKJCiPgaSpwPjK6naHD/0NrcOHxUqZvJ18SX/ia3BJj93RdOE95x8WKY/r3ouPNZt0XAEIsQHp6CKTb+c57NRuDiVwmxpJkVU7xUzh8IXc/YysWRmwUnH0pU+6iGDG7HU4dZ7hXslQVYLdjf9wMEEgRwwRyV6JG1TYGRtjL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=d3LsbCOR; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762153590;
	bh=twT6UKR7uxSLBMBv7PcVYWWyZztV/iDvMv6ENH9b6WA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=d3LsbCOR76oDxMaFWjYox4PGdOc/XpVKtHm0y/bIUif435dA0ASEwTBZVR8ndedbc
	 hojETTZbvbEMTHhdJn6ANbmhFkAwYLQRaHt5+g7kOZhVkk9q7quPQm9ECADO/266El
	 c9gA6/w+8eycNLm8LIAAEItJx0Y3cXdINR3e08wQ=
X-QQ-mid: zesmtpgz3t1762153588t9f1f8e62
X-QQ-Originating-IP: R3B6rAZlOdUvAMM4kUW1Wx0B4GixrEUlUvZkXan5Hdo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Nov 2025 15:06:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16909040105550240895
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 03 Nov 2025 15:06:24 +0800
Subject: [PATCH] i2c: spacemit: fix detect issue
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAG9UCGkC/x2MWwqAIBAAryL73YKPQukq0UfZVkthoRVBdPekz
 4GZeSBRZEpQiwciXZx4CxlUIcDPXZgIecgMWupKKWlw5BsXhQMd5A8cO17PSCh7I5321lhXQm7
 3SFn8v037vh+V0IcRZwAAAA==
X-Change-ID: 20251103-fix-k1-detect-failure-0b3082c73784
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153586; l=2372;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=2vc8dJMZd6FC7filclH3xokq3Yh9OgHdz+OEBsr598U=;
 b=Hyn5Qog/ra3RKl96Owc8FFHtdNGYfk5j6NbnLXSzUgwqi6vdLL4hfMVZmP220fc8KIno7v+BK
 paqheZ1hV68DflWL+R6bhBmNQDzJZ+X/9Tzwg+ShRAuBnNRTNa5ibQK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2QhaCakBTCB2YbsF7K2RIQJT/9qSLLx2hbcFan49fneMI
	1/bIsB+wtDzQz71c086X6JKQiUNHIyvP7mxVs8D7hpCFS2KEuA5vEPWF9xqmILxOGVDIWse
	j+cQ7jYD5Qz/t6pAuyTxxPzeGOgnI4iYn0bRrlVlsrk46WrVThMtHoDaJuDU1RV45nd68ZD
	HBhpPJ/q7WJtGnbWf21x6XXtujDMJNnulHly8EMe8m63Ff9RbGr2Inve/gQVDxkGqgO+/W/
	0o+4zwodSpLHyDCpx44b3fXLYt3CzzP6Ni61a7iigs5BUmVjtIrkZMke2TwTIxNkYV698Cb
	KZCtrCd271Edb60GERNc6IOXPS9gcJDqje4LLGFpFWnPSbDdZDyU0X2CQjG7710gpNe/Tlj
	BeQnLjxLGm7RqNNNtdvedt9gwnHg4ivP95GuETGx2qUerwFt5KQIO7ivVAvDyFPI9vKBNQg
	UokJR7sx8dhtvidabrJDE+ML3XfGvr3eRQfW4KrSQO9+otJlmLVZ4osHUvEGsdbET1/2Vyo
	K4j8M5z5n6sVMjbH/dBPneEnNGwB7XnNBJm6U7hh0gr4HrqWe1R1UNxFkt4O+2q1eSImeFV
	abINM7BU6wuqEJVbB0OLaFt9hzq+VlZRbehwaUsv2Tdr4zPbdiZGywtnfyHPa28bGJRMoGD
	fGJPiXkd7lER/VFowALipfvTvR6SauJXpCOevAY/OKIQ4BBNgaBoqMnS6yhmptYHyCpx0cs
	gizfrhLSTw5m6oFtjt+2PE0AgbdNun6mXuyYdoQ9Ey4s6IIfaYjeJTOnhe3WMJNgskg1D+q
	8fmbjaTzql06PdiViRkATVS09JaKiKZl4BdVhBl2D8B2w5hrtF1pB+pOgPE39yOwblAPTG8
	ihiJKmeyzmzwMUO16ftngwoZ0pfLvHOgH3g7TfTybnei3t/NIE1m4Kh7aLPsbYznG6ztmZs
	U7nxT+QpxdVV1SworCtJNUoSAsFDwgxAzy6SJz9QQLHgXz0vPuAAfIwvnW+Zq5zezs8Hptj
	JL7YyaQ0JgPH8Laqb5KG/7vnC/vWsezrXBB0lkC+qVuRvkKwg1RwzE/BFPQDGU4IGKCFGU6
	Km6kw4WUaM6XPSXAa898b4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
I checked the vendor version driver and tried commenting out
spacemit_i2c_clear_int_status() that runs before xfer starts.
Surprisingly, i2cdetect stopped working as well.
---
 drivers/i2c/busses/i2c-k1.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612e098b8ad17418f420d87c94df166..37828323317770ae2f0522d213dca67342ae166f 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -160,7 +160,8 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
 
 	if (i2c->status & (SPACEMIT_SR_BED | SPACEMIT_SR_ALD)) {
 		spacemit_i2c_reset(i2c);
-		return -EAGAIN;
+		if (i2c->status & SPACEMIT_SR_ALD)
+			return -EAGAIN;
 	}
 
 	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
@@ -491,6 +492,8 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	spacemit_i2c_init(i2c);
 
+	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
+
 	spacemit_i2c_enable(i2c);
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251103-fix-k1-detect-failure-0b3082c73784

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


