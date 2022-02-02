Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 541134A728D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 15:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344712AbiBBOCU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 2 Feb 2022 09:02:20 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:42831 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235440AbiBBOCT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 09:02:19 -0500
Received: by mail-ua1-f54.google.com with SMTP id e17so19259384uad.9;
        Wed, 02 Feb 2022 06:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W397sX4ZIPE6GurWc9LBauNlzgQqsNKvK7n7V8hBvHg=;
        b=vXIEhJji2M2Ui5bSwzr5sDgaBMmYoXkThh6aSnEzeUQOwHSJ6AxRkbtMz/DhqAZ4FB
         KfvU3t37vwVw2m/uw2q+Uv8h7Rs7XZgpW0sgqOfDpBiUH8I95ljWyXY/vNlBjftvp54c
         hDkWhR2ppON6yvBUGUFdjO7HnzcQHFsZfMVlqIfP1HRf8wtrA5pFAr5K1hrYYt0S+/vp
         lOLH6gEXWiUK2NT6bFLW3uBisZdCB54Z+5Ag6ShPN8coHzPBtx+mEACIPZIC5vpt4LSt
         eAKx7tMf4UkObB2/qpMNk1ScCFmaV5Skk7ekoju9oY6wDGp9dNWcqLknq6YAyRiUuRyf
         vRVg==
X-Gm-Message-State: AOAM53011PHkHGzJj3A5p/t3Dh1RRYrXKOD8HaksMNanBdgzqUy3INsL
        QrI3YMLCT4TJrLFGepttz7jl40HZg+x4Bg==
X-Google-Smtp-Source: ABdhPJwrdxKYe66CQeAGWlF6jLnSq8KxD96wr5xMxhMQoDlTpK7/wYjcnOcL3DC/SiX+oamGJWXvbg==
X-Received: by 2002:ab0:6f11:: with SMTP id r17mr14040548uah.128.1643810536954;
        Wed, 02 Feb 2022 06:02:16 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id h30sm4860274vsq.7.2022.02.02.06.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 06:02:15 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a24so5575047uat.10;
        Wed, 02 Feb 2022 06:02:15 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr12258207vsj.5.1643810534765;
 Wed, 02 Feb 2022 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
 <20220202123542.3721512-1-conor.dooley@microchip.com> <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
 <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
In-Reply-To: <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 15:02:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
Message-ID: <CAMuHMdXvw9cNNzBhp-sSMTXxP2eALhB=fD78Wgx-kks7wr6oiQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
To:     Conor Dooley <Conor.Dooley@microchip.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@rivosinc.com>,
        Bin Meng <bin.meng@windriver.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Daire.McNamara@microchip.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Ivan.Griffin@microchip.com, Jassi Brar <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        Lewis Hanly <Lewis.Hanly@microchip.com>,
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

On Wed, Feb 2, 2022 at 2:46 PM <Conor.Dooley@microchip.com> wrote:
> On 02/02/2022 13:28, Geert Uytterhoeven wrote:
> > On Wed, Feb 2, 2022 at 1:33 PM <conor.dooley@microchip.com> wrote:
> >>> On 01/02/2022 07:58, Uwe Kleine-König wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>> On Mon, Jan 31, 2022 at 11:47:21AM +0000, conor.dooley@microchip.com wrote:
> >>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>
> >>>> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> >>>> controller.
> >>>>
> >>>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>>>
> >>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>>> ---
> >>>> .../bindings/pwm/microchip,corepwm.yaml       | 75 +++++++++++++++++++
> >
> >>>> +  microchip,sync-update:
> >>>> +    description: |
> >>>> +      In synchronous mode, all channels are updated at the beginning of the PWM period.
> >>>> +      Asynchronous mode is relevant to applications such as LED control, where
> >>>> +      synchronous updates are not required. Asynchronous mode lowers the area size,
> >>>> +      reducing shadow register requirements. This can be set at run time, provided
> >>>> +      SHADOW_REG_EN is asserted. SHADOW_REG_EN is set by the FPGA bitstream programmed
> >>>> +      to the device.
> >>>> +      Each bit corresponds to a PWM channel & represents whether synchronous mode is
> >>>> +      possible for the PWM channel.
> >>>> +
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint16
> >>>> +    default: 0
> >>>
> >>> I'm not sure I understand this correctly. This is a soft-core and you
> >>> can synthesize it either with or without the ability to do synchronous
> >>> updates or not, right? All 16 channels share the same period length and
> >>> in the simple implementation changing the duty cycle is done at once
> >>> (maybe introducing a glitch) and in the more expensive implementation
> >>> there is a register to implement both variants?
> >>
> >> Correct. If the IP is instantiated with SHADOW_REG_ENx=1, both
> >> registers that control the duty cycle for channel x have a second
> >> "shadow reg" synthesised. At runtime a bit wide register exposed to
> >> APB can be used to toggle on/off synchronised mode for all channels
> >> it has been synthesised for.
> >>
> >> I will reword this description since it is not clear.
> >
> > Shouldn't it use a different compatible value instead?
> > Differentiation by properties is not recommended, as it's easy to
> > miss a difference.
>
> Either you have something in mind that I've not thought of, or I've done
> a bad job of explaining again. The buffer/"shadow" registers are
> synthesised on a per channel basis, so any combination of the 16
> channels may have this capability. The same applies to the DAC mode, per
> channel there too.

Oops, hadn't noticed this is per channel. Indeed, then a different
compatible value is futile.
So since "microchip,sync-update" is a bitmask, perhaps it should be
called "microchip,sync-update-mask"?
Same for "microchip,dac-mode" -> "microchip,dac-mode-mask"?

Also, using different integer sizes than uint32 is frowned upon, unless
there is a very good reason to do so. I can imagine a future version
would support more channels, and then uint16 becomes a limitation.

For both: Rob?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
