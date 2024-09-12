Return-Path: <linux-i2c+bounces-6658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C61AB97734D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 23:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C01E28390C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 21:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6DF1C233C;
	Thu, 12 Sep 2024 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBE3GJ3P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0C19E96A;
	Thu, 12 Sep 2024 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726175070; cv=none; b=TGzopXf01w3OnGw3g6ykfg/KEhvEyOek6jkZY9BRCM9Fz09VL/J904vGJZuNcTtJSRNkS7+Koqx6gBpqzRa8sRSZLF2HLUBbYRP6E1pUeDFxc5UzvTcVAybFR6S8nAtticEHUjv76ZX7+48j0gIu9Q00HwWe3vIbcZlh/dCP9z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726175070; c=relaxed/simple;
	bh=cRVDHFSUybvmScJCn1XhuLmNJDXhvWTEUpsVyK4kqyE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=klOTr7sHLK7mrzq9nMpi7sQgDrertFGXpvq+WjgTCnglek/bCSnrW9/JPz7q2C6Hs2B11n4tTSrocycTqIdbRFsFCVVPjXPyR08qKvElPzT0GUuX4syvTGtORZeaihGWz+DDjrW46qra+FfSmkf+Hv9M2jDzqhj/IRFex1dYzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBE3GJ3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AE8C4CEC5;
	Thu, 12 Sep 2024 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726175070;
	bh=cRVDHFSUybvmScJCn1XhuLmNJDXhvWTEUpsVyK4kqyE=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=NBE3GJ3P+HfVh5nFD9mdRfCBIGbePIgWdRB7oE2lRaRaVXEuY7PRweuhReFfKt8xg
	 UZXLR078rKhPxeQhm8wYy064LRPany8U6zTjOeBgmXfPZ58hZ8q01bQyhtJa2Qbf5y
	 c+0E5yyvv/ZtqfB1JOzQqXxSa7egdKvEnotfotu2pc4xNYo35uc2ZTgsz8niHpHR3e
	 YjQmT3ERZWLxYKzwZGzkLJwkdEvGiJt5ei1Kgae++5KSGy6FR4nDsgJq7s+ELvHhcW
	 PV6XdZ0V48nEUDH5yql/1gzBFourFYB3Dl8NYp6r+O+ki5IUxY/ZxRtvo7m5/OEaeI
	 +6UlbPhf6UgWw==
Date: Thu, 12 Sep 2024 16:04:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arturs Artamonovs <arturs.artamonovs@analog.com>
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, soc@kernel.org, 
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Arturs Artamonovs <Arturs.Artamonovs@analog.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 Greg Malysa <greg.malysa@timesys.com>, Will Deacon <will@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Utsav Agarwal <Utsav.Agarwal@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, adsp-linux@analog.com, 
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
Message-Id: <172617500940.774816.11284671975335527090.robh@kernel.org>
Subject: Re: [PATCH 00/21] Adding support of ADI ARMv8 ADSP-SC598 SoC.


