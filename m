Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384557A5E69
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbjISJou convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 19 Sep 2023 05:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbjISJom (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:44:42 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645BD12B;
        Tue, 19 Sep 2023 02:44:35 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59be6bcf408so54058427b3.2;
        Tue, 19 Sep 2023 02:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116674; x=1695721474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mZYX4PQAAGYIPzMxNypzZdukg0/DFnHey6liy4jLCs=;
        b=W5uGikI+/CjXtBbA1oz/krA/IHFusg5RtrEYsbJ2Aq9AXaAUqrviPg3rSgNJ4WF46H
         vi0BA4p2sfxsl/nofjV+L2oe2PAqVx61nOgHrznIqXsn9mA/rzznHvO078a0wnUJXP28
         wP9vYg4HGe0Aigrz5XJWrpJ5yN9gdRn/2LExpZqpSL9jvyc5zJTqtW7W98zu3kGKPIDB
         8CCyqeMFMuyGQn5imbXW5J9INai1MRHiHe1LNGjYTtBL4h3Z1Q2wW2Gm8poiSVIGAK+e
         mUXjJ/lTpWNiZGAyY3xJnRK5ysgzz25h67dufapk/y2ZkIGMJaxuK3NPcXfKoCeYTn+f
         fNEA==
X-Gm-Message-State: AOJu0Yzt2OaJG1cbLhrAct1XmV3PY5/+C3fP6Fc8wgMPgVCi+dZ5JSOp
        a7vl1sYNFaTzMlg1kUqL1c876/iW8CT+sA==
X-Google-Smtp-Source: AGHT+IHAHglgl6t8oygfYuMFgbepgp8sSCeoOzfPj4PiKBfk138mxhsJIGOMQ2LnEzmGijYOLtiqpQ==
X-Received: by 2002:a0d:fac1:0:b0:583:b186:d817 with SMTP id k184-20020a0dfac1000000b00583b186d817mr11328629ywf.27.1695116674214;
        Tue, 19 Sep 2023 02:44:34 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id i130-20020a815488000000b0054f50f71834sm3113657ywb.124.2023.09.19.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 02:44:34 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59c0a7d54bdso39551737b3.1;
        Tue, 19 Sep 2023 02:44:34 -0700 (PDT)
X-Received: by 2002:a81:4fd1:0:b0:59b:fe46:82de with SMTP id
 d200-20020a814fd1000000b0059bfe4682demr11686754ywb.18.1695116673615; Tue, 19
 Sep 2023 02:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
 <20230913062950.4968-3-wsa+renesas@sang-engineering.com> <CAMuHMdX3LTp-35_+2QAkvq0a+K8uAzY2R9A8xryjP5po+d18ig@mail.gmail.com>
In-Reply-To: <CAMuHMdX3LTp-35_+2QAkvq0a+K8uAzY2R9A8xryjP5po+d18ig@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 11:44:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkiMH04DHFPonsyuV9O5RFPqA5dN8ny4UT9MmS_D9F0g@mail.gmail.com>
Message-ID: <CAMuHMdXkiMH04DHFPonsyuV9O5RFPqA5dN8ny4UT9MmS_D9F0g@mail.gmail.com>
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

On Tue, Sep 19, 2023 at 11:42 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Sep 13, 2023 at 11:38 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > With some new registers, SCL can be calculated to be closer to the
> > desired rate. Apply the new formula for R-Car Gen3 device types.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> > --- a/drivers/i2c/busses/i2c-rcar.c
> > +++ b/drivers/i2c/busses/i2c-rcar.c
>
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
>
> Woops, I missed that both "SCL / clkp" above should be "clkp / SCL".
>
> Fortunately I noticed your "[PATCH 2/2] i2c: rcar: add FastMode+
> support for Gen4" fixed that, but I guess it's better to fix that in
> this patch instead.

And while at it, please move the "2 *" to replace "smd" by "2 * smd", to
match the docs, and the result after FM+?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
