Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41849202A5B
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Jun 2020 13:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729958AbgFULj2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Jun 2020 07:39:28 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:45311 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729930AbgFULj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Jun 2020 07:39:27 -0400
Received: by mail-oo1-f67.google.com with SMTP id k7so2787733ooo.12;
        Sun, 21 Jun 2020 04:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UENMlWq6XicoA48kH9/r/2Fxl4sDBpygP0k0UnTdon4=;
        b=LcLJfSmqh3QHHXbi66A1HdTdEmO6ku3Q71N7jB+EyP9PUQysoZTSdDIv9cs928gfoH
         dtSJDSCHK1ZEVXd4DyBA0PiL4J96VmLID6mNjmgdZX+vEYrfOSPjj6uxNhT009PAWwdL
         1KawyCf+M6ESTI7GP7+HA64PZhFIwK/tO1dQGQ7Xdo++2Txm8qW9zC8Y0rCuD4Nh57v0
         LsyynznXo1yyvG5Ys8k/ceSG8UjrUzmwI7LBXirtM20s/9hmxvQSWL5lC0I6Qf9ejbKs
         M1XVW6lrELeZvlPFV+U8IHmG5oaXqAyMTMr4Yb9Rg3xwzgMdx/br0MC0Ukrr1XHUD/Pz
         WfKQ==
X-Gm-Message-State: AOAM530Xa2ALz4I+7Cg44hkViKRpi2opTvxsQ9So/h/HL5Vdkzmm17sC
        u10o77k1LGiwzqdLmzISvKqd28HwvGYvZuz7e9hq712N
X-Google-Smtp-Source: ABdhPJye3hgRcqKGhZbfAlQsGI37kyvfoCHeK9ow+/5fqilGLUrwanYCUNnnqQraeOXFgKPLHv4nR/CEu7q6F9jg5hE=
X-Received: by 2002:a4a:5744:: with SMTP id u65mr10266535ooa.1.1592739566301;
 Sun, 21 Jun 2020 04:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150532.2923-1-uli+renesas@fpond.eu> <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
In-Reply-To: <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 21 Jun 2020 13:39:15 +0200
Message-ID: <CAMuHMdVcfE9MRB-wh6Op-Juhhd1XG4vmf4eVNhBcUvQs1Zz8AA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Jun 18, 2020 at 6:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jun 18, 2020 at 5:05 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> > similar boards.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/i2c/busses/i2c-sh_mobile.c
> > +++ b/drivers/i2c/busses/i2c-sh_mobile.c

> > @@ -637,15 +643,13 @@ static int poll_busy(struct sh_mobile_i2c_data *pd)
> >         return i ? 0 : -ETIMEDOUT;
> >  }
> >
> > -static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
> > -                             struct i2c_msg *msgs,
> > -                             int num)
> > +static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
> > +                        struct i2c_msg *msgs, int num)
> >  {
> > -       struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
> >         struct i2c_msg  *msg;
> >         int err = 0;
> >         int i;
> > -       long timeout;
> > +       long time_left;
> >
> >         /* Wake up device and enable clock */
> >         pm_runtime_get_sync(pd->dev);
>
> pm_runtime_get_sync() is a wrapper around __pm_runtime_resume(), which
> does:
>
>         might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
>                         dev->power.runtime_status != RPM_ACTIVE);
>
> So if the device is not active (it is not), the might_sleep() is
> triggered, and I expect a BUG splat.
> However, with CONFIG_DEBUG_ATOMIC_SLEEP disabled (I disabled it on
> koelsch, as it increases kernel size beyond the bootloader limit),
> might_sleep() is a no-op, so nothing happens.
> After enabling it (and disabling drm and media), still nothing...
>
> It turns out ___might_sleep() does:
>
>     if ((preempt_count_equals(preempt_offset) && !irqs_disabled() &&
>          !is_idle_task(current) && !current->non_block_count) ||
>         system_state == SYSTEM_BOOTING || system_state > SYSTEM_RUNNING ||
>         oops_in_progress)
>             return;
>
> and as per:
>
>     static inline bool i2c_in_atomic_xfer_mode(void)
>     {
>             return system_state > SYSTEM_RUNNING && irqs_disabled();

So i2c atomic transfers are really meant to be used during late system suspend
only, and not in atomic context before, when irqs_disabled() is true?

>     }
>
> system_state > SYSTEM_RUNNING, and ___might_sleep() just ignores any
> issues. Oops...
> After removing that check, it starts complaining:
>
>     BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:281
>     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1, name:
> systemd-shutdow

Perhaps we need a checker config option, to make sure the atomic transfer
operation is exercised at least once during boot?
I guess scanning the i2c bus is an unsafe operation, but there may be
something we can do in a safe way, without side effects (e.g. redoing
the first i2c read message using atomic transfers)?

Cfr. CONFIG_ARM_PSCI_CHECKER, which cycles through hotplug and suspend
operations during boot.

> In general, pm_runtime_get_sync() is not safe to call from atomic
> context.
> For Renesas SoCs, I think both the power and clock domains are safe, as
> the respective drivers don't sleep.  The PM core might, though.

Do we need a way to let i2c slaves indicate they plan to use atomic
transfers later, so the i2c core can keep the i2c controller resumed?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
