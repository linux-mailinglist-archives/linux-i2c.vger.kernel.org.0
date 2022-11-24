Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C51F6373D3
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Nov 2022 09:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKXIXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Nov 2022 03:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiKXIXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Nov 2022 03:23:06 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724022CCA5
        for <linux-i2c@vger.kernel.org>; Thu, 24 Nov 2022 00:23:05 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id 128so852554vsz.12
        for <linux-i2c@vger.kernel.org>; Thu, 24 Nov 2022 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qmRgK6iHDDD9jUd+afLu/0d0Ew0cdPS8bY9iC3x34M=;
        b=wrIlOBoMs6QQSclG7dH6GjVcfyrqXV0yQ1u3aG+e1sAqHH9Y+hHttWomM3LZqUw32k
         nkJkU1eMPUhvTLG6ds11eZR6MuazdqHYrPsVYBbaVDditxbUQVOrm1O2ywORTCwjS7EP
         +U7cMnomLkAZQb/5Hfdo/iUhj+31WBKdr6OnrupJVbqcemQ4R3q87icWxkahNWilgqtU
         S06UZIzovWkovRY41VSUfHF03vkQYG4LDoLdIbNpzbEcEX8Dv0jYLZN/DJrlEYW+e+Gn
         mO3WdJO1WCkFBf5RZT4w8Do+nJXlo5dFYteduLDUxfR0RvZ/pWDjKcIcvFVb46fCWxfs
         r11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qmRgK6iHDDD9jUd+afLu/0d0Ew0cdPS8bY9iC3x34M=;
        b=It9s06L7PxZZ2K+ZDPWHnwzde+vN0g8kcLA3SfSE7+udY8NtNRfLPCXtDVKa9DRQdt
         lzyfuYBSrAT1hD8F3CjlcTyXuCu6CwbcYyYAwVeEbr3gPPGQ5wFlStX2yHEUzGd61/pJ
         05yXaLkyjB/3r49a8xfMwft1H+tKDPTle1fJUDrl8VsJXVu8AV+tmVALDcq2DK6RZdqA
         SmuSeVWx7/4+ugR5C+v0zIiDm16VdpuVVKyV0pUO06byqgzLH4WScUwd5MUBYlUduXHq
         wIcPkt7CA/v2rZNfltW00w8I6/RrxCnk/pcqd121NrRxQnOrynpUt8oFe1C12YoCb3s9
         rFSQ==
X-Gm-Message-State: ANoB5pmta9dyiDjFV9MJPjP5y8ZbxYUluAitTekpZO8tYIVYztS8gsnc
        k9X9/zqpIG+EhItWqMjknaJhLlcnEK/5xFxX5LioQQ==
X-Google-Smtp-Source: AA0mqf5soPczq85B7Su9wnMaQiQuhCvUW6GSUbGBrWPQb6CMzXdAbt/bQwCjTHuBblb7HRlAv3kudwdSeixLE4PUChQ=
X-Received: by 2002:a05:6102:829:b0:3b0:6449:baba with SMTP id
 k9-20020a056102082900b003b06449babamr6403999vsb.61.1669278184524; Thu, 24 Nov
 2022 00:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-12-uwe@kleine-koenig.org> <CAMRc=Mfjcs-BBFhr8O1O956f4jdvAzY9ofZs1fme8+Ki=T60JA@mail.gmail.com>
 <CAMRc=MfwSabay==DcyONc4AVgOPETsA5x3wuLX05Ndvfwiv4bg@mail.gmail.com> <20221123164132.gfglkwgknqkwywnq@pengutronix.de>
In-Reply-To: <20221123164132.gfglkwgknqkwywnq@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Nov 2022 09:22:53 +0100
Message-ID: <CAMRc=Mf=h_nVAzRhY_YEuiur+9Wbx+kEwPj-iB=PqHn3ULYJ6A@mail.gmail.com>
Subject: Re: [PATCH 011/606] gpio: max732x: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-gpio@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
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

On Wed, Nov 23, 2022 at 5:41 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Wed, Nov 23, 2022 at 04:49:05PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 23, 2022 at 10:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wr=
ote:
> > >
> > > On Fri, Nov 18, 2022 at 11:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-ko=
enig.org> wrote:
> > > >
> > > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > >
> > > > .probe_new() doesn't get the i2c_device_id * parameter, so determin=
e
> > > > that explicitly in the probe function.
> > > >
> > > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e>
> > > > ---
> > > >  drivers/gpio/gpio-max732x.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732=
x.c
> > > > index da6972117030..68e982cdee73 100644
> > > > --- a/drivers/gpio/gpio-max732x.c
> > > > +++ b/drivers/gpio/gpio-max732x.c
> > > > @@ -608,9 +608,9 @@ static struct max732x_platform_data *of_gpio_ma=
x732x(struct device *dev)
> > > >         return pdata;
> > > >  }
> > > >
> > > > -static int max732x_probe(struct i2c_client *client,
> > > > -                                  const struct i2c_device_id *id)
> > > > +static int max732x_probe(struct i2c_client *client)
> > > >  {
> > > > +       const struct i2c_device_id *id =3D i2c_client_get_device_id=
(client);
> > > >         struct max732x_platform_data *pdata;
> > > >         struct device_node *node;
> > > >         struct max732x_chip *chip;
> > > > @@ -707,7 +707,7 @@ static struct i2c_driver max732x_driver =3D {
> > > >                 .name           =3D "max732x",
> > > >                 .of_match_table =3D of_match_ptr(max732x_of_table),
> > > >         },
> > > > -       .probe          =3D max732x_probe,
> > > > +       .probe_new      =3D max732x_probe,
> > > >         .id_table       =3D max732x_id,
> > > >  };
> > > >
> > > > --
> > > > 2.38.1
> > > >
> > >
> > > Applied, thanks!
> > >
> > > Bartosz
> >
> > Ugh, backing it out, I thought these patches were independent.
>
> They depend on i2c_client_get_device_id which you can get into your tree
> either by pulling in
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c=
/client_device_id_helper-immutable
>
> or by waiting until this hits Linus Torvald's tree and updating to that.
>
> I'd like to see the gpio patches go in via the gpio tree. If you choose
> not to pull in the above and apply now, I will resend (per subsystem)
> the remaining patches based on the next -rc1 containing that function.
>

That's alright, I pulled Wolfram's branch and re-applied the three patches.

Bart
