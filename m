Return-Path: <linux-i2c+bounces-6770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD2979BAF
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 08:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62AE71C229C8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198FA12E1CA;
	Mon, 16 Sep 2024 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcoUjVco"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC079F0;
	Mon, 16 Sep 2024 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469880; cv=none; b=o9AD5aV0M5FCXdQFaPXSwHdfo8wc4zIRQ7vRoVaVlJzy9Dapsl3j4rOjnnhKWx7lmnetNcEDdoIME5YCcl7kdT23P2mu17EK2vVUr+iPcSBYNgWQA+3MxBRjI/xj0DGYeuv7b8FKSiJJgCFT9o/fn5a8Ne5NGWccEmU080l/9yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469880; c=relaxed/simple;
	bh=JCKNWFzmt2i3PhRb8Uefys79cqhlCPcj00OQf7xe/V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SV16NJOVkI2HqoqH+ihXgpK1mjF8xxEv/r5PDPxVo5TXyIMHLQsdubuZaFMdx5w/IAdqJ46H6PDkNuE+J3iqGLbfd4L5iN27J0TllKNgi5DLoocr/H5lJ2YVDb6fAf8qwgJa5l09Rrvd845KT96V2I18yzZOk8U+pbvE/pDGCGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcoUjVco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C86C4CEC4;
	Mon, 16 Sep 2024 06:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726469880;
	bh=JCKNWFzmt2i3PhRb8Uefys79cqhlCPcj00OQf7xe/V8=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=HcoUjVcoO4MA8cNlwfCYQro/lb6zb7K2yE/k/bbGhYfPILjyVtv4DtLYsNIUKHa23
	 vHVQD9UIJaRKUgNQogR8XiyVdIvnRpY3/S3PUXtTa7atMLjTT3wvggYrf/J66mML/G
	 DkLoVGV1QUhaHzFcXmMNLWqkYyCouaLlY9Hm6JSkIDWLutEDokxnFmcpORx6pGw+NH
	 QBOy0s5vd2017LpiEDA9y9fKrUzVeOZ2oja1TyAAY4a57sUX+KB7pM/zZPl9HkofzC
	 bi8iy+2HNgWUB1JHPkmEckL1T+3gLPArh7rZBUs5RVF5XIfX83P8p8afrjRU5KBS75
	 Jox/UgqaB79sw==
Message-ID: <f2fb3b68-4037-4f27-81c6-a1343b5d4f49@kernel.org>
Date: Mon, 16 Sep 2024 08:57:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] Adding support of ADI ARMv8 ADSP-SC598 SoC.
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, soc@kernel.org,
 linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Greg Malysa <greg.malysa@timesys.com>,
 Will Deacon <will@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Utsav Agarwal <Utsav.Agarwal@analog.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, adsp-linux@analog.com,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <172617500940.774816.11284671975335527090.robh@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <172617500940.774816.11284671975335527090.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 23:04, Rob Herring (Arm) wrote:
