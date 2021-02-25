Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5422324D35
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 10:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235087AbhBYJwG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 04:52:06 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:41783 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234521AbhBYJvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Feb 2021 04:51:52 -0500
Received: by mail-ot1-f42.google.com with SMTP id x9so741212otp.8;
        Thu, 25 Feb 2021 01:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udWaTMdB+jV7hdmJgJISIo6h7HtA2y/4OhXRlzEy98Q=;
        b=Ghv3CSxMCXNNcKr52fw1B5OxQ9qdKk6X8XfV1DMzBghHdMu3MtauFLGafnYc4AmyWm
         L5aE3a9xgT2Pb/QwffskMcrDoPYC4hGz5RLqOzqVny7mRHL+jkLwqNVAg1CQX2ITaXpW
         VKNgX8bZzqKRhkcRf4M3DgPCZbWQOZuA9Yd0vgJWSng7kXHwKGzjiGCxXCYKlX3jQ2EE
         muvYvQif8KNNZmvQxQPLDq4ev7lcFN5ZHIr59myQFJ2mrKq2Xtc1PNPrXpKnfOVxsNsA
         lnxyyFmFfPeBs/ni/BYVbY6DFluMvU3Y/uda0aF8hyPoF+MbEauuAAZPNIlfxn9wWhXv
         pk8Q==
X-Gm-Message-State: AOAM530pW1KDSrF3NHkyUf3Hfp4Ti4u6dgOFGJ1QOEPUDXPelAQxitXd
        4FIsP02OQyhf96+mCdI5qUimJ6SmJ/FBWfdKLvtr4zEG
X-Google-Smtp-Source: ABdhPJwubBtu6W0oabTdApL+rVZqzkFCdRBoFdIuypeWHxup54OLF85hFgDC1ljHI/rcERkgC8sPJmRz7aFoKjPfjOE=
X-Received: by 2002:a9d:6382:: with SMTP id w2mr1648590otk.145.1614246669619;
 Thu, 25 Feb 2021 01:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20210212164541.8986-1-uli+renesas@fpond.eu>
In-Reply-To: <20210212164541.8986-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Feb 2021 10:50:58 +0100
Message-ID: <CAMuHMdVsAgOrf2=4Fud6SWy6T98F5aFvD5aGdiu646=7bLbUZw@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: implement atomic transfers
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 12, 2021 at 5:45 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Implements atomic transfers. Tested by rebooting an r8a7790 Lager board
> after connecting the i2c-rcar controller to the PMIC in
> arch/arm/boot/dts/r8a7790-lager.dts like so:
>
>                 compatible = "i2c-demux-pinctrl";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&pmic_irq_pins>;
> -               i2c-parent = <&iic3>, <&i2c3>;
> +               i2c-parent = <&i2c3>, <&iic3>;
>                 i2c-bus-name = "i2c-pwr";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

LGTM (IANIE = ... No I2C Expert), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
