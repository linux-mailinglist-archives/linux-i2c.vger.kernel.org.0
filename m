Return-Path: <linux-i2c+bounces-1950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9986191F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 18:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42CDF287202
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 17:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A4313341F;
	Fri, 23 Feb 2024 17:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Q+LreEMK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8112838F;
	Fri, 23 Feb 2024 17:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708708474; cv=none; b=HYJdtJ4H5zxt7bwobf+rtuJhqlB9SqPgNxHrzHcBERHXezI5uubFa7ci6Z0wyhSstj3ejtHf+KxpsHJxuhTOARTKcI3H/8XO7ZbsZ1g6vUdhCCURzc7818fOSLUyiGA+CEWPag+kw1mnm5FEapILnklZEij9SHdf1C5eYm1IyaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708708474; c=relaxed/simple;
	bh=Ya7emYjSkiHqP5u67XOaZtVnw0nOswnxuhZgIQ4BbMo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BA60Lh1hoVd5EDi+CkzfZtCk18vy/EIjT3ZCFSP3eaJkpD/5VgsdiDDkNOQFq+oT5pkce8SfeNViR0t7rw/LcqJBVSWZsYHNSNI1wWL+cDlVApnbeeV5N1tP+5fRzwwddd2vkNNUfs/Q2tv9XxO5YSY0sitxUwmx+CQm6XzG8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Q+LreEMK; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708708472; x=1740244472;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ya7emYjSkiHqP5u67XOaZtVnw0nOswnxuhZgIQ4BbMo=;
  b=Q+LreEMKqMC3g4Tfs4ABkCP+WsyIzbo3xPjj/dsddz4MNPt+41wTKLYc
   ARmGggZ28DFFuxDjd78wyQU8gdYqckPj7mpB9B/0zk0uwqO6bnHjnQKFm
   joC5BMbY/6OKAXKuKJdTqs6UaPwuhqkvnVrH9wrbhpJEXkdD7TzVeQ5RV
   PUhpt75SKl0m729SyxAd+VG7eMUtXpO26ten40P3/1AD5lMW0q2Lv8K1J
   okTilQG8JmA215J0LdS3FUqf2Hj32A/g+fz44mhHyb4OUB4dDEncnZPqS
   /x8a4bK0cfMWCulMvmY2UKL+lwrTqDaNb1ufGUHhKNdATlvp4718V6Zej
   g==;
X-CSE-ConnectionGUID: Zg+uYWIwR/67x/qNBiMJxA==
X-CSE-MsgGUID: Zq+OrxYDQK6ZvTWv4XI1Vw==
X-IronPort-AV: E=Sophos;i="6.06,180,1705388400"; 
   d="scan'208";a="184008857"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2024 10:14:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:14:20 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:13:59 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <andi.shyti@kernel.org>, <tglx@linutronix.de>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <sre@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <linux@armlinux.org.uk>,
	<andrei.simion@microchip.com>, <mihai.sain@microchip.com>,
	<varshini.rajendran@microchip.com>, <andre.przywara@arm.com>,
	<neil.armstrong@linaro.org>, <tony@atomide.com>,
	<durai.manickamkr@microchip.com>, <geert+renesas@glider.be>, <arnd@arndb.de>,
	<Jason@zx2c4.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
	<vbabka@suse.cz>, <mripard@kernel.org>, <codrin.ciubotariu@microchip.com>,
	<eugen.hristev@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
Subject: [PATCH v4 00/39] Add support for sam9x7 SoC family
Date: Fri, 23 Feb 2024 22:43:42 +0530
Message-ID: <20240223171342.669133-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds support for the new SoC family - sam9x7.
 - The device tree, configs and drivers are added
 - Clock driver for sam9x7 is added
 - Support for basic peripherals is added
 - Target board SAM9X75 Curiosity is added

 Changes in v4:
 --------------

 - Addressed all the review comments in the patches
 - Picked up all Acked-by and Reviewed-by tags
 - Dropped applied patches from the series
 - Added pwm node and related dt binding documentation
 - Added support for exporting some clocks to DT
 - Dropped USB related patches and changes. See NOTE.
 - All the specific changes are captured in the corresponding patches

 NOTE: Owing to the discussion here
 https://lore.kernel.org/linux-devicetree/CAL_JsqJ9PrX6fj-EbffeJce09MXs=B7t+KS_kOinxaRx38=WxA@mail.gmail.com/
 the USB related changes are dropped from this series in order to enable
 us to work on the mentioned issues before adding new compatibles as
 said. The issues/warnings will be addressed in subsequent patches.
 After which the USB related support for sam9x7 SoCs will be added. Hope
 this works out fine.

 Changes in v3:
 --------------

 - Fixed the DT documentation errors pointed out in v2.
 - Dropped Acked-by tag in tcb DT doc patch as it had to be adapted
   according to sam9x7 correctly.
 - Picked by the previously missed tags.
 - Dropped this patch "dt-bindings: usb: generic-ehci: Document clock-names
   property" as the warning was not found while validating DT-schema for
   at91-sam9x75_curiosity.dtb.
 - Dropped redundant words in the commit message.
 - Fixed the CHECK_DTBS warnings validated against
   at91-sam9x75_curiosity.dtb.
 - Renamed dt nodes according to naming convention.
 - Dropped unwanted status property in dts.
 - Removed nodes that are not in use from the board dts.
 - Removed spi DT doc patch from the series as it was already applied
   and a fix patch was applied subsequently. Added a patch to remove the
   compatible to adapt sam9x7.
 - Added sam9x7 compatibles in usb dt documentation.


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


