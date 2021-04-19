Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CE5364247
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 15:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237956AbhDSNDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 09:03:21 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:40559 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhDSNDS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 09:03:18 -0400
Received: by mail-ua1-f46.google.com with SMTP id 33so10885690uaa.7;
        Mon, 19 Apr 2021 06:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dlYTi69m/lucb/NhBgsBMz9vGz1CoOt1FLG0EfInMDA=;
        b=Rt8Ev9ZeqpvLQ9rxlNJrkjpOid0d0n08NFDtadvS/T7qjGVm/0JfDcrH/zntjXF71B
         NnZdnZlvyuxamZ+w91TLWanBRMoKB1zA9vRsF4FaXrJpJxrudlOiwHvUe1hHbLmY7CEv
         GH0HeIMc91Mdja7u9frsh7O9QbLUbRB9X9HT6NnCyMvZUR5q1851FODlzVYaK1HIvuaj
         +xEaRttgGGJrfns3djX2tUCcdOcaBIgYvwbeFDPwlZ1Sn2oG6eDeR7merKBpxc7s3ooo
         Qi21gUNzM7dqh1l0z9JncPfQqowdqQSPWRwi+agiWQx96NdJy4birkGorEJgrGtLx6GP
         SKEg==
X-Gm-Message-State: AOAM531TYvBm/5+P2ByNv5xS2m1HSSvszc+4olQngqisQsYLw5WsbZEw
        GOt/VCqv7ihytyHMUVcQh3rCVIGodRDaqTcJE8M=
X-Google-Smtp-Source: ABdhPJz9Kxz4+ejzvydG/k+ZmWgbyoBOzyfzx61YEoFRlVktAwHjkfxBSE3792S3lKv1vU3pJtwyMTxmyHMxCOnnf4o=
X-Received: by 2002:ab0:6306:: with SMTP id a6mr6678856uap.2.1618837367038;
 Mon, 19 Apr 2021 06:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
In-Reply-To: <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Apr 2021 15:02:35 +0200
Message-ID: <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Thu, Apr 15, 2021 at 10:50 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Apr 15, 2021 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Apr 14, 2021 at 9:14 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
>
> ...
>
> > > > > > I guess it's still fine to add a dependency on ACPI?
> > > > >
> > > > > But why?
> > > >
> > > > Please tell me how/when the driver is used when CONFIG_ACPI=n.
> > >
> > > I'm not using it at all. Ask the author :-)
> > >
> > > But if we follow your logic, then we need to mark all the _platform_ drivers
> > > for x86 world as ACPI dependent? This sounds ugly.
> >
> > Do all other x86 platform drivers have (1) an .acpi_match_table[] and
> > (2) no other way of instantiating their devices?
> > The first driver from the top of my memory I looked at is rtc-cmos:
> > it has no .acpi_match_table[], and the rtc-cmos device is instantiated
> > from arch/x86/kernel/rtc.c.
> >
> > For drivers with only an .of_match_table(), and no legacy users
> > instantiating platform devices, we do have dependencies on OF.
>
> This is not true. Entire IIO subsystem is an example.

Do you care to elaborate?
Three quarters of the IIO drivers are I2C and SPI drivers, and thus not
subject to the above.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
