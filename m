Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9306605FB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jan 2023 18:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbjAFRwQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Jan 2023 12:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235746AbjAFRvo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Jan 2023 12:51:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEBF7F45D
        for <linux-i2c@vger.kernel.org>; Fri,  6 Jan 2023 09:51:32 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqsH-0000aD-EI; Fri, 06 Jan 2023 18:51:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqsG-004Fsr-MI; Fri, 06 Jan 2023 18:51:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pDqsF-00Aign-VW; Fri, 06 Jan 2023 18:51:23 +0100
Date:   Fri, 6 Jan 2023 18:51:23 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 510/606] pinctrl: mcp23s08: Convert to i2c's .probe_new()
Message-ID: <20230106175123.2ihrbbxyjmnkau2t@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-511-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wmecrkbj35jjufrj"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-511-uwe@kleine-koenig.org>
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


--wmecrkbj35jjufrj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

On Fri, Nov 18, 2022 at 11:44:04PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/pinctrl/pinctrl-mcp23s08_i2c.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c b/drivers/pinctrl/pin=
ctrl-mcp23s08_i2c.c
> index e0b001c8c08c..b635c5737e0c 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
> @@ -8,8 +8,9 @@
> =20
>  #include "pinctrl-mcp23s08.h"
> =20
> -static int mcp230xx_probe(struct i2c_client *client, const struct i2c_de=
vice_id *id)
> +static int mcp230xx_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>  	struct device *dev =3D &client->dev;
>  	unsigned int type =3D id->driver_data;
>  	struct mcp23s08 *mcp;
> @@ -100,7 +101,7 @@ static struct i2c_driver mcp230xx_driver =3D {
>  		.name	=3D "mcp230xx",
>  		.of_match_table =3D mcp23s08_i2c_of_match,
>  	},
> -	.probe		=3D mcp230xx_probe,
> +	.probe_new	=3D mcp230xx_probe,
>  	.id_table	=3D mcp230xx_id,
>  };

To eventually get all drivers converted to probe_new it would be great
if you picked this patch and #511 for pinctrl.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wmecrkbj35jjufrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO4X5kACgkQwfwUeK3K
7An6YwgAjJeLIC3Pq7WHcfhjpocsJ51Futnbluao72r7OZLtVE7cX+odoNDz99hV
kwDaQOqw798nPTt8IWMRhUWhYbYw8EYciXc4rFXzNnq2Nc+XI6IqJVv4z7eVMgsf
N29O5lsblxU7slWAGucUJpOASdo8ghVuy/w5EAYNoFRfRFN/yQXw8QELswZGSyMp
B9CKuNK3xlNwquKuJ1C8fx9UFF+sNS5B51UN3w8A0GQculSp1t8W6ClbcgKZBdSO
WU7kHfBjFM6B/OgNhJY54tnogcY+IW6gytshAFswIvBxb3v7cTACRAufOJ7GOmxX
rs7SP2nmOgNdEfr5eMgamvsDLNJf5g==
=CZ0v
-----END PGP SIGNATURE-----

--wmecrkbj35jjufrj--
