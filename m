Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D1044386F
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 23:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhKBW3J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 18:29:09 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:53462 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhKBW3H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 18:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635891992; x=1667427992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FpZTv+Z+2lWKcOts96nJlKZCg2JsGS0+rRKM65iulVM=;
  b=VdmgN+BbuSfgTTwHsoZ+HLsUqpt96NkCblJ64e+YfEv2ojdAz1slbLlE
   JQlakautbVqMilG6WHm1RIROnEAl/3ZBJ7iMmNDc1gUC3DUnMDK0LoHpU
   c7yN5Z/BORqqtMkl1QuiqxzECshz/OcokeljJlf/FJ7HjQ45fQUW5JFZG
   dZGthzLv+DggYGe2CFUeYmPh3EuZImlcGzm1iwqSL7fbnryLhpVJQ72V+
   bIVo00cZm/IqpJQdnip5DGlCJV2avMkuQbvSZyrz2PblB7+XWlasZ4+LM
   LCVgi7V0nQqhpJ6wrHLbVCi2j/6nbFOUrRhTMioBT4myunkAdmYqU3Ow9
   w==;
IronPort-SDR: 90pESWtmXU12Vwip6F1YE6osK1PcbC1fP10AN/IT5owFxkAgaujgLtNzgmuMkNxnMnnZdUWiCj
 Zc0YJLqgahIQdO4pfOqo0Z0+eXCQPx3x50BYXVDBeSYKUXC70i/m53QRHszDzh/NuIhDk6e8m5
 X05/rEclNiIPwqqqu7L1GIDxaEZhTuhW57nkP0Fnao+oMd1SkKda7xBuLAKxKC5hTi8RJQ3ghN
 hd5A9O/hrZf4nD8khqYUy0wYkb9tHTN7mgoITawZ+N8v78w+HOvGAEJPFHFhgBy9Qsz+H3OAYa
 eXMClHpPg164nyuAtbFRuoHp
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="135257817"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Nov 2021 15:26:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 2 Nov 2021 15:26:11 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 2 Nov 2021 15:26:11 -0700
Date:   Tue, 2 Nov 2021 23:27:57 +0100
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Rob Herring <robh@kernel.org>
CC:     Peter Rosin <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
Message-ID: <20211102222757.ny4c7gdnyxm3gorw@soft-dev3-1.localhost>
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
 <20211101122545.3417624-2-horatiu.vultur@microchip.com>
 <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
 <20211101213201.wdjsuexuuinepu3m@soft-dev3-1.localhost>
 <YYGFYLtehnDOgA9d@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YYGFYLtehnDOgA9d@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 11/02/2021 13:37, Rob Herring wrote:

Hi Rob,

> 
> On Mon, Nov 01, 2021 at 10:32:01PM +0100, Horatiu Vultur wrote:
> > The 11/01/2021 15:32, Peter Rosin wrote:
> >
> > Hi Peter,
> >
> > >
> > > On 2021-11-01 13:25, Horatiu Vultur wrote:
> > > > Some HW requires some time for the signals to settle after the muxing is
> > > > changed. Allow this time to be specified in device tree.
> > > >
> > > > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > > > index 24cac36037f5..4628ff6340c1 100644
> > > > --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > > > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > > > @@ -29,6 +29,12 @@ properties:
> > > >    '#size-cells':
> > > >      const: 0
> > > >
> > > > +  settle-time-us:
> > > > +    default: 0
> > > > +    description:
> > > > +      The time required for the signals to settle. Currently only the
> > > > +      i2c-mux-gpmux driver supports this optional binding.
> > >
> > > The information about how i2c-mux-gpmux is special is bound to go stale,
> > > and I don't think we should mention such specific details in the binding.
> > > What I meant was a generic warnings about optional bindings perhaps not
> > > being supported by all drivers, along the lines of this from i2c.txt:
> > >
> > > "These properties may not be supported by all drivers. However, if a driver
> > >  wants to support one of the below features, it should adapt these bindings."
> > >
> > > However, I now notice that this sentence makes no sense. It looks like it
> > > should be s/adapt/adopt/.
> > >
> > > And, in the i2c-mux.yaml case it can simply say "Optional properties"
> > > instead of "These properites" (which refers to a subset of properties
> > > immediately below the text) since with a yaml binding it is always
> > > clear which properties are optional and which are required. Lastly, I
> > > guess this warning belongs in the description.
> > >
> > > > +
> > > >  patternProperties:
> > > >    '^i2c@[0-9a-f]+$':
> > > >      $ref: /schemas/i2c/i2c-controller.yaml
> > > >
> > >
> > > Since this is the first optional property, you now need to specify what
> > > properties are required, which is everything but settle-time-us. If you
> > > don't, all properties are required. Which is not what we want...
> > >
> > > Something like this should do it, I think:
> > >
> > > required:
> > >   - compatible
> > >   - '#address-cells'
> > >   - '#size-cells'
> >
> > Thanks for a detail explanation but I am still struggling with these
> > bindings. Were you thinking to have something like this?
> >
> > ---
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > index 24cac36037f5..c9fde1bb0fea 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > @@ -19,6 +19,9 @@ description: |+
> >    populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
> >    subnodes of this will be considered as i2c child busses.
> >
> > +  Optional properties may not be supported by all drivers. However, if a driver
> > +  wants to support one of the below features, it should adopt these bindings.
> > +
> >  properties:
> >    $nodename:
> >      pattern: '^(i2c-?)?mux'
> > @@ -29,6 +32,11 @@ properties:
> >    '#size-cells':
> >      const: 0
> >
> > +  settle-time-us:
> > +    default: 0
> > +    description:
> > +      The time required for the signals to settle.
> > +
> >  patternProperties:
> >    '^i2c@[0-9a-f]+$':
> >      $ref: /schemas/i2c/i2c-controller.yaml
> > @@ -41,6 +49,11 @@ patternProperties:
> >
> >  additionalProperties: true
> >
> > +required:
> > +  - compatible
> 
> compatible should not be required here.
> 
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> >  examples:
> >    - |
> >      /*
> > ---
> >
> > If I have this then my problem is with the required properties because then I
> > start to get new warnings once I run:
> >
> > make ARCH=arm CROSS_COMPILE=arm-linux- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> >
> > For example, one of new the warnings is this:
> >
> > /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: 'compatible' is a required property
> >       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#address-cells' is a required property
> >       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#size-cells' is a required property
> >       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> 
> This is because of the $nodename pattern being pretty lax and matches
> on mux-mii-hog by mistake. We have 2 options. Change the nodename
> pattern to '^(i2c-?)?mux(@.*)?$' or add 'select: false'. The former
> would still match on 'mux' or 'mux@.*' which might still have problems.
> For the latter, we just need to make sure all the i2c-mux schemas have a
> $ref to this schema. Also, with that change we'd stop checking 'i2c-mux'
> nodes that don't yet have a specific schema. That said, I do lean toward
> the latter option.

From what I can see there are only two i2c-mux schemas and both of them
have a $ref to this schema [1][2]

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml#L33
[2] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml#L16

> 
> Rob

-- 
/Horatiu
