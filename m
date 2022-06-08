Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98457542843
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jun 2022 09:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiFHHqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jun 2022 03:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240296AbiFHHiR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jun 2022 03:38:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9AE1C2D58
        for <linux-i2c@vger.kernel.org>; Wed,  8 Jun 2022 00:04:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nypji-0002oR-6h; Wed, 08 Jun 2022 09:04:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nypjh-0078UY-4b; Wed, 08 Jun 2022 09:04:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nypje-00EvIo-T1; Wed, 08 Jun 2022 09:04:10 +0200
Date:   Wed, 8 Jun 2022 09:04:08 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tudor.Ambarus@microchip.com
Cc:     alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com,
        linux-crypto@vger.kernel.org, kernel@pengutronix.de,
        Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in
 .remove()
Message-ID: <20220608070408.odie7hrcnfasegbr@pengutronix.de>
References: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
 <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
 <fd8d1ca1-b6fa-ecb9-ba71-80449af59a9a@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4gnzjrjot45eo7jj"
Content-Disposition: inline
In-Reply-To: <fd8d1ca1-b6fa-ecb9-ba71-80449af59a9a@microchip.com>
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


--4gnzjrjot45eo7jj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello

On Wed, Jun 08, 2022 at 04:33:48AM +0000, Tudor.Ambarus@microchip.com wrote:
> On 5/20/22 20:21, Uwe Kleine-K=F6nig wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > Returning an error value in an i2c remove callback results in an error
> > message being emitted by the i2c core, but otherwise it doesn't make a
> > difference. The device goes away anyhow and the devm cleanups are
> > called.
> >=20
> > As atmel_ecc_remove() already emits an error message on failure and the
> > additional error message by the i2c core doesn't add any useful
> > information, change the return value to zero to suppress this message.
> >=20
> > Also make the error message a bit more drastical because when the device
> > is still busy on remove, it's likely that it will access freed memory
> > soon.
> >=20
> > This patch is a preparation for making i2c remove callbacks return void.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

In the past patches were picked up by Herbert. I assume your R-b tag was
the missing bit to make him pick up this patch? To make a bit more sure
that will happen, I added him and davem to Cc.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4gnzjrjot45eo7jj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKgSeUACgkQwfwUeK3K
7Am/5Af+NIWhwEUYLdsOV0/RIhZ8itERCDfCVrnMb8K5KwOQ+PgWSJiYcj0kSZnM
tXavBcIqOV94MPWA9ra6PueGGdDHjU5NamPOHSD3c6z9ZWhny96VRIKYonjlG95j
1Al8wNonhgH4H/qiaFlhoW4QPhZUGQPfHRNqLT0Sql9iT2TYBkGls9sKHPtFMwOn
QzhM1xCMee5UKWryWf42mhZIA7/GPu131+ZJFBVODXlzYd7krlNuKRegUul8r0pl
T5F31aLeD+2tjST884EdzsseTSHaH5C0Z4ff8MmUNnd8zezvOZrwtLFaIGrKjSGV
LLQBHkO2AS1MiUnv0nF110HEPSwpYQ==
=Tb4p
-----END PGP SIGNATURE-----

--4gnzjrjot45eo7jj--
