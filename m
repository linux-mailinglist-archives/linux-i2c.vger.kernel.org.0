Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2B85392B6
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 15:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345173AbiEaNxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 09:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345188AbiEaNwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 09:52:08 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38C69B1BB
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:51:27 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e2so18823787wrc.1
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mxap1WEwdByjvPC0mpGlD9RkZLO1nqQEbYm1KO0qpGw=;
        b=Z9AaZe+YN+9Y/DvkBQCGoi5C4fe9XwkJsBqz0DUpj73OvfDgpM3DE7NK/2uva3ubaZ
         f2ZA/2Y6ysdvsGSYtsX/pGbzO2O7FqeY//RQLhQpTdNLVOlhO6fqj59Fcm8LXaXfFk0Y
         g+MVKfQ+no7vwNWgYSkmWaZij9tKQ1fDwhDSNkITHwlkXrmNoow4akG8Q3kb7ATYotH5
         0zEsilKFjPM+joe5D9qFDSJTTUfQjTfYnvi5ZtUXHidu/KT8stZ2ckPNzez1qhmM+LWw
         EYhGP6mq+1CzbAhWtpbV9DbiDpsV8QCgYDRKslfW4flDCQW3XYGe+qAl18djucj/hFGs
         IS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mxap1WEwdByjvPC0mpGlD9RkZLO1nqQEbYm1KO0qpGw=;
        b=Xw+OutW6lpmJjnSKPxZu/CW0rrRGQfOfe6PzZGeGMX+7Bqz3JlTz+L0YVOmgWkUhA1
         gBI05TCTPc4mEy+SQ+7wQP1vjlVpittim6X/Qms6xQx0//NCvhotatEiYT47ypwYHZ1Z
         2HHiZUKLF7JWrMSNwdPi61kVFpU+hNzqy1x/pEdkGvPvGrZUm1zlmMhScRf8kq4cXFGv
         ajn/50BgoovJE5L3wjygUQYO8LpI1VSLmY8Vz+QzFJT3BiiJJHt0ad65QbagFINjbflv
         d3ClY/zRLR674XbDopuGfCPC8t9BUu95ZFSfxJC+QbBxMK+MfS9tsjvVVscGdMJYApos
         +iGA==
X-Gm-Message-State: AOAM533n9DeV9x0opMBZ5zLtfuLZPa51DWCHT4KAtiLjQ2DEvo5/W6Pb
        GOOXUR/Yjmm3J06kNw/EqdeoWA==
X-Google-Smtp-Source: ABdhPJyXl0DdP2e9n/QxwXICD+w+MV38jIzwdGj4vIoq26OkXHJf3AfQ2K5zFBto6WtGSVWccVFl0A==
X-Received: by 2002:a5d:5145:0:b0:210:55c:4790 with SMTP id u5-20020a5d5145000000b00210055c4790mr23043579wrt.714.1654005071847;
        Tue, 31 May 2022 06:51:11 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:51:11 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 17/17] arm64: dts: mediatek: add mt8365-evk board device-tree
Date:   Tue, 31 May 2022 15:50:26 +0200
Message-Id: <20220531135026.238475-18-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device-tree for the MT8365-EVK board. The MT8365 EVK board
has the following IOs:
* DPI <-> HDMI bridge and HDMI connector.
* 2 audio jack
* 1 USB Type-A Host port
* 2 UART to USB port
* 1 battery connector
* 1 eMMC
* 1 SD card
* 2 camera connectors
* 1 M.2 slot for connectivity
* 1 DSI connector + touchscreen connector
* RPI compatible header
* 1 Ethernet port

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 578 ++++++++++++++++++++
 2 files changed, 579 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c7d4636a2cb7..02a9f784358e 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -40,4 +40,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
