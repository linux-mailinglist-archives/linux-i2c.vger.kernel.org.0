Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A319012D73F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 10:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfLaJBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 04:01:52 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42047 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfLaJBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Dec 2019 04:01:51 -0500
Received: by mail-ed1-f66.google.com with SMTP id e10so34804008edv.9;
        Tue, 31 Dec 2019 01:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fsG2Rvysfchuljlzy9Ww24f+1cIyMb/bwqWGWqBPxTA=;
        b=oHQNSMoWDOYTX+J0Xxij2zh0YtyVZDpruBzaMwsBW5YdFfdk9koSrkio437+7kaKVp
         KlIJw4idH2jJiWzI0EuBsB8mMLIzrCtnHR9DhbHmFs0KNTCV8IM4Mo6egok6HGUNTioh
         8Gf7ORcCpUrPjjpI4R+6P/4ehONTJp/1Kg9m33Utkf95DMy2BY/CXWYK9Xing5aqBVs6
         cdqODestYGcov20PjIFBW2yRN0mNd1SVav51z9FBiSpWSj63FCebjxrFXM04Zrj7E3k7
         sC3kYybBjuV2JzG91rCEBlLilc2zcCSHbnpmYLZCn5FUjodYgAiPYV3qPrji2c0jwTCH
         I46w==
X-Gm-Message-State: APjAAAUXaLUc+Mk2/NcKx6eJYC57E86uQyyPp1kuUTIzhEMZvnO6MNiY
        cg4uZ1FO6FCj12EXWFF4TQE=
X-Google-Smtp-Source: APXvYqz82hNmJu4of9b2ODZh3tiQxLGmLoxEe04E5J/Dd76pnUZV2tjhsjz623nry1WIbNOSJIhtLQ==
X-Received: by 2002:aa7:d956:: with SMTP id l22mr63653779eds.66.1577782909712;
        Tue, 31 Dec 2019 01:01:49 -0800 (PST)
Received: from pi3 ([194.230.155.138])
        by smtp.googlemail.com with ESMTPSA id f10sm5758675eds.31.2019.12.31.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 01:01:49 -0800 (PST)
Date:   Tue, 31 Dec 2019 10:01:46 +0100
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
Message-ID: <20191231090146.GA6872@pi3>
References: <20191230172751.17985-1-krzk@kernel.org>
 <20191230172751.17985-5-krzk@kernel.org>
 <CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 30, 2019 at 08:11:03PM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, Dec 30, 2019 at 6:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Some of the I2C bus drivers can be compile tested to increase build
> > coverage.  This requires also:
> > 1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
> >    controllers,
> > 2. Adding 'if' conditional to 'default y' so they will not get enabled
> >    by default on all other architectures,
> > 3. Limiting few compile test options to supported architectures (which
> >    provide the readsX()/writesX() primitives).
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Thanks for your patch!
> 
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -367,7 +367,7 @@ comment "I2C system bus drivers (mostly embedded / system-on-chip)"
> >
> >  config I2C_ALTERA
> >         tristate "Altera Soft IP I2C"
> > -       depends on (ARCH_SOCFPGA || NIOS2) && OF
> > +       depends on (ARCH_SOCFPGA || NIOS2 || COMPILE_TEST) && OF
> 
> Might be easier to read and maintain by splitting in "hard" and "useful"
> dependencies:
> 
>     depends on OF
>     depends on ARCH_SOCFPGA || NIOS2 || COMPILE_TEST

Sure

> 
> > @@ -611,8 +612,8 @@ config I2C_EMEV2
> >
> >  config I2C_EXYNOS5
> >         tristate "Exynos5 high-speed I2C driver"
> > -       depends on ARCH_EXYNOS && OF
> > -       default y
> > +       depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> 
> This means it is only useful on DT-based Exynos platforms, but compiles
> everywhere?

Yes. The driver will proble only from DT.

> 
> Do you still have support for non-DT Exynos platforms?
> ARCH_EXYNOS depends on ARCH_MULTI_V7?

No, only DT. I think dependency here is a left over from board times and
optional OF. Actually many drivers depend on OF and some OF-like ARCH so
it could be removed.

Since driver uses OF, it's rather the choice whether to explicitly
mention OF.

> (and its help text mentions Exynos 4/5 only, no 3?)

That's correct although it supports also Exynos7 (ARMv8) which is not
mentioned. I'll correct it.

> 
> > @@ -1055,15 +1057,15 @@ config I2C_SYNQUACER
> >
> >  config I2C_TEGRA
> >         tristate "NVIDIA Tegra internal I2C controller"
> > -       depends on ARCH_TEGRA
> > +       depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> 
> Perhaps
> 
>     depends on ARCH_TEGRA || COMPILE_TEST
>     depends on ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC
> # needs <foo>
> 
> to remember which <foo> feature is needed?

I can comment on <foo> but such split of archs would be confusing. One
would think that driver can work on these platforms, while it is purely
for compile testing.  Keeping it together is self-documenting: these
weird platform selection was added only for compile testing.

Best regards,
Krzysztof

> 
> > @@ -1403,8 +1405,8 @@ config I2C_OPAL
> >
> >  config I2C_ZX2967
> >         tristate "ZTE ZX2967 I2C support"
> > -       depends on ARCH_ZX
> > -       default y
> > +       depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> 
> Same here/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
