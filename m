Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4CB6547F5
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Dec 2022 22:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiLVVjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 16:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiLVVjg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 16:39:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF6B23316
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 13:39:35 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8THb-0006by-Py; Thu, 22 Dec 2022 22:39:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8THW-0015ii-Tp; Thu, 22 Dec 2022 22:39:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p8THW-007DI1-7x; Thu, 22 Dec 2022 22:39:14 +0100
Date:   Thu, 22 Dec 2022 22:39:14 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
Message-ID: <20221222213914.mlykf4xey6cbugk5@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kk3flh3igekl75hy"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-39-uwe@kleine-koenig.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kk3flh3igekl75hy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dave, hello Daniel,

On Fri, Nov 18, 2022 at 11:36:12PM +0100, Uwe Kleine-K=F6nig wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/i2c/ch7006_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch700=
6_drv.c
> index 578b738859b9..e0476a5bf84c 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -386,7 +386,7 @@ static const struct drm_encoder_slave_funcs ch7006_en=
coder_funcs =3D {
> =20
>  /* I2C driver functions */
> =20
> -static int ch7006_probe(struct i2c_client *client, const struct i2c_devi=
ce_id *id)
> +static int ch7006_probe(struct i2c_client *client)
>  {
>  	uint8_t addr =3D CH7006_VERSION_ID;
>  	uint8_t val;
> @@ -495,7 +495,7 @@ static const struct dev_pm_ops ch7006_pm_ops =3D {
> =20
>  static struct drm_i2c_encoder_driver ch7006_driver =3D {
>  	.i2c_driver =3D {
> -		.probe =3D ch7006_probe,
> +		.probe_new =3D ch7006_probe,
>  		.remove =3D ch7006_remove,
> =20
>  		.driver =3D {

I didn't get any feedback for the four drm/i2c drivers in this series,
(and they didn't appear in next).

Who is responsible for this area?

If you want to pick up just the drm/i2c patches, you can do:

	b4 am -l -P 38-41 20221118224540.619276-39-uwe@kleine-koenig.org

All four patches don't depend on i2c_client_get_device_id(), so they can
be applied to your tree as is.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kk3flh3igekl75hy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOkzn4ACgkQwfwUeK3K
7AmLAwf/VdWC1VNoUsCra60CFu7WbCCbmvFtJxTLgCX/QJEXqv2e8zPmzcfMLviw
FlZbloDDciqPfC5YDPBYouNnrKabzNRBH+lieih6WizK1DxFcFxBEkIHICRmvYZp
zhQv3z4AOSJCbRFg6i06PgbbofDhBNTe9FCx0PJKg2ngWSaWuVna4vsnu1Pm0jMv
LA7Q6hJPoV58lFoARMoOOVMACv3oFjCzfW25dPQWsgN2kaneXWHZrMSf4kcrHQv6
vE2OHAOKCQ4u8k6vB4h13tgNKnr51EJKYsoUbFyVdlcNA1rFL73s7fgy6R/XXGTl
E/VekLIT7GJUBi7Mi5S04yd4oSpCKg==
=gfAk
-----END PGP SIGNATURE-----

--kk3flh3igekl75hy--
