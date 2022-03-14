Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 996174D7F96
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 11:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238336AbiCNKPH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 06:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbiCNKPG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 06:15:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58BB33E85
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 03:13:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nThht-0005HL-Og; Mon, 14 Mar 2022 11:13:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nThhs-000cHE-5u; Mon, 14 Mar 2022 11:13:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nThhp-0095TP-Pc; Mon, 14 Mar 2022 11:13:37 +0100
Date:   Mon, 14 Mar 2022 11:13:37 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Ian Dannapel <iansdannapel@gmail.com>
Cc:     linux@rempel-privat.de, Erik.Schumacher@iris-sensing.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-kernel@vger.kernel.org, Michael.Glembotzki@iris-sensing.com,
        linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: remove unnecessary delay at startup
Message-ID: <20220314101337.4x2cu3nvg2vg7ulh@pengutronix.de>
References: <20220314095918.50014-1-iansdannapel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fncywnvjwvzgq2r3"
Content-Disposition: inline
In-Reply-To: <20220314095918.50014-1-iansdannapel@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fncywnvjwvzgq2r3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Mar 14, 2022 at 10:59:18AM +0100, Ian Dannapel wrote:
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 3576b63a6c03..019dda5301df 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -602,12 +602,6 @@ static int i2c_imx_start(struct imx_i2c_struct *i2c_=
imx, bool atomic)
>  	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2=
SR);
>  	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx, IMX_I2C_I2=
CR);
> =20
> -	/* Wait controller to be stable */
> -	if (atomic)
> -		udelay(50);
> -	else
> -		usleep_range(50, 150);
> -
>  	/* Start I2C transaction */
>  	temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	temp |=3D I2CR_MSTA;

This contradicts statements made in
43309f3b521302bb66c4c9e66704dd3675e4d725.

Maybe the sleep/delay should be done conditionally on the busy bit?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fncywnvjwvzgq2r3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIvFU4ACgkQwfwUeK3K
7Alh1gf/T9ilRlo3OTdSAhGMBsbG6iKLnQhIxWRtuFxlQqn8ONnvJW52Y0jWgvOM
Yp9vRTAMgHBqCokTHgdagbzt6ZQQfcNCK3W7BBCH8UgsdD7XLYlCXmuSYmMJw3De
GfcecsRNMi1vEu3poriNCjp5I/mjWM0oGgUh0LoPoNS0HqL6Rhcs878aS5thhSci
UYQLxVmT9/IN2wQGqPYxnas8onX5v+3//+E5kiNN8gGb6l41NbGA8MqnZ7adjOB8
U1uFjA1GTDSzH/MoZESMjuLwPZ35vMSjhx7xbMDsLoO1JIpIKzlxlytMSbHWPT0i
+o+pIq8kgPChq74K6sclJ2RoBRhT6A==
=q0lc
-----END PGP SIGNATURE-----

--fncywnvjwvzgq2r3--
