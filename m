Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3F03A66BD
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 14:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbhFNMkk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 08:40:40 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:44587 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbhFNMki (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Jun 2021 08:40:38 -0400
Received: by mail-ua1-f54.google.com with SMTP id e7so1338878uaj.11;
        Mon, 14 Jun 2021 05:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OvZoV5ZvCwgOZO5i1pZIEG1t7OHbYFkezPxKRjXkMck=;
        b=mv8VPseM3QYrcq9y22g4EU6hs+4THtpRN1LxrgZ/vDybnuPBuNpkhXFNElOL9yleBY
         unmPHkCfv9rcpOThpAz6upWJ3/y83LKsAXZxkghwoCxTe9Fs8F+Zb7LMBlh8NkvyHg91
         lJREaNcFXTFt+VyvXtL6uGKYUoikNyKV3uUpQ//Y/Dku53aCTv4sWSpDarLEqTXzOj3Z
         tGGeuk96+4yIu7pczLYiAlDpEqSr83sSiRf2fgFs4kcoOxK1defsrZY2TxV1upvKTUHI
         oDTQfFdEWoTZaBF6lEOT+8f+SjxQo/dzB6UTeo5IPUD/pAH8+Rm6N4DoLjl1KXX0Z+4W
         Kwng==
X-Gm-Message-State: AOAM530tgh1t8vKttGB4AsElgt+8Xk+VAUEfLSNF8GK24qhD7E0oRWBy
        EAhFRFZdGyp5mus24ufj9Mb0FzOb450oEMxSKXN6xzlZv69V3g==
X-Google-Smtp-Source: ABdhPJzp5CiHc8rTp6N0GqZD/yH1UJa6Qov4HyfgO5s3kpV0pS3vIo6n+cALEJ+WGENLepzP6N2w80gzsAMbFlnhxio=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr11714187ual.4.1623674314900;
 Mon, 14 Jun 2021 05:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com> <20210611165624.30749-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611165624.30749-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:38:23 +0200
Message-ID: <CAMuHMdWWgehDTxTcm8=ooq2-4BkY0jgo+hwfrM_PHc6iw6aP8A@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: riic: Add RZ/G2L support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Fri, Jun 11, 2021 at 6:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L i2c controller is compatible with RZ/A i2c controller.
> By default IP is in reset state, so need to perform release
> reset before accessing any register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -941,6 +941,7 @@ config I2C_QUP
>  config I2C_RIIC
>         tristate "Renesas RIIC adapter"
>         depends on ARCH_RENESAS || COMPILE_TEST
> +       select RESET_CONTROLLER

if ARCH_R9A07G044?

> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
_kzalloc(&pdev->dev, sizeof(*riic), GFP_KERNEL);
>         if (!riic)
> @@ -412,6 +421,17 @@ static int riic_i2c_probe(struct platform_device *pdev)
>                 return PTR_ERR(riic->clk);
>         }
>
> +       type = (enum riic_type)of_device_get_match_data(&pdev->dev);
> +       if (type == RIIC_RZ_G2L) {
> +               rstc = devm_reset_control_get(&pdev->dev, NULL);
> +               if (IS_ERR(rstc)) {
> +                       dev_err(&pdev->dev, "Error: missing reset ctrl\n");
> +                       return PTR_ERR(rstc);
> +               }
> +
> +               reset_control_deassert(rstc);

Just wondering: does it harm if the driver is unloaded or unbounded,
and rebound while the I2C controller is not in reset state?

> +       }
> +
>         for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
>                 res = platform_get_resource(pdev, IORESOURCE_IRQ, riic_irqs[i].res_num);
>                 if (!res)
> @@ -472,6 +492,7 @@ static int riic_i2c_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id riic_i2c_dt_ids[] = {
> +       { .compatible = "renesas,riic-r9a07g044", .data = (void *)RIIC_RZ_G2L },
>         { .compatible = "renesas,riic-rz" },

Please fill in .data, to avoid relying implicitly on RIIC_RZ_A being zero.

>         { /* Sentinel */ },
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