new file mode 100644
index 000000000000..8f472caa06a3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -0,0 +1,578 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 BayLibre, SAS.
+ * Author: Fabien Parent <fparent@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
+#include "mt8365.dtsi"
+#include "mt6357.dtsi"
+
+/ {
+	model = "MediaTek MT8365 Open Platform EVK";
+	compatible = "mediatek,mt8365-evk", "mediatek,mt8365";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys>;
+
+		volume-up {
+			gpios = <&pio 24 GPIO_ACTIVE_LOW>;
+			label = "volume_up";
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0xc0000000>;
+	};
+
+	usb_otg_vbus: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 12 MiB reserved for OP-TEE (BL32)
+		 * +-----------------------+ 0x43e0_0000
+		 * |      SHMEM 2MiB       |
+		 * +-----------------------+ 0x43c0_0000
+		 * |        | TA_RAM  8MiB |
+		 * + TZDRAM +--------------+ 0x4340_0000
+		 * |        | TEE_RAM 2MiB |
+		 * +-----------------------+ 0x4320_0000
+		 */
+		optee_reserved: optee@43200000 {
+			no-map;
+			reg = <0 0x43200000 0 0x00c00000>;
+		};
+	};
+};
+
+&cpu0 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6357_vproc_reg>;
+	sram-supply = <&mt6357_vsram_proc_reg>;
+};
+
+&dpi0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dpi_func_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	assigned-clocks = <&topckgen CLK_TOP_DPI0_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_LVDSPLL_D4>;
+
+	/*
+	 * Ethernet and HDMI are sharing pins.
+	 * Only one can be enabled at a time and require the physical switch
+	 * SW2101 to be set on DPI position
+	 */
+	status = "okay";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
+
+&ethernet {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_pins>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rmii";
+	mac-address = [00 00 00 00 00 00];
+
+	/*
+	 * Ethernet and HDMI are sharing pins.
+	 * Only one can be enabled at a time and require the physical switch
+	 * SW2101 to be set on LAN position
+	 */
+	status = "disabled";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it66121hdmitx: hdmi@4c {
+		compatible = "ite,it66121";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ite_pins>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pio 68 IRQ_TYPE_LEVEL_LOW>;
+		#sound-dai-cells = <0>;
+		reg = <0x4c>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				it66121_in: endpoint {
+					bus-width = <12>;
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&mmc0 {
+	status = "okay";
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-hw-reset;
+	no-sdio;
+	no-sd;
+	hs400-ds-delay = <0x12012>;
+	vmmc-supply = <&mt6357_vemc_reg>;
+	vqmmc-supply = <&mt6357_vio18_reg>;
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
+	non-removable;
+};
+
+&mmc1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
+	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&mt6357_vmch_reg>;
+	vqmmc-supply = <&mt6357_vio18_reg>;
+	status = "okay";
+};
+
+&mt6357_pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
+
+&mt6357_vibr_reg {
+	regulator-always-on;
+};
+
+/* Needed by MSDC1 */
+&mt6357_vmc_reg {
+	regulator-always-on;
+};
+
+&mt6357_vrf12_reg {
+	regulator-always-on;
+};
+
+&mt6357_vsim2_reg {
+	regulator-always-on;
+};
+
+&mt6357keys {
+	power-key {
+		label = "power";
+		linux,keycodes = <KEY_POWER>;
+		wakeup-source;
+	};
+
+	volume-down {
+		label = "volume_down";
+		linux,keycodes = <KEY_VOLUMEDOWN>;
+		wakeup-source;
+	};
+};
+
+&pio {
+	dpi_func_pins: dpi-func-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <MTK_DRIVE_4mA>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
+	ethernet_pins: ethernet-pins {
+		pins-ethernet {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_EXT_TXD0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_EXT_TXD1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_EXT_TXD2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_EXT_TXD3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_EXT_TXC>,
+				 <MT8365_PIN_5_GPIO5__FUNC_EXT_RXER>,
+				 <MT8365_PIN_6_GPIO6__FUNC_EXT_RXC>,
+				 <MT8365_PIN_7_GPIO7__FUNC_EXT_RXDV>,
+				 <MT8365_PIN_8_GPIO8__FUNC_EXT_RXD0>,
+				 <MT8365_PIN_9_GPIO9__FUNC_EXT_RXD1>,
+				 <MT8365_PIN_10_GPIO10__FUNC_EXT_RXD2>,
+				 <MT8365_PIN_11_GPIO11__FUNC_EXT_RXD3>,
+				 <MT8365_PIN_12_GPIO12__FUNC_EXT_TXEN>,
+				 <MT8365_PIN_13_GPIO13__FUNC_EXT_COL>,
+				 <MT8365_PIN_14_GPIO14__FUNC_EXT_MDIO>,
+				 <MT8365_PIN_15_GPIO15__FUNC_EXT_MDC>;
+		};
+
+		pins-phy-reset {
+			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
+		};
+	};
+
+	gpio_keys: gpio-keys-pins {
+		pins {
+			pinmux = <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			mediatek,pull-up-adv = <3>;
+			mediatek,drive-strength-adv = <00>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		pins-rst-ite {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+
+		pins-irq-ite {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-pwr {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+	};
+
+	mmc0_pins_default: mmc0-default-pins {
+		pins-clk {
+			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			bias-pull-down;
+		};
+
+		pins-cmd-dat {
+			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-rst {
+			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
+			bias-pull-up;
+		};
+	};
+
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		pins-clk {
+			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-cmd-dat {
+			pinmux = <MT8365_PIN_103_MSDC0_DAT0__FUNC_MSDC0_DAT0>,
+				 <MT8365_PIN_102_MSDC0_DAT1__FUNC_MSDC0_DAT1>,
+				 <MT8365_PIN_101_MSDC0_DAT2__FUNC_MSDC0_DAT2>,
+				 <MT8365_PIN_100_MSDC0_DAT3__FUNC_MSDC0_DAT3>,
+				 <MT8365_PIN_96_MSDC0_DAT4__FUNC_MSDC0_DAT4>,
+				 <MT8365_PIN_95_MSDC0_DAT5__FUNC_MSDC0_DAT5>,
+				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
+				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
+				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins-ds {
+			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-rst {
+			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
+			drive-strength = <MTK_DRIVE_10mA>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_default: mmc1-default-pins {
+		pins-cd {
+			pinmux = <MT8365_PIN_76_CMDAT8__FUNC_GPIO76>;
+			bias-pull-up;
+		};
+
+		pins-clk {
+			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-cmd-dat {
+			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-uhs-pins {
+		pins-clk {
+			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins-cmd-dat {
+			pinmux = <MT8365_PIN_89_MSDC1_DAT0__FUNC_MSDC1_DAT0>,
+				 <MT8365_PIN_90_MSDC1_DAT1__FUNC_MSDC1_DAT1>,
+				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
+				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
+				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		pins {
+			pinmux = <MT8365_PIN_35_URXD0__FUNC_URXD0>,
+				 <MT8365_PIN_36_UTXD0__FUNC_UTXD0>;
+		};
+	};
+
+	uart1_pins: uart1-pins {
+		pins {
+			pinmux = <MT8365_PIN_37_URXD1__FUNC_URXD1>,
+				 <MT8365_PIN_38_UTXD1__FUNC_UTXD1>;
+		};
+	};
+
+	uart2_pins: uart2-pins {
+		pins {
+			pinmux = <MT8365_PIN_39_URXD2__FUNC_URXD2>,
+				 <MT8365_PIN_40_UTXD2__FUNC_UTXD2>;
+		};
+	};
+
+	usb_pins: usb-pins {
+		pins-id {
+			pinmux = <MT8365_PIN_17_GPIO17__FUNC_GPIO17>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-usb0-vbus {
+			pinmux = <MT8365_PIN_16_GPIO16__FUNC_USB_DRVVBUS>;
+			output-high;
+		};
+
+		pin-usb1-vbus {
+			pinmux = <MT8365_PIN_18_GPIO18__FUNC_GPIO18>;
+			output-high;
+		};
+	};
+
+	pwm_pins: pwm-pins {
+		pins {
+			pinmux = <MT8365_PIN_19_DISP_PWM__FUNC_PWM_A>,
+				 <MT8365_PIN_116_I2S_BCK__FUNC_PWM_C>;
+		};
+	};
+};
+
+&pwm {
+	pinctrl-0 = <&pwm_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&ssusb {
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+	maximum-speed = "high-speed";
+	usb-role-switch;
+	dr_mode = "otg";
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		type = "micro";
+		id-gpios = <&pio 17 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_otg_vbus>;
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_host {
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+};
-- 
2.36.1

