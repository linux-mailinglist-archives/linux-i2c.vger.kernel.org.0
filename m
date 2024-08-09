Return-Path: <linux-i2c+bounces-5258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CB94D293
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 16:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13D31C21384
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A00197A8E;
	Fri,  9 Aug 2024 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FpTXDA+a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8F195F0D;
	Fri,  9 Aug 2024 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215165; cv=none; b=a6khOiHUtdfBP5ba/FgVa0fdlMfjNGfWdWUmF8YXc7frdZCXF1EPuPWK+d5/Qox5oav2r4osG7IbmiOBWyzhdYHZg9kkkAowRIxJ+H0rfyaIuwO38y7KdxUEr8P+WSus2hoog/dTtOqbUe9KjhTnQiSWsiQm52O070xCIK0HVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215165; c=relaxed/simple;
	bh=54QXor35iu4GsDL+IbSaowExg2cqF8oAk40RdmrZ9ro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JOn11VSl3kwap1Xe3LrVXaNKVQT3bseoDAIo1iU1jcmD+yv03N+kq6asXyhG8+RfZtVUQjZVU4wmj2bmzB93ssfCkTpJomeeCMvJ8JjSz27E6yDQLA6MJG9tlETa8ZsNp6PSiaxPqAzyMnULNYkBozqh4Q5EGeooBP1/a+TygEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FpTXDA+a; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7293C40013;
	Fri,  9 Aug 2024 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723215153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x24MAzrCMKYNTrujF82LTVJxRbe78cQL5WaUMWGVif8=;
	b=FpTXDA+aYU8FKWd1QYS9VxCeWO2yEnunehP7kSifsV/Ur9D23MIJEa7bXaSQPH32xkoU6j
	n4FYUBJSolK4W3XCqBCpFrJic6Z+yQpR2W9P631VHLTVcjuZnYJOp19Gm+hZDj7DOFzY6a
	+k3jJv/7bQ7IrApY0PP77BMJnqyQUG91aGW9lsLOmGpk67Y86H8F4O33Ub6fFDYTqFVfzc
	3u3NZFbNjgAs075Rq7F8Bs0MZ+DspNxqR+s7t9OpXce+QlTRc/+rGLBWwfjha2iEXVaFkP
	fzot6SZwwPDm6EHdarYxF+dZ95GpOiDeqNLnLMbPKIEdFDzRyWWIEVIq3KD4sw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 0/5] Congatec Board Controller drivers
Date: Fri, 09 Aug 2024 16:52:04 +0200
Message-Id: <20240503-congatec-board-controller-v1-0-fec5236270e7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQttmYC/x3NwQrCMBAE0F8pezYQYyrFXxEPm822DdREdkMRS
 v/dxONjmJkDlCWxwmM4QHhPmkpuuF4GoBXzwibFZnDWeTvam6GSF6xMJhSU2FmlbBuLmRzdw+Q
 pekZo/YDKJghmWvvCG7Wy9OAjPKfv//T5Os8fdA2OHYQAAAA=
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

The Congatec Board Controller is a microcontroller embedded on the x86 SoM
of Congatec. It's able to manage lots of features, such as a watchdog, some
GPIOs, I2C busses ...

There is no datasheet or specific documentation for this Board Controller.
The only sources of information are the driver, library and tools provided
by Congatec in their yocto metalayer [1].

The Congatec implementation (available in [1]) doesn't follow the good
practice (a unique driver, and all accesses are done using custom ioctls).

This series implements an mfd driver, a gpio driver, a watchdog driver and
an I2C bus driver, to use the standard API from userspace.

For now, only the conga-SA7 module [2] is supported. For this board, the
Board Controller has:
- Two I2C busses
- 14 GPIOs
- A wathdog (with pretimeout support)

It also has temperature, voltage and fan sensors. They will be supported
later.

For the development, the conga-SEVAL board [3] was used.
With this board you have access to the 14 GPIOs, and the two I2C busses.
On each I2C bus, a 24c16 EEPROM is present by default.

To be able to drive GPIO 4, 5 and 6, a specific BIOS configuration is
needed: HD audio shall be disabled, and they shall be set in GPIO mode.

[1] https://git.congatec.com/x86/meta-congatec-x86/
[2] https://www.congatec.com/fileadmin/user_upload/Documents/Manual/SA70.pdf
[3] https://www.congatec.com/fileadmin/user_upload/Documents/Manual/SEVAL.pdf

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
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
 drivers/gpio/gpio-cgbc.c      | 203 +++++++++++++++++++
 drivers/i2c/busses/Kconfig    |  10 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-cgbc.c | 407 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig           |  12 ++
 drivers/mfd/Makefile          |   1 +
 drivers/mfd/cgbc-core.c       | 453 ++++++++++++++++++++++++++++++++++++++++++
 drivers/watchdog/Kconfig      |  10 +
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/cgbc_wdt.c   | 217 ++++++++++++++++++++
 include/linux/mfd/cgbc.h      |  44 ++++
 14 files changed, 1379 insertions(+)
---
base-commit: d31d4ea2a5e337e60f6da9a90e41d4061bdcec91
change-id: 20240503-congatec-board-controller-82c6b84cd4ea

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


