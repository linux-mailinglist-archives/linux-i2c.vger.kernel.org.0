Return-Path: <linux-i2c+bounces-478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1617FAC5D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 22:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70AEE281D2D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 21:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0142F45BF8;
	Mon, 27 Nov 2023 21:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE74D62
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 13:11:49 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itI-0004lJ-8S; Mon, 27 Nov 2023 22:11:40 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00C1q1-HP; Mon, 27 Nov 2023 22:11:39 +0100
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00FAHq-1N;
	Mon, 27 Nov 2023 22:11:39 +0100
From: Roland Hieber <rhi@pengutronix.de>
Date: Mon, 27 Nov 2023 22:11:05 +0100
Subject: [PATCH 4/5] ARM: dts: add Variscite VAR-SOM-MX7 System on Module
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-b4-imx7-var-som-gome-v1-4-f26f88f2d0bc@pengutronix.de>
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
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: auto@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

From: Marco Felsch <m.felsch@pengutronix.de>

Add DTSI file of Variscite VAR-SOM-MX7 System on Module in a basic
version. While we don't have a VAR-MX7 development board at hand, we
will use this DTSI as base for a custom board in a later commit.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Co-developed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi | 607 +++++++++++++++++++++++
 1 file changed, 607 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi
new file mode 100644
index 000000000000..29b9b9305b81
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi
@@ -0,0 +1,607 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2015 Freescale Semiconductor, Inc.
+ * Copyright (C) 2016-2017 Variscite Ltd.
+ * Copyright (C) 2022 Philipp Zabel, Pengutronix
+ * Copyright (C) 2022 Roland Hieber, Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <dt-bindings/input/input.h>
+#include "imx7d.dtsi"
+
+/ {
+	model = "Variscite i.MX7 Dual VAR-SOM-MX7";
+	compatible = "variscite,var-som-mx7", "fsl,imx7d";
+
+	reg_vref_1v8: regulator-vref-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vref-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usb_otg1_vbus: regulator-usbotg1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg1_vbus>;
+		regulator-name = "usb_otg1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb_otg2_vbus: regulator-usbotg2-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbotg2_vbus>;
+		regulator-name = "usb_otg2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wlreg_on: regulator-wlreg-on {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "wlreg_on";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8731>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+};
+
+&adc2 {
+	vref-supply = <&reg_vref_1v8>;
+};
+
+&cpu0 {
+	cpu-supply = <&sw1a_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&sw1a_reg>;
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>;
+	phy-supply = <&vgen3_reg>;
+	assigned-clocks = <&clks IMX7D_ENET_PHY_REF_ROOT_SRC>,
+			  <&clks IMX7D_ENET_AXI_ROOT_SRC>,
+			  <&clks IMX7D_ENET1_TIME_ROOT_SRC>,
+			  <&clks IMX7D_ENET1_TIME_ROOT_CLK>,
+			  <&clks IMX7D_ENET_AXI_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_25M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_250M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
+	assigned-clock-rates = <0>, <0>, <0>, <100000000>, <250000000>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	phy-reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	phy-reset-post-delay = <20>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+		};
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
+};
+
+&fec2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet2>;
+	phy-supply = <&vgen3_reg>;
+	assigned-clocks = <&clks IMX7D_ENET_PHY_REF_ROOT_SRC>,
+			  <&clks IMX7D_ENET_AXI_ROOT_SRC>,
+			  <&clks IMX7D_ENET2_TIME_ROOT_SRC>,
+			  <&clks IMX7D_ENET2_TIME_ROOT_CLK>,
+			  <&clks IMX7D_ENET_AXI_ROOT_CLK>;
+	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_25M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_250M_CLK>,
+				 <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
+	assigned-clock-rates = <0>, <0>, <0>, <100000000>, <250000000>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy1>;
+	phy-reset-gpios = <&gpio4 3 GPIO_ACTIVE_LOW>;
+	phy-reset-post-delay = <20>;
+};
+
+&gpio6 {
+	sd3-pwr-hog {
+		gpio-hog;
+		gpios = <11 0>;
+		output-low;
+		line-name = "sd3_pwr";
+	};
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio4 8 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 9 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pmic@8 {
+		compatible = "fsl,pfuze3000";
+		reg = <0x08>;
+
+		regulators {
+			sw1a_reg: sw1a {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			/* use sw1c_reg to align with pfuze100/pfuze200 */
+			sw1c_reg: sw1b {
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1475000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <6250>;
+			};
+
+			sw2_reg: sw2 {
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw3a_reg: sw3 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1650000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			swbst_reg: swbst {
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5150000>;
+			};
+
+			snvs_reg: vsnvs {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vref_reg: vrefddr {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vgen1_reg: vldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen2_reg: vldo2 {
+				status = "disabled";
+			};
+
+			vgen3_reg: vccsd {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vgen4_reg: v33 {
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <2850000>;
+				regulator-always-on;
+			};
+
+			vgen5_reg: vldo3 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vgen6_reg: vldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	eeprom@50 {
+		compatible = "rohm,br24g04", "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+		num-addresses = <2>;
+		address-width = <8>;
+		read-only;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio4 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 11 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8731: wm8731@1a {
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vgen6_reg>;
+		HPVDD-supply = <&vgen6_reg>;
+		DBVDD-supply = <&vgen6_reg>;
+		DCVDD-supply = <&vgen6_reg>;
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_CLK>;
+		clock-names = "mclk";
+		assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
+				  <&clks IMX7D_PLL_AUDIO_POST_DIV>,
+				  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+		assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+		assigned-clock-rates = <0>, <884736000>, <12288000>;
+	};
+};
+
+&sai1 {
+	assigned-clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
+			  <&clks IMX7D_PLL_AUDIO_POST_DIV>,
+			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
+	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
+	assigned-clock-rates = <0>, <884736000>, <12288000>;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&snvs_rtc {
+	status = "disabled";
+};
+
+&uart1 {
+	assigned-clocks = <&clks IMX7D_UART1_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+};
+
+&uart2 {
+	assigned-clocks = <&clks IMX7D_UART2_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
+};
+
+&uart3 {
+	assigned-clocks = <&clks IMX7D_UART3_ROOT_SRC>;
+	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usbotg1 {
+	vbus-supply = <&reg_usb_otg1_vbus>;
+	dr_mode = "host";
+};
+
+&usbotg2 {
+	vbus-supply = <&reg_usb_otg2_vbus>;
+	dr_mode = "host";
+};
+
+&usdhc2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_wlan>, <&pinctrl_bt>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_wlan>, <&pinctrl_bt>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_wlan>, <&pinctrl_bt>;
+	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_wlan_sleep>, <&pinctrl_bt_sleep>;
+	keep-power-in-suspend;
+	non-removable;
+	vmmc-supply = <&wlreg_on>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* eMMC */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3_ctrl>, <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_ctrl>, <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_ctrl>, <&pinctrl_usdhc3_200mhz>;
+	vmmc-supply = <&vgen3_reg>;
+	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
+	assigned-clock-rates = <400000000>;
+	no-1-8-v;
+	no-sdio;
+	no-sd;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
+};
+
+&iomuxc_lpsr {
+	pinctrl_usbotg1_vbus: usbotg1-vbusgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5		0x14
+		>;
+	};
+
+	pinctrl_usbotg2_vbus: usbotg2-vbusgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7		0x14
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B		0x74
+		>;
+	};
+
+	pinctrl_wlan: wlangrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x09 /* WL_REG_ON */
+			MX7D_PAD_LPSR_GPIO1_IO03__OSC32K_32K_OUT	0xb0 /* WIFI Slow clock */
+		>;
+	};
+
+	pinctrl_wlan_sleep: wlan-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4		0x10 /* WL_REG_ON */
+			MX7D_PAD_LPSR_GPIO1_IO03__OSC32K_32K_OUT	0x10 /* WIFI Slow clock */
+		>;
+	};
+};
+
+&iomuxc {
+
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO14__GPIO1_IO14		0x80000000  /* bt reg on */
+		>;
+	};
+
+	pinctrl_bt_sleep: bt-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO14__GPIO1_IO14			0x10  /* bt reg on */
+		>;
+	};
+
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CD_B__ENET1_MDIO			0x3
+			MX7D_PAD_SD2_WP__ENET1_MDC			0x3
+			MX7D_PAD_ENET1_RGMII_TXC__ENET1_RGMII_TXC	0x1
+			MX7D_PAD_ENET1_RGMII_TD0__ENET1_RGMII_TD0	0x1
+			MX7D_PAD_ENET1_RGMII_TD1__ENET1_RGMII_TD1	0x1
+			MX7D_PAD_ENET1_RGMII_TD2__ENET1_RGMII_TD2	0x1
+			MX7D_PAD_ENET1_RGMII_TD3__ENET1_RGMII_TD3	0x1
+			MX7D_PAD_ENET1_RGMII_TX_CTL__ENET1_RGMII_TX_CTL	0x1
+			MX7D_PAD_ENET1_RGMII_RXC__ENET1_RGMII_RXC	0x1
+			MX7D_PAD_ENET1_RGMII_RD0__ENET1_RGMII_RD0	0x1
+			MX7D_PAD_ENET1_RGMII_RD1__ENET1_RGMII_RD1	0x1
+			MX7D_PAD_ENET1_RGMII_RD2__ENET1_RGMII_RD2	0x1
+			MX7D_PAD_ENET1_RGMII_RD3__ENET1_RGMII_RD3	0x1
+			MX7D_PAD_ENET1_RGMII_RX_CTL__ENET1_RGMII_RX_CTL	0x1
+			MX7D_PAD_SD2_RESET_B__GPIO5_IO11	0x59  /* ethphy0 reset */
+		>;
+	};
+
+	pinctrl_enet2: enet2grp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_GDSP__ENET2_RGMII_TXC		0x1
+			MX7D_PAD_EPDC_SDCE2__ENET2_RGMII_TD0		0x1
+			MX7D_PAD_EPDC_SDCE3__ENET2_RGMII_TD1		0x1
+			MX7D_PAD_EPDC_GDCLK__ENET2_RGMII_TD2		0x1
+			MX7D_PAD_EPDC_GDOE__ENET2_RGMII_TD3		0x1
+			MX7D_PAD_EPDC_GDRL__ENET2_RGMII_TX_CTL		0x1
+			MX7D_PAD_EPDC_SDCE1__ENET2_RGMII_RXC		0x1
+			MX7D_PAD_EPDC_SDCLK__ENET2_RGMII_RD0		0x1
+			MX7D_PAD_EPDC_SDLE__ENET2_RGMII_RD1		0x1
+			MX7D_PAD_EPDC_SDOE__ENET2_RGMII_RD2		0x1
+			MX7D_PAD_EPDC_SDSHR__ENET2_RGMII_RD3		0x1
+			MX7D_PAD_EPDC_SDCE0__ENET2_RGMII_RX_CTL		0x1
+			MX7D_PAD_UART2_TX_DATA__GPIO4_IO3	0x59  /* ethphy1 reset */
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__I2C1_SDA	0x4000007f
+			MX7D_PAD_I2C1_SCL__I2C1_SCL	0x4000007f
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_I2C1_SDA__GPIO4_IO9	0x4000007f
+			MX7D_PAD_I2C1_SCL__GPIO4_IO8	0x4000007f
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX7D_PAD_I2C2_SDA__I2C2_SDA	0x4000007f
+			MX7D_PAD_I2C2_SCL__I2C2_SCL	0x4000007f
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX7D_PAD_I2C2_SDA__GPIO4_IO11	0x4000007f
+			MX7D_PAD_I2C2_SCL__GPIO4_IO10	0x4000007f
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX7D_PAD_UART3_TX_DATA__UART3_DCE_TX    0x79
+			MX7D_PAD_UART3_RX_DATA__UART3_DCE_RX    0x79
+			MX7D_PAD_UART3_CTS_B__UART3_DCE_CTS     0x79
+			MX7D_PAD_UART3_RTS_B__UART3_DCE_RTS     0x79
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD		0x59
+			MX7D_PAD_SD2_CLK__SD2_CLK		0x19
+			MX7D_PAD_SD2_DATA0__SD2_DATA0		0x59
+			MX7D_PAD_SD2_DATA1__SD2_DATA1		0x59
+			MX7D_PAD_SD2_DATA2__SD2_DATA2		0x59
+			MX7D_PAD_SD2_DATA3__SD2_DATA3		0x59
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD		0x5a
+			MX7D_PAD_SD2_CLK__SD2_CLK		0x1a
+			MX7D_PAD_SD2_DATA0__SD2_DATA0		0x5a
+			MX7D_PAD_SD2_DATA1__SD2_DATA1		0x5a
+			MX7D_PAD_SD2_DATA2__SD2_DATA2		0x5a
+			MX7D_PAD_SD2_DATA3__SD2_DATA3		0x5a
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD		0x5b
+			MX7D_PAD_SD2_CLK__SD2_CLK		0x1b
+			MX7D_PAD_SD2_DATA0__SD2_DATA0		0x5b
+			MX7D_PAD_SD2_DATA1__SD2_DATA1		0x5b
+			MX7D_PAD_SD2_DATA2__SD2_DATA2		0x5b
+			MX7D_PAD_SD2_DATA3__SD2_DATA3		0x5b
+		>;
+	};
+
+	pinctrl_usdhc2_sleep: usdhc2-sleepgrp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__GPIO5_IO13		0x10
+			MX7D_PAD_SD2_CLK__GPIO5_IO12		0x10
+			MX7D_PAD_SD2_DATA0__GPIO5_IO14		0x10
+			MX7D_PAD_SD2_DATA1__GPIO5_IO15		0x10
+			MX7D_PAD_SD2_DATA2__GPIO5_IO16		0x10
+			MX7D_PAD_SD2_DATA3__GPIO5_IO17		0x10
+		>;
+	};
+
+	pinctrl_usdhc3_ctrl: usdhc3-ctrlgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x19
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5a
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5a
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5a
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5a
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5a
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5a
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5a
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX7D_PAD_SD3_CMD__SD3_CMD		0x5b
+			MX7D_PAD_SD3_CLK__SD3_CLK		0x1b
+			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5b
+			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5b
+			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5b
+			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5b
+			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5b
+			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5b
+			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5b
+			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5b
+		>;
+	};
+};

-- 
2.39.2


