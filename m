Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFEB47CF15
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 10:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243856AbhLVJUQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 04:20:16 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:40865 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239569AbhLVJUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Dec 2021 04:20:16 -0500
Received: by mail-ua1-f43.google.com with SMTP id y23so3019941uay.7;
        Wed, 22 Dec 2021 01:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5KXFkJczT+loL4bmBd/xTV7aUTkBhT057Cylmeu8aM=;
        b=B63M9lnNYHxhCs876fSKbCSpVLD3SfeHDCQ77UUuhAJIjPE0tI/K0QZ/ug73+1jqta
         lz+bns5TmqLV1byR0NQHxegThxqZFm7zeOyw4s8f0D2I4OFLR067nmkfg8dL9+O8UIqb
         9EUSrQtkweKOX/0xI25uRnG+RgQew75PkNL6Hd3hRVhp5bkJMySnkLOlCm1ikQjvmJvn
         gYb1fqB3hss1eLowdUPZIAN+es6xsFyxHQoJPhwzBt63u4jQcdsWWOSVilR/RgXg+OWp
         jA5ze6crTQxXH5UhafeaF7QpPch9aoiD83x5Mne4OpplJbpItpwm2+PwgAhrYfAjrPxB
         dROA==
X-Gm-Message-State: AOAM530RprnitFafJVAQX54NdesjpiBUpGz7g/OwzzjgRZh6wgycFlqz
        Xx3YztjPSaxiX9b6FrH5RiBZxF8990/y3g==
X-Google-Smtp-Source: ABdhPJwF9jaHNu77S8dTJ0lF2VMZJwYVQ2Lk62/GUHrzODlWm4y4qhZpM09z2gYL0qwrD/XRcwqQNA==
X-Received: by 2002:a67:e109:: with SMTP id d9mr631850vsl.11.1640164815641;
        Wed, 22 Dec 2021 01:20:15 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id i123sm281897vkb.20.2021.12.22.01.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 01:20:15 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id m185so933582vkm.5;
        Wed, 22 Dec 2021 01:20:15 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id j38mr685592vkd.39.1640164815041;
 Wed, 22 Dec 2021 01:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Dec 2021 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhenTpAqYkZhgnxOWZPgJah0_UeWC_sC9Me+AA1YDBMQ@mail.gmail.com>
Message-ID: <CAMuHMdXhenTpAqYkZhgnxOWZPgJah0_UeWC_sC9Me+AA1YDBMQ@mail.gmail.com>
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
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakarprabhakar.csengg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 7:21 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq_optional() for DT users only.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
