Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F81847A7AE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 11:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhLTKUr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 05:20:47 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:34730 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbhLTKUq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 05:20:46 -0500
Received: by mail-ua1-f46.google.com with SMTP id u40so16766012uad.1;
        Mon, 20 Dec 2021 02:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCPcqRUY/oioGR+dbo0bTM8X8Fyp29+qZWUKmKtuk9I=;
        b=i/YMqFcwROXFdIZxcMkxuYKjJ4YWRZWdAvhGOxC6sPXfcnMvGKBCVHFo2KqHqO8L4I
         9HtP4SnOKNg+e2UmGzByk1d8WjaX2PBoJtN9XTUqamx+LHfA5cJHDo3Qj4Rg+DIBi4x1
         CW1/N3hc5YK3CgkezgQAyrW4tsloMeC3E+kFcyyy3lj2j77K+nAJI9TU1CvjJI6jO0Qa
         79GOjEpOzTAHhM0IHwAXJ/xhjoL9qSu7ww1AeSIVL9xLO4ij4VTG+FbqeJPsHMDPAkaq
         IG+DBCIYQrhot49b16qbOtsTrY4n53UJSPv3xcdCMNXeDkBre+Uja5MM9Mggzcgvn4sc
         F2iQ==
X-Gm-Message-State: AOAM533+YxG8gOmEy7FN8ESbkdXAz7iuRqAG7EXpTNjKspLY5IqIydYN
        hdkyOcVkSvt32aF7AVHqrNmAZBLUDqmO6w==
X-Google-Smtp-Source: ABdhPJzW3tzstR7cOpNbq5DtBIJumWLlk/tBmKl/XCKKJlC8lXW3sljhoKankD4g5MrCVJH2xzQjkQ==
X-Received: by 2002:ab0:1350:: with SMTP id h16mr4543722uae.138.1639995645551;
        Mon, 20 Dec 2021 02:20:45 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 63sm304914uak.17.2021.12.20.02.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 02:20:45 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id t13so16689442uad.9;
        Mon, 20 Dec 2021 02:20:44 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr4779431vst.5.1639995644503;
 Mon, 20 Dec 2021 02:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211218165258.16716-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211218165258.16716-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Dec 2021 11:20:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXxjL=zb8Kq1PFsOFYxsCxx-g2ZOCit+YGDOTM-JKpZw@mail.gmail.com>
Message-ID: <CAMuHMdUXxjL=zb8Kq1PFsOFYxsCxx-g2ZOCit+YGDOTM-JKpZw@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: riic: Use platform_get_irq() to get the interrupt
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
        Prabhakar <prabhakar.csengg@gmail.com>
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
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -433,12 +433,12 @@ static int riic_i2c_probe(struct platform_device *pdev)
>         }
>
>         for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
> -               res = platform_get_resource(pdev, IORESOURCE_IRQ, riic_irqs[i].res_num);
> -               if (!res)
> -                       return -ENODEV;
> +               ret = platform_get_irq(pdev, riic_irqs[i].res_num);
> +               if (ret <= 0)

This can be "ret < 0".

> +                       return ret ? ret : -ENXIO;
>
> -               ret = devm_request_irq(&pdev->dev, res->start, riic_irqs[i].isr,
> -                                       0, riic_irqs[i].name, riic);
> +               ret = devm_request_irq(&pdev->dev, ret, riic_irqs[i].isr,
> +                                      0, riic_irqs[i].name, riic);
>                 if (ret) {
>                         dev_err(&pdev->dev, "failed to request irq %s\n", riic_irqs[i].name);
>                         return ret;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
