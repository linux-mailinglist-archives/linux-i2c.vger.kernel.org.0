Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBD33644F2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Apr 2021 15:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241825AbhDSNgv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Apr 2021 09:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243074AbhDSNfX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Apr 2021 09:35:23 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B544DC06136F;
        Mon, 19 Apr 2021 06:32:08 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id d10so24255787pgf.12;
        Mon, 19 Apr 2021 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kOR2PfYqY3aE7YZ+9K1diisUOT0cVkWDrwVhNE+eH4=;
        b=AKksNNefRKsFqjYrEoAhPkPPJuOHS+SiQIap5HcuM74IbS89GX38/Vur9cBbjkaPQt
         DnUZTjEMyv8f3LcYU+XezP4SrDywa6TM5wUHG7FZqi1T67SxsclYJIg0xBhqI6dW5T60
         5KJxEBVEAfvEYtkzsYlhJCI+N4tdwX4aDi4DRsFHsHjTe5MBjaWNWlbLqfrRvL4G8N/z
         9PBJ7t5sb20SoGI51sFCMh2NHxU8LLGOy3kniYjqvm7KWXXPLpr1MGV7yH4JwIM8ypuQ
         aMmrLrUJQYaiupZffVrwD6+xqFCB3TTLG6LWlmhoaeaS0Na9y1qLtUZCNUnr05dlWRb7
         04Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kOR2PfYqY3aE7YZ+9K1diisUOT0cVkWDrwVhNE+eH4=;
        b=qr/pVtgnBNKe6wdgrR/0U30CMkUkd47KslJe5XsGQj/60sPc6rZp+oOK205g/cN5XO
         ZknHMQXibJ3UG8Fi5BqhYPIlmvZ7gFLpMMXyDAaV2anZahDCgnpG2V6qpRP6Bz9CcVGq
         sw2wA5+f+AeUoo9SvuqrVeMVrc4vHojx5LFWGuhOAVbzhXCFzg0KpP31uc/XBCqudf4I
         T3aIOkCvvEa0okgyOp50lKEXfJctD1QK4brRRtmrhXrvpe8wywI2xARPd0K5CW2iHQXH
         lds/ZLNinIdojbhvVjm45h191lat76R2BaaEH6ZFWcDJw+sponW1CgmoW+yBNjDhUbmQ
         lr7w==
X-Gm-Message-State: AOAM5300xEPq4hm0u5gUgTiQs6tHnTzvLMIREGPZnq/5zLz+6sqEVVaj
        OYBqj7JJmV69eToQxdNIrZxg7K4d6CmEGvUzTrc=
X-Google-Smtp-Source: ABdhPJwL0cR9Y7Ln8vvWKJ8/LOaI4peFBdcDR1DBBxi7+E86AUEZsiJcUAERErhkDEmEuRj5H45W/ksTLh466mp9p9o=
X-Received: by 2002:a63:a847:: with SMTP id i7mr7941013pgp.203.1618839128133;
 Mon, 19 Apr 2021 06:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com> <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
 <YHc+/MOWA6rO+1Wy@smile.fi.intel.com> <CAMuHMdWZz6QNQbN53Whjfi122PWesM4_+K0_m=np8L=E+=io6g@mail.gmail.com>
 <CAHp75VcFjRBO+0578jWam3+sc24KvKArTtQV+nRCCbV1E++Nsg@mail.gmail.com> <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
In-Reply-To: <CAMuHMdVu4VRgJzfM=P8OBi55rsCMFB1vmSepTvSyv1DLjw9Vcw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 16:31:52 +0300
Message-ID: <CAHp75Vcye9HPSoAkqiqnzgQ+8_SZ-W9gURWmWXd5s-y_fji5Ug@mail.gmail.com>
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, Apr 19, 2021 at 4:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 15, 2021 at 10:50 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Apr 15, 2021 at 3:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, Apr 14, 2021 at 9:14 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Wed, Apr 14, 2021 at 08:55:21PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > > > > > > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:

...

> > > > > > > I guess it's still fine to add a dependency on ACPI?
> > > > > >
> > > > > > But why?
> > > > >
> > > > > Please tell me how/when the driver is used when CONFIG_ACPI=n.
> > > >
> > > > I'm not using it at all. Ask the author :-)
> > > >
> > > > But if we follow your logic, then we need to mark all the _platform_ drivers
> > > > for x86 world as ACPI dependent? This sounds ugly.
> > >
> > > Do all other x86 platform drivers have (1) an .acpi_match_table[] and
> > > (2) no other way of instantiating their devices?
> > > The first driver from the top of my memory I looked at is rtc-cmos:
> > > it has no .acpi_match_table[], and the rtc-cmos device is instantiated
> > > from arch/x86/kernel/rtc.c.
> > >
> > > For drivers with only an .of_match_table(), and no legacy users
> > > instantiating platform devices, we do have dependencies on OF.
> >
> > This is not true. Entire IIO subsystem is an example.
>
> Do you care to elaborate?
> Three quarters of the IIO drivers are I2C and SPI drivers, and thus not
> subject to the above.

It seems I missed that you are talking about platform device drivers.
In any case it's not true. We have the platform drivers w/o legacy
users that are not dependent on OF.
They may _indirectly_ be dependent, but this is fine as I stated above
when suggested to move ACPI dependency on ARCH_xxx level.

-- 
With Best Regards,
Andy Shevchenko
