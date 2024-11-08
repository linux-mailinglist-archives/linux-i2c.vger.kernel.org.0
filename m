Return-Path: <linux-i2c+bounces-7892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A069C2098
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 16:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E93A91C2265B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 15:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57ED221A710;
	Fri,  8 Nov 2024 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MMHtNSf/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2021E7C26;
	Fri,  8 Nov 2024 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080233; cv=none; b=C+SUKKgt9tUxSAS2kJV2YiYO4toWe1hN8astp8bfZC9bP3mRCcgIEreCvcJ1E/e5yUGgnwzAmZLK+98vxWSYyooSaZZJx5aXmPNip6cXIhCAP6F8lsX5VAMUCWoK7VwJvzfr7MHgBpMolEU12/S2eokxSTXNBPIMabAEE2yQ3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080233; c=relaxed/simple;
	bh=F1eXssD2dIQnSsLKLIi5x+YmXINBEuHTi1uKhKkZR/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y3nTssZy12szrXbqjq34KxeFYpXFPiHR/vrSc7qF+9OZPf9w+AcnoBMU/KFzR/PdMTjI5DZe3XAp0ebrwMbZbCwbtaMkOCy5uhybq6JaX2bq8ldtrDv+v2g6P9l8yGbSchXbS7T93YHdXzbAGtiKOBlJIGB2EdDe2ihQ7uJrJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MMHtNSf/; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D852D20009;
	Fri,  8 Nov 2024 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731080228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ib0B4YFNC/k41QT2/TAoYQ8U0l38IOl7tUhDAZTKbb4=;
	b=MMHtNSf/zL3KWZghQhO9S5iedDMi1b5y1WvR7nZT/7FFBHFH7pVtYKKHgf0WSJlG1X3m1/
	EdyTdBEnN1RzfXUGuqbuS4WQNGL+BvH29aVmOycrtFo0D3DuA7DnkjgAJNT2anvV4rJlw+
	7X5d/0UNG/0uurLeEjWOND1TLA7KzSTs5oD8s/7SygcPe7LOOn9iY3bzF8tyrtm6VUVeti
	j5Ofu8qLwy7VXIAkogIyNbmp5QSY3Vg1hU/7EkNqaVz8BvOIT4QU3bpFqfE9uoNgSDbIok
	eothO2RJGU03tw7Ww/VO9eV3nE7J/r2JYMmvApnDSqK+AjfS71evZm08EF91mQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH 0/9] misc: Support TI FPC202 dual-port controller
Date: Fri, 08 Nov 2024 16:36:52 +0100
Message-Id: <20241108-fpc202-v1-0-fe42c698bc92@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABUwLmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Nz3bSCZCBb1yzNIMnc2BLINrdQAiouKEpNy6wAGxQdW1sLAALX0Ux
 YAAAA
X-Change-ID: 20241017-fpc202-6f0b739c2078
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This series adds support for the TI FPC202 dual-port controller. This is an
unusual kind of device which is used as a low-speed signal aggregator for
various types of SFP-like hardware ports.

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

 .../devicetree/bindings/misc/ti,fpc202.yaml        |  75 ++++
 MAINTAINERS                                        |   7 +
 drivers/i2c/i2c-atr.c                              | 480 ++++++++++++++-------
 drivers/media/i2c/ds90ub913.c                      |   9 +-
 drivers/media/i2c/ds90ub953.c                      |   9 +-
 drivers/media/i2c/ds90ub960.c                      |  65 +--
 drivers/misc/Kconfig                               |  11 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/ti_fpc202.c                           | 421 ++++++++++++++++++
 include/linux/i2c-atr.h                            |  67 ++-
 10 files changed, 949 insertions(+), 196 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241017-fpc202-6f0b739c2078

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


