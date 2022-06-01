Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159E853A2DC
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 12:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352162AbiFAKlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 06:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352152AbiFAKlK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 06:41:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649FE7DE3F
        for <linux-i2c@vger.kernel.org>; Wed,  1 Jun 2022 03:41:06 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y19so2859442ejq.6
        for <linux-i2c@vger.kernel.org>; Wed, 01 Jun 2022 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YnwlxkEskig5qSEZkf1OUJFDCbLfIauiQR7owBPAAo8=;
        b=o3oy882DW5XoM121QxgLAIqDZmLSK6/PrEQb4XvQeRV0EbxfAnEYajgac3QLI9FcMp
         4SF5C5oNQogqHKHnGl1RjMphuthUgorSKRQaD3mLQrEnRwutFisd/3XW2m/RJCzJ0+1v
         tkp0rArEAuR2Tk4/dlGSFfTxR/sxOC1Cdk3lvFAiSzaUJCoeqQvk34iQ3YtoEwYP9jQC
         vqMMi5q+lDHqZkOawknPynNZ7RJd/5GHehRkUcT7oK0EPZ21LSkvWGONymsEa+4JEP7i
         qjK82e59DvTe0ppOR5EgGlx6B82dcRv5j9w7gCLxi/yDXx5qJ39cTI5FpLvoPg4bTzNf
         MbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YnwlxkEskig5qSEZkf1OUJFDCbLfIauiQR7owBPAAo8=;
        b=LzWgg0y2uGUwW3IgJOBb4Ihu4vfaGg7qoYpRl4eRcresNl2o40FDUT0dmr8r4j63un
         qjAch8RCz90U/9SvhNVk+Dr67EQJWVi/RUuDiKYnTgOfxpSGZKhSFPFn9XYJAFYhgbm/
         t9/MJSUkTesHTPI/pnPPPWieH0o1E+Z81Lk4dDUsdjLlCHJBL+VLFBQMJkw0x5EubDXX
         TpOXAp8qAa0agmsJONoHf4BIqN6IV1MZjpLNrsCEwY+0XKy+FK9KZPuEaO7C6f/zPP5H
         f3QIEOVkel7ud5zoCU51WbhD/yU5vde/EI6KfCq89PIBzp4olNGbBLLG1CUSgZYFOopZ
         98Dw==
X-Gm-Message-State: AOAM533YijylQPMjWS7OA6Ng57Gzm/gWPNtqg3asUB6xp0WSHSSXceTD
        jdAGDyyXgfZd4XeyNqSinEaLqQ==
X-Google-Smtp-Source: ABdhPJyobmFzrAd7aGPFPzNizVmWKEMaqJL/SVLVJ4JJ7gg9SZs/2Gv6F8acA22LJi7CFkPE62rb6g==
X-Received: by 2002:a17:907:9805:b0:6f4:fe0e:5547 with SMTP id ji5-20020a170907980500b006f4fe0e5547mr56262621ejc.426.1654080064935;
        Wed, 01 Jun 2022 03:41:04 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b17-20020a50e791000000b0042ac2705444sm774652edn.58.2022.06.01.03.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:41:04 -0700 (PDT)
Message-ID: <72329bd9-3d8d-a18c-236d-8a84e5dcc455@linaro.org>
Date:   Wed, 1 Jun 2022 12:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 17/17] arm64: dts: mediatek: add mt8365-evk board
 device-tree
Content-Language: en-US
To:     Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
        chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-18-fparent@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-18-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add device-tree for the MT8365-EVK board. The MT8365 EVK board
> has the following IOs:
> * DPI <-> HDMI bridge and HDMI connector.
> * 2 audio jack
> * 1 USB Type-A Host port
> * 2 UART to USB port
> * 1 battery connector
> * 1 eMMC
> * 1 SD card
> * 2 camera connectors
> * 1 M.2 slot for connectivity
> * 1 DSI connector + touchscreen connector
> * RPI compatible header
> * 1 Ethernet port

