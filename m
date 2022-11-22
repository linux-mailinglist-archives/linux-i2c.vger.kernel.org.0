Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDB76348ED
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 22:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbiKVVJJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 16:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbiKVVJI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 16:09:08 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408635CD3F
        for <linux-i2c@vger.kernel.org>; Tue, 22 Nov 2022 13:09:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxaVh-0004KZ-0K; Tue, 22 Nov 2022 22:08:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxaVe-005vUt-SJ; Tue, 22 Nov 2022 22:08:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oxaVf-000sEv-38; Tue, 22 Nov 2022 22:08:51 +0100
Date:   Tue, 22 Nov 2022 22:08:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Crt Mori <cmo@melexis.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 186/606] iio: temperature: mlx90632: Convert to i2c's
 .probe_new()
Message-ID: <20221122210850.kjtildbt5wbpcjes@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-187-uwe@kleine-koenig.org>
 <CAKv63uvVsLhbt9y0fWxPWp005rnWzCn6Vm0UmOnW08B87fkCzw@mail.gmail.com>
 <20221119100250.iw757ovgwjbwr2ho@pengutronix.de>
 <CAKv63uti8o2i-SFsJ7iK+R0N1go1tzVKpWZHbaRD3Wta2mXuZQ@mail.gmail.com>
 <20221122183557.07a9e095@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5nqu22jwzukrrpph"
Content-Disposition: inline
In-Reply-To: <20221122183557.07a9e095@jic23-huawei>
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


--5nqu22jwzukrrpph
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2022 at 06:35:57PM +0000, Jonathan Cameron wrote:
> On Sun, 20 Nov 2022 10:49:20 +0100
> Crt Mori <cmo@melexis.com> wrote:
>=20
> > Ok. Acked-by: Crt Mori <cmo@melexis.com>
> > (resending since previous mail was not delivered because it was not pla=
intext)
> >=20
> > On Sat, 19 Nov 2022 at 11:02, Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Sat, Nov 19, 2022 at 12:04:41AM +0100, Crt Mori wrote: =20
> > > > On Fri, 18 Nov 2022 at 23:46, Uwe Kleine-K=F6nig <uwe@kleine-koenig=
=2Eorg> wrote: =20
> > > > >
> > > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > >
> > > > > .probe_new() doesn't get the i2c_device_id * parameter, so determ=
ine
> > > > > that explicitly in the probe function.
> > > > >
> > > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > > > ---
> > > > >  drivers/iio/temperature/mlx90632.c | 12 ++++++++++--
> > > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/tem=
perature/mlx90632.c
> > > > > index f1f5ebc145b1..19e30cfca8a7 100644
> > > > > --- a/drivers/iio/temperature/mlx90632.c
> > > > > +++ b/drivers/iio/temperature/mlx90632.c
> > > > > @@ -1168,9 +1168,9 @@ static int mlx90632_enable_regulator(struct=
 mlx90632_data *data)
> > > > >         return ret;
> > > > >  }
> > > > >
> > > > > -static int mlx90632_probe(struct i2c_client *client,
> > > > > -                         const struct i2c_device_id *id)
> > > > > +static int mlx90632_probe(struct i2c_client *client)
> > > > >  {
> > > > > +       const struct i2c_device_id *id =3D i2c_client_get_device_=
id(client);
> > > > >         struct mlx90632_data *mlx90632;
> > > > >         struct iio_dev *indio_dev;
> > > > >         struct regmap *regmap;
> > > > > @@ -1337,7 +1337,15 @@ static struct i2c_driver mlx90632_driver =
=3D {
> > > > >                 .of_match_table =3D mlx90632_of_match,
> > > > >                 .pm     =3D pm_ptr(&mlx90632_pm_ops),
> > > > >         },
> > > > > +<<<<<<< ours =20
> > > >
> > > > Maybe some of the merge artifacts left (also below)? =20
> > >
> > > *groan*, ok, thanks for pointing out the obvious. Fixed in my tree. F=
tr,
> > > the fixup is:
> > >
> > > diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/tempera=
ture/mlx90632.c
> > > index 19e30cfca8a7..753b7a4ccfdd 100644
> > > --- a/drivers/iio/temperature/mlx90632.c
> > > +++ b/drivers/iio/temperature/mlx90632.c
> > > @@ -1337,15 +1337,7 @@ static struct i2c_driver mlx90632_driver =3D {
> > >                 .of_match_table =3D mlx90632_of_match,
> > >                 .pm     =3D pm_ptr(&mlx90632_pm_ops),
> > >         },
> > > -<<<<<<< ours
> > > -       .probe =3D mlx90632_probe,
> > > -||||||| base
> > > -       .probe =3D mlx90632_probe,
> > > -       .remove =3D mlx90632_remove,
> > > -=3D=3D=3D=3D=3D=3D=3D
> > >         .probe_new =3D mlx90632_probe,
> > > -       .remove =3D mlx90632_remove, =20
> > > ->>>>>>> theirs =20
> > >         .id_table =3D mlx90632_id,
> > >  };
> > >  module_i2c_driver(mlx90632_driver);
> > >
> > > When (and if) I'll resend the series, the fixed version will be
> > > included. (Unless someone picks up the broken patch with the above
> > > fixup of course :-)
> Who would be crazy enough to do that?
>=20
> (fixed up whilst applying)

Thanks, people seem really eager to prevent me resending the series :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5nqu22jwzukrrpph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN9OmAACgkQwfwUeK3K
7AkMOwgAmm2WQ+U/T+iTdGY6eO7gSW57L1NjBEcqx0ttNn7Ejr4W9QDI9thb2M2B
2/veKoZZDv1RmWEOluogOdc2SD1RDcibUzM6l1l7Tq5GpY7BQwMb/FCzQ9WNnR+R
FVAXqJINljxau605PX1XLeDAFvzWwIbyGcdnApgLrvzqdv11PBUFqc0DE77So5i4
/KJkuMpZFlK7ugNRi7Rqm8GnHs/EzWQhXy/D3UgDpmZlrc9fCa8TeSWkeThBjbmo
g+kX+IiCFDRTUIeTa1Bs5QkIDBDg1bcAraq2ogw9pBoVp1G1mmCvC0MuFzaTgNCM
xY96FY8XwDGRWZr4VVpBEHgVp4kOww==
=36po
-----END PGP SIGNATURE-----

--5nqu22jwzukrrpph--
