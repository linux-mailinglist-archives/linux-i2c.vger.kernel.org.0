Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE92468F0E
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 03:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbhLFCUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 21:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbhLFCUl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 21:20:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DD6C061751;
        Sun,  5 Dec 2021 18:17:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19C0BB80EDB;
        Mon,  6 Dec 2021 02:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CFBC00446;
        Mon,  6 Dec 2021 02:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638757029;
        bh=wOAtSnBRKbkwNpJ2F+3jWJBPa0Km5UYkEzo9RHlb/Aw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IX4fG5xZ913qmuRFila5+7G8cyyQh5D3XHwgzZw5qDu62j72vZIt42yqNIAvahAYn
         s8gT8H7+4CHIPLDJVE7c81O5FOZ7Ci6UAGh4lM2nlcncFfouFxp4L+JA8RfqXwiFun
         yh7imqJDDulMwAreG6u7+YmGhtjXnvyEVVOs3jrAghe1+Aa5gnAdSwnOLiP85MR8aE
         Zq4xFA7FISPhbgPx7kNjvFsRrnrorfEnUPNBZokFEmP+VPPfsheeTUBasYQ0o/ubiS
         h2hPnqWUsPTHPAJa2Zcl1Ay6l36vCldggDukKS1pK8A0VuZ45SZ4TiQxx67KemLBfJ
         nBEmo369Lqnug==
Date:   Mon, 6 Dec 2021 10:17:01 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     robh+dt@kernel.org, aisheng.dong@nxp.com, s.hauer@pengutronix.de,
        ulf.hansson@linaro.org, broonie@kernel.org, linux@roeck-us.net,
        wim@linux-watchdog.org, linux@rempel-privat.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file for
 imx8ulp
Message-ID: <20211206021700.GT4216@dragon>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-7-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126074002.1535696-7-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 26, 2021 at 03:40:01PM +0800, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add the basic dtsi support for i.MX8ULP.
> 
> i.MX 8ULP is part of the ULP family with emphasis on extreme
> low-power techniques using the 28 nm fully depleted silicon on
> insulator process. Like i.MX 7ULP, i.MX 8ULP continues to be
> based on asymmetric architecture, however will add a third DSP
> domain for advanced voice/audio capability and a Graphics domain
> where it is possible to access graphics resources from the
> application side or the realtime side.
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
>   - v6
>    rebase
> 
>   - v5
>    Add R-b tag
>    
>   - v4
>    Fix build error after rebase
>    Drop usb nodes and alias, drop fec node
> 
>   - v3 changes:
>     no
>  
>   - v2 changes:
>     update the license
>     update the compatible property for usb related node
> 
> 
>  .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
>  2 files changed, 1374 insertions(+)
>  create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi

