Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7019073C2BA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 23:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjFWVYY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 17:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbjFWVX6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 17:23:58 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174BB2727;
        Fri, 23 Jun 2023 14:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687555414; x=1719091414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xGfpaAWl8R4dQq8aTwhQbc9JaUMdQXtgHMiT4gghfgE=;
  b=i1hCY247AvSFVemOpLofOpT8imf4xbubZbe0f6QMjbSQ7xcqXM8ws11G
   P9CQHmPXB3Pzk6PbBogpz+wEVjJ06wVegOviBRDzNbcinpeNipXCztdzU
   2duRwC7BoZRrwIDwORGr5qLQXNUW6IqTyhEYCTVGbjZB0GfnHdgndmbr5
   Bii8xeYJtF4g5Whmiyvjl5NtbX8T73yhhs5g6RdUOzERsdxTOMepLN2V9
   h4tKODnAgrchtiTpMsEdaHossr3cwmcdNcP7ThHpLSLbqzDUxZFHXiZZr
   PF9spGBWscuBs51fpXpWLvXZkjBf1XZ8cMCI4YWyZagl9+hZ41XWtXi1Q
   g==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="219557463"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 14:23:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:53:26 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:52:57 -0700
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
Subject: [PATCH v2 45/45] ARM: dts: at91: sam9x75_curiosity: add device tree for sam9x75 curiosity board
Date:   Sat, 24 Jun 2023 02:00:56 +0530
Message-ID: <20230623203056.689705-46-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
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

Add device tree file for sam9x75 curiosity board.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/Makefile                   |   2 +
 arch/arm/boot/dts/at91-sam9x75_curiosity.dts | 336 +++++++++++++++++++
 2 files changed, 338 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91-sam9x75_curiosity.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 59829fc90315..31f357f8e947 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -53,6 +53,8 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
 dtb-$(CONFIG_SOC_SAM9X60) += \
 	at91-sam9x60_curiosity.dtb \
 	at91-sam9x60ek.dtb
+dtb-$(CONFIG_SOC_SAM9X7) += \
+	at91-sam9x75_curiosity.dtb
 dtb-$(CONFIG_SOC_SAM_V7) += \
 	at91-kizbox2-2.dtb \
 	at91-kizbox3-hs.dtb \
