Return-Path: <linux-i2c+bounces-9099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CBCA11D98
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 10:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD3416127B
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 09:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8502309A1;
	Wed, 15 Jan 2025 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ex2Upw8C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9860248193;
	Wed, 15 Jan 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736933170; cv=none; b=jkV6B8OOruw8aVBeqUKu7Yrypt3+62hgYjwlnJoxOhiXXHRSZjo/JdZaA8XHx/ydogKTEY9LN7sqGQU81bI+BIfJ/iuQDIIFwSFQiRwMZAXwT5Zcuml2ai3iCHS5ShQDHcuGJecMj3h63UZche9K4TCGL7r8kr0BE/c7qGi2vpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736933170; c=relaxed/simple;
	bh=HMdNi8xEEoDx9a7DMjJFYKL0XAvv0JM24seyGYmW5fU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K/VDO44PLbS/FmEjLU2azeJYLVCvwgY/Lwfo+nBRba88/128MHBqtowWivZCNOpYXbCqVRktcD1xlGFfmCHFYLq1ba+Ulk9PJvxbBnvpAWVbTNKVS1qSRa45HHIuzMA6CDmfDhDpb5i6OmaWnhp/XvXjrjeQHNIGPQM4EyM/CkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ex2Upw8C; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D320DFF812;
	Wed, 15 Jan 2025 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736933163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J7yij69aWCQUXlQKvIa+M3cJt5WrSqaQdzjFiTdDm4k=;
	b=ex2Upw8CYe5xc1rm9AAnfR7Cyo3Pvsto4i2Fmbwfk5KT7iogQI1BjbvKkS/XbsaRacpXyA
	IuU2Z+Wdnm2w/Z/fLbKViA70Cy1YhmiFFuGBO/dDT8a1cR15yfuNXnSVI6ulNRIOO8Ol4p
	OFpTmMT3lFtU2+HLOgLBXiH15qyEKDlOuTGKg+24g3f5NUGMNL5tdCUzhtmKUz+EDVZJut
	Kj3hg/vmBI7W1C8o7becnwoTZix7AeqEDQRg0/Q/KO+gW7cL64+ZbSRpk2l9jwiw8da8Bw
	XUbBwsAUAb2Oq8o5XTbkXASZA3tWs4klgKzgztKqz1dttMr5eO12qz146+BgUA==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v6 0/9] misc: Support TI FPC202 dual-port controller
Date: Wed, 15 Jan 2025 10:25:37 +0100
Message-Id: <20250115-fpc202-v6-0-d47a34820753@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJ/h2cC/2XPQW7DIBAF0KtErEsFwwCernqPqgvA0CC1JrIjq
 1Xku3ecKokr7+Yj3me4iCmPNU/i5XARY57rVNvAwT0dRDqG4SPL2nMWoAC10l6WU+JZuqKiN8S
 z7wRfPo251O9r0ds752Odzm38ufbOej39q9Cqu1XMWipZMkJy1MVE8BpbO3/W4Tm1L7GWzLCB+
 gGBoUfMWDRBgH4PzQaCvUPD0GDuXEzRRuv2EB8QjLpDXF90OgL5ntf1e2hv0KrtHy3DgIZCJKL
 ehv9wWZZfGtNJy4IBAAA=
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
 Romain Gantois <romain.gantois@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version six of my series which adds support for the TI FPC202
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
Changes in v6:
- Replaced spaces with tabs in misc Makefile
- Link to v5: https://lore.kernel.org/r/20250108-fpc202-v5-0-a439ab999d5a@bootlin.com

Changes in v5:
- Used mutex guards in ub960 and fpc202 drivers
- Changed wording of some i2c-atr logs
- Link to v4: https://lore.kernel.org/r/20241230-fpc202-v4-0-761b297dc697@bootlin.com

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
 drivers/media/i2c/ds90ub960.c                      |  49 ++-
 drivers/misc/Kconfig                               |  11 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ti_fpc202.c                           | 440 +++++++++++++++++++
 include/linux/i2c-atr.h                            |  54 ++-
 10 files changed, 966 insertions(+), 191 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241017-fpc202-6f0b739c2078

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


