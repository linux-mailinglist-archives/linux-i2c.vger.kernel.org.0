Return-Path: <linux-i2c+bounces-7138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD798BB87
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49501F22D7F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB491C1AD0;
	Tue,  1 Oct 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BHPv6mCD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AC1C175B;
	Tue,  1 Oct 2024 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783649; cv=none; b=ufb+JWBbCT7evUbhRAVsyO+m3iCuyBh6okFIHPl7MgqoIzPjrjHro2lPCf6mlWfTKZ+uCZIduktiWu1lhc3u4RqSH9980RXynPpUSinRNK72n+GDQwVk7sbkJFbpckbl+Ri62mUz55P1YbBC9i2BNkcVojoZtcj73VGsC6H+HIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783649; c=relaxed/simple;
	bh=Zcv7ttPwfFhGhA+5dLd2uYe/lbu71RchUbuPbN9JhRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l0nJYa7kfUmkdDb5tXZAe8irGg3wmcYUnP3CIDGPO6SibplZAmE9tf9CiokylTqd7vO96W+FpSf78gex/5cbeuXt7sQJdt++htzgpTBs0iBiajx+/hqUsDaXX+IGkpm0v16grONjQ1BwuBAuO3pTKZrBEQIxGNprVCb4F2mGAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BHPv6mCD; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31FBC40004;
	Tue,  1 Oct 2024 11:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727783645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GD5sEKYHOnEu1KYfmym+jh94W6cUhKdsnrSBS+o4Xz4=;
	b=BHPv6mCDhcPP9np9WnsdcQEYeX5M3fkmjWvH9xHxa/itcb6Kw3Ha8C92GGDB/AmwnScCjd
	lHahYEme4j6OPH36txXoFA9XkESkl2+OJO23JnPK/6bbuSlfYxj5onv+LC7nBhfkjhx6aR
	ujiuV6jX6qsUV1DkekQi0Ar5fjmeT6IS24cBhRHMIK5mVoEBX1BX4+NbYQOjkfhNyRCEdr
	90MgoAE+PUum+JHC07dZc9ZbJLdsL8ls8WQHneP085fw12T46IoZIaqKdBurgJ/V3JBFoO
	3PgQl31QyJc9Ei3ZTIgp5rZgrmzPwlZqyDIHgtsjx3OkROqnAU3An4uCJCsQFA==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v3 0/5] Congatec Board Controller drivers
Date: Tue, 01 Oct 2024 13:53:26 +0200
Message-Id: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbi+2YC/42OOw7DIBBErxJRhwjwV6lyjygFrNc2kg3RglAiy
 3cPuEvn8u1o38zGApLFwO6XjREmG6x3GarrhcGs3YTcDpmZEqoWjag4eDfpiMCN1zQUjOSXBYn
 3ClrT1zDUqFn+NzogN6QdzMWw6hCRSvAmHO3nKH2+Ms82RE/fY0OS5XqmLkku+IjQqKpVncDuY
 byPi3U38Csr3qROu1R2tb1spNRCQj/+u/Z9/wHB4N6DKQEAAA==
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

This is the third iteration of the Congatec Board Controller series.

There are only few changes for the GPIO driver (commit message, Kconfig,
remove useless cast). 
I also rebased the series on Linux v6.12-rc1.

Best Regards,

Thomas

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v3:
- Rebased on Linux v6.12-rc1.
- gpio: improve commit message.
- gpio: in Kconfig move driver definition in the MFD GPIO drivers submenu.
- gpio: remove useless cast.
- gpio: take Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
- i2c: take Acked-by: Andi Shyti <andi.shyti@kernel.org> 
- watchdog: take Acked-by: Guenter Roeck <linux@roeck-us.net> 
- Link to v2: https://lore.kernel.org/r/20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com

Changes in v2:
- mfd: use platform_device_register_simple(), so struct cgbc_platform_data
  and cgbc_create_platform_device() were removed.
- mfd: rename cgbc_detect_device() to cgbc_wait_device().
- mfd: remove the useless abstracted function cgbc_command().
- mfd: set the release session message as warning instead of error.
- mfd: minor fixes (sort includes, add comments, fix some alignments and
  nit ...).
- gpio: use scoped_guard() and guard().
- gpio: use devm_mutex_init().
- i2c: unset the I2C_FUNC_SMBUS_QUICK flag as smbus quick accesses are not
  supported by the controller.
- i2c: rephrase comment for read_maxtime_us.
- i2c: set the invalid frequency message as an info (previously a warning).
- i2c: other minor fixes (sort includes, fix name of i2c_state enum).
- watchdog: add missing includes.
- watchdog: remove warning for the pretimeout.
- watchdog: remove timeout_action and pretimeout_action (ACTION_RESET and
  ACTION_SMI are directly used in cgbc_wdt_start()).
- watchdog: set max_timeout and min_timeout.
- watchdog: use watchdog_init_timeout() to set the timeout.
- Link to v1: https://lore.kernel.org/r/20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com

---
Thomas Richard (5):
      mfd: add Congatec Board Controller mfd driver
      gpio: Congatec Board Controller gpio driver
      i2c: Congatec Board Controller i2c bus driver
      watchdog: Congatec Board Controller watchdog timer driver
      MAINTAINERS: Add entry for Congatec Board Controller

 MAINTAINERS                   |   9 +
 drivers/gpio/Kconfig          |  10 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-cgbc.c      | 196 ++++++++++++++++++++
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-cgbc.c | 406 +++++++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig           |  12 ++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/cgbc-core.c       | 411 ++++++++++++++++++++++++++++++++++++++++++
 drivers/watchdog/Kconfig      |  10 +
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/cgbc_wdt.c   | 211 ++++++++++++++++++++++
 include/linux/mfd/cgbc.h      |  44 +++++
 14 files changed, 1323 insertions(+)
---
base-commit: 81178bc5d0ffdf50522adabda7a66093a56149ce
change-id: 20240503-congatec-board-controller-82c6b84cd4ea

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


