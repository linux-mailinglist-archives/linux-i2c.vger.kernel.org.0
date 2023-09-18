Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7BD7A4CF8
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Sep 2023 17:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjIRPow convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 18 Sep 2023 11:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjIRPot (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Sep 2023 11:44:49 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F061733;
        Mon, 18 Sep 2023 08:42:25 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ab2436b57dso3235143b6e.0;
        Mon, 18 Sep 2023 08:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695051516; x=1695656316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLTj/dIeHakdlBkBIPpX5wVMNJ4sgn2AfLAe4iQ8kHo=;
        b=qZZlhrtpjcBjH5jwYbK1PQDAYIGU7cEAe/pLW7GJ00EhV+4fvX+vgQ4uTFqTqtzZUl
         fj7r85V+8Kv0cS3Cebh1rC4uTjzxhRGp4nHbMPQrOxUaBFOM5RoLbJphvROreZH15jwf
         +AdzZ9/qzMjoCTfAj0PS/nWH5HCuYsB9OThp5EXK5+NE/ePMv9a+VKWSylPhi4DSMjmb
         0DcKFwJ/mBdO6RLo4qyxqTPQxY+ASusiPR00bL0RVDNt1fozsX6/TtEy9QOygY9WjqFs
         YwOzF2scQhRa6e63YjMAMdKzHSNo/fulb62+LrF0IxfC5islD2xmQxBMmXj144Fi4lkA
         r51Q==
X-Gm-Message-State: AOJu0YxWeoJEIErQavr+RhcAoKczmpqIscFXR9aoeoz67xXENvfV0yC3
        B8Z+JV/J2LZbPhjusDJG1mHcC6x01709tA==
X-Google-Smtp-Source: AGHT+IEAFeNI1m8e6h4D0yZPstL1zLrjBGuuZFG/9J87qWAAUBTR879BPoOQfkBTEKpzeMSmonht9Q==
X-Received: by 2002:a81:8887:0:b0:594:ea4f:f5a7 with SMTP id y129-20020a818887000000b00594ea4ff5a7mr9831073ywf.31.1695048310277;
        Mon, 18 Sep 2023 07:45:10 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c127-20020a0df385000000b005463e45458bsm2617102ywf.123.2023.09.18.07.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:45:10 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59bd2e19c95so48609497b3.0;
        Mon, 18 Sep 2023 07:45:10 -0700 (PDT)
X-Received: by 2002:a81:7c42:0:b0:58f:bda3:8dd with SMTP id
 x63-20020a817c42000000b0058fbda308ddmr10666610ywc.32.1695048309901; Mon, 18
 Sep 2023 07:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com> <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Sep 2023 16:44:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvqhk0XvaJWuzqqnyDn8muk2GTaFZ5zi8W1eYKTg2_zQ@mail.gmail.com>
Message-ID: <CAMuHMdUvqhk0XvaJWuzqqnyDn8muk2GTaFZ5zi8W1eYKTg2_zQ@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Sep 13, 2023 at 11:38 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> With some new registers, SCL can be calculated to be closer to the
> desired rate. Apply the new formula for R-Car Gen3 device types.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -84,11 +88,25 @@
>  #define RMDMAE BIT(1)  /* DMA Master Received Enable */
>  #define TMDMAE BIT(0)  /* DMA Master Transmitted Enable */
>
> +/* ICCCR2 */
> +#define CDFD   BIT(2)  /* CDF Disable */
> +#define HLSE   BIT(1)  /* HIGH/LOW Separate Control Enable */
> +#define SME    BIT(0)  /* SCL Mask Enable */
> +
>  /* ICFBSCR */
>  #define TCYC17 0x0f            /* 17*Tcyc delay 1st bit between SDA and SCL */
>
>  #define RCAR_MIN_DMA_LEN       8
>
> +/* SCL low/high ratio 5:4 to meet all I2C timing specs (incl safety margin) */
> +#define RCAR_SCLD_RATIO                5
> +#define RCAR_SCHD_RATIO                4
> +/*
> + * SMD should be smaller than SCLD/SCHD and is always around 20 in the docs.
> + * Thus, we simply use 20 which works for low and high speeds.
> +*/

(checkpatch) WARNING: Block comments should align the * on each line

> +#define RCAR_DEFAULT_SMD       20
> +
>  #define RCAR_BUS_PHASE_START   (MDBS | MIE | ESG)
>  #define RCAR_BUS_PHASE_DATA    (MDBS | MIE)
>  #define RCAR_BUS_PHASE_STOP    (MDBS | MIE | FSB)

> @@ -301,24 +316,57 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
>         round = DIV_ROUND_CLOSEST(ick, 1000000);
>         round = DIV_ROUND_CLOSEST(round * sum, 1000);
>
> -       /*
> -        * SCL  = ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
> -        * 20 + 8 * SCGD + F[...] = ick / SCL
> -        * SCGD = ((ick / SCL) - 20 - F[...]) / 8
> -        * Result (= SCL) should be less than bus_speed for hardware safety
> -        */
> -       scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
> -       scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
> -       scl = ick / (20 + 8 * scgd + round);
> +       if (priv->devtype < I2C_RCAR_GEN3) {
> +               u32 scgd;
> +               /*
> +                * SCL  = ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
> +                * 20 + 8 * SCGD + F[...] = ick / SCL
> +                * SCGD = ((ick / SCL) - 20 - F[...]) / 8
> +                * Result (= SCL) should be less than bus_speed for hardware safety
> +                */
> +               scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
> +               scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
> +               scl = ick / (20 + 8 * scgd + round);
>
> -       if (scgd > 0x3f)
> -               goto err_no_val;
> +               if (scgd > 0x3f)
> +                       goto err_no_val;
>
> -       dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
> -               scl, t.bus_freq_hz, rate, round, cdf, scgd);
> +               dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
> +                       scl, t.bus_freq_hz, rate, round, cdf, scgd);
>
> -       /* keep icccr value */
> -       priv->icccr = scgd << cdf_width | cdf;
> +               priv->icccr = scgd << cdf_width | cdf;
> +       } else {
> +               u32 x, sum_ratio = RCAR_SCHD_RATIO + RCAR_SCLD_RATIO;
> +               /*
> +                * SCLD/SCHD ratio and SMD default value are explained above
> +                * where they are defined. With these definitions, we can compute
> +                * x as a base value for the SCLD/SCHD ratio:
> +                *
> +                * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
> +                * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
> +                *               + RCAR_SCHD_RATIO * x + F[...])

(checkpatch) WARNING: please, no space before tabs

I hope to give this a full test-run on my farm soon...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
