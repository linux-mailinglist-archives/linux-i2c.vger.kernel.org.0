Return-Path: <linux-i2c+bounces-479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F87FAC62
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 22:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E0951C20FD0
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 21:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F9846437;
	Mon, 27 Nov 2023 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BDBD5B
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 13:11:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itI-0004lH-8W; Mon, 27 Nov 2023 22:11:40 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00C1q2-Hb; Mon, 27 Nov 2023 22:11:39 +0100
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00FAHs-1P;
	Mon, 27 Nov 2023 22:11:39 +0100
From: Roland Hieber <rhi@pengutronix.de>
Date: Mon, 27 Nov 2023 22:11:06 +0100
Subject: [PATCH 5/5] ARM: dts: add support for Gossen Metrawatt Profitest
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-b4-imx7-var-som-gome-v1-5-f26f88f2d0bc@pengutronix.de>
References: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
In-Reply-To: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Li Yang <leoyang.li@nxp.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Roland Hieber <rhi@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: auto@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

From: Marco Felsch <m.felsch@pengutronix.de>

This is the initial support for the Gossen Metrawatt Profitest MF
(e143_01) board based on a Variscite VAR-SOM-MX7 SoM.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Co-developed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Co-developed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Co-developed-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml   |   7 +
 arch/arm/boot/dts/nxp/imx/Makefile               |   1 +
 arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts | 559 +++++++++++++++++++++++
 3 files changed, 567 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 32b195852a75..b751d289c712 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -900,6 +900,13 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: Variscite VAR-SOM-MX7 based boards
+        items:
+          - enum:
+              - gome,e143_01                 # Gossen Metrawatt Profitest MF (e143_01)
+          - const: variscite,var-som-mx7
+          - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a724d1a7a9a0..f0a68c715a61 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -363,6 +363,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-iris-v2.dtb \
 	imx7d-flex-concentrator.dtb \
 	imx7d-flex-concentrator-mfg.dtb \
+	imx7d-gome-e143_01.dtb \
 	imx7d-mba7.dtb \
 	imx7d-meerkat96.dtb \
 	imx7d-nitrogen7.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts b/arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts
