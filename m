Return-Path: <linux-i2c+bounces-7305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56C996CFE
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34DB1F2464A
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3C2199FB5;
	Wed,  9 Oct 2024 14:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cSmlJlHI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A018BBAE;
	Wed,  9 Oct 2024 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482472; cv=none; b=pU0hIwRJReqVvjdtBdo2E578pnWornDSBlsQmyxjG0V+NYmYguV9D5k/asxgg0f+wBIAB4b808k4q+D/+066xGYiUWp5I9I3r/Wnl2gI8ZFjWbbxrYVlHZros+LILjjjFfn1J3RDcZVreofYQNxVXZj/ckCKjl0G/X4SAEnQ8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482472; c=relaxed/simple;
	bh=sgqYjYWWrUjFuJvmE74MP0NEEMmc6GWxYEJNsz+2ICQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FncVZYte+sthxP2o0YZH14gXUwTYEiCApgsWf/AEFRokH+s4E9YUdM3FGXRTc1cqCL+N5RywRJX+teQdqhVnfpXUIegg+wP8zMrKaSkzzqqzlrKgpWiCBSs3NKn16Mpqn7BBP5jryW7iRj3Ay0BGgNTOFfgtBOrrDf345hUIAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cSmlJlHI; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D7D71BF20A;
	Wed,  9 Oct 2024 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728482467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=meMdgwASJTSVQgcqYdIohoxaA+Loney7M/QLmYnOhZs=;
	b=cSmlJlHILjk/s2eeKZUUNwUfWBXw1ZL0a6VKOIxXTRh3Bw5nBRk7D4K+cqQjBj6AeIirK+
	LZQtEc0QnZdmFLdgimtgY7+PoC//8GBays7Czyq4NeoAeYSIzWrDo9RJDY+mQ1cN/8oiti
	bjbfxZEi9LPblK11/kUe5Pz3d2bt3etFtCyqB9IIt2G5Ol/sJqXSzg2CSutkOwDnnXkF7q
	LPFIWBNQVVJTgPB9M8KKvHf9RdYpCUWKptPWXp8sKbAWScIVEUa5WgaVaRJFWMO8rGEQL8
	vyyBEuKPQNFEOliZ3wGSWFT0+n/PFVxevlBpxGwKL6TNPQJKf8trtJeJiF7t1w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v3 0/6] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
Date: Wed, 09 Oct 2024 16:01:06 +0200
Message-Id: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKKMBmcC/1WMwQ6CMBAFf4X0bM12QUo9+R/GQylFNgFqWtJIC
 P9uITHicV7ezMKC9WQDu2YL8zZSIDcmyE8ZM50en5ZTk5ghYCEAJB/qfuaEhmMpjWqKCmsFLN1
 f3rb03lP3R+KOwuT8vJej2NZvpPpFouDANZRG5EJqbOWtdm7qaTwbN7AtE/GoqoOKm2oU5qCrR
 pvLv7qu6wfMVucp3QAAAA==
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
      For a bus rate of 400kHz, it would pick >400kHz. Now pick <400kHz.
    - [PATCH 6/6]: support high SM (speed-mode) values.
      This is not much work.

It works on EyeQ6H HW just fine. 1MHz has been tested but not 3.4MHz
because HW doesn't support it. The theory is there, and BRCR
computation has been checked to be valid with 3.4MHz clocks.

DTS patches targeting EyeQ5 & EyeQ6H devicetrees are not provided
because they depend on the platform's clock series [0].

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20241007-mbly-clk-v5-0-e9d8994269cb@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v3:
- [PATCH 5/6] "i2c: nomadik: fix BRCR computation":
  - Use DIV_ROUND_UP() for BRCR calculation.
  - Improve code comment.
  - Add small note in commit message about DIV_ROUND_UP() usage.
- For all patches but [PATCH 5/6], apply Reviewed-by: Linus Walleij.
- Link to v2: https://lore.kernel.org/r/20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com

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
 drivers/i2c/busses/i2c-nomadik.c                   | 89 +++++++++++++---------
 2 files changed, 61 insertions(+), 41 deletions(-)
---
base-commit: 6f1cfa7816af8b3286140f1b0476200d5e914eb9
change-id: 20241007-mbly-i2c-267c9d482b90

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


