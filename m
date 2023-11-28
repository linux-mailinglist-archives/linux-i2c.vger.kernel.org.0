Return-Path: <linux-i2c+bounces-496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 244CB7FB358
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 08:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0669281F2E
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 07:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F23814A97;
	Tue, 28 Nov 2023 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2bmBW6L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE93DAB
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 23:56:25 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54af2498e85so5308247a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 23:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701158184; x=1701762984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3OlFmlmfr3O7QIqo+qgk5S4gEyjDVI1CQ8me3khX6o=;
        b=B2bmBW6LVkTkHlmBudMKhSBrxGnVny5lnert15+bewde02NwxWHn8LDl6fha3z1JbL
         RyJaRAdYPTzUaT+zW3i6jP3chI8s0IfQkxACXgBoVKzusFWYh47u9WZTmrlXxCKnymHX
         kIQviHnIzTRkZ0MH6ZKIKliZmx3ztZWn+IV0d1x9opZZT/8Hbsrk/hCpqHKZarTE+CIj
         gSE9+cyDwASvHdvye/hh837CgIXomfzUY6RirfnKvtxAjU1mxHmifXFxtJRb1BS3+IZq
         JeO/IxtRZaDYI+j8w9Cf3TbfzTeblTu3Qjo76vYTws20QHtMbLBIixTm4de5ibkWXDxL
         YWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158184; x=1701762984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3OlFmlmfr3O7QIqo+qgk5S4gEyjDVI1CQ8me3khX6o=;
        b=uO6caj9Dr/zgD03wHBQg6qrEWd7VVuVUACNXEb3zFQap9NPRYl5rQMCSAsDfI6VEgs
         XLV9oj73hNhwnegWjtt8V87F2m8SRCR0qyqRpElvdj5xLRzL+JikX+Yojd+XBpBAWRPm
         gOZl6cEwlef1qIHVzeAui/E0aTb7y3d//WvWaPgyHHEsvqAFwvyJwv7X9e9ikM1Eprh7
         RNf/oNEQnw255bAKSW+3xWCBcBUiXwj5RW0GTJApu/FyLFazA1rFp3rG307T1mafrbt/
         aukT3Zwf5LgoMlSB3SvBZUNEYp6u5fi3Ia87JNa6SL9489ZyLPYqZhVF8128Z00bwC+U
         XzKA==
X-Gm-Message-State: AOJu0YzwILH94SJj0BSZ3M6G4BeC/LKz0Rh0tg5TpofYBnGkqrrUBdef
	RZs5pcsRS0gGmkAFseg1jJdGeQ==
X-Google-Smtp-Source: AGHT+IEISaJoqID4TvrSF3zuYfwRaQ4PQRSZ7DNL9+tL97Qiq/BiwZC97mJAssm8v1BU3MTiB1ko+w==
X-Received: by 2002:a17:907:1c99:b0:a01:977a:ed73 with SMTP id nb25-20020a1709071c9900b00a01977aed73mr11913405ejc.8.1701158183710;
        Mon, 27 Nov 2023 23:56:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id i17-20020a170906265100b009ff10bfcefbsm6526405ejc.106.2023.11.27.23.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 23:56:23 -0800 (PST)
Message-ID: <42b625de-8a38-4e6a-8a63-e275be1352d6@linaro.org>
Date: Tue, 28 Nov 2023 08:56:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: add support for Gossen Metrawatt Profitest
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Li Yang <leoyang.li@nxp.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Marco Felsch
 <m.felsch@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>
References: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
 <20231127-b4-imx7-var-som-gome-v1-5-f26f88f2d0bc@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231127-b4-imx7-var-som-gome-v1-5-f26f88f2d0bc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 22:11, Roland Hieber wrote:
> From: Marco Felsch <m.felsch@pengutronix.de>
> 
> This is the initial support for the Gossen Metrawatt Profitest MF
> (e143_01) board based on a Variscite VAR-SOM-MX7 SoM.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Co-developed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Co-developed-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Co-developed-by: Roland Hieber <rhi@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml   |   7 +

Ah, here you have. No one expected this... Order your patches correctly.
User cannot be before documentation.

>  arch/arm/boot/dts/nxp/imx/Makefile               |   1 +
>  arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts | 559 +++++++++++++++++++++++

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Runnign checkpatch should be a must before sending a patches.