Thank you for your patch. There is something to discuss/improve.

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 578 ++++++++++++++++++++
>  2 files changed, 579 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index c7d4636a2cb7..02a9f784358e 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -40,4 +40,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> new file mode 100644
> index 000000000000..8f472caa06a3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -0,0 +1,578 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 BayLibre, SAS.
> + * Author: Fabien Parent <fparent@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
> +#include "mt8365.dtsi"
> +#include "mt6357.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8365 Open Platform EVK";
> +	compatible = "mediatek,mt8365-evk", "mediatek,mt8365";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_connector_out>;
> +			};
> +		};
> +	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys>;
> +
> +		volume-up {

key-volume-up, volume-up-key or key-0

> +			gpios = <&pio 24 GPIO_ACTIVE_LOW>;
> +			label = "volume_up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			wakeup-source;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0xc0000000>;
> +	};
> +
> +	usb_otg_vbus: regulator-2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "otg_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 12 MiB reserved for OP-TEE (BL32)
> +		 * +-----------------------+ 0x43e0_0000
> +		 * |      SHMEM 2MiB       |
> +		 * +-----------------------+ 0x43c0_0000
> +		 * |        | TA_RAM  8MiB |
> +		 * + TZDRAM +--------------+ 0x4340_0000
> +		 * |        | TEE_RAM 2MiB |
> +		 * +-----------------------+ 0x4320_0000
> +		 */
> +		optee_reserved: optee@43200000 {
> +			no-map;
> +			reg = <0 0x43200000 0 0x00c00000>;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu1 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu2 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu3 {
> +	proc-supply = <&mt6357_vproc_reg>;
> +	sram-supply = <&mt6357_vsram_proc_reg>;
> +};
> +
> +&dpi0 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&dpi_func_pins>;
> +	pinctrl-1 = <&dpi_idle_pins>;
> +	assigned-clocks = <&topckgen CLK_TOP_DPI0_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_LVDSPLL_D4>;
> +
> +	/*
> +	 * Ethernet and HDMI are sharing pins.
> +	 * Only one can be enabled at a time and require the physical switch
> +	 * SW2101 to be set on DPI position
> +	 */
> +	status = "okay";
> +
> +	port {
> +		dpi_out: endpoint {
> +			remote-endpoint = <&it66121_in>;
> +		};
> +	};
> +};
> +
> +&ethernet {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ethernet_pins>;
> +	phy-handle = <&eth_phy>;
> +	phy-mode = "rmii";
> +	mac-address = [00 00 00 00 00 00];
> +
> +	/*
> +	 * Ethernet and HDMI are sharing pins.
> +	 * Only one can be enabled at a time and require the physical switch
> +	 * SW2101 to be set on LAN position
> +	 */
> +	status = "disabled";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		eth_phy: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;

You defined address/size in DTSI.

> +
> +	it66121hdmitx: hdmi@4c {
> +		compatible = "ite,it66121";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ite_pins>;
> +		vcn33-supply = <&mt6357_vibr_reg>;
> +		vcn18-supply = <&mt6357_vsim2_reg>;
> +		vrf12-supply = <&mt6357_vrf12_reg>;
> +		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
> +		interrupts-extended = <&pio 68 IRQ_TYPE_LEVEL_LOW>;
> +		#sound-dai-cells = <0>;
> +		reg = <0x4c>;

Put reg after compatible.

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				it66121_in: endpoint {
> +					bus-width = <12>;
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				hdmi_connector_out: endpoint {
> +					remote-endpoint = <&hdmi_connector_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mmc0 {
> +	status = "okay";

Status okay goes to the end. In some nodes you keep that style, in some
not. Confusing.

> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	cap-mmc-hw-reset;
> +	no-sdio;
> +	no-sd;
> +	hs400-ds-delay = <0x12012>;
> +	vmmc-supply = <&mt6357_vemc_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +	non-removable;
> +};
> +
> +&mmc1 {
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc1_pins_default>;
> +	pinctrl-1 = <&mmc1_pins_uhs>;
> +	cd-gpios = <&pio 76 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	max-frequency = <200000000>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&mt6357_vmch_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +	status = "okay";
> +};
> +
> +&mt6357_pmic {
> +	interrupt-parent = <&pio>;
> +	interrupts = <145 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +};
> +
> +&mt6357_vibr_reg {
> +	regulator-always-on;
> +};
> +
> +/* Needed by MSDC1 */
> +&mt6357_vmc_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6357_vrf12_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6357_vsim2_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6357keys {
> +	power-key {
> +		label = "power";
> +		linux,keycodes = <KEY_POWER>;
> +		wakeup-source;
> +	};
> +
> +	volume-down {

volume-down-key

> +		label = "volume_down";
> +		linux,keycodes = <KEY_VOLUMEDOWN>;


Best regards,
Krzysztof
