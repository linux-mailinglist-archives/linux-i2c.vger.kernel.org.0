Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B884435B4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 19:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbhKBSkF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 14:40:05 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:44909 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbhKBSj5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Nov 2021 14:39:57 -0400
Received: by mail-ot1-f49.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so118859otj.11;
        Tue, 02 Nov 2021 11:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2A2UDvJi9kp6H/LtkNAZQfbLqAmYaqz9ZqP/gIursqU=;
        b=3FPtUaPS+WNkNwgLguUPpcvHf8JVTiUdljt3bzF6jDsUwY7xoNNZu3MKECUB8bTJ9x
         ttEE4R0ESRTVpmFhBBh+pVUYIcNOa+PppHcOuvm6xSuazrjhmOJHLMKsbzb4EpedQxai
         Zy9V7k9CzxzcdIZwUY32Bgv+wCZJBY3eXNTOrfhvttL/OyRKJNjCGJkJo1KuDZ1gaM+a
         7iEuse4h9dpa8W7mspgB8hl0LV/Sy9/re5NQ5t6+ZBgmPn+TPdNncmtxeUYDOK1E63Ej
         QkfQiNSGXdCA38BSJ2tmgS86jt5IVHQACk7qScWaW/+Z2SS67S25rI9G72ZBoDRS+E7+
         b0vQ==
X-Gm-Message-State: AOAM5304g1QgGD2z3a9k5b3NV4qjgwc3QmvFLO+qp3vhrGGlEB2Jn08r
        tZYjdYK87io7CU9nTlR/voA3aMWg9g==
X-Google-Smtp-Source: ABdhPJz3B5TEDANfU82YOIztONed4+CortgJTLLEow4f7R/qN+5SQ6YWQ17cqlhWs70Ahg+xbE1PUA==
X-Received: by 2002:a9d:774c:: with SMTP id t12mr21559726otl.282.1635878242175;
        Tue, 02 Nov 2021 11:37:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bm5sm4404968oib.16.2021.11.02.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 11:37:21 -0700 (PDT)
Received: (nullmailer pid 3233546 invoked by uid 1000);
        Tue, 02 Nov 2021 18:37:20 -0000
Date:   Tue, 2 Nov 2021 13:37:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
Message-ID: <YYGFYLtehnDOgA9d@robh.at.kernel.org>
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
 <20211101122545.3417624-2-horatiu.vultur@microchip.com>
 <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
 <20211101213201.wdjsuexuuinepu3m@soft-dev3-1.localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101213201.wdjsuexuuinepu3m@soft-dev3-1.localhost>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 01, 2021 at 10:32:01PM +0100, Horatiu Vultur wrote:
> The 11/01/2021 15:32, Peter Rosin wrote:
> 
> Hi Peter,
> 
> > 
> > On 2021-11-01 13:25, Horatiu Vultur wrote:
> > > Some HW requires some time for the signals to settle after the muxing is
> > > changed. Allow this time to be specified in device tree.
> > >
> > > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > > ---
> > >  Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > > index 24cac36037f5..4628ff6340c1 100644
> > > --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> > > @@ -29,6 +29,12 @@ properties:
> > >    '#size-cells':
> > >      const: 0
> > >
> > > +  settle-time-us:
> > > +    default: 0
> > > +    description:
> > > +      The time required for the signals to settle. Currently only the
> > > +      i2c-mux-gpmux driver supports this optional binding.
> > 
> > The information about how i2c-mux-gpmux is special is bound to go stale,
> > and I don't think we should mention such specific details in the binding.
> > What I meant was a generic warnings about optional bindings perhaps not
> > being supported by all drivers, along the lines of this from i2c.txt:
> > 
> > "These properties may not be supported by all drivers. However, if a driver
> >  wants to support one of the below features, it should adapt these bindings."
> > 
> > However, I now notice that this sentence makes no sense. It looks like it
> > should be s/adapt/adopt/.
> > 
> > And, in the i2c-mux.yaml case it can simply say "Optional properties"
> > instead of "These properites" (which refers to a subset of properties
> > immediately below the text) since with a yaml binding it is always
> > clear which properties are optional and which are required. Lastly, I
> > guess this warning belongs in the description.
> > 
> > > +
> > >  patternProperties:
> > >    '^i2c@[0-9a-f]+$':
> > >      $ref: /schemas/i2c/i2c-controller.yaml
> > >
> > 
> > Since this is the first optional property, you now need to specify what
> > properties are required, which is everything but settle-time-us. If you
> > don't, all properties are required. Which is not what we want...
> > 
> > Something like this should do it, I think:
> > 
> > required:
> >   - compatible
> >   - '#address-cells'
> >   - '#size-cells'
> 
> Thanks for a detail explanation but I am still struggling with these
> bindings. Were you thinking to have something like this?
> 
> ---
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> index 24cac36037f5..c9fde1bb0fea 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> @@ -19,6 +19,9 @@ description: |+
>    populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
>    subnodes of this will be considered as i2c child busses.
> 
> +  Optional properties may not be supported by all drivers. However, if a driver
> +  wants to support one of the below features, it should adopt these bindings.
> +
>  properties:
>    $nodename:
>      pattern: '^(i2c-?)?mux'
> @@ -29,6 +32,11 @@ properties:
>    '#size-cells':
>      const: 0
> 
> +  settle-time-us:
> +    default: 0
> +    description:
> +      The time required for the signals to settle.
> +
>  patternProperties:
>    '^i2c@[0-9a-f]+$':
>      $ref: /schemas/i2c/i2c-controller.yaml
> @@ -41,6 +49,11 @@ patternProperties:
> 
>  additionalProperties: true
> 
> +required:
> +  - compatible

compatible should not be required here.

> +  - '#address-cells'
> +  - '#size-cells'
> +
>  examples:
>    - |
>      /*
> ---
> 
> If I have this then my problem is with the required properties because then I
> start to get new warnings once I run:
> 
> make ARCH=arm CROSS_COMPILE=arm-linux- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> 
> For example, one of new the warnings is this:
> 
> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: 'compatible' is a required property
> 	From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#address-cells' is a required property
> 	From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#size-cells' is a required property
> 	From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml

This is because of the $nodename pattern being pretty lax and matches 
on mux-mii-hog by mistake. We have 2 options. Change the nodename 
pattern to '^(i2c-?)?mux(@.*)?$' or add 'select: false'. The former 
would still match on 'mux' or 'mux@.*' which might still have problems. 
For the latter, we just need to make sure all the i2c-mux schemas have a 
$ref to this schema. Also, with that change we'd stop checking 'i2c-mux' 
nodes that don't yet have a specific schema. That said, I do lean toward 
the latter option.

Rob
