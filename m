Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63182468F87
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 04:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbhLFDLf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 22:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235402AbhLFDLe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 22:11:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7443C0613F8;
        Sun,  5 Dec 2021 19:08:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C2F57B80EDC;
        Mon,  6 Dec 2021 03:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145CBC00446;
        Mon,  6 Dec 2021 03:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638760083;
        bh=0XFiLACWj0nSzzA+85cuo9uy4ld4djhASWaFDSeMPA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WVyQAcBy5dKlDtUnBhFVVDPbMiRt40pjX5PawJNLxgl+L4oRJKCizDCOecrvu557J
         EtXehfKWkSR2PGSvHFud2K2G7vsErPr07Prrs6nyIlhZVCZCpNcqHBJSAt9p/NnasN
         TIn4I+zDtJ0SQDYB0Byw21OB/9Xvipsh4TXOQ8L/0zQItgqxXGvgNqsadUfeKy+Llf
         /HEeE9Om7/anKGQkXv8/B+Tal1i+UgLOkq+F9+ex75LZxFb+QY9Xm8FXR05dBk3dHu
         PwDMfaGYtKp6LXWZb9fTi5v395feouj0q68SZGmENkyM4i90tb3cytK/q3EOAIian2
         5zCpg5gbrw+5g==
Date:   Mon, 6 Dec 2021 11:07:55 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Jacky Bai <ping.bai@nxp.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file for
 imx8ulp
Message-ID: <20211206030754.GB4216@dragon>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-7-peng.fan@oss.nxp.com>
 <20211206021700.GT4216@dragon>
 <DU0PR04MB9417E13BDD27E6B7D4430265886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417E13BDD27E6B7D4430265886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 06, 2021 at 03:01:12AM +0000, Peng Fan wrote:
