Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DDD444325
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 15:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbhKCOQP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 10:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:37572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231393AbhKCOQO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 10:16:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3EF5604DA;
        Wed,  3 Nov 2021 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635948818;
        bh=JtiUVBkjhkrls5IZYmkhfWzLdJrUAOtNRhSf6a+L2uY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jnXNmfzhYfAKsZAcftXkjCDLysLiYVP94rm9qOZsC3rAXfU9677BZ77IXB9aF7HBs
         uJ7gSn6Q+UEJ5+kTy6Wr5pajsTYbfaqcVoWYp9leD7UomUNAkhF7MaGGRH+eH16aOw
         So5uWWKU25QvvYCmNcPYKwjkPXzSu8kwxJidCMJ2QeqZaR4JukQgFnkmhtBg8oVjLI
         kG1CENxOfAkfFTn/N+axwUMknQ73g6qDVU/KNhHtCo//+/21fQatsODxIw2TmUQK3r
         9xXSv7mNKVv8hFeHZwkQImgClvcvg96ZFZGQivGGAuJNq3pJcWKhbkc/77fGazdnxV
         KxobObcTAi6GQ==
Received: by mail-ed1-f46.google.com with SMTP id f4so9652450edx.12;
        Wed, 03 Nov 2021 07:13:37 -0700 (PDT)
X-Gm-Message-State: AOAM531LGoX/6VtWU6ajwspRstwJMHVy3dDuf573BMwbxaqRCdAQe21Y
        wE8LwFafMaSPkK5tuMVUP0rYEnCb1p6VWofhEQ==
X-Google-Smtp-Source: ABdhPJwO12MEg4fn8zCn2MRFAsgTPTKeRw19mkSIVVPiSrlIwwzZRBRcieuiu0Obm+3chTTmCf31R0a0NgKnYnfd1fU=
X-Received: by 2002:a17:907:980d:: with SMTP id ji13mr26759965ejc.466.1635948810946;
 Wed, 03 Nov 2021 07:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
 <20211101122545.3417624-2-horatiu.vultur@microchip.com> <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
 <20211101213201.wdjsuexuuinepu3m@soft-dev3-1.localhost> <YYGFYLtehnDOgA9d@robh.at.kernel.org>
 <20211102222757.ny4c7gdnyxm3gorw@soft-dev3-1.localhost> <087a49e0-30fe-7b09-b246-6d50e96299d1@axentia.se>
In-Reply-To: <087a49e0-30fe-7b09-b246-6d50e96299d1@axentia.se>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 3 Nov 2021 09:13:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJYLgmPu8ACFcbwdj9GukPiSpMGsZWr6x659WMNyZEL9A@mail.gmail.com>
Message-ID: <CAL_JsqJYLgmPu8ACFcbwdj9GukPiSpMGsZWr6x659WMNyZEL9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
To:     Peter Rosin <peda@axentia.se>
Cc:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 3, 2021 at 6:45 AM Peter Rosin <peda@axentia.se> wrote:
>
> On 2021-11-02 23:27, Horatiu Vultur wrote:
> > The 11/02/2021 13:37, Rob Herring wrote:
> >> On Mon, Nov 01, 2021 at 10:32:01PM +0100, Horatiu Vultur wrote:
> >>> The 11/01/2021 15:32, Peter Rosin wrote:
>
> *snip*
>
> >>>
> >>> +required:
> >>> +  - compatible
> >>
> >> compatible should not be required here.
> >>
> >>> +  - '#address-cells'
> >>> +  - '#size-cells'
> >>> +
> >>>  examples:
> >>>    - |
> >>>      /*
> >>> ---
> >>>
> >>> If I have this then my problem is with the required properties because then I
> >>> start to get new warnings once I run:
> >>>
> >>> make ARCH=arm CROSS_COMPILE=arm-linux- dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> >>>
> >>> For example, one of new the warnings is this:
> >>>
> >>> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: 'compatible' is a required property
> >>>       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> >>> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#address-cells' is a required property
> >>>       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> >>> /home/hvultur/linux/arch/arm/boot/dts/am335x-icev2.dt.yaml: mux-mii-hog: '#size-cells' is a required property
> >>>       From schema: /home/hvultur/linux/Documentation/devicetree/bindings/i2c/i2c-mux.yaml

There's actually a ton of 'mux' nodes that should be causing warnings too.

> >> This is because of the $nodename pattern being pretty lax and matches
> >> on mux-mii-hog by mistake. We have 2 options. Change the nodename
> >> pattern to '^(i2c-?)?mux(@.*)?$' or add 'select: false'. The former
> >> would still match on 'mux' or 'mux@.*' which might still have problems.
> >> For the latter, we just need to make sure all the i2c-mux schemas have a
> >> $ref to this schema. Also, with that change we'd stop checking 'i2c-mux'
> >> nodes that don't yet have a specific schema. That said, I do lean toward
> >> the latter option.
> >
> > From what I can see there are only two i2c-mux schemas and both of them
> > have a $ref to this schema [1][2]
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml#L33
> > [2] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml#L16
>
> I'm a relative yaml bindings newbie, but I assume adding "select: false" will
> have the side effect of not enforcing this i2c-mux schema on i2c-muxes that
> have not yet been converted to yaml? E.g. i2c-mux-gpio.txt, i2c-mux-pinctrl.txt
> etc etc. But there are not too many of those. Is it a prerequisite to update
> those bindings to yaml before doing "select: false"?

No. We may be losing some checks temporarily, but we've got plenty of
other warnings to keep busy. And most cases in tree seem to be pca954x
anyways.

> Looking further I think
> there's a total of about 15-20 drivers doing i2c-muxing (or arbing/gating),
> and some of those exist outside the "i2c umbrella".
>
> I wonder if e.g. this one [1] should really reference i2c-controller.yaml as
> it is currently doing, or if i2c-mux.yaml is correct?
>
> [1] Documentation/devicetree/bindings/power/supply/sbs,sbs-manager.yaml
>
> Maybe i2c-mux.yaml didn't work in that case because the node names were
> "wrong" and did not match the pattern and then someone stuck
> i2c-controller.yaml in there simply because that was close enough, and
> also happened to work?

While the device does have muxing capability, it does much more and
the use is rather specific. So I think it is fine.

Rob
