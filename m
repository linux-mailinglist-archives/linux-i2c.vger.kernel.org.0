Return-Path: <linux-i2c+bounces-8973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AEA06143
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 17:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40C731888FDF
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 16:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237221FF1AF;
	Wed,  8 Jan 2025 16:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FDjsaZgj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB5315B99E;
	Wed,  8 Jan 2025 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352860; cv=none; b=avT4QWfkpySOQUF2JhuZDkdV94vloeljJMYKs4EE1OscLTZCeb6gD4k0+NhGbtykhOYruP+w9sOR98f97iiHTRTKvweVluS1O2dMZStK5HC/LELyZHRelS0BUZWg4NRYNPY8YhTeFGlTi1MpI9k8DYQD1TjhLL7QbOAaga9ZYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352860; c=relaxed/simple;
	bh=OimlhYfhEvYezHgnmUneJlEN0kOFMln6m5Z0HQRE+Dc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gccv5o+45dhVcVy7LUcc/ndwkG7mu2MrB5xuuqvPJX948wzjnHxEpjucvwXFRLHX2WYvZ/gOCHk49J8n0UCdIRzoMSNhGf035gnFH77ioxJNUdqlFmgvuOA1wN6YBNHOL0RIb9Ig9wCYjixITGmlnbj0zA6gDUQKpBQ7LftycbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FDjsaZgj; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D53C60003;
	Wed,  8 Jan 2025 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736352849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ltOp1lazBa+2SrC05korzws55yt4T6BvhTKZdfJI2y4=;
	b=FDjsaZgjQLvDUX04oLMwtvq7hu83iBQmcxkYMqDAGkChNUZSHi4ZoXDjhgI25SezTCT6bF
	AcAosmBYbMj+W2cbgFWmeqj2wqb8GjlhiQ1TPHx3SCQ77N5hDwCg3vpwKwAOuNMVjGStiX
	WEDjVjbHofi/16iyXX2i+Btea3gVxqCAEM4paNApRrWvYDJ21wE9iAjdARjIN+2xfxeeNI
	3mWOhGvIBn0+frjgRSRg9eV5iZrUR3HywL3INuHFVFaU2BO/EciF/AiFpPqcEccBtB/S9l
	M7mSFjPXygAOQ/gbYedI0WnyL9+P3A8xEwg/XgCsXTOQwqCQiV/tbr3xhBh7qA==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v5 0/9] misc: Support TI FPC202 dual-port controller
Date: Wed, 08 Jan 2025 17:14:01 +0100
Message-Id: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqkfmcC/2XO0Q6CIBQG4FdpXEeDA4J01Xu0LgQh2UqaNldzv
 ntHW2rz7vxnfP+hJ61vom/JcdeTxnexjanGkO13xFVFffU0lpgJMJCccU3Dw+FMVWBWC4Ozzgk
 +fjQ+xNdUdL5grmL7TM176u34uP1WcJb/KjpOGQ1eglMmt87Ayab0vMX64NKdjCUdrCBfICDUU
 noZuIECyi0UKwjZDAVCIX2urLOZzdQWygWCYDOU40XFLRhd4nf1PxyG4QN/QUszSQEAAA==
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

This is version five of my series which adds support for the TI FPC202
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


