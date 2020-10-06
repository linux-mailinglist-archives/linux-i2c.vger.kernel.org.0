Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077AB2847B5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 09:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgJFHng (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 03:43:36 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:45394 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgJFHnf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 03:43:35 -0400
Received: by mail-oo1-f66.google.com with SMTP id h8so2944257ooc.12;
        Tue, 06 Oct 2020 00:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LzRJVHcc4AOcRIg5DtD/82Z3g3zvHdupm81fE1K+lIM=;
        b=BW/5PAt2AJgMD9SfH/QsesYXt+U/6bJFbJQJfG5sxIYovIOzcyQ6gF2bIj00iMfQ8d
         RZygqQIpMNr1c+c+L666giDhaIvxt5bpg7pDbrKAdRYbskhePtOFUFbeCsi0PR6i9hri
         ukWIrXxRgbSvImT6J1AG3aaltDe/P34wE+52dYRr/0L4r82SfI/cnWcILSJRt6MC4EFH
         SLfakT9+lnXcfJoqT4igN3gNVxCTnXPonal2wWndqUtrEghaWXsLvLlSScDMWEnpjS0m
         HDh/nWOTCWl2WQupa64z+xozEO0bj2+IfqFYzSW5VUxjh8t+/MDCnCUK5icpBh4CnM7+
         knFw==
X-Gm-Message-State: AOAM531AZ0jK25lmTr78zk4FeDlzxsf7eKFhghkWNIuZSDrAmrWiyT8O
        jhv9FD23b84uzn6+4x0NIIkF/ZddD/1VaqeSXVk=
X-Google-Smtp-Source: ABdhPJyU6RRQM46ugWdopDgtkhgi7iGduwzWS1jU+uDheEg5pvon8IztULtlGUyDWuzb6A77GTJ3kgcTOraYuvM5h0M=
X-Received: by 2002:a4a:4f17:: with SMTP id c23mr2343959oob.11.1601970213208;
 Tue, 06 Oct 2020 00:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org> <20201005183830.486085-5-robh@kernel.org>
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Oct 2020 09:43:22 +0200
Message-ID: <CAMuHMdVfNE_vLgmCEH7-cat_OasxxZ958WMDUmaFi8PbbEvbaA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        dmaengine <dmaengine@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-can@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-rtc@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 5, 2020 at 8:39 PM Rob Herring <robh@kernel.org> wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/bus/simple-pm-bus.yaml     | 2 ++

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
