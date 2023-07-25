Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE5A760C15
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 09:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbjGYHjl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 03:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjGYHjQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 03:39:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5D7423F
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jul 2023 00:37:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOCat-0006PH-NY; Tue, 25 Jul 2023 09:36:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOCas-001wj7-JH; Tue, 25 Jul 2023 09:36:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOCar-007c0n-S5; Tue, 25 Jul 2023 09:36:29 +0200
Date:   Tue, 25 Jul 2023 09:36:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        kernel-janitors@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Clean up a call to request_irq()
Message-ID: <20230725073629.glwgv73guiqv2f7w@pengutronix.de>
References: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s22cjwy7le2sfhm5"
Content-Disposition: inline
In-Reply-To: <fa375cc0-893a-4e64-8bf6-cc37f9ebecf5@moroto.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s22cjwy7le2sfhm5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dan,

On Tue, Jul 25, 2023 at 09:50:55AM +0300, Dan Carpenter wrote:
> This is passing a NULL thread to request_threaded_irq().  So it's not
> really a threaded IRQ at all.  It's more readable to call request_irq()
> instead.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 65128a73e8a3..c0cac5bcfdd1 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1506,8 +1506,7 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
>  		goto rpm_disable;
> =20
>  	/* Request IRQ */
> -	ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> -				   pdev->name, i2c_imx);
> +	ret =3D request_irq(irq, i2c_imx_isr, IRQF_SHARED, pdev->name, i2c_imx);
>  	if (ret) {
>  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
>  		goto rpm_disable;

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

There are a few more drivers that could benefit from the same patch
(i.e.=20
	drivers/gpu/drm/bridge/samsung-dsim.c
	drivers/iio/magnetometer/bmc150_magn.c
	drivers/scsi/mpi3mr/mpi3mr_fw.c
	drivers/spi/spi-fsl-dspi.c
as of today's next).

I assume you care for these, too?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--s22cjwy7le2sfhm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS/e3wACgkQj4D7WH0S
/k7jawf9Fh31HX2ho78FVKyAnts8KfwkYL/GHmLhJLtd2ltsdkRLJIXFz5xuDnHV
JV3tOk5PwJ29oQElzsWzdTYDmyz0T/QZTllvyNN0JnT6qDF2RYikHHRFCR0+AEUO
gP2aSLgkhEUYYxjclrqzp2uthPe6KWDkn112B/f5cdd2gxFiIrxeMKVpQm3BQwKr
Ck7o5siYDqSjBnKFKlVtrQQfhcB5Loo2egNX1BVWqkpvTet7TQ6Vy8Qqwv8sMqIs
BHdMIdsRV728Qhb06wdsWWF4GaWSC3gz1GtDFq7yBA9kKnGxHCPTZbJlHvnWCuHR
3R9POlfljaBx3GkzGkjoCZFyMLtQYw==
=9CBn
-----END PGP SIGNATURE-----

--s22cjwy7le2sfhm5--
