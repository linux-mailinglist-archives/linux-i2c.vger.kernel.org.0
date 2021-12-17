Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EE44790D7
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238265AbhLQQBM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 11:01:12 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:43721 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235191AbhLQQBM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:01:12 -0500
Received: by mail-ua1-f51.google.com with SMTP id 107so5152588uaj.10;
        Fri, 17 Dec 2021 08:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26SVdMAvextSC77CuMirCaLKRwkRmDU6eDmV5JlcvTE=;
        b=wdKfN40HnD0hT+qP+NY/jOENtou4k/ks/33gBT2qbgVfvQv4TdspK1Dx9lHozPEFRX
         +fQp1YklhadmLXT8AqeQlT2mXAD1J7KrFg22/F6gqX4ttpRausngwgJa+KO7avqpls6a
         lQM727awJcP1cyAjoW6DwgGKoElk0fNuZxGa8I8xeviSrUq0ZpxFbKx/tuBDz0EyoEss
         cK04x2s5Elfe65bNK89oChB7ixyCtxDPuRTpikvRC1ouKQkNbfemMKXdGzBbpNdsFCxK
         aHLij/80xPtzSlcO2ZnpihwaIfawj9cGE213ieAkDLawhnrdYVtQ+P7mVyXo4lGruxvf
         48QA==
X-Gm-Message-State: AOAM530OO2LtUm2PNYq/N1t1F0aW8+MTcI/Y2a2t0wF8Z5rsmnufEo6G
        vQ76rHF6ACUn4X/hIEncA8okQhNfxVJV0Q==
X-Google-Smtp-Source: ABdhPJy23LMR5SNJpFHss4xovtLz25ABoH0p7MPdH+DItroYIxfeLMGvKEz5RhoxNtKNH9O0cYWzwQ==
X-Received: by 2002:a67:c11c:: with SMTP id d28mr1347257vsj.54.1639756870935;
        Fri, 17 Dec 2021 08:01:10 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id d16sm1871297vko.29.2021.12.17.08.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 08:01:10 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id y22so5248663uap.2;
        Fri, 17 Dec 2021 08:01:09 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr1321684uar.14.1639756869466;
 Fri, 17 Dec 2021 08:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com> <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
 <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
In-Reply-To: <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 17:00:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiSnxmXFroHi1drcmkqkhshC+X=6mtw0_wFnS+P=O9Cw@mail.gmail.com>
Message-ID: <CAMuHMdUiSnxmXFroHi1drcmkqkhshC+X=6mtw0_wFnS+P=O9Cw@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
To:     Conor Dooley <Conor.Dooley@microchip.com>
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
        Lewis Hanly <Lewis.Hanly@microchip.com>,
        Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com,
        Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Fri, Dec 17, 2021 at 4:32 PM <Conor.Dooley@microchip.com> wrote:
> On 17/12/2021 13:43, Geert Uytterhoeven wrote:
> > On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Split the device tree for the Microchip MPFS into two sections by adding
> >> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
> >> FPGA fabric.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> >> @@ -0,0 +1,13 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> >> +
> >> +/ {
> >> +       corePWM0: pwm@41000000 {
> >> +               compatible = "microchip,corepwm";
> >> +               reg = <0x0 0x41000000 0x0 0xF0>;
> >> +               microchip,sync-update = /bits/ 8 <0>;
> >> +               #pwm-cells = <2>;
> >> +               clocks = <&clkcfg CLK_FIC3>;
> >> +               status = "disabled";
> >> +       };
> >
> > I'm wondering if these should be grouped under a "fabric" subnode,
> > like we have an "soc" subnode for on-SoC devices? Rob?
> >
> > BTW, do you already have a naming plan for different revisions of
> > FPGA fabric cores?
> Not yet (assuming you mean specifically how we will handle it in the
> device tree) - although i was talking to someone about it yesterday.
> It's possible that we might handle that via a register, but if you have
> a suggestion or some precedence that you're aware of that would be useful.
>
> The actual naming convention of the IP cores themselves, yeah. I will
> dig it up for you on Monday.

I meant what if corepwm is enhanced, and how to detect that?

SiFive uses an integer version number, even for hard cores[1].
OpenCores uses an "-rtlsvnN" suffix (isn't svn dead? ;-)
No idea what e.g. LiteX and Microwatt are planning.

[1] Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
