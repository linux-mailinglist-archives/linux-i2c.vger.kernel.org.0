Return-Path: <linux-i2c+bounces-2092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1486DFAD
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 11:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CE8A286A12
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 10:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E4A6BFCB;
	Fri,  1 Mar 2024 10:53:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261246BFA4;
	Fri,  1 Mar 2024 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709290410; cv=none; b=KjyFmVZfTyuQb0Z1cRiEC7k9nrSGrFIsMPODHhVudvpmv1a5cAR+UVQn0oGE8RK+/S78cNtszJqfDh3BxQlgHTkzEQnYaBubGiDvkwKPz9edoJcYHyTfnyX57T1ioFRGCht3bOKej8VsoJHVmjZ/jlurh0pmhi2SRLiNhp7GBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709290410; c=relaxed/simple;
	bh=t4ccu+GWe684aqIDSKF9bD//mn+pVsNSlItyqSKCQgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThG9ajKwQuEM+6aiQJ6J1MrUBPD6GEoxaZRIvott21tk4R3d5oEEEZTMtlaZ2aPM5Y5luzQtV2wMga8FNnUMVnqDG3GMn8Ukc+W8/U0TRbE7vlYIEnJhRJFI4V2ddO8bzNVjwsemeyX/PjNJyhVKME/Vj3sZsoAyhVcEKa4DFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rg0UC-002Hbb-4N; Fri, 01 Mar 2024 18:51:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 01 Mar 2024 18:51:43 +0800
Date: Fri, 1 Mar 2024 18:51:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com, sboyd@kernel.org, davem@davemloft.net,
	andi.shyti@kernel.org, tglx@linutronix.de, tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linus.walleij@linaro.org, sre@kernel.org,
	u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de,
	olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@gmail.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	wim@linux-watchdog.org, linux@roeck-us.net, linux@armlinux.org.uk,
	andrei.simion@microchip.com, mihai.sain@microchip.com,
	andre.przywara@arm.com, neil.armstrong@linaro.org, tony@atomide.com,
	durai.manickamkr@microchip.com, geert+renesas@glider.be,
	arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org,
	rientjes@google.com, vbabka@suse.cz, mripard@kernel.org,
	codrin.ciubotariu@microchip.com, eugen.hristev@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 00/39] Add support for sam9x7 SoC family
Message-ID: <ZeGzPwdslHIj5IWt@gondor.apana.org.au>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>

