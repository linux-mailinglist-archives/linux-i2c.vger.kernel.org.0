Return-Path: <linux-i2c+bounces-8827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9D9FE638
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 14:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C77B161244
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 13:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150B31A9B2D;
	Mon, 30 Dec 2024 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="piQ7o6Yt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FD1A4F2B;
	Mon, 30 Dec 2024 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735564948; cv=none; b=RITBklVWP9PDBM3xJVcA+hcODwuUe7ONtKkvtpcbgCMGUT/BLFrmmHjxo+o0p6hU0csoCmpYwdQE9TtcOMfvKEae83rXQQnTzXBL3QyyFkOGgKcKwqW6Qe4hJVs1I4TAWSGmNyNrq14Zk8j6VaPZvR4jW02M/LCTXnQkpUJ+0Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735564948; c=relaxed/simple;
	bh=7MDc6sTNZzm6IDEBuB5yuwSOIb+gYHt54ivudUIGfk4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ptg5isyOnI9E+SvjIeEP1uiYzk/chaqzu6nGAERdULe0xbHin8zN/uI00VeLy0DBFainWfJCDBYuYycuMv3H9ePrFk6oyfoyZCuTwf5w5FmuGSB4EcxKg5GWF8LcrexAWUTmp4OuWu2gYlSBcpEd9Grt/jfYndmsOF/HFQ9Jhg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=piQ7o6Yt; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06B2240009;
	Mon, 30 Dec 2024 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735564937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iNojBKg1C3ADFBNi40Dz7RM5uNZWDbuFFrwSiTyt55E=;
	b=piQ7o6Ytu5rZ8XyG1wYJe3LpUEQRZM+8zNKlHd4z/nUUyERHZYw840FF1uQP7GF/JiaTDH
	x/cAtpskHNVTpRSKdr26Og9qUZqtkJITtdyiTqaiMGbkzZ2b3Kfigg0JfEHqNkqXn2aTPV
	sOzrodpaJ/EOh4yEwDmlOqFglsNEz1CAO0PAZHzTcxC89iDd1d/ZYycQOTHb74XZdTZNgD
	RiEUXyHNTkCboBrGSMSpqHm6Bxa80LD4DxwEAhuup6sVa59IjK6xxbOrMlsPIGsEQt4s0I
	1VTGiocRiqkBjLkenOCHmmuPW5D+CY5wdBlqFWn+f3yZS5oVeORUKTdPKoj0jg==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v4 0/9] misc: Support TI FPC202 dual-port controller
Date: Mon, 30 Dec 2024 14:22:02 +0100
Message-Id: <20241230-fpc202-v4-0-761b297dc697@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHuecmcC/2XM0Q6CIBiG4VtxHEeDHwTsqPtoHQhCspU4cK7mv
 PfQVtk6+z/G804o2ehtQodiQtGOPvnQ5cF3BTJt3V0s9k3eCAhwSqjErjf5xsIRLVmVb6lQ/tx
 H6/x9DZ3Oebc+DSE+1u5Il9dXghL1TowUE+wsByMqpU0FRx3CcPXd3oQbWiIjbCD9QshQcm65o
 xXU0PxDtoFQfiDLkHGrhDa61KX4hfM8PwHy9KqMEAEAAA==
X-Change-ID: 20241017-fpc202-6f0b739c2078
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version four of my series which adds support for the TI FPC202
dual-port controller. This is an unusual kind of device which is used as a
low-speed signal aggregator for various types of SFP-like hardware ports.

The FPC202 exposes an I2C, or SPI (not supported in this series) control
interface, which can be used to access two downstream I2C busses, along
with a set of low-speed GPIO signals for each port. It also has I2C address
translation (ATR) features, which allow multiple I2C devices with the same
address (e.g. SFP EEPROMs at address 0x50) to be accessed from the upstream
control interface on different addresses.

I've chosen to add this driver to the misc subsystem, as it doesn't
strictly belong in either the i2c or gpio sybsystem, and as far as I know
it is the first device of its kind to be added to the kernel.

Along with the FPC202 driver itself, this series also adds support for
dynamic address translation to the i2c-atr module. This allows I2C address
translators to update their translation table on-the-fly when they receive
transactions to unmapped clients. This feature is needed by the FPC202
driver to access up to three logical I2C devices per-port, given that the
FPC202 address translation table only has two address slots.

Best Regards,

Romain

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
Changes in v4:
- Fixed unbalanced refcounting in FPC202 port probing path
- Fixed KASAN bug by setting alias_pool "shared" flag properly
- Dropped requirement for both FPC202 ports to be described in the DT
- Enabled dynamic translation by default, dropped support for non dynamic translation
- Used aliased_addrs list instead of insufficient bitmap in ub960 driver
- Added i2c_atr_destroy_c2a() function matching i2c_atr_create_c2a()
- Fixed list corruption bug in dynamic address translation
- Indented Kconfig entry with tabs instead of spaces
- Link to v3: https://lore.kernel.org/r/20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com

Changes in v3:
- Described the "reg" property of downstream ports in the FPC202 bindings
- Link to v2: https://lore.kernel.org/r/20241118-fpc202-v2-0-744e4f192a2d@bootlin.com

Changes in v2:
- Renamed port nodes to match i2c adapter bindings.
- Declared atr ops struct as static const.
- Free downstream ports during FPC202 removal.
- Link to v1: https://lore.kernel.org/r/20241108-fpc202-v1-0-fe42c698bc92@bootlin.com

---
Romain Gantois (9):
      dt-bindings: misc: Describe TI FPC202 dual port controller
      media: i2c: ds90ub960: Replace aliased clients list with address list
      media: i2c: ds90ub960: Protect alias_use_mask with a mutex
      i2c: use client addresses directly in ATR interface
      i2c: move ATR alias pool to a separate struct
      i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
      i2c: support per-channel ATR alias pools
      i2c: Support dynamic address translation
      misc: add FPC202 dual port controller driver

 .../devicetree/bindings/misc/ti,fpc202.yaml        |  94 ++++
 MAINTAINERS                                        |   7 +
 drivers/i2c/i2c-atr.c                              | 483 ++++++++++++++-------
 drivers/media/i2c/ds90ub913.c                      |   9 +-
 drivers/media/i2c/ds90ub953.c                      |   9 +-
 drivers/media/i2c/ds90ub960.c                      |  61 ++-
 drivers/misc/Kconfig                               |  11 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ti_fpc202.c                           | 441 +++++++++++++++++++
 include/linux/i2c-atr.h                            |  54 ++-
 10 files changed, 976 insertions(+), 194 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241017-fpc202-6f0b739c2078

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


