Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19C612F8DD
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 14:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgACNmh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 08:42:37 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36148 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgACNmg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 08:42:36 -0500
Received: by mail-ed1-f66.google.com with SMTP id j17so41641105edp.3;
        Fri, 03 Jan 2020 05:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6IGH/4NsfGNqzq/az3laNR9DmJ2S/QIcfX6JBOSE7W8=;
        b=R6MWRbCtnIQcJa/204qS2yEk0UjPAOf2cCK9ilnC/qhxzubcJLDfdxmA9r7+rdEeks
         qsrqpNK7hd8ZyIBU//rfQvXxoteXIr6P175ioFOVLiAuo8QvSWNdAF60YdJVXWOF258O
         8AYjZjestLZOvvhU7A1ow2wgYWtw58lkGnlT+s3BBS5zMC8w4scptBVzxz9q0Gi49yho
         txpruZCzSGEuefoE05nsvFYGCtWntE0bvs11Wa0ZaoG06PLo9DYkrbrgAeRVtkCzOQc5
         xs2FrJksOiypizxP8xl/PFUyo2wa14ntE4m2so+hxbE8e9mLes4w6D2yHnc91Ef/GYHD
         2gCQ==
X-Gm-Message-State: APjAAAU/oi57eBybgmWTW9Z0KM1AZIa6V3AXdLmMibSw95O1tXpAueS8
        +0mbivTtRc69F6CFHSJQKcw=
X-Google-Smtp-Source: APXvYqz+iEmGUlqJ2ytifXahiNdcRR8fxZzTr5tUaDMie/rQytsdQJEzwg2+nqd+R4ZjXvdf3v9MvA==
X-Received: by 2002:a17:907:20a8:: with SMTP id pw8mr92654258ejb.248.1578058954664;
        Fri, 03 Jan 2020 05:42:34 -0800 (PST)
Received: from pi3 ([194.230.155.149])
        by smtp.googlemail.com with ESMTPSA id r20sm7751571eju.60.2020.01.03.05.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 05:42:33 -0800 (PST)
Date:   Fri, 3 Jan 2020 14:42:31 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH 5/5] i2c: Enable compile testing for some of drivers
Message-ID: <20200103134231.GA2095@pi3>
References: <20191230172751.17985-1-krzk@kernel.org>
 <20191230172751.17985-5-krzk@kernel.org>
 <CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com>
 <20191231090146.GA6872@pi3>
 <CAMuHMdWhz7x8MnGeGv2f-Gb7fBRTp=5qq_Mz55sY7tQNpRogjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWhz7x8MnGeGv2f-Gb7fBRTp=5qq_Mz55sY7tQNpRogjg@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 31, 2019 at 10:20:01AM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Dec 31, 2019 at 10:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Mon, Dec 30, 2019 at 08:11:03PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Dec 30, 2019 at 6:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > Some of the I2C bus drivers can be compile tested to increase build
> > > > coverage.  This requires also:
> > > > 1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
> > > >    controllers,
> > > > 2. Adding 'if' conditional to 'default y' so they will not get enabled
> > > >    by default on all other architectures,
> > > > 3. Limiting few compile test options to supported architectures (which
> > > >    provide the readsX()/writesX() primitives).
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> > > > @@ -611,8 +612,8 @@ config I2C_EMEV2
> > > >
> > > >  config I2C_EXYNOS5
> > > >         tristate "Exynos5 high-speed I2C driver"
> > > > -       depends on ARCH_EXYNOS && OF
> > > > -       default y
> > > > +       depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> > >
> > > This means it is only useful on DT-based Exynos platforms, but compiles
> > > everywhere?
> >
> > Yes. The driver will proble only from DT.
> >
> > >
> > > Do you still have support for non-DT Exynos platforms?
> > > ARCH_EXYNOS depends on ARCH_MULTI_V7?
> >
> > No, only DT. I think dependency here is a left over from board times and
> > optional OF. Actually many drivers depend on OF and some OF-like ARCH so
> > it could be removed.
> >
> > Since driver uses OF, it's rather the choice whether to explicitly
> > mention OF.
> 
> So the !OF case is only for compile-testing.  Then it can be simplified to:
> 
>     depends on ARCH_EXYNOS || COMPILE_TEST
> 

Many other drivers do exactly the same: depend on ARCH_xxx (which is
already OF only) and on OF. Since OF now has all (or almost all) stubs
for !OF case, such "depends on OF" is purely from logical point of view:
the driver will not bind without OF. It will not be useful.

I do not have strong opinion about this but is there a point to change
only this one, while in all other places drivers depend on OF? It will
just bring inconsistency.

Best regards,
Krzysztof


