Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293CB1F8918
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 15:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgFNN73 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 09:59:29 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43553 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgFNN72 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 09:59:28 -0400
Received: by mail-oi1-f193.google.com with SMTP id j189so13424045oih.10;
        Sun, 14 Jun 2020 06:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=233qwlac7lV7KoqxYlqhSajK4Yb8g+fjpSk+cJ2lV3c=;
        b=bbesngi9tm9Nlv5RumNBfZ1BMetybLQYp/R5aJE8Cr0pDFcFmyVSdjqa+QajAmqxWg
         MneElEC/3pvgr4RXVE+hXbBLxCvS+bipkS0J45+WeCuyXu2lZmkDxUdG1j5fzAYfRDOJ
         vZ9K5r1CKVdup6g6UpxjJ2GDZv/P+8S6rSK0paGyDPpItBjFvis5GvqUBlsDeBcSsB4o
         2K42bVvt4HyqXhwsUZjehu8JzpkgYPImOfdcYjjrh9JjxwOzPWmdIn90DucL6l42TIh8
         LN4pVOO5kFSHpIrYQYsekLyXMZV3O6YULik5aHt6kuq1f/m4cDOMUVISqkN+GL9xy8aA
         KzgQ==
X-Gm-Message-State: AOAM532pPPngTG6q6EhHE5ZLj0Y7Q21we8KavuzIUZNECZmxahQNzNF/
        gZLQwDV1UGhJU+iGBvCVy2Smlp6t5ll7jhRAuVdmvA==
X-Google-Smtp-Source: ABdhPJyfwXKk52STygbubTR3u0kDWtRZp1jJJv1JlZQ0lV3IeF+8OLUXHMHQ/dyO/x5fIcXqcW3iePfjkqU3l23qxt4=
X-Received: by 2002:aca:ad88:: with SMTP id w130mr6009881oie.103.1592143166177;
 Sun, 14 Jun 2020 06:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai> <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com> <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Sun, 14 Jun 2020 15:59:15 +0200
Message-ID: <CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com>
Subject: Re: RFC: a failing pm_runtime_get increases the refcnt?
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
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
>
> So "pm_runtime_put_noidle()" is the (definitive?) one to pair with a
> pm_runtime_get_sync() failure?

If you bail out immediately on errors, then yes, it is.

If you'd rather to something like

        ret = pm_runtime_get_sync(dev);
        if (ret < 0)
               goto fail;

        ... code depending on PM ...

fail:
       pm_runtime_put_autosuspend(dev);

then it will still work correctly.

It actually doesn't matter which pm_runtime_put*() variant you call
after a pm_runtime_get_sync() failure, but the _noidle() is the
simplest one and it is sufficient.

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

No, it wasn't.  It is the right thing to do in the majority of cases.

> [*] at least on Renesas SoCs with Clock and/or Power Domains.

Cheers!
