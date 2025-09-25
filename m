Return-Path: <linux-i2c+bounces-13141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E319B9D13A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 04:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 293C43281A4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 02:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78E72DF15A;
	Thu, 25 Sep 2025 02:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ih7PXNw5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F232DF14C;
	Thu, 25 Sep 2025 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765854; cv=none; b=WfFaZUSmxe5IHSwaa0QbYjCUSezKzqyohb+q7VSJy3G9lYxD2UBM9sgWvWXuAzfKo1vLwgK2w9yIWKZSgNA6j/mtZf96ZS56IN37UFZq++V5K1/muCgU31xoYx2pvejNXbjnjMkNHSZMTztYQyfIKuQPA3NzyX1eEkjWB3lRB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765854; c=relaxed/simple;
	bh=Mxko1HfYivBbT3R4nSU08f1apQBZPPP7+WzA53A2nhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNfnXvJeXfbgRZH3dJMsjiPdz6ZUGoj9FIq86E9OMAVWG3SErKCmloYZUi+OZ7eF3yVp+WQmhI1Zqkfazty70hf1rn30zOXQShV49Mfme6+PWgz172VxcxBei02rZ2zyabjjjZY6wzDAJe/neGlGaXYTlSinV2oe+eEKWt6/aI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ih7PXNw5; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765760;
	bh=ki4zczk6VnUFNXrN8wqllJY+M2Ri/NDcc9h1NlUpC8E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ih7PXNw5bucOl3nZMBveyjSptPcQ+Bttdlv9ASfroqgzrBWFJJ+t6dM5KwyR6JGEV
	 RsmlYElRDhE/O5HIq4MpZjiM+z/SVY24zKZ0LVOQlLXTEcgaFifr9w4iEUHohsftTu
	 o2VtJOGF9iXuIdPOTXu2iLDpzvvJzQk7bjs4ujNI=
X-QQ-mid: zesmtpsz4t1758765758ta18b7565
X-QQ-Originating-IP: 6831mDtJxG/SrWIEQuteX+9U7ft5g0Sd/JCA83Sqr8E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6417342533199486618
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:25 +0800
Subject: [PATCH v2 1/6] i2c: spacemit: ensure bus release check runs when
 wait_bus_idle() fails
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-k1-i2c-atomic-v2-1-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=1370;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Mxko1HfYivBbT3R4nSU08f1apQBZPPP7+WzA53A2nhQ=;
 b=6sLdHx5CBOsGsN1uV3b4FYW/koIj/8FPAVsFZ1gBAOpCL7oL8BGMOtzZWE9rlCfgsv5DUHaRF
 dJenAmOw74GCSdacr5ByQxeiStC5Yu54/aWtZUhiSzYYTj1IJPHnXbd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NxdC3wVPjoZEdRrLlBsWCG3BifrbHTJ24v5o5vVXwvwWOK3ZuePnKtx/
	ICfUrLEkvEa1IxiFMNjtTu9Q/orziD5eMNCcuCCIje9HuuGWjavcDkTG+7mOPr5rsZf5d5z
	tUkHmU922DX+1cy45qBJLABsJJXzUqxbKtC5B7T8JKCNlvL/P/syvl5gW6NM1cl9/hMwKvk
	TLvNlLv6MQX3hZtOYw3mEKZBl0HMaKZ0wVRsKTMBIueCQltM7fIFAzcJRVTYKYibwfXU+Sz
	unfZNm4yjyKGWY5iY8l9Pf9jFty1BDdEaOPcLonUCx1a2Cnc5AeiXBm68Ie+6mXCl9Hv5/G
	dgoi8peItUeGPmHQROda7fNHIpgJIJT8DlAC58WkmGWFVEz5eBwh79Alb/I8YzLvJneOv60
	eeSo4nigGVKPdi+/1YPvTHMq4IKJtiT3mSxwaQmlnU75JT1gQXym7aIyqaVMPtETZTIlDph
	5Jycga+2cQGYzQcMovAA9A9dUTHZCjnbKbZSq1bJTIsRjBgnj1yaD7y6pilZWbW8ZL+6z1o
	JO18fS0PbXUNB9UwFKUzA3dGpa17afB+S2CwsSwrkPYZumTIu8P0dp1i/2ld3oie3/gA0MC
	yQ+pd0Nz/3wx0s0+Kh7B5m/OuzOlRwqRNzUooxVECUmDxE1UMStl+bqkLBjajZ84SzyYGz2
	S8L3aG+BaBEMDynBBT9jHMn3KYdEMojkg6jqlVUcFdtJ0l0wto3jEi1pW93ULT6/TetAkdv
	tyfwLqzgN3BmBea+He4MLh0UYD8T1doC/OyJpsHfxrk6DK6U7Dw3PfZuSzrJEWBL2iS2LHf
	J+Wn9/6RCeO5BCzYyNikwGj65gZGFet6RLqXQkqe3otzZYl0yswVJH+tXF93TmqG1+o2wsR
	0noT/eg8CWLpZHJSSR77q8BlwVyW43VjOs450Ac/BnnIQRmsX5AIKUaP3u+P6btGBBFJmiG
	Y1M8/AwKRr+0j3DFk+1PtJv6eW3bDNV65e5obS0EUzN6OFg8WrvaP3hFnuTcdwmNX/3g2tz
	QpEgHeX3X5WOt/JiMuoaZV2aPM0xyEDILn9k1NniAvT5eczQwk98Zm/0lkNIBVRBpxJj7Tb
	h0tH1zRsGVqsgYTI9BksfmSHCi0sj1EhV5b/qUgO7+h
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

spacemit_i2c_wait_bus_idle() only returns 0 on success or a negative
error code on failure.

Since 'ret' can never be positive, the final 'else' branch was
unreachable, and spacemit_i2c_check_bus_release() was never called.

This commit guarantees we attempt to release the bus whenever waiting for
an idle bus fails.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index b68a21fff0b56b59fe2032ccb7ca6953423aad32..ee08811f4087c8e709d25dd314854ed643cc5a47 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -476,12 +476,13 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 	spacemit_i2c_enable(i2c);
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
-	if (!ret)
+	if (!ret) {
 		ret = spacemit_i2c_xfer_msg(i2c);
-	else if (ret < 0)
-		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
-	else
+		if (ret < 0)
+			dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
+	} else {
 		spacemit_i2c_check_bus_release(i2c);
+	}
 
 	spacemit_i2c_disable(i2c);
 

-- 
2.51.0