diff --git a/arch/arm/boot/dts/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/at91-sam9x75_curiosity.dts
new file mode 100644
index 000000000000..56d3af549201
--- /dev/null
+++ b/arch/arm/boot/dts/at91-sam9x75_curiosity.dts
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * at91-sam9x75_curiosity.dts - Device Tree file for Microchip SAM9X75 Curiosity board
+ *
+ * Copyright (C) 2023 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
+ */
+/dts-v1/;
+#include "sam9x7.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Microchip SAM9X75 Curiosity";
+	compatible = "microchip,sam9x75-curiosity", "microchip,sam9x7", "atmel,at91sam9";
+
+	aliases {
+		i2c0 = &i2c6;
+		i2c1 = &i2c7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		clock-slowxtal {
+			clock-frequency = <32768>;
+		};
+
+		clock-mainxtal {
+			clock-frequency = <24000000>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_key_gpio_default>;
+		status = "okay";
+
+		button-user {
+			label = "USER";
+			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_PROG1>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_led_gpio_default>;
+		status = "okay";
+
+		led-0 {
+			label = "red";
+			gpios = <&pioC 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			label = "green";
+			gpios = <&pioC 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "blue";
+			gpios = <&pioC 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x10000000>;
+	};
+};
+
+&dbgu {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_dbgu>;
+	status = "okay";
+};
+
+&dma0 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&flx6 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+
+	i2c6: i2c@600 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flx6_default>;
+		i2c-analog-filter;
+		i2c-digital-filter;
+		i2c-digital-filter-width-ns = <35>;
+		status = "okay";
+
+		mcp16502@5b {
+			compatible = "microchip,mcp16502";
+			reg = <0x5b>;
+			status = "okay";
+
+			regulators {
+				vdd_3v3: VDD_IO {
+					regulator-name = "VDD_IO";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3600000>;
+					regulator-initial-mode = <2>;
+					regulator-allowed-modes = <2>, <4>;
+					regulator-always-on;
+
+					regulator-state-standby {
+						regulator-on-in-suspend;
+						regulator-mode = <4>;
+					};
+
+					regulator-state-mem {
+						regulator-mode = <4>;
+					};
+				};
+
+				vddioddr: VDD_DDR {
+					regulator-name = "VDD_DDR";
+					regulator-min-microvolt = <1283000>;
+					regulator-max-microvolt = <1450000>;
+					regulator-initial-mode = <2>;
+					regulator-allowed-modes = <2>, <4>;
+					regulator-always-on;
+
+					regulator-state-standby {
+						regulator-on-in-suspend;
+						regulator-mode = <4>;
+					};
+
+					regulator-state-mem {
+						regulator-on-in-suspend;
+						regulator-mode = <4>;
+					};
+				};
+
+				vddcore: VDD_CORE {
+					regulator-name = "VDD_CORE";
+					regulator-min-microvolt = <500000>;
+					regulator-max-microvolt = <1210000>;
+					regulator-initial-mode = <2>;
+					regulator-allowed-modes = <2>, <4>;
+					regulator-always-on;
+
+					regulator-state-standby {
+						regulator-on-in-suspend;
+						regulator-mode = <4>;
+					};
+
+					regulator-state-mem {
+						regulator-mode = <4>;
+					};
+				};
+
+				vddcpu: VDD_OTHER {
+					regulator-name = "VDD_OTHER";
+					regulator-min-microvolt = <1700000>;
+					regulator-max-microvolt = <3600000>;
+					regulator-initial-mode = <2>;
+					regulator-allowed-modes = <2>, <4>;
+					regulator-ramp-delay = <3125>;
+					regulator-always-on;
+
+					regulator-state-standby {
+						regulator-on-in-suspend;
+						regulator-mode = <4>;
+					};
+
+					regulator-state-mem {
+						regulator-mode = <4>;
+					};
+				};
+
+				vldo1: LDO1 {
+					regulator-name = "LDO1";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <3700000>;
+					regulator-always-on;
+
+					regulator-state-standby {
+						regulator-on-in-suspend;
+					};
+				};
+
+				vldo2: LDO2 {
+					regulator-name = "LDO2";
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <3700000>;
+
+					regulator-state-standby {
+						regulator-on-in-suspend;
+					};
+				};
+			};
+		};
+	};
+};
+
+&flx7 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+
+	i2c7: i2c@600 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flx7_default>;
+		i2c-analog-filter;
+		i2c-digital-filter;
+		i2c-digital-filter-width-ns = <35>;
+		status = "okay";
+	};
+};
+
+&ohci0 {
+	num-ports = <3>;
+	atmel,vbus-gpio = <0
+			   &pioC 27 GPIO_ACTIVE_HIGH
+			   &pioB 18 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb_default>;
+	status = "okay";
+};
+
+&pinctrl {
+
+	dbgu {
+		pinctrl_dbgu: dbgu-0 {
+			atmel,pins = <AT91_PIOA 26 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+				      AT91_PIOA 27 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+		};
+	};
+
+	flexcom {
+		pinctrl_flx6_default: flx6_twi {
+			atmel,pins =
+				<AT91_PIOA 24 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
+				 AT91_PIOA 25 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
+		};
+
+		pinctrl_flx7_default: flx7_twi {
+			atmel,pins =
+				<AT91_PIOC 0 AT91_PERIPH_C AT91_PINCTRL_PULL_UP
+				 AT91_PIOC 1 AT91_PERIPH_C AT91_PINCTRL_PULL_UP>;
+		};
+	};
+
+	gpio_keys {
+		pinctrl_key_gpio_default: pinctrl_key_gpio {
+			atmel,pins = <AT91_PIOC 9 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+
+	leds {
+		pinctrl_led_gpio_default: pinctrl_led_gpio {
+			atmel,pins = <AT91_PIOC 19 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+				      AT91_PIOC 21 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+				      AT91_PIOC 20 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+
+	ohci0 {
+		pinctrl_usb_default: usb_default {
+			atmel,pins = <AT91_PIOC 27 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+				      AT91_PIOB 18 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+
+	sdmmc0 {
+		pinctrl_sdmmc0_default: sdmmc0 {
+			atmel,pins =
+				<AT91_PIOA 2 AT91_PERIPH_A (AT91_PINCTRL_DRIVE_STRENGTH_HI | AT91_PINCTRL_SLEWRATE_DIS)					/* PA2 CK  periph A with pullup */
+				 AT91_PIOA 1 AT91_PERIPH_A (AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DRIVE_STRENGTH_HI | AT91_PINCTRL_SLEWRATE_DIS)		/* PA1 CMD periph A with pullup */
+				 AT91_PIOA 0 AT91_PERIPH_A (AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DRIVE_STRENGTH_HI | AT91_PINCTRL_SLEWRATE_DIS)		/* PA0 DAT0 periph A */
+				 AT91_PIOA 3 AT91_PERIPH_A (AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DRIVE_STRENGTH_HI | AT91_PINCTRL_SLEWRATE_DIS)		/* PA3 DAT1 periph A with pullup */
+				 AT91_PIOA 4 AT91_PERIPH_A (AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DRIVE_STRENGTH_HI | AT91_PINCTRL_SLEWRATE_DIS)		/* PA4 DAT2 periph A with pullup */
+				 AT91_PIOA 5 AT91_PERIPH_A (AT91_PINCTRL_PULL_UP | AT91_PINCTRL_DRIVE_STRENGTH_HI | AT91_PINCTRL_SLEWRATE_DIS)>;	/* PA5 DAT3 periph A with pullup */
+		};
+	};
+
+	usb0 {
+		pinctrl_usba_vbus: usba_vbus {
+			atmel,pins = <AT91_PIOC 8 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+}; /* pinctrl */
+
+&rtt {
+	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
+};
+
+&sdmmc0 {
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdmmc0_default>;
+	cd-gpios = <&pioA 23 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	status = "okay";
+};
+
+&shutdown_controller {
+	atmel,shdwc-debouncer = <976>;
+	status = "okay";
+
+	input@0 {
+		reg = <0>;
+	};
+};
+
+&trng {
+	status = "okay";
+};
+
+&usb0 {
+	atmel,vbus-gpio = <&pioC 8 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usba_vbus>;
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
-- 
2.25.1

