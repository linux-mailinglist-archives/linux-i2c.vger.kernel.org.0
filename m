Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F397A5D86
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjISJOr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbjISJOo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:14:44 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A72CBA;
        Tue, 19 Sep 2023 02:14:38 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso4951312276.2;
        Tue, 19 Sep 2023 02:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695114877; x=1695719677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MSO5lD8RKg6VvtS+ClT/cQo/SrUji89hPMUsMMZm+M=;
        b=jyioexCr/VPe5EG4K7GGydRU0zW4MOw1dHQpngqJXNh6nMllGTMJiiuZzlMnTwqhOp
         0Fv/0MmkPqyD6jEppmkHnJuLFKqm2E8o8zdSquhc+tmVH60h70jBd74FUM3A0JJveaCU
         dsh05qwNjhITZSbIu2WyDm7IK8xFoMfvQ7tWoKPrn4JVynw/WTrntFXCj/uzS5QZrjLw
         QiLvsIoieGh2jb+//OWFTCawqRmJWTnm41wjwkaAZFkdTXEwkhC+4DQQc1s5n1s4iZQs
         a4gkD1jqUTMrySbXJC/yjGeCaUEfSNvzfXbi5goEjmOaIVK13kf9DJgjbELHobQQ6CYD
         YilA==
X-Gm-Message-State: AOJu0Yx8FcRhr8vqLk2kV4PmjGRRNGJxKirt6UzL/8oEZK8aG/3S3i25
        vcvifOAksnnMTwuW1WLeTyGd8yCCPYyrbg==
X-Google-Smtp-Source: AGHT+IF8pmbhpPpbGpN949Hzb7Guc7RpmiDmwZP/r77ka7PsQtKTVGqNA4PvzZyFdbkTjG8Zgv8Rmg==
X-Received: by 2002:a25:244b:0:b0:d7b:9372:a35c with SMTP id k72-20020a25244b000000b00d7b9372a35cmr9879204ybk.56.1695114877057;
        Tue, 19 Sep 2023 02:14:37 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id b5-20020a5b0b45000000b00d816fa23bd4sm2633590ybr.26.2023.09.19.02.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:14:36 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59e8d963adbso23417417b3.0;
        Tue, 19 Sep 2023 02:14:36 -0700 (PDT)
X-Received: by 2002:a0d:d4cd:0:b0:58f:96d8:e7ad with SMTP id
 w196-20020a0dd4cd000000b0058f96d8e7admr11581228ywd.18.1695114876534; Tue, 19
 Sep 2023 02:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com> <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:14:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO2KVpg50Zxak6e_7-5c5Xg6O2PJkPkTfrR=treOtUig@mail.gmail.com>
Message-ID: <CAMuHMdWO2KVpg50Zxak6e_7-5c5Xg6O2PJkPkTfrR=treOtUig@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
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
> +#define RCAR_DEFAULT_SMD       20
> +
>  #define RCAR_BUS_PHASE_START   (MDBS | MIE | ESG)
>  #define RCAR_BUS_PHASE_DATA    (MDBS | MIE)
>  #define RCAR_BUS_PHASE_STOP    (MDBS | MIE | FSB)
> @@ -128,6 +146,7 @@ struct rcar_i2c_priv {
>
>         int pos;
>         u32 icccr;
> +       u32 scl_gran;

You may want to store just u16 schd and scld instead, so you don't
have to calculate them over and over again in rcar_i2c_init().
They are calculated in rcar_i2c_clock_calculate() (called from .probe())
anyway to validate ranges.

That would also avoid the need to come up with a better name for
scl_gran ;-)

>         u8 recovery_icmcr;      /* protected by adapter lock */
>         enum rcar_i2c_type devtype;
>         struct i2c_client *slave;
> @@ -216,11 +235,16 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
>         rcar_i2c_write(priv, ICMCR, MDBS);
>         rcar_i2c_write(priv, ICMSR, 0);
>         /* start clock */
> -       rcar_i2c_write(priv, ICCCR, priv->icccr);
> -
> -       if (priv->devtype == I2C_RCAR_GEN3)
> +       if (priv->devtype < I2C_RCAR_GEN3) {
> +               rcar_i2c_write(priv, ICCCR, priv->icccr);
> +       } else {
> +               rcar_i2c_write(priv, ICCCR2, CDFD | HLSE | SME);
> +               rcar_i2c_write(priv, ICCCR, priv->icccr);
> +               rcar_i2c_write(priv, ICMPR, RCAR_DEFAULT_SMD);
> +               rcar_i2c_write(priv, ICHPR, RCAR_SCHD_RATIO * priv->scl_gran);
> +               rcar_i2c_write(priv, ICLPR, RCAR_SCLD_RATIO * priv->scl_gran);
>                 rcar_i2c_write(priv, ICFBSCR, TCYC17);
> -
> +       }
>  }
>
>  static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)

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
> +                *
> +                * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
> +                * and:  smd = 2 * RCAR_DEFAULT_SMD
> +                *
> +                * SCL = clkp / (8 + smd + sum_ratio * x + F[...])
> +                * 8 + smd + sum_ratio * x + F[...] = SCL / clkp
> +                * x = ((SCL / clkp) - 8 - smd - F[...]) / sum_ratio
> +                */
> +               x = DIV_ROUND_UP(rate, t.bus_freq_hz ?: 1);
> +               x = DIV_ROUND_UP(x - 8 - 2 * RCAR_DEFAULT_SMD - round, sum_ratio);
> +               scl = rate / (8 + 2 * RCAR_DEFAULT_SMD + sum_ratio * x + round);
> +
> +               /* Bail out if values don't fit into 16 bit or SMD became too large */
> +               if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > x * RCAR_SCHD_RATIO)

The second part of the check looks wrong to me, as it would reject
all the recommended register values for SMD and SCHD in the docs .

What does "SMD became too large" mean here?

> +                       goto err_no_val;
> +
> +               dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCL gran %u\n",
> +                       scl, t.bus_freq_hz, rate, round, cdf, x);
> +
> +               priv->icccr = cdf;
> +               priv->scl_gran = x;
> +       }
>
>         return 0;

The rest LGTM.

BTW, Note 2 in the docs for the Clock Control Register 2 (ICCCR2) seems
to be incorrect:

    SCLD: I2C SCL low clock period (set by the SCL HIGH control register)
                  ^^^                              ^^^^
    SCHD: I2C SCL high clock period (set by the SCL LOW control register)
                  ^^^^                              ^^^

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
