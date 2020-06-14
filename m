Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7896C1F8870
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 12:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgFNKoy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 06:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgFNKox (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 06:44:53 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFDFC05BD43;
        Sun, 14 Jun 2020 03:44:53 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id g12so5597125pll.10;
        Sun, 14 Jun 2020 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wUcOt819f+ivq40xZB6TcXygEQX1UsKoHGTk/MjKzJU=;
        b=ePjBDxUn9MITBDP0cVwxArkF7+p30KQt5PvIfsDC3J0xIiaDpKlDvGoGB1Ft5lRS+v
         bbkXm3tDwD3EumIViK+w0W7ZJn3EayMJYL7Cq0fWjQ2pfl60+aP4S6YRPurlFfnbxY1n
         5b/CUzlG2WYHjBJTGthjpHL1bYz0zfTloltz8sBV6pTGCGYcgzl6dReqNzA+z4iXJBff
         fbHwtYjAKfYLiBxxE+SgoVdNTkiKZwVyMCPC8OnLf+uoCt999cpbpqVanC/vF1QNgaiE
         kJXznFfMNyGs/p+C54ZCeX7xkhVFywdgQTfVp4Ufc+dI1LfYikzWoP2dguNmPe/N0Z9+
         T25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wUcOt819f+ivq40xZB6TcXygEQX1UsKoHGTk/MjKzJU=;
        b=Q0jOUrKzuhJRIwuKc6phtpczziDxpq0ZWL7Hc1VfP6DSGBLNIyoEK/RXXu808SUk45
         Yol5D8vf4hR7unaGYkij7zuJ98LpKVDGt1h3s5ELP99wewuPy/3k45BWxNHFVxlhYAjg
         762s4oBTpcFaQSiuBsdGt7M3mAR+OODqZR5Z7iaeXzO1TKvnz84iONEQO8RL4sps/eTX
         hponN2WEfnPXNpqLMSOpzo6fNOi5Fx6rB+wNpr4EruzW9eSy9ZB7uzj7DfoXqGiwe2nC
         byIThLCwlD6deY7EVeK5Ozx+wS+aZApSIGikpmbaFgeKt9Ofr+kNiod2Ah1xHvJrXU/E
         GHBg==
X-Gm-Message-State: AOAM531iwcACUsdP+DeyZV0xKLy/rvtBlz5GIAHb14WcDPwLhJS9uq23
        rjKQYVnBcv2yej1v1b+bLksa1243Y6YYuhuI/5s=
X-Google-Smtp-Source: ABdhPJyEneOgBpKPU02VqOu7ehOjUCszRfNogXdrDsoroRhDEDHiX2u0BSC4LlPgZS77fv2NEI7b29aR2Fh4/J2e5Wc=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr6965711pjr.181.1592131492548;
 Sun, 14 Jun 2020 03:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200614090751.GA2878@kunai> <CAHp75Vc2RV1daOHMM1zAT2P_YpFzYq=_NVXnagq7qBCS9En04g@mail.gmail.com>
 <CAHp75VdtJN4KbsWgP3G40P4giPGgPE6gdr0CDqOXQjp2wK+i+g@mail.gmail.com>
 <CAMuHMdUadYRNYdJ9JUX90Z1jvtHZmSS4gM+JKft4x-BK2Ry4zQ@mail.gmail.com> <CAMuHMdVJToSg_a3wQCV3ALyX5bHKsYRjyT1KrCtSgqxDgaFo2g@mail.gmail.com>
In-Reply-To: <CAMuHMdVJToSg_a3wQCV3ALyX5bHKsYRjyT1KrCtSgqxDgaFo2g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jun 2020 13:44:35 +0300
Message-ID: <CAHp75Vc5DTnERihke4radxjHmRXzpTJGvD+-G1YnRBBnzDALkg@mail.gmail.com>
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

On Sun, Jun 14, 2020 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Jun 14, 2020 at 12:00 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Sun, Jun 14, 2020 at 11:43 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sun, Jun 14, 2020 at 12:34 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > On Sun, Jun 14, 2020 at 12:10 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > > > both in the I2C subsystem and also for Renesas drivers I maintain, I am
> > > > > starting to get boilerplate patches doing some pm_runtime_put_* variant
> > > > > because a failing pm_runtime_get is supposed to increase the ref
> > > > > counters? Really? This feels wrong and unintuitive to me.
> > > >
> > > > Yeah, that is a well known issue with PM (I even have for a long time
> > > > a coccinelle script, when I realized myself that there are a lot of
> > > > cases like this, but someone else discovered this recently, like
> > > > opening a can of worms).
> > > >
> > > > > I expect there
> > > > > has been a discussion around it but I couldn't find it.
> > > >
> > > > Rafael explained (again) recently this. I can't find it quickly, unfortunately.
> > >
> > > I _think_ this discussion, but may be it's simple another tentacle of
> > > the same octopus.
> > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/
> >
> > Thanks, hadn't read that one! (so I was still at -1 from
> > http://sweng.the-davies.net/Home/rustys-api-design-manifesto ;-)
> >
> > So "pm_runtime_put_noidle()" is the (definitive?) one to pair with a
> > pm_runtime_get_sync() failure?
>
> My biggest worry here is all those copycats jumping on the bandwagon,
> and sending untested[*] patches that end up calling the wrong function.
>
> [*] Several of them turned out to introduce trivial compile warnings, so
>     I now consider all patches authored by the same person as untested.

That's always a problem with janitors like patches...
Once I tried to ask them to provide a testing material, but...
 - some maintainers just accept them without asking questions
 - some maintainers even defend them that they are doing a good job
(and LWN top contributor statistics also motivate some of janitors,
though I consider it not the best metrics)
 - practically almost no contributor answered to my queries, so, I
consider all of them are untested independent to the name (if name
appears in more than dozen patches, esp. in different subsystems)
 - and yes, it's a trade-off, some of the patches indeed useful.


-- 
With Best Regards,
Andy Shevchenko
