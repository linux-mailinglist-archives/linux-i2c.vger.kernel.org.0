Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DF71F942E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 12:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgFOKCL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 06:02:11 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39632 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgFOKCK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 06:02:10 -0400
Received: by mail-ot1-f67.google.com with SMTP id g5so12649065otg.6;
        Mon, 15 Jun 2020 03:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fOz1me3tEyfQcfTg4ZyKZ8THCW0372Y4WMY0ZzIBLGQ=;
        b=cHugnrSVAgRvwyjjhHT5HeVX1sKTA11PwYWDsayAJE+SLfOXYgRRkXX5Ygf3FJIUoH
         3gOdE1OfgFD4Jtnlb7/KBREkQBmtQ+TkxvmErHLCEfOEBSeQ58mArYOSJ26NOpMP7nFP
         l6zYA7sIusitqm8RdJJuAu88yfgXANv2DQOwUliRP9Ktqg51qeaEUcXYOjsAPikcsJu9
         gkdjojYp9ltJqZLWcwwYj9H5JGvhFvMrMvge8er6eASe+k8Bb49XzEQtZlV7pdeplblQ
         UH3C6PComWV/8PYcwAJuKkpOVf9G/4ROxBuAwss3NItWxgXKIa9xioHY4g53z1tsufW/
         q89Q==
X-Gm-Message-State: AOAM533xVIjRpFw3r1LtL9yEQw1OMMBmCwGgKfAdg3lZEUNuisLnptmC
        IkrGNIVwsWkPB89cfAMJPwp2Mkb28WPKRi6cc9Q=
X-Google-Smtp-Source: ABdhPJxUFOF6Dbnsm1uhpOY8sjQslHcWeeLT0EXQ7IfN+mhp6kPF4THUcEmzuJJXEfV9hNkMnqjhIRmufoKapTW9/qE=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr20188569otk.145.1592215329884;
 Mon, 15 Jun 2020 03:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu> <20200614093131.GD2878@kunai>
In-Reply-To: <20200614093131.GD2878@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Jun 2020 12:01:58 +0200
Message-ID: <CAMuHMdWA82HpLAjYBK0fHm=wTM3LGjKn_c9KRH1EZTi8UznrBw@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram, Uli,

On Sun, Jun 14, 2020 at 11:31 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, Jun 10, 2020 at 09:33:11PM +0200, Ulrich Hecht wrote:
> > Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> > similar boards.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
>
> Thanks, Uli! Works fine here. Really nice to finally being able to
> reboot now without WARNings.

> > -     pm_runtime_get_sync(pd->dev);
> > +     if (!pd->atomic_xfer)
> > +             pm_runtime_get_sync(pd->dev);
>
> This was a small surprise to me. I assume RPM is disabled that late?
> But can we be sure the clock is on, then?

And the power domain, as this is for i2c-sh_mobile.c.
On SH/R-Mobile SoCs, the i2c block is part of a power area.
Most are part of A3SP (which is never really disabled due to being
shared with other devices), or C5 (always-on), but i2c0 on R-Mobile A1
is part of A4R, which is usually suspended.

Uli: can you check if atomic transfers work with the touchscreen or
codec on Armadillo-800-EVA?

Thanks!


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
