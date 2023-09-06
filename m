Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9727939ED
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 12:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbjIFKbr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 6 Sep 2023 06:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjIFKbq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 06:31:46 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23709CE2;
        Wed,  6 Sep 2023 03:31:42 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso2968731276.1;
        Wed, 06 Sep 2023 03:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693996301; x=1694601101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mp+XFav+gv2iGOZnJObeWkSIHa4blAGQ6C5KKvsasw=;
        b=eVNnX9N4xcNbujviBJeFQF8R4In0mtGJu5guEWZu+Q8gHMdTHZPkOUW2b/IEb6OwSn
         HrTvO1NgUt10AYzQq1s7y3sp6misdgyhq0FengKaD9bV5JrGTOQVVU9dQ5+MOgMPCKDS
         R9e9NxCTQxkJ98982aYe4u9AbEROxgki+S2ew4agFxPI5gGWTVVKtY0Bw3PHX03+n4da
         81o3vii4BnGJfEoCmtmRhjWiYWlFLyfRkdZrhJR7hFbUZT+TtjdDLsB7Ct9zgmO1v4pn
         M+1mwsfVsT7Ghw9i6G2Ubo/KuMqfAmwh6F34U2te+JDQ4t4UX9v/03MXjsJyAO2sZMwg
         VK7A==
X-Gm-Message-State: AOJu0Yz8zb0rvbYPqMB2xyyY+rZ55itljq/5sZihu3jcsH5GCT3pIOYX
        xLdEaZdeVU6nJ9JqvpKhD1VM7jK6m2hWNw==
X-Google-Smtp-Source: AGHT+IFoLzsFkumLMxu1Q+L+tKq5cl1aLQQkzXO9szMOIBnQLHpb9oa7qxD9Zdk7ESgPozMCYiiJiQ==
X-Received: by 2002:a25:7691:0:b0:d6b:8ea4:b8a1 with SMTP id r139-20020a257691000000b00d6b8ea4b8a1mr16707447ybc.12.1693996301052;
        Wed, 06 Sep 2023 03:31:41 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id k66-20020a252445000000b00d071631665fsm3242028ybk.59.2023.09.06.03.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 03:31:40 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso2968718276.1;
        Wed, 06 Sep 2023 03:31:40 -0700 (PDT)
X-Received: by 2002:a25:55:0:b0:d4c:cbd2:f6f3 with SMTP id 82-20020a250055000000b00d4ccbd2f6f3mr15437569yba.53.1693996300390;
 Wed, 06 Sep 2023 03:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com> <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Sep 2023 12:31:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3nGaCHU2GeO3=MHDvZskmXd17GJwj=xBp_ZVawAtniA@mail.gmail.com>
Message-ID: <CAMuHMdW3nGaCHU2GeO3=MHDvZskmXd17GJwj=xBp_ZVawAtniA@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
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

