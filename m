Return-Path: <linux-i2c+bounces-4059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A190AD9A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 14:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 733381F228D6
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 12:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A797B194C7D;
	Mon, 17 Jun 2024 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H8V4wQ7p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4017FAA2;
	Mon, 17 Jun 2024 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626106; cv=none; b=KTudOzHTXcBh7HDKQ3UgBhSmPhhfFMBJVjcBcZ60lIfehZW7I6Z4NU4GUHjOKLR7MQfyIdNb8ewKT2s0uTzS74znbEqt8GJD/DhSswqzlastxXdfNng/fxQavsA71gxi3zN8vhyXQW10rLVLWoonaXAZi/jzqS37Iz+mZPxGG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626106; c=relaxed/simple;
	bh=PsqCvI9iYJBn0w58OPhyl9OmctKHOFcdmv3uZUmC09A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7SU2ym3iFnWeE4xvutSc0bP1GQQxe2k0jesfugOBGHhULtIPixk0JCS9Nz3FQ4uPgz0Ot3dlfTk5Y8/xXjAywZSHSor6sqlTqp9fNbOEyCsy9Zp1CIS1hmtwbfAveyhC/U/PMnv55Zb0KgYNGFIqcJKmgDmWx1QW4BCjP07wpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H8V4wQ7p; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 7C3904000E;
	Mon, 17 Jun 2024 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718626101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GuKdc1xKXRp/qhXALkelzw1dzBSmgkA1O3cnHePaipU=;
	b=H8V4wQ7przmplXIacmPrH7kYoIPUsHhItcpsoiVJZrKxDNCVu4JQWHMh/Tli+FtaM218kV
	+nBREQhpYDYU+oAlJFGgUGm0kWJv+n+vMuhXYvA8vfc/u/ssARV/WvUhLJzfyrd8NuDt6E
	my+0iuoFvD4jL/T+xaxHsTjqJBszpu9HZ8F68fAg5flS6CTg8YsOTBou/CNbWg5m4Gqb5W
	8CbGc6hov8ljgvvFknDxjtY/6URYCuFR3Jhn8KXv/6E0Od0QEJ8pylplCkDxDIMArooGVv
	M+zpZmHBg5/21+41x4BEh76cIFFRk+CaDcJXhbyyXEj24YBK1T7KGUT7Hlaaqw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v3 0/3] i2c: mux: gpio: Add 'settle-time-us' property
Date: Mon, 17 Jun 2024 14:08:15 +0200
Message-ID: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi all,

The i2c-gpio-mux can be used to describe a multiplexer built upon
several i2c isolators having an enable pin (such as LTC4310):

 +---------------+                     +------+  +------+
 | +-----------+ |                     | dev  |  | dev  |
 | | GPIO_EN_A |-|-----------|         +------+  +------+
 | +-----------+ |     +-----+---+         |         |
 |               |  |--| isol. A |---------+---------+
 |     +-----+   |  |  +---------+
 | SOC | I2C |---|--|
 |     +-----+   |  |  +---------+
 |               |  |--| isol. B |------+---------+---------+
 | +-----------+ |     +-----+---+      |         |         |
 | | GPIO_EN_B |-|-----------|      +------+  +------+  +------+
 | +-----------+ |                  | dev  |  | dev  |  | dev  |
 +---------------+                  +------+  +------+  +------+

These isolators often need some time between their enable pin's
assertion and the first i2c transfer. If the first i2c transfer
happens before this enabling time is reached, transfer fails.

There is no available option to configure such a time in the
i2c-gpio-mux driver.

Add a optional property in the bindings called 'transition-delay-us'.
If present, driver waits for this delay every time a new bus is
selected, i.e. before returning from the bus_select() callback.

Changes in v2:
 * Rewrite bindings' commit log
 * Express the 'transition delay' in us instead of ms

Changes in v3:
 * Rename DT property to 'settle-time-us'
 * Use fsleep instead of udelay

[v1] : https://lore.kernel.org/all/20240527113908.127893-1-bastien.curutchet@bootlin.com/
[v2] : https://lore.kernel.org/all/20240529091739.10808-1-bastien.curutchet@bootlin.com/

Bastien Curutchet (3):
  dt-bindings: i2c: gpio: Add 'settle-time-us' property
  i2c: mux: gpio: Re-order #include to match alphabetic order
  i2c: mux: gpio: Add support for the 'settle-time-us' property

 .../devicetree/bindings/i2c/i2c-mux-gpio.yaml      |  3 +++
 drivers/i2c/muxes/i2c-mux-gpio.c                   | 14 ++++++++++----
 include/linux/platform_data/i2c-mux-gpio.h         |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.45.0


