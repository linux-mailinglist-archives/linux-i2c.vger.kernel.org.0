Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0C22E6457
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Dec 2020 16:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391440AbgL1Ni2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 08:38:28 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41122 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391398AbgL1NiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Dec 2020 08:38:24 -0500
Received: by mail-ot1-f45.google.com with SMTP id x13so9112743oto.8;
        Mon, 28 Dec 2020 05:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtrfQuQnyNAaVJXZ6+NykLzyM/gg5DoautEkBZLloKQ=;
        b=XreerNaYqzFmQZcZkkQyCPSpOKhwTjjo2xWiG9wTC5UhMnt7GYcRWv4yVub9THkl1m
         xq3n0n8P6G2iz72uGcvKP5uNv1GsECOnKDuddcz43bTjwr7q2D9sFtGqd6KF/vTp0jLz
         acuonjG2AvmJhHwbtSVqkoskwD/hhnfl/grnsXlu4Um12IheBAzljsSdTyV6y8bAz1bO
         /tcZZE1N4L+cCKMj6ZEanceyaVUJmNeJSUBSStKraZbeDtqsenyZ9GJ9OyVuwq7W7gE4
         7PpCku9ve4pwCZxsbescCT32THHDpka4bMmHe/0JGjhSB+buWHNbnzEEeYVU9hT7mMB/
         erkw==
X-Gm-Message-State: AOAM530hx+FGM/MKyQRfHiWYaiXm/bs2xqMzEqbLRBkrzJnkAhUWQv+P
        g1J9/jXQZlBngIrdLDqaCcEJ3bFfmlpIlh3mQAg6nHjF
X-Google-Smtp-Source: ABdhPJwRKFKOGwrhQo6MkWu7nf73xZXEdW3xtWzT5PYhCCTBANFRv9cSRZQAD0yFMLygz7+JhGEPOm80gLjWa1fA3w0=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr32898563otc.145.1609162662989;
 Mon, 28 Dec 2020 05:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com> <20201223172154.34462-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172154.34462-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Dec 2020 14:37:32 +0100
Message-ID: <CAMuHMdW48sFLernApzcQ7Dqz90kX18d9+9e9ytQ=rVQ2hWD_4A@mail.gmail.com>
Subject: Re: [PATCH 4/4] i2c: rcar: protect against supurious interrupts on V3U
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 6:24 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> V3U creates spurious interrupts which we need to handle. This costs time
> until BUS_PHASE_DATA can be activated which is problematic for Gen2 SoCs
> and earlier. Because of this we introduce two interrupt handlers here
> which will call a generic main irq function once the timing critical
> stuff is done.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -625,20 +625,11 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
>   * generated. It turned out that taking a spinlock at the beginning of the ISR
>   * was already causing repeated messages. Thus, this driver was converted to
>   * the now lockless behaviour. Please keep this in mind when hacking the driver.
> + * R-Car Gen3 seems to have this fixed but earlier versions than R-Car Gen2 are

s/than/like/?

> + * likely affected. Therefore, we have different interrupt handler entries.
>   */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
