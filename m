Return-Path: <linux-i2c+bounces-6633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F3977047
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 972CB1F23968
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF451C0DDB;
	Thu, 12 Sep 2024 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPsmgtEM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D08156F44;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726165215; cv=none; b=ZNEKBiFfRkqaizsiQhkCCdLOm7UASt4bPtmFUpLoid63ZK3HA7xYs0wC4pvuixtx0TX7J9JUmo7NGcgfReionkTjrfh4JmBUhC0xLgMnczuiFUZq5GsBvKZDbOYF/obEGzgR2fg+w0olCGyYqGtZxu9ccsjUr2yATV2C/wtXA7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726165215; c=relaxed/simple;
	bh=w0yUEeGO5zWa5Zok2P2rOyXgtDKvVgmOUJ+a/Az1hj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IjQ4CC9l+6npKfeG9EA6qDO0rYNXR+VP71G/IbfS2rQ+MbBjVBIc0X5Mdb19EyUEO/mlV3O9U1vJQxYhjBydjEG0MnT7rWGNeXgTwoYyI6Ta7V17qhdSdbponnvU9R782VRkDhMxDmKjNcAQzRO2dVOYrv5u75n7fT08u5lKtxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPsmgtEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1314C4CEC3;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726165214;
	bh=w0yUEeGO5zWa5Zok2P2rOyXgtDKvVgmOUJ+a/Az1hj4=;
	h=From:Subject:Date:List-Id:To:Cc:Reply-To:From;
	b=CPsmgtEMMAtyNjuTtYzJv2ymvFQzEQ0PP4IxrBdr25a91/xfA+vLhNsSL+sUbEenZ
	 pnswG6UKzPGA3YNk0qQSUQCjyTyrSSHYiRpO5q6F/kJ4uTcf4RAHSqE1IviTh391YH
	 LKwVAYm+pHsrWoYTohF3ihvZtSMZZl2stoW3B9u1nAmd+ymbmPPmHRjZ2ixy5YTA5g
	 29/F5vNMp75kXNPU1jh5NV0QUUrwuLjW4nf/0ah2QpS+z28d2jKOzGh8ljkpwWfo+Z
	 okGMUadVfBH17b24RjwzDTPHAc88HGbAbD3zk/VmYj0a/3gErJdJXm9vc/gOPciRmZ
	 DM5sYzwjSuwLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9552CEED61F;
	Thu, 12 Sep 2024 18:20:14 +0000 (UTC)
From: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>
Subject: [PATCH 00/21] Adding support of ADI ARMv8 ADSP-SC598 SoC.
Date: Thu, 12 Sep 2024 19:24:45 +0100
Message-Id: <20240912-test-v1-0-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0x42YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNL3ZLU4hJdi9Rk0zRzs7RUsxQjJaDSgqLUtMwKsDHRsbW1ACfUB0l
 WAAAA
X-Change-ID: 20240909-test-8ec5f76fe6d2
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
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726165513; l=5160;
 i=arturs.artamonovs@analog.com; s=20240909; h=from:subject:message-id;
 bh=w0yUEeGO5zWa5Zok2P2rOyXgtDKvVgmOUJ+a/Az1hj4=;
 b=zbt6V9124O55F0SjvPefnGSMeoqnQ6n0nQAX5r5d9ePtZmwiyfZElo/Gxg9IU9a3CrDXAI7ll
 FFhs3bUdzCqBvTjA8ZWx3jPfHROQJaT88gsBroCxlNiuQ/0z7ZsVUF8
X-Developer-Key: i=arturs.artamonovs@analog.com; a=ed25519;
 pk=UXODIid/MrmBXvqkX4PeEfetDaNAw9xKMINHIc5oZCk=
X-Endpoint-Received: by B4 Relay for arturs.artamonovs@analog.com/20240909
 with auth_id=206
X-Original-From: Arturs Artamonovs <arturs.artamonovs@analog.com>
Reply-To: arturs.artamonovs@analog.com

This set of patches based on ADI fork of Linux Kerenl that support family of ADSP-SC5xx
SoC's and used by customers for some time . Patch series contains minimal set
of changes to add ADSP-SC598 support to upstream kernel. This series include
UART,I2C,IRQCHIP,RCU drivers and device-tree to be able boot on EV-SC598-SOM
board into serial shell and able to reset the board. Current SOM board
requires I2C expander to enable UART output.

UART,I2C and PINCTRL drivers are based on old Blackfin drivers with
ADSP-SC5xx related bug fixes and improvments.

