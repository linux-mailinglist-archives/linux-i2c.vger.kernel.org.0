Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F4D48EDD6
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 17:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243250AbiANQQO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 14 Jan 2022 11:16:14 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:51270 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243217AbiANQQM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 11:16:12 -0500
Date:   Fri, 14 Jan 2022 16:15:58 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To:     Geert Uytterhoeven <geert@linux-m68k.org>
From:   conor dooley <mail@conchuod.ie>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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
        =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
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
Reply-To: conor dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 03/15] mailbox: change mailbox-mpfs compatible string
Message-ID: <MzSOUvHzeH0svo7uoPc_rfCs1BVTByRKAZ_EftQ5Qk2sheETSbE_NFPRVzFd8YmKMQ_9uIggomOqyQUD9clIwabiKrVp4F2Gw4nOnJkXv2M=@conchuod.ie>
In-Reply-To: <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com> <20220114151727.2319915-4-conor.dooley@microchip.com> <CAMuHMdUXD8CHqoaygXzcC0YpsbRT_KAUni1hD4sMn=k=WD+DuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.0 required=10.0 tests=ALL_TRUSTED shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Hi Conor,
>
> On Fri, Jan 14, 2022 at 4:16 PM <conor.dooley@microchip.com> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The Polarfire SoC is currently using two different compatible string
> > prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
> > its system controller in order to match the compatible string used in
> > the soc binding and device tree.
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> This is already upstream, commit f10b1fc0161cd99e ("mailbox: change
> mailbox-mpfs compatible string").

I would say great, but that means the new string is now in the driver
but the new dt-binding is not (and I just noticed contains an error).
Conor.

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
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
