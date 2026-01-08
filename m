Return-Path: <linux-i2c+bounces-14996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 293F3D01BCF
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 10:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB9AA3081120
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 09:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E133534A777;
	Thu,  8 Jan 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="agvxpCnV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF17434677D
	for <linux-i2c@vger.kernel.org>; Thu,  8 Jan 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861641; cv=none; b=SBcdlwAL5VIqCb5pQ6C2uMULelHgKm1puAWyuvx/rmbF/AbobcfU0TN6vv1owWmsB5Ll1iqYsy21QO7Oqtx2HewaYzj0CWN7/mzLsdw1SaB5lF6F3mtAMdPYmyFLChyrCl7XNceC/YQQ6d07mn9JkwO+G8u+8wG8UWq/LmzyaOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861641; c=relaxed/simple;
	bh=f4L/DsZdH7YPl/4hbvzirDWoiAM8dIkuN0CGyCu5Jjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1ZTUakbgTatlDZv5F6FBcr7/aSY1W/tRa1LwaZlKGgptE8Sco27T1Fys6ikYOODRmGSsBUVG52Nz2KKwHfIoUa13OJTC5eooeiovBqXv6Wy+kf5UuCh7d8F4Un/hfcrIRAIj4xbP4irirE5jwdVsu5ELbAA0MptcODwuUpiPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=agvxpCnV; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861554;
	bh=bhWQjwHsWGDy9Epy5b1CqHXWSTOBB+JGPvA87GRf/qw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=agvxpCnVBMZTfRwMlKsOf6IVeiJ8OkS2hDdttSVt/ui9pTkhrneniuXcZvgwi0ihU
	 vpn4y3IaWbpLfWAMzHoca2j2WFkk5ne4WugQvR+OxVQMELU8uG3B/rFdJVnutpczZQ
	 +aZiaVX56wckSDD2klGRjM0Rh1bveCnHCQw5Skrk=
X-QQ-mid: esmtpsz19t1767861545td8db11fa
X-QQ-Originating-IP: QUCW5A6sCbIriSA6aa5p7bzPKIVx7LKFVxD+up/whCw=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:39:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9751466037048988391
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:55 +0800
Subject: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1144;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=f4L/DsZdH7YPl/4hbvzirDWoiAM8dIkuN0CGyCu5Jjk=;
 b=4Nfs4psnPhhVx6f0KZktEPb09B9yA2kw2teQmc5K8ZsYHRWFPUq/hYSe9qt6oJtkrtTVVig7L
 7t7FxHl2PPZDhAsdSncvz9C/JMr/LgrSGngePQSgkyrcR9XskgORs1n
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MybtlqrhkY2z8DflBlPODytjZEC6RGYsqgY/vO2GVVp3eZA/LAyVvKtd
	+DmBO25ynfi8bU/IH34wf8uWkKt+/cC3rCm62BE0Y+qz5rrYKspmTQGxWow2aqLhTIBxZqe
	gRfjQf9DFEuFX8ZkPguBBdatqkMDpPH5ye+BvyRCz7I4575EM40geux/x8BQZr5sC5PiMfy
	KE+FWe+bVfDXZwyk5e0wdKzUQliIOMH0Yh5yDnj0ByuvcIAjGirWg76VZkL3Vqh6H8ImflL
	dKUOwsmvPv7Lz/1qP5lfFQjoErLmFCacu7rhVIq+ZSuytzk++jhAEsnS5tNU0d8osHEA6A/
	zTmxChcwsy5TupIWH5Xx6abJF+H1tL9Tzmcixu8XZRW15XpBGV3K2TVbRaU+hwAr6Ij39GD
	zJ3wWNlii6V3Bfh0gc2oLnrS7D7vdc72gpAqaIXG8/dMkSHtLwYHMDob0bf9NuwjgTtjXM3
	xz2PuzfUjQoxEDP6z5gvCga0frIThYq4vtegfupnSQbeprAPHUV81mYobWfR5lw9PgHAEXu
	KFftVkfdUQcmckWBNJBUrGi/9ywVuFAbHKZwUlovfE2Rgn/zyxwqO6CpZhb+UgNWX+8Uh9e
	BRjcAj6T3yMZdbKRFveoE3Cyg9rYQ4j7V7UeqIfmur3SXBbb4xPVzdyNZlcblacUmlPTFp1
	ozuoV0hGJ7qtdegNy7GkMqcN4w4ccgVwdHqtcXlO5s5htsRNJ6f+EJq/BNJ0A4VlEQVY7oF
	6uicXFdL4ztArcz7rfonDb+RTa8EU+hHkY9mTTlHoP5LRyB7vhUxKbAhVfx3qSMmwdJhzn0
	69fdkO7hnAAy7VLa6lCjYikWceB6LgK6CLg07od9vIjW1iAzAUeP2yGrk1dMwYsA9piVoKr
	OvqBQiq++azyHDocPnNUAL/FycP1yTLnVEMJVxCz5ceT1ZIbTnBmRnhlA8B7m+cZjGt1apP
	CWq8VQB/N0k+6g565PUO2Ofoj+4ZHx+q2iPibOEf25LRcm7ywkyrqAr59XT3PBuzobilCwZ
	QF5DZKlaJ1Cw6KJfCFLOD95EhEtleMvQAfCTynYzLw2YSL9QSCyzkzHyexAKaNhgA2rDz3n
	aFLAW7VM8zxGydrFQ4rYHxozMVScP9J9A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The default value of the P1 sub-device depends on the value
of P1, so P1 should have a default value here.

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v5:
- nothing
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com/

Change log in v4:
- default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
- Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com/
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5b10084a0f29ac9b6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on I2C
 	select MFD_SIMPLE_MFD_I2C
+	default m if ARCH_SPACEMIT
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which
 	  contains regulators, a power switch, GPIOs, an RTC, and more.

-- 
2.52.0


