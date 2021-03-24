Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2CB3482CD
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 21:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbhCXUWn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 16:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbhCXUWi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 16:22:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500BAC06174A
        for <linux-i2c@vger.kernel.org>; Wed, 24 Mar 2021 13:22:38 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lPA1Q-000225-Th; Wed, 24 Mar 2021 21:22:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lPA1Q-0001t3-Br; Wed, 24 Mar 2021 21:22:32 +0100
Date:   Wed, 24 Mar 2021 21:22:32 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Simplify using devm_clk_get_prepared()
Message-ID: <20210324202232.7pa4vibmhgctvssm@pengutronix.de>
References: <20210301135053.1462168-1-u.kleine-koenig@pengutronix.de>
 <20210324201223.75921-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sjdstcxiluhgstti"
Content-Disposition: inline
In-Reply-To: <20210324201223.75921-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sjdstcxiluhgstti
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 09:12:23PM +0100, Uwe Kleine-K=F6nig wrote:
> devm_clk_get_prepared returns the clk already prepared and the
> automatically called cleanup cares for unpreparing. So simplify .probe
> and .remove accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this simplification depends on a patch set that introduces
> devm_clk_get_prepared() and friends.
>=20
> The most recent version of this patch set can be found at
>=20
> 	https://lore.kernel.org/r/20210301135053.1462168-1-u.kleine-koenig@pengu=
tronix.de
>=20
> Unfortunately I didn't get any feedback at all from the clk maintainers
> on it, so I try to make other maintainers aware of it in the expectation
> that the simplifications are welcome and so lure the clk maintainers to
> share their thoughts.
>=20
> Best regards
> Uwe
>=20
>  drivers/i2c/busses/i2c-imx.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b80fdc1f0092..c0e18a6caa38 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1405,16 +1405,10 @@ static int i2c_imx_probe(struct platform_device *=
pdev)
>  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
> =20
>  	/* Get I2C clock */
> -	i2c_imx->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	i2c_imx->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);

oops, I got that wrong, this must be devm_clk_get_enabled, not
devm_clk_get_prepared. So if the clk patches go in, please let me resend
a fixed patch (or adapt yourself, whatever you prefer).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--sjdstcxiluhgstti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBbn4QACgkQwfwUeK3K
7AlfNAf/cUzq/Eg31Gb0Pmz5isxU73bJFkCYDL29vTATKpmxiVkYnrCfs6TpAhsO
unA+GVEcVYxMADyeDhZruQlIBQrvT1T5uE9mYhb4F/Yy34vSTbeJOcHMe/pf2U6i
ZibokVFziKd+CuCbU9c+Skl4RIQ+BnJlePAhm1Hw/Rl9HCBLhTr4XDshfP0jPlTs
MwS5qXr3fEXDh0YK+ww7nWmzVwoSd4f2QKmoZBUI+jrudV43Pi+hMZxFPhbkb4X5
fZs8U40w9SBfn1FYar44y5aI4pF088E3+dSkz32yREdGyfbC30oruLA3LJquHNrp
/2df2QP4nR0ZIY+JToulIcFfgiLrmQ==
=IX9T
-----END PGP SIGNATURE-----

--sjdstcxiluhgstti--
