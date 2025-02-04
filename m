Return-Path: <linux-i2c+bounces-9285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941AFA26E4A
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 10:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC1F165BA5
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 09:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6974E207DE6;
	Tue,  4 Feb 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ontwalZR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF95207A00;
	Tue,  4 Feb 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661364; cv=none; b=EDTIGa906qsm+wAnKz+0IiXX06UiIRoJEHsWucU2vMPy+DOHT2Mb3JBEaAyJljb80esWY6ZbkyTWWfFUgsy6cJnrD1xf6SOMZH45uLh5CTBciLz61i1RgIppsjES4ZPJy6c5z+SHey/dtaPvIGvBb4pWiTiN0SPdIrfw+i/yzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661364; c=relaxed/simple;
	bh=eMSZR184pNyYKO7OZQpI/SBXyNlp7dxGDDy8hNjjVA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lag7cWzeEa2aMcLh4vvpAl+B11ya4r94ihximVbj0wB5l2GFfI4O6CuxjFrQAn2Tvf5y5QBJl22qpe41KmaXaUtMZiULRirHQU+gVS0nh1sbYVib+ZsHFQbaL7rq7bEMHSPF2D9q5DN9dfVxXhRabeiRk2b8QaZJNUJaKoihZ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ontwalZR; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 665AA433C9;
	Tue,  4 Feb 2025 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738661359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VV8/JHm8kIK/rlo3rcbyj1LmcZAByFGrKx7EJ2T+XlA=;
	b=ontwalZRkhxk+02Z9CEucuzMfxcvDDXM09d24+a+16xeyxUM7oMb5yYjNNYXHzmIAfLeyc
	hV9z9Fk9/fOyoMAfR4Xiu4VFBesSrTEptv0+CY1+ghtXvPEYL5UjpU461lZLeedwsYKp0m
	zCqQuBabfo+ryJidFG4thK+SUwmkVw430mmh+DtZCQAolcH2Olxb++YcGos9nIcY+mdCE+
	aSZKrWFSlR6L35z7yMvU8c9AQTqH/MimM4kY2Id2sIrocl7yRxwqpEwSfkprG16qbXteO/
	thMD4YZf5v5m4nSpBh9NHVzl6wgoUcO5yfFcoY3hY8OiMAN3OPMXBla98hKImQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH v7 0/9] misc: Support TI FPC202 dual-port controller
Date: Tue, 04 Feb 2025 10:29:11 +0100
Message-Id: <20250204-fpc202-v7-0-78b4b8a35cf1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjdoWcC/2XQzW7DIAwH8FepOI8JjIGw095j6oHPFWkLVVJFq
 6q8+5xObTLlZiN+f2xubMxDzSN7O9zYkKc61tZTY18OLJ58/5l5TdQzEIBSSMvLOVLNTRHBKke
 17RhdPg+51J970MeR+lMdL2243nMnuZz+RUjRPSImyQUvGSEa14Xo4D20dvmq/Wts32wJmWAD5
 QqBoEXMWKQDD2kP1QaCfkJFUGHuTIhBB232EFcISjwhLi8aGcDZROPaPdQPqMV2R03Qo3I+OOe
 S9ntoNlCuoxqCCa1X2NEfa/UfzvP8C3pbyVC7AQAA
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeggeegheffueefieevffefleeuieegveejhfeiudelkeegleelgeduveefkeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddufegnpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvrhgvkhdrkhhivghrnhgrnhesrghmugdrtghomhdprhgtphhtt
 hhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepughrrghgrghnrdgtvhgvthhitgesrghmugdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version seven of my series which adds support for the TI FPC202
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
Changes in v7:
- Removed a superfluous log message
- Link to v6: https://lore.kernel.org/r/20250115-fpc202-v6-0-d47a34820753@bootlin.com

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
 drivers/misc/ti_fpc202.c                           | 438 +++++++++++++++++++
 include/linux/i2c-atr.h                            |  54 ++-
 10 files changed, 964 insertions(+), 191 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241017-fpc202-6f0b739c2078

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