>  3 files changed, 567 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 32b195852a75..b751d289c712 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -900,6 +900,13 @@ properties:
>            - const: toradex,colibri-imx7d-emmc
>            - const: fsl,imx7d
>  
> +      - description: Variscite VAR-SOM-MX7 based boards
> +        items:
> +          - enum:
> +              - gome,e143_01                 # Gossen Metrawatt Profitest MF (e143_01)
> +          - const: variscite,var-som-mx7
> +          - const: fsl,imx7d
> +
>        - description: i.MX7ULP based Boards
>          items:
>            - enum:

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index a724d1a7a9a0..f0a68c715a61 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -363,6 +363,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>  	imx7d-colibri-iris-v2.dtb \
>  	imx7d-flex-concentrator.dtb \
>  	imx7d-flex-concentrator-mfg.dtb \
> +	imx7d-gome-e143_01.dtb \
>  	imx7d-mba7.dtb \
>  	imx7d-meerkat96.dtb \
>  	imx7d-nitrogen7.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts b/arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts
> new file mode 100644
> index 000000000000..6e98d34b2e54
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Gossen Metrawatt GmbH
> + * Copyright (C) 2022 Marco Felsch, Pengutronix
> + * Copyright (C) 2022 Philipp Zabel, Pengutronix
> + * Copyright (C) 2022 Roland Hieber, Pengutronix
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "imx7d-var-som-mx7.dtsi"
> +
> +/ {
> +	model = "Gossen Metrawatt Profitest MF (e143_01)";
> +	compatible = "gome,e143_01", "variscite,var-som-mx7", "fsl,imx7d";
> +
> +	aliases {
> +		gpio7 = &gpio8;
> +		rtc0 = &rtc0;
> +	};
> +
> +	max98357a: audio-codec {
> +		compatible = "maxim,max98357a";
> +		#sound-dai-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sdmode>;
> +		sdmode-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>; // Pin 60 AUDIO_SHDN_B
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_keys>, <&pinctrl_gpio_keys_2>;
> +		autorepeat;
> +
> +		button-0 {
> +			label = "S0";
> +			gpios = <&gpio1 12 GPIO_ACTIVE_LOW>; // Pin 183 BTN_S0_ESC
> +			linux,code = <KEY_ESC>;
> +			wakeup-source;
> +		};
> +
> +		button-1 {
> +			label = "S1";
> +			gpios = <&gpio1 11 GPIO_ACTIVE_LOW>; // Pin 185 BTN_S1_MEM
> +			linux,code = <KEY_DOCUMENTS>;
> +			wakeup-source;
> +		};
> +
> +		button-2 {
> +			label = "S2";
> +			gpios = <&gpio1 10 GPIO_ACTIVE_LOW>; // Pin 181 BTN_S2_HLP
> +			linux,code = <KEY_HELP>;
> +			wakeup-source;
> +		};
> +
> +		button-3 {
> +			label = "S3";
> +			gpios = <&gpio1 1 GPIO_ACTIVE_LOW>; // Pin 1 BTN_S3_STA
> +			linux,code = <KEY_PROG1>;
> +			wakeup-source;
> +		};
> +
> +		button-4 {
> +			label = "S4";
> +			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>; // Pin 168 BTN_S4_IDN
> +			linux,code = <KEY_PROG2>;
> +			wakeup-source;
> +		};
> +
> +		button-5 {
> +			label = "S5";
> +			gpios = <&gpio3 24 GPIO_ACTIVE_LOW>; // Pin 28 BTN_S5
> +			linux,code = <KEY_F5>;
> +		};
> +
> +		button-6 {
> +			label = "S6";
> +			gpios = <&gpio3 5 GPIO_ACTIVE_LOW>; // Pin 40 BTN_S6
> +			linux,code = <KEY_F6>;
> +		};
> +
> +		button-7 {
> +			label = "S7";
> +			gpios = <&gpio3 22 GPIO_ACTIVE_LOW>; // Pin 38 BTN_S7
> +			linux,code = <KEY_F7>;
> +		};
> +
> +		button-8 {
> +			label = "S8";
> +			gpios = <&gpio3 4 GPIO_ACTIVE_LOW>; // Pin 36 BTN_S8
> +			linux,code = <KEY_F8>;
> +		};
> +
> +		button-9 {
> +			label = "S9";
> +			gpios = <&gpio3 27 GPIO_ACTIVE_LOW>; // Pin 20 BTN_S9
> +			linux,code = <KEY_F9>;
> +		};
> +	};
> +
> +	gpio-poweroff {
> +		compatible = "gpio-poweroff";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_poweroff>;
> +		gpios = <&gpio7 14 GPIO_ACTIVE_LOW>; // Pin 7 POWER_OFF_B
> +		input;
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc2 0>, // ARS_VAL
> +			      <&adc2 1>, // VBAT_VAL
> +			      <&adc2 2>, // LCD_BACKLIGHT_VAL
> +			      <&adc2 3>; // VCC_5V0_FB
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_debug_led>;
> +
> +		test-led-1 {

led-0

> +			label = "test-led-1:red";
> +			gpios = <&gpio3 2 GPIO_ACTIVE_LOW>; // Pin 44 LED_TEST1_B
> +			color = <LED_COLOR_ID_RED>;
> +			linux,default-trigger = "disk-activity";
> +		};
> +
> +		test-led-2 {

led-1

> +			label = "test-led-2:red";
> +			gpios = <&gpio3 3 GPIO_ACTIVE_LOW>; // Pin 46 LED_TEST2_B
> +			color = <LED_COLOR_ID_RED>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	leds2 {
> +		compatible = "gpio-leds";
> +
> +		led_netz_gn {

led-0
No underscores

> +			label = "mains:green";
> +			gpios = <&gpio8 9 GPIO_ACTIVE_LOW>; // LED_NETZ_GN
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led_netz_rt {

led-1
You get the point, I hope.

...

> +&i2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_gpio>;
> +	scl-gpios = <&gpio4 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; // Pin 175 I2C4_SCL
> +	sda-gpios = <&gpio4 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>; // Pin 173 I2C4_SDA
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	gpio8: max7312@23 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "maxim,max7312";
> +		reg = <0x23>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "LED_DEBUG_GN", "LED_DEBUG_RT", "LED_UL_GN", "LED_RCD_GN",
> +				  "", "", "LED_UL_RT", "LED_RCD_RT",
> +				  "LED_NETZ_RT", "LED_NETZ_GN", "", "",
> +				  "DP_HW_CODE_1", "DP_HW_CODE_2", "DP_HW_CODE_3", "DP_HW_CODE_4";
> +		vcc-supply = <&reg_vcc_3v3_per>;
> +	};
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "GWDOG_RST_B", "BTN_S3_STA", "BTN_S4_IDN", "",
> +			  "", "", "", "USB_HOST_PWR_EN",
> +			  "", "", "BTN_S2_HLP", "BTN_S1_MEM",
> +			  "BTN_S0_ESC", "RTC_INT_B", "SOM: bt reg on";
> +};
> +
> +&gpio2 {
> +	gpio-line-names = "", "", "", "",
> +			  "DBG_GPIO1", "DBG_GPIO2", "DBG_GPIO3", "DBG_GPIO4",
> +			  "", "", "", "",
> +			  "MT_RXD", "MT_TXD", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "VCC_3V3_PER_EN", "",
> +			  "DSI_RESET", "VCC_5V0_PER_EN";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "", "", "LED_TEST1_B", "LED_TEST2_B",
> +			  "BTN_S8", "BTN_S6", "MT_RESET", "",
> +			  "", "", "MT_EN", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "AUDIO_SHDN_B", "", "BTN_S7", "",
> +			  "BTN_S5", "", "", "BTN_S9",
> +			  "BATT_LOW";
> +};
> +
> +&gpio4 {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "I2C1_SCL", "I2C1_SDA", "I2C2_SCL", "I2C2_SDA",
> +			  "", "", "I2C4_SCL", "I2C4_SDA",
> +			  "", "", "", "",
> +			  "", "", "", "HIL_SPI_CS0";
> +};
> +
> +&gpio5 {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "SOM: ethphy0 reset";
> +};
> +
> +&gpio6 {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "SOM: sd3_pwr (eMMC)";
> +};
> +
> +&gpio7 {
> +	gpio-line-names = "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "LCD_BACKLIGHT_EN", "", "POWER_OFF_B";
> +};
> +
> +&lcdif {
> +	assigned-clocks = <&clks IMX7D_LCDIF_PIXEL_ROOT_SRC>,
> +			  <&clks IMX7D_PLL_VIDEO_POST_DIV>;
> +	assigned-clock-parents = <&clks IMX7D_PLL_VIDEO_POST_DIV>;
> +	assigned-clock-rates = <0>, <128000000>;
> +	status = "okay";
> +};
> +
> +&mipi_dsi {
> +	samsung,burst-clock-frequency = <850000000>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "tianma,tm050jdhg33", "ilitek,ili9881c";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_mipi_panel>;
> +		reset-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>; // Pin 73 DSI_RESET
> +		power-supply = <&reg_vcc_3v3_per>;
> +		dsi-lanes = <2>;
> +
> +		rotation = <90>;
> +
> +		ilitek,enable-internal-backlight;
> +		default-brightness = <2047>;
> +		ilitek,pwm-frequency = <50000>;
> +		ilitek,backlight-supply = <&reg_vled_backlight>;
> +	};
> +};
> +
> +&sai3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&clks IMX7D_SAI3_ROOT_SRC>,
> +			  <&clks IMX7D_SAI3_ROOT_CLK>;
> +	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> +	assigned-clock-rates = <0>, <36864000>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart7>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	status = "okay";
> +};
> +
> +&iomuxc_lpsr {
> +	pinctrl_gpio_keys_2: pinctrl_gpio_keys_2grp {
> +		fsl,pins = <
> +			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1        0x0C
> +			MX7D_PAD_LPSR_GPIO1_IO02__GPIO1_IO2        0x0C
> +		>;
> +	};
> +
> +	pinctrl_usbotg2_pwr: pinctrl_usbotg2_pwrgrp {
> +		fsl,pins = <
> +			MX7D_PAD_LPSR_GPIO1_IO07__GPIO1_IO7        0x14
> +		>;
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_gpio_keys: pinctrl-gpio-keysgrp {
> +		fsl,pins = <
> +			MX7D_PAD_GPIO1_IO10__GPIO1_IO10            0x0000000C
> +			MX7D_PAD_GPIO1_IO11__GPIO1_IO11            0x0000000C
> +			MX7D_PAD_GPIO1_IO12__GPIO1_IO12            0x0000000C
> +			MX7D_PAD_LCD_DATA00__GPIO3_IO5             0x0000000C
> +			MX7D_PAD_LCD_DATA17__GPIO3_IO22            0x0000000C
> +			MX7D_PAD_LCD_DATA19__GPIO3_IO24            0x0000000C
> +			MX7D_PAD_LCD_DATA22__GPIO3_IO27            0x0000000C
> +			MX7D_PAD_LCD_RESET__GPIO3_IO4              0x0000000C
> +		>;
> +	};
> +
> +	pinctrl_i2c4: i2c4grp {
> +		fsl,pins = <
> +			MX7D_PAD_I2C4_SCL__I2C4_SCL                0x4000007f
> +			MX7D_PAD_I2C4_SDA__I2C4_SDA                0x4000007f
> +		>;
> +	};
> +
> +	pinctrl_i2c4_gpio: i2c4-gpiogrp {
> +		fsl,pins = <
> +			MX7D_PAD_I2C4_SCL__GPIO4_IO14              0x4000007f
> +			MX7D_PAD_I2C4_SDA__GPIO4_IO15              0x4000007f
> +		>;
> +	};
> +
> +	pinctrl_mipi_backlight: mipi-backlightgrp {
> +		fsl,pins = <
> +			MX7D_PAD_ENET1_TX_CLK__GPIO7_IO12          0x0000001B
> +		>;
> +	};
> +
> +	pinctrl_mipi_panel: mipi-panelgrp {
> +		fsl,pins = <
> +			MX7D_PAD_EPDC_BDR0__GPIO2_IO28             0x0000001B /* DSI_RESET */
> +		>;
> +	};
> +
> +	pinctrl_poweroff: pinctrl_poweroffgrp {
> +		fsl,pins = <
> +			MX7D_PAD_ENET1_CRS__GPIO7_IO14             0x0000001B
> +		>;
> +	};
> +
> +	pinctrl_reg_vcc_3v3_per: pinctrl_reg_vcc_3v3_pergrp {
> +		fsl,pins = <
> +			MX7D_PAD_EPDC_GDRL__GPIO2_IO26             0x0000001B
> +		>;
> +	};
> +
> +	pinctrl_reg_vcc_5v0_per: pinctrl_reg_vcc_5v0_pergrp {
> +		fsl,pins = <
> +			MX7D_PAD_EPDC_BDR1__GPIO2_IO29             0x0000001B
> +		>;
> +	};
> +
> +	pinctrl_reg_imt: pinctrl_reg_imtgrp {
> +		fsl,pins = <
> +			MX7D_PAD_LCD_DATA05__GPIO3_IO10            0x0000001B
> +		>;
> +	};
> +
> +	pinctrl_rtc: pinctrl_rtcgrp {

Again underscores.


Best regards,
Krzysztof


