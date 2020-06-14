Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54891F88CB
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 14:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgFNMm3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 08:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgFNMm2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 08:42:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BE7C05BD43;
        Sun, 14 Jun 2020 05:42:26 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jz3so5598969pjb.0;
        Sun, 14 Jun 2020 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AVycbdSIC92oMinsx/ttQrX35tvkIpw/xpSxCRvXai4=;
        b=UE8KbyWRPhTnXkofLsXPmVCp3QB7wOYv7vSQAKjtCFlZMEgGtaCXto6Bygk7rJzUQb
         POTOOU5bSEO1EWvJgKIHU51KUtGwbPwEdzbV9NEobxZE6AIkPn8vtsTdrP8agN/44BWp
         BUhy933NXWDBOdKN550tgVB/dnyEwsliWvC/RipwZMDprRI308TPHPsmcHiRxYVgqhe2
         p1ghAjtCyWsAEstqQ5lwphlsZExuyroApMHF1O725zsBeXI3Od/WED6GIS3fXGYm5D89
         PlWuj9IxY3IQsRuhryPr/8sFUYpFVCP1FmTuzcUnsToNj8OXUm9ol9IXAFBSx3ab8ILG
         bGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVycbdSIC92oMinsx/ttQrX35tvkIpw/xpSxCRvXai4=;
        b=n6JdSgsf/d6IxiA29GUOccSX7iB3O1g/ch9DIDjo9l3xrvoaV2CDybU9Z2n8CLhKJN
         DEUmcxje/6M8cWlCXBAYPBDZhrMuZOK5ELKbqj2XkoVTqOsx/IOEbqFUdPlfFysr+3UL
         DSmvbRz/epM2aVb2KCCSPEbQsHLp8YymNezJUoKN8+/XSd/R0q3uuEB9fKAL9vfUkpFR
         JhzKLFURHtfelRddoMJnvN2HEzSU3M4hmIFJmcvDzVub+x7WKlUI+mNQOzlS8DKIhCKP
         CvjuVTNL8MiALlZ8R4mGBfi9nXyBAedBG7gTYq4z/ODaTUVLmYxApYahDdv58libw50R
         F87g==
X-Gm-Message-State: AOAM531KtTqi1y/x2FskLAxHdqbDYDrfylWkVZ8fUVgERkkuOeKz1P/D
        kPiWclyoaURwiF3zOYdYeB2RiLmac6g9JfXhyJA=
X-Google-Smtp-Source: ABdhPJwLu7V93VA9/SIlJB0fEtzGPFnR0p30cMfiZFMZ0zToSaDQBRqqX7PekXSoi4sqPtJbAjv/Ev8+n7rsbldtGIM=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr7332787pjr.181.1592138544231;
 Sun, 14 Jun 2020 05:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai> <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com> <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jun 2020 15:42:07 +0300
Message-ID: <CAHp75VekhzjoGzKp2+fdsxhJOuUFanPz=LCC4JGWJwCqqPrfVw@mail.gmail.com>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 14, 2020 at 1:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Andy,
>
> On Sun, Jun 14, 2020 at 11:43 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Jun 14, 2020 at 12:34 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Sun, Jun 14, 2020 at 12:10 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > > both in the I2C subsystem and also for Renesas drivers I maintain, I am
> > > > starting to get boilerplate patches doing some pm_runtime_put_* variant
> > > > because a failing pm_runtime_get is supposed to increase the ref
> > > > counters? Really? This feels wrong and unintuitive to me.
> > >
> > > Yeah, that is a well known issue with PM (I even have for a long time
> > > a coccinelle script, when I realized myself that there are a lot of
> > > cases like this, but someone else discovered this recently, like
> > > opening a can of worms).
> > >
> > > > I expect there
> > > > has been a discussion around it but I couldn't find it.
> > >
> > > Rafael explained (again) recently this. I can't find it quickly, unfortunately.
> >
> > I _think_ this discussion, but may be it's simple another tentacle of
> > the same octopus.
> > https://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/
>
> Thanks, hadn't read that one! (so I was still at -1 from
> http://sweng.the-davies.net/Home/rustys-api-design-manifesto ;-)

This one seems the starting point:

https://lkml.org/lkml/2020/5/20/1100

> So "pm_runtime_put_noidle()" is the (definitive?) one to pair with a
> pm_runtime_get_sync() failure?

Depends. If you are using autosuspend, then put_autosuspend() probably
is the right one.

> > > > I wonder why we
> > > > don't fix the code where the incremented refcount is expected for some
> > > > reason.
> > >
> > > The main idea behind API that a lot of drivers do *not* check error
> > > codes from runtime PM, so, we need to keep balance in case of
> > >
> > > pm_runtime_get(...);
> > > ...
> > > pm_runtime_put(...);
>
> I've always[*] considered a pm_runtime_get_sync() failure to be fatal
> (or: cannot happen), and that there's nothing that can be done to
> recover.  Hence I never checked the function's return value.
> Was that wrong?
>
> [*] at least on Renesas SoCs with Clock and/or Power Domains.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
With Best Regards,
Andy Shevchenko
