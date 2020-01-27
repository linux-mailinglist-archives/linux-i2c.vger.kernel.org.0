Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3E7F14A04D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 09:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgA0I5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 03:57:25 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:28365 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgA0I5Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 03:57:25 -0500
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
IronPort-SDR: knmfp9i9d32Y5m0bMmBtAw7qKRS754dzi65RXDHkWEisriHQq4BHgN15BF2IYk+brVw6dK0lWl
 dwGkGhcZUNASATXnpJc2YBOu3SwSt1cqj02mzSykaqtrus/t856axiw5S1m/l9/yB5nYpAKuSO
 LsmlErU9fzj4r7EyWysWO2Ho2mh8TlyJ/COEDaVPzWMQvAqMJXlxh+EVDgexKmNv04Fj6NtDRw
 Ut09R77N/7H3UGitQd4AqLhWuAnIhW9nka1SJMzhTaX3ub9Us5NUTfffwC4LDiPe6I4VupEwxu
 6sA=
X-IronPort-AV: E=Sophos;i="5.70,369,1574146800"; 
   d="scan'208";a="64593811"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2020 01:57:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Jan 2020 01:57:22 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 27 Jan 2020 01:57:23 -0700
Date:   Mon, 27 Jan 2020 09:56:57 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 5/6] ARM: at91/dt: sama5d4: add i2c gpio pinctrl
Message-ID: <20200127085657.wt4isv6f3v76jcr3@M43218.corp.atmel.com>
Mail-Followup-To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh@kernel.org, peda@axentia.se, linux@armlinux.org.uk
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
 <20200115115422.17097-6-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200115115422.17097-6-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 01:54:21PM +0200, Codrin Ciubotariu wrote:
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> Add the i2c gpio pinctrls so the i2c bus recovery option can be enabled
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
>  - none;
> 
>  arch/arm/boot/dts/sama5d4.dtsi | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
> index 6ab27a7b388d..26ce868096c2 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -458,8 +458,11 @@
>  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
>  					| AT91_XDMAC_DT_PERID(3))>;
>  				dma-names = "tx", "rx";
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c0>;
> +				pinctrl-1 = <&pinctrl_i2c0_gpio>;
> +				sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
> @@ -477,8 +480,11 @@
>  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
>  					| AT91_XDMAC_DT_PERID(5))>;
>  				dma-names = "tx", "rx";
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c1>;
> +				pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +				sda-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioE 30 GPIO_ACTIVE_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
> @@ -519,8 +525,11 @@
>  					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
>  					| AT91_XDMAC_DT_PERID(7))>;
>  				dma-names = "tx", "rx";
> -				pinctrl-names = "default";
> +				pinctrl-names = "default", "gpio";
>  				pinctrl-0 = <&pinctrl_i2c2>;
> +				pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +				sda-gpios = <&pioB 29 GPIO_ACTIVE_HIGH>;
> +				scl-gpios = <&pioB 30 GPIO_ACTIVE_HIGH>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>;
> @@ -1122,6 +1131,12 @@
>  							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_NONE
>  							 AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;
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
> @@ -1130,6 +1145,12 @@
>  							<AT91_PIOE 29 AT91_PERIPH_C AT91_PINCTRL_NONE	/* TWD1, conflicts with UART0 RX and DIBP */
>  							 AT91_PIOE 30 AT91_PERIPH_C AT91_PINCTRL_NONE>;	/* TWCK1, conflicts with UART0 TX and DIBN */
>  					};
> +
> +					pinctrl_i2c1_gpio: i2c1-gpio {
> +						atmel,pins =
> +							<AT91_PIOE 29 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
> +							 AT91_PIOE 30 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
> +					};
>  				};
>  
>  				i2c2 {
> @@ -1138,6 +1159,12 @@
>  							<AT91_PIOB 29 AT91_PERIPH_A AT91_PINCTRL_NONE	/* TWD2, conflicts with RD0 and PWML1 */
>  							 AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE>; /* TWCK2, conflicts with RF0 */
>  					};
> +
> +					pinctrl_i2c2_gpio: i2c2-gpio {
> +						atmel,pins =
> +							<AT91_PIOB 29 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
> +							 AT91_PIOB 30 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
> +					};
>  				};
>  
>  				isi {
> -- 
> 2.20.1
> 
