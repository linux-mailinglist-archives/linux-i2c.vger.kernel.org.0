Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D225073BF90
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 22:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjFWUbk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 16:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjFWUbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 16:31:38 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9622112;
        Fri, 23 Jun 2023 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552296; x=1719088296;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k09nEHCiSzbJsqqSNMTaSxW8jtMKfqLZrahLVUHWd9A=;
  b=cIB4HII1991xayeKfBVY8uQfzaGu2JvLWmpYq2Rz73SETXIum2cd8ECy
   SuuoDw1tXjVffAcr91e3vhPvi5jILKqDYVb5oadMi8bqGeLrky9wTmrsz
   qTi8H9AW/OJcC4I9qt2343tw+CjZj/gfVJBCj88TAEicfIdQ0ZaYfFwLs
   26TW0SSgEXwi4shStxrZ2IB08bgRxOoeWuMezKLa945Ibk7uYv25FafjP
   /Unr6MPZRaLLIPOwGu9/AIFS+ojOg7hM26Cu/cjv4PJYHEnbvdajx9Xpw
   YvniVclikzVMVIwoEIDZzJrS7Dgplgvfp0zZ5Y54y3VIvpmzlt5Cf8IBL
   A==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="158361729"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:31:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:31:29 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:30:59 -0700
From:   Varshini Rajendran <varshini.rajendran@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <vkoul@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>,
        <lee@kernel.org>, <ulf.hansson@linaro.org>,
        <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
        <p.zabel@pengutronix.de>, <olivia@selenic.com>,
        <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
        <richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>, <arnd@arndb.de>,
        <olof@lixom.net>, <soc@kernel.org>, <linux@armlinux.org.uk>,
        <sre@kernel.org>, <jerry.ray@microchip.com>,
        <horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
        <varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
        <alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
        <mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC:     <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
        <balamanikandan.gunasundar@microchip.com>,
        <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
        <nayabbasha.sayed@microchip.com>, <balakrishnan.s@microchip.com>
Subject: [PATCH v2 00/45] Add support for sam9x7 SoC family
Date:   Sat, 24 Jun 2023 02:00:11 +0530
Message-ID: <20230623203056.689705-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series adds support for the new SoC family - sam9x7.
 - The device tree, configs and drivers are added
 - Clock driver for sam9x7 is added
 - Support for basic peripherals is added
 - Target board SAM9X75 Curiosity is added

 Changes in v2:
 --------------

 - Added sam9x7 specific compatibles in DT with fallbacks
 - Documented all the newly added DT compatible strings
 - Added device tree for the target board sam9x75 curiosity and
   documented the same in the DT bindings documentation
 - Removed the dt nodes that are not supported at the moment
 - Removed the configs added by previous version that are not supported
   at the moment
 - Fixed all the corrections in the commit message
 - Changed all the instances of copyright year to 2023
 - Added sam9x7 flag in PIT64B configuration
 - Moved macro definitions to header file
 - Added another divider in mck characteristics in the pmc driver
 - Fixed the memory leak in the pmc driver
 - Dropped patches that are no longer needed
 - Picked up Acked-by and Reviewed-by tags


Hari Prasath (1):
  irqchip/atmel-aic5: Add support for sam9x7 aic

