Return-Path: <linux-i2c+bounces-13143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2116B9D146
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 04:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3FE51BC37F6
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099FF2DFA46;
	Thu, 25 Sep 2025 02:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="XGimKiht"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25E2DF156;
	Thu, 25 Sep 2025 02:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765855; cv=none; b=MGgh/kj8RgXr5dWijlsKnfG0PRXezaokml+J0xRSGG3IJ+BhEH18qcNkhRa32dcA7X0I4EzCuceAwQc9mwRCTXAbleK5n68pCW3eQcrZObnknDa7eiRbLDGyKiwA9zAQLwPebr6M9QRZGhNmAr/7EsBeUcI2FxjXRT0QOLhHOKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765855; c=relaxed/simple;
	bh=5FRSPJM4VoQdAJpjocHWzM235kXDg5Bbjt8YWtUL9zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMIbof3updey6/cNusOVn9wH7tPdc0YXr2NxCZNUHcx13lrsIOH29dq+mao1scyqmKi6tJpK19fdctLPrpVgrCG6reeEUKxLaiEikPjDi8xB1e1bR8CqfFsB19ShWAWsy7xlvNdEmj8gZGFmiP5NssWzEmkl5BIPb22VcoaG9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=XGimKiht; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765770;
	bh=+hkW+dybFPp2RfqNxYXbnlgcxQFt/YzTD70p6fgGPRU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XGimKihtBL1u0MldqE1+nGtItw5BrmBnaScjoDvugwkogJ7aWPX6sLmghcW1iMit9
	 X28FxIUwc94TIw0Kk0i38n8Y8esnvalM4OJa73kKxbhAvGck+9zKVMvTbDt+wNjym+
	 CxaRhJJeEYCLC/qJ7GeE7oQiMRHQt77tnA7neZrY=
X-QQ-mid: zesmtpgz5t1758765768te9343b32
X-QQ-Originating-IP: rlFNyZhhYIxNjjGAnGHO1Z28iGdv2wkNQPma5kfIAXg=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16720547865039363860
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:28 +0800
Subject: [PATCH v2 4/6] i2c: spacemit: check SDA instead of SCL after bus
 reset
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-k1-i2c-atomic-v2-4-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=1341;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=5FRSPJM4VoQdAJpjocHWzM235kXDg5Bbjt8YWtUL9zo=;
 b=g0au7yfa3Emqgo0Wp+99ATDNTVSzxiUL5fwuzPFjeLTqKObOYJvm6nZqAKwnfI1iRfpQE4+n0
 6CeXGl9AOKyBeX2bIhabWTZTHpNsIL4QoLBrjmrWN1oWyQP+62eFUA/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MKTBhjEpzXIfLqCcsgi+7Ss5XXOYoDoadGKqnBrl9KvDMDR6mpcpsLjd
	+tTRIazt3y/+98Conmwd2MxdSGb29hd3LlUt4jjX7Y4sX2TSjKU/2fLZO1e6OOluzTsTQJl
	F5k4rO9MXmSMDKiJ3riEQBruLt9EVfUR5QpYAN18V34fOghkCH4N8jR0tcJrupJYTAWf4nn
	ZGe1AXJWrMVyNuNv3MUVCbKacaY7cMnwCIgjPuScMIyMfpdcPeqUkcLEXWrZyxY+1w1zvq8
	rF7yyvmIYghG/hd9KqeDja2b/f4bSzUMwmdjwdT+xItZlNpz/eDSmJFyeEZ3V0lu6rEOlXw
	i3JBDLGsYzd/iWOI7g5Begz1DRR9NlReX6w74oZTCV39DZ6ZB8Skf0uXxgWzTmcZm9gTmDh
	vmYs0smwOqy5QuraROSj0qPAqh5AQnJkpMh9Wkipv9XNvWcOvGSC4miYxug6WzWePmKvoeI
	wrseSzj6iykscBoxiI/j1p7sZ6dGGKhTZ3qA+zAuA/AGDi2aR4QxNp5iFLbgLbM3MRPfUaE
	xU+1zmMUSLKxxMABpuPGSV9BnBfinqvllzVp1UgyE9l2M91CF7u/IDxsfIqm3o/qUfEwdwX
	BGq05JdCyHpALeFrKxvmq2OnnmdADWE3gueE1JE+gaJsn8FOEVlbhU4tHz9aHvGdsRsUBLN
	A3NKAp/5vpcNaPeSiKBA8lQCWhiDYaE2YIW4l1Jvai5SBUIBOb4ytI3ZPKT+dThR/SpjMNb
	ia7YDiu6ZGHPegdTYZ4EhxfEFGHSNsQaaHSwmQbkzs/+RHlj75yyHxvyu5Kijpe7Q0JWvhN
	TKGBIzRTXry43tzAZ2NS5KYtY/nm+eQ2EgUZWQJsF9E5cfhOga67HowSl1jZHfC2j6BzbJO
	QfdEQ/YQwEpJfzicht0bHKApdn+Tp3QhtwEMbuaOENIfaAQiitXctGQk2QrU2Q0U5dfmZit
	xx2s5q44t52CrTjF321dNyGVv1bTLvfDTiZmz5JpsgVhP6vC9NGzX2p6MI4nVVsdkVYic+7
	2/hjo2aS8tpWa2HlGFLAIAwlvA4+hTJSm+k0GQcGUnXSbkLj+rMX8Yt65XDBtdFUSxdeCEZ
	L7CbOI+F2ehr5FIVHn8wYbo83u8LTARgsS8+1NE+hPh+i63i00I2W2/tzI593030Q==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

After calling spacemit_i2c_conditionally_reset_bus(),
the controller should ensure that the SDA line is release
before proceeding.

Previously, the driver checked the SCL line instead,
which does not guarantee that the bus is truly idle.

This patch changes the check to verify SDA. This ensures
proper bus recovery and avoids potential communication errors
after a conditional reset.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 9bf9f01aa68bde6460e50c6983edc3f705b12eea..848dfaf634f63021bc565f2c0a1c93f9f33665dd 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -172,9 +172,9 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 	spacemit_i2c_reset(i2c);
 	usleep_range(10, 20);
 
-	/* check scl status again */
+	/* check sda again here */
 	status = readl(i2c->base + SPACEMIT_IBMR);
-	if (!(status & SPACEMIT_BMR_SCL))
+	if (!(status & SPACEMIT_BMR_SDA))
 		dev_warn_ratelimited(i2c->dev, "unit reset failed\n");
 }
 

-- 
2.51.0