> Hi Shawn,
> 
> > Subject: Re: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file for
> > imx8ulp
> > 
> > On Fri, Nov 26, 2021 at 03:40:01PM +0800, Peng Fan (OSS) wrote:
> > > From: Jacky Bai <ping.bai@nxp.com>
> > >
> > > Add the basic dtsi support for i.MX8ULP.
> > >
> > > i.MX 8ULP is part of the ULP family with emphasis on extreme low-power
> > > techniques using the 28 nm fully depleted silicon on insulator
> > > process. Like i.MX 7ULP, i.MX 8ULP continues to be based on asymmetric
> > > architecture, however will add a third DSP domain for advanced
> > > voice/audio capability and a Graphics domain where it is possible to
> > > access graphics resources from the application side or the realtime
> > > side.
> > >
> > > Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >
> > >   - v6
> > >    rebase
> > >
> > >   - v5
> > >    Add R-b tag
> > >
> > >   - v4
> > >    Fix build error after rebase
> > >    Drop usb nodes and alias, drop fec node
> > >
> > >   - v3 changes:
> > >     no
> > >
> > >   - v2 changes:
> > >     update the license
> > >     update the compatible property for usb related node
> > >
> > >
> > >  .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978
> > ++++++++++++++++++
> > >  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
> > >  2 files changed, 1374 insertions(+)
> > >  create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > 
> > <snip>
> > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > > new file mode 100644
> > > index 000000000000..fb8714379026
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > > @@ -0,0 +1,396 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2021 NXP
> > > + */
> > > +
> > > +#include <dt-bindings/clock/imx8ulp-clock.h>
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +#include "imx8ulp-pinfunc.h"
> > > +
> > > +/ {
> > > +	interrupt-parent = <&gic>;
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +
> > > +	aliases {
> > > +		gpio0 = &gpiod;
> > > +		gpio1 = &gpioe;
> > > +		gpio2 = &gpiof;
> > > +		mmc0 = &usdhc0;
> > > +		mmc1 = &usdhc1;
> > > +		mmc2 = &usdhc2;
> > > +		serial0 = &lpuart4;
> > > +		serial1 = &lpuart5;
> > > +		serial2 = &lpuart6;
> > > +		serial3 = &lpuart7;
> > > +	};
> > > +
> > > +	cpus {
> > > +		#address-cells = <2>;
> > > +		#size-cells = <0>;
> > > +
> > > +		A35_0: cpu@0 {
> > > +			device_type = "cpu";
> > > +			compatible = "arm,cortex-a35";
> > > +			reg = <0x0 0x0>;
> > > +			enable-method = "psci";
> > > +			next-level-cache = <&A35_L2>;
> > > +		};
> > > +
> > > +		A35_1: cpu@1 {
> > > +			device_type = "cpu";
> > > +			compatible = "arm,cortex-a35";
> > > +			reg = <0x0 0x1>;
> > > +			enable-method = "psci";
> > > +			next-level-cache = <&A35_L2>;
> > > +		};
> > > +
> > > +		A35_L2: l2-cache0 {
> > > +			compatible = "cache";
> > > +		};
> > > +	};
> > > +
> > > +	gic: interrupt-controller@2d400000 {
> > > +		compatible = "arm,gic-v3";
> > > +		reg = <0x0 0x2d400000 0 0x10000>, /* GIC Dist */
> > > +		      <0x0 0x2d440000 0 0xc0000>; /* GICR (RD_base + SGI_base)
> > */
> > > +		#interrupt-cells = <3>;
> > > +		interrupt-controller;
> > > +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > > +	};
> > > +
> > > +	psci {
> > > +		compatible = "arm,psci-1.0";
> > > +		method = "smc";
> > > +	};
> > > +
> > > +	timer {
> > > +		compatible = "arm,armv8-timer";
> > > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical
> > Secure */
> > > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical
> > Non-Secure */
> > > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
> > > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
> > > +	};
> > > +
> > > +	frosc: clock-frosc {
> > > +		compatible = "fixed-clock";
> > > +		clock-frequency = <192000000>;
> > > +		clock-output-names = "frosc";
> > > +		#clock-cells = <0>;
> > > +	};
> > > +
> > > +	lposc: clock-lposc {
> > > +		compatible = "fixed-clock";
> > > +		clock-frequency = <1000000>;
> > > +		clock-output-names = "lposc";
> > > +		#clock-cells = <0>;
> > > +	};
> > > +
> > > +	rosc: clock-rosc {
> > > +		compatible = "fixed-clock";
> > > +		clock-frequency = <32768>;
> > > +		clock-output-names = "rosc";
> > > +		#clock-cells = <0>;
> > > +	};
> > > +
> > > +	sosc: clock-sosc {
> > > +		compatible = "fixed-clock";
> > > +		clock-frequency = <24000000>;
> > > +		clock-output-names = "sosc";
> > > +		#clock-cells = <0>;
> > > +	};
> > > +
> > > +	soc@0 {
> > 
> > Why do we need unit-address @0 here?
> 
> I found there is patch which adds unit address, so I think we need @0 here.

Ah, okay, I will have to keep reminding myself that ranges requires
unit-address as well.

> commit 951c1d37f691027f149bbc58bbf0c207450a3654
> Author: Fabio Estevam <festevam@gmail.com>
> Date:   Tue May 28 16:00:21 2019 -0300
> 
>     arm64: dts: imx8mm: Pass a unit name for the 'soc' node
> 
>     The 'soc' name needs a unit name to match its 'ranges' property.
> 
>     Pass the unit name in order to fix the following dtc build warning
>     with W=1:
> 
>     arch/arm64/boot/dts/freescale/imx8mm.dtsi:203.6-754.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> 
>     This also aligns with imx8mq.dtsi.
> 
>     Signed-off-by: Fabio Estevam <festevam@gmail.com>
>     Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> 
> > 
> > > +		compatible = "simple-bus";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <1>;
> > > +		ranges = <0x0 0x0 0x0 0x40000000>;
> > > +
> > > +		per_bridge3: bus@29000000 {
> > > +			compatible = "simple-bus";
> > > +			reg = <0x29000000 0x800000>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +			ranges;
> > > +
> > > +			wdog3: watchdog@292a0000 {
> > > +				compatible = "fsl,imx8ulp-wdt", "fsl,imx7ulp-wdt";
> > > +				reg = <0x292a0000 0x10000>;
> > > +				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
> > > +				assigned-clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_SOSC_DIV2>;
> > > +				timeout-sec = <40>;
> > > +			};
> > > +
> > > +			cgc1: clock-controller@292c0000 {
> > > +				compatible = "fsl,imx8ulp-cgc1";
> > > +				reg = <0x292c0000 0x10000>;
> > > +				clocks = <&rosc>, <&sosc>, <&frosc>, <&lposc>;
> > > +				clock-names = "rosc", "sosc", "frosc", "lposc";
> > > +				#clock-cells = <1>;
> > > +			};
> > > +
> > > +			pcc3: clock-controller@292d0000 {
> > > +				compatible = "fsl,imx8ulp-pcc3";
> > > +				reg = <0x292d0000 0x10000>;
> > > +				#clock-cells = <1>;
> > > +			};
> > > +
> > > +			tpm5: tpm@29340000 {
> > > +				compatible = "fsl,imx8ulp-tpm", "fsl,imx7ulp-tpm";
> > > +				reg = <0x29340000 0x1000>;
> > > +				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_TPM5>,
> > > +					 <&pcc3 IMX8ULP_CLK_TPM5>;
> > > +				clock-names = "ipg", "per";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c4: i2c@29370000 {
> > > +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x29370000 0x10000>;
> > > +				interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>,
> > > +					 <&pcc3 IMX8ULP_CLK_LPI2C4>;
> > > +				clock-names = "per", "ipg";
> > > +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_XBAR_DIVBUS>;
> > > +				assigned-clock-rates = <48000000>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c5: i2c@29380000 {
> > > +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x29380000 0x10000>;
> > > +				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>,
> > > +					 <&pcc3 IMX8ULP_CLK_LPI2C5>;
> > > +				clock-names = "per", "ipg";
> > > +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_XBAR_DIVBUS>;
> > > +				assigned-clock-rates = <48000000>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart4: serial@29390000 {
> > > +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > > +				reg = <0x29390000 0x1000>;
> > > +				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
> > > +				clock-names = "ipg";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart5: serial@293a0000 {
> > > +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > > +				reg = <0x293a0000 0x1000>;
> > > +				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
> > > +				clock-names = "ipg";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi4: spi@293b0000 {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				compatible = "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x293b0000 0x10000>;
> > > +				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>,
> > > +					 <&pcc3 IMX8ULP_CLK_LPSPI4>;
> > > +				clock-names = "per", "ipg";
> > > +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_XBAR_DIVBUS>;
> > > +				assigned-clock-rates = <16000000>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi5: spi@293c0000 {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				compatible = "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x293c0000 0x10000>;
> > > +				interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>,
> > > +					 <&pcc3 IMX8ULP_CLK_LPSPI5>;
> > > +				clock-names = "per", "ipg";
> > > +				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_XBAR_DIVBUS>;
> > > +				assigned-clock-rates = <16000000>;
> > > +				status = "disabled";
> > > +			};
> > > +		};
> > > +
> > > +		per_bridge4: bus@29800000 {
> > > +			compatible = "simple-bus";
> > > +			reg = <0x29800000 0x800000>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +			ranges;
> > > +
> > > +			pcc4: clock-controller@29800000 {
> > > +				compatible = "fsl,imx8ulp-pcc4";
> > > +				reg = <0x29800000 0x10000>;
> > > +				#clock-cells = <1>;
> > > +			};
> > > +
> > > +			lpi2c6: i2c@29840000 {
> > > +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x29840000 0x10000>;
> > > +				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>,
> > > +					 <&pcc4 IMX8ULP_CLK_LPI2C6>;
> > > +				clock-names = "per", "ipg";
> > > +				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_XBAR_DIVBUS>;
> > > +				assigned-clock-rates = <48000000>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c7: i2c@29850000 {
> > > +				compatible = "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x29850000 0x10000>;
> > > +				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>,
> > > +					 <&pcc4 IMX8ULP_CLK_LPI2C7>;
> > > +				clock-names = "per", "ipg";
> > > +				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>;
> > > +				assigned-clock-parents = <&cgc1
> > IMX8ULP_CLK_XBAR_DIVBUS>;
> > > +				assigned-clock-rates = <48000000>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart6: serial@29860000 {
> > > +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > > +				reg = <0x29860000 0x1000>;
> > > +				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
> > > +				clock-names = "ipg";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart7: serial@29870000 {
> > > +				compatible = "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > > +				reg = <0x29870000 0x1000>;
> > > +				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
> > > +				clock-names = "ipg";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			iomuxc1: pinctrl@298c0000 {
> > > +				compatible = "fsl,imx8ulp-iomuxc1";
> > 
> > I know this binding is already landed.  Just curious why there is a suffix
> > number in the compatible.
> 
> There is two iomuxc, one is for M33, one is for A35.
> Similar with i.MX7ULP,  we use a suffix here.

Thanks for the info!

Shawn
