Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82A649509E
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 15:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbiATO5B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 09:57:01 -0500
Received: from mail-vk1-f178.google.com ([209.85.221.178]:42639 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbiATO5A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 09:57:00 -0500
Received: by mail-vk1-f178.google.com with SMTP id m57so3726299vkf.9;
        Thu, 20 Jan 2022 06:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1L35cmAx7uCLqrcryWAZKBNOGx+ekbrBkpQCXHRgWJQ=;
        b=oEJ0SaQXI4alA5reStSBMsu+rR77UWNbxgSB4YjV2zNu21QyT0ULxYvpB741T+zCrx
         Ce1vo+XVBj/Fvs9g2XlKGZ4B8yBTLAVPOvi8oE/zCvlvF+UGuxIBftD+EblhAiV0KZeS
         zNThkrRGwyxQ3b7t7Rg6QB6SB3HHMdUTRftK2GiVVkcCXpY6y4wa7ums24QlsUJhoEoo
         tUp6yEZRg6DGXmVIUXku1zblaZXROtR8buqyBkLBQBICj+HtDvFafMD6DmS0EiwIITj7
         9VoLrKfQxhFgL++SDeFjoKSFP4spgjg/YQfkQ17ItqaEvi9fb8bu1A2Zv+Bbbb9iuku4
         Or8A==
X-Gm-Message-State: AOAM533Ypntc+0G3BNd3a388YHlSJcm29LRBHvLOoXxyNjO2kWEupfKY
        3mORqfYZCwEdv++xk1jB4eFw04uyN8Hp0w==
X-Google-Smtp-Source: ABdhPJwtBz5xu6kkUSgMDWT3reX8oOw/ICTZRv6mefGmvRx9v+0CD6OCOR52cNTnIgrnTf+RyXzN5A==
X-Received: by 2002:a05:6122:208c:: with SMTP id i12mr14370747vkd.2.1642690619315;
        Thu, 20 Jan 2022 06:56:59 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ba16sm474926vkb.39.2022.01.20.06.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 06:56:58 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id n15so9789369uaq.5;
        Thu, 20 Jan 2022 06:56:57 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id h1mr14235247vsu.5.1642690617601;
 Thu, 20 Jan 2022 06:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com> <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
 <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com>
In-Reply-To: <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Jan 2022 15:56:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
Message-ID: <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
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
        Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Thu, Jan 20, 2022 at 2:42 PM <Conor.Dooley@microchip.com> wrote:
> On 20/01/2022 08:30, Geert Uytterhoeven wrote:
> > On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the i2c controller on
> >> the Microchip PolarFire SoC.
> >>
> >> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> >> @@ -0,0 +1,55 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Microchip MPFS I2C Controller Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - Daire McNamara <daire.mcnamara@microchip.com>
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> >> +      - microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> >
> > Wouldn't it be more logical to have:
> >
> >      items:
> >        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> >
> > ?
> This would be fine for mpfs-i2c since corei2c is a "superset" - but how
> would that look for the fabric core? I don't think falling back from the
> fabric core onto the "hard" one makes sense. This would mean the
> following two entries:
>
> i2c2: i2c@44000000 { //fabric
>         compatible = "microchip,corei2c-rtl-v7";
> };
> i2c1: i2c@2010b000 { //"hard" mpfs peripheral
>         compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
> };

Oops, I missed that you have both forms.
But in se, they're the same IP core, just hard vs. soft? Then the
below makes sense.

> But this generates errors in dt_binding_check w/ your suggestion - so
> how about the following (similar to ti,omap4-i2c.yaml):
>
>    compatible:
>      oneOf:
>        - items:
>          - const: microchip,mpfs-i2c #  Microchip PolarFire...
>          - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>
> Is there a prettier way than this duplication?

I'm afraid not, and the above scheme is used a lot.

> > If the IP core is reused, it can become:
> >
> >      items:
> >        - enum:
> >            - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> >            - microchip,<foo>-i2c # ...
> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> >
> > That way the driver can just match on the second (fallback) value,
> > and no further driver changes will be needed (until v8 or later).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
