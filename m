Return-Path: <linux-i2c+bounces-12634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E147EB43EE9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBEE1A01F88
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973E731281B;
	Thu,  4 Sep 2025 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fbcixLT9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8630C365;
	Thu,  4 Sep 2025 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996295; cv=none; b=tgNC2RhVVhdcZ35mXCHybZ/5AtpU5bk1qCRXlka2bpC0MbM6wFGlCNl90meo5mnrqj6SuAPw/CsNbKHGggPdCaek7rImXq17eblaHYU8S91YGIJeNiJtqFqU6e35VX6eFRalW4BZ2QQf9I2Wzvbolrl1rsfTlbLC/sFGvpYeg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996295; c=relaxed/simple;
	bh=dOdFtNtBtOf1Wc96Du+7T28QotRVEZSJV8qeRosyf8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EmU7DZ7Sd7s31eLMdR5++fB6bdMICBOn3jiVXgmBBCus80tLqpP5OWyscLaZxe7uc1P3NcKtSmXII+CPP1rCsIKvg6Yj0rarsdxC6yekqGSyG3dpoZK/nx1m33T+qp3ZfcPNzD6luZ262lOJO1QtBQffrLg1u8kWbvOPMBgzcOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fbcixLT9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 148B74E40C5F;
	Thu,  4 Sep 2025 14:31:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C302A606BB;
	Thu,  4 Sep 2025 14:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CC061C22DA8F;
	Thu,  4 Sep 2025 16:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756996288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WJjahgs9VV1dXHn5uE/SjoSyQSG7AJoRvnT0vRY+Ejc=;
	b=fbcixLT9vSvO3EdCPMn0S+amfUkIUncwaByIAMHRP0b6dp1DR5TP6eO7UFirFBG6KL8dlp
	iarxiKLBs7pVRbp4s35ZFLUl3T1IVSzBnVY/qhpQNSRC9GJd5USJIOf5FqGg+rk+8Sf1Lk
	1D+gHsJvcT+fD/Vhp2wXCOjpmeGYhThhQb0wZQhZprxYrU1W+2I/i4dk5S2ZLUkR+kaJhA
	0XLpHTxJ6fQXHldZHKfUD1aW9FzUH0DxKjyhzggskgGtPvY6jTMLmfSumFuQ0T+32FV7H/
	OKJYm4FcnKPKbcw4X91g4TaxbSvjcEpkiKoB270ApjvmooEfxAf4C7uiiS3tUg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 0/2] Add dev_err_probe() to i2c designware platform
 probing
Date: Thu, 04 Sep 2025 16:31:05 +0200
Message-Id: <20250904-i2c-dw-dev-err-probe-v2-0-e59da34815fa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKmiuWgC/22NQQ6CMBBFr0Jm7Rg6olFX3sOwKNOpTKKUtKRqC
 He34tble8l/f4YkUSXBuZohStakYShAmwq4t8NNUF1hoJr29ZEIlRjdE51klBhxjKETFOtPHct
 OfMNQpmMUr681e20L95qmEN/rSzZf+wue6uZ/MBs0aJntwXtniOTShTDdddhyeEC7LMsHxcj4w
 roAAAA=
X-Change-ID: 20250822-i2c-dw-dev-err-probe-eaf9bce3ef4c
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

I recently spend some time debugging a case where the i2c controller
never showed up. In the end it was caused by a missing reset controller
due to a typo in the device tree.

While this has nothing to do with the i2c designware driver, not having
any hint about why the device stays in deferred probe state does not
help.

The first patch convert dev_err() to dev_err_probe() on request IRQ
failure, this simplifies error handling.

The second patch add dev_err_probe() in the error paths that can return
-EPROBE_DEFER in dw_i2c_plat_probe() to aid in debugging deferred probe
errors.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v2:
- Split the patch in two: one to convert dev_err() to dev_err_probe()
  on request IRQ failure and the other adding dev_err_probe() to error
  paths in dw_i2c_plat_probe()
- Link to v1: https://lore.kernel.org/r/20250904-i2c-dw-dev-err-probe-v1-1-acca6ffd122e@bootlin.com

---
Benoît Monin (2):
      i2c: designware: convert to dev_err_probe() on request IRQ error
      i2c: designware: use dev_err_probe() when probing platform device

 drivers/i2c/busses/i2c-designware-master.c  |  9 ++++-----
 drivers/i2c/busses/i2c-designware-platdrv.c | 10 ++++++----
 drivers/i2c/busses/i2c-designware-slave.c   |  9 ++++-----
 3 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250822-i2c-dw-dev-err-probe-eaf9bce3ef4c

Best regards,
-- 
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