Varshini Rajendran (44):
  dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x60, sam9x7
    compatible
  dt-bindings: usb: ehci: Add atmel at91sam9g45-ehci compatible
  dt-bindings: usb: generic-ehci: Document clock-names property
  dt-bindings: net: cdns,macb: add documentation for sam9x7 ethernet
    interface
  ARM: at91: pm: add support for sam9x7 SoC family
  ARM: at91: pm: add sam9x7 SoC init config
  ARM: at91: add support in SoC driver for new sam9x7
  clk: at91: clk-sam9x60-pll: re-factor to support individual core freq
    outputs
  clk: at91: sam9x7: add support for HW PLL freq dividers
  clk: at91: sama7g5: move mux table macros to header file
  dt-bindings: clk: at91: add bindings for SAM9X7's clock controller
  dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7 binding
  dt-bindings: atmel-sysreg: add bindings for sam9x7
  dt-bindings: crypto: add bindings for sam9x7 in Atmel AES
  dt-bindings: crypto: add bindings for sam9x7 in Atmel SHA
  dt-bindings: crypto: add bindings for sam9x7 in Atmel TDES
  dt-bindings: dmaengine: at_xdmac: add compatible with microchip,sam9x7
  dt-bindings: i2c: at91: Add SAM9X7 compatible string
  dt-bindings: mfd: at91: Add SAM9X7 compatible string
  dt-bindings: atmel-gpbr: add microchip,sam9x7-gpbr
  dt-bindings: atmel-matrix: add microchip,sam9x7-matrix
  dt-bindings: atmel-smc: add microchip,sam9x7-smc
  dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
  dt-bindings: sdhci-of-at91: add microchip,sam9x7-sdhci
  dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
  dt-bindings: pinctrl: at91: add bindings for SAM9X7
  dt-bindings: rng: atmel,at91-trng: document sam9x7 TRNG
  dt-bindings: rtc: at91rm9200: add sam9x7 compatible
  dt-bindings: rtt: at91rm9260: add sam9x7 compatible
  dt-bindings: serial: atmel,at91-usart: add compatible for sam9x7
  dt-bindings: atmel-classd: add sam9x7 compatible
  spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
  dt-bindings: usb: atmel: Update DT bindings documentation for sam9x7
  dt-bindings: watchdog: sama5d4-wdt: add compatible for sam9x7-wdt
  dt-bindings: irqchip/atmel-aic5: Add support for sam9x7 aic
  clk: at91: sam9x7: add sam9x7 pmc driver
  power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
  power: reset: at91-reset: add reset support for sam9x7 SoC
  power: reset: at91-reset: add sdhwc support for sam9x7 SoC
  ARM: at91: Kconfig: add config flag for SAM9X7 SoC
  ARM: configs: at91: enable config flags for sam9x7 SoC family
  ARM: dts: at91: sam9x7: add device tree for SoC
  dt-bindings: arm: add sam9x75 curiosity board
  ARM: dts: at91: sam9x75_curiosity: add device tree for sam9x75
    curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml   |    6 +
 .../devicetree/bindings/arm/atmel-sysregs.txt |    7 +-
 .../devicetree/bindings/clock/at91-clock.txt  |    7 +-
 .../crypto/atmel,at91sam9g46-aes.yaml         |    5 +-
 .../crypto/atmel,at91sam9g46-sha.yaml         |    5 +-
 .../crypto/atmel,at91sam9g46-tdes.yaml        |    5 +-
 .../devicetree/bindings/dma/atmel-xdma.txt    |    4 +-
 .../bindings/i2c/atmel,at91sam-i2c.yaml       |    3 +
 .../interrupt-controller/atmel,aic.txt        |    2 +-
 .../devicetree/bindings/mfd/atmel-flexcom.txt |    2 +-
 .../devicetree/bindings/mfd/atmel-gpbr.txt    |    1 +
 .../devicetree/bindings/mfd/atmel-matrix.txt  |    1 +
 .../devicetree/bindings/mfd/atmel-smc.txt     |    1 +
 .../devicetree/bindings/misc/atmel-ssc.txt    |    1 +
 .../devicetree/bindings/mmc/sdhci-atmel.txt   |    4 +-
 .../devicetree/bindings/mtd/atmel-nand.txt    |    1 +
 .../devicetree/bindings/net/cdns,macb.yaml    |    1 +
 .../bindings/pinctrl/atmel,at91-pinctrl.txt   |    3 +-
 .../reset/atmel,at91sam9260-reset.yaml        |    1 +
 .../bindings/rng/atmel,at91-trng.yaml         |    1 +
 .../bindings/rtc/atmel,at91rm9200-rtc.yaml    |    1 +
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |    1 +
 .../bindings/serial/atmel,at91-usart.yaml     |    3 +
 .../soc/microchip/atmel,at91rm9200-tcb.yaml   |    2 +
 .../bindings/sound/atmel,sama5d2-classd.yaml  |    5 +-
 .../bindings/spi/atmel,at91rm9200-spi.yaml    |    1 +
 .../devicetree/bindings/usb/atmel-usb.txt     |    9 +-
 .../devicetree/bindings/usb/generic-ehci.yaml |    5 +
 .../bindings/watchdog/atmel,sama5d4-wdt.yaml  |    1 +
 arch/arm/boot/dts/Makefile                    |    2 +
 arch/arm/boot/dts/at91-sam9x75_curiosity.dts  |  336 +++++
 arch/arm/boot/dts/sam9x7.dtsi                 | 1237 +++++++++++++++++
 arch/arm/configs/at91_dt_defconfig            |    1 +
 arch/arm/mach-at91/Kconfig                    |   23 +-
 arch/arm/mach-at91/Makefile                   |    1 +
 arch/arm/mach-at91/generic.h                  |    2 +
 arch/arm/mach-at91/pm.c                       |   35 +
 arch/arm/mach-at91/sam9x7.c                   |   34 +
 drivers/clk/at91/Makefile                     |    1 +
 drivers/clk/at91/clk-sam9x60-pll.c            |   50 +-
 drivers/clk/at91/pmc.h                        |   18 +
 drivers/clk/at91/sam9x60.c                    |    7 +
 drivers/clk/at91/sam9x7.c                     |  942 +++++++++++++
 drivers/clk/at91/sama7g5.c                    |   42 +-
 drivers/irqchip/irq-atmel-aic5.c              |   10 +
 drivers/power/reset/Kconfig                   |    4 +-
 drivers/power/reset/at91-sama5d2_shdwc.c      |    1 +
 drivers/soc/atmel/soc.c                       |   23 +
 drivers/soc/atmel/soc.h                       |    9 +
 49 files changed, 2806 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x75_curiosity.dts
 create mode 100644 arch/arm/boot/dts/sam9x7.dtsi
 create mode 100644 arch/arm/mach-at91/sam9x7.c
 create mode 100644 drivers/clk/at91/sam9x7.c

-- 
2.25.1

