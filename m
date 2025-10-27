Return-Path: <linux-i2c+bounces-13821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 554A1C0BDAD
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA985189CE3C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 05:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9A2258EF3;
	Mon, 27 Oct 2025 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Fwo3grvu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BA82D592C;
	Mon, 27 Oct 2025 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544113; cv=none; b=KRym08vdn6USgjybkc3q0rK3wL8M4eTr78sw/Lp+kwHgO+9Wl9lP8WYnpwv3la1Nsnmsw2NG7xaoneHGi8NDW8sumeVUbnXt0+z6NBAov5W1AT/HOjflE0UDIyFMl1QAol8r+UEfzbb3Bw8JE4dzjekTQJ8wY/uwHPvchRDbQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544113; c=relaxed/simple;
	bh=haUTX3DAFG/sDExwxhYrFG+MpFnxNHgK9T898K4DEpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEuyseL60fYV4KzwLL4bCFAHoTkIq169EynAb3JebYTwmhEd+uVltnmydCol0qMbzCQDX8mJ3EqgX9oQfATozjYxWd1EUTwjeW5u2QoY84IjPCqgeIr9JFpJTPyZQ2A/fXqxv3G2KzoTiD0HaY9W8h14bXAYxUpOwhqrrTSAUpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Fwo3grvu; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544101;
	bh=VUROzD2Px2X01kMjDouTVlJB/FxOGL4kiYbsA/z/bxo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Fwo3grvuT98lNSPL1MzzBjJNFG3IlTCFtgMUstEAnCCgu3ZblMJWIgv7u+BS9aHI8
	 qZNpkFcTNgt4o6oQrvsC6pNizDjdPR5EJxKrJ1/ChD6JPNr9ITrq+dzXKiSATSvW41
	 MVz1ovbXAW107qV+IROk3whL0E5w+wqWEqW108XU=
X-QQ-mid: zesmtpsz7t1761544095t7e2c79e6
X-QQ-Originating-IP: 2YYRSz8nfBT+0rkbxFwdGXPE9OU+8C/eh6y1Zk5miKU=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11408485327618603896
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:05 +0800
Subject: [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1235;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=haUTX3DAFG/sDExwxhYrFG+MpFnxNHgK9T898K4DEpw=;
 b=axT647NiGxsuB2r629BN37g+E++QCuCRTuuShun9jkeP1mUdrBRCaBuTuSlqcsYYlzjRaqazp
 X2VApOdw7riBC6daxcAt+BqIAk9j2LxxfeYInibW477iQkz438YsLYB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McfvTdNTSvcBdWfTJmkuzW/dW/aFrCrBB5EOnpEFm9AS1GzrZCkbkeNr
	+HlvbyHztmSYMWFhRGgT8hjKbYBBXsY/+oU8WO9hLa5WFz4PjKKBT8DFZ26gcfEXAtUb8Sb
	c14dM6riHjhnRBU1BoyMd93WwUgDftnVe0vRMBotbM9NgwnnWcSfHWZuQJoBO6zCv5Yni59
	xdXIzh5dVTgReygyexLEP+XHfc25Z9Od4H4PzooAHNt2Yj9zM1/i1iLxF3EWVpNkHMtQOZ4
	mBsrKG8v7NENEXN7wmTRyHocIKl432zmryPJ1xl4Qg9puvbI/1mNhMWKjvb1+l/gJDLrjcN
	ni94rLWSVAD9GfZIhsQ8y2ArZsIsM92J9JeWmWiCTg1FG8uWBYHvhIrNHJ4J+ad5sOs++f/
	3JAaJVvTh4RXW6pGhQo/Em+dmiXdIF6Y+IZy118/g6v8H0hfTB+h8ZWS4ulnLQYn/Ofiq/Z
	m/Dj0Yavz0+LKm0imfovTAmHpxzkNwUBRLKN9suVJZWz1jOJytvF72k+m2M+7vp0i7cDtUV
	Cwlhx/r2XB7SGxHKh0Hr9jelJICZEd+kf218KCsk8zClIO8w0cAMeOGTsqdpptGtlpAY6Ye
	+KdWqidnX3/DrGlneVX4L6f5or5OPQvnx/P3//mJTh82jNnI/taeOpjWz/bKi9QTEbQXzvo
	oUr3crl7wwkXaYjMp1zNUgYC7WsrXvheelObymhjEIaEzFtwI9l8jgwoFrrTzIDgESncw7D
	g9fm3iVahEkvOhYpITvzmR6F819Zrkz5YlQV7kPJLbCMCNZJ/PXzHZ0V/bpPzuXt7WeNC8J
	6IvIs+ruzWPieu9lGH93IvJgm/Y/nBygKCCk8JOIz0ITkaCvFN5vJyLmqIt2W8NUm1QavNf
	Bo9N9x0LnMRmKoiCu6RuQLwcGUzSvlPC1xcFj+1qIFvcIAZg9Y12O9HmwDoUSkZlyzIbjID
	Gi17MHViNMB6QmnIxZGRY1hjIDeoBTsMNT+W3WuFjp+t2ZKvW6ehzBWrSVAl7GZ8CG76KEz
	wHy8rGC590VzbrYid72fOGpcpO9ETxFp66KgkPP3hgxo382ksf16Buv4h9n4kzEMJVzI6ad
	8nIWp/UT2hI0mwD1OQh5z25bbYk6L1/evwu7QMoNPa7dZkaDcfHj4o1uH06aNw7QKJ3b2mj
	DdDZ
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

select will force a symbol to a specific value without considering
its dependencies. As a result, the i2c-k1 driver will fail to build
when OF or COMMON_CLK are disabled.

The reason for removing I2C_K1 instead of adding a depends on condition
is to keep the possibility for other SoCs to use this PMIC.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- nothing
Link to v1: https://lore.kernel.org/all/20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com/
---
 drivers/mfd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..ea367c7e97f116d7585411fff5ba6bcd36882524 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1258,7 +1258,6 @@ config MFD_SPACEMIT_P1
 	tristate "SpacemiT P1 PMIC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on I2C
-	select I2C_K1
 	select MFD_SIMPLE_MFD_I2C
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which

-- 
2.51.1


