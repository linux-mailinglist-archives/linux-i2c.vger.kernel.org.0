Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF29A47A928
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 12:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhLTL7T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 06:59:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhLTL7R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 06:59:17 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D9BC061574;
        Mon, 20 Dec 2021 03:59:17 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id d10so28143538ybn.0;
        Mon, 20 Dec 2021 03:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=OT6Xy4HVeQr5L0vwbcuCuryh1+wIQ55LF2RHkDJgXl0=;
        b=iVbtb5plqZz4o2MqPgitc4VG85p0RYi/BxLiw4j16VoI36tZ64WUYOIuRLnUUiN4hP
         OrsvNIbznRfk27BBFzXpsshizNqKklwKyBu4nEdzPut1oG+dyTSRER9MG3EJw+m+S0dy
         JmcZ4oendYrzDQl4OHXeY4L04xwOlTnY782QkfkP8rfXdzKv6Sdx0y4twW9/ANxFz8cs
         nkOinrsfO7j1HBdNON3ZN+I/Tkx44AZlrGvxSra1dWm5pyYfFynn70Y2jTSTlbgkO1Ea
         qPVHQHSeScXdcHR4BcQa4qCYJJpVd2gOuH8oACUbUvbeCbI6Sg6RUF3lJeSwiNwYbT7A
         iptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=OT6Xy4HVeQr5L0vwbcuCuryh1+wIQ55LF2RHkDJgXl0=;
        b=JbiUYJptvM08M9XmdgTl4bq8qdKoQYZ+CMaebPu9wKBoizDNVaiUfxquWXZL2yTEQ+
         odYUFjbhHlXQSkBp+A5Uns20Gmlg16HLV07t003hOeKNHdcan/kj61KL0BzeBEgY0QyA
         G469XiWkw8KffGzh53jhsJ4rfVjzpL58HDXRsB1jWg0yP5VVYSHInVAoH6D6vRwALjpZ
         eTMSvWtuRLLrnTDminNpk9di937l1/WaSSpuIfIErem5qRKBO2vinIch/q13QbR3/MCH
         SOTQOy6sKmZ6z5VJzyzljtWb7YdaGw4h00oDriof+8c9SSLtX9CXFGp5bJ0NQnJ+EuoV
         c4Hw==
X-Gm-Message-State: AOAM530n4gx0KRcnK/Wr39KVMgxwJW6AJsi1AHDO/I9oqTsItXpBXLmB
        TjaWH9hsY4aHMpH9bR32kVMvrCfX0BXoV3tGp54=
X-Google-Smtp-Source: ABdhPJxkm0C6I23HMLAswqdg6/6uGhzzeuPrSMs/XjRgksI5CmTNqr2JDp8xcTq4+BteOOlCFOstBgJ+h9a7aN6eEVk=
X-Received: by 2002:a25:4213:: with SMTP id p19mr21511186yba.41.1640001556742;
 Mon, 20 Dec 2021 03:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <YcBX8iLzFaztwkeo@ninjato>
In-Reply-To: <YcBX8iLzFaztwkeo@ninjato>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 20 Dec 2021 11:58:51 +0000
Message-ID: <CA+V-a8uuZ+w=Y6=VmeiyGvM+5F_0JY5PwCsg3MCq9W0_fmPBew@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        LAK <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the review.

On Mon, Dec 20, 2021 at 10:16 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > +     if (!np) {
>
> Very minor nit: Maybe 'if (np)' and switch the blocks? Positive logic is
> a tad easier to read.
>
OK will update it for v2.

> > +             struct resource *res;
> > +             resource_size_t n;
> > +
> > +             while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
> > +                     for (n = res->start; n <= res->end; n++) {
> > +                             ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
> > +                                                    0, dev_name(&dev->dev), pd);
> > +                             if (ret) {
> > +                                     dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> > +                                     return ret;
> > +                             }
> > +                     }
> > +                     k++;
> > +             }
>
> Yeah, it is good to keep the legacy block as is.
>
> > +             do {
> > +                     irq = platform_get_irq_optional(dev, k);
> > +                     if (irq <= 0 && irq != -ENXIO)
> > +                             return irq ? irq : -ENXIO;
> > +                     if (irq == -ENXIO)
> > +                             break;
> > +                     ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
> > +                                            0, dev_name(&dev->dev), pd);
> >                       if (ret) {
> > -                             dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> > +                             dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
> >                               return ret;
> >                       }
> > -             }
> > -             k++;
> > +                     k++;
> > +             } while (irq);
>
> In addition to the 'irq == 0' case from patch 1, I tried to shorten the
> block for the np-case. I only came up with this. The assigntment and
> comparison of the while-argument is not exactly pretty, but the block
> itself is easier to read. I'll let you decide.
>
>                 while (irq = platform_get_irq_optional(dev, k) != -ENXIO) {
>                         if (irq < 0)
>                                 return irq;
>
>                         ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
>                                                0, dev_name(&dev->dev), pd);
>                         if (ret) {
>                                 dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
>                                 return ret;
>                         }
>                         k++;
>                 }
>
> Only brainstorming, not even build tested.
>
LGTM, I'll give that a shot.

Cheers,
Prabhakar
