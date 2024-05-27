Return-Path: <linux-i2c+bounces-3677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C948CFF27
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 13:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAA7FB2242E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 11:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC2F15D5CA;
	Mon, 27 May 2024 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gZISFw8t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DA131E41;
	Mon, 27 May 2024 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809962; cv=none; b=BqXKYDhZJyXEXJbPLaLuZc2p7nlFcSQHkgJ4GQtUqfZl+IJd0SGCN3LKb2BWfJFjCeGlAtwApVPOgWGaISWSny+vG5cQ19LqmbgQSTj16dd7bGFGugrNX5bT+8T2XPYGxQocBpLPJ8rDQFdiUBVtoV3E7MlDb83vLMKGLLiegKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809962; c=relaxed/simple;
	bh=Xm4R6XpnO+aQU0kNAxXCbrbG8kUO0J7Tn2VbOqHbMe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gH4HaR26j87yw7+lhaxNwvEPPGIHhxkeBk13VqWbOQx+S87k79cTRQ48PYirBFsPRkgp21xQDdZKnoSuCAyoqc2LhSoMNb/6YGP6PUCv3ouwmb68GOu5ZFS/fzVbCgCWEQ1XDGB50ytUhLUiUzvXQf1Nh8tEENqkGJKYQrAUvhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gZISFw8t; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id DB0E81C0006;
	Mon, 27 May 2024 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716809951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0KuA2J0u7+dOBhwaOdV4nNrAdIWa3/6nWPx8k4Wo5A4=;
	b=gZISFw8tPQCiIE8SSUq56sQkEVh5ZZIDjC3tH8wayKDLhfwqYF1p2O1CIJPX1L9uqjng3b
	lfBSywwCyzXykZUdzvQVAEVjdn8nmVjdGDZroR1mNCcmoduujnYLWNhiGLQR1C8dOEgRq4
	yHwrNxJR1PJn39ILrRazXDfkyZS/gNR/jRQTAqybZYW/ZhBiLUhDKgY8kfRqm+O+dyGVtj
	xvfvvJT7feImOitjI1BwCcIpy8DnbhNCVuyKI8fUc2gjcaxktNXY5DOGENnSb/tii9TQZ+
	/uKjucdHrJfol8qIqJ6BEN21BkHs5c3hqJsnet22iHO04/pZ1PHIi3Z4hOUchg==
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
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 0/3] i2c: mux: gpio: Add 'transition-delay-ms' property
Date: Mon, 27 May 2024 13:39:05 +0200
Message-ID: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
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

Add a optional property in the bindings called 'transition-delay-ms'.
If present, driver waits for this delay every time a new bus is
selected, i.e. before returning from the bus_select() callback.

Bastien Curutchet (3):
  dt-bindings: i2c: gpio: Add 'transition-delay-ms' property
  i2c: mux: gpio: Re-order #include to match alphabetic order
  i2c: mux: gpio: Add support for the 'transition-delay-ms' property

 .../devicetree/bindings/i2c/i2c-mux-gpio.yaml      |  3 +++
 drivers/i2c/muxes/i2c-mux-gpio.c                   | 14 ++++++++++----
 include/linux/platform_data/i2c-mux-gpio.h         |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.44.0


