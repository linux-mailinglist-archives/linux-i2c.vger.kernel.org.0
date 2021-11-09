Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B815444AE63
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 14:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239831AbhKINHq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 08:07:46 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:44689 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239667AbhKINHp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 08:07:45 -0500
Received: by mail-ua1-f53.google.com with SMTP id s13so22783966uaj.11;
        Tue, 09 Nov 2021 05:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vgpOPNVaeGpR0Ki0HulbC5z3/SLOjosZPp/hdlc7Fb8=;
        b=drohblqOx/XMzIw3YMnCrwywItsRHsvTFD1JITJ5OjhjyRln+Oc1xvi2mmO+8gW8FK
         SGvsNrm03/vGhZTbMzNsqNW33af+8uUFJdJXHYdeo70AcqLHbzhBlTAlFA+FEz5L8/wa
         Ji51/dRXLCAGy+4xzLwMIOZ3S5Y1oi19sCY5eeWqTvLpkyJao1tWHjGO4KBTj68qVWNL
         km5GhbDKxCNqWVbpnZaABJ5k5lZLOTVZyd06IbjWVIhem6Q3Uo2HTNLn1tCKAVYy8LW5
         X/Kq4c/tNQDGE7RI1wokelu7H6achcnB66eyvFWRV+BSeZQqQJ0xFJcWEnYVq0/UFPAc
         kfLg==
X-Gm-Message-State: AOAM530zqT7VhiISgp5Di4YHaJaDfjQAnVT8+NwePRQziNeqwIMaeFDu
        Z4pz6sOcxKzg/4ZaXSGpvTcKM9duHvH+EA==
X-Google-Smtp-Source: ABdhPJzSIHC3VI6Q0GnXUC+7/z9SV42n0fCqCCDAJOWXyHFSUkn8RnnuK/2yjvn4mPjT3wb7R6L6Ow==
X-Received: by 2002:a05:6102:ccd:: with SMTP id g13mr12242714vst.7.1636463098833;
        Tue, 09 Nov 2021 05:04:58 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id b129sm2457512vsc.5.2021.11.09.05.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 05:04:57 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id o26so38316213uab.5;
        Tue, 09 Nov 2021 05:04:57 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr87197501vsu.35.1636463097035;
 Tue, 09 Nov 2021 05:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-5-conor.dooley@microchip.com> <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
 <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com>
In-Reply-To: <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 14:04:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
Message-ID: <CAMuHMdUs7UnADr2SfHBD4sGs3_giR0cmXnz=6qa4iAP1reDtgA@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
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

On Tue, Nov 9, 2021 at 1:08 PM <Conor.Dooley@microchip.com> wrote:
> On 09/11/2021 08:34, Geert Uytterhoeven wrote:
> > On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add mpfs-soc to clear undocumented binding warning
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> >> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> >> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> >> @@ -21,6 +21,7 @@ properties:
> >>         - enum:
> >>             - microchip,mpfs-icicle-kit
> >>         - const: microchip,mpfs
> >> +      - const: microchip,mpfs-soc
> >
> > Doesn't the "s" in "mpfs" already stand for "soc"?
> not wrong, but using mpf-soc would be confusing since "mpf" is the part
> name for the non soc fpga. is it fine to just reuse "mpfs" for the dtsi
> overall compatible and for the soc subsection?

I really meant: what is the difference between "microchip,mpfs" and
"microchip,mpfs-soc"? Can't you just use the former?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
