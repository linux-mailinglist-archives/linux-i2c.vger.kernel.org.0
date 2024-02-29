Return-Path: <linux-i2c+bounces-2060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA286D190
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B76CB2499C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7758678289;
	Thu, 29 Feb 2024 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Lg9clSBj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382916062E;
	Thu, 29 Feb 2024 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230257; cv=none; b=EXWqwSyLZwLLwC6gwYH2OcBAloUHSmQsdtf8zP1MkbnqvOWgt46PNSwPBdfQxm4ORXls2sb2qAXfyG8Mc8RRzonKJdoGS+mbosCpjSs0nQcMjn62bZ6s0Pgb1ph11OKkyr0528sEd8THQzMz0fA73TEjnFhhH86bN9QwFbanlCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230257; c=relaxed/simple;
	bh=cv0qMU0e1IbKSJsngscDgbDXzFA5In+xEYRZAHVps5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Al7iiQcROP9Hc3KLSi38F+L6wj1EurNp38FEaPui8Stb+QD5eJHL8v2mAXMaRRdqNgZYAJoya2sBUlOP5iqD3TvdQRMBpsIbpe0rf9hyq3h4TCjo0H+txXSSvbpV1w55LZEaBCQjA022R4kz2RFGI98Xg+vzcQyTxwuIjykf9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Lg9clSBj; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB11960003;
	Thu, 29 Feb 2024 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=it9dSP8MCBxug4cRjAlo9cPe1vkO9FO5feH9cmIzEf8=;
	b=Lg9clSBjE5M6cRqjxlyC4ZrnQ57mKdZjxB/5y2p9nn6pD6zHcrd6ZjauddNesbsbpELDG8
	Pkx8i6k7UGo9STyY25ZR3sAvWEsqtUpU8Bs4u5foZFWAcL1h3jyHbWXxOdwXbMCYEShyDj
	mPF0d+xU7ru2RT4r6+V/pka2Qjcj88Xz6p6M1KJcdME7wDVR2UvHzEBit165YuJ+rCMQuo
	dId4K3FrbTUb7fs387HXpXV7UGuOD1F/AdRZx8KeR2HPmVCCj/DSA67EZNFt7mt2tDe3+N
	eqtrm/ACFvUJJYM6UrUUqhTkSkS+Y54hDRT+MM5t27MCGKrK1jbvxCKrOrIQYw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v2 00/11] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
Date: Thu, 29 Feb 2024 19:10:48 +0100
Message-Id: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKjI4GUC/0XMPQ6DMAyG4asgz00Vm/4onXqPioEEUyxBUiUIF
 aHcvYGlg4fX+vRskDgKJ3hUG0ReJEnwJehUgRta/2YlXWkgTTWWU5MdVyXk1N1Rb61FMqaHMv9
 E7uV7UK+m9CBpDnE95AX3745cNOH1jyyotELT1vWNDXaufdoQ5lH82YUJmpzzD27FyPaiAAAA
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
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-hwmon@vger.kernel.org
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

There is one patch targeting a hwmon dt-bindings file:
Documentation/devicetree/bindings/hwmon/lm75.yaml. The rest is touching
the I2C bus driver, its bindings and platform devicetrees.

About dependencies:
 - The series is based upon v6.8-rc6.
 - For testing on EyeQ5 hardware and devicetree patches, we need the
   base platform series from Grégory [0] and its dependency [1]. Both
   in mips-next [2].
 - Devicetree commits require the EyeQ5 syscon series [3] that provides
   the reset controller node.
 - The LM75 dt-bindings patch depends on the common schema
   hwmon-common.yaml series from Krzysztof [4]. Found in hwmon-next [5].

Have a nice day,
Théo Lebrun

[0]: https://lore.kernel.org/lkml/20240216174227.409400-1-gregory.clement@bootlin.com/
[1]: https://lore.kernel.org/linux-mips/20240209-regname-v1-0-2125efa016ef@flygoat.com/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/log/
[3]: https://lore.kernel.org/lkml/20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com/
[4]: https://lore.kernel.org/lkml/20240224-dt-bindings-hwmon-common-v2-0-b446eecf5480@linaro.org/
[5]: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=hwmon-next

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
      dt-bindings: hwmon: lm75: use common hwmon schema
      i2c: nomadik: rename private struct pointers from dev to priv
      i2c: nomadik: simplify IRQ masking logic
      i2c: nomadik: use bitops helpers
      i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
      i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
      i2c: nomadik: fetch i2c-transfer-timeout-us property from devicetree
      i2c: nomadik: support Mobileye EyeQ5 I2C controller
      MIPS: mobileye: eyeq5: add 5 I2C controller nodes
      MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor

 Documentation/devicetree/bindings/hwmon/lm75.yaml  |   3 +-
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    |  48 +-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |   8 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  75 +++
 drivers/i2c/busses/i2c-nomadik.c                   | 720 ++++++++++++---------
 5 files changed, 541 insertions(+), 313 deletions(-)
---
base-commit: a6cc37d1a531e1c99e7989001a0529b443397900
change-id: 20231023-mbly-i2c-7c2fbbb1299f

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


