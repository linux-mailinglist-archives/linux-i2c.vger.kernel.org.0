Return-Path: <linux-i2c+bounces-14785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F83CDE7FB
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 09:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6F85300A1FF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 08:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7566D314A83;
	Fri, 26 Dec 2025 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mJhcpjrb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FFC31326C;
	Fri, 26 Dec 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766738017; cv=none; b=Nbo3luDHVfJkGL9823zcCQ8c4hRY4HPh//vV4E6JbtIZ066cM4C3AnzDVu1xyNTWoTzHqeawJsRgx2g4q66wcaXQu0YlhFZYvL3K4aAX5xrLpyRrrnZibE+SFoXdI2uGVwueXSM5o5N2Z71XhbGI2zaUP2T99UQ8jObuxRcygJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766738017; c=relaxed/simple;
	bh=4WF7PpSbGiAEocf+vpDDLvscterKabWsWS0qOo26+rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gC/pZ9i0o8Q+dV1nt7VdVCCjHe31ViCT7UBvLXeoW35vq/va/Envon9yHMUYZw86Mo6RiUnq1JzsDSS8C7ewOqgy2+DzaFZbogYOIeJUnM+dTzJcJBkA/KO7ceTf60F6yDELSJDd/q8IUo6R8V+iWY15DVQKvW+xUM0aBZ6TTJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mJhcpjrb; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766737936;
	bh=UeRZTj3RgL+C0LFt7dsn6u9FGTvGMeuehM6rrW+shiI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=mJhcpjrbeGThy0ehyJV+9LUlK+DF/FsBL80FztQfBY/Z6BhFIFe+WktLCNS0aAzBT
	 hjwkZL0wb1Y7kOQzU7/uv1xtLISs6fkRiW9quFsGQsr2syyAFKctUy6VhRQ0kTDKSg
	 GCyKl5U4tkYwCEaKxxlqDjI90QUJ44J+BZnXZhZI=
X-QQ-mid: esmtpsz18t1766737930t654bff71
X-QQ-Originating-IP: xxPuGQWHfUB+ZjzOWJRulHKNXe3Xaa+AWCBb4JYA1Pw=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 16:32:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4478349540645840041
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 26 Dec 2025 16:31:59 +0800
Subject: [PATCH v5 1/3] i2c: spacemit: drop useless spaces
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766737924; l=1067;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=4WF7PpSbGiAEocf+vpDDLvscterKabWsWS0qOo26+rs=;
 b=KJMJPL6qdCMVv2K9MWdKfiPFYf7zIVqzvL6gfg4ecAxDEfxEgo4gP9417pUbzM07yL6rSG/3q
 7f3PLcX914TDjDXzmDvTmMK70AbxOpS1DVZyxTUocqQ7UYAmuY3e63I
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQaNw+J8Qgodt8wxrv8k7I9ZNKv8IuZP0w2xAALaZmv8umk0faUXObGI
	V/IQT0hhFYpDQ5SFPY9BZeO17BhzLtTJm2UINXRsHsJFn4jn9NzGJ44DM6ikrP753RCky6L
	uh9SwxsKrI/nYtkha0V8l+sQwToFrVWOtl9PW8VgvPPSmqpi39lwy71h1SH6bhlM1qzk/Cp
	vIGFmizy6Qov3h7QlTnhf8SOu/lQLx7HkzGmhExxH21BLUtvjo0zKyq+qdZhCp8KpvvmNIK
	bjt4ptZzbXYX/MHA1/wln5xJ4ahsEheNfA0g+umA5KSShXR53QhuCRE3E+Gg1ezx1uL7nls
	lI7duOtetNqxb7rpuKw2FRon0l9SHK9LIqEX9Ul+b03fNNgJw4oS3fWptB5ngsZ6bWBWhpt
	K6R7AESJy4vp02EI6OZM+tcHooHw5URJt3icq4/rrXUiEt+5DB28JWCKOsjp8hZAKMTmtgA
	RGoObos3qqdTjnoOoGY3C61kPeX+4TPJgnuc8qfBRslOscOhdrCj7LvFaHPDMOTDV0T1kM8
	MC/ysC58DERFTshc1/Kvrg7sgOwzAx3qujIIfrNMeWNUHE/I5EK+m5tr4umb/aQp5QZFGPI
	7ILL9Pfelaopmr+gv1ndKjENgNg+KyYBvHbWeVfCqC83ebFGBfb6nxlbefVEPcQ/kX0DG69
	mueAVHNiLv4Qdw8lwLCgSfBA7N1wW91xdrYuWjFuvLSdZckVkQT63KBg9sTCsPOHc0X1bQI
	Y9dXesWdB7LURb33wUwqp+aQaF7A7hfOQiMFvG/LaBezesFgHkmp7wcX2uKKmkBFFbQIIfl
	oX7Wh2eqhUoPty9XTzFnVJ/4eQhQJWsRHYdMDUTX07OE0yLCjjhzQapOWjn81OYvxk5VReL
	8ognfjQ3JJcxTvHOpZBiA/cPnmxyqKN9rMxutZwZ+yGZxp+PVkQrUg9eIG29j3L340Wc+oi
	KR7o915D6podvNewCjnxWpC5Hx1KSsHkGhj8FkYQ18Rzaik5L03tP8CFFXejO/0DYKcuNsN
	Fqa4XcP+A0Tz2HO87htYoXZfnNhaoGRLi93n9JCBUJ7mZGH2x9+IzzMHFaWRJNwhWhUsHuU
	sP4OkWiGh8ejRgsxsxmWjAGahi3Uzdqvhu9MAb4ykO6yPk+stAlo25WdMyBirur1oT71ozf
	CfvF
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Previously, the I2C driver had an extra leading space in column 0 of
included header lines. This commit removes the redundant whitespace.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..30cdf733deef264061c8ea565634c5a17f5aebfd 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -4,12 +4,12 @@
  */
 
 #include <linux/bitfield.h>
- #include <linux/clk.h>
- #include <linux/i2c.h>
- #include <linux/iopoll.h>
- #include <linux/module.h>
- #include <linux/of_address.h>
- #include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */

-- 
2.52.0


