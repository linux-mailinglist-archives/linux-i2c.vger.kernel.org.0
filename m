Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF9F636498
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 16:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238794AbiKWPuI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 10:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238920AbiKWPtk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 10:49:40 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7F2C689A
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 07:49:17 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id f68so8904272vkc.8
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jivc45dTXvLm1YRXWATZxQPSyvJMgufwFq3xGWuqv3M=;
        b=HhGGX95JXkc8p/cmrwB5sqv/RmAgSIe6Y1pIc6pBWtss4VPKEWpXS5pYXhmooshnuM
         rcTc1CheQ5j1WJBjffdRCu8xo7NIx/+fg90KRf35VV2y45j14D8dcDy9Nxy6HSeMqpnI
         vw8Bj8w5QAnm7jbG345EfuyFaELsS/TqhxRxtD7+Inj3LuI1wNwYCp4rsksYzFpniw3O
         kYwVPAfVhwbbGP/Wpll/QJK5hsohJ88WWafxcQRsVQthMkA6/oKK4qQK3FtOsJtZWK6V
         AN1bYOHyr0OnYpouDiUWTbMLFtpsksrU//fePasFTt1AHx/qfO9FLNoN8US8gPDAORAQ
         /5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jivc45dTXvLm1YRXWATZxQPSyvJMgufwFq3xGWuqv3M=;
        b=BuE6eSvqGlww0rMxXTSJSEpaIoZ317qIeTqgHV2HwqgfainaQ++P/0PRQ3XiZ9LWD2
         ndtis5zuSzBH3L8+fOwYWOBwTONy6ZMq5r5Gq85cXme6e+HKhsN7nCn/BM44jU2GlTz+
         /XIgalKJAmIOS9RwZL/rUJ19Ud7BYX1spALehxoRWcaDvmkyNUuC1sJNDHRM5TrMaTfZ
         SqTN30rD8dZutEC+CQHrvP07YCfkhCIsJA8ou8UPhCjq+6sRAyFwZ4bDNOAeyBfws2pj
         aSpLNWSW5a2vZ2GRpUx8MNYFV9K+D/fYRDjPZqjM9eHMLxYqqyvQybkL7m9GFjx/e4YC
         QkKw==
X-Gm-Message-State: ANoB5pkvCm+5SUex2cJlOY2Y4sFAD4nanv/R9otP2Uyo47h/5n8hsWFh
        7D2I7+oxrcqgixsaPm2Fh3OBRs7sXUkviS/F7VwLAA==
X-Google-Smtp-Source: AA0mqf4OTkJmqH0nX+bnMDHlcETQbnZux4XMI/LgC9yc/Mif5H9e9AKyW0o+PZg050EBQBNhpu0Aadhu7D6IO6KKtHE=
X-Received: by 2002:a1f:54c1:0:b0:3b7:65cc:8ebc with SMTP id
 i184-20020a1f54c1000000b003b765cc8ebcmr10691674vkb.5.1669218556496; Wed, 23
 Nov 2022 07:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-12-uwe@kleine-koenig.org> <CAMRc=Mfjcs-BBFhr8O1O956f4jdvAzY9ofZs1fme8+Ki=T60JA@mail.gmail.com>
In-Reply-To: <CAMRc=Mfjcs-BBFhr8O1O956f4jdvAzY9ofZs1fme8+Ki=T60JA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 23 Nov 2022 16:49:05 +0100
Message-ID: <CAMRc=MfwSabay==DcyONc4AVgOPETsA5x3wuLX05Ndvfwiv4bg@mail.gmail.com>
Subject: Re: [PATCH 011/606] gpio: max732x: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 10:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Nov 18, 2022 at 11:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig=
.org> wrote:
> >
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpio/gpio-max732x.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> > index da6972117030..68e982cdee73 100644
> > --- a/drivers/gpio/gpio-max732x.c
> > +++ b/drivers/gpio/gpio-max732x.c
> > @@ -608,9 +608,9 @@ static struct max732x_platform_data *of_gpio_max732=
x(struct device *dev)
> >         return pdata;
> >  }
> >
> > -static int max732x_probe(struct i2c_client *client,
> > -                                  const struct i2c_device_id *id)
> > +static int max732x_probe(struct i2c_client *client)
> >  {
> > +       const struct i2c_device_id *id =3D i2c_client_get_device_id(cli=
ent);
> >         struct max732x_platform_data *pdata;
> >         struct device_node *node;
> >         struct max732x_chip *chip;
> > @@ -707,7 +707,7 @@ static struct i2c_driver max732x_driver =3D {
> >                 .name           =3D "max732x",
> >                 .of_match_table =3D of_match_ptr(max732x_of_table),
> >         },
> > -       .probe          =3D max732x_probe,
> > +       .probe_new      =3D max732x_probe,
> >         .id_table       =3D max732x_id,
> >  };
> >
> > --
> > 2.38.1
> >
>
> Applied, thanks!
>
> Bartosz

Ugh, backing it out, I thought these patches were independent.

In that case:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
