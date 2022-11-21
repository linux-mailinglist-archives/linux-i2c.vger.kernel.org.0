Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C96631E0A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 11:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiKUKQr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 05:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiKUKQp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 05:16:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3866F9E09C
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 02:16:44 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox3qd-0007SP-E5; Mon, 21 Nov 2022 11:16:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox3qa-005dO4-AS; Mon, 21 Nov 2022 11:16:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ox3qa-000YEj-92; Mon, 21 Nov 2022 11:16:16 +0100
Date:   Mon, 21 Nov 2022 11:16:16 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 166/606] iio: pressure: bmp280-i2c: Convert to i2c's
 .probe_new()
Message-ID: <20221121101616.bdiufw4inflvee5s@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-167-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zqml5kqykog6t3x7"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-167-uwe@kleine-koenig.org>
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


--zqml5kqykog6t3x7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Nov 18, 2022 at 11:38:20PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/iio/pressure/bmp280-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/iio/pressure/bmp280-i2c.c b/drivers/iio/pressure/bmp=
280-i2c.c
> index 14eab086d24a..4da014b158c8 100644
> --- a/drivers/iio/pressure/bmp280-i2c.c
> +++ b/drivers/iio/pressure/bmp280-i2c.c
> @@ -7,6 +7,7 @@
> =20
>  static int bmp280_i2c_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>  	struct regmap *regmap;
>  	const struct regmap_config *regmap_config;
>  	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);

This patch is bogus, it degraded by rebasing on top of Angel Iglesias's
conversion (021882de1a48cffaa405aa8014bd1d48ca6d5c19 in today's next).

I dropped it from my queue, please don't apply.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zqml5kqykog6t3x7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmN7T+0ACgkQwfwUeK3K
7AnBgwgAjHrQRMd25irDTEifnbsKDLWp71dfzJck/YvStil4SygA0j4gpUpDafL6
cK44nNFkhAhwm0wyYq6h4l4yvhjf2g5v/2EVILPO0BuqBfPYc4Exog//835Wgs1z
1vZamb59YzbfFatawRxhgGPgMZ2ZCcUwsc9v9VX9OWQ0hICM17oMK56YyCdTvw1K
Ji7e1Y8BYe1mjKja79Q1/P5mo2GHF5xDfOmdt9ffi6E3CwruVVshP46aVgPO93/O
fj2N/ZbpMDycjfefB8knuhBj9pGCQLrN6jgOyMfdk9b+06AHXSkcpcuMrBirp9Ew
bd69sPAoZobcKGcHBRCW+I4+m8RBbw==
=k5Rx
-----END PGP SIGNATURE-----

--zqml5kqykog6t3x7--