<snip>

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> new file mode 100644
> index 000000000000..fb8714379026
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -0,0 +1,396 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2021 NXP
> + */
> +
> +#include <dt-bindings/clock/imx8ulp-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#include "imx8ulp-pinfunc.h"
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		gpio0 = &gpiod;
> +		gpio1 = &gpioe;
> +		gpio2 = &gpiof;
> +		mmc0 = &usdhc0;
> +		mmc1 = &usdhc1;
> +		mmc2 = &usdhc2;
> +		serial0 = &lpuart4;
> +		serial1 = &lpuart5;
> +		serial2 = &lpuart6;
> +		serial3 = &lpuart7;
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		A35_0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&A35_L2>;
> +		};
> +
> +		A35_1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			next-level-cache = <&A35_L2>;
> +		};
> +
> +		A35_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	gic: interrupt-controller@2d400000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0x2d400000 0 0x10000>, /* GIC Dist */
> +		      <0x0 0x2d440000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical Secure */
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical Non-Secure */
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
> +	};
> +
> +	frosc: clock-frosc {
> +		compatible = "fixed-clock";
> +		clock-frequency = <192000000>;
> +		clock-output-names = "frosc";
> +		#clock-cells = <0>;
> +	};
> +
> +	lposc: clock-lposc {
> +		compatible = "fixed-clock";
> +		clock-frequency = <1000000>;
> +		clock-output-names = "lposc";
> +		#clock-cells = <0>;
> +	};
> +
> +	rosc: clock-rosc {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "rosc";
> +		#clock-cells = <0>;
> +	};
> +
> +	sosc: clock-sosc {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "sosc";
> +		#clock-cells = <0>;
> +	};
> +
> +	soc@0 {

Why do we need unit-address @0 here?

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		per_bridge3: bus@29000000 {
> +			compatible = "simple-bus";
> +			reg = <0x29000000 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			wdog3: watchdog@292a0000 {
> +				compatible = "fsl,imx8ulp-wdt", "fsl,imx7ulp-wdt";
> +				reg = <0x292a0000 0x10000>;
> +				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
> +				assigned-clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
> +				timeout-sec = <40>;
> +			};
> +
> +			cgc1: clock-controller@292c0000 {
> +				compatible = "fsl,imx8ulp-cgc1";
> +				reg = <0x292c0000 0x10000>;
> +				clocks = <&rosc>, <&sosc>, <&frosc>, <&lposc>;
> +				clock-names = "rosc", "sosc", "frosc", "lposc";
> +				#clock-cells = <1>;
> +			};
> +
> +			pcc3: clock-controller@292d0000 {
> +				compatible = "fsl,imx8ulp-pcc3";
> +				reg = <0x292d0000 0x10000>;
> +				#clock-cells = <1>;
> +			};
> +
> +			tpm5: tpm@29340000 {
> +				compatible = "fsl,imx8ulp-tpm", "fsl,imx7ulp-tpm";
> +				reg = <0x29340000 0x1000>;
> +				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_TPM5>,
> +					 <&pcc3 IMX8ULP_CLK_TPM5>;
> +				clock-names = "ipg", "per";
> +				status = "disabled";
> +			};
> +
> +			lpi2c4: i2c@29370000 {
> +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x29370000 0x10000>;
> +				interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>,
> +					 <&pcc3 IMX8ULP_CLK_LPI2C4>;
> +				clock-names = "per", "ipg";
> +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>;
> +				assigned-clock-rates = <48000000>;
> +				status = "disabled";
> +			};
> +
> +			lpi2c5: i2c@29380000 {
> +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x29380000 0x10000>;
> +				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>,
> +					 <&pcc3 IMX8ULP_CLK_LPI2C5>;
> +				clock-names = "per", "ipg";
> +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>;
> +				assigned-clock-rates = <48000000>;
> +				status = "disabled";
> +			};
> +
> +			lpuart4: serial@29390000 {
> +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> +				reg = <0x29390000 0x1000>;
> +				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
> +				clock-names = "ipg";
> +				status = "disabled";
> +			};
> +
> +			lpuart5: serial@293a0000 {
> +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> +				reg = <0x293a0000 0x1000>;
> +				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
> +				clock-names = "ipg";
> +				status = "disabled";
> +			};
> +
> +			lpspi4: spi@293b0000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
> +				reg = <0x293b0000 0x10000>;
> +				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>,
> +					 <&pcc3 IMX8ULP_CLK_LPSPI4>;
> +				clock-names = "per", "ipg";
> +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>;
> +				assigned-clock-rates = <16000000>;
> +				status = "disabled";
> +			};
> +
> +			lpspi5: spi@293c0000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
> +				reg = <0x293c0000 0x10000>;
> +				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>,
> +					 <&pcc3 IMX8ULP_CLK_LPSPI5>;
> +				clock-names = "per", "ipg";
> +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>;
> +				assigned-clock-rates = <16000000>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		per_bridge4: bus@29800000 {
> +			compatible = "simple-bus";
> +			reg = <0x29800000 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			pcc4: clock-controller@29800000 {
> +				compatible = "fsl,imx8ulp-pcc4";
> +				reg = <0x29800000 0x10000>;
> +				#clock-cells = <1>;
> +			};
> +
> +			lpi2c6: i2c@29840000 {
> +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x29840000 0x10000>;
> +				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>,
> +					 <&pcc4 IMX8ULP_CLK_LPI2C6>;
> +				clock-names = "per", "ipg";
> +				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>;
> +				assigned-clock-rates = <48000000>;
> +				status = "disabled";
> +			};
> +
> +			lpi2c7: i2c@29850000 {
> +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> +				reg = <0x29850000 0x10000>;
> +				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>,
> +					 <&pcc4 IMX8ULP_CLK_LPI2C7>;
> +				clock-names = "per", "ipg";
> +				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>;
> +				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>;
> +				assigned-clock-rates = <48000000>;
> +				status = "disabled";
> +			};
> +
> +			lpuart6: serial@29860000 {
> +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> +				reg = <0x29860000 0x1000>;
> +				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
> +				clock-names = "ipg";
> +				status = "disabled";
> +			};
> +
> +			lpuart7: serial@29870000 {
> +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> +				reg = <0x29870000 0x1000>;
> +				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
> +				clock-names = "ipg";
> +				status = "disabled";
> +			};
> +
> +			iomuxc1: pinctrl@298c0000 {
> +				compatible = "fsl,imx8ulp-iomuxc1";

I know this binding is already landed.  Just curious why there is a
suffix number in the compatible.

Shawn

> +				reg = <0x298c0000 0x10000>;
> +			};
> +
> +			usdhc0: mmc@298d0000 {
> +				compatible = "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x298d0000 0x10000>;
> +				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
> +					 <&cgc1 IMX8ULP_CLK_XBAR_AD_DIVPLAT>,
> +					 <&pcc4 IMX8ULP_CLK_USDHC0>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step= <2>;
> +				bus-width = <4>;
> +				status = "disabled";
> +			};
> +
> +			usdhc1: mmc@298e0000 {
> +				compatible = "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x298e0000 0x10000>;
> +				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
> +					 <&cgc1 IMX8ULP_CLK_NIC_PER_DIVPLAT>,
> +					 <&pcc4 IMX8ULP_CLK_USDHC1>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step= <2>;
> +				bus-width = <4>;
> +				status = "disabled";
> +			};
> +
> +			usdhc2: mmc@298f0000 {
> +				compatible = "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
> +				reg = <0x298f0000 0x10000>;
> +				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
> +					 <&cgc1 IMX8ULP_CLK_NIC_PER_DIVPLAT>,
> +					 <&pcc4 IMX8ULP_CLK_USDHC2>;
> +				clock-names = "ipg", "ahb", "per";
> +				fsl,tuning-start-tap = <20>;
> +				fsl,tuning-step= <2>;
> +				bus-width = <4>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		gpioe: gpio@2d000000 {
> +				compatible = "fsl,imx8ulp-gpio", "fsl,imx7ulp-gpio";
> +				reg = <0x2d000080 0x1000>, <0x2d000040 0x40>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				clocks = <&pcc4 IMX8ULP_CLK_RGPIOE>,
> +					 <&pcc4 IMX8ULP_CLK_PCTLE>;
> +				clock-names = "gpio", "port";
> +				gpio-ranges = <&iomuxc1 0 32 24>;
> +		};
> +
> +		gpiof: gpio@2d010000 {
> +				compatible = "fsl,imx8ulp-gpio", "fsl,imx7ulp-gpio";
> +				reg = <0x2d010080 0x1000>, <0x2d010040 0x40>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				clocks = <&pcc4 IMX8ULP_CLK_RGPIOF>,
> +					 <&pcc4 IMX8ULP_CLK_PCTLF>;
> +				clock-names = "gpio", "port";
> +				gpio-ranges = <&iomuxc1 0 64 32>;
> +		};
> +
> +		per_bridge5: bus@2d800000 {
> +			compatible = "simple-bus";
> +			reg = <0x2d800000 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			cgc2: clock-controller@2da60000 {
> +				compatible = "fsl,imx8ulp-cgc2";
> +				reg = <0x2da60000 0x10000>;
> +				clocks = <&sosc>, <&frosc>;
> +				clock-names = "sosc", "frosc";
> +				#clock-cells = <1>;
> +			};
> +
> +			pcc5: clock-controller@2da70000 {
> +				compatible = "fsl,imx8ulp-pcc5";
> +				reg = <0x2da70000 0x10000>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +
> +		gpiod: gpio@2e200000 {
> +			compatible = "fsl,imx8ulp-gpio", "fsl,imx7ulp-gpio";
> +			reg = <0x2e200080 0x1000>, <0x2e200040 0x40>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			clocks = <&pcc5 IMX8ULP_CLK_RGPIOD>,
> +				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
> +			clock-names = "gpio", "port";
> +			gpio-ranges = <&iomuxc1 0 0 24>;
> +		};
> +	};
> +};
> -- 
> 2.25.1
> 
