Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8C8379D39
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 04:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhEKDA2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 May 2021 23:00:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhEKDA2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 May 2021 23:00:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4402161409;
        Tue, 11 May 2021 02:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620701962;
        bh=D98gr128iCknJvrYh3HPBX/ArmUrzeHsUO9oS/+HIxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LFnOdH/XTxr483Gjd5sa6LOfticp+DoM1ZEN/nEUjEmtIw7KE7jDXp+vI3fhNRVs7
         1RuAK0dozfloep7HNIwDx2c9BP8yGzdy/JG1SIWxUPxKjYAiVmiAzt/RLdYShKnhkh
         1hQj9a6Rhd18xxThdRAZwgs0RHmWZIEiS3DWenOtu2k2g6euRwlSxQ7seBxbRp7L38
         a8RFOrOgP6rYWT5EYp54SXQyNzqevFv4JCXghAV9GGC7IwwZu6b8p9N9aTcfrc72WG
         wEd5P9IswBv7VcD3gwAJ2ycYJX2d9aZbBmhxfcLKX1nUTNIFMlK5i+RS+IhEZn+8ka
         u38HC8B7lHhKw==
Date:   Tue, 11 May 2021 10:59:11 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Clark Wang <xiaoning.wang@nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 05/18] ARM64: dts: imx8: add the missing lpi2c ipg
 clock
Message-ID: <20210511025911.GF3425@dragon>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-6-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406113306.2633595-6-xiaoning.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 06, 2021 at 07:32:53PM +0800, Clark Wang wrote:
> The lpi2c driver has add the missing ipg clock.
> So add the ipg clock here for all lpi2c nodes.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Historically, we use 'arm64: dts: ...' as subject prefix for arm64 DTS
patch, and 'ARM: dts: ...' for arm.

Shawn

> ---
> V2 changes:
>  - New patch added in V2
> ---
>  .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> index 960a802b8b6e..b5ed12a06538 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
> @@ -111,8 +111,10 @@ uart3_lpcg: clock-controller@5a490000 {
>  	i2c0: i2c@5a800000 {
>  		reg = <0x5a800000 0x4000>;
>  		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>;
> -		clock-names = "per";
> +		interrupt-parent = <&gic>;
> +		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>,
> +			 <&i2c0_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "per", "ipg";
>  		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
>  		assigned-clock-rates = <24000000>;
>  		power-domains = <&pd IMX_SC_R_I2C_0>;
> @@ -122,8 +124,10 @@ i2c0: i2c@5a800000 {
>  	i2c1: i2c@5a810000 {
>  		reg = <0x5a810000 0x4000>;
>  		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>;
> -		clock-names = "per";
> +		interrupt-parent = <&gic>;
> +		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>,
> +			 <&i2c1_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "per", "ipg";
>  		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
>  		assigned-clock-rates = <24000000>;
>  		power-domains = <&pd IMX_SC_R_I2C_1>;
> @@ -133,8 +137,10 @@ i2c1: i2c@5a810000 {
>  	i2c2: i2c@5a820000 {
>  		reg = <0x5a820000 0x4000>;
>  		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>;
> -		clock-names = "per";
> +		interrupt-parent = <&gic>;
> +		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>,
> +			 <&i2c2_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "per", "ipg";
>  		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
>  		assigned-clock-rates = <24000000>;
>  		power-domains = <&pd IMX_SC_R_I2C_2>;
> @@ -144,8 +150,10 @@ i2c2: i2c@5a820000 {
>  	i2c3: i2c@5a830000 {
>  		reg = <0x5a830000 0x4000>;
>  		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>;
> -		clock-names = "per";
> +		interrupt-parent = <&gic>;
> +		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>,
> +			 <&i2c3_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "per", "ipg";
>  		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
>  		assigned-clock-rates = <24000000>;
>  		power-domains = <&pd IMX_SC_R_I2C_3>;
> -- 
> 2.25.1
> 
