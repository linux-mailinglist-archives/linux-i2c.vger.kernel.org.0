Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926BD3645CC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbhDSOQT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 10:16:19 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:42970 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238920AbhDSOQS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 10:16:18 -0400
Received: by mail-vk1-f176.google.com with SMTP id k128so4073069vke.9;
        Mon, 19 Apr 2021 07:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XD1Wb8dpQwS+PQagRswL/AWeEvkF0Vvl4DeCDMx5XI=;
        b=sEGIPm/Ik/FnMzDdieye25ginwtCLv+MAaQLoboPnm0ipRxuy9FscwMZ84AxAMuuYb
         uuUhtSZFy3cpjcMxLEfFyV00gjzO2LSrv5c7eRKEUOSvanHknnrEi+67wmrXDGHVzWDn
         GgaxLA+TgjEV/zG+Xpje4wOAmZbvHBgFREBz841MzglY5AqeWS22MFozGfTA8S9Pqfka
         4bZEAJw+u1aKbuWGo2MDBQJrN2EP3g7cmUtkqoo6iHYgMPspfd5JOd6RA6Bn+OLRfuTD
         NXKBaye1U+RnawhphHTgQBVqTfTJRnvymfgxbNL2ds8L5FfBZgYXMaqNXNkrIXJouSY7
         qd6Q==
X-Gm-Message-State: AOAM530vNyXWB6v6deyQr6meizNS8mS1KFCqF63mG+oNpQsR7ABAU0lk
        Gwy8xTeXPpYbk6nLxhf8VUpHLOhB/lmbutyNVEliO7va5jP1Ng==
X-Google-Smtp-Source: ABdhPJylXxYZJhX8T8J4/m+2EJWscrXceKyzIOBqISvpun0wKo2rXOgi8FHjDP4pEoiG7MFShISPtJ9kUHOR7VdN/RM=
X-Received: by 2002:a1f:23d0:: with SMTP id j199mr765194vkj.1.1618841747956;
 Mon, 19 Apr 2021 07:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
 <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
 <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com>
 <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com> <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com>
In-Reply-To: <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Apr 2021 16:15:36 +0200
Message-ID: <CAMuHMdX1D+2iLPEDzG9BiR8bu-dEBmE-=w0nFMhF8ojD7rCfzg@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Apr 19, 2021 at 3:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 19, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Apr 19, 2021 at 3:35 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Apr 19, 2021 at 4:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Thu, Apr 15, 2021 at 10:50 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Thu, Apr 15, 2021 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > > On Wed, Apr 14, 2021 at 9:14 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> > >
> > > ...
> > >
> > > > > > > > > > I guess it's still fine to add a dependency on ACPI?
> > > > > > > > >
> > > > > > > > > But why?
> > > > > > > >
> > > > > > > > Please tell me how/when the driver is used when CONFIG_ACPI=n.
> > > > > > >
> > > > > > > I'm not using it at all. Ask the author :-)
> > > > > > >
> > > > > > > But if we follow your logic, then we need to mark all the _platform_ drivers
> > > > > > > for x86 world as ACPI dependent? This sounds ugly.
> > > > > >
> > > > > > Do all other x86 platform drivers have (1) an .acpi_match_table[] and
> > > > > > (2) no other way of instantiating their devices?
> > > > > > The first driver from the top of my memory I looked at is rtc-cmos:
> > > > > > it has no .acpi_match_table[], and the rtc-cmos device is instantiated
> > > > > > from arch/x86/kernel/rtc.c.
> > > > > >
> > > > > > For drivers with only an .of_match_table(), and no legacy users
> > > > > > instantiating platform devices, we do have dependencies on OF.
> > > > >
> > > > > This is not true. Entire IIO subsystem is an example.
> > > >
> > > > Do you care to elaborate?
> > > > Three quarters of the IIO drivers are I2C and SPI drivers, and thus not
> > > > subject to the above.
> > >
> > > It seems I missed that you are talking about platform device drivers.
> >
> > OK.
> >
> > > In any case it's not true. We have the platform drivers w/o legacy
> > > users that are not dependent on OF.
> >
> > Example? ;-)
>
> i2c-owl.c

I2C_OWL depends on ARCH_ACTIONS || COMPILE_TEST

(arm32) ARCH_ACTIONS depends on ARCH_MULTI_V7
                     depends on ARCH_MULTIPLATFORM
                     ARCH_MULTIPLATFORM selects USE_OF
                     USE_OF selects OF
ARCH_MULTI_V7 selects ARCH_MULTI_V6_V7

(arm64) ARM64 selects OF

so we do have a dependency on OF, unless we're compile-testing.

> > > They may _indirectly_ be dependent, but this is fine as I stated above
> > > when suggested to move ACPI dependency on ARCH_xxx level.
> >
> > As per the response from the driver maintainer
> > https://lore.kernel.org/linux-arm-kernel/bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com/,
> > there is no dependency on ARCH_HISI, so moving the ACPI dependency
> > up won't help.
>
> So, an ACPI dependency is simply not applicable here as it's a compile
> dependency as well, which is not a limitation for this driver. Again,
> talk to Masahiro how to handle this, but I don't see any good
> justification to have ACPI (compile time) dependency here. So, again
> NAK!

Please tell me how this driver will be probed when CONFIG_ACPI
is disabled (it cannot, as nothing instantiates platform devices of the
right type, so there is no reason to bother the user with a question about
this driver when configuring his kernel).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