On Thu, 12 Sep 2024 19:24:45 +0100, Arturs Artamonovs wrote:
> This set of patches based on ADI fork of Linux Kerenl that support family of ADSP-SC5xx
> SoC's and used by customers for some time . Patch series contains minimal set
> of changes to add ADSP-SC598 support to upstream kernel. This series include
> UART,I2C,IRQCHIP,RCU drivers and device-tree to be able boot on EV-SC598-SOM
> board into serial shell and able to reset the board. Current SOM board
> requires I2C expander to enable UART output.
> 
> UART,I2C and PINCTRL drivers are based on old Blackfin drivers with
> ADSP-SC5xx related bug fixes and improvments.
> 
> Signed-off-by: Arturs Artamonovs <arturs.artamonovs@analog.com>
> ---
> Arturs Artamonovs (21):
>       arm64: Add ADI ADSP-SC598 SoC
>       reset: Add driver for ADI ADSP-SC5xx reset controller
>       dt-bindigs: arm64: adi,sc598 bindings
>       dt-bindings: arm64: adi,sc598: Add ADSP-SC598 SoC bindings
>       clock:Add driver for ADI ADSP-SC5xx PLL
>       include: dt-binding: clock: add adi clock header file
>       clock: Add driver for ADI ADSP-SC5xx clock
>       dt-bindings: clock: adi,sc5xx-clocks: add bindings
>       gpio: add driver for ADI ADSP-SC5xx platform
>       dt-bindings: gpio: adi,adsp-port-gpio: add bindings
>       irqchip: Add irqchip for ADI ADSP-SC5xx platform
>       dt-bindings: irqchip: adi,adsp-pint: add binding
>       pinctrl: Add drivers for ADI ADSP-SC5xx platform
>       dt-bindings: pinctrl: adi,adsp-pinctrl: add bindings
>       i2c: Add driver for ADI ADSP-SC5xx platforms
>       dt-bindings: i2c: add i2c/twi driver documentation
>       serial: adi,uart: Add driver for ADI ADSP-SC5xx
>       dt-bindings: serial: adi,uart4: add adi,uart4 driver documentation
>       arm64: dts: adi: sc598: add device tree
>       arm64: defconfig: sc598 add minimal changes
>       MAINTAINERS: add adi sc5xx maintainers
> 
>  .../devicetree/bindings/arm/analog/adi,sc5xx.yaml  |   24 +
>  .../bindings/clock/adi,sc5xx-clocks.yaml           |   65 ++
>  .../bindings/gpio/adi,adsp-port-gpio.yaml          |   69 ++
>  Documentation/devicetree/bindings/i2c/adi,twi.yaml |   71 ++
>  .../interrupt-controller/adi,adsp-pint.yaml        |   51 +
>  .../bindings/pinctrl/adi,adsp-pinctrl.yaml         |   83 ++
>  .../devicetree/bindings/serial/adi,uart.yaml       |   85 ++
>  .../bindings/soc/adi/adi,reset-controller.yaml     |   38 +
>  MAINTAINERS                                        |   22 +
>  arch/arm64/Kconfig.platforms                       |   13 +
>  arch/arm64/boot/dts/Makefile                       |    1 +
>  arch/arm64/boot/dts/adi/Makefile                   |    2 +
>  arch/arm64/boot/dts/adi/sc598-som-ezkit.dts        |   14 +
>  arch/arm64/boot/dts/adi/sc598-som.dtsi             |   58 ++
>  arch/arm64/boot/dts/adi/sc59x-64.dtsi              |  367 +++++++
>  arch/arm64/configs/defconfig                       |    6 +
>  drivers/clk/Kconfig                                |    9 +
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/adi/Makefile                           |    4 +
>  drivers/clk/adi/clk-adi-pll.c                      |  151 +++
>  drivers/clk/adi/clk-adi-sc598.c                    |  329 ++++++
>  drivers/clk/adi/clk.h                              |   99 ++
>  drivers/gpio/Kconfig                               |    8 +
>  drivers/gpio/Makefile                              |    1 +
>  drivers/gpio/gpio-adi-adsp-port.c                  |  145 +++
>  drivers/i2c/busses/Kconfig                         |   17 +
>  drivers/i2c/busses/Makefile                        |    1 +
>  drivers/i2c/busses/i2c-adi-twi.c                   |  940 ++++++++++++++++++
>  drivers/irqchip/Kconfig                            |    9 +
>  drivers/irqchip/Makefile                           |    2 +
>  drivers/irqchip/irq-adi-adsp.c                     |  310 ++++++
>  drivers/pinctrl/Kconfig                            |   12 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-adsp.c                     |  919 +++++++++++++++++
>  drivers/reset/Makefile                             |    1 +
>  drivers/soc/Makefile                               |    1 +
>  drivers/soc/adi/Makefile                           |    5 +
>  drivers/soc/adi/system.c                           |  257 +++++
>  drivers/tty/serial/Kconfig                         |   19 +-
>  drivers/tty/serial/Makefile                        |    1 +
>  drivers/tty/serial/adi_uart.c                      | 1045 ++++++++++++++++++++
>  include/dt-bindings/clock/adi-sc5xx-clock.h        |   93 ++
>  include/dt-bindings/pinctrl/adi-adsp.h             |   19 +
>  include/linux/soc/adi/adsp-gpio-port.h             |   85 ++
>  include/linux/soc/adi/cpu.h                        |  107 ++
>  include/linux/soc/adi/rcu.h                        |   55 ++
>  include/linux/soc/adi/sc59x.h                      |  147 +++
>  include/linux/soc/adi/system_config.h              |   65 ++
>  include/uapi/linux/serial_core.h                   |    3 +
>  49 files changed, 5829 insertions(+), 1 deletion(-)
> ---
> base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
> change-id: 20240909-test-8ec5f76fe6d2
> 
> Best regards,
> --
> Arturs Artamonovs <arturs.artamonovs@analog.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y adi/sc598-som-ezkit.dtb' for 20240912-test-v1-0-458fa57c8ccf@analog.com:

arch/arm64/boot/dts/adi/sc598-som-ezkit.dtb: /scb-bus/sec@31089000: failed to match any schema with compatible: ['adi,system-event-controller']






