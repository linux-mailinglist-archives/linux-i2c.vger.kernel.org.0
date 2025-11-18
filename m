Return-Path: <linux-i2c+bounces-14130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E321BC67AB8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 07:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE8A93674D7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 06:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BE72DBF75;
	Tue, 18 Nov 2025 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="moiKfufk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3A2D9EEC
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 06:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446198; cv=none; b=ZEGe4ieBdLM8edDkJuOIMSPU0/gb3UFNwTlVd/zB9OvQSYo6HBqaz/zZRtwok4ubsO8dJOsYYiRjPjSke3ikaaoNL/nVtIMuWj3owxWij+DV811DyzXV/y1lNHmKccQ0VCQi4Y8/sT1degXXR180pZjy3NlCwajZbFoV/xAtqMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446198; c=relaxed/simple;
	bh=j2fkzlbQiDyQooNa5vCLtsRPai/03HAnd8cejpZGxhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hH7gprf62wzoFAKjOzME0UVsb0DNP7VErhtP8kt1Bj7mb1XhuwapUkXoD5iFOBDevffXizCsYlTLzPQPptYbVvLa+CZchvoJsTCc5JA3PoLdfklwXFMSLs93Dfay4wR4/1eS3E0ryN/5tT8GFfIPY6IV/S1/zNzFCJByYxngAO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=moiKfufk; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446112;
	bh=Fn+Ep3pNFHiTcymXP7LxnNNnuuTk/661XN/Li/c3sCc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=moiKfufkQ/Scoe80sTmjwfnssPoy5e2iv16HSk3nmtdRnYlAAXyzXwEJMQvDJrlt/
	 eVauBbiLKUWejlYhQ5emPXSi0Ea+aPBS1xdeLvqK1H7LRSu9WoN2E0vOn4k+22v3Ms
	 X9iApm1fOS6fem8SQkhJqfRMN7GGC4Ol40iXezuM=
X-QQ-mid: esmtpsz17t1763446104t31bd25e6
X-QQ-Originating-IP: nIxd1ZNdKRzG+bXQuhHb5znGp5EUKBmLDWISygy7lWI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 835651233922569180
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Nov 2025 14:08:08 +0800
Subject: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=740;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=j2fkzlbQiDyQooNa5vCLtsRPai/03HAnd8cejpZGxhQ=;
 b=B/MhDWZhHagWY5LtxDsv1ceREB517kF3qq6Bhc4kb4wymUOZhda5qc7oQVAD98qehTYZkNU7D
 pheaHRfMXcJB0lcKvThrUqlCpR/TT1ofan42KM4ImD/hOWtCfRlOuZq
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Oex01RfMxfHezK4+ruocZCCJv92kXrUZsCNBE71uBsWV91gVnnPyt5zX
	JlZTKjO5N6KJHDbFbQbxzQ9/AQBamdGiZ4PbaJkZjt/GkL3jtolZ41RtK3+U5jJwSv0+BCl
	GOBivTnrYkFMWgPImZ7FjXLdItHHHP5b3m+sRq+oPBVaywp8tRIrIdBA3m2vWmL1H4+yUzo
	bm+M3tzgra+F44Hn7EZhl6btiFbodFcFSobqzBfxyZrrjUpjhoj4BOlXBV7EmXYvcNdgpFi
	8RYXpg+iNiLCMUd0j18LJj7G8dSfHlLQVi7H+MxRFUlnRTJ5jJ/nXWPV88cggaZ1yYBJs79
	NlUsuHlvAvZpMz/vdZmMNCIFUvOy8cKXCMEOLrxy0FRXlA8cAiyiio+LH55m5/8Nr6nv86C
	TpLkkGP0/jES4wgYk6pmemX3cZhUFqslH/6d5RhRhU85SeXIeXqyKhaX3lVrznee4RURPnv
	1w7qmt3A4m8cYB7pacfISvgzIU2jn/VVpG48Kta46OQDmJmf2HEHuJlhweYSU9Jq4ewbn/0
	L6pdNpcOcse0zGHcP3S1Ez8HCdol/GvSY/mSLXh8PAaKHNJvHGxJzhJ8nIFrLNH/ulvNSkf
	lUJwPtpwdpjm/RFEHTiFIOs0sBx52wwAYyaFlO3UJSs9VKIER8ajgx+iELPaT/f6nffhWGP
	SphtixZbRYmEjZm7IeCZ49yfDPecH4I7li4L6VViBfo1HlJooxl0DN3Rw7SKups25bE16Ix
	ReklMLR09KO376qn1U+XycEjSdqNzLdJmyZesWr73QWLu4WB7UZWB6kbEwBIpN2JDbbfQi8
	2DucpCD2tN3fpqyY4gzhGMo0nJ5KCn2S26U05OaoaeiTYjEhmFoumlLdb7rErY0bY4aARdi
	9MFhVMm0gI/txW+G/PZDUDpV4eJt0dLhh//Qji+w6j6dPyqE6/yN4j8yKBqDVMMRYOBrZr3
	i8CYiKOUINmxIo6Pk3lkdA4w5RCuEGh2afx0iemnoUpNEG74fiwa08DMV0AnrUh8wNK/RAL
	zdZlPcZ3iFhJ/0c8vshDAoJXB/H0uURK8yH78IXhR15g+s2NV2AYAWQGx2lYaGJWIBhbzup
	ptpodnl+oLv9FgKE1nSTuM=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

The default value of the P1 sub-device depends on the value
of P1, so P1 should have a default value here.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
 	depends on I2C
 	select I2C_K1
 	select MFD_SIMPLE_MFD_I2C
+	default ARCH_SPACEMIT
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which
 	  contains regulators, a power switch, GPIOs, an RTC, and more.

-- 
2.51.2


