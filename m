Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B4A30DEE1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 16:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhBCP5V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 10:57:21 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:44424 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbhBCP4F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 10:56:05 -0500
Received: by mail-oi1-f173.google.com with SMTP id n7so296941oic.11;
        Wed, 03 Feb 2021 07:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qT9vhKEcJnv2UxHfk3LsH4oahpbnsqDoYZLdzv8tkwQ=;
        b=YCZJ1yp85PvCKJN7RAdn+4VEigPGpegOt2q/tut50IqCuAFWiO1topmTGZQ7Y8e14N
         RmJF6Bblo/B7D48QIiAG9sEfVgOB4qYTwNObAKUd9XMDrwP4Z0CfOolEkL+WD1okGXpU
         sz+biOuKuoB/1jTAqeG0HlwZp1714Ud90/Sg22EVD/TLOhRau3YrvQFGJUfjH6QY1qUQ
         EBDLPt+eweof8NpOr/gRsDK1DyjjWy/kq0NWUiehPcn/6HZPw+F7nnv4cvpvedBPGc+p
         Memp5xX+UcC/LJY/Aam5aNJgJTLKr+lmqSjjiV9WWpgT02zDk8vrjVusJ6PDI62Oct48
         iQQw==
X-Gm-Message-State: AOAM533b2I7bGEo3hw3v6/mIth82iIPKKHFI1b62M5w+kvVcFITRjxuC
        rvuRRCB0nb4iPVEFxKbbeg==
X-Google-Smtp-Source: ABdhPJxmOBQcH5R+lFiUlGBqVbuj5kwZxcJFcUI25C3II5lOgKlwz+nfG7ePzMnfdKQ5jcv5RyiyOg==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr2424431oib.66.1612367721055;
        Wed, 03 Feb 2021 07:55:21 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o14sm481868oof.38.2021.02.03.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 07:55:19 -0800 (PST)
Received: (nullmailer pid 1895243 invoked by uid 1000);
        Wed, 03 Feb 2021 15:55:17 -0000
Date:   Wed, 3 Feb 2021 09:55:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
Message-ID: <20210203155517.GC3706951@robh.at.kernel.org>
References: <20210202205544.24812-1-robh@kernel.org>
 <20210202205544.24812-3-robh@kernel.org>
 <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 03, 2021 at 09:01:23AM +0100, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> > Properties in if/then schemas weren't getting checked by the meta-schemas.
> > Enabling meta-schema checks finds several errors.
> >
> > The use of an 'items' schema (as opposed to the list form) is wrong in
> > some cases as it applies to all entries. 'contains' is the correct schema
> > to use in the case of multiple entries.
> 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > @@ -81,9 +81,8 @@ properties:
> >  if:
> >    properties:
> >      compatible:
> > -      items:
> > -        enum:
> > -          - renesas,usb2-phy-r7s9210
> > +      contains:
> > +        const: renesas,usb2-phy-r7s9210
> 
> Single entry, so "contains" not needed?

No, you are misunderstanding how these work. 'contains' means at least 
one entry in an array passes with the subschema. In this case, 
'renesas,usb2-phy-r7s9210' must appear somewhere in the 'compatible' 
values. (Before, it said *every* entry must be 
'renesas,usb2-phy-r7s9210'.) As there is a fallback compatible, we need 
'contains'.

> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > @@ -76,11 +76,10 @@ required:
> >  if:
> >    properties:
> >      compatible:
> > -      items:
> > -        enum:
> > -          - renesas,pfc-r8a73a4
> > -          - renesas,pfc-r8a7740
> > -          - renesas,pfc-sh73a0
> > +      enum:
> > +        - renesas,pfc-r8a73a4
> > +        - renesas,pfc-r8a7740
> > +        - renesas,pfc-sh73a0
> 
> Missing "contains"?

No. In this case, 'compatible' is always a single entry, so no 
'contains' needed (but would work). If compatible is one of these 3 
strings, then the 'if' is true.

The original way would actually work in this case (i.e. is valid 
json-schema), but we require 'items' to have a size (maxItems/minItems) 
in our meta-schema.

Rob
