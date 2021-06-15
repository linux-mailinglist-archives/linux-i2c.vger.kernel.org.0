Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614E83A7894
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jun 2021 09:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhFOH6D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Jun 2021 03:58:03 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:37536 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhFOH6C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Jun 2021 03:58:02 -0400
Received: by mail-vs1-f49.google.com with SMTP id f21so9310826vsl.4;
        Tue, 15 Jun 2021 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tE3SXosNLpn5yVaRUohSzk0HRMUZqPAK6mLObQyUhZ0=;
        b=oeM6V/+zL29sGkA9QtnLhXrQbItQ6MZutEFB7jUhZhEmHPH/wBsL16bmA8WlTfMwHJ
         HbGjuFwjh7nNcRiuA5znXM2fnznMe7AJ/sNosDdtcl+7GD/ZM6+eo3nw1GhgzJsHs0vM
         B7GeexL6PJRrliPSHN+of3m6JP1Fjug15SHFa4exvpM7TMP+x9aROP97pYF7e405JBpR
         Xg0FnGbonXhRc2lQCrNMw3Orfhs9OIAuqIiEtnsq9K/4hAE4A4pWyzF+peTHQYOxMfg1
         aurhDpT0v3OJnRuhuGGCJsNrc9xPwnYr4xup/+SGExB6bpkO+FY0yM76wU/L45BEiVOX
         D0eA==
X-Gm-Message-State: AOAM532KIcd9wY1GHoDxDYjB6wiHIlHa+KDZ9ap2UZYmdv1OIGR/EAQV
        MIZbYkX4eILaUy2bZA5mn/0O8o1nM8FPUDCggyo=
X-Google-Smtp-Source: ABdhPJw8CjGedwgS0CZmavOA3njQ7KHZIU/S2l1+rdosCV942mlncqsjdoPnVpPycpFFDszaO4YAYwXRhU/EFuaJZBM=
X-Received: by 2002:a67:f106:: with SMTP id n6mr3660927vsk.40.1623743757460;
 Tue, 15 Jun 2021 00:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210614193253.10011-1-biju.das.jz@bp.renesas.com>
 <20210614193253.10011-3-biju.das.jz@bp.renesas.com> <2935959198e4c40c49623f2e5f161392e76d6add.camel@pengutronix.de>
In-Reply-To: <2935959198e4c40c49623f2e5f161392e76d6add.camel@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Jun 2021 09:55:46 +0200
Message-ID: <CAMuHMdVsxVq_4Oepo+LsweVgH8GU=3ZCUj=gYW-=2OjmurQmQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: riic: Add RZ/G2L support
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phillip,

On Tue, Jun 15, 2021 at 9:49 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mon, 2021-06-14 at 20:32 +0100, Biju Das wrote:
> > RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> > By default IP is in reset state, so need to perform release
> > reset before accessing any register.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> >   * Changed to devm_reset_control_get_exclusive API for reset_control_get.
> >   * Updated KCONFIG to enable RESET_CONTROLLER only if it is RZ/G2L SoC.
> >   * Filled .data for RIIC_RZ_A.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> > ---
> >  drivers/i2c/busses/Kconfig    |  1 +
> >  drivers/i2c/busses/i2c-riic.c | 23 ++++++++++++++++++++++-
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 281a65d9b44b..17bd15ad8761 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -941,6 +941,7 @@ config I2C_QUP
> >  config I2C_RIIC
> >       tristate "Renesas RIIC adapter"
> >       depends on ARCH_RENESAS || COMPILE_TEST
> > +     select RESET_CONTROLLER if ARCH_R9A07G044
>
> I would have expected the select RESET_CONTROLLER to be placed under
> config ARCH_R9A07G044. Since this is a pretty architecture specific
> driver, I'm ok with this as well.

My first thought was "that would enable it unconditionally on
ARCH_R9A07G044, even when RIIC is not used", but then I realized
there's already a "select RESET_CONTROLLER" for CLK_RZG2L (in
linux-next).  So the select for I2C_RIIC can indeed be dropped.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
