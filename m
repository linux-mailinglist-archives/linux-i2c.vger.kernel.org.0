Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A5B529F5E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236814AbiEQK1v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344399AbiEQKZK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:25:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C76E22
        for <linux-i2c@vger.kernel.org>; Tue, 17 May 2022 03:24:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nquNW-00061W-Qk; Tue, 17 May 2022 12:24:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nquNW-002r1Z-T0; Tue, 17 May 2022 12:24:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nquNU-00AI12-St; Tue, 17 May 2022 12:24:32 +0200
Date:   Tue, 17 May 2022 12:24:32 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-crypto@vger.kernel.org, kernel@pengutronix.de,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: Bug in atmel-ecc driver
Message-ID: <20220517102432.pljcsjkar3oswdnl@pengutronix.de>
References: <20220513135954.exewihnibnhdckkn@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nyzsmgemgobidxym"
Content-Disposition: inline
In-Reply-To: <20220513135954.exewihnibnhdckkn@pengutronix.de>
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


--nyzsmgemgobidxym
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[added Ard to Cc as he last touched that driver]

On Fri, May 13, 2022 at 03:59:54PM +0200, Uwe Kleine-K=F6nig wrote:
> TL;DR: when a device bound to the drivers/crypto/atmel-ecc.c driver is
> unbound while tfm_count isn't zero, this probably results in a
> use-after-free.
>=20
> The .remove function has:
>=20
> 	if (atomic_read(&i2c_priv->tfm_count)) {
>                 dev_err(&client->dev, "Device is busy\n");
>                 return -EBUSY;
>         }
>=20
> before actually calling the cleanup stuff. If this branch is hit the
> result is likely:
>=20
>  - "Device is busy" from drivers/crypto/atmel-ecc.c
>  - "remove failed (EBUSY), will be ignored" from the i2c core
>  - the devm cleanup callbacks are called, including the one kfreeing
>    *i2c_priv
>  - at a later time atmel_ecc_i2c_client_free() is called which does
>    atomic_dec(&i2c_priv->tfm_count);
>  - *boom*
>=20
> I think to fix that you need to call get_device for the i2c device
> before increasing tfm_count (and a matching put_device when decreasing
> it). Having said that the architecture of this driver looks strange to
> me, so there might be nicer fixes (probably with more effort).

I tried to understand the architecture a bit, what I found is
irritating. So the atmel-ecc driver provides a static struct kpp_alg
atmel_ecdh_nist_p256 which embeds a struct crypto_alg (.base). During
=2Eprobe() it calls crypto_register_kpp on that global kpp_alg. That is,
if there are two or more devices bound to this driver, the same kpp_alg
structure is registered repeatedly.  This involves (among others)

 - refcount_set(&atmel_ecdh_nist_p256.base.cra_refcount)
   in crypto_check_alg()
 - INIT_LIST_HEAD(&atmel_ecdh_nist_p256.base.cra_users)
   in __crypto_register_alg()

and then a check about registering the same alg twice which makes the
call crypto_register_alg() return -EEXIST. So if a second device is
bound, it probably corrupts the first device and then fails to probe.

So there can always be (at most) only one bound device which somehow
makes the whole logic in atmel_ecdh_init_tfm ->
atmel_ecc_i2c_client_alloc to select the least used(?) i2c client among
all the bound devices ridiculous.

Is there someone still caring for this driver? Does this justify=20

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 7b2d138bc83e..b3242fba82aa 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -573,6 +573,7 @@ config CRYPTO_DEV_ATMEL_I2C
=20
 config CRYPTO_DEV_ATMEL_ECC
 	tristate "Support for Microchip / Atmel ECC hw accelerator"
+	depends on BROKEN
 	depends on I2C
 	select CRYPTO_DEV_ATMEL_I2C
 	select CRYPTO_ECDH

?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nyzsmgemgobidxym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKDd9cACgkQwfwUeK3K
7Alnuwf9ECdi4grneYiBAliu6gFKQduRiVrgt3b8bhatN+TwhigWTC9csf8M/KVx
vVd2VMqnMRD79u1IcJMC/uo4ts5jxhPDqZMau5Qc/8WgS5Ug8V/R4+SLGBq+vsUA
ZQgBqdldd90AmhMZpAleqbdDKPiyvJKKQ7OZv7T97rqwgrTGZqdZmuYZ4QZOaqY9
JAb5LE5ufdKgXe/jlpkg/K/sgBrJSBa4Fu6AjEoqYQ7jxiyOuzOCky8nsA0CE4+o
oWdxtJj5fLoJeBWZ17AbWojcrGBrgGq5vlPOtxyH5wDhTNrRayVpxLS8tlxnX0dd
SUliftAkPVyncECJrau5JIIb4N4apQ==
=7Loo
-----END PGP SIGNATURE-----

--nyzsmgemgobidxym--
