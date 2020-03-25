Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D719322F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 21:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgCYUt6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 16:49:58 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:48412 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbgCYUt6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Mar 2020 16:49:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 707958030778;
        Wed, 25 Mar 2020 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id K_XICqRFe6dt; Wed, 25 Mar 2020 23:49:53 +0300 (MSK)
Date:   Wed, 25 Mar 2020 23:49:44 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: Replace DW I2C legacy bindings
 with YAML-based one
Message-ID: <20200325204944.cgkca7jvxtud3emk@ubsrv2.baikal.int>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132011.66A7A80307C4@mail.baikalelectronics.ru>
 <20200312214308.GA17405@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200312214308.GA17405@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 12, 2020 at 04:43:08PM -0500, Rob Herring wrote:
> On Fri, Mar 06, 2020 at 04:19:51PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Modern device tree bindings are supposed to be created as YAML-files
> > in accordance with dt-schema. This commit replaces Synopsys DW I2C
> > legacy bare text bindings with YAML file. As before the bindings file
> > states that the corresponding dts node is supposed to be compatible
> > either with generic DW I2C controller or with Microsemi Ocelot SoC I2C
> > one, to have registers, interrupts and clocks properties. In addition
> > the node may have clock-frequency, i2c-sda-hold-time-ns,
> > i2c-scl-falling-time-ns and i2c-sda-falling-time-ns optional properties.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > ---
> >  .../bindings/i2c/i2c-designware.txt           |  73 --------
> >  .../bindings/i2c/snps,designware-i2c.yaml     | 156 ++++++++++++++++++
> >  2 files changed, 156 insertions(+), 73 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> > deleted file mode 100644
> > index 08be4d3846e5..000000000000
> > --- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> > +++ /dev/null
> > @@ -1,73 +0,0 @@
> > -* Synopsys DesignWare I2C
> > -
> > -Required properties :
> > -
> > - - compatible : should be "snps,designware-i2c"
> > -                or "mscc,ocelot-i2c" with "snps,designware-i2c" for fallback
> > - - reg : Offset and length of the register set for the device
> > - - interrupts : <IRQ> where IRQ is the interrupt number.
> > - - clocks : phandles for the clocks, see the description of clock-names below.
> > -   The phandle for the "ic_clk" clock is required. The phandle for the "pclk"
> > -   clock is optional. If a single clock is specified but no clock-name, it is
> > -   the "ic_clk" clock. If both clocks are listed, the "ic_clk" must be first.
> > -
> > -Recommended properties :
> > -
> > - - clock-frequency : desired I2C bus clock frequency in Hz.
> > -
> > -Optional properties :
> > -
> > - - clock-names : Contains the names of the clocks:
> > -    "ic_clk", for the core clock used to generate the external I2C clock.
> > -    "pclk", the interface clock, required for register access.
> > -
> > - - reg : for "mscc,ocelot-i2c", a second register set to configure the SDA hold
> > -   time, named ICPU_CFG:TWI_DELAY in the datasheet.
> > -
> > - - i2c-sda-hold-time-ns : should contain the SDA hold time in nanoseconds.
> > -   This option is only supported in hardware blocks version 1.11a or newer and
> > -   on Microsemi SoCs ("mscc,ocelot-i2c" compatible).
> > -
> > - - i2c-scl-falling-time-ns : should contain the SCL falling time in nanoseconds.
> > -   This value which is by default 300ns is used to compute the tLOW period.
> > -
> > - - i2c-sda-falling-time-ns : should contain the SDA falling time in nanoseconds.
> > -   This value which is by default 300ns is used to compute the tHIGH period.
> > -
> > -Examples :
> > -
> > -	i2c@f0000 {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		compatible = "snps,designware-i2c";
> > -		reg = <0xf0000 0x1000>;
> > -		interrupts = <11>;
> > -		clock-frequency = <400000>;
> > -	};
> > -
> > -	i2c@1120000 {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		compatible = "snps,designware-i2c";
> > -		reg = <0x1120000 0x1000>;
> > -		interrupt-parent = <&ictl>;
> > -		interrupts = <12 1>;
> > -		clock-frequency = <400000>;
> > -		i2c-sda-hold-time-ns = <300>;
> > -		i2c-sda-falling-time-ns = <300>;
> > -		i2c-scl-falling-time-ns = <300>;
> > -	};
> > -
> > -	i2c@1120000 {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		reg = <0x2000 0x100>;
> > -		clock-frequency = <400000>;
> > -		clocks = <&i2cclk>;
> > -		interrupts = <0>;
> > -
> > -		eeprom@64 {
> > -			compatible = "linux,slave-24c02";
> > -			reg = <0x40000064>;
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > new file mode 100644
> > index 000000000000..3f348f1ce172
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -0,0 +1,156 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare APB I2C Device Tree Bindings
> > +
> > +maintainers:
> > +  - Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: mscc,ocelot-i2c
> > +then:
> > +  properties:
> > +    reg:
> > +      minItems: 1
> > +      items:
> > +        - description: DW APB I2C controller memory mapped registers.
> > +        - description: ICPU_CFG:TWI_DELAY registers to setup the SDA hold time.
> 
> This won't work (it would be good to have an example that exercises 
> this). You need to move this definition to the main 'reg' definition 
> below and then do:
> 
> if:
>   properties:
>     compatible:
>       not:
>         contains:
>           const: mscc,ocelot-i2c
> then:
>   properties:
>     reg:
>       maxItems: 1
> 

Hm, I thought I tested this. Apparently I didn't do this well. Thanks for
pointing me out to this problem. I'll add the mscc,ocelot-i2c node to the examples
list to cover the optional two-regs case as well.

> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: Generic Synopsys DesignWare I2C controller.
> > +        const: snps,designware-i2c
> > +      - description: Microsemi Ocelot SoCs I2C controller.
> > +        items:
> > +          - const: mscc,ocelot-i2c
> > +          - const: snps,designware-i2c
> > +
> > +  reg:
> > +    items:
> > +      - description: DW APB I2C controller memory mapped registers.
> > +
> > +  "#address-cells": true
> > +
> > +  "#size-cells": true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: I2C controller reference clock source.
> > +      - description: APB interface clock source.
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: ref
> > +      - const: pclk
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  clock-frequency:
> > +    description: Desired I2C bus clock frequency in Hz.
> > +    enum: [100000, 400000, 1000000, 3400000]
> > +    default: 400000
> > +
> > +  i2c-sda-hold-time-ns:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Anything with a unit suffix has a type, so you can drop this.
> 

Yes, but this and the following time-related properties are supposed to be
single numbers (see ./drivers/i2c/i2c-core-base.c for details), while "^.*-ns$"
is defined as uint32-array. So if I removed this $ref, I would have to add a
constraint like:

+ maxItems: 1
+ items:
+   maxItems: 1

which isn't that obvious, than just explicit uint32-type setting.

> > +    description: |
> > +      The property should contain the SDA hold time in nanoseconds. This option
> > +      is only supported in hardware blocks version 1.11a or newer or on
> > +      Microsemi SoCs.
> > +
> > +  i2c-scl-falling-time-ns:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The property should contain the SCL falling time in nanoseconds.
> > +      This value is used to compute the tLOW period.
> > +    default: 300
> > +
> > +  i2c-sda-falling-time-ns:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The property should contain the SDA falling time in nanoseconds.
> > +      This value is used to compute the tHIGH period.
> > +    default: 300
> > +
> > +  dmas:
> > +    items:
> > +      - description: TX DMA Channel.
> > +      - description: RX DMA Channel.
> > +
> > +  dma-names:
> > +    items:
> > +      - const: tx
> > +      - const: rx
> > +
> 
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> 
> No need for this as i2c-controller.yaml does this.
> 

Agreed.

> > +
> > +additionalProperties: false
> 
> This doesn't work with i2c-controller.yaml. Change it to 
> 'unevaluatedProperties: false' and eventually that will do what we need.
> 

Yeah, I tried the "unevaluatedProperties: false" setting and discovered that
it didn't work. That's why I defined all the possible properties in this
DT schema with at least boolean type including the sub-node
pattern-based properties and set the "additionalProperties:
false", so unknown properties would cause the dt_binding_check error.

Since you are saying that unevaluatedProperties: is not implemented,
but it will be in future, and it's ok that currently we may have some
unevaluated properties left declared, then I'll do as you say:
remove all dummy boolean properties and replace "additionalProperties"
property with "unevaluatedProperties" one.

Regards,
-Sergey

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - interrupts
> > +
> > +examples:
> > +  - |
> > +    i2c@f0000 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      compatible = "snps,designware-i2c";
> > +      reg = <0xf0000 0x1000>;
> > +      interrupts = <11>;
> > +      clock-frequency = <400000>;
> > +    };
> > +
> > +  - |
> > +    i2c@1120000 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      compatible = "snps,designware-i2c";
> > +      reg = <0x1120000 0x1000>;
> > +      interrupt-parent = <&ictl>;
> > +      interrupts = <12 1>;
> > +      clock-frequency = <400000>;
> > +      i2c-sda-hold-time-ns = <300>;
> > +      i2c-sda-falling-time-ns = <300>;
> > +      i2c-scl-falling-time-ns = <300>;
> > +    };
> > +
> > +  - |
> > +    i2c@1120000 {
> > +      compatible = "snps,designware-i2c";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      reg = <0x2000 0x100>;
> > +      clock-frequency = <400000>;
> > +      clocks = <&i2cclk>;
> > +      interrupts = <0>;
> > +
> > +      eeprom@64 {
> > +        compatible = "linux,slave-24c02";
> > +        reg = <0x40000064>;
> > +      };
> > +    };
> > +...
> > -- 
> > 2.25.1
> > 
