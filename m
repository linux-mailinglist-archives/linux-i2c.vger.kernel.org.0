Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817A3478C30
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 14:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236697AbhLQNYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 08:24:23 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42996 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236677AbhLQNYU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 08:24:20 -0500
Received: by mail-ua1-f46.google.com with SMTP id t13so4242479uad.9;
        Fri, 17 Dec 2021 05:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UfQoARdnbkZAiC3vtgUpOeQLmZLNRjjpwLc9s5ZyHps=;
        b=xYfAY7J7J9QffAykFLTch2fOSSEGskXuntYtMKlCX8maAZfgRC7qaeYbEYXEhHxAm9
         hCprSbG7+WrIa9+7lPKf2Gnwb9ioX+R+RgibIbKM6PTk7hk7TRdYnQxFfz3Uvh2fnE43
         5ilri1hg6O+NGD3LZ8i57+iYD9+vuULAmaDkvG/pbtchDhnnqYk1RCbUErtJ4g02beJy
         sp8C7y21ZrvyE8OZIEfB7so4is2cjz7xSFk+9nrrb4lz0DmcaKUxl2uHmi4PuAI7Pxr/
         NBCURrxkQyH90X6VZOJjiVOG8PMzyIp3PlqIt1SOL30ZCNF2eS0j3xxbqki04ANOps2S
         773Q==
X-Gm-Message-State: AOAM53375W3GmNivNzBMFfaktc7PL/pTXxza/phvxW5ZI9KeTC9Zl384
        tUf4+AIs3aie7begwtfvMGNlEkC2jYYyOg==
X-Google-Smtp-Source: ABdhPJwf9tK4F5rXipclTN8u7WMGEQYWyCzr93mNHr/EESAQDeztbJetl2fXnXAfihpEYTm5+KvDBw==
X-Received: by 2002:ab0:449:: with SMTP id 67mr998976uav.46.1639747459373;
        Fri, 17 Dec 2021 05:24:19 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id q9sm1804818vkn.44.2021.12.17.05.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 05:24:19 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p37so4282078uae.8;
        Fri, 17 Dec 2021 05:24:18 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr960485vsj.77.1639747458226;
 Fri, 17 Dec 2021 05:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-3-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-3-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 14:24:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBm6PMnBTQDZY=3XkGBXsr4wXy8m+WbgHjA8SpctbVCA@mail.gmail.com>
Message-ID: <CAMuHMdXBm6PMnBTQDZY=3XkGBXsr4wXy8m+WbgHjA8SpctbVCA@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] dt-bindings: soc/microchip: update syscontroller compatibles
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

On Fri, Dec 17, 2021 at 10:32 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The Polarfire SoC is currently using two different compatible string
> prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> its system controller in order to match the compatible string used in
> the soc binding and device tree.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
