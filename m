Return-Path: <linux-i2c+bounces-14995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B5BD01BD5
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 10:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C7D53042FD8
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 09:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294BE34B400;
	Thu,  8 Jan 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="y3NyM5CA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82434D3A4
	for <linux-i2c@vger.kernel.org>; Thu,  8 Jan 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861637; cv=none; b=W7EwpGdiGvILs9cfj1SOzhYAtkA5yWuep1sfBwy7Ema7fY3gDQOub8kL7ePySv3IHzJpXBAXczYLYKromdFHty6wXhTAuIYBe2CCyyjj6soOABVWu15t70prhx0z81NtYFGqNKEUgteTS5Taj9Pr7CLpn3pGmWkLFlZzdKNxBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861637; c=relaxed/simple;
	bh=l0P1/XJnYJJjVLkQ2RZpYHnO+C5ScLPs7tmvyBIKM/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuofktWsOLtuHFsAZe3W3ZbT6zC0qwQbPG1C8X4mdR7QLPHUFLt4AJ5k9pqIdF7krAS8KiM/tJmVkbyy0M9Cpmom3s+DhzmPD5cE/oSbDsJCUx93qJfS71B2Nzpj33QRWJng9E2jw4WGLayWEQIN7jgPKtfOl7H7iDM85YV/K/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=y3NyM5CA; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861549;
	bh=sp5K3VkefrVnuWV+ys3nGYfC61ceu0DP4LhpEvGP00Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=y3NyM5CAkKM3AoPF8mepppeP/CiQU4KJYLEZwL8LVf1Nuo/9303eZ+yol0sNBu/Gm
	 5QT5wqzFwtpK1GIZSjDGx25KGOQEC/iRcsge9Qro0zXn3hK5SQ1XGxwU8lDzJMyuxD
	 D8wawYVKVAXAPumObk4m8dOutW2dXLr1dskxk61I=
X-QQ-mid: esmtpsz20t1767861541tf3b247e5
X-QQ-Originating-IP: wz7bZD9g+XxhYcyVO7Bx85P+ibKdteFy0msASS7JnYk=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:38:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14760604461507898606
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:54 +0800
Subject: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
In-Reply-To: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1908;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=l0P1/XJnYJJjVLkQ2RZpYHnO+C5ScLPs7tmvyBIKM/I=;
 b=ESyDfxPS8NIbcdtEszUGlXFzmS7z8F7hdhU6+rn4cXKnYF39eOKpv4J2iwqubimrGrG3fJUDB
 0KEedp49deYDsuGsUUemkfJaHHoBJAepDwBJ812yXU/a/pmCY1OrUeA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MyirvGjpKb1j5YbK+baXzNPJU2eh80mxY68nqflhAQCsOMzB2GkWj7ln
	nwpwb2REpIFFpaWw2P+/EBbuayPaJOUKryasxFTOIagVFLDiH55oanVCf81skLrARXng/is
	uYE8dHTOR7u2kG5nr5pj/s+kz2muaBLYIuRcoCLEY1bYyQ0Xd9LXsdmKmUTchrHdpiNODlb
	DR1aQyuD1bzD8l3oadNevCG1fEbSD8IYfz6uUs46rC/dK1plWb1jfmp4eiwdkGrts97tFa4
	Jx/d/KIhSX8WGH8YxGy6Ez0LMb+QcOvhYd0dUEIt33jgbc74RIrI6LulnUkhHomWQ8d1b1I
	93lgPLyv5jee8tjt3rdBzG+RNqEbfE61vufDLZToB3GSZ5fMj6Oq4wCSW8mo9E6ZCkLAokg
	pcZT2as5jksD2hOozgU1o3f8iDmK5/dY41r+nDeoJJjyjK5rG3QXleS2qUnUJL9sQ+aUd4u
	FhW9/zDBr0KHjO3FhPDY+ySOiVM86fQgm6C3/9t3MCbpJrQuteXKi0oHrgBjnjd1Hm81UN9
	00aMhv3Fdc7qmC/hqZeb5SfC3dn9vOXg3FgnTqD00MQQq9OkAWLudaeNNo1jKT14R9phFSP
	Knr4rXs3WZg94Ez4okmivlVMYg66F73DVQK4qzEwkbO57V1mvMG5tmDzofBq1+fxULchgQP
	N3UvP0KsDiT9drG+WFLV6cScrMtwADZfQgpoj5EljGd3Se2U7FRzokQV3pN6CYFp9aSaiyk
	Y5TxpvHWVCUbExIiZt99kYoXymvz1PwNOvg8vsOt2DoLleAXHs+NzFUQFf4pUyzgniAujEc
	DTEbN3mQuKiqZn6XMSrzNYYghd57yz3P+QX5rsfxnIUXpzgXZ/rNOmC8QncMT5Wm35skilx
	0RFdLDnZUW1wmzzBJ+NbtxIb8pH/5VIR2/+TbTfHzjr9L1re/dGPMP1CdzwT1gnCS1IO1Bv
	XnkvKXjYy0YHCgCQ3GnvTCP1JK3UVGCcl0S5A21flBr/ft+dr9qVGSDjpiUTdWFXM/bNFls
	jSyiddtcW1jKVsILnU4QkfSWtcnKwyMgb3kCWkcxMGr+m7dNRsW3K3hnL5nx8bS2+i1wYuW
	YuB56oEcCY0dpJNLCHAyFMcFLmoe7VDBdLM1taopht5f4MGoc1rZXw=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v5:
- nothing
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com/

Change log in v4:
- default m if MFD_SPACEMIT_P1 instead of default MFD_SPACEMIT_P1
Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com/

Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
---
 drivers/regulator/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for regulators implemented by the SpacemiT P1
 	  power controller.  The P1 implements 6 high-efficiency buck

-- 
2.52.0


