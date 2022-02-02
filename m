Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190244A7192
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 14:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344344AbiBBN3C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 2 Feb 2022 08:29:02 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:39841 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344349AbiBBN3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 08:29:01 -0500
Received: by mail-ua1-f44.google.com with SMTP id p7so19091666uao.6;
        Wed, 02 Feb 2022 05:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=trhdKZIi8I2pglvejnlK+EON8M6pVXEzurOEfFekmwA=;
        b=NDIuG5Pi0RdZNClC6AFzmJq+zx47L+ZZZjLB2ZFaV6XrOF3ywZH+eiY2bVFLsGSMrs
         O4DRqoCyI6KEWdCbmdwUFKch1il2Qtz/HSVlPo3XicEQrluhlmmpug4ldYDTV4kfnrPu
         QZG9puHGwLxTgxqt/sOxUywruSr79hqJdYFJH3iXkSIvL9wJj80vl3WEUj3ivYCv6Glb
         FRHYMcTBcQdQZVpkKu11OOm6vCk4wvhbX1Lk431h3fNhG3xivZsuhcptT3yVpbRSzn5V
         P5D3Ayk4w778vx4y0VJBVMnFfjF3+rPcChOHgmT4e9T9grh1sKXh4+nJQXQwRMUBIVIM
         X1SA==
X-Gm-Message-State: AOAM532BgyTnqVM6Dt47WKltyeLBfzEvwaS/0JMdFxymQWjA7MHkS/xh
        HDF9ssRoQp4g2yPolL6Ciejl3iNtfwAY3g==
X-Google-Smtp-Source: ABdhPJwOCYEB0n0smzN8MUREPyW9ujuCeDrEIwHTWP/Cw+4jPYq/YplrVxvwMHSN7Ip3AGfOlIuXSQ==
X-Received: by 2002:a05:6102:2416:: with SMTP id j22mr12057554vsi.8.1643808540650;
        Wed, 02 Feb 2022 05:29:00 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 17sm3369288vky.10.2022.02.02.05.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 05:29:00 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id b37so19051548uad.12;
        Wed, 02 Feb 2022 05:28:59 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr11229610vsb.68.1643808539621;
 Wed, 02 Feb 2022 05:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de> <20220202123542.3721512-1-conor.dooley@microchip.com>
In-Reply-To: <20220202123542.3721512-1-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 14:28:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
Message-ID: <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@rivosinc.com>,
        Bin Meng <bin.meng@windriver.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        daire.mcnamara@microchip.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        ivan.griffin@microchip.com, Jassi Brar <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Lewis Hanly <lewis.hanly@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-rtc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Wed, Feb 2, 2022 at 1:33 PM <conor.dooley@microchip.com> wrote:
> >On 01/02/2022 07:58, Uwe Kleine-König wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >> On Mon, Jan 31, 2022 at 11:47:21AM +0000, conor.dooley@microchip.com wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> >> controller.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >> .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++

> >> +  microchip,sync-update:
> >> +    description: |
> >> +      In synchronous mode, all channels are updated at the beginning of the PWM period.
> >> +      Asynchronous mode is relevant to applications such as LED control, where
> >> +      synchronous updates are not required. Asynchronous mode lowers the area size,
> >> +      reducing shadow register requirements. This can be set at run time, provided
> >> +      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstream programmed
> >> +      to the device.
> >> +      Each bit corresponds to a PWM channel & represents whether synchronous mode is
> >> +      possible for the PWM channel.
> >> +
> >> +    $ref: /schemas/types.yaml#/definitions/uint16
> >> +    default: 0
> >
> >I'm not sure I understand this correctly. This is a soft-core and you
> >can synthesize it either with or without the ability to do synchronous
> >updates or not, right? All 16 channels share the same period length and
> >in the simple implementation changing the duty cycle is done at once
> >(maybe introducing a glitch) and in the more expensive implementation
> >there is a register to implement both variants?
>
> Correct. If the IP is instantiated with SHADOW_REG_ENx=1, both
> registers that control the duty cycle for channel x have a second
> "shadow reg" synthesised. At runtime a bit wide register exposed to
> APB can be used to toggle on/off synchronised mode for all channels
> it has been synthesised for.
>
> I will reword this description since it is not clear.

Shouldn't it use a different compatible value instead?
Differentiation by properties is not recommended, as it's easy to
miss a difference.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