new file mode 100644
index 000000000000..6e98d34b2e54
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Gossen Metrawatt GmbH
+ * Copyright (C) 2022 Marco Felsch, Pengutronix
+ * Copyright (C) 2022 Philipp Zabel, Pengutronix
+ * Copyright (C) 2022 Roland Hieber, Pengutronix
+ */
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "imx7d-var-som-mx7.dtsi"
+
+/ {
+	model = "Gossen Metrawatt Profitest MF (e143_01)";
+	compatible = "gome,e143_01", "variscite,var-som-mx7", "fsl,imx7d";
+
+	aliases {
+		gpio7 = &gpio8;
+		rtc0 = &rtc0;
+	};
+
+	max98357a: audio-codec {
+		compatible = "maxim,max98357a";
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sdmode>;
+		sdmode-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>; // Pin 60 AUDIO_SHDN_B
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>, <&pinctrl_gpio_keys_2>;
+		autorepeat;
+
+		button-0 {
+			label = "S0";
+			gpios = <&gpio1 12 GPIO_ACTIVE_LOW>; // Pin 183 BTN_S0_ESC
+			linux,code = <KEY_ESC>;
+			wakeup-source;
+		};
+
+		button-1 {
+			label = "S1";
+			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>; // Pin 185 BTN_S1_MEM
+			linux,code = <KEY_DOCUMENTS>;
+			wakeup-source;
+		};
+
+		button-2 {
+			label = "S2";
+			gpios = <&gpio1 10 GPIO_ACTIVE_LOW>; // Pin 181 BTN_S2_HLP
+			linux,code = <KEY_HELP>;
+			wakeup-source;
+		};
+
+		button-3 {
+			label = "S3";
+			gpios = <&gpio1 1 GPIO_ACTIVE_LOW>; // Pin 1 BTN_S3_STA
+			linux,code = <KEY_PROG1>;
+			wakeup-source;
+		};
+
+		button-4 {
+			label = "S4";
+			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>; // Pin 168 BTN_S4_IDN
+			linux,code = <KEY_PROG2>;
+			wakeup-source;
+		};
+
+		button-5 {
+			label = "S5";
+			gpios = <&gpio3 24 GPIO_ACTIVE_LOW>; // Pin 28 BTN_S5
+			linux,code = <KEY_F5>;
+		};
+
+		button-6 {
+			label = "S6";
+			gpios = <&gpio3 5 GPIO_ACTIVE_LOW>; // Pin 40 BTN_S6
+			linux,code = <KEY_F6>;
+		};
+
+		button-7 {
+			label = "S7";
+			gpios = <&gpio3 22 GPIO_ACTIVE_LOW>; // Pin 38 BTN_S7
+			linux,code = <KEY_F7>;
+		};
+
+		button-8 {
+			label = "S8";
+			gpios = <&gpio3 4 GPIO_ACTIVE_LOW>; // Pin 36 BTN_S8
+			linux,code = <KEY_F8>;
+		};
+
+		button-9 {
+			label = "S9";
+			gpios = <&gpio3 27 GPIO_ACTIVE_LOW>; // Pin 20 BTN_S9
+			linux,code = <KEY_F9>;
+		};
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_poweroff>;
+		gpios = <&gpio7 14 GPIO_ACTIVE_LOW>; // Pin 7 POWER_OFF_B
+		input;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc2 0>, // ARS_VAL
+			      <&adc2 1>, // VBAT_VAL
+			      <&adc2 2>, // LCD_BACKLIGHT_VAL
+			      <&adc2 3>; // VCC_5V0_FB
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_debug_led>;
+
+		test-led-1 {
+			label = "test-led-1:red";
+			gpios = <&gpio3 2 GPIO_ACTIVE_LOW>; // Pin 44 LED_TEST1_B
+			color = <LED_COLOR_ID_RED>;
+			linux,default-trigger = "disk-activity";
+		};
+
+		test-led-2 {
+			label = "test-led-2:red";
+			gpios = <&gpio3 3 GPIO_ACTIVE_LOW>; // Pin 46 LED_TEST2_B
+			color = <LED_COLOR_ID_RED>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	leds2 {
+		compatible = "gpio-leds";
+
+		led_netz_gn {
+			label = "mains:green";
+			gpios = <&gpio8 9 GPIO_ACTIVE_LOW>; // LED_NETZ_GN
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_netz_rt {
+			label = "mains:red";
+			gpios = <&gpio8 8 GPIO_ACTIVE_LOW>; // LED_NETZ_RT
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+		};
+
+		led_debug_gn {
+			label = "debug:green";
+			gpios = <&gpio8 0 GPIO_ACTIVE_LOW>; // LED_DEBUG_GN
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_debug_rt {
+			label = "debug:red";
+			gpios = <&gpio8 1 GPIO_ACTIVE_LOW>; // LED_DEBUG_RT
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led_ul_gn {
+			label = "ulrl:green";
+			gpios = <&gpio8 2 GPIO_ACTIVE_LOW>; // LED_UL_GN
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_ul_rt {
+			label = "ulrl:red";
+			gpios = <&gpio8 6 GPIO_ACTIVE_LOW>; // LED_UL_RT
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+		};
+
+		led_rcd_gn {
+			label = "rcd:green";
+			gpios = <&gpio8 3 GPIO_ACTIVE_LOW>; // LED_RCD_GN
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led_rcd_rt {
+			label = "rcd:red";
+			gpios = <&gpio8 7 GPIO_ACTIVE_LOW>; // LED_RCD_RT
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+		};
+	};
+
+	reg_vled_backlight: regulator-vled-backlight {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mipi_backlight>;
+		regulator-name = "VLED_BACKLIGHT";
+		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <20000000>;
+		regulator-max-microvolt = <20000000>;
+		enable-active-high;
+	};
+
+	reg_vcc_3v3_per: regulator-vcc-3v3-per {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vcc_3v3_per>;
+		regulator-name = "VCC_3V3_PER";
+		gpio = <&gpio2 26 GPIO_ACTIVE_HIGH>; // Pin 83 VCC_3V3_PER_EN
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <30000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_vcc_5v0_per: regulator-vcc-5v0-per {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_vcc_5v0_per>;
+		regulator-name = "VCC_5V0_PER";
+		gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>; // Pin 75 VCC_5V0_PER_EN
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_imt: regulator-imt {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_imt>;
+		regulator-name = "VCC_IMT";
+		gpio = <&gpio3 10 GPIO_ACTIVE_HIGH>; // Pin 66 MT_EN
+		regulator-min-microvolt = <9000000>;
+		regulator-max-microvolt = <9000000>;
+		enable-active-high;
+	};
+
+	reg_vcc_1v8_alg: regulator-vcc-1v8-alg {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8_ALG";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_vcc_3v3_per>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "max98357aaudio";
+		/delete-property/ simple-audio-card,widgets;
+		/delete-property/ simple-audio-card,routing;
+		simple-audio-card,format = "i2s";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&max98357a>;
+		};
+	};
+
+	uc-imt-power {
+		compatible = "reg-userspace-consumer";
+		regulator-name = "reg_imt-consumer";
+		regulator-supplies = "vcc";
+		vcc-supply = <&reg_imt>;
+	};
+};
+
+&adc2 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&i2c2 {
+	/delete-node/ wm8731@1a;
+
+	/* DS1339 RTC module */
+	rtc0: rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		trickle-resistor-ohms = <250>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 GPIO_ACTIVE_LOW>; // Pin 120 RTC_INT_B
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio4 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; // Pin 175 I2C4_SCL
+	sda-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; // Pin 173 I2C4_SDA
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio8: max7312@23 {
+		compatible = "maxim,max7312";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "LED_DEBUG_GN", "LED_DEBUG_RT", "LED_UL_GN", "LED_RCD_GN",
+				  "", "", "LED_UL_RT", "LED_RCD_RT",
+				  "LED_NETZ_RT", "LED_NETZ_GN", "", "",
+				  "DP_HW_CODE_1", "DP_HW_CODE_2", "DP_HW_CODE_3", "DP_HW_CODE_4";
+		vcc-supply = <&reg_vcc_3v3_per>;
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "GWDOG_RST_B", "BTN_S3_STA", "BTN_S4_IDN", "",
+			  "", "", "", "USB_HOST_PWR_EN",
+			  "", "", "BTN_S2_HLP", "BTN_S1_MEM",
+			  "BTN_S0_ESC", "RTC_INT_B", "SOM: bt reg on";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "",
+			  "DBG_GPIO1", "DBG_GPIO2", "DBG_GPIO3", "DBG_GPIO4",
+			  "", "", "", "",
+			  "MT_RXD", "MT_TXD", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "VCC_3V3_PER_EN", "",
+			  "DSI_RESET", "VCC_5V0_PER_EN";
+};
+
+&gpio3 {
+	gpio-line-names = "", "", "LED_TEST1_B", "LED_TEST2_B",
+			  "BTN_S8", "BTN_S6", "MT_RESET", "",
+			  "", "", "MT_EN", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "AUDIO_SHDN_B", "", "BTN_S7", "",
+			  "BTN_S5", "", "", "BTN_S9",
+			  "BATT_LOW";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "I2C1_SCL", "I2C1_SDA", "I2C2_SCL", "I2C2_SDA",
+			  "", "", "I2C4_SCL", "I2C4_SDA",
+			  "", "", "", "",
+			  "", "", "", "HIL_SPI_CS0";
+};
+
+&gpio5 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "SOM: ethphy0 reset";
+};
+
+&gpio6 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "SOM: sd3_pwr (eMMC)";
+};
+
+&gpio7 {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "LCD_BACKLIGHT_EN", "", "POWER_OFF_B";
+};
+
+&lcdif {
+	assigned-clocks = <&clks IMX7D_LCDIF_PIXEL_ROOT_SRC>,
+			  <&clks IMX7D_PLL_VIDEO_POST_DIV>;
+	assigned-clock-parents = <&clks IMX7D_PLL_VIDEO_POST_DIV>;
+	assigned-clock-rates = <0>, <128000000>;
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <850000000>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "tianma,tm050jdhg33", "ilitek,ili9881c";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mipi_panel>;
+		reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>; // Pin 73 DSI_RESET
+		power-supply = <&reg_vcc_3v3_per>;
+		dsi-lanes = <2>;
+
+		rotation = <90>;
+
+		ilitek,enable-internal-backlight;
+		default-brightness = <2047>;
+		ilitek,pwm-frequency = <50000>;
+		ilitek,backlight-supply = <&reg_vled_backlight>;
+	};
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clks IMX7D_SAI3_ROOT_SRC>,
+			  <&clks IMX7D_SAI3_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+	assigned-clock-rates = <0>, <36864000>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+};
+
+&iomuxc_lpsr {
+	pinctrl_gpio_keys_2: pinctrl_gpio_keys_2grp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1        0x0C
+			MX7D_PAD_LPSR_GPIO1_IO02__GPIO1_IO2        0x0C
+		>;
+	};
+
+	pinctrl_usbotg2_pwr: pinctrl_usbotg2_pwrgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7        0x14
+		>;
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_keys: pinctrl-gpio-keysgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO10__GPIO1_IO10            0x0000000C
+			MX7D_PAD_GPIO1_IO11__GPIO1_IO11            0x0000000C
+			MX7D_PAD_GPIO1_IO12__GPIO1_IO12            0x0000000C
+			MX7D_PAD_LCD_DATA00__GPIO3_IO5             0x0000000C
+			MX7D_PAD_LCD_DATA17__GPIO3_IO22            0x0000000C
+			MX7D_PAD_LCD_DATA19__GPIO3_IO24            0x0000000C
+			MX7D_PAD_LCD_DATA22__GPIO3_IO27            0x0000000C
+			MX7D_PAD_LCD_RESET__GPIO3_IO4              0x0000000C
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX7D_PAD_I2C4_SCL__I2C4_SCL                0x4000007f
+			MX7D_PAD_I2C4_SDA__I2C4_SDA                0x4000007f
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4-gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_I2C4_SCL__GPIO4_IO14              0x4000007f
+			MX7D_PAD_I2C4_SDA__GPIO4_IO15              0x4000007f
+		>;
+	};
+
+	pinctrl_mipi_backlight: mipi-backlightgrp {
+		fsl,pins = <
+			MX7D_PAD_ENET1_TX_CLK__GPIO7_IO12          0x0000001B
+		>;
+	};
+
+	pinctrl_mipi_panel: mipi-panelgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_BDR0__GPIO2_IO28             0x0000001B /* DSI_RESET */
+		>;
+	};
+
+	pinctrl_poweroff: pinctrl_poweroffgrp {
+		fsl,pins = <
+			MX7D_PAD_ENET1_CRS__GPIO7_IO14             0x0000001B
+		>;
+	};
+
+	pinctrl_reg_vcc_3v3_per: pinctrl_reg_vcc_3v3_pergrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_GDRL__GPIO2_IO26             0x0000001B
+		>;
+	};
+
+	pinctrl_reg_vcc_5v0_per: pinctrl_reg_vcc_5v0_pergrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_BDR1__GPIO2_IO29             0x0000001B
+		>;
+	};
+
+	pinctrl_reg_imt: pinctrl_reg_imtgrp {
+		fsl,pins = <
+			MX7D_PAD_LCD_DATA05__GPIO3_IO10            0x0000001B
+		>;
+	};
+
+	pinctrl_rtc: pinctrl_rtcgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO13__GPIO1_IO13            0x0000001B
+		>;
+	};
+
+	pinctrl_sai3: pinctrl_sai3grp {
+		fsl,pins = <
+			MX7D_PAD_SD1_DATA1__SAI3_TX_BCLK           0x0000001F
+			MX7D_PAD_SD1_DATA2__SAI3_TX_SYNC           0x0000001F
+			MX7D_PAD_SD1_DATA3__SAI3_TX_DATA0          0x00000030
+		>;
+	};
+
+	pinctrl_sdmode: pinctrl_sdmodegrp {
+		fsl,pins = <
+			MX7D_PAD_LCD_DATA15__GPIO3_IO20            0x0000001F
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX7D_PAD_UART1_TX_DATA__UART1_DCE_TX	0x79 /* DEBUG_UART1_TXD */
+			MX7D_PAD_UART1_RX_DATA__UART1_DCE_RX	0x79 /* DEBUG_UART1_RXD */
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA12__UART7_DCE_RX	0x79
+			MX7D_PAD_EPDC_DATA13__UART7_DCE_TX	0x79
+		>;
+	};
+
+	pinctrl_debug_led: pinctrl_debug_ledgrp {
+		fsl,pins = <
+			MX7D_PAD_LCD_HSYNC__GPIO3_IO2              0x00000003
+			MX7D_PAD_LCD_VSYNC__GPIO3_IO3              0x00000003
+		>;
+	};
+};

-- 
2.39.2


