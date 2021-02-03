Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158D730D489
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Feb 2021 09:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhBCICS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Feb 2021 03:02:18 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:35417 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhBCICQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Feb 2021 03:02:16 -0500
Received: by mail-oi1-f171.google.com with SMTP id w8so25854589oie.2;
        Wed, 03 Feb 2021 00:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GUaHpRuxDtXxAFdZvqP757XADeBZ3LieB9iSp5HePYo=;
        b=BbssH+gRTwu4QRBF+yEiZKPdWssG77YDInBTxcDlXmiiwk8Zfbw5R0Mj/5fntV7Lzm
         4BoOVlzppoctOlmsGgvvSHmqklV4G1R6rDknIn2W5kbLyqJlvP+0DzuQ1af23BuWvLUb
         a6jgav/rDxMqN4/sqT4DzoIGBqJ2NhMdl53pZbxHH9UlMXxzbBQXeFfdSMKEnYJaGktk
         vT6QglCWoz+PCPcPMiZRjccwMhE9Bnyc+wTzRGC232qrgJXcQROipJ/1NxIHYjJb5QMf
         czSvmT2Kza9JQ7tutfy/3n7Tseq0yHzaMEOWObmeHTbzqJGaQxE19eKweo/0w11kp0uH
         R+bQ==
X-Gm-Message-State: AOAM533MYl3088h12QzQ3eI8xQHGT/JLr7WxzJNjKa6ASz/6PIvdgrOY
        KiAnnszh8bFdebOt/vABz73VFwBndIhHDHdytVw=
X-Google-Smtp-Source: ABdhPJwqsuDHPLo5fOlX0wowinMiQhY3VwM6kpoW5w0c8+SrgPYoxRUVXo5rAHqaZ3aooghGfjdJuw8T8GflSuyMMQU=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr1200640oiy.148.1612339294830;
 Wed, 03 Feb 2021 00:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org> <20210202205544.24812-3-robh@kernel.org>
In-Reply-To: <20210202205544.24812-3-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Feb 2021 09:01:23 +0100
Message-ID: <CAMuHMdVvtUvrQh3-3kxaqqWvHnF_UOQmt-6jq_GkX8g=cszUug@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: Fix errors in 'if' schemas
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Daniel Palmer <daniel@thingy.jp>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vincent Cheng <vincent.cheng.xh@renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Tue, Feb 2, 2021 at 9:55 PM Rob Herring <robh@kernel.org> wrote:
> Properties in if/then schemas weren't getting checked by the meta-schemas.
> Enabling meta-schema checks finds several errors.
>
> The use of an 'items' schema (as opposed to the list form) is wrong in
> some cases as it applies to all entries. 'contains' is the correct schema
> to use in the case of multiple entries.

> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -81,9 +81,8 @@ properties:
>  if:
>    properties:
>      compatible:
> -      items:
> -        enum:
> -          - renesas,usb2-phy-r7s9210
> +      contains:
> +        const: renesas,usb2-phy-r7s9210

Single entry, so "contains" not needed?

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -76,11 +76,10 @@ required:
>  if:
>    properties:
>      compatible:
> -      items:
> -        enum:
> -          - renesas,pfc-r8a73a4
> -          - renesas,pfc-r8a7740
> -          - renesas,pfc-sh73a0
> +      enum:
> +        - renesas,pfc-r8a73a4
> +        - renesas,pfc-r8a7740
> +        - renesas,pfc-sh73a0

Missing "contains"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
