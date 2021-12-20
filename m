Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA04B47A91E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 12:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbhLTL4B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 06:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbhLTL4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 06:56:00 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A925EC061574;
        Mon, 20 Dec 2021 03:56:00 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id y68so28053050ybe.1;
        Mon, 20 Dec 2021 03:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/crEyEqm9JXUuy5rjWxQ+CMQQRqWO7tHqYVFHQvrBs=;
        b=mXrhHqYHkn5WA7ONhl0448/qRonQDH308gWLxvXXjOj5BwqAJ5ce7EKjpyzKs/C2xu
         acpRVM+USp+1N0Tx8VhwuySoFbC9axrKCU7f5sk1h781KOrvwHIt7XsRGNOYHcdHtxNr
         8xGRDvTpZu1JccymjbSsD3rDkwZi3nHVWkIjKduwU1GDJZ8a7vQaxL9pM73AJ9LGY31T
         WWjcmZ3nfgdLz4N+c5MU3Sgc72NQ9f8Or2TtAJKd1DP4iqWDAk9nVWBXD5AUqDMd0qie
         swl7tZrd/LMJrFBh9CaoyjVSlcr5pLRaf/YqIYq++3Wv3jj4cwr7QjMeAuz3myO2R52f
         McuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/crEyEqm9JXUuy5rjWxQ+CMQQRqWO7tHqYVFHQvrBs=;
        b=w99VnqXRQoK91BhE4tUN29Qmd0iFmp1GiaE/nOeT8UHhY1Jgje+tTObNAg7YyQnrj/
         vOmCJ+ViJOy8d1mXf2LqUfQ+Ohu1Le6g0f3VIA12j/F1l92p5d8kWd/bUM+ykMWXslkY
         00lZyHW7iwa6AmowB9Bhkju0ugWTyscB/BPHduAyS6zK4Ge2hfHT3Q7fKHjj2wY8cYpY
         cu8JklXk0wzPWdGnDs1dVh2aTnOBVBjPzsKuZfIEEAL6bmLtfFFFMZR14XHZl7S/F9v7
         mhpgRwPUXVsjO3MRFcPHc98YKj+vV4SI/SKFNKWu1uAXL04FotFg+b7PHr7OzLk1NqE+
         LZ6g==
X-Gm-Message-State: AOAM531lwXTFpc/27utsF+fsFzsxoKeBha62qIUjHA6m6z1u4pyXrQQX
        4Z4Kqx8a9DzwbI4/A3XDR2Bitm6R4aoBod5lEmE=
X-Google-Smtp-Source: ABdhPJysWqs3UIISqCAQj4ffQ5qMe9Bpl2EXfUC7zH6b93AKzhohiEKwF4Ewph//Iz3ChGcjfDKCLckgOCL2PP+4gd8=
X-Received: by 2002:a25:84c1:: with SMTP id x1mr22282261ybm.690.1640001359897;
 Mon, 20 Dec 2021 03:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
In-Reply-To: <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 20 Dec 2021 11:55:33 +0000
Message-ID: <CA+V-a8t7S2t94Tm7y8is1fJ2G0Es=xnKQQaj-7DJ53sF6zzJog@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

Thank you for the review.

On Mon, Dec 20, 2021 at 10:18 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sat, Dec 18, 2021 at 5:59 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > allocation of IRQ resources in DT core code, this causes an issue
> > when using hierarchical interrupt domains using "interrupts" property
> > in the node as this bypasses the hierarchical setup and messes up the
> > irq chaining.
>
> Thanks for your patch!
>
> > In preparation for removal of static setup of IRQ resource from DT core
> > code use platform_get_irq_optional() for DT users only.
>
> Why only for DT users?
> Plenty of driver code shared by Renesas ARM (DT-based) on SuperH
> (non-DT) SoCs already uses platform_get_irq_optional(), so I expect
> that to work for both.
>
For the non DT users the IRQ resource is passed as a range [0] and not
a single interrupt so I went with this approach. Is there a way I'm
missing where we could still use platform_get_irq_xyz() variants for
such cases?

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/i2c/busses/i2c-sh_mobile.c
> > +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> > @@ -830,20 +830,41 @@ static void sh_mobile_i2c_release_dma(struct sh_mobile_i2c_data *pd)
> >
> >  static int sh_mobile_i2c_hook_irqs(struct platform_device *dev, struct sh_mobile_i2c_data *pd)
> >  {
> > -       struct resource *res;
> > -       resource_size_t n;
> > +       struct device_node *np = dev_of_node(&dev->dev);
> >         int k = 0, ret;
> >
> > -       while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
> > -               for (n = res->start; n <= res->end; n++) {
> > -                       ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
> > -                                         0, dev_name(&dev->dev), pd);
> > +       if (!np) {
> > +               struct resource *res;
> > +               resource_size_t n;
> > +
> > +               while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
> > +                       for (n = res->start; n <= res->end; n++) {
> > +                               ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
> > +                                                      0, dev_name(&dev->dev), pd);
> > +                               if (ret) {
> > +                                       dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> > +                                       return ret;
> > +                               }
> > +                       }
> > +                       k++;
> > +               }
> > +       } else {
> > +               int irq;
> > +
> > +               do {
> > +                       irq = platform_get_irq_optional(dev, k);
>
> Check for irq == -ENXIO first, to simplify the checks below?
>
OK.

> > +                       if (irq <= 0 && irq != -ENXIO)
> > +                               return irq ? irq : -ENXIO;
>
> Can irq == 0 really happen?
>
> All SuperH users of the "i2c-sh_mobile" platform device use an
> evt2irq() value that is non-zero.
>
> I might have missed something, but it seems the only user of IRQ 0 on
> SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
> arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
>
I'll keep that in mind if the Ethernet driver falls in the convection
patch changes.

> These should have been seeing the "0 is an invalid IRQ number"
> warning splat since it was introduced in commit a85a6c86c25be2d2
> ("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:
> the rare users may not have upgraded their kernels beyond v5.8 yet...
>
Might be users have not updated their kernels.

[0] https://elixir.bootlin.com/linux/v5.16-rc6/source/arch/sh/kernel/cpu/sh4a/setup-sh7724.c#L454

Cheers,
Prabhakar
> > +                       if (irq == -ENXIO)
> > +                               break;
> > +                       ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
> > +                                              0, dev_name(&dev->dev), pd);
> >                         if (ret) {
> > -                               dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> > +                               dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
> >                                 return ret;
> >                         }
> > -               }
> > -               k++;
> > +                       k++;
> > +               } while (irq);
> >         }
> >
> >         return k > 0 ? 0 : -ENOENT;
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
