Return-Path: <linux-i2c+bounces-2220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675E873DE2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79D1D1C210F3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 17:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120DD13C9FB;
	Wed,  6 Mar 2024 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XrHjw7j1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B22F13BAF5;
	Wed,  6 Mar 2024 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747972; cv=none; b=MkInxexV3wsehVD6fYaO/jWOmc4ncFmshpXt7Kn0NSDQAMWw7Xx9R6qJDYMJeGSjtugbZjuKC0a2OrpMzpAKUTAaZNp4mcBuv9owfZ1fh2sAACgTwwfHiSbbWKoIxc/vxZFQWuRyS+Oqu5KFPE/B5XFnpfuJav/293nDqc7H1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747972; c=relaxed/simple;
	bh=7rNmIiJvHZRRcyxK8sahGbJdTPGuTBAHirBOnXT5Ozk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gVZE3Nhq2e5oKgIpz5sD8+dn1yCB7NfjL8XuClaIw2x8N0GdxZW/uZEDwS5HqWzWppE9YNGSIotVKQ96gxFGwdXpCHUjkTlMSYP4CqhAnxvM6k+s+R1GoIes1nLK2VvzKlLjRchaxOaOtU0mkoANbPdMC3Q55qH1eG6VjcTDtQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XrHjw7j1; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6690940002;
	Wed,  6 Mar 2024 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=feUsser08/oRbJl8T+/+meJYT6wkDGmgBWV/M3Vs1vU=;
	b=XrHjw7j1yFLFY+SWL4phvU+R0M4qjVf9pCSNLN3GOiFINCKTO6V8tZqhb+X5qiZcr2mclM
	FZ8SY4jubBSJBqmweKAnFsmx8gHYy+12Skxl9jUT7UCcZt5v6Ovt0bnMi4pRQ9qcObsdSe
	gA3ptXKBzX0o98XKq41+ouc0xxlO2u12B8woLgVKI3T+tDfc/r7vZ0yyIPcc+FcNfqDSTU
	dGDk8z9qv2u0826HicHpB1OUaE4v3scJYew4EjFr4yaFtYQByEhTSyH9g5EKX0DYgpIsrL
	5RM6chw1hCg25gQreIDt1EcOuG6TZTQGHckB02375C26IOA12aYQbHM/WEbe6g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v3 00/11] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
Date: Wed, 06 Mar 2024 18:59:20 +0100
Message-Id: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPiu6GUC/1WMzQ6CMBAGX4Xs2Zru1h/qyfcwHmgpsglQ05JGQ
 nh3CxfxsIfZfDMzRBfYRbgVMwSXOLIfMqhDAbathpcTXGcGkqQwn+hNNwkmK66WGmMMktYN5Pk
 7uIY/W+rxzNxyHH2YtnLC9btGTpLw/IskFFKgrpS6OI21re7G+7Hj4Wh9D2sm0U4lvVMpq0aRq
 7G0Upf2X12W5QsnrkFb3QAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Hi,

This series adds two tangent features to the Nomadik I2C controller:

 - Add a new compatible to support Mobileye EyeQ5 which uses the same IP
   block as Nomadik.

   It has two quirks to be handled:
    - The memory bus only supports 32-bit accesses. Avoid readb() and
      writeb() calls that might generate byte load/store instructions.
    - We must write a value into a shared register region (OLB)
      depending on the I2C bus speed.

 - Allow xfer timeouts below one jiffy by using a waitqueue and hrtimers
   instead of a completion.

   The situation to be addressed is:
    - Many devices on the same I2C bus.
    - One xfer to each device is sent at regular interval.
    - One device gets stuck and does not answer.
    - With long timeouts, following devices won't get their message. A
      shorter timeout ensures we can still talk to the following
      devices.

   This clashes a bit with the current i2c_adapter timeout field that
   stores a jiffies amount. We therefore avoid it and store the value
   in a private struct field, as a µs amount. If the timeout is less
   than a jiffy duration, we switch from standard jiffies timeout to
   hrtimers.

