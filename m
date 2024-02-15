Return-Path: <linux-i2c+bounces-1750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D126B856A10
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11518B22C0E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549F7136989;
	Thu, 15 Feb 2024 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jtRPtvNb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC61135A69;
	Thu, 15 Feb 2024 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015959; cv=none; b=ntSoplI8ZbvLiLNj5dxpP5Q7XRJMr0ykUWScXooa6h9pWTsrMebalIVH8p0UEF8j5C8GTl0sptIAaqu41xGw19+ero2A28kBSQV7L+nr1ZCy9yw/opEjS/673OcDr/CBlipyFYeiWHXbzFAM1fMi3ZsMfpi+N5TONK7QKN2X0yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015959; c=relaxed/simple;
	bh=uz+Np8+G4qWw8PU0VSBJNfx1oM1lJAFehJiEej4mz+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LZOe9xyq8VaKynrlMAj0g8i7GCtf3E4Vy9M/zagA9SwUeypNyonlmmYsoXno7ErZAbTsWMujpFjFDPIM5gVBOXfLmqeyCsPoc/o0eZw4yYjxcI4zauXKcTjD5/ITS+6wvIjj24GVbk3lG+rrs+ovCP4JneLD+UtAIqTGmcRVkek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jtRPtvNb; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDF77E0011;
	Thu, 15 Feb 2024 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jQzNaC4fbX9njWrN3MZ96SWXHEvPGyukJ/MJUgb0Ufw=;
	b=jtRPtvNbikaavwuAwhIXCTXCvi72i/3fzBPBJgxgqtcU72jRmj4Gnvu88GQzqS5ktzDtUv
	Szm8DiTfA/Jgk2Q8EZb86VnPARemwTMraYVwkBLbfapJA9fQhOV5QIPDaVtn2LSF3k42Fn
	JPpRIVV5cGmnmJKfdMRzurQuzVBb853IcPg03oiVTAryYNZ/p0DrgWgGaQoyiuTtH9Ir5m
	kAtEhNWN3ap9+kCzJVnild5PYp5M974xw67+I3X25MV7QiYnUxzTmOdyJYLI5wiDq2OPha
	lqmeQFwK0crtd7nRXenqGH4Pex8d9fqvPEYTgRyqmDuDjS+CNTQVzf69px69Iw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 00/13] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
Date: Thu, 15 Feb 2024 17:52:07 +0100
Message-Id: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADhBzmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDINbNTcqp1M00StY1TzZKS0pKMjSytExTAiovKEpNy6wAGxUdW1sLAHn
 jwDRaAAAA
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
X-Mailer: b4 0.12.4
X-GND-Sasl: theo.lebrun@bootlin.com

Hi,

This series adds two tangent features to the Nomadik I2C controller:

 - Add a new compatible to support Mobileye EyeQ5 which uses the same IP
   block as Nomadik.

   It has two quirks to be handled:
    - The memory bus only supports 32-bit accesses. A writeb() is used
      which we avoid.
    - We must write a value into a shared register region (OLB, "Other
      Logic Block") depending on the I2C bus speed.

 - Allow xfer timeouts below one jiffy by using a workqueue and hrtimers
   instead of a completion.

   The situation to be addressed is:
    - Many devices on the same I2C bus.
    - One xfer to each device is sent at regular interval.
    - One device gets stuck and does not answer.
    - With long timeouts, following devices won't get their message. A
      shorter timeout ensures we can still talk to the following
      devices.

   This clashes a bit with the current i2c_adapter timeout field that
   stores a jiffies amount. We cannot rely on it and therefore we take
   a value from devicetree as a µs value. If the timeout is less than a
   jiffy duration, we switch from standard jiffies timeout to
   hrtimers.

There is one patch targeting a hwmon dt-bindings file:
Documentation/devicetree/bindings/hwmon/lm75.yaml. The rest is touching
the I2C bus driver, its bindings and platform devicetrees.

About dependencies:
 - The series is based upon v6.8-rc4.
 - For testing on EyeQ5 hardware and devicetree patches, we need the
   base platform series from Grégory [0].
 - The last commit (adding DT phandles for resets), we need the syscon
   series [1] that provides the reset controller node.

I think there are discussions to be had about:

 - The handling of timeouts. Having a non-jiffy value is not driver
   specific. Should this change be done at the subsystem layer? The
   subsystem could even fetch the value from devicetree and auto-fill
   timeout, with a default given by the driver. Not many drivers seem
   to use the i2c_adapter timeout field from my quick grepping.

 - The DT prop for timeout. I've picked "timeout-usecs". Some drivers
   use vendor prefixes, but this is not vendor-specific and only a
   software implementation detail.

 - The shape of this series. Initially it was split in two. However I
   brought them together as they cannot be applied independently.
   Please tell me if a better approach is to be preferred.

Those are thoughts, I'm sure people will have feedback on this.

Have a nice day,
Théo Lebrun

[0]: https://lore.kernel.org/lkml/20240205153503.574468-1-gregory.clement@bootlin.com/
[1]: https://lore.kernel.org/lkml/20240212-mbly-clk-v6-0-c46fa1f93839@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (13):
      dt-bindings: i2c: nomadik: add timeout-usecs property bindings
      dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c bindings and example
      dt-bindings: hwmon: lm75: add label property
      i2c: nomadik: rename private struct pointers from dev to priv
      i2c: nomadik: simplify IRQ masking logic
      i2c: nomadik: use bitops helpers
      i2c: nomadik: support short xfer timeouts using waitqueue & hrtimer
      i2c: nomadik: replace jiffies by ktime for FIFO flushing timeout
      i2c: nomadik: fetch timeout-usecs property from devicetree
      i2c: nomadik: support Mobileye EyeQ5 I2C controller
      MIPS: mobileye: eyeq5: add 5 I2C controller nodes
      MIPS: mobileye: eyeq5: add evaluation board I2C temp sensor
      MIPS: mobileye: eyeq5: add resets to I2C controllers

 Documentation/devicetree/bindings/hwmon/lm75.yaml  |   4 +
 .../devicetree/bindings/i2c/st,nomadik-i2c.yaml    |  49 +-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         |   8 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  75 +++
 drivers/i2c/busses/i2c-nomadik.c                   | 710 ++++++++++++---------
 5 files changed, 534 insertions(+), 312 deletions(-)
---
base-commit: d55aa725e32849f709b61eab3b7a50b810a71a84
change-id: 20231023-mbly-i2c-7c2fbbb1299f

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


