Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCE86365FD
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 17:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239063AbiKWQlp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 11:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239068AbiKWQln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 11:41:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B26BF823
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 08:41:42 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxsoY-0000eV-Mk; Wed, 23 Nov 2022 17:41:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxsoW-0065Of-I6; Wed, 23 Nov 2022 17:41:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxsoW-0013ca-Fp; Wed, 23 Nov 2022 17:41:32 +0100
Date:   Wed, 23 Nov 2022 17:41:32 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-gpio@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 011/606] gpio: max732x: Convert to i2c's .probe_new()
Message-ID: <20221123164132.gfglkwgknqkwywnq@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-12-uwe@kleine-koenig.org>
 <CAMRc=Mfjcs-BBFhr8O1O956f4jdvAzY9ofZs1fme8+Ki=T60JA@mail.gmail.com>
 <CAMRc=MfwSabay==DcyONc4AVgOPETsA5x3wuLX05Ndvfwiv4bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="36dcbx36m5fgzyhv"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfwSabay==DcyONc4AVgOPETsA5x3wuLX05Ndvfwiv4bg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--36dcbx36m5fgzyhv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 04:49:05PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 23, 2022 at 10:47 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> >
> > On Fri, Nov 18, 2022 at 11:46 PM Uwe Kleine-K=F6nig <uwe@kleine-koenig.=
org> wrote:
> > >
> > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >
> > > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > > that explicitly in the probe function.
> > >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  drivers/gpio/gpio-max732x.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> > > index da6972117030..68e982cdee73 100644
> > > --- a/drivers/gpio/gpio-max732x.c
> > > +++ b/drivers/gpio/gpio-max732x.c
> > > @@ -608,9 +608,9 @@ static struct max732x_platform_data *of_gpio_max7=
32x(struct device *dev)
> > >         return pdata;
> > >  }
> > >
> > > -static int max732x_probe(struct i2c_client *client,
> > > -                                  const struct i2c_device_id *id)
> > > +static int max732x_probe(struct i2c_client *client)
> > >  {
> > > +       const struct i2c_device_id *id =3D i2c_client_get_device_id(c=
lient);
> > >         struct max732x_platform_data *pdata;
> > >         struct device_node *node;
> > >         struct max732x_chip *chip;
> > > @@ -707,7 +707,7 @@ static struct i2c_driver max732x_driver =3D {
> > >                 .name           =3D "max732x",
> > >                 .of_match_table =3D of_match_ptr(max732x_of_table),
> > >         },
> > > -       .probe          =3D max732x_probe,
> > > +       .probe_new      =3D max732x_probe,
> > >         .id_table       =3D max732x_id,
> > >  };
> > >
> > > --
> > > 2.38.1
> > >
> >
> > Applied, thanks!
> >
> > Bartosz
>=20
> Ugh, backing it out, I thought these patches were independent.

They depend on i2c_client_get_device_id which you can get into your tree
either by pulling in

	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_d=
evice_id_helper-immutable

or by waiting until this hits Linus Torvald's tree and updating to that.

I'd like to see the gpio patches go in via the gpio tree. If you choose
not to pull in the above and apply now, I will resend (per subsystem)
the remaining patches based on the next -rc1 containing that function.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--36dcbx36m5fgzyhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN+TTkACgkQwfwUeK3K
7AkvdAf8Cvzw5JtqcCfsVyR4MO/uWqGhDkWy1cos3ftRKc2I/0HlSJdOXQJzRvUT
7XZ+gL366ZC9w04+ZEMydwjeUxKwUbi/PLQVJp2u0M2scmsw7BymGlK9MO6nQ8TC
lmFHWpcC03yPESjqLASdy2o+WXmvzvxaKme1NaDuOyV7BLJuJxm73LbR8kwutYq3
D8wltjMPA0xqc+vPaU87LuIdRdKBJfDvl0r5aKAs8QMvSQiIxMtuPgq8bSd6s3ip
gXIV23MhwgXSHTM2151FjDThN20U93HY9y7lEucHb7Lsh+qww3RBFFo4lNJy+IsN
Zmtytj51t9PlB1OS1lYJJZL8lN7CIg==
=+6fc
-----END PGP SIGNATURE-----

--36dcbx36m5fgzyhv--
