Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE6830DF11
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 17:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbhBCQDu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 11:03:50 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:39433 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234663AbhBCQDq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 11:03:46 -0500
Received: by mail-oi1-f181.google.com with SMTP id w124so360511oia.6;
        Wed, 03 Feb 2021 08:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BcE4ZZBKyxCDLDrYAu9i4Md6o808j4TR1LnI5e2y0b0=;
        b=Pv7EAV7LVXNefmZvDYuPMaW5uicPXU42jzlHeMVKRwzMO63RVnIiZNLQx50SxEU+ZJ
         vifcOCdikr5tM0dQkk/RGNzswHEVG8QQSiqdXTYxzY85N65whK5Acgg0laP45SlWZLWr
         h0cYumMKRubU/P9ePZMtkMnWXW7v7YxFXHww9b6RtQ38xV+id/DWREtYc7kO1qBn6hlB
         seVeYsLWcU4/48IJrqv5Qoy3QhSvzTKABDoMhTIbQCkOSxFuXcbow/1AoRXWSGMSxxIp
         crEStqfAv1RpzdZsBtc8JSR2rTyIAIUMl238SUm0hg+iEg9VvJaz7aSaGLhfC/4g3dL8
         Zbqw==
X-Gm-Message-State: AOAM5325KjcvwGCDjCafnMrhv8vJpeMfqZetUw6yRa+sLP1iuU4GIlmm
        bnFLi/xg5HymGxzuewxGyfG4zYOKZVfjU6KkE4k=
X-Google-Smtp-Source: ABdhPJy5RnEli5EScDsGGPC/30HmbHWChMG7KZn1WeCaaLseFVr6EQuBii7Iq7M5O8vzqs7BmEy6ag0EovkF5KtgUsQ=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2343251oiy.148.1612368184741;
 Wed, 03 Feb 2021 08:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org> <20210202205544.24812-3-robh@kernel.org>
 <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com> <20210203155517.GC3706951@robh.at.kernel.org>
In-Reply-To: <20210203155517.GC3706951@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Feb 2021 17:02:53 +0100
Message-ID: <CAMuHMdVp-YXtMBPistV0XPDHoSbW6Rz4c7=t3y2JB7B56LniBg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
To:     Rob Herring <robh@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Wed, Feb 3, 2021 at 4:55 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Feb 03, 2021 at 09:01:23AM +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> > > Properties in if/then schemas weren't getting checked by the meta-schemas.
> > > Enabling meta-schema checks finds several errors.
> > >
> > > The use of an 'items' schema (as opposed to the list form) is wrong in
> > > some cases as it applies to all entries. 'contains' is the correct schema
> > > to use in the case of multiple entries.
> >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > @@ -81,9 +81,8 @@ properties:
> > >  if:
> > >    properties:
> > >      compatible:
> > > -      items:
> > > -        enum:
> > > -          - renesas,usb2-phy-r7s9210
> > > +      contains:
> > > +        const: renesas,usb2-phy-r7s9210
> >
> > Single entry, so "contains" not needed?
>
> No, you are misunderstanding how these work. 'contains' means at least
> one entry in an array passes with the subschema. In this case,
> 'renesas,usb2-phy-r7s9210' must appear somewhere in the 'compatible'
> values. (Before, it said *every* entry must be
> 'renesas,usb2-phy-r7s9210'.) As there is a fallback compatible, we need
> 'contains'.
>
> > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> > > @@ -76,11 +76,10 @@ required:
> > >  if:
> > >    properties:
> > >      compatible:
> > > -      items:
> > > -        enum:
> > > -          - renesas,pfc-r8a73a4
> > > -          - renesas,pfc-r8a7740
> > > -          - renesas,pfc-sh73a0
> > > +      enum:
> > > +        - renesas,pfc-r8a73a4
> > > +        - renesas,pfc-r8a7740
> > > +        - renesas,pfc-sh73a0
> >
> > Missing "contains"?
>
> No. In this case, 'compatible' is always a single entry, so no
> 'contains' needed (but would work). If compatible is one of these 3
> strings, then the 'if' is true.
>
> The original way would actually work in this case (i.e. is valid
> json-schema), but we require 'items' to have a size (maxItems/minItems)
> in our meta-schema.

Thanks for the explanation!
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
