Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFE947F427
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Dec 2021 18:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhLYRtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Dec 2021 12:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhLYRtY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Dec 2021 12:49:24 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62653C061401;
        Sat, 25 Dec 2021 09:49:24 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id f5so44802321edq.6;
        Sat, 25 Dec 2021 09:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gM3VpFGbnRlsUdu/qU43co/kdMZXZwIKIYTPggeA3/c=;
        b=Zpo3jRJagdt8cSZ6tuYV2LzBTh56FD1vaWBUSZWUqabX40Qh+y+LXphzIMClqKQH/k
         UVu8CKKTXXrAe9fgGF6well70V7ogypPUERe0BxoqJUoQxqlxWH5FLCRrerjp/rZN4Rl
         DB1/eM2SKhzgFsn0QQFyCzgM1nP1YCgY77aBkZWe/TPbpjLlLwIVb9fIMTUwMRK6ii3x
         cQ7INo8bvLJL8883EJsfO5FjDx7ugbkfAQdDiNgssiEL/6q9dUNeAQBDFPpU5vunZ7dH
         21qJK1jG63sqHhW7M+Poyd5o2LVx4vo88G90JrdblJdEvTDT/jVuspP50qtBf6+devqF
         3zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gM3VpFGbnRlsUdu/qU43co/kdMZXZwIKIYTPggeA3/c=;
        b=dJ0e1qCATKDhJG7wLDefixEqIbyAWMdHWwZa/AOhJyH+aHkWJJ/AolsxkeQ+j00CEN
         su2SB/7E8kD7bCup+Lc1vZlbCBMkpoqpnpmeaGT+NtDskQTJ5ylD4Dtz4c/kdj78Mm9C
         MvqcB3IRMSom2J2ewOKTLUDxsjWFKyaC4bcmyNYo4bMdDToxNXC1Jg0PFuaC6C+C/iVW
         1E2APClTnPX5mgsZHw2ZraL7gFtwURmll1dsydKpVodzXpLjJDjShR70kI9Yrxg5KBPH
         1LwP4Grr34mjw4T/duu4oHgDkXdVLPfODRzQ6M8jWBBZY1PBpdFbx7r7zygpR4eixGVR
         LB/g==
X-Gm-Message-State: AOAM532sCtZ9RIs18n5c7VcQNw9xayA8if2nxXEupoxyv4bHixKAkciE
        SGffGTDjDuU8ZnaLVA5mJ53bHdoWiwyFBgzBql4=
X-Google-Smtp-Source: ABdhPJy7x6W89zkrinOTPZz0lb4PsAdSjaFqF/BP/cBoCZYOiEv0gzK46jeBYq8/j34jt1lO3eHUQNERWm9JkeR+YFc=
X-Received: by 2002:a05:6402:2693:: with SMTP id w19mr9901452edd.158.1640454562884;
 Sat, 25 Dec 2021 09:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Dec 2021 19:48:46 +0200
Message-ID: <CAHp75VcxCGjPiuQi9w5M3Gv97nj+TQVMdF86TQXi6bxgSTL1mQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakarprabhakar.csengg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 22, 2021 at 2:41 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional() for DT users only.

...

> +       if (np) {

Same comments as per your other patches, i.e.
Why is this check here?

> +               int irq;
> +
> +               while ((irq = platform_get_irq_optional(dev, k)) != -ENXIO) {

Consider 0 as no IRQ.

> +                       if (irq < 0)
> +                               return irq;
> +                       ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
> +                                              0, dev_name(&dev->dev), pd);
>                         if (ret) {
> -                               dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> +                               dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
>                                 return ret;
>                         }
> +                       k++;
> +               };
> +       } else {
> +               struct resource *res;
> +               resource_size_t n;
> +
> +               while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
> +                       for (n = res->start; n <= res->end; n++) {
> +                               ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
> +                                                      0, dev_name(&dev->dev), pd);
> +                               if (ret) {
> +                                       dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> +                                       return ret;
> +                               }
> +                       }
> +                       k++;
>                 }
> -               k++;
>         }

-- 
With Best Regards,
Andy Shevchenko
