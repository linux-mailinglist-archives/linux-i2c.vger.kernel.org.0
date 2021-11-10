Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9848B44C382
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 15:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhKJPBe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 10:01:34 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:46665 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbhKJPBd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 10:01:33 -0500
Received: by mail-ua1-f54.google.com with SMTP id az37so5210787uab.13;
        Wed, 10 Nov 2021 06:58:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KOCA3CMBp0qlOJqLClVIbzJyqhqqK17pYfXIsSt5kCw=;
        b=s2ckD5yd0tCPf58F5N8ZxmLHqo8U4MPsopy8nMNC8lD7MWl4ff6tzU07fRkjknooa3
         FuSSYzwB1/xECvZD5/3AbqhRVIxvzQg8nl0YuyCvJ4JFDAC1tmWExHDS02qaj1cPTRHB
         N1+pV1GOSQTD5p8TS+2sQXe2Nv5Og5O956VYNQZCteTQz8rfEO3Dt46Cp9PQbYS8FZ1P
         uo9r1OIYO1U+cJ3Hi3umnQKOXOwSoTkBBE3DUfUvYfViCgbV9fEFsTviiBokteBx9ciw
         g7qxKhUuVa3VWjMXdtVJ8tW63HioVs8H33W7m2vlqFAf+9wFH+nfK46H3wLrke158GnM
         fQDA==
X-Gm-Message-State: AOAM532al23csFXq1CtZmxLDxtIVoZ1WpV2dA+9ZadUU4OlG2+R0yqv9
        S2TlZKI9vR5SsreCdPPEapVtEN96l0vZig==
X-Google-Smtp-Source: ABdhPJxRApcmLBzw23ARqFtDlaJ+Dtvn5FUjdW1ehMzWo7KhRfe5iH8X6Uo/W1HIa6gGQWi9G6cChA==
X-Received: by 2002:ab0:25da:: with SMTP id y26mr627720uan.72.1636556325320;
        Wed, 10 Nov 2021 06:58:45 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id c11sm64450vsh.22.2021.11.10.06.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 06:58:45 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id e10so5322234uab.3;
        Wed, 10 Nov 2021 06:58:44 -0800 (PST)
X-Received: by 2002:ab0:3154:: with SMTP id e20mr683424uam.14.1636556324638;
 Wed, 10 Nov 2021 06:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com> <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
In-Reply-To: <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Nov 2021 15:58:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
Message-ID: <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
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
        Lewis Hanly <Lewis.Hanly@microchip.com>,
        Daire.McNamara@microchip.com, Atish Patra <atish.patra@wdc.com>,
        Ivan.Griffin@microchip.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, bin.meng@windriver.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Wed, Nov 10, 2021 at 3:20 PM <Conor.Dooley@microchip.com> wrote:
> On 09/11/2021 09:04, Geert Uytterhoeven wrote:
> > On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Update the device tree for the icicle kit by splitting it into a third part,
> >> which contains peripherals in the fpga fabric, add new peripherals
> >> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
> >> map which have been changed.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> As I said in the replies to another patch this is my first time doing
> any upstreaming of a device tree, i didnt realise that this would be a
> problem.

No problem, we're here to help you ;-)

> >> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> >> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> >> @@ -1,5 +1,5 @@
> >>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> -/* Copyright (c) 2020 Microchip Technology Inc */
> >> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> >>
> >>   /dts-v1/;
> >>
> >> @@ -13,72 +13,187 @@ / {
> >>          compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
> >>
> >>          aliases {
> >> -               ethernet0 = &emac1;
> >> -               serial0 = &serial0;
> >> -               serial1 = &serial1;
> >> -               serial2 = &serial2;
> >> -               serial3 = &serial3;
> >> +               mmuart0 = &mmuart0;
> >> +               mmuart1 = &mmuart1;
> >> +               mmuart2 = &mmuart2;
> >> +               mmuart3 = &mmuart3;
> >> +               mmuart4 = &mmuart4;
> >
> > Why? SerialN is the standard alias name.
> we changed the label to mmuart to match the microchip documentation.

The serialN aliases are standardized, so you cannot change them.

> would it make more sense to call mmuart but alias it to serial?
> ie serial0 = &mmuart0;

You can change the labels, so that's OK.

> >> +&spi1 {
> >> +       status = "okay";
> >
> > No slave devices specified?
> no, but its exposed

But without specifying slave devices first you cannot use the
controller anyway? While I2C supports instantiating slaves from
userspace by writing to the new_device file in sysfs, SPI doesn't
have that feature.

> >> +&gpio2 {
> >> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT
> >> +               PLIC_INT_GPIO2_NON_DIRECT>;
> >
> > Why override interrupts in the board .dts file?
> > Doesn't this belong in the SoC .dtsi file?
> The interrupt setup for the gpio isnt fixed, there is an option to
> either connect the individual gpio interrupts to the plic *or* they can
> be connected to a per gpio controller common interrupt, and it is up to
> the driver to read a register to determine which interrupt triggered the
> common/NON_DIRECT interrupt. This decision is made by a write to a
> system register in application code, which to us didn't seem like it
> belonged in the soc .dtsi.

So it is software policy? Then it doesn't belong in the board DTS either.

> Using the common interrupt for GPIO2 is the default on the
> polarfire-soc, there are only 38 per gpio line interrupts available of
> which 14 are connected to gpio0 and 24 to gpio1.

> >>                  plic: interrupt-controller@c000000 {
> >> -                       #interrupt-cells = <1>;
> >> -                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
> >> +                       compatible = "sifive,plic-1.0.0";
> >
> > Why drop the first one again?
> we felt it didnt make sense to have something that specifically
> references the fu540 in the device tree for this board.

That would be a revert of commit 73d3c44115514616 ("riscv: dts:
microchip: add missing compatibles for clint and plic"), which you
supplied an R-b tag for?

Is this the same plic as in the FU540 SoC? Or do we need a new
microchip,mpfs-plic compatible value?

> >> -               emac1: ethernet@20112000 {
> >> +               mac0: ethernet@20110000 {
> >>                          compatible = "cdns,macb";
> >> -                       reg = <0x0 0x20112000 0x0 0x2000>;
> >> +                       #address-cells = <1>;
> >> +                       #size-cells = <0>;
> >> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> >> +                       clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
> >> +                       clock-names = "pclk", "hclk";
> >>                          interrupt-parent = <&plic>;
> >> -                       interrupts = <70 71 72 73>;
> >> -                       local-mac-address = [00 00 00 00 00 00];
> >> -                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> >> +                       interrupts = <PLIC_INT_MAC0_INT
> >> +                               PLIC_INT_MAC0_QUEUE1
> >> +                               PLIC_INT_MAC0_QUEUE2
> >> +                               PLIC_INT_MAC0_QUEUE3
> >> +                               PLIC_INT_MAC0_EMAC
> >> +                               PLIC_INT_MAC0_MMSL>;
> >
> > Please group using angular brackets.
> >
> >> +                       mac-address = [56 34 12 00 FC 01];
> >
> > Please drop this.
> Is the problem here having mac-address instead of local-, having either
> at all or that we have populated it rather than just filling with 0s?

MAC addresses are supposed to be unique.

> We set it in u-boot anyway, so I think dropping entirely is okay.

Exactly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
