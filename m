Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA0914A009
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 09:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgA0Itx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 03:49:53 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:24350 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgA0Itx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 03:49:53 -0500
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
IronPort-SDR: uesIW1g/Tw059LkN/ruT3oGD8YleBi8q6SOft7Ck3N2KcXaGMfTLCHpQFOVoIbVX6HqiIgu20n
 08pGRTnsYhUrKvSlsj0lmV2sonYaTBMXAtWnJEvIcgJ/pYptd8RNapDax+N3NanHNj89tEPbZ0
 QPx9Hn1GXCAeKpa/Gt29YjKAoq5CUEi5X2dZEzu+jBE3ndrzquaOmQtNH/MyxQKvC1pz1NTk52
 2P5MgijB+3/Rl9vgx43PT9OP9tjyP7s2UFFyhLDJ28tDNcsUm3sqONTVooPv8fUUyIK/R0A333
 F0U=
X-IronPort-AV: E=Sophos;i="5.70,369,1574146800"; 
   d="scan'208";a="63828837"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2020 01:49:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Jan 2020 01:49:50 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 27 Jan 2020 01:49:50 -0700
Date:   Mon, 27 Jan 2020 09:49:24 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kamel.bouhara@bootlin.com>,
        <wsa@the-dreams.de>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 1/6] dt-bindings: i2c: at91: document optional bus
 recovery properties
Message-ID: <20200127084924.4iflicf64pzzhouq@M43218.corp.atmel.com>
Mail-Followup-To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        robh@kernel.org, peda@axentia.se, linux@armlinux.org.uk
References: <20200115115422.17097-1-codrin.ciubotariu@microchip.com>
 <20200115115422.17097-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200115115422.17097-2-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 15, 2020 at 01:54:17PM +0200, Codrin Ciubotariu wrote:
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> The at91 I2C controller can support bus recovery by re-assigning SCL
> and SDA to gpios. Add the optional pinctrl and gpio properties to do
> so.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> [codrin.ciubotariu@microchip.com: rebased]
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
> 
> Changes in v3:
>  - rebased;
>  - added Reviewed-by tag from Rob;
> 
> Changes in v2:
>  - none;
> 
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
> index d4bad86107b8..96c914e048f5 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
> @@ -28,8 +28,13 @@ Optional properties:
>  	"atmel,sama5d4-i2c",
>  	"atmel,sama5d2-i2c",
>  	"microchip,sam9x60-i2c".
> +- scl-gpios: specify the gpio related to SCL pin
> +- sda-gpios: specify the gpio related to SDA pin
> +- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
> +  bus recovery, call it "gpio" state
>  - Child nodes conforming to i2c bus binding
>  
> +
>  Examples :
>  
>  i2c0: i2c@fff84000 {
> @@ -64,6 +69,11 @@ i2c0: i2c@f8034600 {
>  	clocks = <&flx0>;
>  	atmel,fifo-size = <16>;
>  	i2c-sda-hold-time-ns = <336>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c0>;
> +	pinctrl-1 = <&pinctrl_i2c0_gpio>;
> +	sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
> +	scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
>  
>  	wm8731: wm8731@1a {
>  		compatible = "wm8731";
> -- 
> 2.20.1
> 
