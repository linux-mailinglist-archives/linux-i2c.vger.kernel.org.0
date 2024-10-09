Return-Path: <linux-i2c+bounces-7285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A3996719
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 123CAB2A56B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F46918F2DA;
	Wed,  9 Oct 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Sroc8VNI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79293158DB1;
	Wed,  9 Oct 2024 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469419; cv=none; b=OHKI5HQzK3SYDbEpsMGR+v3OjEpIqDxZZELj/mciyHNdJLI7qR+FPCaK9wZR3TAQUw20fxJ90XdXNFZtfz4Q2IpeoXw4+LtmUK31LeFpoy8JySGnwK7Eir3TvE6iyAP0iRanwNdNimKlWthyDhFRAAZquIBmdrSLY8DWG+WToPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469419; c=relaxed/simple;
	bh=kg8uGMxcJY0VGnMG4HflWm7gAZLcGN2UGbMOYHvT9Fo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nZAC8VdflDc6VaISD5YV6FHCCRC0uMVAY2kyVO3U1oPwGKK70z5OTjqjMSfZxkPrLIn+77xWGVYTRnCNXVouQnRUfhpaNhkjs46o7xvXzDcc4xOljWXu98BfPcOWV5PSKHMntrLF5spc6MuLdXVb39ReZ20Tdc7wQvFF9+eu3JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Sroc8VNI; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18AD5C0008;
	Wed,  9 Oct 2024 10:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sciMm2xaCbtFbC/q7bparVgAbNpRaWLZ9FYaBQz2d4A=;
	b=Sroc8VNIMhDIyF2UmZSK0zg1nxhr/xzKhwKnpIJLcoUInfvTqaj9WO8BOF+qwwlQ/i+/9w
	clt8IdD/muxFjBr8BwlVa0hjLznJSaG4pttMHeMW6m8y7R9egunpWDo+v5FFvILsikaRMm
	Vp6ZGURp3w1pdajzYVexMzjTEZssDhuLsww6M6KbdA4drwEQJVT4shy8f+uIBeWpoOMOzd
	kezG1VI+Ce0VqdjwgbIaL6Jm2rUC/sWDpRkH2GYUZdUca0WOFVCZ1+V9XLFLfVGwye7PDG
	wQ/ZMaFOiuHlUAtMLPZYtmA7GPMYpNQr0vGRRf+3THrJ1Pk+y5vW7KCLOuHMng==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v2 0/6] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
Date: Wed, 09 Oct 2024 12:23:26 +0200
Message-Id: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ5ZBmcC/0XM0QqDIBTG8VeJcz2HnkXWrvYeows1WwdKQ0MW4
 bvPBWOX/4+P3wHRBrIR7tUBwSaK5F0JvFRgJuVeltFQGpBjLTiXbNHzzggNw0aabqhb1B2Hcl+
 DHel9Us++9ERx82E/5SS+6w9p/0gSjDPFGyNuQioc5UN7v83krsYv0OecP9jFI+eiAAAA
X-Change-ID: 20241007-mbly-i2c-267c9d482b90
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Hi,

Three patches are about adding Mobileye EyeQ6H support to the Nomadik
I2C controller driver, in the same vein as was done a few months ago
for EyeQ5.
 - dt-bindings:
    - [PATCH 1/6]: add new compatible.
 - driver:
    - [PATCH 3/6]: we switch from using a match table, before adding the
      new EyeQ6H compatible.
    - [PATCH 4/6]: adding EyeQ6H is only about creating a new match
      table entry thanks to the previous patch; we reuse
      the .has_32b_bus flag created for EyeQ5.

Three patches are about supporting higher speeds (fast-plus and
high-speed).
 - dt-bindings:
    - [PATCH 2/6]: fix them, they indicated only a max of 400kHz.
 - driver:
    - [PATCH 5/6]: fix computation of the bus rate clock divider (BRCR).
      It picks the smallest divider that gives a bus rate above target.
      Switch to picking the largest divider that gives a bus rate below
      target.
    - [PATCH 6/6]: then support high SM (speed-mode) values.
      This is not much work.

It works on EyeQ6H HW just fine. 1MHz has been tested but not 3.4MHz
because HW doesn't support it. The theory is there, and BRCR
computation has been checked to be valid with 3.4MHz clocks.

DTS patches are not provided because they depend on the platform's clock
series [0]. Lore being down at the moment, see Patchwork [1].

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20241007-mbly-clk-v5-0-e9d8994269cb@bootlin.com/
[1]: https://patchwork.kernel.org/project/linux-clk/cover/20241007-mbly-clk-v5-0-e9d8994269cb@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v2:
- dt-bindings: change `clock-frequency: maximum` from 400kHz to 3.4MHz
  in a separate patch.
- dt-bindings: use enum to list compatibles.
- Switch away from of_device_is_compatible() in probe. Use a match table
  with flags inside .data, using of_match_device() from probe.
  This is done as a separate commit before adding EyeQ6H support.
- Link to v1: https://lore.kernel.org/r/20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com

---
Théo Lebrun (6):
      dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
      dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <= 3.4MHz
      i2c: nomadik: switch from of_device_is_compatible() to of_match_device()
      i2c: nomadik: support Mobileye EyeQ6H I2C controller
      i2c: nomadik: fix BRCR computation
      i2c: nomadik: support >=1MHz speed modes

 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    | 13 ++--
 drivers/i2c/busses/i2c-nomadik.c                   | 88 +++++++++++++---------
 2 files changed, 60 insertions(+), 41 deletions(-)
---
base-commit: 6f1cfa7816af8b3286140f1b0476200d5e914eb9
change-id: 20241007-mbly-i2c-267c9d482b90

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


