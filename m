Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC88766FBA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 16:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbjG1Oqv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 10:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237156AbjG1Oqt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 10:46:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053C23A81;
        Fri, 28 Jul 2023 07:46:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E8576217A;
        Fri, 28 Jul 2023 14:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2F9C433CC;
        Fri, 28 Jul 2023 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690555605;
        bh=5qwrX6meNcONlQQjW2TLn0jpi22i8ohjJNekjzFGSbw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jw7H/nrcYAFAdpeLi5zWT4P0UjTl4pQeT2oQOzE+nnZnrQZSL6sTabyaj9LU7PkAs
         kNFP7BMizT0u/lLeJWKk534bGhRFicu/B4hgSQqprAim+6FjMk7mYvhTL6EQBJdTpK
         mS+OsUzQ+oDTeMzviS6s2RGGY+GQD6rphGfU3bbuhPC1/F05MN4VfdJOznJ6oRhsEb
         IbFGdZ8QUjuA4Drn8K0CCB6Rtra+ZR/X+ktwpGb7kAYZgZqdUa1tSLpZQ2UBdbcAcI
         Dn/T+gpnXzGQPeX69gapdvYKAlz/YAHjULDRCnSR9t4ehpGVRz04uMZVCg63u1rN6O
         ZePgO8E3LWIww==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so18564991fa.0;
        Fri, 28 Jul 2023 07:46:45 -0700 (PDT)
X-Gm-Message-State: ABy/qLb78n1wlRUE5zxHXC2PSe9Hrc6746wSE0i/uk2UHk+NsEahPinr
        4LJ3dM5qG6UJk/PJVzsdMA2WoMnpXmQjtv2vsA==
X-Google-Smtp-Source: APBJJlFx8MufhWGi8PLMbj5U4XD0N8x+sbF5TazXH7YZOs3Mt2AetYT37Fvg2Gqy7AAaEdWI1CQCFmTYCJL5susMii8=
X-Received: by 2002:a2e:b0d1:0:b0:2b9:4ac9:6071 with SMTP id
 g17-20020a2eb0d1000000b002b94ac96071mr1812586ljl.10.1690555583088; Fri, 28
 Jul 2023 07:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
In-Reply-To: <20230728102223.265216-1-varshini.rajendran@microchip.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 28 Jul 2023 08:46:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ9PrX6fj-EbffeJce09MXs=B7t+KS_kOinxaRx38=WxA@mail.gmail.com>
Message-ID: <CAL_JsqJ9PrX6fj-EbffeJce09MXs=B7t+KS_kOinxaRx38=WxA@mail.gmail.com>
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
To:     Varshini Rajendran <varshini.rajendran@microchip.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net,
        vkoul@kernel.org, andi.shyti@kernel.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
        tudor.ambarus@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, linus.walleij@linaro.org,
        sre@kernel.org, p.zabel@pengutronix.de, olivia@selenic.com,
        a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, gregkh@linuxfoundation.org,
        lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, linux@armlinux.org.uk,
        durai.manickamkr@microchip.com, andrew@lunn.ch,
        jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
        alexandre.torgue@st.com, gregory.clement@bootlin.com,
        arnd@arndb.de, rientjes@google.com, deller@gmx.de,
        42.hyeyoo@gmail.com, vbabka@suse.cz, mripard@kernel.org,
        mihai.sain@microchip.com, codrin.ciubotariu@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 28, 2023 at 4:23=E2=80=AFAM Varshini Rajendran
