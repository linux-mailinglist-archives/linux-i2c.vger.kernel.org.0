Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666B349C9FD
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jan 2022 13:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbiAZMrm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jan 2022 07:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234178AbiAZMrm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jan 2022 07:47:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2FBC06161C;
        Wed, 26 Jan 2022 04:47:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E87F4B81CD5;
        Wed, 26 Jan 2022 12:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2413BC340E3;
        Wed, 26 Jan 2022 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643201259;
        bh=fb9p2tiimVxZktGWUAQ7fvdXKs7L5fXOveceAR1Ug28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oqnVyYnAxzKv0ymjqFg36olTHLwQ9EwHE4I7iI31c6XQGf+qtrIN5JHe4VxdH5ZQH
         sG7PHM8tF1BzyvMqkvJZZB8v6k1yvjXj4mEqPhLujmRfeRtXbCQucjvNruQkSjDN+q
         JM2wQXCd/M7bjITfDCO7oMXKpl7nWe46q6z7t90AWLBnwVnFJM2Nm6TY2YWPMYB+vl
         sl4qJoIX25VzzvMXCH2zHBYi6vWALrpOQej8oZtNVIF8NJlKrbtrp7/JwfPgX6reRS
         X8HKGPQGuFPHGR4pwf6Lx5yJ2UA2vbMzolStSmwPoRtLBD7wtSGmdZG8TTpTn0hlqV
         NuvkOvUPoqxEQ==
Date:   Wed, 26 Jan 2022 20:47:33 +0800
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
Subject: Re: [RESEND v4 05/10] arm64: dts: freescale: Add the imx8dxl
 connectivity subsys dtsi
Message-ID: <20220126124732.GR4686@dragon>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-6-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639680494-23183-6-git-send-email-abel.vesa@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 08:48:09PM +0200, Abel Vesa wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> On i.MX8DXL, the Connectivity subsystem includes below peripherals:
> 1x ENET with AVB support, 1x ENET with TSN support, 2x USB OTG,
> 1x eMMC, 2x SD, 1x NAND.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> new file mode 100644
> index 000000000000..b0059296a03f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + */

Shouldn't we include imx8-ss-conn.dtsi here?  Otherwise, the
/delete-node/ and &conn_subsys reference below looks baseless.

> +
> +/delete-node/ &enet1_lpcg;
> +/delete-node/ &fec2;
> +
> +&conn_subsys {
> +	conn_enet0_root_clk: clock-conn-enet0-root {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <250000000>;
> +		clock-output-names = "conn_enet0_root_clk";
> +	};
> +
> +	eqos: ethernet@5b050000 {
> +		compatible = "nxp,imx8dxl-dwmac-eqos", "snps,dwmac-5.10a";
> +		reg = <0x5b050000 0x10000>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "eth_wake_irq", "macirq";
> +		clocks = <&eqos_lpcg IMX_LPCG_CLK_2>,
> +			 <&eqos_lpcg IMX_LPCG_CLK_4>,
> +			 <&eqos_lpcg IMX_LPCG_CLK_0>,
> +			 <&eqos_lpcg IMX_LPCG_CLK_3>,
> +			 <&eqos_lpcg IMX_LPCG_CLK_1>;
> +		clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "mem";
> +		assigned-clocks = <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates = <125000000>;
> +		power-domains = <&pd IMX_SC_R_ENET_1>;
> +		clk_csr = <0>;

Is this property documented anywhere?

> +		status = "disabled";
> +	};
> +
> +	usbotg2: usb@5b0e0000 {
> +		compatible = "fsl,imx8dxl-usb", "fsl,imx7ulp-usb";
> +		reg = <0x5b0e0000 0x200>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +		fsl,usbphy = <&usbphy2>;
> +		fsl,usbmisc = <&usbmisc2 0>;
> +		/*
> +		 * usbotg1 and usbotg2 share one clcok

s/clcok/clock

> +		 * scfw disable clock access and keep it always on
> +		 * in case other core (M4) use one of these.
> +		 */
> +		clocks = <&clk_dummy>;
> +		ahb-burst-config = <0x0>;
> +		tx-burst-size-dword = <0x10>;
> +		rx-burst-size-dword = <0x10>;
> +		#stream-id-cells = <1>;
> +		power-domains = <&pd IMX_SC_R_USB_1>;
> +		status = "disabled";
> +	};
> +
> +	usbmisc2: usbmisc@5b0e0200 {
> +		#index-cells = <1>;
> +		compatible = "fsl,imx8dxl-usbmisc", "fsl,imx7ulp-usbmisc";
> +		reg = <0x5b0e0200 0x200>;
> +	};
> +
> +	usbphy2: usbphy@0x5b110000 {
> +		compatible = "fsl,imx8dxl-usbphy", "fsl,imx7ulp-usbphy";
> +		reg = <0x5b110000 0x1000>;
> +		clocks = <&usb2_2_lpcg IMX_LPCG_CLK_7>;
> +		status = "disabled";
> +	};
> +
> +	eqos_lpcg: clock-controller@5b240000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5b240000 0x10000>;
> +		#clock-cells = <1>;
> +		clocks = <&conn_enet0_root_clk>,
> +			 <&conn_axi_clk>,
> +			 <&conn_axi_clk>,
> +			 <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>,
> +			 <&conn_ipg_clk>;
> +		clock-indices = <IMX_LPCG_CLK_0>,
> +				<IMX_LPCG_CLK_2>,
> +				<IMX_LPCG_CLK_4>,
> +				<IMX_LPCG_CLK_5>,
> +				<IMX_LPCG_CLK_6>;
> +		clock-output-names = "eqos_ptp",
> +				     "eqos_mem_clk",
> +				     "eqos_aclk",
> +				     "eqos_clk",
> +				     "eqos_csr_clk";
> +		power-domains = <&pd IMX_SC_R_ENET_1>;
> +	};
> +
> +	usb2_2_lpcg: clock-controller@5b280000 {
> +		compatible = "fsl,imx8qxp-lpcg";
> +		reg = <0x5b280000 0x10000>;
> +		#clock-cells = <1>;
> +

Unneeded newline.

Shawn

> +		clock-indices = <IMX_LPCG_CLK_7>;
> +		clocks = <&conn_ipg_clk>;
> +		clock-output-names = "usboh3_2_phy_ipg_clk";
> +	};
> +
> +};
> +
> +&enet0_lpcg {
> +	clocks = <&conn_enet0_root_clk>,
> +		 <&conn_enet0_root_clk>,
> +		 <&conn_axi_clk>,
> +		 <&clk IMX_SC_R_ENET_0 IMX_SC_C_TXCLK>,
> +		 <&conn_ipg_clk>,
> +		 <&conn_ipg_clk>;
> +};
> +
> +&fec1 {
> +	compatible = "fsl,imx8dxl-fec", "fsl,imx8qm-fec";
> +	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +	assigned-clocks = <&clk IMX_SC_R_ENET_0 IMX_SC_C_CLKDIV>;
> +	assigned-clock-rates = <125000000>;
> +};
> +
> +&usdhc1 {
> +	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
> +	interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&usdhc2 {
> +	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
> +	interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&usdhc3 {
> +	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
> +	interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +};
> -- 
> 2.31.1
> 
