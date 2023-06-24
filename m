Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FA073C8B0
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 10:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbjFXIJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 04:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbjFXIJU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 04:09:20 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857B110F2
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:09:15 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51bde6a8c20so1530708a12.0
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687594154; x=1690186154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrxEKayi9Ds4WqdpCvHi8XbtwLnXpM6Lh+pSjtNNoSE=;
        b=RFdbcGr759xG442r0gPy3b3305LjWwFoAyktcFZ899PSQeEF6hfntmDA0vlS0cgvFG
         ox+hvodZsAIxheWINUcqWmBdAVUdLNTgEiBv+j+02pkZ+peZ9p5YmqzNwGosK5zDnjsl
         BLtwgifUNJIic/pZuhkJGfeZh7cXmlqqE7KO+DpxT2BRXrEqUsNrcBFwgsuFrYVol/2H
         Q3I6Qbd1emY/xCKF3pFfjTySVrBVrI13QbkuQthOBjzCGLL1ymopfw3tCVOUR+wzRLuS
         D0FE3/S7KQ68SFlkXdPne+beGWelAuxdjkLgp1xRKoQU8ZZdNzYmb0lkDzKHQgL6SS9d
         biWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687594154; x=1690186154;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrxEKayi9Ds4WqdpCvHi8XbtwLnXpM6Lh+pSjtNNoSE=;
        b=FhQdwrSL6SG4BBov1ntRVw56h3V7WDvL1+BdAyaBvzVkBl2t8QGJZ2YDAZ7TE5Gk4y
         DhPeG9uoLPr6/2eofSjKWq2egEZxYkrb75GhHgWH6vR++6CuLS4QmD4kB2KhLJtwIZqV
         bUn4w3Y76fp6DIQHlK0QASceefhUgIPfGKEZOFTJnz7qlv+as8hvj+Qcj+mJXvSI3QGt
         S2ptqiojA4+JjtJqPQqPgbMs0buI88yAJuLjGnwsW3skSl6735xlXZYgu6b8txGyxLV8
         IKMJHBYqpg1y/t9k2XHIM0/Gp994bHsPa2tAZ7ykKfYJwZUYMV39CJ2X3XfIGVaGReKC
         G8rw==
X-Gm-Message-State: AC+VfDzHJxc+M37izfANZiZ/Y/18zce+L1C8EIiH7bkHSx3QXEXVyEC5
        U6AyrdwFo3Jn7CxHDTQwsMuQFw==
X-Google-Smtp-Source: ACHHUZ5pHm0w6pBzV6Tc7DEQEPXbl5rK4CCeKTEtwldM7kE+Zb+I+b3utK/UKpTx2HYJC+QsfjFV2Q==
X-Received: by 2002:a05:6402:1248:b0:519:6f47:d1c9 with SMTP id l8-20020a056402124800b005196f47d1c9mr16636743edw.30.1687594153811;
        Sat, 24 Jun 2023 01:09:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u10-20020a056402064a00b00514b3dd8638sm406148edx.67.2023.06.24.01.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:09:13 -0700 (PDT)
