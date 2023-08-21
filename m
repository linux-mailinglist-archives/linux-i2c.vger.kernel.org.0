Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB77078238B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 08:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbjHUGU3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 02:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232752AbjHUGU2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 02:20:28 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04772A2
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:20:27 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-58d9ba95c78so34502147b3.1
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692598826; x=1693203626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NecB1GfWBe3qprhWs8o+EF+8E8kECkHeGMXQJxLC3KA=;
        b=CZNorsi897AjmuQ4jE18DDzhyy5kiDebgzFWk+fkX4tywJmZlcGhxbpor0DvYE7xtl
         rDMnPp4N37bsboYRM/EFtgCJwnRxB8C639obnbkv3tOf4QrpySU6+bUvDyoRc8wJ9278
         xI9X6akBUmaldLgvfuVYZ5OZfYjU4sbGCEnwkCMOmtzzOTaiDYlA6/S5HXX0Q/lZAjJM
         HCgtc0bWYX91u2Mf3bE3JAA9c3mPsnOAJBuigCwCBXseZUAQ73YCDKsc9oWrZ0ihsnKE
         kmp5iWrK3bfUcl4fV5/GVDP0HjY5RhLzA/oe6DPFrpngLzgtwxPoMaqLjuzpGgktEWFX
         j9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598826; x=1693203626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NecB1GfWBe3qprhWs8o+EF+8E8kECkHeGMXQJxLC3KA=;
        b=Mx9DwV3GVyD9e2GYI1gwHn7cYkaC3KxfTG02KzQ+Ht2QNskbhvNhgwMnUtcJYz5Th9
         9GP9AS7TX2BWoKL8hXCUw5+rbDS7hM5bBXO0U1Pt2dTvt+pRdCYW2WYSKS2z70YYnCYa
         KYmeqytan6P5oPkk49tpYVfn8OmxENWwhdOX1eJbs5h5H9+/iIEAO+7hyN7SwpeaOUeR
         V+0S0gfHA8uSJwHTD5bna3xT9K7iilbwM5zbJFlAY9uveZl4jJy4dVvLBihKL2gDZ6qV
         30xPL9J672jYQXCkcqSb+H2VXKvjLHT8OgOPSlVTK25N+4UvNUJkanso/L2HBbpeTZ48
         kXOQ==
X-Gm-Message-State: AOJu0YweEbaNDXsnrCdB6P2ri0DtQRfYBWFw4rx+GuR4n+zcjZpUFLcZ
        Q5Ytet6qNRUxzmqadLYKAJoUgZ50G60ZbWJH2CBkfg==
X-Google-Smtp-Source: AGHT+IG5D9JtGSkNz9oqGc8a4mP/+rHKVPjgs/mn0jbo69V6JwjO7IlN/hH3nvkDE46f7RsZKO9cNA3d7vNqoYlo4RE=
X-Received: by 2002:a0d:ca4c:0:b0:570:63d3:9685 with SMTP id
 m73-20020a0dca4c000000b0057063d39685mr5554782ywd.25.1692598826149; Sun, 20
 Aug 2023 23:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-4-patrick.rudolph@9elements.com> <20230820112304.bokph645wvqt5jfl@intel.intel>
