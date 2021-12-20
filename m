Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1BF47A7A8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 11:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhLTKSH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 05:18:07 -0500
Received: from mail-vk1-f175.google.com ([209.85.221.175]:43564 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhLTKSG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 05:18:06 -0500
Received: by mail-vk1-f175.google.com with SMTP id u1so2765460vkn.10;
        Mon, 20 Dec 2021 02:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gWZeNP8DUHqqAPmXQI4X/CPyv8FN0UIhm7TiEmIly/k=;
        b=MqX9yRohFFNss5cxtDLNFKEWZiUyNT9s2kDxiTYENf9jgU62FzpPLqCK3rs0P7LImS
         Un463KJp7zJeTXh8iFa4KfJRNOUq0stIKc4+IWsmT7HPBwKjWTfApjpTqoPAJ2M0WzoQ
         axaK/+vp6/o7LW5ImevziacaYFOasnrXltzgzROCxHQyKpgsJHC5LrqA7l4gdAqCDuLn
         0MR73zOs1PO5NErloJVfQjVf/b/Hk8ZLYXkRUqgT/LRt74y2Ea0oLEwEh6RgIXytp92j
         h+Wpjq4kkoQkVcPzUEZ6PLPT8MpsEOqJKR7lYhKQdx+l3tkffvcjoaQOGe76kUDY8dVO
         g4cg==
X-Gm-Message-State: AOAM53016lw/cjORY3/kPkS9acRLGR5WgpZVcCslC9iz2p6OOpzSvSYW
        X17XqLfajV4X7Y1OPi4PkfQaeFE+NMRD4g==
X-Google-Smtp-Source: ABdhPJzymXCIrWYiTxjG8eqNgwKA/3IM9NUqb/TQ6v1OVoDGmlW0Xv52Jh6xo6Cae7ONJiMFqhUPQw==
X-Received: by 2002:a05:6122:906:: with SMTP id j6mr1894275vka.18.1639995485479;
        Mon, 20 Dec 2021 02:18:05 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id m25sm10292vsl.34.2021.12.20.02.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 02:18:05 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id c10so3020467vkn.2;
        Mon, 20 Dec 2021 02:18:04 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr5112747vke.33.1639995484506;
 Mon, 20 Dec 2021 02:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Dec 2021 11:17:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
Message-ID: <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Prabhakar,

On Sat, Dec 18, 2021 at 5:59 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.

Thanks for your patch!

> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional() for DT users only.

Why only for DT users?
Plenty of driver code shared by Renesas ARM (DT-based) on SuperH
(non-DT) SoCs already uses platform_get_irq_optional(), so I expect
that to work for both.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -830,20 +830,41 @@ static void sh_mobile_i2c_release_dma(struct sh_mobile_i2c_data *pd)
>
>  static int sh_mobile_i2c_hook_irqs(struct platform_device *dev, struct sh_mobile_i2c_data *pd)
>  {
> -       struct resource *res;
> -       resource_size_t n;
> +       struct device_node *np = dev_of_node(&dev->dev);
>         int k = 0, ret;
>
> -       while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
> -               for (n = res->start; n <= res->end; n++) {
> -                       ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
> -                                         0, dev_name(&dev->dev), pd);
> +       if (!np) {
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
> +               }
> +       } else {
> +               int irq;
> +
> +               do {
> +                       irq = platform_get_irq_optional(dev, k);

Check for irq == -ENXIO first, to simplify the checks below?

> +                       if (irq <= 0 && irq != -ENXIO)
> +                               return irq ? irq : -ENXIO;

Can irq == 0 really happen?

All SuperH users of the "i2c-sh_mobile" platform device use an
evt2irq() value that is non-zero.

I might have missed something, but it seems the only user of IRQ 0 on
SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
These should have been seeing the "0 is an invalid IRQ number"
warning splat since it was introduced in commit a85a6c86c25be2d2
("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:
the rare users may not have upgraded their kernels beyond v5.8 yet...

> +                       if (irq == -ENXIO)
> +                               break;
> +                       ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
> +                                              0, dev_name(&dev->dev), pd);
>                         if (ret) {
> -                               dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
> +                               dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
>                                 return ret;
>                         }
> -               }
> -               k++;
> +                       k++;
> +               } while (irq);
>         }
>
>         return k > 0 ? 0 : -ENOENT;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
