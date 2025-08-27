Return-Path: <linux-i2c+bounces-12435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EACCB37C08
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84E2E1BA211E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 07:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766D0319871;
	Wed, 27 Aug 2025 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wpRyVp7p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891EE31A063;
	Wed, 27 Aug 2025 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280442; cv=none; b=ktfKBhdQ5GrVVuhaHndjSwxz4qsJsVEMjFhKBk/AA/DKVWNbyVIdKyyzA8/TelIdwsIb+Sa2Q8LOQMtW9dbIijZ0u4A7FO5zLc6wSEnbYuXQo3COrYBL1lPhpfXBly4xHRQZK7PlEsWTRy0EmnsHPe83+z9tWcDsrEYkIHTe7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280442; c=relaxed/simple;
	bh=O2naaLl5Cs0DMQ9yfCsYpaouL4CksC9CM4vilFzvkyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdiRqjnXGtWxptrbk0TYGgiebhGhBoQbgQDLwYZqVFxGCoKXEMirXx+Clp3BAwOJKtGvs0Bi+5QCnxaNKOOwpMlOvmuNsV35EGoEFhu63NShsDXR9qkqbynu9nXbK1Eu4F4jGMcnTt3BkVH/GEK4Rehcq7poq8psb6ZYwgCV0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wpRyVp7p; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280368;
	bh=Hyx3ymaEGNzBK4ghZhgbXN2uPhad45k6Uk8y3I6pyjI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wpRyVp7pbXZQrxlVCxcAVxo82mwG8M7btdd1oXaPJYMK2A1Uuc75cKJ43pYN0k/5g
	 DDt7iKr5HRMeO2WH/AyLIgcB+4QIDd8ZGwgkw+sGmRZJLGETD3OnOu8orKb7YEe4hp
	 ztYtY9i9lMTgOL93M327aogdkDwFMn0+nT2eo2+o=
X-QQ-mid: esmtpgz16t1756280361t7ea55d28
X-QQ-Originating-IP: tcnkU3el7is/5fUg3mVsc3eUfHeY/KFA8ijvRn1EyI8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4976485597783889117
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:08 +0800
Subject: [PATCH 1/6] i2c: spacemit: ensure bus release check runs when
 wait_bus_idle() fails
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-k1-i2c-atomic-v1-1-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=1318;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=O2naaLl5Cs0DMQ9yfCsYpaouL4CksC9CM4vilFzvkyE=;
 b=dhv6YDTotdlXwSY6VBfyfnMkAC83C/xlrMYrEQsEuUbvIoxzhr5l8Fn508+HCtvTsr6U0lyAR
 rYanvaW44ksAsj7RgVne5XldNicQPyGUDPBPd4GGUi0afj4gedXtwyJ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NhTe9p7tQP4gmwaIF09oB5LgKGXsdFKTYDLGDqFK/Ut/fbgJshsLzspC
	t7LpguV0Q/zHpaBBuwe1IuhKVWYkF/uekP60nDVA/54cms3H8AytN7QYzN5bJZArpDKKJUl
	zowVTef9kpZwS4QwgXipRgiagYFhkV/NhhQAMAEW/qb/gZBbaW4KagzeJ/NBfeKT5o7/4QZ
	G9WZwSwUo2DsJQk3XnBPus70nP52S/p+O+uPPt/voNxTbNMikyJtyAepSCy6odZQd3nk0sL
	ZwZ9n2Papp26Qz9iMIvriF3xxr+uwIGZ6o+3tAEdc5mnFVVFdC7I+ZmH2tbYWDPbT2dp25b
	RTtbH3fXB22t8cSvg3zpcO7EsGdVlVPrxVwdbRcPxBkKSXm2PGMnWmV/WpwRv0KD0OhpdlS
	3TkWr5AVBM5gCH/0MRO5WgOh9Dx3NlTwLpERSaGwDCcV1RdqBAZ9jE14uWkBcSog5XubD1c
	sWtHfIDu7sf6JTZyB+G5sWgMsIG0La6BrnOWx4PfFxUyySwh1VLovcg0Bp0XppQlH/GLy9h
	Te82ohaj0PN0q9tw0pnx7leZe29Fa8n4O3NLyuljBhlz1mqYMolLOZ+tqDnlAbZgIcBxGTm
	eBhDQES4KU5Hof4dQX7RIzs6c/ZjWr5qBax/ozYdJCSTl5xbypIzbJqRTIS3V1ixGufxYAX
	WB5ibrcM9HzeHcFok4+IP/gc8QE+V03q5LhhxHlF5B6E2uDU+PDhPWlnZMrdW97ai5sSzne
	keRxGqlAEZO8+Zf+wZS0P3AtIXrUs1baHx9Ap40cR1+9iH2tW2UIUhYzsZF8SAwmdgp0a2D
	n6yzqPy2MBbyKcqofhel+InEqqlBVL0/+mM6atzVYjYEWwYuwVOBNvm5BwwH8F65WsnE9YA
	kFMDBRA2CUCuX9a2KR6m/2lIhbnrDIMeGx6T2XVhHvxY0MWAwYkwDOOwcxz6x62XN4+8K2R
	TPpxNkMpUcxyfNP9oxoP8b0+KbEQ3TH4nAG7ClrlSre1Lx7sPrrTilPm5mWAH57iWivooGZ
	Kq/hPjWallDZBvT9srFF2m93D48agyA8JFkyMnDJ9T7Yex4hPtTUEM8TD733sjQjyQT9onI
	hz/yKCleadlfk6d/vT7oMO8gZ19bB173GT1LwGKzgRq
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

spacemit_i2c_wait_bus_idle() only returns 0 on success or a negative
error code on failure.

Since 'ret' can never be positive, the final 'else' branch was
unreachable, and spacemit_i2c_check_bus_release() was never called.

This commit guarantees we attempt to release the bus whenever waiting for
an idle bus fails.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
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
2.50.1


