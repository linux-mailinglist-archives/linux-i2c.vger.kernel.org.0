Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E614A052
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 09:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgA0I5j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 03:57:39 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:28405 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgA0I5j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 03:57:39 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: K2HpuAX1lJwLcZZ1nQENPHKYQRDC8e57kLJv7crngMecfqh0ely0hk5xhGRw4S6/CoSL/M11Ks
 Av/AC9Eh3CkCMowfPYqF6S2bWa7tLzQE75xLxM9dESFLZsC8AZtyPwmX1A6izU9I/H7pJNXxyc
 imLCVIgSuWX1D9Otfx+bYrNTUOG9/I6vBHq313ZY0I0RRTOjShZIRsiJlhVO6k05c/IfSzsZKK
 Qc0mvmMCb0ABPmGa0ez9vU5981tM9knbAJJDPzG1qibH9WNApyZYcBvc6bO7A3lk/f5Q7+iGSX
 nBs=
X-IronPort-AV: E=Sophos;i="5.70,369,1574146800"; 
   d="scan'208";a="64593857"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2020 01:57:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Jan 2020 01:57:38 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 27 Jan 2020 01:57:39 -0700
Date:   Mon, 27 Jan 2020 09:57:13 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 6/6] ARM: at91/dt: sama5d2: add i2c gpio pinctrl
Message-ID: <20200127085713.ykinu5owrxaoly3y@M43218.corp.atmel.com>
Mail-Followup-To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh@kernel.org, peda@axentia.se, linux@armlinux.org.uk
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
 <20200115115422.17097-7-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200115115422.17097-7-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 01:54:22PM +0200, Codrin Ciubotariu wrote:
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
>  - new patch;
> 
>  arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts   | 33 +++++++++++++++++++--
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 33 +++++++++++++++++++--
>  2 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
> index ba7f3e646c26..1c24ac8019ba 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
> +++ b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
> @@ -180,8 +180,11 @@
>  
>  			i2c0: i2c@f8028000 {
>  				dmas = <0>, <0>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c0_default>;
> +				pinctrl-1 = <&pinctrl_i2c0_gpio>;
> +				sda-gpios = <&pioA PIN_PD21 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA PIN_PD22 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
>  
> @@ -198,8 +201,11 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
> -					pinctrl-names = "default";
> +					pinctrl-names = "default", "gpio";
>  					pinctrl-0 = <&pinctrl_flx0_default>;
> +					pinctrl-1 = <&pinctrl_flx0_gpio>;
> +					sda-gpios = <&pioA PIN_PB28 GPIO_ACTIVE_HIGH>;
> +					scl-gpios = <&pioA PIN_PB29 GPIO_ACTIVE_HIGH>;
>  					atmel,fifo-size = <16>;
>  					status = "okay";
>  				};
> @@ -226,8 +232,11 @@
>  
>  			i2c1: i2c@fc028000 {
>  				dmas = <0>, <0>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c1_default>;
> +				pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +				sda-gpios = <&pioA PIN_PC6 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA PIN_PC7 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  
>  				at24@50 {
> @@ -244,18 +253,36 @@
>  					bias-disable;
>  				};
>  
> +				pinctrl_flx0_gpio: flx0_gpio {
> +					pinmux = <PIN_PB28__GPIO>,
> +						 <PIN_PB29__GPIO>;
> +					bias-disable;
> +				};
> +
>  				pinctrl_i2c0_default: i2c0_default {
>  					pinmux = <PIN_PD21__TWD0>,
>  						 <PIN_PD22__TWCK0>;
>  					bias-disable;
>  				};
>  
> +				pinctrl_i2c0_gpio: i2c0_gpio {
> +					pinmux = <PIN_PD21__GPIO>,
> +						 <PIN_PD22__GPIO>;
> +					bias-disable;
> +				};
> +
>  				pinctrl_i2c1_default: i2c1_default {
>  					pinmux = <PIN_PC6__TWD1>,
>  						 <PIN_PC7__TWCK1>;
>  					bias-disable;
>  				};
>  
> +				pinctrl_i2c1_gpio: i2c1_gpio {
> +					pinmux = <PIN_PC6__GPIO>,
> +						 <PIN_PC7__GPIO>;
> +					bias-disable;
> +				};
> +
>  				pinctrl_key_gpio_default: key_gpio_default {
>  					pinmux = <PIN_PA10__GPIO>;
>  					bias-pull-up;
> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> index 9d0a7fbea725..055ee53e4773 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> @@ -129,8 +129,11 @@
>  
>  			i2c0: i2c@f8028000 {
>  				dmas = <0>, <0>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c0_default>;
> +				pinctrl-1 = <&pinctrl_i2c0_gpio>;
> +				sda-gpios = <&pioA PIN_PD21 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA PIN_PD22 GPIO_ACTIVE_HIGH>;
>  				i2c-sda-hold-time-ns = <350>;
>  				status = "okay";
>  
> @@ -331,8 +334,11 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					clocks = <&pmc PMC_TYPE_PERIPHERAL 23>;
> -					pinctrl-names = "default";
> +					pinctrl-names = "default", "gpio";
>  					pinctrl-0 = <&pinctrl_flx4_default>;
> +					pinctrl-1 = <&pinctrl_flx4_gpio>;
> +					sda-gpios = <&pioA PIN_PD12 GPIO_ACTIVE_HIGH>;
> +					scl-gpios = <&pioA PIN_PD13 GPIO_ACTIVE_HIGH>;
>  					atmel,fifo-size = <16>;
>  					i2c-analog-filter;
>  					i2c-digital-filter;
> @@ -343,11 +349,14 @@
>  
>  			i2c1: i2c@fc028000 {
>  				dmas = <0>, <0>;
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c1_default>;
>  				i2c-analog-filter;
>  				i2c-digital-filter;
>  				i2c-digital-filter-width-ns = <35>;
> +				pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +				sda-gpios = <&pioA PIN_PD4 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA PIN_PD5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  
>  				at24@54 {
> @@ -441,18 +450,36 @@
>  					bias-disable;
>  				};
>  
> +				pinctrl_flx4_gpio: flx4_gpio {
> +					pinmux = <PIN_PD12__GPIO>,
> +						 <PIN_PD13__GPIO>;
> +					bias-disable;
> +				};
> +
>  				pinctrl_i2c0_default: i2c0_default {
>  					pinmux = <PIN_PD21__TWD0>,
>  						 <PIN_PD22__TWCK0>;
>  					bias-disable;
>  				};
>  
> +				pinctrl_i2c0_gpio: i2c0_gpio {
> +					pinmux = <PIN_PD21__GPIO>,
> +						 <PIN_PD22__GPIO>;
> +					bias-disable;
> +				};
> +
>  				pinctrl_i2c1_default: i2c1_default {
>  					pinmux = <PIN_PD4__TWD1>,
>  						 <PIN_PD5__TWCK1>;
>  					bias-disable;
>  				};
>  
> +				pinctrl_i2c1_gpio: i2c1_gpio {
> +					pinmux = <PIN_PD4__GPIO>,
> +						 <PIN_PD5__GPIO>;
> +					bias-disable;
> +				};
> +
>  				pinctrl_i2s0_default: i2s0_default {
>  					pinmux = <PIN_PC1__I2SC0_CK>,
>  						 <PIN_PC2__I2SC0_MCK>,
> -- 
> 2.20.1
> 
