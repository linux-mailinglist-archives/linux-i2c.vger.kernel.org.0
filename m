Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DE712D3BE
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2019 20:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbfL3TLP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Dec 2019 14:11:15 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39942 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3TLP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Dec 2019 14:11:15 -0500
Received: by mail-oi1-f194.google.com with SMTP id c77so10919082oib.7;
        Mon, 30 Dec 2019 11:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FD0PHS0WJfyz6nKHt4il24Ip/Qej/LUf3rJZhnZB6i8=;
        b=M/c67WBWJSTLf58k8EC2p23H0XbRlQArbKGvzXK0vTFhCtJ7NL9SXznOdU9ZEolVMp
         j/qL+qSU2ueWFZe//MS4oEfVXd3Y3rOgLncC4iHEPsDMXHxmZGncxbkqnZvtCyL645+x
         JBRhnH7ROxndezRYK2jPlSJXywwEQwjOkIE5/6YnnP4VNSpfpE9B9jS2nXcL8pIzPUlZ
         RXuA+Z5U2I+vcuNFo+Oy1wCze84+QzVAe6GlkLA0+Oxrmsh2ien+DH2Qy22uXBcDVzWu
         DMnFhBDKPKBY0K7fXv+6I2WR4PB0MYvWzW3jBTvHykHV3ZQVai4eXLcMBgxDyMRZsOHn
         ihGg==
X-Gm-Message-State: APjAAAU4aQX1H2HU+ug1+4XDjMpyzkFDqEJYVk/W0x8m2CHc6u6+XVQl
        2ZzM8crq0F/MpyVjJgfpoAkg6nH1swvG0NQkHVQ=
X-Google-Smtp-Source: APXvYqxVHb0i7kf7TiVi7M3YMSWRrzG8vxiPCoBQIAyDmz0C5Wbjsxn9J+D3vmqk2ELiRLzRo9UT2qwxOwdahqYZViI=
X-Received: by 2002:aca:eb83:: with SMTP id j125mr236048oih.153.1577733074733;
 Mon, 30 Dec 2019 11:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20191230172751.17985-1-krzk@kernel.org> <20191230172751.17985-5-krzk@kernel.org>
In-Reply-To: <20191230172751.17985-5-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Dec 2019 20:11:03 +0100
Message-ID: <CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com>
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

On Mon, Dec 30, 2019 at 6:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Some of the I2C bus drivers can be compile tested to increase build
> coverage.  This requires also:
> 1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
>    controllers,
> 2. Adding 'if' conditional to 'default y' so they will not get enabled
>    by default on all other architectures,
> 3. Limiting few compile test options to supported architectures (which
>    provide the readsX()/writesX() primitives).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for your patch!

> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -367,7 +367,7 @@ comment "I2C system bus drivers (mostly embedded / system-on-chip)"
>
>  config I2C_ALTERA
>         tristate "Altera Soft IP I2C"
> -       depends on (ARCH_SOCFPGA || NIOS2) && OF
> +       depends on (ARCH_SOCFPGA || NIOS2 || COMPILE_TEST) && OF

Might be easier to read and maintain by splitting in "hard" and "useful"
dependencies:

    depends on OF
    depends on ARCH_SOCFPGA || NIOS2 || COMPILE_TEST

> @@ -611,8 +612,8 @@ config I2C_EMEV2
>
>  config I2C_EXYNOS5
>         tristate "Exynos5 high-speed I2C driver"
> -       depends on ARCH_EXYNOS && OF
> -       default y
> +       depends on (ARCH_EXYNOS && OF) || COMPILE_TEST

This means it is only useful on DT-based Exynos platforms, but compiles
everywhere?

Do you still have support for non-DT Exynos platforms?
ARCH_EXYNOS depends on ARCH_MULTI_V7?
(and its help text mentions Exynos 4/5 only, no 3?)

> @@ -1055,15 +1057,15 @@ config I2C_SYNQUACER
>
>  config I2C_TEGRA
>         tristate "NVIDIA Tegra internal I2C controller"
> -       depends on ARCH_TEGRA
> +       depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))

Perhaps

    depends on ARCH_TEGRA || COMPILE_TEST
    depends on ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC
# needs <foo>

to remember which <foo> feature is needed?

> @@ -1403,8 +1405,8 @@ config I2C_OPAL
>
>  config I2C_ZX2967
>         tristate "ZTE ZX2967 I2C support"
> -       depends on ARCH_ZX
> -       default y
> +       depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))

Same here/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