Message-ID: <717e4a53-c0a8-0b60-4502-a819cf2089a6@linaro.org>
Date:   Sat, 24 Jun 2023 10:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 43/45] ARM: dts: at91: sam9x7: add device tree for SoC
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-44-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-44-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add device tree file for SAM9X7 SoC family.
> 
> Co-developed-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  arch/arm/boot/dts/sam9x7.dtsi | 1237 +++++++++++++++++++++++++++++++++
>  1 file changed, 1237 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sam9x7.dtsi
> 
> diff --git a/arch/arm/boot/dts/sam9x7.dtsi b/arch/arm/boot/dts/sam9x7.dtsi
> new file mode 100644
> index 000000000000..535a55f13dd0
> --- /dev/null
> +++ b/arch/arm/boot/dts/sam9x7.dtsi
> @@ -0,0 +1,1237 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * sam9x7.dtsi - Device Tree Include file for Microchip SAM9X7 SoC family
> + *
> + * Copyright (C) 2023 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
> + */
> +
> +#include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/dma/at91.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/pinctrl/at91.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	model = "Microchip SAM9X7 SoC";
> +	compatible = "microchip,sam9x7";
> +	interrupt-parent = <&aic>;
> +
> +	aliases {
> +		serial0 = &dbgu;

serial alias is rarely property of SoC. Do you claim that absolutely all
boards must use this serial and they cannot use anything else?

> +		gpio0 = &pioA;
> +		gpio1 = &pioB;
> +		gpio2 = &pioC;
> +		gpio3 = &pioD;

GPIOs are discussible but sometimes we keep them in SoC DTSI.

> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,arm926ej-s";
> +			device_type = "cpu";
> +			reg = <0>;
> +		};
> +	};
> +
> +	clocks {
> +		slow_xtal: clock-slowxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		main_xtal: clock-mainxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	sram: sram@300000 {
> +		compatible = "mmio-sram";
> +		reg = <0x300000 0x10000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x300000 0x10000>;
> +	};
> +
> +	ahb {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		usb0: gadget@500000 {
> +			compatible = "microchip,sam9x7-udc", "microchip,sam9x60-udc";
> +			reg = <0x500000 0x100000>,
> +			      <0xf803c000 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			clock-names = "pclk", "hclk";
> +			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			assigned-clock-rates = <480000000>;
> +			status = "disabled";
> +		};
> +
> +		ohci0: usb@600000 {
> +			compatible = "microchip,sam9x7-ohci", "atmel,at91rm9200-ohci", "usb-ohci";
> +			reg = <0x600000 0x100000>;
> +			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 22>, <&pmc PMC_TYPE_PERIPHERAL 22>, <&pmc PMC_TYPE_SYSTEM 6>;
> +			clock-names = "ohci_clk", "hclk", "uhpck";
> +			status = "disabled";
> +		};
> +
> +		ehci0: usb@700000 {
> +			compatible = "microchip,sam9x7-ehci", "atmel,at91sam9g45-ehci", "usb-ehci";
> +			reg = <0x700000 0x100000>;
> +			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> +			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
> +			clock-names = "usb_clk", "ehci_clk";
> +			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +			assigned-clock-rates = <480000000>;
> +			status = "disabled";
> +		};
> +
> +		sdmmc0: sdio-host@80000000 {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +			compatible = "microchip,sam9x7-sdhci", "microchip,sam9x60-sdhci";

So none of your DTS and bindings patches were tested... Limited review
follows as there is little sense to use reviewers time if you can use
machine.

> +			reg = <0x80000000 0x300>;
> +			interrupts = <12 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 12>, <&pmc PMC_TYPE_GCK 12>;
> +			clock-names = "hclock", "multclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 12>;
> +			assigned-clock-rates = <100000000>;
> +			status = "disabled";
> +		};
> +
> +		sdmmc1: sdio-host@90000000 {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +			compatible = "microchip,sam9x7-sdhci", "microchip,sam9x60-sdhci";
> +			reg = <0x90000000 0x300>;
> +			interrupts = <26 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_GCK 26>;
> +			clock-names = "hclock", "multclk";
> +			assigned-clocks = <&pmc PMC_TYPE_GCK 26>;
> +			assigned-clock-rates = <100000000>;
> +			status = "disabled";
> +		};
> +
> +		apb {
> +			compatible = "simple-bus";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			flx4: flexcom@f0000000 {
> +				compatible = "microchip,sam9x7-flexcom", "atmel,sama5d2-flexcom";
> +				reg = <0xf0000000 0x200>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x0 0xf0000000 0x800>;
> +				status = "disabled";
> +
> +				uart4: serial@200 {
> +					compatible = "microchip,sam9x7-usart", "microchip,sam9x60-usart", "atmel,at91sam9260-usart";

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> +					reg = <0x200 0x200>;
> +					interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
> +					dmas = <&dma0
> +						(AT91_XDMAC_DT_ME

...


> +
> +			dbgu: serial@fffff200 {
> +				compatible = "microchip,sam9x7-dbgu", "microchip,sam9x60-dbgu", "microchip,sam9x60-usart", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";

I wonder if we can make the line longer...

> +				reg = <0xfffff200 0x200>;
> +				interrupts = <47 IRQ_TYPE_LEVEL_HIGH 7>;
> +				dmas = <&dma0
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
> +					 AT91_XDMAC_DT_PERID(28))>,
> +				       <&dma0
> +					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
> +					 AT91_XDMAC_DT_PERID(29))>;
> +				dma-names = "tx", "rx";
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 47>;
> +				clock-names = "usart";
> +				status = "disabled";
> +			};
> +
> +			pinctrl: pinctrl@fffff400 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				compatible = "microchip,sam9x7-pinctrl", "microchip,sam9x60-pinctrl", "atmel,at91sam9x5-pinctrl", "simple-mfd";
> +				ranges = <0xfffff400 0xfffff400 0x800>;
> +
> +				/* mux-mask corresponding to sam9x7 SoC in TFBGA228L package */
> +				atmel,mux-mask = <
> +						 /*  A		B	   C	      D	  */
> +						 0xffffffff 0xffffefc0 0xc0ffd000 0x00000000	/* pioA */
> +						 0x07ffffff 0x0805fe7f 0x01ff9f80 0x06078000	/* pioB */
> +						 0xffffffff 0x07dfffff 0xfa3fffff 0x00000000	/* pioC */
> +						 0x00003fff 0x00003fe0 0x0000003f 0x00000000	/* pioD */
> +						 >;
> +
> +				pioA: gpio@fffff400 {
> +					compatible = "microchip,sam9x7-gpio", "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
> +					reg = <0xfffff400 0x200>;
> +					interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
> +					#gpio-cells = <2>;
> +					gpio-controller;
> +					interrupt-controller;
> +					#interrupt-cells = <2>;
> +					clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
> +				};
> +
> +				pioB: gpio@fffff600 {
> +					compatible = "microchip,sam9x7-gpio", "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
> +					reg = <0xfffff600 0x200>;
> +					interrupts = <3 IRQ_TYPE_LEVEL_HIGH 1>;
> +					#gpio-cells = <2>;
> +					gpio-controller;
> +					#gpio-lines = <26>;
> +					interrupt-controller;
> +					#interrupt-cells = <2>;
> +					clocks = <&pmc PMC_TYPE_PERIPHERAL 3>;
> +				};
> +
> +				pioC: gpio@fffff800 {
> +					compatible = "microchip,sam9x7-gpio", "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
> +					reg = <0xfffff800 0x200>;
> +					interrupts = <4 IRQ_TYPE_LEVEL_HIGH 1>;
> +					#gpio-cells = <2>;
> +					gpio-controller;
> +					interrupt-controller;
> +					#interrupt-cells = <2>;
> +					clocks = <&pmc PMC_TYPE_PERIPHERAL 4>;
> +				};
> +
> +				pioD: gpio@fffffa00 {
> +					compatible = "microchip,sam9x7-gpio", "microchip,sam9x60-gpio", "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
> +					reg = <0xfffffa00 0x200>;
> +					interrupts = <44 IRQ_TYPE_LEVEL_HIGH 1>;
> +					#gpio-cells = <2>;
> +					gpio-controller;
> +					#gpio-lines = <22>;
> +					interrupt-controller;
> +					#interrupt-cells = <2>;
> +					clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
> +				};
> +			};
> +
> +			pmc: pmc@fffffc00 {
> +				compatible = "microchip,sam9x7-pmc", "syscon";
> +				reg = <0xfffffc00 0x200>;
> +				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#clock-cells = <2>;
> +				clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
> +				clock-names = "td_slck", "md_slck", "main_xtal";
> +			};
> +
> +			reset_controller: rstc@fffffe00 {

reset-controller

> +				compatible = "microchip,sam9x7-rstc", "microchip,sam9x60-rstc";
> +				reg = <0xfffffe00 0x10>;
> +				clocks = <&clk32k 0>;
> +			};
> +
> +			shutdown_controller: shdwc@fffffe10 {

Usually power-management or reset-controller or something like this.



> +				compatible = "microchip,sam9x7-shdwc", "microchip,sam9x60-shdwc";
> +				reg = <0xfffffe10 0x10>;
> +				clocks = <&clk32k 0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				atmel,wakeup-rtc-timer;
> +				atmel,wakeup-rtt-timer;
> +				status = "disabled";


Best regards,
Krzysztof