<varshini.rajendran@microchip.com> wrote:
>
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
>
>  Changes in v3:
>  --------------
>
>  - Fixed the DT documentation errors pointed out in v2.
>  - Dropped Acked-by tag in tcb DT doc patch as it had to be adapted
>    according to sam9x7 correctly.
>  - Picked by the previously missed tags.
>  - Dropped this patch "dt-bindings: usb: generic-ehci: Document clock-nam=
es
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
> Hari Prasath (1):
>   irqchip/atmel-aic5: Add support for sam9x7 aic
>
> Varshini Rajendran (49):
>   dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x60, sam9x7
>     compatible
>   dt-bindings: usb: ehci: Add atmel at91sam9g45-ehci compatible
>   dt-bindings: net: cdns,macb: add sam9x7 ethernet interface
>   dt-bindings: clk: at91: add sam9x7
>   dt-bindings: clk: at91: add sam9x7 clock controller
>   dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7
>   dt-bindings: power: reset: atmel,sama5d2-shdwc: add sam9x7
>   dt-bindings: atmel-sysreg: add sam9x7
>   dt-bindings: crypto: add sam9x7 in Atmel AES
>   dt-bindings: crypto: add sam9x7 in Atmel SHA
>   dt-bindings: crypto: add sam9x7 in Atmel TDES
>   dt-bindings: dmaengine: at_xdmac: add compatible with microchip,sam9x7
>   dt-bindings: i2c: at91: Add sam9x7 compatible string
>   dt-bindings: mfd: at91: Add SAM9X7 compatible string
>   dt-bindings: atmel-gpbr: add microchip,sam9x7-gpbr
>   dt-bindings: atmel-matrix: add microchip,sam9x7-matrix
>   dt-bindings: atmel-smc: add microchip,sam9x7-smc
>   dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
>   dt-bindings: sdhci-of-at91: add microchip,sam9x7-sdhci
>   dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
>   dt-bindings: pinctrl: at91: add sam9x7
>   dt-bindings: rng: atmel,at91-trng: add sam9x7 TRNG
>   dt-bindings: rtc: at91rm9200: add sam9x7 compatible
>   dt-bindings: rtt: at91rm9260: add sam9x7 compatible
>   dt-bindings: serial: atmel,at91-usart: add compatible for sam9x7
>   dt-bindings: atmel-classd: add sam9x7 compatible
>   dt-bindings: usb: atmel: add sam9x7
>   dt-bindings: watchdog: sama5d4-wdt: add compatible for sam9x7-wdt
>   dt-bindings: irqchip/atmel-aic5: Add support for sam9x7 aic
>   spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 compatible from
>     list
>   ASoC: dt-bindings: microchip: add sam9x7
>   dt-bindings: usb: ehci: Add sam9x7
>   dt-bindings: usb: add sam9x7
>   ARM: at91: pm: add support for sam9x7 SoC family
>   ARM: at91: pm: add sam9x7 SoC init config
>   ARM: at91: add support in SoC driver for new sam9x7
>   clk: at91: clk-sam9x60-pll: re-factor to support individual core freq
>     outputs
>   clk: at91: sam9x7: add support for HW PLL freq dividers
>   clk: at91: sama7g5: move mux table macros to header file
>   clk: at91: sam9x7: Allow PLLs to be exported and referenced in DT
>   clk: at91: sam9x7: add sam9x7 pmc driver
>   power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
>   power: reset: at91-reset: add reset support for sam9x7 SoC
>   power: reset: at91-reset: add sdhwc support for sam9x7 SoC
>   ARM: at91: Kconfig: add config flag for SAM9X7 SoC
>   ARM: configs: at91: enable config flags for sam9x7 SoC family
>   ARM: dts: at91: sam9x7: add device tree for SoC
>   dt-bindings: arm: add sam9x75 curiosity board
>   ARM: dts: at91: sam9x75_curiosity: add sam9x75 curiosity board
>

>  .../devicetree/bindings/arm/atmel-sysregs.txt |    7 +-
>  .../devicetree/bindings/dma/atmel-xdma.txt    |    3 +-
>  .../interrupt-controller/atmel,aic.txt        |    2 +-
>  .../devicetree/bindings/mfd/atmel-flexcom.txt |    1 +
>  .../devicetree/bindings/mfd/atmel-gpbr.txt    |    1 +
>  .../devicetree/bindings/mfd/atmel-matrix.txt  |    1 +
>  .../devicetree/bindings/mfd/atmel-smc.txt     |    1 +
>  .../devicetree/bindings/misc/atmel-ssc.txt    |    1 +
>  .../devicetree/bindings/mmc/sdhci-atmel.txt   |    4 +-
>  .../devicetree/bindings/mtd/atmel-nand.txt    |    1 +
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt   |    2 +
>  .../devicetree/bindings/usb/atmel-usb.txt     |   11 +-

