Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C014D1D6C37
	for <lists+linux-i2c@lfdr.de>; Sun, 17 May 2020 21:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgEQTVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 May 2020 15:21:16 -0400
Received: from v6.sk ([167.172.42.174]:56896 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgEQTVQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 May 2020 15:21:16 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 6ACDC610A8;
        Sun, 17 May 2020 19:21:12 +0000 (UTC)
Date:   Sun, 17 May 2020 21:21:10 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh@kernel.org>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 24/28] dt-bindings: media: Convert marvell,mmp2-ccic to
 json-schema
Message-ID: <20200517192110.GD1695525@furthur.local>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-25-lkundrak@v3.sk>
 <20200327194637.GA18803@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327194637.GA18803@bogus>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 27, 2020 at 01:46:37PM -0600, Rob Herring wrote:
> On Tue, Mar 17, 2020 at 10:39:18AM +0100, Lubomir Rintel wrote:
> > Convert the marvell,mmp2-ccic binding to DT schema format using
> > json-schema.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > ---
> >  .../bindings/media/marvell,mmp2-ccic.txt      |  50 ---------
> >  .../bindings/media/marvell,mmp2-ccic.yaml     | 102 ++++++++++++++++++
> >  2 files changed, 102 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> > deleted file mode 100644
> > index 7ec2c8c8a3b98..0000000000000
> > --- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -Marvell MMP2 camera host interface
> > -
> > -Required properties:
> > - - compatible: Should be "marvell,mmp2-ccic".
> > - - reg: Register base and size.
> > - - interrupts: The interrupt number.
> > - - #clock-cells: Must be 0.
> > -
> > -Optional properties:
> > - - clocks: Reference to the input clock as specified by
> > -           Documentation/devicetree/bindings/clock/clock-bindings.txt.
> > - - clock-names: Names of the clocks used; "axi" for the AXI bus interface,
> > -                "func" for the peripheral clock and "phy" for the parallel
> > -                video bus interface.
> > - - clock-output-names: Optional clock source for sensors. Shall be "mclk".
> > -
> > -Required subnodes:
> > - - port: The parallel bus interface port with a single endpoint linked to
> > -         the sensor's endpoint as described in
> > -         Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Required endpoint properties:
> > - - bus-type: data bus type, <5> or <6> for Parallel or Bt.656 respectively
> > - - pclk-sample: pixel clock polarity
> > - - hsync-active: horizontal synchronization polarity (only required for
> > -   parallel bus)
> > - - vsync-active: vertical synchronization polarity (only required for
> > -   parallel bus)
> > -
> > -Example:
> > -
> > -	camera0: camera@d420a000 {
> > -		compatible = "marvell,mmp2-ccic";
> > -		reg = <0xd420a000 0x800>;
> > -		interrupts = <42>;
> > -		clocks = <&soc_clocks MMP2_CLK_CCIC0>;
> > -		clock-names = "axi";
> > -		#clock-cells = <0>;
> > -		clock-output-names = "mclk";
> > -
> > -		port {
> > -			camera0_0: endpoint {
> > -				remote-endpoint = <&ov7670_0>;
> > -                                bus-type = <5>;      /* Parallel */
> > -                                hsync-active = <1>;  /* Active high */
> > -                                vsync-active = <1>;  /* Active high */
> > -                                pclk-sample = <0>;   /* Falling */
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > new file mode 100644
> > index 0000000000000..890a3f9d0302f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> 
> GPL-2.0-only please. Dual license only if you have rights on the old 
> file to do so.

I do. I wrote the original binding file.

> > +# Copyright 2019,2020 Lubomir Rintel <lkundrak@v3.sk>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/marvell,mmp2-ccic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell MMP2 camera host interface bindings
> > +
> > +maintainers:
> > +  - Lubomir Rintel <lkundrak@v3.sk>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^camera@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    const: marvell,mmp2-ccic
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +       endpoint:
> 
> Wrong indentaion.
> 
> > +         type: object
> > +         additionalProperties: false
> > +
> > +         # Properties described in
> > +         # Documentation/devicetree/bindings/media/video-interfaces.txt
> > +         properties:
> > +           remote-endpoint: true
> > +           hsync-active: true
> > +           vsync-active: true
> > +           pclk-sample: true
> > +           bus-type: true
> > +
> > +         required:
> > +           - remote-endpoint
> > +
> > +    required:
> > +      - endpoint
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> 
> Shouldn't really be variable for a single compatible.
> 
> > +    items:
> > +      - description: AXI bus interface clock
> > +      - description: Peripheral clock
> > +      - description: Parallel video bus interface clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +    items:
> > +      - const: axi
> > +      - const: func
> > +      - const: phy
> > +
> > +  '#clock-cells':
> > +    const: 0
> > +
> > +  clock-output-names:
> > +    const: mclk
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - port
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/marvell,mmp2.h>
> > +
> > +    camera@d420a000 {
> > +      compatible = "marvell,mmp2-ccic";
> > +      reg = <0xd420a000 0x800>;
> > +      interrupts = <42>;
> > +      clocks = <&soc_clocks MMP2_CLK_CCIC0>;
> > +      clock-names = "axi";
> > +      #clock-cells = <0>;
> > +      clock-output-names = "mclk";
> > +
> > +      port {
> > +        camera0_0: endpoint {
> > +          remote-endpoint = <&ov7670_0>;
> > +          bus-type = <5>;      /* Parallel */
> > +          hsync-active = <1>;  /* Active high */
> > +          vsync-active = <1>;  /* Active high */
> > +          pclk-sample = <0>;   /* Falling */
> > +        };
> > +      };
> > +    };
> > +
> > +...
> > -- 
> > 2.25.1
> > 
