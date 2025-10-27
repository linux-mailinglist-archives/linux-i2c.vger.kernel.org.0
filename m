Return-Path: <linux-i2c+bounces-13824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A85C0BDD4
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DF1F3BA5DF
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 05:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA6E258EF3;
	Mon, 27 Oct 2025 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xo+n4mte"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF623815D
	for <linux-i2c@vger.kernel.org>; Mon, 27 Oct 2025 05:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544211; cv=none; b=evbqBtdtE751LnT4ArZaoLR5ygCjJDpowgbcQ1Nk/jbBmANc+6iy63LnyawQu8be0Ia70AJd5nPbwUuH0xAVlWJpTFHtMF9Yr4kocKswx//OWNkH240n95poAUp4rqC2zjlGhdxEa3GjEFbY16ZtHEjaS0TbmePXoNauKsn3mOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544211; c=relaxed/simple;
	bh=MdOH9hjjxGZsKypHF4E37v9P1dlEBgH3N1GF9QnLQ1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxlkVSV9HtfaqhwZZoXNeDZFb+1b/Y2K3vGxldqud2SYiqcXWSiqq9ijhw6leW/RyXQT+w1lgig3X/GM3isBwhOlo4bkq0LFj718vAufr1MV0RSogAE4LC3XUW3jGvBaHz7gAu62S33o85jw0PjxylO8v/JtqqRpYWgFeYIMDgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xo+n4mte; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544110;
	bh=eaKj1HRL8X/NaEJQudAmylwIeVJyeI2KOmMcJICZMgA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xo+n4mteSZtp6EFjbWVUcBhlCVHEMupMDFKJi8c0JuQAIx5Y5MGkcfG/bxi3O9BJc
	 Rsr1+umPLPyouVC/4prVb0Ob0DKU/WLU2N/SOf8CHihbXMccLPssP+M+d2N+GHsug6
	 uv72sjuoZ8+C55stiZhfoVWz3KeSawZzJ/uRDccQ=
X-QQ-mid: zesmtpsz5t1761544102t2fd12e65
X-QQ-Originating-IP: 9D8j9F1R1n69BE9ErCI2rUt3ZW+zWcbpU/HCZSqgfqY=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3398915015117501572
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:07 +0800
Subject: [PATCH v2 3/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=913;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=MdOH9hjjxGZsKypHF4E37v9P1dlEBgH3N1GF9QnLQ1I=;
 b=jzR4ZlQVr89vvMu1oyh/46l2oRBTv/PLt6B/jfaLsrCb260Lpqf76bKrPnMiKPjKCLa1IOGn7
 362mPKO4nFDBUSwhqCn9Eaj+9TsjrPxs1kwQhRvjgWgBJ6flf/Hf9TG
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NuQRJUP0KJGkTdDKRC+DCvyBhMRNHm5VFXxJRZKTCEUAmNr+Abj6YsQ8
	X7K/oRQYvztWqreGPBNjW6o5jKGI/5VvOxaA61P9ReMsns1uLc0mzfPzsslajlFl4PVqRe5
	M3o+si19HrF0ce04lpN0Hnb4DsZmujCDlyG1vCA821Oz1BGmeBJnaQeNTD3fAeJSGNG+rPL
	PdP4gJWopjbPrIL1D1KdZCJArsDxYTljIo8BRi/ayzNrzwYk+htHXalVnHkXGVQhZ9oeyJf
	F9iQ8aDHqOi2XEWSH1S7qM7AadhccTejPabdYETCarZDZSKgZcV2LRoY2Jyh6QGHPE3Ae1+
	Mzh4n5QAAh1+jL/QQZ0J/k1wy/GJ65M95BT+t2cfaBSt/ubqLnygEGuuQxiPAIQnRpqmvu3
	G/1Z7LzNnwQjYrMd40N3X48heYDCoQjhR0Fr8eCC9Xzw5QonMYqOoHO6gEp7CSlSbM9sYmh
	vfRnX5uNPL18l09zFzHwAeoBir9zIYO8bJQMGollhis6WjsxWYsQOy/a5HWv974xRDtsIpa
	xEAel+7JjxUwJefAgm7v0I12kXvnNFvnz42DSJO9JKtpTmAkp79g+pzHk1gRmis4bdBrbu6
	y9vf5s0zVnzIAas6yAqJvTStKLXfVmenAi0nIJt6gXjazyE7bCVq8bUu19BfjTYt4NZ3BZh
	DAb03YI+VxHFSFfr3Yd5JiwBZMtj+Dq+LG5IdWwg+NV0TePOtcr3aA5M47HGM1e9LedFO4n
	TaONR0cuT6lndAEO6cBEsIkX+HwW4dHXQxk3UhKPuhYBAQ3jd1U7iDlIuZMkGy25JDUZ82r
	8YOjAUlcH2hSdFvZkAIGLBYMC7gL99eosAySPPYGjB+3OwKv0GKEkjJKdUbrPnSLjHthKOo
	g+zD06obVT4UZmZoJZlVpmh60F+GCNXv+p2PvWMrAkLXlPLhsPTf0V00G3fxrnr1b/q4dXi
	qGbtDwATC4pNiICLRlrbCWNOjVkBl7cLL01fEw5qToR6kNn/2NCKCs9vP+QH0bstryDyuv2
	nxHM2BcWVUBcYKNhWk3MOSovNhkdsZ54t1A9Za80XwggEGiT7wwIo/OzcST7R9nEYZWhDws
	UJwyGWjd1r4ZGqROKteVTMjuPAN5A153XyC9/ZAmRTB
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..1ea0123e386f2b140e1a63a182d1781f6a17e835 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -409,7 +409,7 @@ config RTC_DRV_MAX77686
 config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select MFD_SPACEMIT_P1
+	depends on MFD_SPACEMIT_P1
 	default ARCH_SPACEMIT
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.

-- 
2.51.1