Still quite a few .txt bindings. When are Microchip folks going to get
around to converting the rest of their bindings to schema?

Be warned that at some point we will simply not accept any .txt binding cha=
nges.

>  .../dts/microchip/at91-sam9x75_curiosity.dts  |  311 +++++
>  arch/arm/boot/dts/microchip/sam9x7.dtsi       | 1238 +++++++++++++++++

Don't you want to do that before adding new chips so warnings can be
fixed up front?

Overall, the Atmel/Microchip stuff is not in great shape. 1368 unique
warnings and 189 undocumented (by schema) compatibles. Note lots of
OHCI/EHCI related warnings already. I'm sure you didn't add more with
this new chip, right?

(All this data is available here:
https://gitlab.com/robherring/linux-dt/-/jobs )

arch/arm/boot/dts/microchip:4655:1368
     71  nand-controller: #size-cells:0:0: 0 was expected
     71  nand-controller: #address-cells:0:0: 1 was expected
     53  /: compatible: 'oneOf' conditional failed, one must be fixed:
     49  serial@200: $nodename:0: 'serial@200' does not match
'^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
     39  pinctrl@fffff400: $nodename:0: 'pinctrl@fffff400' does not
match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
     31  ohci@600000: compatible: 'oneOf' conditional failed, one must be f=
ixed:
     31  ohci@600000: $nodename:0: 'ohci@600000' does not match '^usb(@.*)?=
'
     31  ehci@700000: compatible: 'oneOf' conditional failed, one must be f=
ixed:
     31  ehci@700000: $nodename:0: 'ehci@700000' does not match '^usb(@.*)?=
'
     27  ehci@700000: Unevaluated properties are not allowed
('clock-names' was unexpected)
     25  serial@200: atmel,fifo-size: False schema does not allow [[32]]
     24  serial@200: atmel,use-dma-tx: False schema does not allow True
     24  serial@200: atmel,use-dma-rx: False schema does not allow True
     24  serial@200: atmel,fifo-size: False schema does not allow [[16]]
     24  ohci@500000: compatible: 'oneOf' conditional failed, one must be f=
ixed:
     24  ohci@500000: $nodename:0: 'ohci@500000' does not match '^usb(@.*)?=
'
     20  pinctrl@fffff200: $nodename:0: 'pinctrl@fffff200' does not
match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
     18  pinctrl@fffff400: tcb0: {'tcb0_tclk0-0': {'atmel,pins': [[0,
25, 1, 0]]}, 'tcb0_tclk1-0': {'atmel,pins': [[1, 6, 2, 0]]},
'tcb0_tclk2-0': {'atmel,pins': [[1, 7, 2, 0]]}, 'tcb0_tioa0-0':
{'atmel,pins': [[0, 26, 1, 0]]}, 'tcb0_tioa1-0': {'atmel,pins': [[0,
27, 1, 0]]}, 'tcb0_tioa2-0': {'atmel,pins': [[0, 28, 1, 0]]},
'tcb0_tiob0-0': {'atmel,pins': [[2, 9, 2, 0]]}, 'tcb0_tiob1-0':
{'atmel,pins': [[2, 7, 1, 0]]}, 'tcb0_tiob2-0': {'atmel,pins': [[2, 6,
1, 0]]}} should not be valid under {'type': 'object'}
     17  pinctrl@fffff400: tcb1: {'tcb1_tclk0-0': {'atmel,pins': [[1,
16, 2, 0]]}, 'tcb1_tclk1-0': {'atmel,pins': [[1, 17, 2, 0]]},
'tcb1_tclk2-0': {'atmel,pins': [[2, 22, 2, 0]]}, 'tcb1_tioa0-0':
{'atmel,pins': [[1, 0, 2, 0]]}, 'tcb1_tioa1-0': {'atmel,pins': [[1, 2,
2, 0]]}, 'tcb1_tioa2-0': {'atmel,pins': [[1, 3, 2, 0]]},
'tcb1_tiob0-0': {'atmel,pins': [[1, 1, 2, 0]]}, 'tcb1_tiob1-0':
{'atmel,pins': [[1, 18, 2, 0]]}, 'tcb1_tiob2-0': {'atmel,pins': [[1,
19, 2, 0]]}} should not be valid under {'type': 'object'}
     17  pinctrl@fffff400: dbgu: {'dbgu-0': {'atmel,pins': [[1, 14, 1,
1, 1, 15, 1, 0]], 'phandle': [[5]]}} should not be valid under
{'type': 'object'}
     17  ohci@600000: Unevaluated properties are not allowed
('atmel,vbus-gpio', 'clock-names', 'compatible' were unexpected)
     17  i2c-gpio-0: 'sda-gpios' is a required property
     17  i2c-gpio-0: 'scl-gpios' is a required property
     16  ohci@500000: Unevaluated properties are not allowed
('clock-names', 'compatible' were unexpected)
     15  pinctrl@fffff400: tcb1: {'tcb1_tclk0-0': {'atmel,pins': [[2,
4, 3, 0]]}, 'tcb1_tclk1-0': {'atmel,pins': [[2, 7, 3, 0]]},
'tcb1_tclk2-0': {'atmel,pins': [[2, 14, 3, 0]]}, 'tcb1_tioa0-0':
{'atmel,pins': [[2, 2, 3, 0]]}, 'tcb1_tioa1-0': {'atmel,pins': [[2, 5,
3, 0]]}, 'tcb1_tioa2-0': {'atmel,pins': [[2, 12, 3, 0]]},
'tcb1_tiob0-0': {'atmel,pins': [[2, 3, 3, 0]]}, 'tcb1_tiob1-0':
{'atmel,pins': [[2, 6, 3, 0]]}, 'tcb1_tiob2-0': {'atmel,pins': [[2,
13, 3, 0]]}} should not be valid under {'type': 'object'}
     15  pinctrl@fffff400: tcb0: {'tcb0_tclk0-0': {'atmel,pins': [[0,
24, 1, 0]]}, 'tcb0_tclk1-0': {'atmel,pins': [[0, 25, 1, 0]]},
'tcb0_tclk2-0': {'atmel,pins': [[0, 26, 1, 0]]}, 'tcb0_tioa0-0':
{'atmel,pins': [[0, 21, 1, 0]]}, 'tcb0_tioa1-0': {'atmel,pins': [[0,
22, 1, 0]]}, 'tcb0_tioa2-0': {'atmel,pins': [[0, 23, 1, 0]]},
'tcb0_tiob0-0': {'atmel,pins': [[0, 27, 1, 0]]}, 'tcb0_tiob1-0':
{'atmel,pins': [[0, 28, 1, 0]]}, 'tcb0_tiob2-0': {'atmel,pins': [[0,
29, 1, 0]]}} should not be valid under {'type': 'object'}
     14  pinctrl@fffff400: ssc0: {'ssc0_tx-0': {'atmel,pins': [[0, 24,
2, 0, 0, 25, 2, 0, 0, 26, 2, 0]], 'phandle': [[7]]}, 'ssc0_rx-0':
{'atmel,pins': [[0, 27, 2, 0, 0, 28, 2, 0, 0, 29, 2, 0]], 'phandle':
[[8]]}} should not be valid under {'type': 'object'}
     13  pinctrl@fffff200: nand0: {'nand0_ale_cle-0': {'atmel,pins':
[[4, 21, 1, 1, 4, 22, 1, 1]]}} should not be valid under {'type':
'object'}
     11  pinctrl@fffff400: mmc0: {'mmc0_clk-0': {'atmel,pins': [[0, 8,
1, 0]]}, 'mmc0_slot0_cmd_dat0-0': {'atmel,pins': [[0, 7, 1, 1, 0, 6,
1, 1]]}, 'mmc0_slot0_dat1_3-0': {'atmel,pins': [[0, 9, 1, 1, 0, 10, 1,
1, 0, 11, 1, 1]]}, 'mmc0_slot1_cmd_dat0-0': {'atmel,pins': [[0, 1, 2,
1, 0, 0, 2, 1]]}, 'mmc0_slot1_dat1_3-0': {'atmel,pins': [[0, 5, 2, 1,
0, 4, 2, 1, 0, 3, 2, 1]]}} should not be valid under {'type':
'object'}
     11  pinctrl@fffff200: pwm0: {'pwm0_pwmh0-0': {'atmel,pins': [[0,
20, 2, 0]]}, 'pwm0_pwmh0-1': {'atmel,pins': [[1, 0, 2, 0]]},
'pwm0_pwml0-0': {'atmel,pins': [[0, 21, 2, 0]]}, 'pwm0_pwml0-1':
{'atmel,pins': [[1, 1, 2, 0]]}, 'pwm0_pwmh1-0': {'atmel,pins': [[0,
22, 2, 0]]}, 'pwm0_pwmh1-1': {'atmel,pins': [[1, 4, 2, 0]]},
'pwm0_pwmh1-2': {'atmel,pins': [[1, 27, 3, 0]]}, 'pwm0_pwml1-0':
{'atmel,pins': [[0, 23, 2, 0]]}, 'pwm0_pwml1-1': {'atmel,pins': [[1,
5, 2, 0]]}, 'pwm0_pwml1-2': {'atmel,pins': [[4, 31, 2, 0]]},
'pwm0_pwmh2-0': {'atmel,pins': [[1, 8, 2, 0]]}, 'pwm0_pwmh2-1':
{'atmel,pins': [[3, 5, 3, 0]]}, 'pwm0_pwml2-0': {'atmel,pins': [[1, 9,
2, 0]]}, 'pwm0_pwml2-1': {'atmel,pins': [[3, 6, 3, 0]]},
'pwm0_pwmh3-0': {'atmel,pins': [[1, 12, 2, 0]]}, 'pwm0_pwmh3-1':
{'atmel,pins': [[3, 7, 3, 0]]}, 'pwm0_pwml3-0': {'atmel,pins': [[1,
13, 2, 0]]}, 'pwm0_pwml3-1': {'atmel,pins': [[3, 8, 3, 0]]}} should
not be valid under {'type': 'object'}

arch/arm/boot/dts/microchip:189
['acme,ariag25', 'atmel,at91sam9x5ek', 'atmel,at91sam9x5', 'atmel,at91sam9'=
]
['acme,ariettag25', 'atmel,at91sam9x5', 'atmel,at91sam9']
['acme,foxg20', 'atmel,at91sam9g20', 'atmel,at91sam9']
['aries,ma5d4evk', 'denx,ma5d4evk', 'atmel,sama5d4', 'atmel,sama5']
['atheros,ath6kl']
['atmel,asoc-wm8904']
['atmel,at45', 'atmel,dataflash']
['atmel,at91rm9200-aic']
['atmel,at91rm9200-gpio']
['atmel,at91rm9200-nand']
['atmel,at91rm9200-ohci', 'usb-ohci']
['atmel,at91rm9200-pinctrl', 'simple-bus']
['atmel,at91rm9200-sdramc', 'syscon']
['atmel,at91rm9200-ssc']
['atmel,at91rm9200-st', 'syscon', 'simple-mfd']
['atmel,at91rm9200-udc']
['atmel,at91rm9200-wdt']
['atmel,at91rm9200ek', 'atmel,at91rm9200']
['atmel,at91sam9260-ebi']
['atmel,at91sam9260-gpbr', 'syscon']
['atmel,at91sam9260-matrix', 'syscon']
['atmel,at91sam9260-nand-controller']
['atmel,at91sam9260-pit']
['atmel,at91sam9260-sdramc']
['atmel,at91sam9260-smc', 'syscon']
['atmel,at91sam9260-udc']
['atmel,at91sam9260ek', 'atmel,at91sam9260', 'atmel,at91sam9']
['atmel,at91sam9261-ebi']
['atmel,at91sam9261-lcdc']
['atmel,at91sam9261-matrix', 'syscon']
['atmel,at91sam9261-nand-controller']
['atmel,at91sam9261-pmc', 'syscon']
['atmel,at91sam9261-udc']
['atmel,at91sam9261ek', 'atmel,at91sam9261', 'atmel,at91sam9']
['atmel,at91sam9263-ac97c']
['atmel,at91sam9263-can']
['atmel,at91sam9263-ebi0']
['atmel,at91sam9263-ebi1']
['atmel,at91sam9263-lcdc']
['atmel,at91sam9263-matrix', 'syscon']
['atmel,at91sam9263-pmc', 'syscon']
['atmel,at91sam9263-udc']
['atmel,at91sam9263ek', 'atmel,at91sam9263', 'atmel,at91sam9']
['atmel,at91sam9g15ek', 'atmel,at91sam9x5ek', 'atmel,at91sam9x5',
'atmel,at91sam9']
['atmel,at91sam9g20ek', 'atmel,at91sam9g20', 'atmel,at91sam9']
['atmel,at91sam9g20ek-wm8731-audio']
['atmel,at91sam9g20ek_2mmc', 'atmel,at91sam9g20', 'atmel,at91sam9']
['atmel,at91sam9g25ek', 'atmel,at91sam9x5ek', 'atmel,at91sam9x5',
'atmel,at91sam9']
['atmel,at91sam9g35ek', 'atmel,at91sam9x5ek', 'atmel,at91sam9x5',
'atmel,at91sam9']
['atmel,at91sam9g45-ddramc']
['atmel,at91sam9g45-dma']
['atmel,at91sam9g45-ebi']
['atmel,at91sam9g45-ehci', 'usb-ehci']
['atmel,at91sam9g45-isi']
['atmel,at91sam9g45-lcdc']
['atmel,at91sam9g45-matrix', 'syscon']
['atmel,at91sam9g45-nand-controller']
['atmel,at91sam9g45-pmecc']
['atmel,at91sam9g45-ssc']
['atmel,at91sam9g45-udc']
['atmel,at91sam9m10g45ek', 'atmel,at91sam9g45', 'atmel,at91sam9']
['atmel,at91sam9n12-hlcdc']
['atmel,at91sam9n12-matrix', 'syscon']
['atmel,at91sam9n12ek', 'atmel,at91sam9n12', 'atmel,at91sam9']
['atmel,at91sam9rl-dma']
['atmel,at91sam9rl-ebi']
['atmel,at91sam9rl-lcdc']
['atmel,at91sam9rl-matrix', 'syscon']
['atmel,at91sam9rl-ssc']
['atmel,at91sam9rl-udc']
['atmel,at91sam9rlek', 'atmel,at91sam9rl', 'atmel,at91sam9']
['atmel,at91sam9x25ek', 'atmel,at91sam9x5ek', 'atmel,at91sam9x5',
'atmel,at91sam9']
['atmel,at91sam9x35ek', 'atmel,at91sam9x5ek', 'atmel,at91sam9x5',
'atmel,at91sam9']
['atmel,at91sam9x5-can']
['atmel,at91sam9x5-ebi']
['atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio']
['atmel,at91sam9x5-hlcdc']
['atmel,at91sam9x5-matrix', 'syscon']
['atmel,at91sam9x5-pinctrl', 'atmel,at91rm9200-pinctrl', 'simple-bus']
['atmel,hlcdc-display-controller']
['atmel,hlcdc-pwm']
['atmel,hsmci']
['atmel,osc', 'fixed-clock']
['atmel,sam9x5-wm8731-audio']
['atmel,sama5d2-aic']
['atmel,sama5d2-chipid']
['atmel,sama5d2-flexcom']
['atmel,sama5d2-hlcdc']
['atmel,sama5d2-pinctrl']
['atmel,sama5d2-pmecc']
['atmel,sama5d2-ptc_ek', 'atmel,sama5d2', 'atmel,sama5']
['atmel,sama5d2-sdhci']
['atmel,sama5d2-secumod', 'syscon']
['atmel,sama5d2-sfr', 'syscon']
['atmel,sama5d2-sfrbu', 'syscon']
['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
['atmel,sama5d2-xplained', 'atmel,sama5d2', 'atmel,sama5']
['atmel,sama5d27-som1-ek', 'atmel,sama5d27-som1', 'atmel,sama5d27',
'atmel,sama5d2', 'atmel,sama5']
['atmel,sama5d3-adc']
['atmel,sama5d3-aic']
['atmel,sama5d3-ddramc']
['atmel,sama5d3-ebi']
['atmel,sama5d3-hlcdc']
['atmel,sama5d3-nand-controller']
['atmel,sama5d3-nfc-io', 'syscon']
['atmel,sama5d3-pinctrl', 'atmel,at91sam9x5-pinctrl', 'simple-bus']
['atmel,sama5d3-sfr', 'syscon']
['atmel,sama5d3-smc', 'syscon', 'simple-mfd']
['atmel,sama5d3-udc']
['atmel,sama5d3-xplained', 'atmel,sama5d3', 'atmel,sama5']
['atmel,sama5d31ek', 'atmel,sama5d3xmb', 'atmel,sama5d3xcm',
'atmel,sama5d31', 'atmel,sama5d3', 'atmel,sama5']
['atmel,sama5d33ek', 'atmel,sama5d3xmb', 'atmel,sama5d3xcm',
'atmel,sama5d33', 'atmel,sama5d3', 'atmel,sama5']
['atmel,sama5d34ek', 'atmel,sama5d3xmb', 'atmel,sama5d3xcm',
'atmel,sama5d34', 'atmel,sama5d3', 'atmel,sama5']
['atmel,sama5d35ek', 'atmel,sama5d3xmb', 'atmel,sama5d3xcm',
'atmel,sama5d35', 'atmel,sama5d3', 'atmel,sama5']
['atmel,sama5d36ek', 'atmel,sama5d3xmb', 'atmel,sama5d3xcm',
'atmel,sama5d36', 'atmel,sama5d3', 'atmel,sama5']
['atmel,sama5d36ek-cmp', 'atmel,sama5d3xmb-cmp',
'atmel,sama5d3xcm-cmp', 'atmel,sama5d36', 'atmel,sama5d3',
'atmel,sama5']
['atmel,sama5d4-aic']
['atmel,sama5d4-dma']
['atmel,sama5d4-hlcdc']
['atmel,sama5d4-pmecc']
['atmel,sama5d4-sfr', 'syscon']
['atmel,sama5d4-xplained', 'atmel,sama5d4', 'atmel,sama5']
['atmel,sama5d4ek', 'atmel,sama5d4', 'atmel,sama5']
['atmel,tny-a9263', 'atmel,at91sam9263', 'atmel,at91sam9']
['atmel,usb-a9263', 'atmel,at91sam9263', 'atmel,at91sam9']
['axentia,tse850-pcm5142']
['calao,qil-a9260', 'atmel,at91sam9260', 'atmel,at91sam9']
['calao,tny-a9260', 'atmel,at91sam9260', 'atmel,at91sam9']
['calao,tny-a9g20', 'atmel,at91sam9g20', 'atmel,at91sam9']
['calao,usb-a9260', 'atmel,at91sam9260', 'atmel,at91sam9']
['calao,usb-a9g20', 'atmel,at91sam9g20', 'atmel,at91sam9']
['calao,usb-a9g20-lpw', 'calao,usb-a9g20', 'atmel,at91sam9g20',
'atmel,at91sam9']
['egnite,ethernut5', 'atmel,at91sam9260', 'atmel,at91sam9']
['focaltech,ft5426', 'edt,edt-ft5406']
['hce,cosino_mega2560', 'atmel,at91sam9x5', 'atmel,at91sam9']
['l+g,vinco', 'atmel,sama5d4', 'atmel,sama5']
['laird,dvk-som60', 'laird,som60', 'atmel,sama5d36', 'atmel,sama5d3',
'atmel,sama5']
['laird,gatwick', 'laird,wb50n', 'atmel,sama5d31', 'atmel,sama5d3',
'atmel,sama5']
['laird,wb45n', 'laird,wbxx', 'atmel,at91sam9x5', 'atmel,at91sam9']
['laird,wb50n', 'atmel,sama5d31', 'atmel,sama5d3', 'atmel,sama5']
['linux,spdif-dir']
['microchip,lan9662-udc', 'atmel,sama5d3-udc']
['microchip,mcp16502']
['microchip,mcp23008']
['microchip,mcp2515']
['microchip,sam9x60-aic']
['microchip,sam9x60-can', 'atmel,at91sam9x5-can']
['microchip,sam9x60-ddramc', 'atmel,sama5d3-ddramc']
['microchip,sam9x60-dma', 'atmel,sama5d4-dma']
['microchip,sam9x60-ebi']
['microchip,sam9x60-gpbr', 'atmel,at91sam9260-gpbr', 'syscon']
['microchip,sam9x60-gpio', 'atmel,at91sam9x5-gpio', 'atmel,at91rm9200-gpio'=
]
['microchip,sam9x60-hlcdc']
['microchip,sam9x60-isi', 'atmel,at91sam9g45-isi']
['microchip,sam9x60-matrix', 'atmel,at91sam9x5-matrix', 'syscon']
['microchip,sam9x60-nand-controller']
['microchip,sam9x60-pinctrl', 'atmel,at91sam9x5-pinctrl',
'atmel,at91rm9200-pinctrl', 'simple-bus']
['microchip,sam9x60-pit64b']
['microchip,sam9x60-pmecc', 'atmel,at91sam9g45-pmecc']
['microchip,sam9x60-sdhci']
['microchip,sam9x60-sfr', 'syscon']
['microchip,sam9x60-smc', 'atmel,at91sam9260-smc', 'syscon']
['microchip,sam9x60-tcb', 'atmel,at91sam9x5-tcb', 'simple-mfd', 'syscon']
['microchip,sam9x60-udc']
['microchip,sama5d3-ksz9477-evb', 'atmel,sama5d36', 'atmel,sama5d3',
'atmel,sama5']
['microchip,sama7g5-chipid']
['microchip,sama7g5-ddr3phy']
['microchip,sama7g5-dma']
['microchip,sama7g5-gpbr', 'syscon']
['microchip,sama7g5-pinctrl']
['microchip,sama7g5-pit64b', 'microchip,sam9x60-pit64b']
['microchip,sama7g5-sdhci', 'microchip,sam9x60-sdhci']
['microchip,sama7g5-secumod', 'atmel,sama5d2-secumod', 'syscon']
['microchip,sama7g5-securam', 'atmel,sama5d2-securam', 'mmio-sram']
['microchip,sama7g5-sfrbu', 'atmel,sama5d2-sfrbu', 'syscon']
['microchip,sama7g5-uddrc']
['nxp,tfa9879']
['overkiz,kizbox', 'atmel,at91sam9g20', 'atmel,at91sam9']
['ovti,ov2640']
['phontech,mpa1600', 'atmel,at91rm9200']
['qt1070']
['ronetix,pm9g45', 'atmel,at91sam9g45', 'atmel,at91sam9']
['somfy,animeo-ip', 'atmel,at91sam9260', 'atmel,at91sam9']
['st,m41t94']
['telit,evk-pro3', 'atmel,at91sam9260', 'atmel,at91sam9']
['ti,ads7843']
['ti,pcm5142']
['winstar,wf70gtiagdng0', 'innolux,at070tn92']
['wm8731']

Rob
