Return-Path: <linux-i2c+bounces-8185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC99D7D2C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 09:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294C1282AC3
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 08:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DED18CC1D;
	Mon, 25 Nov 2024 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZSxjbz+w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A780618A95A;
	Mon, 25 Nov 2024 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524336; cv=none; b=ZmfH98PityVz/hm/DSsg/ki9pztHHw1BBvw7/28Ec1xcBB8J1pG7brPV5QaAdk6Ve+3ytEemtzeQLElNNlGcsT4NCcVuoOSStoaA0OLn3QUjBYl7sqofzV8UFwNBc3uvFOFOBpv2e7k7I9uh17JpfLd/zwIUmYol3G1VUsUnedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524336; c=relaxed/simple;
	bh=lJwVS70v3SVo849D24NQ+rHlsxNtn9U5Tb4DJEULkZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0Kl4rt8T61oNHOTdqkMUJJSjVjORPpEsxBu6f6pPEIPmjsqwxelc23uYu1+3IjZolDGvFNkmHo7WwL0/9DUkFBQi+MChLc3hhv+nA5d4nnLdaYKVnHKK5f7dH6IkxwVKPaWJG+LOdP/MQpIUN3aV9EM/QqtLqZlaoZCxrVhjYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZSxjbz+w; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 982751BF209;
	Mon, 25 Nov 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732524330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ia3Rtg8suGGbEgeGtI6bMKQYuwy5zPE5EYeOCxo1k80=;
	b=ZSxjbz+wvLN0WDnB48hKLTWmaFX2E909P7klwppPN4lP3GrB0sD8Ab6jnSAGCbVEdAYq7X
	peOF2fC2V1T5zDGVSfZS0rGZpeZJSyTQA/dn+lZjpxSHsyAPQ1fyhpAkErxmK+ncZo+I5e
	AueQ27DuCwMWX1UEL/0YZaIYeghgi4T3IdyRHnIjLjXNjyTpE7sGjx+fHua0TJpU0r/m5Z
	uyhMDgZ7edyr6Uav25qKcTBX04LvbhmeyNSMaODWvuoVeu5hJ2+BMzSzd+jq5Mf77IH99K
	DeN4MI/1T0tVbstV5pMW0FjfVByffz2szzJ+xPXZ1k+F3qXvlm+MK9e22Q/edA==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v3 0/9] misc: Support TI FPC202 dual-port controller
Date: Mon, 25 Nov 2024 09:45:14 +0100
Message-Id: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABs5RGcC/1WMQQ6CMBBFr0K6tqYzNJS64h7GBZSpNFFKWtJoC
 He3YIy6+28y7y0sUnAU2alYWKDkovNjhvJQMDO045W46zMzFChBgOJ2MnnzyopOlTpvVbP8PAW
 y7rGHzpfMg4uzD8+9m2C7vhMg6k8iARfckkRT6bozGpvO+/nmxqPxd7ZFEv6I8BUxi0pKkhY0t
 tj/i+u6vgC4ORTF1wAAAA==
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

This is version three of my series which adds support for the TI FPC202
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
      media: i2c: ds90ub960: Replace aliased clients list with bitmap
      media: i2c: ds90ub960: Protect alias_use_mask with a mutex
      i2c: use client addresses directly in ATR interface
      i2c: move ATR alias pool to a separate struct
      i2c: rename field 'alias_list' of struct i2c_atr_chan to 'alias_pairs'
      i2c: support per-channel ATR alias pools
      i2c: Support dynamic address translation
      misc: add FPC202 dual port controller driver

 .../devicetree/bindings/misc/ti,fpc202.yaml        |  96 +++++
 MAINTAINERS                                        |   7 +
 drivers/i2c/i2c-atr.c                              | 480 ++++++++++++++-------
 drivers/media/i2c/ds90ub913.c                      |   9 +-
 drivers/media/i2c/ds90ub953.c                      |   9 +-
 drivers/media/i2c/ds90ub960.c                      |  65 +--
 drivers/misc/Kconfig                               |  11 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ti_fpc202.c                           | 440 +++++++++++++++++++
 include/linux/i2c-atr.h                            |  67 ++-
 10 files changed, 989 insertions(+), 196 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241017-fpc202-6f0b739c2078

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


