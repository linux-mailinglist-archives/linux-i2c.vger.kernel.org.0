Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C2649CA15
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jan 2022 13:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241523AbiAZMyF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jan 2022 07:54:05 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33916 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbiAZMyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jan 2022 07:54:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8CC3AB81CD5;
        Wed, 26 Jan 2022 12:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA69C340E3;
        Wed, 26 Jan 2022 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643201642;
        bh=ETfPsNyQEaV/a75wVcFhqh3rF6nlgsiJF01FaJDNS3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uy4PQg9sw/8NJ4F63OZimTr/qfEsHuAp6KpCn0LVHzjTikzNsOtrG6fWs+v+uaGEP
         2kd+X5daWorJYB5wIe55Xe3+hbW7uu2PYTK3gM2S4sDP7+lASrLudfXJD0dC+xnVnS
         vr7mP+9j2zXTTAgXgbBMTrO8tKcz0cyTKNrb9pZ87pC07SBakiU6v44cxOdjc30C56
         cG1sjaLiqByg8tUMY3F99tXIH/vs2xDRjbqYZMGkjkRDVbmPV+zrS+yeQYRecBYRZ3
         82+Ezwuf88bqYAV8FmbfP+V5Vn+Fut+IQfuvYocyTVlgfb5DXDf7kmR1j/QQVrtPqV
         GxnyiIaoHdvDA==
Date:   Wed, 26 Jan 2022 20:53:55 +0800
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
Subject: Re: [RESEND v4 08/10] arm64: dts: imx8dxl: Add i.MX8DXL evk board
 support
Message-ID: <20220126125355.GS4686@dragon>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-9-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639680494-23183-9-git-send-email-abel.vesa@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 08:48:12PM +0200, Abel Vesa wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add i.MX8DXL EVK board support.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 266 ++++++++++++++++++
>  2 files changed, 267 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 5018b8b1e5f2..f117d3e811ba 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-pico-pi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-thor96.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb

Keep the list sorted.

