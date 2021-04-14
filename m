Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31FD35FB95
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 21:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349281AbhDNTWM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 15:22:12 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:40486 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345520AbhDNTWM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 15:22:12 -0400
Received: by mail-ua1-f43.google.com with SMTP id 33so6750182uaa.7;
        Wed, 14 Apr 2021 12:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+tmZI5JiTVWm421cIPTsk+PGdNmsovX4NE2wqukjp8=;
        b=NYbAlfcsB1+PePQwoubcuMaK4skNyTEp8F2DsczMW0Imq0eMa8Qjx0RqcTLyZIyfZD
         Kh2NhTmtJcqrUJGbD4HE8F9YljpdCHvAfGyOiUdikEowaAAd1v2Oxu9OBmszTXkTmDua
         dQOrJ+kR8HQTKVoaQGRNEFs6GunFZEQvuDzgy600yq5fUcjKUy99v6Y1AE59BpTJpbDk
         EsEL1UjIcvMdapLCAATPnMlOw7xGnxn8Pr3RoAoX87yU8Rn6GCHdClajMFyOYMWFNhae
         wwC6LIhT+nEbY5pgwmTUzrZHDewuKE1Fq86Ng9ioyuLjWEaXMLU9JB6KraspfP7+K9Tb
         p8OA==
X-Gm-Message-State: AOAM530RvbecmwShCrau5bBJDyxzhu/wDcSE6jp5D2lm7EXHA5Hbfaps
        vkBj9nxmvHf2S3hiY+kQasNsfkHr81rrsnQCYq0=
X-Google-Smtp-Source: ABdhPJxMt8XdUVgQ883P3bgnbatYcWMTY60i2JEfJnr9k8/d1RhEdoFYRNUQ7dHItoAICruEUDdtFNDUHNXGETbY1VI=
X-Received: by 2002:a9f:3852:: with SMTP id q18mr19839105uad.58.1618428110127;
 Wed, 14 Apr 2021 12:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com>
In-Reply-To: <YHc+/MOWA6rO+1Wy@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Apr 2021 21:21:38 +0200
Message-ID: <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
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

On Wed, Apr 14, 2021 at 9:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> > > > > On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> > > > > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > > > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > > > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > > > > about this driver when configuring a kernel without Hisilicon platform
> > > > > > or ACPI firmware support.
> > > > >
> > > > > this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
> > > > > not sure all the platform this IP on has ARCH_HISI configured. The driver
> > > > > will not be compiled by default config. This is not correct to have
> > > > > this dependence.
> > > >
> > > > Thanks for your answer!
> > > >
> > > > I guess it's still fine to add a dependency on ACPI?
> > >
> > > But why?
> >
> > Please tell me how/when the driver is used when CONFIG_ACPI=n.
>
> I'm not using it at all. Ask the author :-)
>
> But if we follow your logic, then we need to mark all the _platform_ drivers
> for x86 world as ACPI dependent? This sounds ugly.

Do all other x86 platform drivers have (1) an .acpi_match_table[] and
(2) no other way of instantiating their devices?
The first driver from the top of my memory I looked at is rtc-cmos:
it has no .acpi_match_table[], and the rtc-cmos device is instantiated
from arch/x86/kernel/rtc.c.

For drivers with only an .of_match_table(), and no legacy users
instantiating platform devices, we do have dependencies on OF.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
