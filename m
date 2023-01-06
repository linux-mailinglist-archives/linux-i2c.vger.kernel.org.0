Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5376605EB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jan 2023 18:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235677AbjAFRs7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Jan 2023 12:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbjAFRs6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Jan 2023 12:48:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF032CE18
        for <linux-i2c@vger.kernel.org>; Fri,  6 Jan 2023 09:48:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqpg-0008Tu-JF; Fri, 06 Jan 2023 18:48:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqpf-004FsQ-3J; Fri, 06 Jan 2023 18:48:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqpd-00Aie3-VY; Fri, 06 Jan 2023 18:48:41 +0100
Date:   Fri, 6 Jan 2023 18:48:41 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 560/606] rtc: ds1307: Convert to i2c's .probe_new()
Message-ID: <20230106174841.kqgfnqua4vgd4kwo@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-561-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fw3yxbv2qlboln3r"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-561-uwe@kleine-koenig.org>
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


--fw3yxbv2qlboln3r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexandre,

On Fri, Nov 18, 2022 at 11:44:54PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-ds1307.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 7c2276cf5514..b49c02fd78f7 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1713,9 +1713,9 @@ static const struct regmap_config regmap_config =3D=
 {
>  	.val_bits =3D 8,
>  };
> =20
> -static int ds1307_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ds1307_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>  	struct ds1307		*ds1307;
>  	const void		*match;
>  	int			err =3D -ENODEV;
> @@ -2012,7 +2012,7 @@ static struct i2c_driver ds1307_driver =3D {
>  		.name	=3D "rtc-ds1307",
>  		.of_match_table =3D ds1307_of_match,
>  	},
> -	.probe		=3D ds1307_probe,
> +	.probe_new	=3D ds1307_probe,
>  	.id_table	=3D ds1307_id,
>  };

This is the last remaining rtc patch in my i2c probe_new stack. Would
you mind to apply it?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fw3yxbv2qlboln3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO4XvcACgkQwfwUeK3K
7AmakQf+Oo3+DP0Zw3V/BK3WK+JqVLEPAelaiSrfx1ToWpUat8fgoaX3z4fz9gfq
SWG5IHiiMfXZumdOi5jGUG7A9EW2bHJM2qDM74ctScnThnsB1SThhD0pbJqNh8e2
JSloiA0vNoxWCsA59Ui1AmRTS6ce2fBcgr1Rg+7Uz4aXqOvDweNuSofuM3GXokYY
9eIuH8AToIfEHAHZns8rkwyBbN92xE8Qai4EolIluFUWM/fO3VhF0/2q3jyWPQqN
s+3pW8FuS///F5Ytcu52vGC+yO2IkbLr4iaTJBB2qZhSvkhH6gADPXXTXhkb4Sxp
4QXHKSbktA6WR83ZyKWO4/D+XbP2iw==
=2ULL
-----END PGP SIGNATURE-----

--fw3yxbv2qlboln3r--
