Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC4753F68A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 08:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237263AbiFGGtD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 02:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237279AbiFGGtB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 02:49:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59101DFD23
        for <linux-i2c@vger.kernel.org>; Mon,  6 Jun 2022 23:48:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nyT1E-00072G-65; Tue, 07 Jun 2022 08:48:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nyT1E-006wUO-Nc; Tue, 07 Jun 2022 08:48:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nyT1C-00EiNW-PX; Tue, 07 Jun 2022 08:48:46 +0200
Date:   Tue, 7 Jun 2022 08:48:44 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-crypto@vger.kernel.org, kernel@pengutronix.de,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Message-ID: <20220607064844.a6cfpljjowyt3fiz@pengutronix.de>
References: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
 <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aqkaxjvdsflilhwt"
Content-Disposition: inline
In-Reply-To: <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
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


--aqkaxjvdsflilhwt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 20, 2022 at 07:21:00PM +0200, Uwe Kleine-K=F6nig wrote:
> Returning an error value in an i2c remove callback results in an error
> message being emitted by the i2c core, but otherwise it doesn't make a
> difference. The device goes away anyhow and the devm cleanups are
> called.
>=20
> As atmel_ecc_remove() already emits an error message on failure and the
> additional error message by the i2c core doesn't add any useful
> information, change the return value to zero to suppress this message.
>=20
> Also make the error message a bit more drastical because when the device
> is still busy on remove, it's likely that it will access freed memory
> soon.
>=20
> This patch is a preparation for making i2c remove callbacks return void.

I want to tackle this (i.e.

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..066b541a0d5d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -273,7 +273,7 @@ struct i2c_driver {

 	/* Standard driver model interfaces */
 	int (*probe)(struct i2c_client *client, const struct i2c_device_id *id);
-	int (*remove)(struct i2c_client *client);
+	void (*remove)(struct i2c_client *client);

 	/* New driver model interface to aid the seamless removal of the
 	 * current probe()'s, more commonly unused than used second parameter.

) directly after the next merge window. That is (depending on Linus's
counting capabilities) after v5.20-rc1. So I ask you to either take this
crypto patch before (my preferred option), or accept that I send it as part
of a bigger series that eventually contains the above hunk and will
probably be merged via the i2c tree.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--aqkaxjvdsflilhwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKe9MkACgkQwfwUeK3K
7AnyDwgAn2uizkd5IsV/rfJm2HRMgC3zTB1AadQtCmh1QMWFdKb9Ct3FcbJI9XRB
+KFaNmcbPCQrQ9yxQQb216HpXyJ5uadnt8patFZIoaZf3kMW5MJTghihcwsrX7iF
WS1NeU6iu6smMSxv7twxJcu/7yPUP8WyxWJ0hYY55PM/4vaKFfXTa6i7VLN6+pOT
kzUFM2+7OyIrci6U3f2YlMh4Zktu+WqXLEAnUDk7vTFxH41mY/SME0F6Gk4YqO3P
yshJMnZV4n0L7ODdXe65HpqjwCQyFNvB5mvxvSq8In5VjdfUCy7ZYu4oYEm1Jg4B
mlwMffjEWNnsnuoP+kdJGOhDp/xmGQ==
=Ytbv
-----END PGP SIGNATURE-----

--aqkaxjvdsflilhwt--
