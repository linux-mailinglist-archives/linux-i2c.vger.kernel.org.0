Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692C27A5DFD
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjISJcf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjISJce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:32:34 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A79125;
        Tue, 19 Sep 2023 02:32:26 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59c0a7d54bdso39450297b3.1;
        Tue, 19 Sep 2023 02:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115945; x=1695720745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OvZTkJ3LKHbucMQ1OvFnOA6RajoVPB0g5U1d86yMHU=;
        b=boWo2BNYmJUTiL7pwxL+3uT+qiNcwb7bnytEnq9UIcXtUXHdUNAfQd1Vj4+XJzwB5s
         IXtZAFxF5YCTPohB6fd/iUbcKm9XRvHvNNv6LwjMeGiSCV1th8uRP+UeVP+uHWISm4BC
         7uVfvnQgFbYChje/FumN7qHcpJFxuFBJnYXw6y59j4/kPIKO08Z7vInvPXd017qPtlIF
         yozWH0EJxXPnWunFGiUaqqVNeHhTJKtIz9yssXFWrTLIW/EVWBWVjWxCrxkqR8gmOXon
         hwnHmB65zKYEBcFTdDb5dThC1RPjI7yAKAoJyemQbRQ7dtWnMpFrw6rXhhpMGVBn1l8G
         13DQ==
X-Gm-Message-State: AOJu0YzuVaZ6tHpSMUr4zpPuWAmZFHYN0DLx89L0w4s+InT9W0VsdbwF
        Q/kEoC4n8O+IVEpvG+1PJYaYJg9HivfXtQ==
X-Google-Smtp-Source: AGHT+IFJXV98bfVzqrxpHzyFOiGuYzwpZFgnZteEuF0WL8/eNFJJYcRoSCRI/ypL/PUOXQ9sm0jwpg==
X-Received: by 2002:a0d:cb0f:0:b0:599:da80:e1e6 with SMTP id n15-20020a0dcb0f000000b00599da80e1e6mr12879472ywd.34.1695115945378;
        Tue, 19 Sep 2023 02:32:25 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id c127-20020a0df385000000b005463e45458bsm3115974ywf.123.2023.09.19.02.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:32:25 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59be6bcf408so53954857b3.2;
        Tue, 19 Sep 2023 02:32:24 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:59b:ec10:9165 with SMTP id
 i4-20020a815404000000b0059bec109165mr10497820ywb.24.1695115944368; Tue, 19
 Sep 2023 02:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
 <20230913062950.4968-3-wsa+renesas@sang-engineering.com> <CAMuHMdWO2KVpg50Zxak6e_7-5c5Xg6O2PJkPkTfrR=treOtUig@mail.gmail.com>
In-Reply-To: <CAMuHMdWO2KVpg50Zxak6e_7-5c5Xg6O2PJkPkTfrR=treOtUig@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:32:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf-E80dbOuRA0Ogctp=DvGWm92yxzAixb2G=0tx1-ceA@mail.gmail.com>
Message-ID: <CAMuHMdVf-E80dbOuRA0Ogctp=DvGWm92yxzAixb2G=0tx1-ceA@mail.gmail.com>
Subject: Re: [PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Sep 19, 2023 at 11:14 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Sep 13, 2023 at 11:38 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > With some new registers, SCL can be calculated to be closer to the
> > desired rate. Apply the new formula for R-Car Gen3 device types.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-rcar.c
> > +++ b/drivers/i2c/busses/i2c-rcar.c
> > @@ -301,24 +316,57 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
> >         round = DIV_ROUND_CLOSEST(ick, 1000000);
> >         round = DIV_ROUND_CLOSEST(round * sum, 1000);
> >
> > -       /*
> > -        * SCL  = ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
> > -        * 20 + 8 * SCGD + F[...] = ick / SCL
> > -        * SCGD = ((ick / SCL) - 20 - F[...]) / 8
> > -        * Result (= SCL) should be less than bus_speed for hardware safety
> > -        */
> > -       scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
> > -       scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
> > -       scl = ick / (20 + 8 * scgd + round);
> > +       if (priv->devtype < I2C_RCAR_GEN3) {
> > +               u32 scgd;
> > +               /*
> > +                * SCL  = ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
> > +                * 20 + 8 * SCGD + F[...] = ick / SCL
> > +                * SCGD = ((ick / SCL) - 20 - F[...]) / 8
> > +                * Result (= SCL) should be less than bus_speed for hardware safety
> > +                */
> > +               scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
> > +               scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
> > +               scl = ick / (20 + 8 * scgd + round);
> >
> > -       if (scgd > 0x3f)
> > -               goto err_no_val;
> > +               if (scgd > 0x3f)
> > +                       goto err_no_val;
> >
> > -       dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
> > -               scl, t.bus_freq_hz, rate, round, cdf, scgd);
> > +               dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
> > +                       scl, t.bus_freq_hz, rate, round, cdf, scgd);
> >
> > -       /* keep icccr value */
> > -       priv->icccr = scgd << cdf_width | cdf;
> > +               priv->icccr = scgd << cdf_width | cdf;
> > +       } else {
> > +               u32 x, sum_ratio = RCAR_SCHD_RATIO + RCAR_SCLD_RATIO;
> > +               /*
> > +                * SCLD/SCHD ratio and SMD default value are explained above
> > +                * where they are defined. With these definitions, we can compute
> > +                * x as a base value for the SCLD/SCHD ratio:
> > +                *
> > +                * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
> > +                * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
> > +                *               + RCAR_SCHD_RATIO * x + F[...])
> > +                *
> > +                * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
> > +                * and:  smd = 2 * RCAR_DEFAULT_SMD
> > +                *
> > +                * SCL = clkp / (8 + smd + sum_ratio * x + F[...])
> > +                * 8 + smd + sum_ratio * x + F[...] = SCL / clkp
> > +                * x = ((SCL / clkp) - 8 - smd - F[...]) / sum_ratio
> > +                */
> > +               x = DIV_ROUND_UP(rate, t.bus_freq_hz ?: 1);
> > +               x = DIV_ROUND_UP(x - 8 - 2 * RCAR_DEFAULT_SMD - round, sum_ratio);
> > +               scl = rate / (8 + 2 * RCAR_DEFAULT_SMD + sum_ratio * x + round);
> > +
> > +               /* Bail out if values don't fit into 16 bit or SMD became too large */
> > +               if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > x * RCAR_SCHD_RATIO)
>
> The second part of the check looks wrong to me, as it would reject
> all the recommended register values for SMD and SCHD in the docs .
>
> What does "SMD became too large" mean here?

Nevermind, my mistake.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
