Return-Path: <linux-i2c+bounces-14133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFBC67ABB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 07:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E99F136758B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 06:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AAF2DC780;
	Tue, 18 Nov 2025 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="LRzi5te6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43D2DC77E
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446210; cv=none; b=CIoLDVIA5VQ+Ky3UAw8VKvDSvUYKCElHL+lJZeRT/gDu0o6OcPVPLlJzaZvXAZp2mtLcA5+TiOVTXU7TIKyJB1t322HGXazmV8pQdXgcK3pxh+mi1XoQsN6gt1HKCOTgbWtL4DWsI99kE6nLkwUAaZTsvxjveZH12lYRJUWO2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446210; c=relaxed/simple;
	bh=O0ET+73GNcMNM8GQ0vp3eFlX8NnqDIXFIkI/j57BfWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rvcenkgp8fWLOlfyGHIX2p9F7YkEefff/m0r3B5Rua3Yfl8bjGrHMM2pPUWduHfbklJgOGvWXcbvVFa7P2AnfsExCCnh3MXh4x4JrHpR1UpH3o5U53EawFr6+zGb06qogBV/zEodM7HlVbQ4FBI8XfhsERiEigBdkndocEip35E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=LRzi5te6; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446105;
	bh=JJKnbCzCyE56DvqtMiAuAzvsyxWj4Xmfmgz9svZYVl4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=LRzi5te6C02Gs+k77eRctMheekb4+/EoX3pFZR6n6/Y/PUGHdak2khCC99ikBA+S3
	 93NHOriWsxYZgr6wVPvlpa35uyG5ckt+wWgUid7+A5jLVlsIIFKxxFwZfN2Ye7Gj7f
	 /yyH8aMYgMi48swl3OSdy+FZrJPMhQpI3N5o+BUQ=
X-QQ-mid: zesmtpsz7t1763446097tc170ed18
X-QQ-Originating-IP: +LNcdJjd9qMKIjgg15SU0g3IP6WZkqv8aPItSsa9TDo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13402662488646973170
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Nov 2025 14:08:06 +0800
Subject: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1318;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=O0ET+73GNcMNM8GQ0vp3eFlX8NnqDIXFIkI/j57BfWg=;
 b=8TEiAdqEhKkZALZLUbMI/ZvkEHwHrPeyfyMYKZDiS5r2HzeKYowHaOrTl+gWievKRuNoS24WU
 enNBKW94GzLBQtnqIVyyDffebqQOWxnQgKLUPEoazPiHoQkJ6tuWtuP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N5zs7xsto/jUP4dsboR6rAUIRdzYqwB2GNQpqqoFrwWjVjoaBtXlmbxF
	Kz5nSDkZ3Y/yPQF/Ot1erOEYbxxtmgTGCglDPWPy+uEjJSTzc/nvY8Sv1Dzp5kiPz/etE2w
	Tkrjw+CEou1WsVx+HjFWLKyjoGQxnlM29Rm624v0sjHq8hpX39t4H2O7hbA6XiEUuhWwCT9
	WJCNTVhCLcH1pS3iSUUCQ704Vyfs09o2MJkhH/ulfYF3OcX84wAuGaN6lr7UaUfPoFVkxpq
	x2voLnydnuaASHqJMewJN0CBoamWSk7SrAMdUKBvY3oZJtC8Jeo7kk3lYnj/A46rjYigy7G
	0XX4moE1pCWknpNRefLOhC7xWLICKRocvvsAMIFCbUwqREJMGNlMz/TOw+hLp4PQ1bEuMj+
	JlCfRTQ4Q6Gue6jxUqBxFY9WQuYSjNmkaxu3ngM7Eimp5Nx+XgqXC50s13l+SjoUSNbfQg9
	RksVgLdsYMedYdi7IxLICTbxTgtVGeAymJl2NB2C5xB//v0Fe/D14iJEkXtaXoMNE9aEc4h
	9ep/7vzn1N4BzCnopFccmAXCxvSO34OZeYK0jrJeGhHi5kHlSdyLfz1+f1cBg5YxGhOsbdJ
	hXQJzYE6/FdysD7x9PE7SfQNfNZAqsczokjuWoVo3zELaqiU6SR3kzVBzws8IgG7gmbMybs
	2Xjbu2Vbp6WhNEjKrrmKygLFAI/tBAzkP6/xFwk4Got/9BILYhu3tKMC3NyJ3jZNaccoWK4
	k0kGhx2W5Rb53bfqU8m7U6bq+hytTsp56aP/FMCmRfYRcytJ64i8zsYwcvihH6I5brfMybM
	dkLGMQ6KzdK5xBE+ODngl73hDNjpuJ7wGDju+2s77UxBBK4ItRaM3PU6K/Etdq/nKmvvrxp
	tjBPuYJ33xCvjAyIvB6fN5iNKZbkWFeOwlF+RKdu/ykN6cCNY/q5yRrusIhCJWsAPsRwsUA
	uf0et/7S1VBbM9q7/xtU3feg8SZdxW04rW+R67T/iVQ7uBeD+KAS/nD/L1TsNxYrEM5q50B
	D+660c+Mg2J3TbViVWoY7z7C82getAfIbXF50Wph02JJYDEql9liteVqq6obXwPpCcAUAOj
	qaYg3G7weydRXGMEUDg/LxOT44LXiL0BqdqLNfKOC5ThEZhLvDm0IXYksRSKNpOx1S1oP8m
	5MgDKKT4t/u+AGI=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
---
 drivers/rtc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
 config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default MFD_SPACEMIT_P1
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.
 	  This driver can also be built as a module, which will be called

-- 
2.51.2


