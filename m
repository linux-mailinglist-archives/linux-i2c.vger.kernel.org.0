Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B85D35FB33
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 20:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhDNSz6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 14:55:58 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:41929 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbhDNSzy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 14:55:54 -0400
Received: by mail-vs1-f53.google.com with SMTP id d6so4614106vsm.8;
        Wed, 14 Apr 2021 11:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDx7IFzFbNF4WMP2mx+Hw6xcynD3Q9TxLvkPpdtYDFs=;
        b=hlzbTA9y3HQaX2qqqZr40cDq7XVyKyOPWEeuw1TF+scdfWSOwGa6a1IqOeHSJNxTzr
         /zYMkVVMpJ88Q/gEDLsbohEvQx+h8+lkDbD0z3HMkYKKgGW4o5pDKYNl29tT2LTpFMKD
         UJua0J5jfyT2wjY7HB17Cr2OS7Q0GGJ6P6hBZNB3QmoN6gKx013g/X/6bzmQGjnJDjUu
         LdgwCER+4QXR73QIww9atNnJvGsn6+zrZsU3NkiFzFTGZPThEPN4lb5JRxoZ8b8CK979
         Jlz+IL/UrsUpbicuirkoBT+tj/QHXyJOvry5lfG8gNHvpbnX1gunaZFHGDRI2pzq5LI6
         Cqtw==
X-Gm-Message-State: AOAM530XScsMlQr5YDV+kNo75OY8ug58wgOadSnT+uf9VJx1kPtlAkBt
        IjNqsUbDoaE+4XH9HaEfDu3dCmC1ZiFthMWHHrc=
X-Google-Smtp-Source: ABdhPJx+lVi5MMpMfqxIsryWV08wIv2Tw2CTnabB/xHTGDXEoyE7VxTc27j/BZgOr3ruayvj9cyClKNuBIo1jZ0bdrQ=
X-Received: by 2002:a67:80c4:: with SMTP id b187mr29879559vsd.42.1618426532819;
 Wed, 14 Apr 2021 11:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
 <bd8db435-24e1-5ab3-6b35-1d4d8a292a7e@hisilicon.com> <CAMuHMdVouD+e4GpN_Dur8HSop4B8HVosGSYw7vfTpBEi_inMbw@mail.gmail.com>
 <YHcx+QPbkTA0bv9V@smile.fi.intel.com>
In-Reply-To: <YHcx+QPbkTA0bv9V@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Apr 2021 20:55:21 +0200
Message-ID: <CAMuHMdUkDcdZk5YYnkMH+VD4JXFq4khR2dn8wBdSXs1GCT9UMQ@mail.gmail.com>
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

On Wed, Apr 14, 2021 at 8:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Apr 14, 2021 at 08:06:18PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Apr 14, 2021 at 11:24 AM Yicong Yang <yangyicong@hisilicon.com> wrote:
> > > On 2021/4/13 20:26, Geert Uytterhoeven wrote:
> > > > The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> > > > Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> > > > Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> > > > about this driver when configuring a kernel without Hisilicon platform
> > > > or ACPI firmware support.
> > >
> > > this is a public IP which doesn't specifically depend on ARCH_HISI. I'm
> > > not sure all the platform this IP on has ARCH_HISI configured. The driver
> > > will not be compiled by default config. This is not correct to have
> > > this dependence.
> >
> > Thanks for your answer!
> >
> > I guess it's still fine to add a dependency on ACPI?
>
> But why?

Please tell me how/when the driver is used when CONFIG_ACPI=n.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
