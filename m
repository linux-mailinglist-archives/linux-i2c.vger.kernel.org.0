Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2332035FA42
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 20:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352215AbhDNSG4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 14:06:56 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:34308 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352231AbhDNSGy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 14:06:54 -0400
Received: by mail-ua1-f51.google.com with SMTP id s2so6687834uap.1;
        Wed, 14 Apr 2021 11:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddZGfKqAYJDSmmTLgKzl1rH2bdN0rcG8HZTEhXiTMnU=;
        b=n3dP8ciU/K9e+trEaq8hDq9aGdvoWJ9rmD4p4v4ZOgG3wj3scTnJ2lW4m/gXG7O9p2
         I+CzjeUgG7pzM88mDXhDl8i0BchObUT3JFeN52qx4ykqK1C6HpR8GN41h1lQDN+ZApzE
         yiYSaZ2/NZyYh/7/mcAVjoJgtKDHzXHtw3XjG4G4iSswpS0w2z8qY09GomeAfFYJH60x
         AxXoOz/sAULGM9hwvoyp0+ZFIzpzOQ00OFYnGdaNxKOmVFsB5hqeo1jPe6BKiXWbuPhL
         483JO2NF9WI5PyZ5f27+sAF4Cg8Sl0Af1Zs5jdkLpxEDItR8UzK0AYVsBD67KbKX44y4
         faiA==
X-Gm-Message-State: AOAM531eaUuKbbBJ1IIXqznUFmfOp8IOUNUUXrm2Xopq3oJwV4mvJwwt
        UlKgiRtoyIGXhRcB50e5bm+3zqRgLHG8nYmgXQE=
X-Google-Smtp-Source: ABdhPJyQPiBIV7uNy1l3QbwhYpaInf6c0VDMaKzClso+F1JYYipmeo7WYJuYhq6oSfUqeWVNS7cdTumYrdOqNv8F0h8=
X-Received: by 2002:ab0:6306:: with SMTP id a6mr28267964uap.2.1618423590460;
 Wed, 14 Apr 2021 11:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
In-Reply-To: <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Apr 2021 20:06:18 +0200
Message-ID: <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yicong,

On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > about this driver when configuring a kernel without Hisilicon platform
> > or ACPI firmware support.
>
> this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
> not sure all the platform this IP on has ARCH_HISI configured. The driver
> will not be compiled by default config. This is not correct to have
> this dependence.

Thanks for your answer!

I guess it's still fine to add a dependency on ACPI?

Thanks again!

> > Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/i2c/busses/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index b5b4e0d0ff4dd0bc..3ead6d9e130b2ebc 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -647,7 +647,7 @@ config I2C_HIGHLANDER
> >
> >  config I2C_HISI
> >       tristate "HiSilicon I2C controller"
> > -     depends on ARM64 || COMPILE_TEST
> > +     depends on (ARM64 && ARCH_HISI && ACPI) || COMPILE_TEST
> >       help
> >         Say Y here if you want to have Hisilicon I2C controller support
> >         available on the Kunpeng Server.
\
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
