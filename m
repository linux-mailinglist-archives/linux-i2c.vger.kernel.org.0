Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26BE284921
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 11:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgJFJNe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 05:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgJFJNd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 05:13:33 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4621AC0613DA
        for <linux-i2c@vger.kernel.org>; Tue,  6 Oct 2020 02:13:33 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y194so5735411vsc.4
        for <linux-i2c@vger.kernel.org>; Tue, 06 Oct 2020 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zZ3JqKuAucMkJsBK3uQ6oqn08Q8o246NeeOkBUzIpE=;
        b=sl5DvJTU8XoKckrDy72v6SE14TnVpy4Bt91zBzW0shyY1MAQ6mAh44/03XDifpnVyT
         4w+72PUsHJIIJhKHPRrCT8pTCi2CZ3lYrznO931Zy9GGzbJgV3AbLMDW/WTkvZw1ySi0
         xZ8mKac9WB616FWJmzh+4pR4DO2W+qMrWvhETvIhmdmS6svN/TirR+Lk59vHi5nED0Fw
         UNsL0wfC4tJEer6UJgLfY8iJyldfPPnH6zruIDXY8NS9LaxnxiZNZZ15iF6VLc8jtGT7
         kw77Swrlk5F0D0JlHVpGszmJH8RyljctW41ctPimXYx2UDZ6rbS2tZM9fINpQJUVuEtk
         CGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zZ3JqKuAucMkJsBK3uQ6oqn08Q8o246NeeOkBUzIpE=;
        b=ZLmv+MMt0wA2TWaQPIZxGwoLtMBILWVzYTm2bEjBXJNBRKksaJNdr6ywLFhDvI6Jto
         wSQszLqIQ2U1Sz2p2qWLUbUk14gau9X/zjB1Jy0uAR3xwSFWKFVr7QxPnccyiG3pwYvQ
         6LYrf8PscHrXoHFxK1QW+b+SSNa2st/BXpNAC5UZ/ct2sjf7dznK7sVEGyczh2AKuPv8
         0jub5g7Nn7YqgV8oVLvMF33N12oLHkrgujtQcuaR1LoOdm9VgfuXavCEXBG+dg0XsMuZ
         fJQTO/o7ekfSa4lRt3adD+WQDOISQYdJUSbKCabMyn4wT05GFzyBUAE4vTnYR8GD4T/n
         yQUw==
X-Gm-Message-State: AOAM532J6vu0USyiy1+XvC5CiDsBerO+6lBc5smYLS04Y7HhuyBPxH4E
        R6SOuy1B5H8+q6hTvBE4Bl9KYkm/EFo+yWVnXiCizg==
X-Google-Smtp-Source: ABdhPJw+U5yOHue/Ytd8RPqMjT92IYE0mZoO7yO1YIY/4s+p2JNLru501tVYMlY3tURTLHPZrBHXQO8va9HmuomgCis=
X-Received: by 2002:a67:6b07:: with SMTP id g7mr2713184vsc.48.1601975612161;
 Tue, 06 Oct 2020 02:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org> <20201005183830.486085-5-robh@kernel.org>
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 6 Oct 2020 11:12:55 +0200
Message-ID: <CAPDyKFoxg_i8tcRjV_htv9s1Z=gxYzJtxPAnCqRR9gzR2hkG0w@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
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
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>, linux-pwm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 5 Oct 2020 at 20:38, Rob Herring <robh@kernel.org> wrote:
>
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml    | 2 ++
>  .../devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml     | 2 ++
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml   | 2 ++

[...]

>  Documentation/devicetree/bindings/power/power-domain.yaml    | 2 ++

For mmc and power-domain:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe
