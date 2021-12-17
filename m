Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2F0478CC4
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 14:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbhLQNvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 08:51:45 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:43886 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhLQNvo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 08:51:44 -0500
Received: by mail-ua1-f43.google.com with SMTP id 107so4400892uaj.10;
        Fri, 17 Dec 2021 05:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzymPMQBtSGyl0KMkX7mRJW21YY8HhWUvGCPuNIAzLc=;
        b=2kmyB2CVofVserc+bm2snp8gFJudz+9Hm0Ie9OK3Ob6ICL/0ZVvkFIF5D5LEna8bJE
         qwxgbnh1ncfXnWocglQ75JtnRtLjp8vTCaoytyUTpUqANMK9P88DMsJ0S9imCGf3lFvv
         pnI7AQYJONE9svhSkwvRLsf/94xuMPP0lMSdwNhz50oVqmpGaSom3lhqVB81QHAuaDTL
         9XoScuDy43ZsH/uBadV6Y+jm46tv+GLJi8Vr65RfjWWqQNNasd/le0sHuW1XWFylM6dn
         NYKu32pC+5Byz4HoZvcFw7MyBKnw/VEWn4kjMTappASDkLlNyg5fuY9jm63C3Ik2QP9N
         Rr5A==
X-Gm-Message-State: AOAM530VPHD6YiubK+QRkTlu98hCP8EE7I7BSCvKXLexqKXBQzKaVrCL
        W2sHg63xPV430QP+yaLya12UhcizDFhlRA==
X-Google-Smtp-Source: ABdhPJygqHbD/X/j8BRU0bhjpRRjRAWfUxD7m6R8LZ06FOC/Bi4xRjb7x1NpLLTc+CgbjrViTdloRw==
X-Received: by 2002:ab0:6f49:: with SMTP id r9mr899509uat.111.1639749103352;
        Fri, 17 Dec 2021 05:51:43 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id c14sm1769301vkm.10.2021.12.17.05.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 05:51:43 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id m200so1568227vka.6;
        Fri, 17 Dec 2021 05:51:43 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr1041561vka.0.1639748601739;
 Fri, 17 Dec 2021 05:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-15-conor.dooley@microchip.com>
In-Reply-To: <20211217093325.30612-15-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 14:43:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Message-ID: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
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

On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Split the device tree for the Microchip MPFS into two sections by adding
> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
> FPGA fabric.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +       corePWM0: pwm@41000000 {
> +               compatible = "microchip,corepwm";
> +               reg = <0x0 0x41000000 0x0 0xF0>;
> +               microchip,sync-update = /bits/ 8 <0>;
> +               #pwm-cells = <2>;
> +               clocks = <&clkcfg CLK_FIC3>;
> +               status = "disabled";
> +       };

I'm wondering if these should be grouped under a "fabric" subnode,
like we have an "soc" subnode for on-SoC devices? Rob?

BTW, do you already have a naming plan for different revisions of
FPGA fabric cores?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