> 
> On Thu, 12 Sep 2024 19:24:45 +0100, Arturs Artamonovs wrote:
>> This set of patches based on ADI fork of Linux Kerenl that support family of ADSP-SC5xx
>> SoC's and used by customers for some time . Patch series contains minimal set
>> of changes to add ADSP-SC598 support to upstream kernel. This series include
>> UART,I2C,IRQCHIP,RCU drivers and device-tree to be able boot on EV-SC598-SOM
>> board into serial shell and able to reset the board. Current SOM board
>> requires I2C expander to enable UART output.
>>
>> UART,I2C and PINCTRL drivers are based on old Blackfin drivers with
>> ADSP-SC5xx related bug fixes and improvments.
>>
>> Signed-off-by: Arturs Artamonovs <arturs.artamonovs@analog.com>
>> ---
>> Arturs Artamonovs (21):
>>       arm64: Add ADI ADSP-SC598 SoC
>>       reset: Add driver for ADI ADSP-SC5xx reset controller
>>       dt-bindigs: arm64: adi,sc598 bindings
>>       dt-bindings: arm64: adi,sc598: Add ADSP-SC598 SoC bindings
>>       clock:Add driver for ADI ADSP-SC5xx PLL
>>       include: dt-binding: clock: add adi clock header file
>>       clock: Add driver for ADI ADSP-SC5xx clock
>>       dt-bindings: clock: adi,sc5xx-clocks: add bindings
>>       gpio: add driver for ADI ADSP-SC5xx platform
>>       dt-bindings: gpio: adi,adsp-port-gpio: add bindings
>>       irqchip: Add irqchip for ADI ADSP-SC5xx platform
>>       dt-bindings: irqchip: adi,adsp-pint: add binding
>>       pinctrl: Add drivers for ADI ADSP-SC5xx platform
>>       dt-bindings: pinctrl: adi,adsp-pinctrl: add bindings
>>       i2c: Add driver for ADI ADSP-SC5xx platforms
>>       dt-bindings: i2c: add i2c/twi driver documentation
>>       serial: adi,uart: Add driver for ADI ADSP-SC5xx
>>       dt-bindings: serial: adi,uart4: add adi,uart4 driver documentation
>>       arm64: dts: adi: sc598: add device tree
>>       arm64: defconfig: sc598 add minimal changes
>>       MAINTAINERS: add adi sc5xx maintainers
>>
>>  .../devicetree/bindings/arm/analog/adi,sc5xx.yaml  |   24 +
>>  .../bindings/clock/adi,sc5xx-clocks.yaml           |   65 ++
>>  .../bindings/gpio/adi,adsp-port-gpio.yaml          |   69 ++
>>  Documentation/devicetree/bindings/i2c/adi,twi.yaml |   71 ++
>>  .../interrupt-controller/adi,adsp-pint.yaml        |   51 +
>>  .../bindings/pinctrl/adi,adsp-pinctrl.yaml         |   83 ++
>>  .../devicetree/bindings/serial/adi,uart.yaml       |   85 ++
>>  .../bindings/soc/adi/adi,reset-controller.yaml     |   38 +
>>  MAINTAINERS                                        |   22 +
>>  arch/arm64/Kconfig.platforms                       |   13 +
>>  arch/arm64/boot/dts/Makefile                       |    1 +
>>  arch/arm64/boot/dts/adi/Makefile                   |    2 +
>>  arch/arm64/boot/dts/adi/sc598-som-ezkit.dts        |   14 +
>>  arch/arm64/boot/dts/adi/sc598-som.dtsi             |   58 ++
>>  arch/arm64/boot/dts/adi/sc59x-64.dtsi              |  367 +++++++
>>  arch/arm64/configs/defconfig                       |    6 +
>>  drivers/clk/Kconfig                                |    9 +
>>  drivers/clk/Makefile                               |    1 +
>>  drivers/clk/adi/Makefile                           |    4 +
>>  drivers/clk/adi/clk-adi-pll.c                      |  151 +++
>>  drivers/clk/adi/clk-adi-sc598.c                    |  329 ++++++
>>  drivers/clk/adi/clk.h                              |   99 ++
>>  drivers/gpio/Kconfig                               |    8 +
>>  drivers/gpio/Makefile                              |    1 +
>>  drivers/gpio/gpio-adi-adsp-port.c                  |  145 +++
>>  drivers/i2c/busses/Kconfig                         |   17 +
>>  drivers/i2c/busses/Makefile                        |    1 +
>>  drivers/i2c/busses/i2c-adi-twi.c                   |  940 ++++++++++++++++++
>>  drivers/irqchip/Kconfig                            |    9 +
>>  drivers/irqchip/Makefile                           |    2 +
>>  drivers/irqchip/irq-adi-adsp.c                     |  310 ++++++
>>  drivers/pinctrl/Kconfig                            |   12 +
>>  drivers/pinctrl/Makefile                           |    1 +
>>  drivers/pinctrl/pinctrl-adsp.c                     |  919 +++++++++++++++++
>>  drivers/reset/Makefile                             |    1 +
>>  drivers/soc/Makefile                               |    1 +
>>  drivers/soc/adi/Makefile                           |    5 +
>>  drivers/soc/adi/system.c                           |  257 +++++
>>  drivers/tty/serial/Kconfig                         |   19 +-
>>  drivers/tty/serial/Makefile                        |    1 +
>>  drivers/tty/serial/adi_uart.c                      | 1045 ++++++++++++++++++++
>>  include/dt-bindings/clock/adi-sc5xx-clock.h        |   93 ++
>>  include/dt-bindings/pinctrl/adi-adsp.h             |   19 +
>>  include/linux/soc/adi/adsp-gpio-port.h             |   85 ++
>>  include/linux/soc/adi/cpu.h                        |  107 ++
>>  include/linux/soc/adi/rcu.h                        |   55 ++
>>  include/linux/soc/adi/sc59x.h                      |  147 +++
>>  include/linux/soc/adi/system_config.h              |   65 ++
>>  include/uapi/linux/serial_core.h                   |    3 +
>>  49 files changed, 5829 insertions(+), 1 deletion(-)
>> ---
>> base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
>> change-id: 20240909-test-8ec5f76fe6d2
>>
>> Best regards,
>> --
>> Arturs Artamonovs <arturs.artamonovs@analog.com>
>>
>>
>>
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y adi/sc598-som-ezkit.dtb' for 20240912-test-v1-0-458fa57c8ccf@analog.com:
> 
> arch/arm64/boot/dts/adi/sc598-som-ezkit.dtb: /scb-bus/sec@31089000: failed to match any schema with compatible: ['adi,system-event-controller']

This must be addressed and fixed.

Best regards,
Krzysztof


