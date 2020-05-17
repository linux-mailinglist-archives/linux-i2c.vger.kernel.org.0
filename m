Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE451D6BC2
	for <lists+linux-i2c@lfdr.de>; Sun, 17 May 2020 20:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgEQSfs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 May 2020 14:35:48 -0400
Received: from v6.sk ([167.172.42.174]:56754 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgEQSfr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 May 2020 14:35:47 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id BAE55610A8;
        Sun, 17 May 2020 18:35:43 +0000 (UTC)
Date:   Sun, 17 May 2020 20:35:41 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
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
Subject: Re: [PATCH 19/28] dt-bindings: mmc: Convert sdhci-pxa to json-schema
Message-ID: <20200517183541.GA1695525@furthur.local>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-20-lkundrak@v3.sk>
 <CAL_JsqK-z+yx6vMv_vUCc-QCigDnN8K3zPkbWM_CgXj02FGY2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK-z+yx6vMv_vUCc-QCigDnN8K3zPkbWM_CgXj02FGY2w@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 18, 2020 at 04:37:55PM -0600, Rob Herring wrote:
> On Tue, Mar 17, 2020 at 3:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > Convert the sdhci-pxa binding to DT schema format using json-schema.
> 
> Ignore what my bot said, I see you addressed that earlier in the series.
> 
> > At the same time, fix a couple of issues with the examples discovered by
> > the validation tool -- a semicolon instead of a comma and wrong node names.
> >
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > ---
> >  .../devicetree/bindings/mmc/sdhci-pxa.txt     |  50 ---------
> >  .../devicetree/bindings/mmc/sdhci-pxa.yaml    | 101 ++++++++++++++++++
> >  2 files changed, 101 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
> >  create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt b/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
> > deleted file mode 100644
> > index 3d1b449d6097d..0000000000000
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -* Marvell sdhci-pxa v2/v3 controller
> > -
> > -This file documents differences between the core properties in mmc.txt
> > -and the properties used by the sdhci-pxav2 and sdhci-pxav3 drivers.
> > -
> > -Required properties:
> > -- compatible: Should be "mrvl,pxav2-mmc", "mrvl,pxav3-mmc" or
> > -  "marvell,armada-380-sdhci".
> > -- reg:
> > -  * for "mrvl,pxav2-mmc" and "mrvl,pxav3-mmc", one register area for
> > -    the SDHCI registers.
> > -
> > -  * for "marvell,armada-380-sdhci", three register areas. The first
> > -    one for the SDHCI registers themselves, the second one for the
> > -    AXI/Mbus bridge registers of the SDHCI unit, the third one for the
> > -    SDIO3 Configuration register
> > -- reg names: should be "sdhci", "mbus", "conf-sdio3". only mandatory
> > -  for "marvell,armada-380-sdhci"
> > -- clocks: Array of clocks required for SDHCI; requires at least one for
> > -    I/O clock.
> > -- clock-names: Array of names corresponding to clocks property; shall be
> > -    "io" for I/O clock and "core" for optional core clock.
> > -
> > -Optional properties:
> > -- mrvl,clk-delay-cycles: Specify a number of cycles to delay for tuning.
> > -
> > -Example:
> > -
> > -sdhci@d4280800 {
> > -       compatible = "mrvl,pxav3-mmc";
> > -       reg = <0xd4280800 0x800>;
> > -       bus-width = <8>;
> > -       interrupts = <27>;
> > -       clocks = <&chip CLKID_SDIO1XIN>, <&chip CLKID_SDIO1>;
> > -       clock-names = "io", "core";
> > -       non-removable;
> > -       mrvl,clk-delay-cycles = <31>;
> > -};
> > -
> > -sdhci@d8000 {
> > -       compatible = "marvell,armada-380-sdhci";
> > -       reg-names = "sdhci", "mbus", "conf-sdio3";
> > -       reg = <0xd8000 0x1000>,
> > -               <0xdc000 0x100>;
> > -               <0x18454 0x4>;
> > -       interrupts = <0 25 0x4>;
> > -       clocks = <&gateclk 17>;
> > -       clock-names = "io";
> > -       mrvl,clk-delay-cycles = <0x1F>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> > new file mode 100644
> > index 0000000000000..4ae0926ac294f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
> > @@ -0,0 +1,101 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell PXA SDHCI v2/v3 bindings
> > +
> > +maintainers:
> > +  - devicetree@vger.kernel.org
> > +
> > +allOf:
> > +  - $ref: mmc-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: marvell,armada-380-sdhci
> > +    then:
> > +      properties:
> > +        regs:
> > +          minItems: 3
> > +          maxItems: 3
> 
> Here, you just need minItems.
> 
> > +        reg-names:
> > +          items:
> > +            - const: sdhci
> > +            - const: mbus
> > +            - const: conf-sdio3
> 
> This should be under the main definition of 'reg-names' and then just
> 'minItems: 3' here.
> 
> > +      required:
> > +        - reg-names
> > +    else:
> > +      properties:
> > +        regs:
> > +          minItems: 1
> > +          maxItems: 1
> 
> Just 'maxItems' is sufficient.
> 
> > +        reg-names:
> > +          minItems: 1
> > +          maxItems: 1
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mrvl,pxav2-mmc
> > +      - mrvl,pxav3-mmc
> > +      - marvell,armada-380-sdhci
> > +
> > +  reg: true
> 
> Here you should have:
> 
> minItems: 1
> maxItems: 3
> 
> > +
> > +  reg-names: true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: io
> > +      - const: core
> > +
> > +  mrvl,clk-delay-cycles:
> > +    description: Specify a number of cycles to delay for tuning.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> No range of valid values?

No. The document I'm converting didn't specify a range. For some of the
hardware supported Marvell doesn't provide documentation, and the
drivers that use this seem to accept any u32 number.

If this needs a range, then I need to make something up. I can do that,
but it will be difficult to defend that number if anyone asks.

Lubo
