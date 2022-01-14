Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A476548ED55
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242491AbiANPrI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:47:08 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:36710 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238763AbiANPrH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:47:07 -0500
Received: by mail-ot1-f54.google.com with SMTP id s21-20020a05683004d500b0058f585672efso10501389otd.3;
        Fri, 14 Jan 2022 07:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dzA66i4ivAiYOjfo8oco9UtNpMipS0k8jsB20XDEr0=;
        b=N+I3et3MOlnEZV8DM6er7cWyvhAel8u3zbYT4IdkjRbaYJ1wSy51YtefUMNptFLOF9
         R6xIdZ4M9SlZ4vOLF3X/HdH49K7tpIjqZgyIwVKLdlJCiAe/4dNsIY4I29Kq+ngaFho2
         zUHeARHYuMXf3du9MTcTBvvbEtSFP8NoGK0EmHvHDz4maAxgxXP8iAZGlQaBZt/9Ppd1
         tJTCdhIeveNUM7W3Mfsl+yPKjEVLLTQ3YH7nAtG7YRdXmHOJ5pe4g/LzAxvNL7Xpxtec
         iK8W2lbUY8SPfArE093Pny8QKnqEkBwl4mmWbWt4wEKhtBkSgwmYndMyj+lZDHpTU646
         DfkQ==
X-Gm-Message-State: AOAM533ohJCVk7mYO8P/MfJ/D6UtOExSyXgOQkXJH99w1zh82P6MW0NX
        EQ7RiiDapyRHgDKlTKX0/fn1pMhaKkm3oxF5
X-Google-Smtp-Source: ABdhPJzpq+bIHymNtfPPEI7X6nGEw7++j4Q0gG6AcAn3BffD6q8SLt066o/eRJwcRmhe0sqCKuwePQ==
X-Received: by 2002:a9d:6c4f:: with SMTP id g15mr6987331otq.3.1642175226110;
        Fri, 14 Jan 2022 07:47:06 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 17sm1311947oij.21.2022.01.14.07.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 07:47:05 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id z25-20020a0568301db900b005946f536d85so1467309oti.9;
        Fri, 14 Jan 2022 07:47:05 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr2650964uag.78.1642174814894;
 Fri, 14 Jan 2022 07:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-4-conor.dooley@microchip.com>
In-Reply-To: <20220114151727.2319915-4-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Jan 2022 16:40:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
Message-ID: <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] mailbox: change mailbox-mpfs compatible string
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
        Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Fri, Jan 14, 2022 at 4:16 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

This is already upstream, commit f10b1fc0161cd99e ("mailbox: change
mailbox-mpfs compatible string").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
