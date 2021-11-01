Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851FE4422AC
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 22:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKAVcv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 17:32:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:56207 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhKAVcv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 17:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635802217; x=1667338217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5hozMIsxI0YgyDEuwq/Ed15D9k+1DGG1GFvVzOI6EyM=;
  b=Kz5Zdq4VJ4XdhmH8vxMX+jFGPFuQ2VVcuuKiBj3KDXSnrB+I3DIEkkxG
   T0coWdS/rCIJZBCiYnV6QPiIaTGjA4KekZCpap8WMH6y1awiBrffYeHgL
   yvVVGZ9M/BYF50+kEs6rI3T/jE5UZ7EiFm2JJMwWIOVnNZsG1SBzdedJG
   fwh3eBzAcHIAh9xT46FZmVp8RgiNyPaR0jNd/1yGrqvxP7KcuuT05WxpO
   f84IxAWrSfxnrKHLBHLhFuA1sz0lkaFSCnA2UKNXfuprmsrrKdXcly8YG
   nBIH7sk9noCJI9aaKYyNeRRqBnh0CR+hKiFRULQOZ+E/vsEoZGvMLIsY9
   Q==;
IronPort-SDR: aYbaYa9p8/atwnOQFIMlVGMtm35GpIOSsjzUWMSIlAWo6XVKDMmHhx3arw+e4Vv0ArTlO8qR31
 etCGbENT/P1vydZyLRcLy3OcQN83U+/+Rz1Wruc3VJdWuIHVAgUGB23rtf0hezhQQ+8Rfdm9dk
 sA3GuuyO4ddyUdcPPAjryHLXRHVuchNltxk6gZrCO9bbCqVXzut0roN76D+ZtWiUuCTmY3N6I8
 6g0p6OzLjfzlM85Q0BMS4du/A+SM5iGkGJd4GAOouuGrC6goO7bJutxlSXCvabFI1cFrYnxn2S
 B0JS2MTVbIRgMgldrnss0JJz
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; 
   d="scan'208";a="142437898"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 14:30:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 14:30:16 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 1 Nov 2021 14:30:16 -0700
Date:   Mon, 1 Nov 2021 22:32:01 +0100
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Peter Rosin <peda@axentia.se>
CC:     <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
Message-ID: <20211101213201.wdjsuexuuinepu3m@soft-dev3-1.localhost>
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
 <20211101122545.3417624-2-horatiu.vultur@microchip.com>
 <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 11/01/2021 15:32, Peter Rosin wrote:

Hi Peter,

> 
> On 2021-11-01 13:25, Horatiu Vultur wrote:
> > Some HW requires some time for the signals to settle after the muxing is
> > changed. Allow this time to be specified in device tree.
> >
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > index 24cac36037f5..4628ff6340c1 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > @@ -29,6 +29,12 @@ properties:
> >    '#size-cells':
> >      const: 0
> >
> > +  settle-time-us:
> > +    default: 0
> > +    description:
> > +      The time required for the signals to settle. Currently only the
> > +      i2c-mux-gpmux driver supports this optional binding.
> 
> The information about how i2c-mux-gpmux is special is bound to go stale,
> and I don't think we should mention such specific details in the binding.
> What I meant was a generic warnings about optional bindings perhaps not
> being supported by all drivers, along the lines of this from i2c.txt:
> 
> "These properties may not be supported by all drivers. However, if a driver
>  wants to support one of the below features, it should adapt these bindings."
> 
> However, I now notice that this sentence makes no sense. It looks like it
> should be s/adapt/adopt/.
> 
> And, in the i2c-mux.yaml case it can simply say "Optional properties"
> instead of "These properites" (which refers to a subset of properties
> immediately below the text) since with a yaml binding it is always
> clear which properties are optional and which are required. Lastly, I
> guess this warning belongs in the description.
> 
> > +
> >  patternProperties:
> >    '^i2c@[0-9a-f]+$':
> >      $ref: /schemas/i2c/i2c-controller.yaml
> >
> 
> Since this is the first optional property, you now need to specify what
> properties are required, which is everything but settle-time-us. If you
> don't, all properties are required. Which is not what we want...
> 
> Something like this should do it, I think:
> 
> required:
>   - compatible
>   - '#address-cells'
>   - '#size-cells'

Thanks for a detail explanation but I am still struggling with these
bindings. Were you thinking to have something like this?

---
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
index 24cac36037f5..c9fde1bb0fea 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
@@ -19,6 +19,9 @@ description: |+
   populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
   subnodes of this will be considered as i2c child busses.

+  Optional properties may not be supported by all drivers. However, if a driver
+  wants to support one of the below features, it should adopt these bindings.
+
 properties:
   $nodename:
     pattern: '^(i2c-?)?mux'
@@ -29,6 +32,11 @@ properties:
   '#size-cells':
     const: 0

+  settle-time-us:
+    default: 0
+    description:
+      The time required for the signals to settle.
+
 patternProperties:
   '^i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/i2c-controller.yaml
@@ -41,6 +49,11 @@ patternProperties:

 additionalProperties: true

+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+
 examples:
   - |
     /*
---

If I have this then my problem is with the required properties because then I
start to get new warnings once I run:

make ARCH=arm CROSS_COMPILE=arm-linux- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux.yaml

For example, one of new the warnings is this:

/home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: 'compatible' is a required property
	From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
/home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#address-cells' is a required property
	From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
/home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#size-cells' is a required property
	From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml

If I don't have the required properties then I don't see these new warnings.

Does it mean that actually the properties are optional by default?

> 
> Cheers,
> Peter

-- 
/Horatiu
