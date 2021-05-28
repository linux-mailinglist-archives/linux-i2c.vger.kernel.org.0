Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36881393B22
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 03:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbhE1Bp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 21:45:59 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:65188 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhE1Bp7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 21:45:59 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14S1VC2k002352;
        Fri, 28 May 2021 09:31:12 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 09:44:18 +0800
Date:   Fri, 28 May 2021 09:44:17 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Brendan Higgins" <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
        Troy Lee <troy_lee@aspeedtech.com>,
        Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: aspeed-i2c: Convert txt to yaml
 format
Message-ID: <20210528014416.GA3195@aspeedtech.com>
References: <20210527102512.20684-1-jamin_lin@aspeedtech.com>
 <20210527102512.20684-2-jamin_lin@aspeedtech.com>
 <f7df6bb6-762d-4250-a4bc-076cbfc441eb@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <f7df6bb6-762d-4250-a4bc-076cbfc441eb@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14S1VC2k002352
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 05/27/2021 23:20, Andrew Jeffery wrote:
> 
> 
> On Thu, 27 May 2021, at 19:55, Jamin Lin wrote:
> > Convert aspeed i2c to yaml.
> > 
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 86 +++++++++++++++++++
> >  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 -----------
> >  2 files changed, 86 insertions(+), 49 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml 
> > b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > new file mode 100644
> > index 000000000000..1f7064d77708
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device 
> > Tree Bindings
> > +
> > +maintainers:
> > +  - Rayn Chen <rayn_chen@aspeedtech.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2400-i2c-bus
> > +      - aspeed,ast2500-i2c-bus
> > +      - aspeed,ast2600-i2c-bus
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - description: address offset and range of bus
> > +      - description: address offset and range of bus buffer
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: interrupt number
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      root clock of bus, should reference the APB
> > +      clock in the second cell
> > +
> > +  reset:
> > +    maxItems: 1
> > +    description: phandle to reset controller with the reset number in
> > +      the second cell
> > +
> > +  bus-frequency:
> > +    minimum: 500
> > +    maximum: 4000000
> > +    default: 100000
> > +    description: frequency of the bus clock in Hz defaults to 100 kHz 
> > when not
> > +      specified
> > +
> > +  multi-master:
> > +    type: boolean
> > +    description:
> > +      states that there is another master active on this bus
> > +
> > +required:
> > +  - reg
> > +  - compatible
> > +  - clocks
> > +  - resets
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/aspeed-clock.h>
> > +    i2c0: i2c-bus@40 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      #interrupt-cells = <1>;
> > +      reg = <0x40 0x40>;
> > +      compatible = "aspeed,ast2500-i2c-bus";
> > +      clocks = <&syscon ASPEED_CLK_APB>;
> > +      resets = <&syscon ASPEED_RESET_I2C>;
> > +      bus-frequency = <100000>;
> > +      interrupts = <0>;
> > +      interrupt-parent = <&i2c_ic>;
> > +      status = "disabled";
> > +      /* Does not need pinctrl properties */
> 
> Note this actually isn't right and someone (me?) needs to send a patch 
> to fix the devicetree(s) - the I2C mux properties for bus 0 and 1 just 
> don't have a group, and so SCL and SDA need to be muxed individually.
> 
> I expect we wound up with this comment by a lack of a match for an 
> erroneous grep.
> 
> Andrew
Understand. Can I change the example as the following or can you give me
any suggestion?

i2c0: i2c-bus@40 {
  #address-cells = <1>;
  #size-cells = <0>;
  #interrupt-cells = <1>;
  reg = <0x40 0x40>;
  compatible = "aspeed,ast2500-i2c-bus";
  clocks = <&syscon ASPEED_CLK_APB>;
  resets = <&syscon ASPEED_RESET_I2C>;
  bus-frequency = <100000>;
  interrupts = <0>;
  interrupt-parent = <&i2c_ic>;

Thanks-Jamin
