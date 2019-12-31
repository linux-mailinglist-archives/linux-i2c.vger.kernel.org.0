Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A6D12D751
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 10:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfLaJUN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 04:20:13 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33636 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfLaJUN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Dec 2019 04:20:13 -0500
Received: by mail-ot1-f65.google.com with SMTP id b18so27828749otp.0;
        Tue, 31 Dec 2019 01:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=51KgCB90k/YeMVtalDewVaXpSkUpcyrIHB/S/QbadkY=;
        b=avE2ow5hTxf4jMlc/ohiVFJzwD9crUiHJcFxIEkwQIj/FuvmeiopQWlXcLsyv5K1qa
         wTNkZRW430vbpjuEmgee5y1eupDOL1kL5wyywKAiB/BfwUXgNxp6LkTv+PtGODusb84C
         86FKLQLNoUznsDnCokDGjJG41oD0i5l5K1QGMCD4I+dvrr2XdGaS+uNG4v53KTIrtD17
         6jGIXJu4h1iYClFConk3/aAEZbTNVWcFUw0GJ6ihcTm/xduKQVkDVEk0BROLJX0tzZhz
         J34Bp2sI57aMFLuE8ry5NtmdPJuSaXkDP1qS1EINdj0XCMPhPfckWRbdz89W4sF3GyIX
         8r2w==
X-Gm-Message-State: APjAAAXd9EcFCPeTqfNdJqpX2lLFSw6ZDrjYmWqtdf3sOxH1kUTDQnNu
        dDUaUVLO2lPx30VHUxny0nx9/ZHYohC5djtjKk0=
X-Google-Smtp-Source: APXvYqydIX4+VnKryzPLTDBNw5J7Rjc5k1kJ1lWW03jACgfDG+a7lTTaqTmK4G3eAg4q5E/imfuaCcpu91dwOTjF72Q=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr73857782otf.107.1577784012455;
 Tue, 31 Dec 2019 01:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20191230172751.17985-1-krzk@kernel.org> <20191230172751.17985-5-krzk@kernel.org>
 <CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com> <20191231090146.GA6872@pi3>
In-Reply-To: <20191231090146.GA6872@pi3>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Dec 2019 10:20:01 +0100
Message-ID: <CAMuHMdWhz7x8MnGeGv2f-Gb7fBRTp=5qq_Mz55sY7tQNpRogjg@mail.gmail.com>
Subject: Re: [PATCH 5/5] i2c: Enable compile testing for some of drivers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On Tue, Dec 31, 2019 at 10:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Dec 30, 2019 at 08:11:03PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Dec 30, 2019 at 6:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > Some of the I2C bus drivers can be compile tested to increase build
> > > coverage.  This requires also:
> > > 1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
> > >    controllers,
> > > 2. Adding 'if' conditional to 'default y' so they will not get enabled
> > >    by default on all other architectures,
> > > 3. Limiting few compile test options to supported architectures (which
> > >    provide the readsX()/writesX() primitives).
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

> > > @@ -611,8 +612,8 @@ config I2C_EMEV2
> > >
> > >  config I2C_EXYNOS5
> > >         tristate "Exynos5 high-speed I2C driver"
> > > -       depends on ARCH_EXYNOS && OF
> > > -       default y
> > > +       depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> >
> > This means it is only useful on DT-based Exynos platforms, but compiles
> > everywhere?
>
> Yes. The driver will proble only from DT.
>
> >
> > Do you still have support for non-DT Exynos platforms?
> > ARCH_EXYNOS depends on ARCH_MULTI_V7?
>
> No, only DT. I think dependency here is a left over from board times and
> optional OF. Actually many drivers depend on OF and some OF-like ARCH so
> it could be removed.
>
> Since driver uses OF, it's rather the choice whether to explicitly
> mention OF.

So the !OF case is only for compile-testing.  Then it can be simplified to:

    depends on ARCH_EXYNOS || COMPILE_TEST

> > (and its help text mentions Exynos 4/5 only, no 3?)
>
> That's correct although it supports also Exynos7 (ARMv8) which is not
> mentioned. I'll correct it.

Good.

Actually "it" referred to arch/arm/mach-exynos/Kconfig:ARCH_EXYNOS,
which mentions 4/5 only, while it covers 3/4/5.

> > > @@ -1055,15 +1057,15 @@ config I2C_SYNQUACER
> > >
> > >  config I2C_TEGRA
> > >         tristate "NVIDIA Tegra internal I2C controller"
> > > -       depends on ARCH_TEGRA
> > > +       depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> >
> > Perhaps
> >
> >     depends on ARCH_TEGRA || COMPILE_TEST
> >     depends on ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC
> > # needs <foo>
> >
> > to remember which <foo> feature is needed?
>
> I can comment on <foo> but such split of archs would be confusing. One
> would think that driver can work on these platforms, while it is purely
> for compile testing.  Keeping it together is self-documenting: these
> weird platform selection was added only for compile testing.

Fair enough.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
