Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583164951A5
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 16:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376629AbiATPmM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 20 Jan 2022 10:42:12 -0500
Received: from mail-4018.proton.ch ([185.70.40.18]:21539 "EHLO
        mail-4018.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346423AbiATPmK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 10:42:10 -0500
Date:   Thu, 20 Jan 2022 15:42:06 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To:     Geert Uytterhoeven <geert@linux-m68k.org>
From:   conor dooley <mail@conchuod.ie>
Cc:     Conor Dooley <Conor.Dooley@microchip.com>,
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
        Lewis Hanly <Lewis.Hanly@microchip.com>,
        Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com,
        Atish Patra <atishp@rivosinc.com>
Reply-To: conor dooley <mail@conchuod.ie>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip mpfs i2c
Message-ID: <Op5n9imM72IZnLCmMZ8lEZ7GxZD-r4cYZDB6zF0DcNNRu5dwpGEgi7PyjsAfQFnTMEtB8DTS76wLNWcnTtfDMUa1KDZYO3_geq-oOVXOr50=@conchuod.ie>
In-Reply-To: <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com> <20220117110755.3433142-4-conor.dooley@microchip.com> <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com> <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com> <CAMuHMdXU_M89W7w064YsjuFfqE2m_PeM9HVps0nmaC1+aUHAQw@mail.gmail.com>
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

>Hi Conor,
>
>On Thu, Jan 20, 2022 at 2:42 PM <Conor.Dooley@microchip.com> wrote:
>> On 20/01/2022 08:30, Geert Uytterhoeven wrote:
>> > On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
>> > Wouldn't it be more logical to have:
>> >
>> >      items:
>> >        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
>> >
>> > ?
>> This would be fine for mpfs-i2c since corei2c is a "superset" - but how
>> would that look for the fabric core? I don't think falling back from the
>> fabric core onto the "hard" one makes sense. This would mean the
>> following two entries:
>>
>> i2c2: i2c@44000000 { //fabric
>>         compatible = "microchip,corei2c-rtl-v7";
>> };
>> i2c1: i2c@2010b000 { //"hard" mpfs peripheral
>>         compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
>> };
>
>Oops, I missed that you have both forms.
>But in se, they're the same IP core, just hard vs. soft? Then the
>below makes sense.
A lot (but not all) of the peripherals on Polarfire SoC are "subsets"
of the IP cores: I think corei2c is almost identical but for others
the hard version has some of the optional features disabled or slight
changes made.

If the IP is already written why not use it ;)
>
>> But this generates errors in dt_binding_check w/ your suggestion - so
>> how about the following (similar to ti,omap4-i2c.yaml):
>>
>>    compatible:
>>      oneOf:
>>        - items:
>>          - const: microchip,mpfs-i2c #  Microchip PolarFire...
>>          - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
>>
>> Is there a prettier way than this duplication?
>
>I'm afraid not, and the above scheme is used a lot.
Fair enough!
>
>> > If the IP core is reused, it can become:
>> >
>> >      items:
>> >        - enum:
>> >            - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>> >            - microchip,<foo>-i2c # ...
>> >        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
>> >
>> > That way the driver can just match on the second (fallback) value,
>> > and no further driver changes will be needed (until v8 or later).
