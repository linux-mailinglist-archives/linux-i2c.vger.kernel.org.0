Return-Path: <linux-i2c+bounces-3698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5D8D32BE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 11:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEB94B25084
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 09:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC25169AE6;
	Wed, 29 May 2024 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cAG55kEX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D245A15CD41;
	Wed, 29 May 2024 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974272; cv=none; b=ncCRvnEVItE8xSaRKs81jMgtQ+e9fPQ+Np/ubNi42Gh/qiz2Nu1kOuBIbV5YGr92mGZVehi2UHo9sV63o33Ua1Xu1Cem/KoqOgwt+hGQnMlkmJGwVOsVeNkKgI8VoBriNn9Q6U+S00WrxY5z1aFR8vaMG/QKLJ6mkJlQvWf7YjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974272; c=relaxed/simple;
	bh=pVcY8brKHTTyuvaNTRKSX1bJjN/WbvVqShR0h/341m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2RVD5htkHflKESIaJ9i47X6zcNXtE6UdxwAppnFO3KWYCrwl1koyp3dcw0iLd5dSHgiiJ25gFmaNm1HPJ+Ocuv3sQpsxos4sDnPyA15wNxltwp5Tlv0g8W3kvJ5Swr2zoMf+p/L7NHydIA9mD/1s1tezSguLTq45VqFyvo5y3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cAG55kEX; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 90F1E40005;
	Wed, 29 May 2024 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716974262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VGSu2junM166eo2ekTBWdX+3iGwIta7UqT2TDo+DFpA=;
	b=cAG55kEXfs3opX//eb+q+Gv8b9IHUT756AwPP+NJYsTAFV4jdEOe5Jb75+7KDFD8+Ae85h
	6R14laBVFnhrJljzK17lzT5rKj9w3bz/7GtSRyvnrmcxLrHCricipGTSsKLuLfJHamAex2
	D1/mtvF4op74J5dtJoEuVM7GYntfiwQTACzzg17Em09c3m7BejRp4frZe2rh99YujEp/Vo
	OE1h7VxxkhJumfKYKnjhBK0E9p2WY7sIRQrjp59+JD+xSZc0X+0zhzR9V0ZRYH+NjWzUBC
	TrsFqtU4kgAdAhrxK0KSHz6h14kn3LMjEYKMd8a2mxc9614cz5Xs2Pmth6uOxw==
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
Subject: [PATCH v2 0/3] i2c: mux: gpio: Add 'transition-delay-us' property
Date: Wed, 29 May 2024 11:17:36 +0200
Message-ID: <20240529091739.10808-1-bastien.curutchet@bootlin.com>
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

Add a optional property in the bindings called 'transition-delay-us'.
If present, driver waits for this delay every time a new bus is
selected, i.e. before returning from the bus_select() callback.

Changes in v2:
 * Rewrite bindings' commit log
 * Express the 'transition delay' in us instead of ms

Bastien Curutchet (3):
  dt-bindings: i2c: gpio: Add 'transition-delay-us' property
  i2c: mux: gpio: Re-order #include to match alphabetic order
  i2c: mux: gpio: Add support for the 'transition-delay-us' property

 .../devicetree/bindings/i2c/i2c-mux-gpio.yaml      |  3 +++
 drivers/i2c/muxes/i2c-mux-gpio.c                   | 14 ++++++++++----
 include/linux/platform_data/i2c-mux-gpio.h         |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.44.0


