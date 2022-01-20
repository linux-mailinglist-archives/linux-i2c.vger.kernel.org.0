Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EBC4949A3
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 09:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238063AbiATIgZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 03:36:25 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:44026 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbiATIgZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 03:36:25 -0500
Received: by mail-ua1-f43.google.com with SMTP id 2so9420095uax.10;
        Thu, 20 Jan 2022 00:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rjpWEc8ofW9Ln+ZzVM/iDZ8qr5vzNcJvKqxioEzCZGY=;
        b=K8E1eXzycKiQIRWxj6qfUFajLTr2sy1dSiMuVac4Ojo2F6egeEaTWG9ZbEsgSkDSEw
         qRqO5uQssP45mWIaWpG7nVB3Q97Z1Jr6E/38JLbdq15EI8lBonmLG/R6A0L2wQywHdjM
         tlbG4o+STxkRss/G4WwK4qJM73GTuEXEIIUh6QnfAQP1F4VZPE5JUYse+fcFqMZoHYGf
         ZafxGxjyuI5ZOlCI72DNOr278MsPXFnFRVZNTSTswiks1K2dV8F/xbDEQ2JSlTgfnhoE
         hGKLjtKpj5enGPziEdb98hFXbm2BZ4uB/Zgol/rIMf2zdXs4p+1IuBSGQGYYFahsa+z3
         ATDw==
X-Gm-Message-State: AOAM5316YKeuEQHWPMSP3XHEStDeK+5+1EWFv3Cbk15N8tilVELLYVbW
        GecERymnasaq70RxfNTmqifMrUS2CgMjdQ==
X-Google-Smtp-Source: ABdhPJxGe1OsDYfyTFLeqMrnaPPS7g1NHd4Hi0o7FeKUu5n/kYgAXhvWwHI1mDzEE/HawGiFuMYvRg==
X-Received: by 2002:a05:6102:3a68:: with SMTP id bf8mr13173693vsb.63.1642667783746;
        Thu, 20 Jan 2022 00:36:23 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id bj23sm432855vkb.23.2022.01.20.00.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 00:36:23 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id r15so9486981uao.3;
        Thu, 20 Jan 2022 00:36:23 -0800 (PST)
X-Received: by 2002:a1f:a2d3:: with SMTP id l202mr4847687vke.7.1642667418540;
 Thu, 20 Jan 2022 00:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20220117110755.3433142-1-conor.dooley@microchip.com> <20220117110755.3433142-4-conor.dooley@microchip.com>
In-Reply-To: <20220117110755.3433142-4-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Jan 2022 09:30:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
Message-ID: <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
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

On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS I2C Controller Device Tree Bindings
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
> +      - microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core

Wouldn't it be more logical to have:

    items:
      - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
      - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core

?

If the IP core is reused, it can become:

    items:
      - enum:
          - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
          - microchip,<foo>-i2c # ...
      - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core

That way the driver can just match on the second (fallback) value,
and no further driver changes will be needed (until v8 or later).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
