Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB8014A045
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 09:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgA0I4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 03:56:16 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:25000 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgA0I4Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 03:56:16 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: x+zFQFsYXOi702XMnWwG7iwy/ol2U/EccRcPhvSLiej9ahUlEMUz3AEz4dUAZ73Jw2666oJ3yo
 MF2noVLtub9u5G2563cM2mU9P+C5LPQ1M89/49qlr1qEVMZyl5LtJz3QdKlGQwamlCivIQ30J5
 KnFk6EaRAIAbPzdy/DhbxlIabamW0QQrGwLrBzI1oHDXkKiJuxuwF6RMg9QriY+wQjtNnS+8T3
 P7rkk2GHfGiI0MrbiXUEDw+aStPMIV4L4+TLcuS+Kps8bAVgZFUTbfbnf0iGkj0p6DuyDCNQ1Z
 kjI=
X-IronPort-AV: E=Sophos;i="5.70,369,1574146800"; 
   d="scan'208";a="63829598"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2020 01:55:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Jan 2020 01:55:59 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 27 Jan 2020 01:56:00 -0700
Date:   Mon, 27 Jan 2020 09:55:34 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Message-ID: <20200127085534.gux7rjtr275al4pb@M43218.corp.atmel.com>
Mail-Followup-To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh@kernel.org, peda@axentia.se, linux@armlinux.org.uk
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
 <20200115115422.17097-5-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200115115422.17097-5-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 01:54:20PM +0200, Codrin Ciubotariu wrote:
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> Add the i2c gpio pinctrls to support the i2c bus recovery
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> [codrin.ciubotariu@microchip.com: removed gpio pull-ups]
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
> 
> Changes in v3:
>  - removed gpio pull-ups;
> 
> Changes in v2:
>   - none;
> 
>  arch/arm/boot/dts/sama5d3.dtsi | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
> index f770aace0efd..1cea2137decf 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -159,8 +159,11 @@
>  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(7)>,
>  				       <&dma0 2 AT91_DMA_CFG_PER_ID(8)>;
>  				dma-names = "tx", "rx";
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c0>;
> +				pinctrl-1 = <&pinctrl_i2c0_gpio>;
> +				sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				clocks = <&twi0_clk>;
> @@ -174,8 +177,11 @@
>  				dmas = <&dma0 2 AT91_DMA_CFG_PER_ID(9)>,
>  				       <&dma0 2 AT91_DMA_CFG_PER_ID(10)>;
>  				dma-names = "tx", "rx";
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c1>;
> +				pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +				sda-gpios = <&pioC 26 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioC 27 GPIO_ACTIVE_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				clocks = <&twi1_clk>;
> @@ -357,8 +363,11 @@
>  				dmas = <&dma1 2 AT91_DMA_CFG_PER_ID(11)>,
>  				       <&dma1 2 AT91_DMA_CFG_PER_ID(12)>;
>  				dma-names = "tx", "rx";
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c2>;
> +				pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +				sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA 19 GPIO_ACTIVE_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				clocks = <&twi2_clk>;
> @@ -639,6 +648,12 @@
>  							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PA30 periph A TWD0 pin, conflicts with URXD1, ISI_VSYNC */
>  							 AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA31 periph A TWCK0 pin, conflicts with UTXD1, ISI_HSYNC */
>  					};
> +
> +					pinctrl_i2c0_gpio: i2c0-gpio {
> +						atmel,pins =
> +							<AT91_PIOA 30 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
> +							 AT91_PIOA 31 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
> +					};
>  				};
>  
>  				i2c1 {
> @@ -647,6 +662,12 @@
>  							<AT91_PIOC 26 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC26 periph B TWD1 pin, conflicts with SPI1_NPCS1, ISI_D11 */
>  							 AT91_PIOC 27 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PC27 periph B TWCK1 pin, conflicts with SPI1_NPCS2, ISI_D10 */
>  					};
> +
> +					pinctrl_i2c1_gpio: i2c1-gpio {
> +						atmel,pins =
> +							<AT91_PIOC 26 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
> +							 AT91_PIOC 27 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
> +					};
>  				};
>  
>  				i2c2 {
> @@ -655,6 +676,12 @@
>  							<AT91_PIOA 18 AT91_PERIPH_B AT91_PINCTRL_NONE	/* TWD2 pin, conflicts with LCDDAT18, ISI_D2 */
>  							 AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_NONE>; /* TWCK2 pin, conflicts with LCDDAT19, ISI_D3 */
>  					};
> +
> +					pinctrl_i2c2_gpio: i2c2-gpio {
> +						atmel,pins =
> +							<AT91_PIOA 18 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
> +							 AT91_PIOA 19 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
> +					};
>  				};
>  
>  				isi {
> -- 
> 2.20.1
> 