In-Reply-To: <20230820112304.bokph645wvqt5jfl@intel.intel>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Mon, 21 Aug 2023 08:20:15 +0200
Message-ID: <CALNFmy0d2brVmu-z4mQwe=wyQqP7FBnmjufCjRyHhhPJmeSUQg@mail.gmail.com>
Subject: Re: [PATCH v15 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Aug 20, 2023 at 1:23=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Patrick,
>
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2=
c-mux-pca954x.c
> > index 0ccee2ae5720..968111442625 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > @@ -4,6 +4,7 @@
> >   *
> >   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
> >   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> > + * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>
>
> 2023?
>
> One question, why are you adding yourself in the copyright?

Can't remember the reason. It's been a while since I created the first vers=
ion.
Will drop the line.

>
> >   * This module supports the PCA954x and PCA984x series of I2C multiple=
xer/switch
> >   * chips made by NXP Semiconductors.
> > @@ -11,6 +12,12 @@
> >   *    PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
> >   *    PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
> >   *
> > + * It's also compatible to Maxims MAX735x I2C switch chips, which are =
controlled
> > + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> > + *
> > + * This includes the:
> > + *    MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> > + *
> >   * These chips are all controlled via the I2C bus itself, and all have=
 a
> >   * single 8-bit register. The upstream "parent" bus fans out to two,
> >   * four, or eight downstream busses or channels; which of these
> > @@ -51,6 +58,12 @@
> >  #define PCA954X_IRQ_OFFSET 4
> >
> >  enum pca_type {
> > +     max_7356,
> > +     max_7357,
> > +     max_7358,
> > +     max_7367,
> > +     max_7368,
> > +     max_7369,
> >       pca_9540,
> >       pca_9542,
> >       pca_9543,
> > @@ -90,8 +103,45 @@ struct pca954x {
> >       raw_spinlock_t lock;
> >  };
> >
> > -/* Provide specs for the PCA954x types we know about */
> > +/* Provide specs for the MAX735x, PCA954x and PCA984x types we know ab=
out */
> >  static const struct chip_desc chips[] =3D {
> > +     [max_7356] =3D {
> > +             .nchans =3D 8,
> > +             .muxtype =3D pca954x_isswi,
> > +             .id =3D { .manufacturer_id =3D I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7357] =3D {
> > +             .nchans =3D 8,
> > +             .muxtype =3D pca954x_isswi,
> > +             .id =3D { .manufacturer_id =3D I2C_DEVICE_ID_NONE },
> > +             /* No interrupt controller support.
> > +                The interrupt provides information about stuck channel=
s. */
>
> I'm sorry, Peter already commented on this, can you please fix
> the commenting?
>
>                 /*
>                  * No interrupt controller support.
>                  * The interrupt provides information
>                  * about stuck channels.
>                  */
>
> Or
>
>                 /*
>                  * No interrupt controller support. The interrupt
>                  * provides information * about stuck channels.
>                  */
>
> to save one line. (I prefer the latter, your choice)
>

I'm sorry, I overlooked this one. Will send a new version.

> Rest looks good.
>
> Andi
>
> > +     },
> > +     [max_7358] =3D {
> > +             .nchans =3D 8,
> > +             .muxtype =3D pca954x_isswi,
> > +             .id =3D { .manufacturer_id =3D I2C_DEVICE_ID_NONE },
> > +             /* No interrupt controller support.
> > +                The interrupt provides information about stuck channel=
s. */
> > +     },
> > +     [max_7367] =3D {
> > +             .nchans =3D 4,
> > +             .muxtype =3D pca954x_isswi,
> > +             .has_irq =3D 1,
> > +             .id =3D { .manufacturer_id =3D I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7368] =3D {
> > +             .nchans =3D 4,
> > +             .muxtype =3D pca954x_isswi,
> > +             .id =3D { .manufacturer_id =3D I2C_DEVICE_ID_NONE },
> > +     },
> > +     [max_7369] =3D {
> > +             .nchans =3D 4,
> > +             .enable =3D 0x4,
> > +             .muxtype =3D pca954x_ismux,
> > +             .has_irq =3D 1,
> > +             .id =3D { .manufacturer_id =3D I2C_DEVICE_ID_NONE },
> > +     },
> >       [pca_9540] =3D {
> >               .nchans =3D 2,
> >               .enable =3D 0x4,
> > @@ -177,6 +227,12 @@ static const struct chip_desc chips[] =3D {
> >  };
> >
> >  static const struct i2c_device_id pca954x_id[] =3D {
> > +     { "max7356", max_7356 },
> > +     { "max7357", max_7357 },
> > +     { "max7358", max_7358 },
> > +     { "max7367", max_7367 },
> > +     { "max7368", max_7368 },
> > +     { "max7369", max_7369 },
> >       { "pca9540", pca_9540 },
> >       { "pca9542", pca_9542 },
> >       { "pca9543", pca_9543 },
> > @@ -194,6 +250,12 @@ static const struct i2c_device_id pca954x_id[] =3D=
 {
> >  MODULE_DEVICE_TABLE(i2c, pca954x_id);
> >
> >  static const struct of_device_id pca954x_of_match[] =3D {
> > +     { .compatible =3D "maxim,max7356", .data =3D &chips[max_7356] },
> > +     { .compatible =3D "maxim,max7357", .data =3D &chips[max_7357] },
> > +     { .compatible =3D "maxim,max7358", .data =3D &chips[max_7358] },
> > +     { .compatible =3D "maxim,max7367", .data =3D &chips[max_7367] },
> > +     { .compatible =3D "maxim,max7368", .data =3D &chips[max_7368] },
> > +     { .compatible =3D "maxim,max7369", .data =3D &chips[max_7369] },
> >       { .compatible =3D "nxp,pca9540", .data =3D &chips[pca_9540] },
> >       { .compatible =3D "nxp,pca9542", .data =3D &chips[pca_9542] },
> >       { .compatible =3D "nxp,pca9543", .data =3D &chips[pca_9543] },
> > --
> > 2.41.0
> >
