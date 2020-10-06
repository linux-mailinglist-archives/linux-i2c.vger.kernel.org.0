Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED24284902
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 11:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgJFJNS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 05:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgJFJNS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 05:13:18 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEB6C0613D7
        for <linux-i2c@vger.kernel.org>; Tue,  6 Oct 2020 02:13:17 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id w12so1938996uao.12
        for <linux-i2c@vger.kernel.org>; Tue, 06 Oct 2020 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8dDgYnCSpFzq6wD68V8dBs1dGtEohkus4tfFLo0MV6k=;
        b=mMV78gRfUiTX0Fhq7sbtPeAZE51FANqXe2ffb+yEjr5QoeawgMMwQ8XSrhilmLvHtx
         sEQF9fUq5Cmu8qOzxjbqa7RQXLkqpoqkoe++HcWkcaLYHbckkwjq/ue7xT3XAD7Uwx43
         V06RGxgjHInxMdw3DBkk+/9rjGYrV+FnbFAksujQ3/k0njBC0ztFm62WAFNts1zyT9yx
         oCohLIW+tNgNLvhP4H4CyiMr4WGBCs1Zex5WjzDVN9v47A0drQeaNuCYVRG5QCA6OMto
         TQSAPGix4TPbAEDvrfDxLrnk+h7EjMNps8LmL2KLypfVwnIUdvEC6slFmF9jTy6w85lq
         wAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8dDgYnCSpFzq6wD68V8dBs1dGtEohkus4tfFLo0MV6k=;
        b=V6GeIj4ao9wy82BqVZ6285O3aE9riwofrSVMqpuJJZtWPeXeceYN37ecWG020fy3ni
         N+rdy/txsgEyVd2ua7+07jnUyjL4JPzNoQHF6xxpjbdgndF5wo4LfWcfr5lr7aKUszPR
         9dsKD0UjsrcMTjwN/Y/C6+rfsc2C7GylOqTxL4VkgVwHJMnpcb0eMyAp5r9KmuGV/2jJ
         uIHDGXF1/TXvR2ethLrPah6lFJw1hbVxdYgAbHTjkjGW1OSr5enNubgR+ZFtZsms+TyV
         YCT7FzEZdFnW6c5Wx07UpD8q+n77GaC3z8c305bW3jqOWZLySIDjRbKoywPdrvkXIMC1
         EiMg==
X-Gm-Message-State: AOAM5310PMnS8cYTiKUoR7xe67hpnOCxO61Y/P6j/urJ0OMBnULlSxDw
        lC+Nx7yZ63rfX1x8qvUSx4eg39LRfs8EskYFi0zkiA==
X-Google-Smtp-Source: ABdhPJyShwqC7yW6UgNo8q98koC+vDiOR29TMFNqADEMu067y863m4dqGu1r37N7vNMGC6BIcV2u4BNvWr4WQc/Y4R4=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr2309765uae.100.1601975596602;
 Tue, 06 Oct 2020 02:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org> <20201005183830.486085-2-robh@kernel.org>
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 6 Oct 2020 11:12:39 +0200
Message-ID: <CAPDyKFqMic9_3OBvSWrdrXonDjeC+8kjDobTunijxvL6gYDPjQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
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
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
>
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
>
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml        | 2 ++
>  Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/owl-mmc.yaml           | 2 ++
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml  | 2 ++
>  Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml         | 2 ++
>  .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml       | 2 ++
>  Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml  | 2 ++

For mmc:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe
