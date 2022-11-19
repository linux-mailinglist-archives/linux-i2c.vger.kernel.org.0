Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD5E630DF9
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 11:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbiKSKDD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 05:03:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234058AbiKSKDB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 05:03:01 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B070082227
        for <linux-i2c@vger.kernel.org>; Sat, 19 Nov 2022 02:03:00 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owKgX-0006qO-42; Sat, 19 Nov 2022 11:02:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owKgU-005EHk-4x; Sat, 19 Nov 2022 11:02:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owKgU-00069v-D0; Sat, 19 Nov 2022 11:02:50 +0100
Date:   Sat, 19 Nov 2022 11:02:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Crt Mori <cmo@melexis.com>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 186/606] iio: temperature: mlx90632: Convert to i2c's
 .probe_new()
Message-ID: <20221119100250.iw757ovgwjbwr2ho@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-187-uwe@kleine-koenig.org>
 <CAKv63uvVsLhbt9y0fWxPWp005rnWzCn6Vm0UmOnW08B87fkCzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hp5mb2d6k7mrzljq"
Content-Disposition: inline
In-Reply-To: <CAKv63uvVsLhbt9y0fWxPWp005rnWzCn6Vm0UmOnW08B87fkCzw@mail.gmail.com>
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


--hp5mb2d6k7mrzljq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Nov 19, 2022 at 12:04:41AM +0100, Crt Mori wrote:
> On Fri, 18 Nov 2022 at 23:46, Uwe Kleine-K=F6nig <uwe@kleine-koenig.org> =
wrote:
> >
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/iio/temperature/mlx90632.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperatu=
re/mlx90632.c
> > index f1f5ebc145b1..19e30cfca8a7 100644
> > --- a/drivers/iio/temperature/mlx90632.c
> > +++ b/drivers/iio/temperature/mlx90632.c
> > @@ -1168,9 +1168,9 @@ static int mlx90632_enable_regulator(struct mlx90=
632_data *data)
> >         return ret;
> >  }
> >
> > -static int mlx90632_probe(struct i2c_client *client,
> > -                         const struct i2c_device_id *id)
> > +static int mlx90632_probe(struct i2c_client *client)
> >  {
> > +       const struct i2c_device_id *id =3D i2c_client_get_device_id(cli=
ent);
> >         struct mlx90632_data *mlx90632;
> >         struct iio_dev *indio_dev;
> >         struct regmap *regmap;
> > @@ -1337,7 +1337,15 @@ static struct i2c_driver mlx90632_driver =3D {
> >                 .of_match_table =3D mlx90632_of_match,
> >                 .pm     =3D pm_ptr(&mlx90632_pm_ops),
> >         },
> > +<<<<<<< ours
>=20
> Maybe some of the merge artifacts left (also below)?

*groan*, ok, thanks for pointing out the obvious. Fixed in my tree. Ftr,
the fixup is:

diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/m=
lx90632.c
index 19e30cfca8a7..753b7a4ccfdd 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -1337,15 +1337,7 @@ static struct i2c_driver mlx90632_driver =3D {
 		.of_match_table =3D mlx90632_of_match,
 		.pm	=3D pm_ptr(&mlx90632_pm_ops),
 	},
-<<<<<<< ours
-	.probe =3D mlx90632_probe,
-||||||| base
-	.probe =3D mlx90632_probe,
-	.remove =3D mlx90632_remove,
-=3D=3D=3D=3D=3D=3D=3D
 	.probe_new =3D mlx90632_probe,
-	.remove =3D mlx90632_remove,
->>>>>>> theirs
 	.id_table =3D mlx90632_id,
 };
 module_i2c_driver(mlx90632_driver);

When (and if) I'll resend the series, the fixed version will be
included. (Unless someone picks up the broken patch with the above
fixup of course :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hp5mb2d6k7mrzljq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN4qccACgkQwfwUeK3K
7AlCtQf8CxtG6vuDNnXN8vBGpjT/PQQsixyChegKXC+2lHfz6/xOl3dekciIonD1
MN6LBdeVd2qHQgWW4gKxPxvxOPscWj5MF++LvxdSd8EjUgVGdvLB2nC+n6HVATuq
GMOwkO1X64M7eqvXM+XKCehWVYAx4dKgGYceEeKSWIxLbHr39+Q1mRVvOXyuKobM
K4c7TCcZXHhwjtMKIqnG9DIpclJ0fTxT0xkgjn2rj3u4oUpQexjaSdIWE2oRzmvA
lzA2HzdZDEeeNk6bgBnNiCUfVeOcExMkx7LgUOPntH5sj1tPTFYaG0jUGEA42xK2
afoznodF/Zt4fW1nbJkWJs3tWfyVIw==
=wkQl
-----END PGP SIGNATURE-----

--hp5mb2d6k7mrzljq--
