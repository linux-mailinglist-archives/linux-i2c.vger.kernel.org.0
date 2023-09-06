Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741DB793C8D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 14:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbjIFMXw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 6 Sep 2023 08:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjIFMXw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 08:23:52 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAE610F7;
        Wed,  6 Sep 2023 05:23:48 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3ab2a0391c0so2421425b6e.1;
        Wed, 06 Sep 2023 05:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694003028; x=1694607828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiLcgx0X2/cqDwn5jAxVjbJXdSuPWp4f8xGHRL6HsRw=;
        b=Iu4cY2EMTw33SN5MwJLnW7dEH6bxudcu2vvI8shvq6ifPdUikEbHn7Ar3c6xImD0Hf
         fCjaDoyzHO2o02IOMUL0ewU+VrZSG6oNRffX36XcZYBlJ7hyHeGNqiuhr1aRuZn4v+GI
         TU6GNRTYcxwLkM3SZoLbthlAUn3z4N9+4YCGZqS1IUjWEaRJd57izICzd8EMITis9w/T
         jMiHXAu/trVlXk7ohIWis+U4k0RRZ91XNDC5odCrcj6w6JUl1IJDClymepyj6mhyez0q
         62KDKcG3yQOVZPcVvH9VVpFUa04GpNftZ0/9dhiIwrv1ICPCuiE6TrA+iR7t078ZXhyq
         oaKw==
X-Gm-Message-State: AOJu0YxXKTHh0O3QWqIiCwiqEixVCcDcCzTwG9GBA7p62JWLPKf35XuM
        vVfe2/OE17e5yn0yC0Cmao2o1Vy4Yux1lQ==
X-Google-Smtp-Source: AGHT+IEeE69NM+8NV8tCRk2rPXVDvbfM9F7eJZKcwGVnN2DnyxKxw3x6OK6I/UjC69oa7OxVncWF6w==
X-Received: by 2002:a05:6808:10d4:b0:3a8:48e7:a6ab with SMTP id s20-20020a05680810d400b003a848e7a6abmr18958262ois.20.1694003027743;
        Wed, 06 Sep 2023 05:23:47 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id n135-20020a0dcb8d000000b00583b40d907esm3736469ywd.16.2023.09.06.05.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 05:23:47 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d7cbcfdf137so3080979276.2;
        Wed, 06 Sep 2023 05:23:47 -0700 (PDT)
X-Received: by 2002:a25:73ce:0:b0:d77:d593:da9 with SMTP id
 o197-20020a2573ce000000b00d77d5930da9mr15447152ybc.28.1694003027362; Wed, 06
 Sep 2023 05:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com> <CAMuHMdW3nGaCHU2GeO3=MHDvZskmXd17GJwj=xBp_ZVawAtniA@mail.gmail.com>
 <ZPhsVLiGck+XF5T7@shikoro>
In-Reply-To: <ZPhsVLiGck+XF5T7@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Sep 2023 14:23:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUE3BVZzsBGSZRPyZRK46zZJ_1jtNMV_Lv-Tp5YXPOY8A@mail.gmail.com>
Message-ID: <CAMuHMdUE3BVZzsBGSZRPyZRK46zZJ_1jtNMV_Lv-Tp5YXPOY8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
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

On Wed, Sep 6, 2023 at 2:11 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > >         ick = rate / (cdf + 1);
> >
> > In case of FM+, cdf will be zero, and ick == rate?
>
> Yes.
>
> > > @@ -292,34 +324,55 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
> > >         round = (ick + 500000) / 1000000 * sum;
> >
> > ick == rate if FM+
>
> Yes, does this induce a change here?

No, just pointing it out, and wondering if this is intended...

>
> > >         round = (round + 500) / 1000;
> >
> > DIV_ROUND_UP()
>
> DIV_ROUND_CLOSEST() I'd say, but I have a seperate patch for that.

Oops (it's too hot here for more coffee...)

> > > +       if (priv->flags & ID_P_FMPLUS) {
> >
> > IIUIC, on R-ar Gen3 and later you can use ICCCR2 without FM+, for
> > improved accuracy, too?
>
> Yeah, we could do that. It indeed improves accuracy:
>
>         old             new
> 100kHz: 97680/100000    99950/100000
> 400kHz: 373482/400000   399201/400000
>
> Caring about regressions here is a bit over the top, or?

Probably OK.

> > > +               /*
> > > +                * SMD should be smaller than SCLD and SCHD, we arbitrarily set
> > > +                * the ratio 1:3. SCHD:SCLD ratio is 1:1, thus:
> > > +                * SCL  = clkp / (8 + SMD * 2 + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
> > > +                * SCL  = clkp / (8 + SMD * 2 + SMD * 3 + SMD * 3 + F[...])
> > > +                * SCL  = clkp / (8 + SMD * 8 + F[...])
> > > +                */
> > > +               smd = DIV_ROUND_UP(ick / t.bus_freq_hz - 8 - round, 8);
> >
> > Perhaps use rate instead of ick?
>
> That's probably cleaner.
>
> > DIV_ROUND_UP(ick, 8 * (t.bus_freq_hz - 8 - round));
>
> This looks like you assumed "ick / (t.bus_freq_hz - 8 - round)" but it
> is "(ick / t.bus_freq_hz) - 8 - round"?

Oops (again)

OK do you need rounding for the division of ick and t.bus_freq_hz,
or is the adjustment bij "- (round + 8)" already taking care of that?
I guess I just don't understand the intended formula here...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
