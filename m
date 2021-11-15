Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EC045096E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 17:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236742AbhKOQVF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 11:21:05 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:33322 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236675AbhKOQVB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 11:21:01 -0500
Received: by mail-ua1-f51.google.com with SMTP id b17so36132512uas.0;
        Mon, 15 Nov 2021 08:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzrpV0n9zVO9H1XuqgeVs7Q9WtEYC0pbJKOVtZbpaDc=;
        b=c3m3eSIfYiEC0NWP16r35KBdx003YO64EM8bsbbf7l8iD4FHHpgr2vaiRk6VHd9JpL
         sRjDbE9nDnCeSzklRWyshd8uyJooCA0jJJ/iDdNzmCXNSZtRTxqWU4fKBExnkJDROpHX
         4m7rZzy0H0TgYgDnvNTsXcX2MZpn7mXRZYMZ6RYkUWhlckJLu0DNl3q07wTzZAp798CK
         +1Va2QRfrYhgPgCNb6rQ08+Lsla6IAa10AooLTZ5ggg+3i9yTFm3FZeJHv7F+pgre9vF
         evMWGBqVHikQisQ6gbV6xNv1nJxq04vKS/d7z+0AFbaiJwzO7nu5R7dFSXpAeEwChfo+
         RkCg==
X-Gm-Message-State: AOAM532QC/Ux1BYrHah4EZqIFgEjNpSw8qPrPI1rlN4OcU7ZBix3TAdz
        QdoLCPeJexBD3Ci8ivQkuBBi6ZZimXi/7A==
X-Google-Smtp-Source: ABdhPJyjBd8r6yk0+8TjqLB+l1w5Xx1fbP1OcgHYM+wbr7gXuGVd50UiW0X6hmbtKEfumh/+ffBcUA==
X-Received: by 2002:a67:4347:: with SMTP id q68mr45237935vsa.40.1636993085092;
        Mon, 15 Nov 2021 08:18:05 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id m15sm9718868vsh.31.2021.11.15.08.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 08:18:04 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id w23so13090411uao.5;
        Mon, 15 Nov 2021 08:18:03 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr44690576vsj.50.1636993083572;
 Mon, 15 Nov 2021 08:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com> <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com> <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
 <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
In-Reply-To: <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Nov 2021 17:17:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
Message-ID: <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
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
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Mon, Nov 15, 2021 at 4:39 PM <Conor.Dooley@microchip.com> wrote:
> On 10/11/2021 14:58, Geert Uytterhoeven wrote:
> > On Wed, Nov 10, 2021 at 3:20 PM <Conor.Dooley@microchip.com> wrote:
> >> On 09/11/2021 09:04, Geert Uytterhoeven wrote:
> >>> On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> >>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>
> >>>> +&gpio2 {
> >>>> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT
> >>>> +               PLIC_INT_GPIO2_NON_DIRECT>;
> >>>
> >>> Why override interrupts in the board .dts file?
> >>> Doesn't this belong in the SoC .dtsi file?
> >> The interrupt setup for the gpio isnt fixed, there is an option to
> >> either connect the individual gpio interrupts to the plic *or* they can
> >> be connected to a per gpio controller common interrupt, and it is up to
> >> the driver to read a register to determine which interrupt triggered the
> >> common/NON_DIRECT interrupt. This decision is made by a write to a
> >> system register in application code, which to us didn't seem like it
> >> belonged in the soc .dtsi.
> >
> > So it is software policy? Then it doesn't belong in the board DTS either.
>
> The write (if was to be done) would be done by the bootloader, based on
> the bitstream written to the FPGA, before even u-boot is started. By
> application I meant the bootloader (or some other bare metal
> application), not a program running in userspace in case that's what you
> interpreted. Am I incorrect in thinking that if it is set up by the
> bootloader that Linux can take it for granted?

If it is to be provided by the boot loader, the boot loader should fill
in the interrupts property, just like it already does (or should do, if it
doesn't) for /memory and chosen/bootargs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