On Tue, Sep 5, 2023 at 6:01 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Apply the different formula and register setting for activating FM+ on
> Gen4 devtypes.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -128,7 +139,7 @@ struct rcar_i2c_priv {
>         wait_queue_head_t wait;
>
>         int pos;
> -       u32 icccr;
> +       u32 clock_val;

Perhaps use a union to store either icccr or smd?

>         u8 recovery_icmcr;      /* protected by adapter lock */
>         enum rcar_i2c_type devtype;
>         struct i2c_client *slave;
> @@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
>         rcar_i2c_write(priv, ICMCR, MDBS);
>         rcar_i2c_write(priv, ICMSR, 0);
>         /* start clock */
> -       rcar_i2c_write(priv, ICCCR, priv->icccr);
> +       if (priv->flags & ID_P_FMPLUS) {
> +               rcar_i2c_write(priv, ICCCR, 0);
> +               rcar_i2c_write(priv, ICMPR, priv->clock_val);
> +               rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
> +               rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
> +               rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);

ICCCR2 note 1: "ICCCR2 should be written to prior to writing ICCCR."

> +       } else {
> +               rcar_i2c_write(priv, ICCCR, priv->clock_val);
> +               if (priv->devtype >= I2C_RCAR_GEN3)
> +                       rcar_i2c_write(priv, ICCCR2, 0);

Likewise.

> +       }
>
>         if (priv->devtype >= I2C_RCAR_GEN3)
>                 rcar_i2c_write(priv, ICFBSCR, TCYC17);
> @@ -242,7 +263,7 @@ static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
>
>  static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
>  {
> -       u32 scgd, cdf, round, ick, sum, scl, cdf_width;
> +       u32 scgd, cdf = 0, round, ick, sum, scl, cdf_width, smd;
>         unsigned long rate;
>         struct device *dev = rcar_i2c_priv_to_dev(priv);
>         struct i2c_timings t = {
> @@ -252,19 +273,26 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
>                 .scl_int_delay_ns       = 50,
>         };
>
> -       cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
> -
>         /* Fall back to previously used values if not supplied */
>         i2c_parse_fw_timings(dev, &t, false);
>
> +       if (t.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ &&
> +           priv->devtype >= I2C_RCAR_GEN4)
> +               priv->flags |= ID_P_FMPLUS;
> +       else
> +               priv->flags &= ~ID_P_FMPLUS;
> +
>         /*
>          * calculate SCL clock
>          * see
> -        *      ICCCR
> +        *      ICCCR (and ICCCR2 for FastMode+)
>          *
>          * ick  = clkp / (1 + CDF)
>          * SCL  = ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
>          *
> +        * for FastMode+:
> +        * SCL  = clkp / (8 + SMD * 2 + SCLD + SCHD +F[(ticf + tr + intd) * clkp])
> +        *
>          * ick  : I2C internal clock < 20 MHz
>          * ticf : I2C SCL falling time
>          * tr   : I2C SCL rising  time
> @@ -273,10 +301,14 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
>          * F[]  : integer up-valuation
>          */
>         rate = clk_get_rate(priv->clk);
> -       cdf = rate / 20000000;
> -       if (cdf >= 1U << cdf_width) {
> -               dev_err(dev, "Input clock %lu too high\n", rate);
> -               return -EIO;
> +
> +       if (!(priv->flags & ID_P_FMPLUS)) {
> +               cdf = rate / 20000000;
> +               cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
> +               if (cdf >= 1U << cdf_width) {
> +                       dev_err(dev, "Input clock %lu too high\n", rate);
> +                       return -EIO;
> +               }
>         }
>         ick = rate / (cdf + 1);

In case of FM+, cdf will be zero, and ick == rate?

> @@ -292,34 +324,55 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
>         round = (ick + 500000) / 1000000 * sum;

ick == rate if FM+

>         round = (round + 500) / 1000;

DIV_ROUND_UP()

>
> -       /*
> -        * SCL  = ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
> -        *
> -        * Calculation result (= SCL) should be less than
> -        * bus_speed for hardware safety
> -        *
> -        * We could use something along the lines of
> -        *      div = ick / (bus_speed + 1) + 1;
> -        *      scgd = (div - 20 - round + 7) / 8;
> -        *      scl = ick / (20 + (scgd * 8) + round);
> -        * (not fully verified) but that would get pretty involved
> -        */
> -       for (scgd = 0; scgd < 0x40; scgd++) {
> -               scl = ick / (20 + (scgd * 8) + round);
> -               if (scl <= t.bus_freq_hz)
> -                       break;
> -       }
> +       if (priv->flags & ID_P_FMPLUS) {

IIUIC, on R-ar Gen3 and later you can use ICCCR2 without FM+, for
improved accuracy, too?

> +               /*
> +                * SMD should be smaller than SCLD and SCHD, we arbitrarily set
> +                * the ratio 1:3. SCHD:SCLD ratio is 1:1, thus:
> +                * SCL  = clkp / (8 + SMD * 2 + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
> +                * SCL  = clkp / (8 + SMD * 2 + SMD * 3 + SMD * 3 + F[...])
> +                * SCL  = clkp / (8 + SMD * 8 + F[...])
> +                */
> +               smd = DIV_ROUND_UP(ick / t.bus_freq_hz - 8 - round, 8);

Perhaps use rate instead of ick?

DIV_ROUND_UP(ick, 8 * (t.bus_freq_hz - 8 - round));

> +               scl = ick / (8 + 8 * smd + round);

DIV_ROUND_UP()?

>
> -       if (scgd == 0x40) {
> -               dev_err(dev, "it is impossible to calculate best SCL\n");
> -               return -EIO;
> -       }
> +               if (smd > 0xff) {
> +                       dev_err(dev, "it is impossible to calculate best SCL\n");
> +                       return -EINVAL;

Perhaps some "goto error", to share with the error handling for non-FM+?

> +               }
>
> -       dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
> -               scl, t.bus_freq_hz, rate, round, cdf, scgd);
> +               dev_dbg(dev, "clk %d/%d(%lu), round %u, SMD:0x%x, SCHD: 0x%x\n",

%u/%u

Perhaps it makes more sense to print SMD and SCHD in decimal?

This also applies to the existing code (CDF/SCGD) you moved into
the else branch.

> +                       scl, t.bus_freq_hz, rate, round, smd, 3 * smd);
>
> -       /* keep icccr value */
> -       priv->icccr = scgd << cdf_width | cdf;
> +               priv->clock_val = smd;
> +       } else {
> +               /*
> +                * SCL  = ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
> +                *
> +                * Calculation result (= SCL) should be less than
> +                * bus_speed for hardware safety
> +                *
> +                * We could use something along the lines of
> +                *      div = ick / (bus_speed + 1) + 1;
> +                *      scgd = (div - 20 - round + 7) / 8;
> +                *      scl = ick / (20 + (scgd * 8) + round);
> +                * (not fully verified) but that would get pretty involved
> +                */
> +               for (scgd = 0; scgd < 0x40; scgd++) {
> +                       scl = ick / (20 + (scgd * 8) + round);
> +                       if (scl <= t.bus_freq_hz)
> +                               break;
> +               }
> +
> +               if (scgd == 0x40) {
> +                       dev_err(dev, "it is impossible to calculate best SCL\n");
> +                       return -EINVAL;

This was -EIO before.


> +               }
> +
> +               dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
> +                       scl, t.bus_freq_hz, rate, round, cdf, scgd);
> +
> +               priv->clock_val = scgd << cdf_width | cdf;
> +       }
>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