Varshini Rajendran (39):
  dt-bindings: net: cdns,macb: add sam9x7 ethernet interface
  dt-bindings: atmel-sysreg: add sam9x7
  dt-bindings: crypto: add sam9x7 in Atmel AES
  dt-bindings: crypto: add sam9x7 in Atmel SHA
  dt-bindings: crypto: add sam9x7 in Atmel TDES
  dt-bindings: i2c: at91: Add sam9x7 compatible string
  dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
  dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
  dt-bindings: pinctrl: at91: add sam9x7
  dt-bindings: rng: atmel,at91-trng: add sam9x7 TRNG
  dt-bindings: rtt: at91rm9260: add sam9x7 compatible
  dt-bindings: serial: atmel,at91-usart: add compatible for sam9x7.
  ASoC: dt-bindings: atmel-classd: add sam9x7 compatible
  dt-bindings: pwm: at91: Add sam9x7 compatible strings list
  dt-bindings: watchdog: sama5d4-wdt: add compatible for sam9x7-wdt
  spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 compatible from
    list
  ASoC: dt-bindings: microchip: add sam9x7
  ARM: at91: pm: add support for sam9x7 SoC family
  ARM: at91: pm: add sam9x7 SoC init config
  ARM: at91: add support in SoC driver for new sam9x7
  dt-bindings: clk: at91: add sam9x7
  dt-bindings: clk: at91: add sam9x7 clock controller
  clk: at91: clk-sam9x60-pll: re-factor to support individual core freq
    outputs
  clk: at91: sam9x7: add support for HW PLL freq dividers
  clk: at91: sama7g5: move mux table macros to header file
  dt-bindings: clock: at91: Allow PLLs to be exported and referenced in
    DT
  clk: at91: sam9x7: add sam9x7 pmc driver
  dt-bindings: irqchip/atmel-aic5: Add support for sam9x7 aic
  irqchip/atmel-aic5: Add support to get nirqs from DT for sam9x60 &
    sam9x7
  power: reset: at91-poweroff: lookup for proper pmc dt node for sam9x7
  power: reset: at91-reset: add reset support for sam9x7 SoC
  power: reset: at91-reset: add sdhwc support for sam9x7 SoC
  dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7
  dt-bindings: power: reset: atmel,sama5d2-shdwc: add sam9x7
  ARM: at91: Kconfig: add config flag for SAM9X7 SoC
  ARM: configs: at91: enable config flags for sam9x7 SoC family
  ARM: dts: at91: sam9x7: add device tree for SoC
  dt-bindings: arm: add sam9x75 curiosity board
  ARM: dts: at91: sam9x75_curiosity: add sam9x75 curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml   |    6 +
 .../devicetree/bindings/arm/atmel-sysregs.txt |    7 +-
 .../bindings/clock/atmel,at91rm9200-pmc.yaml  |    2 +
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml |    4 +-
 .../crypto/atmel,at91sam9g46-aes.yaml         |    6 +-
 .../crypto/atmel,at91sam9g46-sha.yaml         |    6 +-
 .../crypto/atmel,at91sam9g46-tdes.yaml        |    6 +-
 .../bindings/i2c/atmel,at91sam-i2c.yaml       |    4 +-
 .../interrupt-controller/atmel,aic.txt        |    2 +-
 .../devicetree/bindings/misc/atmel-ssc.txt    |    1 +
 .../devicetree/bindings/mtd/atmel-nand.txt    |    1 +
 .../devicetree/bindings/net/cdns,macb.yaml    |    5 +
 .../bindings/pinctrl/atmel,at91-pinctrl.txt   |    2 +
 .../power/reset/atmel,sama5d2-shdwc.yaml      |    3 +
 .../bindings/pwm/atmel,at91sam-pwm.yaml       |    3 +
 .../reset/atmel,at91sam9260-reset.yaml        |    4 +
 .../bindings/rng/atmel,at91-trng.yaml         |    4 +
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml   |    4 +-
 .../bindings/serial/atmel,at91-usart.yaml     |   12 +-
 .../bindings/sound/atmel,sama5d2-classd.yaml  |    7 +-
 .../sound/microchip,sama7g5-i2smcc.yaml       |   11 +-
 .../bindings/spi/atmel,at91rm9200-spi.yaml    |    1 -
 .../bindings/watchdog/atmel,sama5d4-wdt.yaml  |   12 +-
 arch/arm/boot/dts/microchip/Makefile          |    3 +
 .../dts/microchip/at91-sam9x75_curiosity.dts  |  309 +++++
 arch/arm/boot/dts/microchip/sam9x60.dtsi      |    1 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi       | 1214 +++++++++++++++++
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
 drivers/clk/at91/sam9x7.c                     |  946 +++++++++++++
 drivers/clk/at91/sama7g5.c                    |   42 +-
 drivers/irqchip/irq-atmel-aic5.c              |   12 +-
 drivers/power/reset/Kconfig                   |    4 +-
 drivers/power/reset/at91-sama5d2_shdwc.c      |    1 +
 drivers/soc/atmel/soc.c                       |   23 +
 drivers/soc/atmel/soc.h                       |    9 +
 include/dt-bindings/clock/at91.h              |    4 +
 45 files changed, 2788 insertions(+), 65 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
 create mode 100644 arch/arm/boot/dts/microchip/sam9x7.dtsi
 create mode 100644 arch/arm/mach-at91/sam9x7.c
 create mode 100644 drivers/clk/at91/sam9x7.c

-- 
2.25.1


