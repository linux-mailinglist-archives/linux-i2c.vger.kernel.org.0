Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E8F478C45
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 14:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234139AbhLQNZn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 08:25:43 -0500
Received: from mail-vk1-f169.google.com ([209.85.221.169]:40911 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhLQNZn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 08:25:43 -0500
Received: by mail-vk1-f169.google.com with SMTP id 70so1507426vkx.7;
        Fri, 17 Dec 2021 05:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UfQoARdnbkZAiC3vtgUpOeQLmZLNRjjpwLc9s5ZyHps=;
        b=EmRMto8SVr5DpuupuSJUDrn1NDFZk58/g4oIul9ouFDNiZgtfcIV18ekAfzZSzyy5n
         TSZllkYXtloVgHHNmdWXamRqfyXLnM8fglBA9MoNqL6xpyRo62AmwjsFfYbbPcNCuKzw
         i9U7BA/vlgq+KpNou+y6FnFV98+6+agK5vsQ1+oigzxJAoF8PT5xVB/pDRdp3C5jC2Xg
         QVt8U/m9v8eb+Hw2Il01+THaUGUx4EhiclADHtYbnu7BNqFWwvlapZpW8TF2kuzdSP3C
         I6lVBoA2kKNLGhvG1xK50VEjcv9kBSN3KzQiHcjZtIEW1JEfFx5JOXZdUWEZJJ6+nX/2
         m0zA==
X-Gm-Message-State: AOAM531p2WtAqiY92Y7yi+jms/1jdt1tB90wqntWetx9EL5uTXIgm05Y
        +eJdSVAd2okPpWmqcM+8GHqwTyf3Qp/25w==
X-Google-Smtp-Source: ABdhPJwwFqhL88L0pJNgdnmmP+9zKvva/LGGolZ0zb8n19xe9p5NGzvfo6NB/JnWAPqyJDlT41WEdA==
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr1089716vke.33.1639747541456;
        Fri, 17 Dec 2021 05:25:41 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id w17sm1784700uar.18.2021.12.17.05.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 05:25:40 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id r15so4319331uao.3;
        Fri, 17 Dec 2021 05:25:40 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id o16mr1015811vst.5.1639747540015;
 Fri, 17 Dec 2021 05:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-5-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-5-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 14:25:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXf-nLGXbxwSZJQncdNXaD4_3bHwcb7WyxeYUw21eGX+g@mail.gmail.com>
Message-ID: <CAMuHMdXf-nLGXbxwSZJQncdNXaD4_3bHwcb7WyxeYUw21eGX+g@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] mailbox: change mailbox-mpfs compatible string
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