Signed-off-by: Arturs Artamonovs <arturs.artamonovs@analog.com>
---
Arturs Artamonovs (21):
      arm64: Add ADI ADSP-SC598 SoC
      reset: Add driver for ADI ADSP-SC5xx reset controller
      dt-bindigs: arm64: adi,sc598 bindings
      dt-bindings: arm64: adi,sc598: Add ADSP-SC598 SoC bindings
      clock:Add driver for ADI ADSP-SC5xx PLL
      include: dt-binding: clock: add adi clock header file
      clock: Add driver for ADI ADSP-SC5xx clock
      dt-bindings: clock: adi,sc5xx-clocks: add bindings
      gpio: add driver for ADI ADSP-SC5xx platform
      dt-bindings: gpio: adi,adsp-port-gpio: add bindings
      irqchip: Add irqchip for ADI ADSP-SC5xx platform
      dt-bindings: irqchip: adi,adsp-pint: add binding
      pinctrl: Add drivers for ADI ADSP-SC5xx platform
      dt-bindings: pinctrl: adi,adsp-pinctrl: add bindings
      i2c: Add driver for ADI ADSP-SC5xx platforms
      dt-bindings: i2c: add i2c/twi driver documentation
      serial: adi,uart: Add driver for ADI ADSP-SC5xx
      dt-bindings: serial: adi,uart4: add adi,uart4 driver documentation
      arm64: dts: adi: sc598: add device tree
      arm64: defconfig: sc598 add minimal changes
      MAINTAINERS: add adi sc5xx maintainers

 .../devicetree/bindings/arm/analog/adi,sc5xx.yaml  |   24 +
 .../bindings/clock/adi,sc5xx-clocks.yaml           |   65 ++
 .../bindings/gpio/adi,adsp-port-gpio.yaml          |   69 ++
 Documentation/devicetree/bindings/i2c/adi,twi.yaml |   71 ++
 .../interrupt-controller/adi,adsp-pint.yaml        |   51 +
 .../bindings/pinctrl/adi,adsp-pinctrl.yaml         |   83 ++
 .../devicetree/bindings/serial/adi,uart.yaml       |   85 ++
 .../bindings/soc/adi/adi,reset-controller.yaml     |   38 +
 MAINTAINERS                                        |   22 +
 arch/arm64/Kconfig.platforms                       |   13 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/adi/Makefile                   |    2 +
 arch/arm64/boot/dts/adi/sc598-som-ezkit.dts        |   14 +
 arch/arm64/boot/dts/adi/sc598-som.dtsi             |   58 ++
 arch/arm64/boot/dts/adi/sc59x-64.dtsi              |  367 +++++++
 arch/arm64/configs/defconfig                       |    6 +
 drivers/clk/Kconfig                                |    9 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/adi/Makefile                           |    4 +
 drivers/clk/adi/clk-adi-pll.c                      |  151 +++
 drivers/clk/adi/clk-adi-sc598.c                    |  329 ++++++
 drivers/clk/adi/clk.h                              |   99 ++
 drivers/gpio/Kconfig                               |    8 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-adi-adsp-port.c                  |  145 +++
 drivers/i2c/busses/Kconfig                         |   17 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-adi-twi.c                   |  940 ++++++++++++++++++
 drivers/irqchip/Kconfig                            |    9 +
 drivers/irqchip/Makefile                           |    2 +
 drivers/irqchip/irq-adi-adsp.c                     |  310 ++++++
 drivers/pinctrl/Kconfig                            |   12 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-adsp.c                     |  919 +++++++++++++++++
 drivers/reset/Makefile                             |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/adi/Makefile                           |    5 +
 drivers/soc/adi/system.c                           |  257 +++++
 drivers/tty/serial/Kconfig                         |   19 +-
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/adi_uart.c                      | 1045 ++++++++++++++++++++
 include/dt-bindings/clock/adi-sc5xx-clock.h        |   93 ++
 include/dt-bindings/pinctrl/adi-adsp.h             |   19 +
 include/linux/soc/adi/adsp-gpio-port.h             |   85 ++
 include/linux/soc/adi/cpu.h                        |  107 ++
 include/linux/soc/adi/rcu.h                        |   55 ++
 include/linux/soc/adi/sc59x.h                      |  147 +++
 include/linux/soc/adi/system_config.h              |   65 ++
 include/uapi/linux/serial_core.h                   |    3 +
 49 files changed, 5829 insertions(+), 1 deletion(-)
---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240909-test-8ec5f76fe6d2

Best regards,
-- 
Arturs Artamonovs <arturs.artamonovs@analog.com>



