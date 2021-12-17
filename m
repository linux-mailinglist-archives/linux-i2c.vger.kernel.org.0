Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DEC478C81
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 14:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhLQNkn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 08:40:43 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:41531 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbhLQNkn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 08:40:43 -0500
Received: by mail-vk1-f170.google.com with SMTP id s144so1538739vkb.8;
        Fri, 17 Dec 2021 05:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rtHDFTmA9jAujdChviftcLGAoCqoDrj9rbkqjCaVfPY=;
        b=evZRjLae1O9802bI064bPZMgL+WzkRwsIvqlQj0OefnDOASPGDK8Ydx+mMtQQt6ywq
         PUjYmdfIZtLBlVUk+PSO7RYLOmwY5kgIBK30oWZTgLN9+0pGRYAADzYvvvSNEr5TnmXR
         3kiv0YnICBFTwHKmI6TSJSkEQDdfEUMmcLkeT4Z4H8lG1DrPpkkKbhVzx2pGzSlNV7m0
         lXo0PhCC3oQIKjNey/+IXedCp0Y+RFWBhxqu3fSR4cJghgGKQ/yE6QQIQ82Vf3Oe4hFs
         1zGF/i2GvLYRhPPZ8n6NxlpYhso5iYJE78Vhpk3+qC1bGgkDllNWB2jkAfGrJJDxraSB
         ECsg==
X-Gm-Message-State: AOAM5339FGfOkVPhK0trER0JIVeRwHBh907nlZaYgiNoZGqv/2YciK20
        ib4DaFhgDaSeaCZ+/MNhYumPcztUcw6Ozw==
X-Google-Smtp-Source: ABdhPJzgC6NbrwspU5MLn/XIDxxFyJ8uu8MA8EAiYeoJliuNGon8pTS36lOZYP5xeeIJLZM9LA427g==
X-Received: by 2002:a05:6122:8c6:: with SMTP id 6mr1074873vkg.5.1639748441578;
        Fri, 17 Dec 2021 05:40:41 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 204sm910916vkb.43.2021.12.17.05.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 05:40:40 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id y22so4425815uap.2;
        Fri, 17 Dec 2021 05:40:40 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr949708vsg.57.1639748440025;
 Fri, 17 Dec 2021 05:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-14-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-14-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 14:40:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYUEpU4bFobK=fpVDGzwAHQWJ=dvPVmp20DUTLSe+DRw@mail.gmail.com>
Message-ID: <CAMuHMdUYUEpU4bFobK=fpVDGzwAHQWJ=dvPVmp20DUTLSe+DRw@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] riscv: dts: microchip: use hart and clk defines
 for icicle kit
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bin Meng <bin.meng@windriver.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Lewis Hanly <lewis.hanly@microchip.com>,
        daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
        Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

Thanks for your patch!

On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Update the Microchip Icicle kit device tree by replacing interrupt and
> clock related magic numbers with their defined counterparts.

Usually we make a distinction between (a) numbers that can be looked
up easily in a datasheet, and (b) numbers that were made up because
we needed some mapping. Of course both types of numbers are fixed,
and cannot be changed.

For (a), we tend to use the hardcoded numbers in the DTS files, to
avoid reviewers having to go through another layer of indirection
(i.e. does the number for the define match the number in the
datasheet?).
For (b), we use the defines, as there is no other official place to
look up the numbers.

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -2,6 +2,8 @@
>  /* Copyright (c) 2020 Microchip Technology Inc */
>
>  /dts-v1/;
> +#include "dt-bindings/clock/microchip,mpfs-clock.h"

The clock numbers we're made-up, so they fall under (b).

> +#include "dt-bindings/interrupt-controller/riscv-hart.h"

I believe these are just the official CLIC interrupt IDs, so they
fall under (a)?

> @@ -165,11 +167,16 @@ cache-controller@2010000 {
>                 clint@2000000 {
>                         compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>                         reg = <0x0 0x2000000 0x0 0xC000>;
> -                       interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> -                                             <&cpu1_intc 3>, <&cpu1_intc 7>,
> -                                             <&cpu2_intc 3>, <&cpu2_intc 7>,
> -                                             <&cpu3_intc 3>, <&cpu3_intc 7>,
> -                                             <&cpu4_intc 3>, <&cpu4_intc 7>;
> +                       interrupts-extended = <&cpu0_intc HART_INT_M_SOFT>,
> +                                             <&cpu0_intc HART_INT_M_TIMER>,
> +                                             <&cpu1_intc HART_INT_M_SOFT>,
> +                                             <&cpu1_intc HART_INT_M_TIMER>,
> +                                             <&cpu2_intc HART_INT_M_SOFT>,
> +                                             <&cpu2_intc HART_INT_M_TIMER>,
> +                                             <&cpu3_intc HART_INT_M_SOFT>,
> +                                             <&cpu3_intc HART_INT_M_TIMER>,
> +                                             <&cpu4_intc HART_INT_M_SOFT>,
> +                                             <&cpu4_intc HART_INT_M_TIMER>;

Hence I'm not sure we want changes like this?

>                 };
>
>                 plic: interrupt-controller@c000000 {
         };
>
> @@ -210,7 +221,7 @@ serial0: serial@20000000 {
>                         interrupt-parent = <&plic>;
>                         interrupts = <90>;
>                         current-speed = <115200>;
> -                       clocks = <&clkcfg 8>;
> +                       clocks = <&clkcfg CLK_MMUART0>;

But this change is fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
