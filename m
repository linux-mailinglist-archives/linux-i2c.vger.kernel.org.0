Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED973B19C5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 14:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFWMWK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 08:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhFWMWK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Jun 2021 08:22:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348F4C061756
        for <linux-i2c@vger.kernel.org>; Wed, 23 Jun 2021 05:19:53 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lw1r9-0005px-3E; Wed, 23 Jun 2021 14:19:47 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lw1r4-0008Rw-Dr; Wed, 23 Jun 2021 14:19:42 +0200
Date:   Wed, 23 Jun 2021 14:19:42 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Kwon Tae-young <tykwon@m2i.co.kr>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c/imx: Fix some checkpatch warnings
Message-ID: <20210623121942.n5vzur5rfazgjtd2@pengutronix.de>
References: <20210623083643.395-1-tykwon@m2i.co.kr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6t4gwuuw3c4iudk7"
Content-Disposition: inline
In-Reply-To: <20210623083643.395-1-tykwon@m2i.co.kr>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6t4gwuuw3c4iudk7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 23, 2021 at 05:36:43PM +0900, Kwon Tae-young wrote:
> @@ -1395,7 +1386,7 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
>  				platform_get_device_id(pdev)->driver_data;
> =20
>  	/* Setup i2c_imx driver structure */
> -	strlcpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name=
));
> +	strscpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name=
));

TIL about strscpy. I'm not yet sure if I like it better than strlcpy in
this case, but the usage is correct for sure.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

>  	i2c_imx->adapter.owner		=3D THIS_MODULE;
>  	i2c_imx->adapter.algo		=3D &i2c_imx_algo;
>  	i2c_imx->adapter.dev.parent	=3D &pdev->dev;
> --=20
> 2.17.1
>=20
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6t4gwuuw3c4iudk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDTJtsACgkQwfwUeK3K
7AkcKAf+JNnmzhVNCCViCtR6HE2gW9q9uFgU0NcJUPhf33AZ34LmL2MqFEApXR5f
iWxOkJd2zBV3VKevtDIYK7E8JhrvDNokENlXdL00DBx4GYgAOGCKecTzp7WzQkaG
mqBk078/wklfKIjbSI/X8xxeuW8liulhQhVzVkgJpRUmWIACuWkyiV6bkAY9V0RY
Q8dgt8KwmE2pqUOOK4m8RARKxRB1upqfZwOvBQi2zcMc7vRTXgIW/jOpmK6fO4PT
C6Rfw53qzoO84rhhVwM1iYfE6JUOlemltFJKUW38HzK/NfDHglQptOBw21Fe9ENb
1DtxU4f00YwR95l+HVOdC8d8rw8KNw==
=+yxd
-----END PGP SIGNATURE-----

--6t4gwuuw3c4iudk7--
