Return-Path: <linux-i2c+bounces-14997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B2D01BD2
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 10:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 217FC304156E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 09:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B61342C80;
	Thu,  8 Jan 2026 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tITwDeur"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2A348867
	for <linux-i2c@vger.kernel.org>; Thu,  8 Jan 2026 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861648; cv=none; b=kdNpGpPUIM5Zf169hACSHkgF9TiRgSFUD6HZOpp3G8GEAjF7ke4I648Ev+GFG2izp+76mHpBO0Q1Uwm/dY74cbXTtFecRrBm6XXfJliaHY7dPvpjV6NxA83oUhOHFrT81j0fRaaWSADvz2fcejkqHwYzp3Bf9yqfmFKFBFkqN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861648; c=relaxed/simple;
	bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nHG5Nu1fq93qDl9xrG0xQkWni7JzZ6g3fApMNzYljLn4eQ8POK2648+2tPnP9boeNFCFFoqIBpH6nUu0oKixMLSovjb+jllKkpjoPv52XiJro4wVETn7WgesfQJIbL/DWzRN3fOBTBkbw7KeEhUyFehMwGKLyL9F5ek8IQvCcSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tITwDeur; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861546;
	bh=oXpcYu7/BiXLtInxfeyZ/crAJL6uNMHTLPJTzMs80uI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=tITwDeureI+LxTlBjBT67yMOOG0Wiz/AXkwwMvKLgHiImBjDPJjfprNjQO9XmtqYY
	 0FlON2tEKv9Ap9MwkzWSreV7FbsG2Y1LfK0mz4XSN3TgImSOeSytf1qudh+qIb5JoA
	 teqt2On4rIb2UjYy2vncIDnEByRa5BnDK/RFEbGs=
X-QQ-mid: esmtpsz16t1767861537taf7cee1c
X-QQ-Originating-IP: rdQrMLWx957NdWeuu2zefdcqwwSrn5/h1cgo2IbQ/aU=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:38:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8314994872385934692
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/3] spacemit: fix P1 sub-device Kconfig defaults and
 dependencies
Date: Thu, 08 Jan 2026 16:38:53 +0800
Message-Id: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1tX2kC/3XO3YrCMBCG4VuRHDuSmSRtukd7H4sHzU91WG1L4
 xZFeu+mgih2PXw/mIe5ihQHjkl8ra5iiCMn7tocZr0Sfl+3uwgccguSZFASQo/w67u24R00fIY
 ikDNVkMrZRuSjfoh5voM/29x7TqduuNz9Eef1QdE7NSIgeNQUDEZ00n4fuP07b1Jf+3jk08Z3R
 zGbI7065cIhkKCrwtpGSVfHz456Ooh24ajsWKsqb2pvglMfHf10iMzC0fM/2hUlWcTS47/ONE0
 31tGXFo0BAAA=
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=720;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
 b=RLp6iu8x/w5+nOe4WWHQNaTOD5AC2s2LIosBXD/a6Yz1hezUBXGiId9ylmi7ViesR1b25DVvy
 +EkeP6Oe0D3CAZp5T6EiHELbz1ymNvZWTJCOaj6YdVKqutjRhJaKPMe
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MFZ4ckqpJfd134x/d9AXmdSf7ytPmfmnu2AZiXbbxyKsirNEfz9Bi7ui
	5jCYow/Y//M8hNBLR5T+4xtbSju7RpuLbo8OXxP7U2cKI4AenDfOV0HMZfORpaLIu5KdGxl
	apMVp1Uf4SBFvTJcakLBtPDKCjr+UvFNvpwPN3hBOPeUqtrdH542toQ5i6BFxOMSxAgM0Eh
	2OAsmguN5lA5xJzzRB1lMUmOrlU/FjYXYRSPp/marXRkN6coPCZxCac1kCfEdEMtl4Z+A6w
	8JrYR9lPm/e3YTOUC36NnFHONOgV0+mQtZZ1U9Um6QJDppd8SvU/qquOJjT/vl78TVKGVxO
	bsZAqBo7LyyJBpOYYhBKsYhsU8S7cQPkYjwN+7lJllBXOkoUI8DGM4ujqE3MQNo9OyxUF/o
	bmmSZS7NWMRh0VmhY8yN6BICe/+r2u0hK7wsfqJHbIbxBJGZc+iNZ8Bngi//KM8sdZnHQbD
	njm9WW1hq4nTD+RL2ZwpsDKRBHSXvHqejrxPMMoT6qsJGKEW5Pm7cQ+fmMxYawTq+CuDv2N
	w4S6LazIcWnx4JAZHi5ec8mb54hgB0nU7+sxDZZ2PKdZHFEyc/xkAQyAL55P8lgyBmuk7KZ
	gC2xxldnHYVkvDeTIf6HVBp9wHr0m3AbhvlmH86Fboo6tJv2OVVMaIafF9zbXHhhmOfQmXw
	45ECxv+bIkIzMlAqGe5k4nLq+SaBS23zHZ7r2j80u5KHXBAz+/ykQp6p8xv8YVW6CXX4Qnk
	nOMY2vPMzv85U5FM9DARis42tipKmyXl7guskOl2psatWd68xd6TVs6jhsXheiDtLgbnCN3
	R6J83d4TWGMrfFeEwpqhtFSGk/CDAm1jIeyXn9y88B6dWauDLpoc1nUdGZJ26AP/SM+uDyo
	ER2DFSUAhch5GNBuvvb02VaEocknSFVl3iJOH+blNLAUAub5JjBbHystbW/TdneY96T30Zw
	Jcp6xZRECCYWw26RYRtPzXKerA6IeHN/gjWv9hT8dzr87Yyw+rYICsgP+cMBMr+yUZlXIgl
	Rpc2DdSyjekxycjJcFRn6c+z3NHNWWM9iB5LFb/Tv2GnpT7STx63bH2ScOgEtzcVN6APlWP
	w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

This series fixes Kconfig default value and dependency handling for
the SpacemiT P1 PMIC and its sub-devices.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
      mfd: simple-mfd-i2c: add default value
      rtc: spacemit: default module when MFD_SPACEMIT_P1 is enabled

 drivers/mfd/Kconfig       | 1 +
 drivers/regulator/Kconfig | 5 ++---
 drivers/rtc/Kconfig       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: b87881a3c93345252ce8559ad763369febfdb75d
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


