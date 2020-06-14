Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA971F8849
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 12:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgFNKAd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 06:00:33 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40685 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNKAd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 06:00:33 -0400
Received: by mail-ot1-f67.google.com with SMTP id s13so10813532otd.7;
        Sun, 14 Jun 2020 03:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4WULzJxTJOdxHO2znjN8tpLfUL4wqN9JR3P9Ps2LSWs=;
        b=YrVDWFHserxJQXNp0eapr0JjntpvJzBmaLHJ9ZAjBUx8uB4ikFjMR6NnbzruHX8fT+
         aIGh8ArGM5du8tGWH65rAqroTZuR1Nwu/O/keAU6LEvHfyL3buGw7veVOHxmx2Yrsuo3
         SjM6ZLqQdiK0LvHVW6epY9V9fwl63koUOv0IG7iplkWr7YV4U4LxKAFZmE1LuzR54zWj
         RQXhK8y/jfpGCzfwHcLWAkMY6vm0CbNcWiX+JsxAQg+feTuTL5pfiEP7VGxuqZGRdTeG
         kzEcp1CZjgaXloU8YnUKqkTZ7CuvAwN0Vs0aQEjMcyEz4Hzw7Tj6A5z6zU4WID3sDFuA
         bNTw==
X-Gm-Message-State: AOAM533oEMHQ0o/UdscF7mqiJvksYhyqxDh2FpCuBHa6XUHPbSCjSNJ8
        op5Lry8adsphmNwCUaoS0g2efiYuEYxqAPeN3zk=
X-Google-Smtp-Source: ABdhPJx+nkFLV4AUjP3DUSCpp2vLqWGs/IKyDEHdBbnTvsvC9X0tvruRQXWue33U3BVFSlOBUVK3ZsUxKhpSq48Hl48=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr17553666otp.250.1592128832339;
 Sun, 14 Jun 2020 03:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai> <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com>
In-Reply-To: <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 14 Jun 2020 12:00:21 +0200
Message-ID: <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com>
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

Hi Andy,

On Sun, Jun 14, 2020 at 11:43 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Jun 14, 2020 at 12:34 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sun, Jun 14, 2020 at 12:10 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > both in the I2C subsystem and also for Renesas drivers I maintain, I am
> > > starting to get boilerplate patches doing some pm_runtime_put_* variant
> > > because a failing pm_runtime_get is supposed to increase the ref
> > > counters? Really? This feels wrong and unintuitive to me.
> >
> > Yeah, that is a well known issue with PM (I even have for a long time
> > a coccinelle script, when I realized myself that there are a lot of
> > cases like this, but someone else discovered this recently, like
> > opening a can of worms).
> >
> > > I expect there
> > > has been a discussion around it but I couldn't find it.
> >
> > Rafael explained (again) recently this. I can't find it quickly, unfortunately.
>
> I _think_ this discussion, but may be it's simple another tentacle of
> the same octopus.
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/

Thanks, hadn't read that one! (so I was still at -1 from
http://sweng.the-davies.net/Home/rustys-api-design-manifesto ;-)

So "pm_runtime_put_noidle()" is the (definitive?) one to pair with a
pm_runtime_get_sync() failure?

> > > I wonder why we
> > > don't fix the code where the incremented refcount is expected for some
> > > reason.
> >
> > The main idea behind API that a lot of drivers do *not* check error
> > codes from runtime PM, so, we need to keep balance in case of
> >
> > pm_runtime_get(...);
> > ...
> > pm_runtime_put(...);

I've always[*] considered a pm_runtime_get_sync() failure to be fatal
(or: cannot happen), and that there's nothing that can be done to
recover.  Hence I never checked the function's return value.
Was that wrong?

[*] at least on Renesas SoCs with Clock and/or Power Domains.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
