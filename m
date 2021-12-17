Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B8F478813
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 10:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhLQJtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 04:49:02 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:42998 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhLQJtC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 04:49:02 -0500
Received: by mail-vk1-f177.google.com with SMTP id s1so1136054vks.9;
        Fri, 17 Dec 2021 01:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pV3wufp8Dvr2hDhjItQtnYu6eMKRgXVIFNhbTAtUVzU=;
        b=yvw5bl0T3tZKXmmpbo/vH01xbr9fzBmv3P+W8H9MtsOKaHt097Nw+0XrQD2L+wMmvr
         z42lzBUSdFLgxNCKEfMrizK1dIgAR36ZSS6XknytaEWq4mCVg6lsRzb+E1VV6U2BZWbA
         0mDznrCCYwfZMU3VPpLgdJdCGP2DhqorfKRiuUYFpyabSrujE/j2ofb0DZqwuDOYv1ca
         qVs97xUcVgHu8B4juOldyJ8X4eTq2aQszGvEcWRea/Ij2wDse4yb7HW/Qht5Sw9cP7oQ
         2TIUtTHA8iiYmAVgma7H7PrU9qGz1cQb7gG0iGdvHUFWfm4kibiUQErz83Y7dsE5mH3g
         7kWg==
X-Gm-Message-State: AOAM531njpYNAKJMNAqxkfZBOusG9qAeRZ8tO0G/b+dUbhBV+QKsnRT/
        gzDMo1flr+ij0c2Qpxc0ZdqgZ5Je5BWdSw==
X-Google-Smtp-Source: ABdhPJzlqo2h8WQv5SAzvK4/3sicPepHkLvrIy/RzWGDskdL9bfhn0NyB/ZFWmKRXYRwhZRJgvObZA==
X-Received: by 2002:a1f:a556:: with SMTP id o83mr811562vke.9.1639734540702;
        Fri, 17 Dec 2021 01:49:00 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id v8sm1679419vkc.52.2021.12.17.01.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 01:48:59 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id u40so3318675uad.1;
        Fri, 17 Dec 2021 01:48:59 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr650580vsj.77.1639734538930;
 Fri, 17 Dec 2021 01:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 10:48:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTjrAiHosU0cGyJYkK=9JzNgHb=tjHXPdYxTWmkVzeYQ@mail.gmail.com>
Message-ID: <CAMuHMdWTjrAiHosU0cGyJYkK=9JzNgHb=tjHXPdYxTWmkVzeYQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Update the Icicle Kit device tree
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

On Fri, Dec 17, 2021 at 10:31 AM <conor.dooley@microchip.com> wrote:
> Also depends on Geert's format changes to interrupt grouping etc [2].
>
> Additionally, the interrupt-extended warnings on the plic/clint are
> cleared by [3] & [4], which lore appears to have been very confused about.

Right, it ended up being even more messier than I thought, and confuses
"b4 am" too.
I will resend these 3 series later today.

> [1] https://lore.kernel.org/linux-clk/20211216140022.16146-1-conor.dooley@microchip.com/T/
> [2] https://lore.kernel.org/linux-riscv/cover.1639660956.git.geert@linux-m68k.org/T/
> [3] https://patchwork.kernel.org/project/linux-riscv/cover/cover.1639662093.git.geert@linux-m68k.org/
> [4] https://patchwork.kernel.org/project/linux-riscv/cover/cover.1639661878.git.geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
