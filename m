Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E58F47A9F5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 13:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhLTMyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 07:54:23 -0500
Received: from mail-vk1-f175.google.com ([209.85.221.175]:35763 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhLTMyX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 07:54:23 -0500
Received: by mail-vk1-f175.google.com with SMTP id c10so3275607vkn.2;
        Mon, 20 Dec 2021 04:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ar2itvRaNRINX/GSg9lQ6GgUsoNPXNM6Gu4E6uHHTfw=;
        b=HnGh5hYaUt7q/BtgK4hgy4gfljMcLdbv/Y54BNLyl4JqN9oKk7We7mnBpZjRsUjvE0
         6FGScxMEV/5T3jzP7G2CVHI7T+HtqoZYw/j3VON2U2d7O1PJnwZfsNUitwyifwuNQm8W
         +l21WPrpF0qptz4OM7EPooUo7IY4z0ibzPTWNd95PK+rNSrpshQ+udCZoSEoceosUovD
         uFesNs6hzuTBHBsEBdN8vhXRPntJ1TKhRnVF3VuhlD9XKg5YDMr1FyfO80TNx1CmSMUW
         mzLCouBDk7UNpLL5XEFYQhq3Ka9kwSTyftkmVPrAERsHH5t3+7VKrqnmMltAzoPQdIjA
         vAow==
X-Gm-Message-State: AOAM532XwGUwbCiaBFNCBXmPIjYrhP8qMHhivc5yaiolAaGsbl0dJWdl
        fwpjRJZMTZ1RgiqRrYTnay/d6rH3AJ3aZA==
X-Google-Smtp-Source: ABdhPJybL8p0es+ZM9gs/Ftai694BvQ/Lu/xq19E+1vkG1UIMUzBsayA9qdU2RCHdhLuoyAgisIjUg==
X-Received: by 2002:a05:6122:8d1:: with SMTP id 17mr5319101vkg.24.1640004862346;
        Mon, 20 Dec 2021 04:54:22 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id x34sm2357363uac.12.2021.12.20.04.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 04:54:21 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id t13so17417193uad.9;
        Mon, 20 Dec 2021 04:54:21 -0800 (PST)
X-Received: by 2002:a67:c81c:: with SMTP id u28mr4062311vsk.38.1640004860988;
 Mon, 20 Dec 2021 04:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com> <CA+V-a8t7S2t94Tm7y8is1fJ2G0Es=xnKQQaj-7DJ53sF6zzJog@mail.gmail.com>
In-Reply-To: <CA+V-a8t7S2t94Tm7y8is1fJ2G0Es=xnKQQaj-7DJ53sF6zzJog@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Dec 2021 13:54:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxcjJtcBoMCYAZyGCcLAmxeN=mWJSyJ+g9bHjJ1kYrPw@mail.gmail.com>
Message-ID: <CAMuHMdVxcjJtcBoMCYAZyGCcLAmxeN=mWJSyJ+g9bHjJ1kYrPw@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Mon, Dec 20, 2021 at 12:56 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Dec 20, 2021 at 10:18 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Sat, Dec 18, 2021 at 5:59 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > > allocation of IRQ resources in DT core code, this causes an issue
> > > when using hierarchical interrupt domains using "interrupts" property
> > > in the node as this bypasses the hierarchical setup and messes up the
> > > irq chaining.
> >
> > Thanks for your patch!
> >
> > > In preparation for removal of static setup of IRQ resource from DT core
> > > code use platform_get_irq_optional() for DT users only.
> >
> > Why only for DT users?
> > Plenty of driver code shared by Renesas ARM (DT-based) on SuperH
> > (non-DT) SoCs already uses platform_get_irq_optional(), so I expect
> > that to work for both.
> >
> For the non DT users the IRQ resource is passed as a range [0] and not
> a single interrupt so I went with this approach. Is there a way I'm
> missing where we could still use platform_get_irq_xyz() variants for
> such cases?

Oh, I didn't realize it used a single resource with a range.
Is this common, i.e. would it make sense to add support for this to
platform_get_irq_optional()?

> > > --- a/drivers/i2c/busses/i2c-sh_mobile.c
> > > +++ b/drivers/i2c/busses/i2c-sh_mobile.c

> > > +                       if (irq <= 0 && irq != -ENXIO)
> > > +                               return irq ? irq : -ENXIO;
> >
> > Can irq == 0 really happen?
> >
> > All SuperH users of the "i2c-sh_mobile" platform device use an
> > evt2irq() value that is non-zero.
> >
> > I might have missed something, but it seems the only user of IRQ 0 on
> > SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
> > arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
> >
> I'll keep that in mind if the Ethernet driver falls in the convection
> patch changes.

The Ethernet driver was converted 6 years ago, cfr. commit
965b2aa78fbcb831 ("net/smsc911x: fix irq resource allocation failure").

> [0] https://elixir.bootlin.com/linux/v5.16-rc6/source/arch/sh/kernel/cpu/sh4a/setup-sh7724.c#L454

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
