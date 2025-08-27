Return-Path: <linux-i2c+bounces-12439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC376B37C0D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A81A7C18DE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 07:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F5B31B136;
	Wed, 27 Aug 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="SpOC/U8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D831AF13;
	Wed, 27 Aug 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280447; cv=none; b=Bw05bcMd4xCK2UhP3B83dyrnteaKWk8Yn+y9yAxEt0GWW67OFeeLwl97+thrZXyYOYb/KWm+iXE+dCLzbk752+gF/ichVzjIexf70nGicd5st1EAHNj7HPcfFv2ybcZ3cSY6H1B7Me5YmMtb2BjpbKkAIx2OnKCivfcJjFIa+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280447; c=relaxed/simple;
	bh=PS5Zvw9vCBoK2sxY5564TXob7NjC4x5wDGBxan0GwME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kK4be77sYAVZ57mcH8rtRrjRLsEDTEU1I89R08J2n2hly8gl04wlpf8pj1zdNM8gczHs9lkoNDyIkmGLKLUBQZo3LycY8C9HahG0ZYNWkM3dU8J+nAieHQJ35XVdpjv/JpUWtWdgCHM1YO3zKip0wCYM1WUxBHkCqlOPI/Y2x6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=SpOC/U8m; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280377;
	bh=e5+owk1uAYBTF93PFpAJK0JqY6PBkAe/4DC7iS4iir8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SpOC/U8mN7WSwZwCPRFV/4rG3tEwau48BTNV9mmaO7iqNBl8UBPI770rSa58GV76z
	 3F1VSHuHu+70V9vp2ZPZoWqKO/GPrpiY1bDcu/yHwxE1fvJIBRSWtwHHNMhVWHTHf6
	 edZ3TEe52u4L9zoaU/w6DmafPsItRmscf+T+05MU=
X-QQ-mid: esmtpsz17t1756280370t76cd2e64
X-QQ-Originating-IP: 4KxmlR3k18jrmUU1/A7Vxlrw7fyygkaJunOhRTtTDAE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5378607378161519260
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:11 +0800
Subject: [PATCH 4/6] i2c: spacemit: check SDA instead of SCL after bus
 reset
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-k1-i2c-atomic-v1-4-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=1289;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PS5Zvw9vCBoK2sxY5564TXob7NjC4x5wDGBxan0GwME=;
 b=DfQOA5jSSX/MOSAzQ5/dhpQsXjTWoVaHkWimnwdpNKX29NSLOC4e0lV+lilOWxcI1Yg/7BW/J
 tIZ7zLI9g7GB+eBoskxop7iYcmL8U7eD6yIdKtbmocVkGTeN6rH96Gz
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NqN/wpVFVRYXUPmS2RiyfcIGsRvjDIfV9l+tOIQLlYCUG7f2p/wnus+y
	YZmF6piUbAg320DS0zSSr8HXmZyAWQAY4kvgl12GRTBE7VsaESImF358MXQlyrvaSG7+5UP
	LJf1prqvWLLZWaJcEa8F7prye6tw+PnRiocAAm8GFDNqMXWLufD/38wO/EcAx87zEYKHeXC
	wtfRw5hgzF8uc472SJPpKrIcihFBq5Kags34O8rPfd5vyGoeZ7ueK2ReXk4hNE5Gfv+o+uO
	EOMDJvL1uBfLgQuAFNuh9+8p6tQU9BIkLh9OKxJRLD+50ky7JSsgir6J2tChXiU8411JKKh
	F6xFeXZnVteN9cJGCPrU60Dwo8whMTXt4yJTGpHYfASb5tb456IqcU7VwYKZND1mzTx7UYy
	B9rAWzYTeG7gvTre5Dp64LN3XJOxEu3nWlUT8gmTi5B13RKr4qlFZBPxKUc2ZD36uLCMCv5
	9aEfywhJB3qEbKW+sToYn9cumN7vQKDKD3ayZ50ojQTfVKLqNqGy9GTDYr7N034dfQQEnas
	lLTffwrxCJ4nLqomv0ElX49K/AXknOq8t5TWYR0y3lkd2CL71FQjjHUdMgifoLmOd+AMOl5
	VyJ8ETp5PWsFzKcJeZYBLNnK8sFC99WzCtFJ44OXJyfltomfDGbLn9Q/iQCk6/woGTjd9Ly
	/K+kbH+nDPxyf51TudnYAbXiKIDbx/c/vZmuxjfOUi6zYzNhpT+4H+OQA0b8axMM5CuKseR
	EqM0AkeM8doeaoBCN+tmwqvKR87Gkz9RlqA3mi0VncESFcTarkTrO8azprMd5LsP/R9Gj5g
	5gLOKAn/4sTaTWiTDo8XKjomZ9zMBzEbo2qTnow7yB9WCdKUwjSKlamHHQu6bKxbjKM9JnZ
	Sw5lNGoNX29Fpp3OowUjjZgbuXieYJ/kqH/IfcdEjuIVJM8fS41fB2Y1Cnr+davQRezJuOB
	Pb+16Cc9XGlqIzflV30FM5aZ3ER8h27mx2tFMx/WQGlgF/jNZHbuXWbne2uwDsYlxna8Pwk
	+pz/mqwwWQmm5c3f/StyhonQn9vxskl3W9WAylNuGTMzrXkBa7QMeRDEfmCufjzY+iePohD
	h8aGckbjrx9sDGZLmfPl7EVrak7Zo0Teg==
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
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index c1656b78f1681729ccc2ebca6e290259d14889d9..4d78ee7b6929ee43771e500d4f85d9e55e68b221 100644
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
2.50.1