About dependencies:
 - For testing on EyeQ5 hardware and devicetree patches, we need the
   base platform series from Grégory [0] and its dependency [1]. Both
   in mips-next [2].
 - Devicetree commits require the EyeQ5 syscon series [3] that provides
   the reset controller node.

Have a nice day,
Théo Lebrun

[0]: https://lore.kernel.org/lkml/20240216174227.409400-1-gregory.clement@bootlin.com/
[1]: https://lore.kernel.org/linux-mips/20240209-regname-v1-0-2125efa016ef@flygoat.com/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/log/
[3]: https://lore.kernel.org/lkml/20240301-mbly-clk-v9-0-cbf06eb88708@bootlin.com/

To: Linus Walleij <linus.walleij@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-i2c@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Cc: <linux-mips@vger.kernel.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Changes in v3:
- dt-bindings:
  - hwmon: lm75: drop patch taken into hwmon-next.
  - i2c: nomadik: remove superfluous "The variant found in..." comments.
- i2c: nomadik:
  - Add style fixes description in commit message of "rename private
    struct pointers from dev to priv".
  - Improve commit message of "simplify IRQ masking logic".
  - introduce ADR_3MSB_BITS constant to avoid magic GENMASK() in code.
  - Introduce enum i2c_operating_mode to avoid magic 0b01 in
    DEFAULT_I2C_REG_CR. Named as in manual, using outdated terms.
  - i2c_irq_handler(): add newline and split declaration and assignment
    in I2C_IT_BERR case.
  - Make timeout_usecs an u32 rather than int; avoid superfluous cast.
  - nmk_i2c_probe(): remove extraneous debug log.
  - nmk_i2c_eyeq5_probe():
    - Straight return error and remove useless handling of NULL. Put
      dev_err_probe() call in probe().
    - Add ID value check.
    - Add enum for speed mode values.
    - Add static array for masks.
  - Reorder includes in separate commit from Mobileye support.
- Take trailers from Andi, Wolfram and Linus.
- Link to v2: https://lore.kernel.org/r/20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com

Changes in v2:
- dt-bindings: i2c: st,nomadic-i2c:
  - Drop timeout-usecs property, rely on generic i2c-transfer-timeout-us.
  - Use phandle to syscon with cell args; remove mobileye,id prop; move
    mobileye,olb from if-statement to top-level.
- dt-bindings: hwmon: lm75:
  - Inherit from hwmon-common.yaml rather than declare generic label property.
- i2c: nomadik: (ie driver code)
  - Parse i2c-transfer-timeout-us rather than custom timeout-usecs property.
  - Introduce readb/writeb helpers with fallback to readl/writel.
  - Avoid readb() on Mobileye.
  - Use mobileye,olb cell args to get controller index rather than mobileye,id.
  - Take 5 Reviewed-by Linus Walleij.
- MIPS: mobileye: (ie devicetrees)
  - Use mobileye,olb with cell args rather than mobileye,id.
  - Squash reset commit.
  - Add i2c-transfer-timeout-us value of 10ms to all controllers.
  - Rename LM75 instance from tmp112@48 to temperature-sensor@48.
- Link to v1: https://lore.kernel.org/r/20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com

---
Théo Lebrun (11):
      dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and example
      i2c: nomadik: rename private struct pointers from dev to priv
      i2c: nomadik: simplify IRQ masking logic
      i2c: nomadik: use bitops helpers
      i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
      i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
      i2c: nomadik: fetch i2c-transfer-timeout-us property from devicetree
      i2c: nomadik: support Mobileye EyeQ5 I2C controller
      i2c: nomadik: sort includes
      MIPS: mobileye: eyeq5: add 5 I2C controller nodes
      MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor

 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    |  49 +-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |   8 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  75 +++
 drivers/i2c/busses/i2c-nomadik.c                   | 740 ++++++++++++---------
 4 files changed, 558 insertions(+), 314 deletions(-)
---
base-commit: 70a29ee8ef53a09ab62b46540c12ccb94a4a8532
change-id: 20231023-mbly-i2c-7c2fbbb1299f

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