>  dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> new file mode 100644
> index 000000000000..68dfe722af6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8dxl.dtsi"
> +
> +/ {
> +	model = "Freescale i.MX8DXL EVK";
> +	compatible = "fsl,imx8dxl-evk", "fsl,imx8dxl";
> +
> +	chosen {
> +		stdout-path = &lpuart0;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x80000000 0 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/*
> +		 * 0x8800_0000 ~ 0x8FFF_FFFF is reserved for M4
> +		 * Shouldn't be used at A core and Linux side.
> +		 *
> +		 */
> +		m4_reserved: m4@88000000 {
> +			no-map;
> +			reg = <0 0x88000000 0 0x8000000>;
> +		};
> +
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0 0x14000000>;
> +			alloc-ranges = <0 0x98000000 0 0x14000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	reg_usdhc2_vmmc: usdhc2-vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD1_SPWR";
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +		gpio = <&lsio_gpio4 30 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <3480>;
> +	};
> +};
> +
> +&lpuart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpuart0>;
> +	status = "okay";
> +};
> +
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpuart1>;
> +	status = "okay";
> +};
> +
> +&lsio_gpio4 {
> +	status = "okay";
> +};
> +
> +&lsio_gpio5 {
> +	status = "okay";
> +};
> +
> +&thermal_zones {
> +	pmic-thermal0 {
> +		polling-delay-passive = <250>;
> +		polling-delay = <2000>;
> +		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;

Have a newline between property and child node.

> +		trips {
> +			pmic_alert0: trip0 {
> +				temperature = <110000>;
> +				hysteresis = <2000>;
> +				type = "passive";
> +			};

Have a newline between nodes.

> +			pmic_crit0: trip1 {
> +				temperature = <125000>;
> +				hysteresis = <2000>;
> +				type = "critical";
> +			};
> +		};
> +		cooling-maps {
> +			map0 {
> +				trip = <&pmic_alert0>;
> +				cooling-device =
> +					<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +		pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +		pinctrl-0 = <&pinctrl_usdhc1>;
> +		pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +		pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +		bus-width = <8>;
> +		no-sd;
> +		no-sdio;
> +		non-removable;
> +		status = "okay";

One level of indent is good enough.

> +};
> +
> +&usdhc2 {
> +		pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +		pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +		pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +		pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +		bus-width = <4>;
> +		vmmc-supply = <&reg_usdhc2_vmmc>;
> +		cd-gpios = <&lsio_gpio5 1 GPIO_ACTIVE_LOW>;
> +		wp-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_HIGH>;
> +		max-frequency = <100000000>;
> +		status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHB_PAD	0x000514a0
> +			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHK_PAD	0x000014a0
> +			IMX8DXL_SPI3_CS0_ADMA_ACM_MCLK_OUT1		0x0600004c
> +			IMX8DXL_SNVS_TAMPER_OUT1_LSIO_GPIO2_IO05_IN	0x0600004c
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			IMX8DXL_SPI1_SCK_ADMA_I2C2_SDA		0x06000021
> +			IMX8DXL_SPI1_SDO_ADMA_I2C2_SCL		0x06000021
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			IMX8DXL_SPI1_CS0_ADMA_I2C3_SDA		0x06000021
> +			IMX8DXL_SPI1_SDI_ADMA_I2C3_SCL		0x06000021
> +		>;
> +	};
> +
> +	pinctrl_lpuart0: lpuart0grp {
> +		fsl,pins = <
> +			IMX8DXL_UART0_RX_ADMA_UART0_RX		0x06000020
> +			IMX8DXL_UART0_TX_ADMA_UART0_TX		0x06000020
> +		>;
> +	};
> +
> +	pinctrl_lpuart1: lpuart1grp {
> +		fsl,pins = <
> +			IMX8DXL_UART1_TX_ADMA_UART1_TX          0x06000020
> +			IMX8DXL_UART1_RX_ADMA_UART1_RX          0x06000020
> +			IMX8DXL_UART1_RTS_B_ADMA_UART1_RTS_B    0x06000020
> +			IMX8DXL_UART1_CTS_B_ADMA_UART1_CTS_B    0x06000020
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK	0x06000041
> +			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD	0x00000021
> +			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021
> +			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021
> +			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021
> +			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021
> +			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021
> +			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021
> +			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021
> +			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021
> +			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {

For sake of consistency, we probably should still end the node name with 'grp'.

Shawn

> +		fsl,pins = <
> +			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK	0x06000041
> +			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD	0x00000021
> +			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021
> +			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021
> +			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021
> +			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021
> +			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021
> +			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021
> +			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021
> +			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021
> +			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
> +		fsl,pins = <
> +			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK	0x06000041
> +			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD	0x00000021
> +			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0	0x00000021
> +			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1	0x00000021
> +			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2	0x00000021
> +			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3	0x00000021
> +			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4	0x00000021
> +			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5	0x00000021
> +			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6	0x00000021
> +			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7	0x00000021
> +			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE	0x00000041
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			IMX8DXL_ENET0_RGMII_TX_CTL_LSIO_GPIO4_IO30	0x00000040 /* RESET_B */
> +			IMX8DXL_ENET0_RGMII_TXD1_LSIO_GPIO5_IO00	0x00000021 /* WP */
> +			IMX8DXL_ENET0_RGMII_TXD2_LSIO_GPIO5_IO01	0x00000021 /* CD */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK		0x06000041
> +			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3	0x00000021
> +			IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT	0x00000021
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
> +		fsl,pins = <
> +			IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK		0x06000041
> +			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3	0x00000021
> +			IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT	0x00000021
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
> +		fsl,pins = <
> +			IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK		0x06000041
> +			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2	0x00000021
> +			IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3	0x00000021
> +			IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT	0x00000021
> +		>;
> +	};
> +};
> -- 
> 2.31.1
> 
