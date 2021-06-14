Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B568A3A6821
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 15:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhFNNlB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 09:41:01 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:43755 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbhFNNlA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 09:41:00 -0400
Received: by mail-vs1-f47.google.com with SMTP id s22so7778446vsl.10;
        Mon, 14 Jun 2021 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Srsjp840VggaoNkzRjTFCPDT+rmpC0UhVopX3aik3tM=;
        b=ude9YwTzulrzvW8p9+p7rWmJBERKZaQwHgW/DUGUqvONYWua5DNHbnFW84ANNC0iKp
         T0T/35jCLavrodZiDwQavAOckis5KTwAfW2G6wEuZ63ormu7jG9sJ7QLHAfuC4dd67Yx
         QdFKTNotKzRrTxQvIfzmyVgDsuY9IwaIplxJ8lJH7ejtqI2Rbvza4mxKJ2EdkBWDXmxt
         /F6D1MwkvTsmAjpUQe9eH/90IoT/UQUW9W4sJE0+U2Am6Sc+pI8rU+7sFdSYPPH2Adar
         kpxRJbFK/JdlDbxz8c3WDl01sAZGJ+pUgXnWjPqHLtmX3+ygk/xlOTiNiVHIhtrioELg
         ec2Q==
X-Gm-Message-State: AOAM533JwfbqvTdYuf1+XOdAqJkqUOcxmxyctuTYgmMdEy2eD9yEcHlS
        79wDbdJkUgGADh7Wn5xHfTwAWtCZH70wthXDKgo=
X-Google-Smtp-Source: ABdhPJx97oky1ZwrJX0c/4Qy2YcGcngumr5Im3ypUrm2ZoEwxbiukdVchCQuPF42TLlsZqwZ1ZxefRjSGVCG5YJe760=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr17785480vsd.42.1623677937099;
 Mon, 14 Jun 2021 06:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
 <20210611165624.30749-4-biju.das.jz@bp.renesas.com> <67e00c18b71875a0aaa7a8a02b2b0507f5d7a575.camel@pengutronix.de>
In-Reply-To: <67e00c18b71875a0aaa7a8a02b2b0507f5d7a575.camel@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 15:38:45 +0200
Message-ID: <CAMuHMdX_-93MGi9X-m8PdMgjWDp=azP0mN+M7ReyokDqEbTVBQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: riic: Add RZ/G2L support
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Philipp,

On Mon, Jun 14, 2021 at 3:27 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Fri, 2021-06-11 at 17:56 +0100, Biju Das wrote:
> > RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> > By default IP is in reset state, so need to perform release
> > reset before accessing any register.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/i2c/busses/Kconfig    |  1 +
> >  drivers/i2c/busses/i2c-riic.c | 21 +++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 281a65d9b44b..5da09288b461 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -941,6 +941,7 @@ config I2C_QUP
> >  config I2C_RIIC
> >       tristate "Renesas RIIC adapter"
> >       depends on ARCH_RENESAS || COMPILE_TEST
> > +     select RESET_CONTROLLER
>
> There's no need for this. The reset API defines inline stubs so this can
> be compiled without RESET_CONTROLLER enabled.

AFAIK, the issue is that RIIC on RZ/G2L requires reset support,
so it must be enabled when building a kernel for RZ/G2L.
As RZ/A does not need or use it, and may run from SRAM, I'd like to
leave it disabled when building a kernel not including RZ/G2L support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
