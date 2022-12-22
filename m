Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB35665492D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 00:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbiLVXNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 18:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiLVXNK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 18:13:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768A213F43
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:13:09 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8UkE-0008C4-MR; Fri, 23 Dec 2022 00:12:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8UkB-0016KT-6V; Fri, 23 Dec 2022 00:12:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8UkA-007DyK-6J; Fri, 23 Dec 2022 00:12:54 +0100
Date:   Fri, 23 Dec 2022 00:12:54 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Evgeniy Polyakov <zbr@ioremap.net>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 595/606] w1: ds2482: Convert to i2c's .probe_new()
Message-ID: <20221222231254.hwexrvmpeu7gg3a7@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-596-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5rngkaf32hfaczuf"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-596-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5rngkaf32hfaczuf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Evgeniy,

On Fri, Nov 18, 2022 at 11:45:29PM +0100, Uwe Kleine-K=F6nig wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/w1/masters/ds2482.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
> index 62c44616d8a9..3d8b51316bef 100644
> --- a/drivers/w1/masters/ds2482.c
> +++ b/drivers/w1/masters/ds2482.c
> @@ -442,8 +442,7 @@ static u8 ds2482_w1_set_pullup(void *data, int delay)
>  }
> =20
> =20
> -static int ds2482_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ds2482_probe(struct i2c_client *client)
>  {
>  	struct ds2482_data *data;
>  	int err =3D -ENODEV;
> @@ -553,7 +552,7 @@ static struct i2c_driver ds2482_driver =3D {
>  	.driver =3D {
>  		.name	=3D "ds2482",
>  	},
> -	.probe		=3D ds2482_probe,
> +	.probe_new	=3D ds2482_probe,
>  	.remove		=3D ds2482_remove,
>  	.id_table	=3D ds2482_id,
>  };

Assuming you don't have any concerns, it would be great if you applied
this patch for the next merge window.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5rngkaf32hfaczuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOk5HIACgkQwfwUeK3K
7An7/gf9F+44jb7JRWixeoFnDEDnNPYJrSkzWuDnT2dGl+Jxt5JrLeH2ZFKPL2Wu
MZ/BMPVofOab7dka20wYPMxFePx6VrksKT4JanziwisGu9f9CzEmnKADpJy4GtLy
4YwqpBFXRopKl+M0Bx3b7DeCFN1ddLbt5LQTiWq6OSXTqixgnTRt0ytjxXpSPMSh
YU6h5V/1b+Y5e8Ijf7IDMC3gMZskc3EkqA/7OK1TDh3PgdqK4hjgcq58Nd1400cN
7RlyaJziV2kqbeEQuHy+OjmQDATyc1JrG+e4ykPKWR8kaTZsqQkz8dqVbNM2XKt/
jEKvWFZvaQEhJTYIdhKHQzqEmz6b4Q==
=8ARK
-----END PGP SIGNATURE-----

--5rngkaf32hfaczuf--
