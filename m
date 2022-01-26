Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4662649C9A9
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jan 2022 13:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241296AbiAZM2y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jan 2022 07:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241298AbiAZM2x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jan 2022 07:28:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC78CC06161C;
        Wed, 26 Jan 2022 04:28:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9CA58B81CE3;
        Wed, 26 Jan 2022 12:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF30C340E3;
        Wed, 26 Jan 2022 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643200130;
        bh=9yhRa9yRgirMWQHOu0Sdi/mX+JUwRIAf1ljIpuG2t8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GzhUYGtc+h1A7jRnxuW24Iq/W6ReRoIE+lOekp8jxETGGGvcO/z5jFsyovab437Z/
         B5kBVttA7ePYviX7XdaNSEAnVjeShezZkD8WWwVzp+Y4j0xXQZuOJB5ZDhfg221q+n
         Vr2VvjXML5nB87wBqOGl27+p+3kM9UndBZ9/d/A6xpGErx0HRiBwooJjgNYzgDQRpf
         02RQw8ZD0ufA5jZohp3rPaKxrMIa2PjrNb4b86KtoJyOhkpBHG2XQC5z49paeU6iH9
         azRk/7eIepR6lxe+v2nqHODgdCHOjY0kd4dZTNSeF92SgZ9vVkmBuyV6nLcERG+wU2
         IZx54Zk6BBi+w==
Date:   Wed, 26 Jan 2022 20:27:49 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [RESEND v4 02/10] arm64: dts: freescale: Add the top level dtsi
 support for imx8dxl
Message-ID: <20220126122748.GP4686@dragon>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-3-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639680494-23183-3-git-send-email-abel.vesa@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 08:48:06PM +0200, Abel Vesa wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> The i.MX8DXL is a device targeting the automotive and industrial
> market segments. The flexibility of the architecture allows for
> use in a wide variety of general embedded applications. The chip
> is designed to achieve both high performance and low power consumption.
> The chip relies on the power efficient dual (2x) Cortex-A35 cluster.
> 
> Add the reserved memory node property for dsp reserved memory,
> the wakeup-irq property for SCU node, the imx ion, the rpmsg and the

Not sure what "ion" is.

> cm4 rproc support.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 245 +++++++++++++++++++++
>  1 file changed, 245 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> new file mode 100644
> index 000000000000..f16f88882c39
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + */
> +
> +#include <dt-bindings/clock/imx8-clock.h>
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/pads-imx8dxl.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		ethernet0 = &fec1;
> +		ethernet1 = &eqos;
> +		gpio0 = &lsio_gpio0;
> +		gpio1 = &lsio_gpio1;
> +		gpio2 = &lsio_gpio2;
> +		gpio3 = &lsio_gpio3;
> +		gpio4 = &lsio_gpio4;
> +		gpio5 = &lsio_gpio5;
> +		gpio6 = &lsio_gpio6;
> +		gpio7 = &lsio_gpio7;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		mu1 = &lsio_mu1;
> +		serial0 = &lpuart0;
> +		serial1 = &lpuart1;
> +		serial2 = &lpuart2;
> +		serial3 = &lpuart3;
> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		/* We have 1 clusters with 2 Cortex-A35 cores */

s/clusters/cluster

> +		A35_0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&A35_L2>;
> +			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
> +			#cooling-cells = <2>;
> +			operating-points-v2 = <&a35_opp_table>;
> +		};
> +
> +		A35_1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a35";
> +			reg = <0x0 0x1>;
> +			enable-method = "psci";
> +			next-level-cache = <&A35_L2>;
> +			clocks = <&clk IMX_SC_R_A35 IMX_SC_PM_CLK_CPU>;
> +			#cooling-cells = <2>;
> +			operating-points-v2 = <&a35_opp_table>;
> +		};
> +
> +		A35_L2: l2-cache0 {
> +			compatible = "cache";
> +		};
> +	};
> +
> +	a35_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-900000000 {
> +			opp-hz = /bits/ 64 <900000000>;
> +			opp-microvolt = <1000000>;
> +			clock-latency-ns = <150000>;
> +		};
> +
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt = <1100000>;
> +			clock-latency-ns = <150000>;
> +			opp-suspend;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		dsp_reserved: dsp@92400000 {
> +			reg = <0 0x92400000 0 0x2000000>;
> +			no-map;
> +		};
> +	};
> +
> +	gic: interrupt-controller@51a00000 {
> +		compatible = "arm,gic-v3";
> +		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
> +		      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	scu {
> +		compatible = "fsl,imx-scu";
> +		mbox-names = "tx0",
> +			     "rx0",
> +			     "gip3";
> +		mboxes = <&lsio_mu1 0 0
> +			  &lsio_mu1 1 0
> +			  &lsio_mu1 3 3>;
> +
> +		pd: imx8dxl-pd {
> +			compatible = "fsl,imx8dxl-scu-pd", "fsl,scu-pd";
> +			#power-domain-cells = <1>;
> +		};
> +
> +		clk: clock-controller {
> +			compatible = "fsl,imx8dxl-clk", "fsl,scu-clk";
> +			#clock-cells = <2>;
> +			clocks = <&xtal32k &xtal24m>;
> +			clock-names = "xtal_32KHz", "xtal_24Mhz";
> +		};
> +
> +		iomuxc: pinctrl {
> +			compatible = "fsl,imx8dxl-iomuxc";
> +		};
> +
> +		ocotp: imx8qx-ocotp {
> +			compatible = "fsl,imx8dxl-scu-ocotp", "fsl,imx8qxp-scu-ocotp";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			fec_mac0: mac@2c4 {
> +				reg = <0x2c4 6>;
> +			};
> +
> +			fec_mac1: mac@2c6 {
> +				reg = <0x2c6 6>;
> +			};
> +		};
> +
> +		watchdog {
> +			compatible = "fsl,imx-sc-wdt";
> +			timeout-sec = <60>;
> +		};
> +
> +		tsens: thermal-sensor {
> +			compatible = "fsl,imx-sc-thermal";
> +			#thermal-sensor-cells = <1>;
> +		};
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
> +	thermal_zones: thermal-zones {
> +		cpu-thermal0 {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&tsens IMX_SC_R_SYSTEM>;
> +
> +			trips {
> +				cpu_alert0: trip0 {
> +					temperature = <107000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};

Have a newline between nodes.

> +				cpu_crit0: trip1 {
> +					temperature = <127000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert0>;
> +					cooling-device =
> +					<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +
> +	clk_dummy: clock-dummy {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <0>;
> +		clock-output-names = "clk_dummy";
> +	};

Why do we need this?

Shawn

> +
> +	xtal32k: clock-xtal32k {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "xtal_32KHz";
> +	};
> +
> +	xtal24m: clock-xtal24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal_24MHz";
> +	};
> +
> +	sc_pwrkey: sc-powerkey {
> +		compatible = "fsl,imx8-pwrkey";
> +		linux,keycode = <KEY_POWER>;
> +		wakeup-source;
> +	};
> +
> +	/* sorted in register address */
> +	#include "imx8-ss-adma.dtsi"
> +	#include "imx8-ss-conn.dtsi"
> +	#include "imx8-ss-ddr.dtsi"
> +	#include "imx8-ss-lsio.dtsi"
> +};
> +
> +#include "imx8dxl-ss-adma.dtsi"
> +#include "imx8dxl-ss-conn.dtsi"
> +#include "imx8dxl-ss-lsio.dtsi"
> +#include "imx8dxl-ss-ddr.dtsi"
> -- 
> 2.31.1
> 
