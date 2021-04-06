Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403DE354D13
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 08:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbhDFGnr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 02:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhDFGnq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 02:43:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEC7C06174A
        for <linux-i2c@vger.kernel.org>; Mon,  5 Apr 2021 23:43:39 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lTfR0-0002FD-65; Tue, 06 Apr 2021 08:43:34 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lTfQz-0005WR-Ai; Tue, 06 Apr 2021 08:43:33 +0200
Date:   Tue, 6 Apr 2021 08:43:33 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v4 5/6] i2c: imx: Simplify using devm_clk_get_enableded()
Message-ID: <20210406064333.y6v5fejjfzjvwnep@pengutronix.de>
References: <20210330181755.204339-1-u.kleine-koenig@pengutronix.de>
 <20210330181755.204339-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vrpysvc3o3lcqa5h"
Content-Disposition: inline
In-Reply-To: <20210330181755.204339-6-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vrpysvc3o3lcqa5h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 08:17:54PM +0200, Uwe Kleine-K=F6nig wrote:
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/i2c/busses/i2c-imx.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b80fdc1f0092..aa156ecc616d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1405,16 +1405,10 @@ static int i2c_imx_probe(struct platform_device *=
pdev)
>  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
> =20
>  	/* Get I2C clock */
> -	i2c_imx->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	i2c_imx->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_imx->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
> -				     "can't get I2C clock\n");
> -
> -	ret =3D clk_prepare_enable(i2c_imx->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "can't enable I2C clock, ret=3D%d\n", ret);
> -		return ret;
> -	}
> +				     "can't get prepared I2C clock\n");
> =20
>  	/* Init queue */
>  	init_waitqueue_head(&i2c_imx->queue);
> @@ -1517,7 +1511,6 @@ static int i2c_imx_remove(struct platform_device *p=
dev)
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq >=3D 0)
>  		free_irq(irq, i2c_imx);
> -	clk_disable_unprepare(i2c_imx->clk);
> =20
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

Note this patch is wrong again, the following hunk is missing:

@@ -1481,7 +1481,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
        pm_runtime_disable(&pdev->dev);
        pm_runtime_set_suspended(&pdev->dev);
        pm_runtime_dont_use_autosuspend(&pdev->dev);
-       clk_disable_unprepare(i2c_imx->clk);
        return ret;
 }

Will resend a fixed patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vrpysvc3o3lcqa5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBsAxIACgkQwfwUeK3K
7AmlEgf+LLmq7GGzMqtvtXv6UoWv4QHp71kbDrZYD4shruY8PXWkFZqR6RG5/DUR
pyrHIQHOTOUaJD2yMXLBG89SKwp/rRPTSX2L2Xk893PZpRyLBjjyY2V/K8z3b4aK
1qZGkH3+vcD+nTwYFBZ9ogFv0GdaP60DjmwTi5BVOfNumAPIHorITAU+WeBz1JZ1
NJ8Ny6Ew1lTSVEIYQT1z0vYdZoCVNe/qGOyswCEAEchReDGqE65wB8b+NU5RRPGd
/WfbxKysRBRDo/3NyOvX0CA5n61o0RyTTp9pCsSIa2Cg8J3QlKzph3v2XgzaB7Ht
938bcuTCb1akmEgh5CrBcEeUMB3Iug==
=vKPJ
-----END PGP SIGNATURE-----

--vrpysvc3o3lcqa5h--
