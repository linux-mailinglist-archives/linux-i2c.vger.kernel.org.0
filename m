Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EBF18A84E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 23:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCRWiJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 18:38:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgCRWiJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Mar 2020 18:38:09 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F0A3208D6;
        Wed, 18 Mar 2020 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584571087;
        bh=h2tPbIwaFRFhQaSi75kDBvH4/tYSSRHaaEn6nhZmdr0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kRfNA+9TdnyBzO10nx07GysVFZDKOEyZXyN8sBPtBgPClUs4D1pLwH1u86QGHRVLI
         VhUv0WyTisoDnDbPIwbBadfuS+0br3IgNJYuxEyNep50K1HIzxTFFk4DSvdoP4Cc0a
         lMfsOmO1OAURjbaxeaLs+C5fAoANSbhjfQwAzweA=
Received: by mail-qt1-f171.google.com with SMTP id i26so154650qtq.8;
        Wed, 18 Mar 2020 15:38:07 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1e37ELRDgpPS1nBHSGnpkzOYv2pzVidmM0gJBYMfBJOmpFX0W0
        pDr4IxegCI+qzH9NqQ7O6GthVxvMxUIq/IuRoA==
X-Google-Smtp-Source: ADFU+vvinsamjh03SlRMcAjEI9q54HjLWIwQqxaVLevloh2bB0C7//yNJi1GoxR+dLv32cxF/ysQBxwkILHfmpn8xBI=
X-Received: by 2002:ac8:59:: with SMTP id i25mr5558qtg.110.1584571086256; Wed,
 18 Mar 2020 15:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-20-lkundrak@v3.sk>
In-Reply-To: <20200317093922.20785-20-lkundrak@v3.sk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 18 Mar 2020 16:37:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-z+yx6vMv_vUCc-QCigDnN8K3zPkbWM_CgXj02FGY2w@mail.gmail.com>
Message-ID: <CAL_JsqK-z+yx6vMv_vUCc-QCigDnN8K3zPkbWM_CgXj02FGY2w@mail.gmail.com>
Subject: Re: [PATCH 19/28] dt-bindings: mmc: Convert sdhci-pxa to json-schema
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 3:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> Convert the sdhci-pxa binding to DT schema format using json-schema.

Ignore what my bot said, I see you addressed that earlier in the series.

> At the same time, fix a couple of issues with the examples discovered by
> the validation tool -- a semicolon instead of a comma and wrong node names.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/mmc/sdhci-pxa.txt     |  50 ---------
>  .../devicetree/bindings/mmc/sdhci-pxa.yaml    | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt b/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
> deleted file mode 100644
> index 3d1b449d6097d..0000000000000
> --- a/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -* Marvell sdhci-pxa v2/v3 controller
> -
> -This file documents differences between the core properties in mmc.txt
> -and the properties used by the sdhci-pxav2 and sdhci-pxav3 drivers.
> -
> -Required properties:
> -- compatible: Should be "mrvl,pxav2-mmc", "mrvl,pxav3-mmc" or
> -  "marvell,armada-380-sdhci".
> -- reg:
> -  * for "mrvl,pxav2-mmc" and "mrvl,pxav3-mmc", one register area for
> -    the SDHCI registers.
> -
> -  * for "marvell,armada-380-sdhci", three register areas. The first
> -    one for the SDHCI registers themselves, the second one for the
> -    AXI/Mbus bridge registers of the SDHCI unit, the third one for the
> -    SDIO3 Configuration register
> -- reg names: should be "sdhci", "mbus", "conf-sdio3". only mandatory
> -  for "marvell,armada-380-sdhci"
> -- clocks: Array of clocks required for SDHCI; requires at least one for
> -    I/O clock.
> -- clock-names: Array of names corresponding to clocks property; shall be
> -    "io" for I/O clock and "core" for optional core clock.
> -
> -Optional properties:
> -- mrvl,clk-delay-cycles: Specify a number of cycles to delay for tuning.
> -
> -Example:
> -
> -sdhci@d4280800 {
> -       compatible = "mrvl,pxav3-mmc";
> -       reg = <0xd4280800 0x800>;
> -       bus-width = <8>;
> -       interrupts = <27>;
> -       clocks = <&chip CLKID_SDIO1XIN>, <&chip CLKID_SDIO1>;
> -       clock-names = "io", "core";
> -       non-removable;
> -       mrvl,clk-delay-cycles = <31>;
> -};
> -
> -sdhci@d8000 {
> -       compatible = "marvell,armada-380-sdhci";
> -       reg-names = "sdhci", "mbus", "conf-sdio3";
> -       reg = <0xd8000 0x1000>,
> -               <0xdc000 0x100>;
> -               <0x18454 0x4>;
> -       interrupts = <0 25 0x4>;
> -       clocks = <&gateclk 17>;
> -       clock-names = "io";
> -       mrvl,clk-delay-cycles = <0x1F>;
> -};
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> new file mode 100644
> index 0000000000000..4ae0926ac294f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> @@ -0,0 +1,101 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA SDHCI v2/v3 bindings
> +
> +maintainers:
> +  - devicetree@vger.kernel.org
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: marvell,armada-380-sdhci
> +    then:
> +      properties:
> +        regs:
> +          minItems: 3
> +          maxItems: 3

Here, you just need minItems.

> +        reg-names:
> +          items:
> +            - const: sdhci
> +            - const: mbus
> +            - const: conf-sdio3

This should be under the main definition of 'reg-names' and then just
'minItems: 3' here.

> +      required:
> +        - reg-names
> +    else:
> +      properties:
> +        regs:
> +          minItems: 1
> +          maxItems: 1

Just 'maxItems' is sufficient.

> +        reg-names:
> +          minItems: 1
> +          maxItems: 1
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mrvl,pxav2-mmc
> +      - mrvl,pxav3-mmc
> +      - marvell,armada-380-sdhci
> +
> +  reg: true

Here you should have:

minItems: 1
maxItems: 3

> +
> +  reg-names: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: io
> +      - const: core
> +
> +  mrvl,clk-delay-cycles:
> +    description: Specify a number of cycles to delay for tuning.
> +    $ref: /schemas/types.yaml#/definitions/uint32

No range of valid values?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/berlin2.h>
> +    mmc@d4280800 {
> +        compatible = "mrvl,pxav3-mmc";
> +        reg = <0xd4280800 0x800>;
> +        bus-width = <8>;
> +        interrupts = <27>;
> +        clocks = <&chip CLKID_SDIO1XIN>, <&chip CLKID_SDIO1>;
> +        clock-names = "io", "core";
> +        non-removable;
> +        mrvl,clk-delay-cycles = <31>;
> +    };
> +  - |
> +    mmc@d8000 {
> +        compatible = "marvell,armada-380-sdhci";
> +        reg-names = "sdhci", "mbus", "conf-sdio3";
> +        reg = <0xd8000 0x1000>,
> +              <0xdc000 0x100>,
> +              <0x18454 0x4>;
> +        interrupts = <0 25 0x4>;
> +        clocks = <&gateclk 17>;
> +        clock-names = "io";
> +        mrvl,clk-delay-cycles = <0x1F>;
> +    };
> +
> +...
> --
> 2.25.1
>