On Fri, Feb 23, 2024 at 10:43:42PM +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
>  --------------
> 
>  - Addressed all the review comments in the patches
>  - Picked up all Acked-by and Reviewed-by tags
>  - Dropped applied patches from the series
>  - Added pwm node and related dt binding documentation
>  - Added support for exporting some clocks to DT
>  - Dropped USB related patches and changes. See NOTE.
>  - All the specific changes are captured in the corresponding patches
> 
>  NOTE: Owing to the discussion here
>  https://lore.kernel.org/linux-devicetree/CAL_JsqJ9PrX6fj-EbffeJce09MXs=B7t+KS_kOinxaRx38=WxA@mail.gmail.com/
>  the USB related changes are dropped from this series in order to enable
>  us to work on the mentioned issues before adding new compatibles as
>  said. The issues/warnings will be addressed in subsequent patches.
>  After which the USB related support for sam9x7 SoCs will be added. Hope
>  this works out fine.
> 
>  Changes in v3:
>  --------------
> 
>  - Fixed the DT documentation errors pointed out in v2.
>  - Dropped Acked-by tag in tcb DT doc patch as it had to be adapted
>    according to sam9x7 correctly.
>  - Picked by the previously missed tags.
>  - Dropped this patch "dt-bindings: usb: generic-ehci: Document clock-names
>    property" as the warning was not found while validating DT-schema for
>    at91-sam9x75_curiosity.dtb.
>  - Dropped redundant words in the commit message.
>  - Fixed the CHECK_DTBS warnings validated against
>    at91-sam9x75_curiosity.dtb.
>  - Renamed dt nodes according to naming convention.
>  - Dropped unwanted status property in dts.
>  - Removed nodes that are not in use from the board dts.
>  - Removed spi DT doc patch from the series as it was already applied
>    and a fix patch was applied subsequently. Added a patch to remove the
>    compatible to adapt sam9x7.
>  - Added sam9x7 compatibles in usb dt documentation.
> 
> 
>  Changes in v2:
>  --------------
> 
>  - Added sam9x7 specific compatibles in DT with fallbacks
>  - Documented all the newly added DT compatible strings
>  - Added device tree for the target board sam9x75 curiosity and
>    documented the same in the DT bindings documentation
>  - Removed the dt nodes that are not supported at the moment
>  - Removed the configs added by previous version that are not supported
>    at the moment
>  - Fixed all the corrections in the commit message
>  - Changed all the instances of copyright year to 2023
>  - Added sam9x7 flag in PIT64B configuration
>  - Moved macro definitions to header file
>  - Added another divider in mck characteristics in the pmc driver
>  - Fixed the memory leak in the pmc driver
>  - Dropped patches that are no longer needed
>  - Picked up Acked-by and Reviewed-by tags
> 
> 
> Varshini Rajendran (39):
>   dt-bindings: net: cdns,macb: add sam9x7 ethernet interface
>   dt-bindings: atmel-sysreg: add sam9x7
>   dt-bindings: crypto: add sam9x7 in Atmel AES
>   dt-bindings: crypto: add sam9x7 in Atmel SHA
>   dt-bindings: crypto: add sam9x7 in Atmel TDES
>   dt-bindings: i2c: at91: Add sam9x7 compatible string
>   dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
>   dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
>   dt-bindings: pinctrl: at91: add sam9x7
>   dt-bindings: rng: atmel,at91-trng: add sam9x7 TRNG
>   dt-bindings: rtt: at91rm9260: add sam9x7 compatible
>   dt-bindings: serial: atmel,at91-usart: add compatible for sam9x7.
>   ASoC: dt-bindings: atmel-classd: add sam9x7 compatible
>   dt-bindings: pwm: at91: Add sam9x7 compatible strings list
>   dt-bindings: watchdog: sama5d4-wdt: add compatible for sam9x7-wdt
>   spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 compatible from
>     list
>   ASoC: dt-bindings: microchip: add sam9x7
>   ARM: at91: pm: add support for sam9x7 SoC family
>   ARM: at91: pm: add sam9x7 SoC init config
>   ARM: at91: add support in SoC driver for new sam9x7
>   dt-bindings: clk: at91: add sam9x7
>   dt-bindings: clk: at91: add sam9x7 clock controller
>   clk: at91: clk-sam9x60-pll: re-factor to support individual core freq
>     outputs
>   clk: at91: sam9x7: add support for HW PLL freq dividers
>   clk: at91: sama7g5: move mux table macros to header file
>   dt-bindings: clock: at91: Allow PLLs to be exported and referenced in
>     DT
>   clk: at91: sam9x7: add sam9x7 pmc driver
>   dt-bindings: irqchip/atmel-aic5: Add support for sam9x7 aic
>   irqchip/atmel-aic5: Add support to get nirqs from DT for sam9x60 &
>     sam9x7
>   power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
>   power: reset: at91-reset: add reset support for sam9x7 SoC
>   power: reset: at91-reset: add sdhwc support for sam9x7 SoC
>   dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7
>   dt-bindings: power: reset: atmel,sama5d2-shdwc: add sam9x7
>   ARM: at91: Kconfig: add config flag for SAM9X7 SoC
>   ARM: configs: at91: enable config flags for sam9x7 SoC family
>   ARM: dts: at91: sam9x7: add device tree for SoC
>   dt-bindings: arm: add sam9x75 curiosity board
>   ARM: dts: at91: sam9x75_curiosity: add sam9x75 curiosity board
> 
>  .../devicetree/bindings/arm/atmel-at91.yaml   |    6 +
>  .../devicetree/bindings/arm/atmel-sysregs.txt |    7 +-
>  .../bindings/clock/atmel,at91rm9200-pmc.yaml  |    2 +
>  .../bindings/clock/atmel,at91sam9x5-sckc.yaml |    4 +-
>  .../crypto/atmel,at91sam9g46-aes.yaml         |    6 +-
>  .../crypto/atmel,at91sam9g46-sha.yaml         |    6 +-
>  .../crypto/atmel,at91sam9g46-tdes.yaml        |    6 +-
>  .../bindings/i2c/atmel,at91sam-i2c.yaml       |    4 +-
>  .../interrupt-controller/atmel,aic.txt        |    2 +-
>  .../devicetree/bindings/misc/atmel-ssc.txt    |    1 +
>  .../devicetree/bindings/mtd/atmel-nand.txt    |    1 +
>  .../devicetree/bindings/net/cdns,macb.yaml    |    5 +
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt   |    2 +
>  .../power/reset/atmel,sama5d2-shdwc.yaml      |    3 +
>  .../bindings/pwm/atmel,at91sam-pwm.yaml       |    3 +
>  .../reset/atmel,at91sam9260-reset.yaml        |    4 +
>  .../bindings/rng/atmel,at91-trng.yaml         |    4 +
>  .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |    4 +-
>  .../bindings/serial/atmel,at91-usart.yaml     |   12 +-
>  .../bindings/sound/atmel,sama5d2-classd.yaml  |    7 +-
>  .../sound/microchip,sama7g5-i2smcc.yaml       |   11 +-
>  .../bindings/spi/atmel,at91rm9200-spi.yaml    |    1 -
>  .../bindings/watchdog/atmel,sama5d4-wdt.yaml  |   12 +-
>  arch/arm/boot/dts/microchip/Makefile          |    3 +
>  .../dts/microchip/at91-sam9x75_curiosity.dts  |  309 +++++
>  arch/arm/boot/dts/microchip/sam9x60.dtsi      |    1 +
>  arch/arm/boot/dts/microchip/sam9x7.dtsi       | 1214 +++++++++++++++++
>  arch/arm/configs/at91_dt_defconfig            |    1 +
>  arch/arm/mach-at91/Kconfig                    |   23 +-
>  arch/arm/mach-at91/Makefile                   |    1 +
>  arch/arm/mach-at91/generic.h                  |    2 +
>  arch/arm/mach-at91/pm.c                       |   35 +
>  arch/arm/mach-at91/sam9x7.c                   |   34 +
>  drivers/clk/at91/Makefile                     |    1 +
>  drivers/clk/at91/clk-sam9x60-pll.c            |   50 +-
>  drivers/clk/at91/pmc.h                        |   18 +
>  drivers/clk/at91/sam9x60.c                    |    7 +
>  drivers/clk/at91/sam9x7.c                     |  946 +++++++++++++
>  drivers/clk/at91/sama7g5.c                    |   42 +-
>  drivers/irqchip/irq-atmel-aic5.c              |   12 +-
>  drivers/power/reset/Kconfig                   |    4 +-
>  drivers/power/reset/at91-sama5d2_shdwc.c      |    1 +
>  drivers/soc/atmel/soc.c                       |   23 +
>  drivers/soc/atmel/soc.h                       |    9 +
>  include/dt-bindings/clock/at91.h              |    4 +
>  45 files changed, 2788 insertions(+), 65 deletions(-)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
>  create mode 100644 arch/arm/boot/dts/microchip/sam9x7.dtsi
>  create mode 100644 arch/arm/mach-at91/sam9x7.c
>  create mode 100644 drivers/clk/at91/sam9x7.c
> 
> -- 
> 2.25.1

Patches 3-5 and 10 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

