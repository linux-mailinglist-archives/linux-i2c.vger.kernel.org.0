Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C69364584
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbhDSN7T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 09:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhDSN7T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 09:59:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDCDC06174A;
        Mon, 19 Apr 2021 06:58:48 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so20420824pjb.4;
        Mon, 19 Apr 2021 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hrErBjqIhLR1NMARNSCXaCw7wVsezhRfPZ7NPUo9T44=;
        b=QTcdW+RdjhiuiNSrZicZQ1PD6s8mFBsVa6lfDiCBbecmijJWWda3TeR6o8lZHTO12X
         4o9jxe5SA6liV9FpL/eUoWA6sSTvJsUyUfuhUlQf2WqffnOudJ92JPmsSno/Wiw25f8W
         ZcmpeyBnn4bCHHjr6dLqoc5kRmcOJ9mCDBkiBviiYf8+gKz7zqS2kIOOii7Ww42HXf1n
         JCXoRhDM7PGyTu4gio4Emz613wGiu2u5q3s1aJge1bkGZmrMF68ILcppGvYluAGXYN3S
         pk0XusQ83cqm85QdnPcesjiARxsNvkR11zv8tvdiswI3FGvcKjLpjThG2nziAaOz7ixC
         3L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hrErBjqIhLR1NMARNSCXaCw7wVsezhRfPZ7NPUo9T44=;
        b=cJtMZGRvztEf4N1/1DwzLFAeMYvojE3wMajR+C3YUnez+5EtxtRKoi7AOHNWa+tIXy
         bV41vF98pJLMCmKYNor68BxkGFlgOgOzl/BbI/DdsTegAhJlXv6tc+BOCHm3aRofnVHK
         VM6mozUtAXheIbYEnHfBVK7iRSWSfRt17wTlJKbhp4U5zZ7IfLNABkFz7L9rssMbxcMq
         pZKTZc6Lw3abdZIfBmc2aQ0nsIzQY08fbZZjSR6hn9ScBC0W5R4rAMQt3LE6rBjSZt8p
         RR3+SHbsP7eh0rxkNHMGed0jE+l3q1UMAbaSiPK8OKthCSEzX2wHvTNLECIbVSzQ6D4z
         fh1Q==
X-Gm-Message-State: AOAM532VSMhtjakbEZ3P1pfd6SBHztHSrmLyHaSAdaJ8ziP+aOqkBzJ5
        cJrx6cZoihd5O6rtthUV5h/JN+8PdnN0M/yDPEk=
X-Google-Smtp-Source: ABdhPJxVqgyffgGJgwmb7cjchTEMqtO+tcKar/5cM71i6OYS6lGRbyirtGZXP3efsqixMTlnCrNmBsaWjQGt6CJrGn0=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr23402070plc.0.1618840727994; Mon, 19 Apr
 2021 06:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com>
 <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
 <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com> <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com>
In-Reply-To: <CAMuHMdU5AVdq5fubt69u6cOBJR8gwi=LcmePf46yi9_1srtsGA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 16:58:32 +0300
Message-ID: <CAHp75VdbYSD=unX4bbiWFXYPJJbW5b_j0kUO7S-HbO2btDvipw@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
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

On Mon, Apr 19, 2021 at 4:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Apr 19, 2021 at 3:35 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Apr 19, 2021 at 4:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Apr 15, 2021 at 10:50 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Apr 15, 2021 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, Apr 14, 2021 at 9:14 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> > > > > > > On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> >
> > ...
> >
> > > > > > > > > I guess it's still fine to add a dependency on ACPI?
> > > > > > > >
> > > > > > > > But why?
> > > > > > >
> > > > > > > Please tell me how/when the driver is used when CONFIG_ACPI=n.
> > > > > >
> > > > > > I'm not using it at all. Ask the author :-)
> > > > > >
> > > > > > But if we follow your logic, then we need to mark all the _platform_ drivers
> > > > > > for x86 world as ACPI dependent? This sounds ugly.
> > > > >
> > > > > Do all other x86 platform drivers have (1) an .acpi_match_table[] and
> > > > > (2) no other way of instantiating their devices?
> > > > > The first driver from the top of my memory I looked at is rtc-cmos:
> > > > > it has no .acpi_match_table[], and the rtc-cmos device is instantiated
> > > > > from arch/x86/kernel/rtc.c.
> > > > >
> > > > > For drivers with only an .of_match_table(), and no legacy users
> > > > > instantiating platform devices, we do have dependencies on OF.
> > > >
> > > > This is not true. Entire IIO subsystem is an example.
> > >
> > > Do you care to elaborate?
> > > Three quarters of the IIO drivers are I2C and SPI drivers, and thus not
> > > subject to the above.
> >
> > It seems I missed that you are talking about platform device drivers.
>
> OK.
>
> > In any case it's not true. We have the platform drivers w/o legacy
> > users that are not dependent on OF.
>
> Example? ;-)

i2c-owl.c

> > They may _indirectly_ be dependent, but this is fine as I stated above
> > when suggested to move ACPI dependency on ARCH_xxx level.
>
> As per the response from the driver maintainer
> https://lore.kernel.org/linux-arm-kernel/bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com/,
> there is no dependency on ARCH_HISI, so moving the ACPI dependency
> up won't help.

So, an ACPI dependency is simply not applicable here as it's a compile
dependency as well, which is not a limitation for this driver. Again,
talk to Masahiro how to handle this, but I don't see any good
justification to have ACPI (compile time) dependency here. So, again
NAK!

-- 
With Best Regards,
Andy Shevchenko
