Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755662D5BF3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 14:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389111AbgLJNgZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 08:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387691AbgLJNgO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 08:36:14 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B0CC0617B0;
        Thu, 10 Dec 2020 05:35:08 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id u203so4734124ybb.2;
        Thu, 10 Dec 2020 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1HP1yIoElif264wBbc+cWtKQMdT/dfCn4qH9f3uFvE=;
        b=D+sXkGE27BvA8k13Mm/sLNkyOydzvwrVUbzyCyveTzQBfOflUmMnRdlUbE1OB+XKYW
         xAmA/jH7hEgXzn/jR1xat4Jl1JTLn1LNyvDwFWOyN+rM5gvFGsX2gF5jV/1zz/+DHn1p
         8GwqJ0+PjdYQGgBrXHoSoUxg8xvd1nCCjoet1SqORFlbPMQik1j9l0AqIccpUl/qOtje
         DhtZol6YtZnv2IoYwJphso8ZDk/O+9P+Z33jGvem80h46ouMJ4798Sy1u3SBX/QLLlV6
         LNMi9s4YUIU75yhG9QY+FS/b5Mh2TAC3FkdofTj8hYhqsvsCtdyzYHTTOsVJyyrrAMxi
         yglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1HP1yIoElif264wBbc+cWtKQMdT/dfCn4qH9f3uFvE=;
        b=oDVGKAPzDykgWcCYrkjS4djmj0vY2cRAJktLZt1sJbqu4tqXIK0OXS9DgNUeDN75vE
         e2Y9mtf7i1D/9imVOsSOMRdv2PglvGQl0olZ647n3JJbTT16aRpYDMzcOSA9YOt/de3s
         +of0V/HlxQhGRtaaL9DR8QMg4GmiUVQ0p8JA+VLneL7Goxh9bg1glLqXWVtqAKHyKt+3
         JJtnu3mpWBBf+NdIdqoHIzZ7+65F12xaQ2I2OCDF/44TsNNPr/4c0dVtnJ3/NJH+QmxD
         d+zIxxoXXiRErSQEy9/qONkZ0Sf8wU8ZlfFWDU2ODUoqN86rjs40AJY+kt729xsQ98Tu
         mSUA==
X-Gm-Message-State: AOAM531XW3cpvzDhAUXSp2mHBQh/1zC2zgStu0RphX18oFA9HFi+ctUL
        M4jQtSamROcTVAJa97NZYj3KJdCpik3ok6DbJzU=
X-Google-Smtp-Source: ABdhPJyr0TYOgXzMuicga7wyBOkKbBeJ/YheB2Zrk4q9fKy+qC4mFj82XZKUw2JcVTA3YVjJ1ocGnBF5j6BpIIbt1WI=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr11643994ybk.152.1607607307674;
 Thu, 10 Dec 2020 05:35:07 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com> <1607403341-57214-10-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-10-git-send-email-yash.shah@sifive.com>
From:   Bin Meng <bmeng.cn@gmail.com>
Date:   Thu, 10 Dec 2020 21:34:55 +0800
Message-ID: <CAEUhbmVi7oVEJhyar+GyCVY=MrZri9h3DvQWOceZhcqFe544Kw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] riscv: dts: add initial board data for the SiFive
 HiFive Unmatched
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        broonie@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de,
        Thierry Reding <thierry.reding@gmail.com>, andrew@lunn.ch,
        Peter Korsgaard <peter@korsgaard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add initial board data for the SiFive HiFive Unmatched A00.
> This patch is dependent on Zong's Patchset[0].
>
> [0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u

I think the dependency should be put below --, not in the commit message itself

>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/Makefile                |   3 +-
>  .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 +++++++++++++++++++++
>  2 files changed, 255 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>
> diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
> index 6d6189e..74c47fe 100644
> --- a/arch/riscv/boot/dts/sifive/Makefile
> +++ b/arch/riscv/boot/dts/sifive/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb
> +dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb \
> +                           hifive-unmatched-a00.dtb

Otherwise LGTM:
Reviewed-by: Bin Meng <bin.meng@windriver.com>
