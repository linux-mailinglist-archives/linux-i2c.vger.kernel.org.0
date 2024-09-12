Return-Path: <linux-i2c+bounces-6653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6AB9770B1
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4451F28330
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295C71C3F15;
	Thu, 12 Sep 2024 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwEi/qWy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E11C32EA;
	Thu, 12 Sep 2024 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165218; cv=none; b=gAnPaPWwZUEWrw932WlS5BvmAih2KLWESRfMkqztd7HVEcIiB2hddCpyQFrmbB/kFuuFDJ7VOOgibVKrmub55PJLOm7jL1e9U8v/uNiDord4udJcdq2xXNiHFHq7PNJTnYMomoXgll6CS0uyHRWolOkNshQq0WL3f59zsx7mtRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165218; c=relaxed/simple;
	bh=jlvQUaKEx+59D4zMJ2VEo/4rnH6uQhVLJwiDjIYuoc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRTmgL88ZeUgiedCxQNm6KWAAkerGih7ClcAaBmtt87rp8DpjYu8JWT3a7Ti11HnJyqoZi2+gwG+YstJsh14rS9uD+PNHhX2kGNFGeVzj4g47nGqTXGm+xg+8NRZ9OqdHli3zCjvUK0+xESBPDgKFml7Fe6ExSRAcJQy0/vy4dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwEi/qWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8BEAC4CEE3;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165216;
	bh=jlvQUaKEx+59D4zMJ2VEo/4rnH6uQhVLJwiDjIYuoc8=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=YwEi/qWyNVN03erS9kYbYazeMREWmBKVEmXOBTumGhNZ1nMji0X0pt6foalxNjUBI
	 NzOEj0z6eaBJeGDgdEIL+5Oq36IO4v1G+Bm5PW+CFi3UF7bvJaprD5HsHLJ7WFIjhU
	 vOcavCR98i2SS2fiSqMhlq4ixsMM8ToWaRxpE6N0REgWw3wkymsTq2KiDLwH5kfNIS
	 LE5b9T1EzXe9ggaM5DHcIRcFBAlBv9N1zI0xBQI4LsFncxwJgD+Nntor+3fWpwwmRp
	 YtzL9fLQb39TsDpoqd8lFJKofQzcbz9otwNikSSYz0XEIEVeNtmSxyIKi5KCD9EcP4
	 Q+fd5UAjEoF0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FC4EEE266;
	Thu, 12 Sep 2024 18:20:16 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Date: Thu, 12 Sep 2024 19:25:06 +0100
Subject: [PATCH 21/21] MAINTAINERS: add adi sc5xx maintainers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240912-test-v1-21-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, adsp-linux@analog.com, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=1504;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=ZX6op8Gl0ef751bz5sRIH6+njR4ucuUIQX34HP/CQPA=;
 b=pw/W2wutLhh9kjOUSW6Xi3shvGEIMdgfhziVLJ7XQep5S3spWFWEsh5/dHPurSL35z/aVl4R/
 CbMlfycTJiNBWb3FgLJgU0x5+zMcX0/B+lU1ZvH6q/u84D7efC3RSP0
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

From: Arturs Artamonovs <arturs.artamonovs@analog.com>

Add ADSP-SC598 maitaniners

Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10430778c998b57944c1a6c5f07d676127e47faa..a838a5392321602034755fafed720f68d3798c0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1934,6 +1934,28 @@ S:	Odd Fixes
 F:	arch/arm/boot/dts/airoha/
 F:	arch/arm64/boot/dts/airoha/
 
+ARM/ADI SoC Support
+M:	Arturs Artamonovs <arturs.artamonovs@analog.com>
+M:	Greg Malysa <greg.malysa@timesys.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/analog/adi,sc5xx.yaml
+F:	Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml
+F:	Documentation/devicetree/bindings/gpio/adi,adsp-port-gpio.yaml
+F:	Documentation/devicetree/bindings/i2c/adi,twi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/adi,adsp-pint.yaml
+F:	Documentation/devicetree/bindings/pinctrl/adi,adsp-pinctrl.yaml
+F:	Documentation/devicetree/bindings/serial/adi,uart.yaml
+F:	Documentation/devicetree/bindings/serial/adi,uart.yaml
+F:	Documentation/devicetree/bindings/soc/adi/*
+F:	arch/arm64/boot/dts/adi/*
+F:	drivers/clk/adi/*
+F:	drivers/gpio/gpio-adi-adsp-port.c
+F:	drivers/i2c/busses/i2c-adi-twi.c
+F:	drivers/irqchip/irq-adi-adsp.c
+F:	drivers/soc/adi/*
+F:	drivers/tty/serial/adi_uart.c
+
+
 ARM/Allwinner SoC Clock Support
 M:	Emilio López <emilio@elopez.com.ar>
 S:	Maintained

-- 
2.25.1



