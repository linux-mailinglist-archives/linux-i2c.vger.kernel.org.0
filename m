Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CF447AA0B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 14:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhLTNBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 08:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhLTNBB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 08:01:01 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB4EC061574;
        Mon, 20 Dec 2021 05:01:00 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id f186so28517934ybg.2;
        Mon, 20 Dec 2021 05:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K61mIfvuHVmU9KiOE8RDo8L4C8Lhy+/HVjzbPLGh7Nw=;
        b=KJGIrRzRD1D7h2pcI5uaYvzLLQPQJts3bB/0FxlDirtfQKbS1KzQiRrBx30cDxjxlz
         9w+fuRNFIgrngKhRikznmnrmPdef/lynOMpcMEerwC9qJO70ENRsUzYhzmbFO6pT0iOC
         3uQpmQXMftrwcpEtJ3YBQVyE93c/3zfzckP70LGHudlyAsLVVDP3fnW4zdgNG0nHg4Ao
         RqvSVWxMBNPY2v/hO7EsD6m8pjdblsp3OLORZSaYwfJPL7c3LguHkYaRMzdTKjQL5yab
         kCz2Zo+2lXun03PyQlc5SdSytvIFvA3YJliSb6LrtjrVOQHbc08cIrMy8wClkJJSt0jg
         1dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K61mIfvuHVmU9KiOE8RDo8L4C8Lhy+/HVjzbPLGh7Nw=;
        b=g+2L+tN14eOWCyq1Rsnj79LIS8+siEPbomML1MmFQvcL3vZhg2xcM05BJVlp/zKFCS
         pmXHrvtRAaWxjNKEaGt0HbTYo6wkaFzIkYMmWBxncDsd5gngb0Se9PmyYw1JLkTtyoYG
         cKWd2EEawrMCacQmvRqd8lEPbpG1N69yU9lh6xwVa43T3D7BoQZoarly7rO+XAdzmhuC
         IYlLcYZVjNA8hs6t7gHlYgLrVitcqll4QOPLCE7MGBopI3GOy4ZUbbztfyfUpHFQBIxu
         xGiFRrA0oDX6RqkTDuCh1OCq/kN3gwMl1Nbo6rn+AyxNmAuoQHTVmqPbW3weZpff4zzQ
         gXWw==
X-Gm-Message-State: AOAM532QyQIcBRq1soI0Cv68Mssx3sPJmgWO4WknDNKT71nk4bS4X1q4
        ELu/x8i9YmJlreEE29q0pl9aSmL9xG2WLBymD3w=
X-Google-Smtp-Source: ABdhPJwAwHoY+v32HALWIlIqk9teSiddYPQ+zukC5upDGzwN5XRgj1FBRcSBc+Khq20lrVlYCC3YRpc0JQNog/8krGg=
X-Received: by 2002:a25:cb97:: with SMTP id b145mr21405328ybg.186.1640005259752;
 Mon, 20 Dec 2021 05:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
 <CA+V-a8t7S2t94Tm7y8is1fJ2G0Es=xnKQQaj-7DJ53sF6zzJog@mail.gmail.com> <CAMuHMdVxcjJtcBoMCYAZyGCcLAmxeN=mWJSyJ+g9bHjJ1kYrPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVxcjJtcBoMCYAZyGCcLAmxeN=mWJSyJ+g9bHjJ1kYrPw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 20 Dec 2021 13:00:33 +0000
Message-ID: <CA+V-a8v3sUOA-MTttB-LqNT3Np0Q8FH9KOtyR6yiPnuWCCzVyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On Mon, Dec 20, 2021 at 12:54 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Dec 20, 2021 at 12:56 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Dec 20, 2021 at 10:18 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Sat, Dec 18, 2021 at 5:59 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > > > allocation of IRQ resources in DT core code, this causes an issue
> > > > when using hierarchical interrupt domains using "interrupts" property
> > > > in the node as this bypasses the hierarchical setup and messes up the
> > > > irq chaining.
> > >
> > > Thanks for your patch!
> > >
> > > > In preparation for removal of static setup of IRQ resource from DT core
> > > > code use platform_get_irq_optional() for DT users only.
> > >
> > > Why only for DT users?
> > > Plenty of driver code shared by Renesas ARM (DT-based) on SuperH
> > > (non-DT) SoCs already uses platform_get_irq_optional(), so I expect
> > > that to work for both.
> > >
> > For the non DT users the IRQ resource is passed as a range [0] and not
> > a single interrupt so I went with this approach. Is there a way I'm
> > missing where we could still use platform_get_irq_xyz() variants for
> > such cases?
>
> Oh, I didn't realize it used a single resource with a range.
> Is this common, i.e. would it make sense to add support for this to
> platform_get_irq_optional()?
>
No this isn't common even non dt users should ideally be passing a
single IRQ resource. There are very few such platforms which do this
so I don't see any point in adding this support to
platform_get_irq_optional() unless the IRQ maintainers think otherwise.

> > > > --- a/drivers/i2c/busses/i2c-sh_mobile.c
> > > > +++ b/drivers/i2c/busses/i2c-sh_mobile.c
>
> > > > +                       if (irq <= 0 && irq != -ENXIO)
> > > > +                               return irq ? irq : -ENXIO;
> > >
> > > Can irq == 0 really happen?
> > >
> > > All SuperH users of the "i2c-sh_mobile" platform device use an
> > > evt2irq() value that is non-zero.
> > >
> > > I might have missed something, but it seems the only user of IRQ 0 on
> > > SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
> > > arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
> > >
> > I'll keep that in mind if the Ethernet driver falls in the convection
> > patch changes.
>
> The Ethernet driver was converted 6 years ago, cfr. commit
> 965b2aa78fbcb831 ("net/smsc911x: fix irq resource allocation failure").
>
Thanks for the pointer.

Cheers,
Prabhakar

> > [0] https://elixir.bootlin.com/linux/v5.16-rc6/source/arch/sh/kernel/cpu/sh4a/setup-sh7724.c#L454
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
