Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B871F8855
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 12:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgFNKFB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 06:05:01 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39525 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNKFB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 06:05:01 -0400
Received: by mail-ot1-f67.google.com with SMTP id g5so10826515otg.6;
        Sun, 14 Jun 2020 03:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ectOhExww/8c3ivMz3pON3O/nzr9APMG9dSXhsot2VE=;
        b=bWYi+FGvNJZDX82AU6L/qLS3NgXl8D/jUk2mDLre/vwJPis0c4BwvqvuRhxbNqUX9t
         DDolpCvch07kJ88ghEnsucnh78ArsEzrMGDGkkX9ai2QBdpWTNb88KrBRhwOMyjF450x
         pQMKx1gcG3r1QjVTRk9pC6y3ruVRZeCnNdGupn0X/zbVrrT6OxtOEpJORdeo0Ercl6cw
         9uATufMEf8eL6b5wGQvhOgNc9L8MMhpPmtQKujKTxqmO345u8v+CxQ0ctu8uom9tw0ts
         3StjukAKQ7h4JvLvREjENeu1SMfcXK5Uexp+KD85+05jcrlyOtTg9LDsf11H4BS7q8nq
         qC2Q==
X-Gm-Message-State: AOAM530eSWq/6Cyw8pDdUlP33qXbxfTmPI8SK7/lE98W50QHP5TMeut1
        Z2GQTjAUQ6pw/48qHwSBt4JhF+IzgXrQQRzzDqW14A==
X-Google-Smtp-Source: ABdhPJxlnTLf+SDr2P6TSmSA3lnp6RmQZ/prmdpmxMkwlkZrO9ZSOchU0iJom+re8f6tI4RjdajCMx/q2p9Fv5S1hqw=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr17568846otp.250.1592129100501;
 Sun, 14 Jun 2020 03:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai> <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com> <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 14 Jun 2020 12:04:49 +0200
Message-ID: <CAMuHMdVJToSg_a3wQCV3ALyX5bHKsYRjyT1KrCtSgqxDgaFo2g@mail.gmail.com>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Sun, Jun 14, 2020 at 12:00 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
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
>
> So "pm_runtime_put_noidle()" is the (definitive?) one to pair with a
> pm_runtime_get_sync() failure?

My biggest worry here is all those copycats jumping on the bandwagon,
and sending untested[*] patches that end up calling the wrong function.

[*] Several of them turned out to introduce trivial compile warnings, so
    I now consider all patches authored by the same person as untested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
