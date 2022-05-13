Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AED7526362
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 16:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbiEMOAc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 10:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiEMOA3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 10:00:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26987C17D
        for <linux-i2c@vger.kernel.org>; Fri, 13 May 2022 07:00:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1npVq3-00017A-H0; Fri, 13 May 2022 16:00:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npVq2-0025mX-Sd; Fri, 13 May 2022 16:00:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npVq0-009SxX-Tx; Fri, 13 May 2022 16:00:12 +0200
Date:   Fri, 13 May 2022 15:59:54 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: Bug in atmel-ecc driver
Message-ID: <20220513135954.exewihnibnhdckkn@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lkhd22gveryrhohw"
Content-Disposition: inline
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


--lkhd22gveryrhohw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR: when a device bound to the drivers/crypto/atmel-ecc.c driver is
unbound while tfm_count isn't zero, this probably results in a
use-after-free.

The .remove function has:

	if (atomic_read(&i2c_priv->tfm_count)) {
                dev_err(&client->dev, "Device is busy\n");
                return -EBUSY;
        }

before actually calling the cleanup stuff. If this branch is hit the
result is likely:

 - "Device is busy" from drivers/crypto/atmel-ecc.c
 - "remove failed (EBUSY), will be ignored" from the i2c core
 - the devm cleanup callbacks are called, including the one kfreeing
   *i2c_priv
 - at a later time atmel_ecc_i2c_client_free() is called which does
   atomic_dec(&i2c_priv->tfm_count);
 - *boom*

I think to fix that you need to call get_device for the i2c device
before increasing tfm_count (and a matching put_device when decreasing
it). Having said that the architecture of this driver looks strange to
me, so there might be nicer fixes (probably with more effort).

I noticed this issue while working on my quest to make i2c-remove
callbacks return void. So if you address this, it would be great if you
did that in a way that makes atmel_ecc_remove always return 0.=20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lkhd22gveryrhohw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJ+ZFYACgkQwfwUeK3K
7AntWQf/RJJ7mHYCwhlSsrFT22F4AN8KM1lvIgIhvVCb3PoBhVcbQAK8Ng8XXCeu
hPLAj6XEjynm7K8WaJRLV09y4mqCViXlPtnfkmgKj2gzvscx3P8/dgcsFGxKMbPB
31z3P68+R8S4Y9by5xfq+QiUCR6lGarPdspzYr59hgM/jws+AOhiZFf4Gy/TbFz3
Nk9cJarDaO9m7F773cvkTJzmBc86XfYV000JitR669vwHOr0Lyh7ThAz8/DtO2Rm
JebIaEpM0uzLILoQmc4DRlim3ySc7kFAknbsp4Fu6wdshv12UQzkU8Tl1GMVd/Vc
pW/A+aFRyD1KmYQQ8HyBisnpq4Vh/A==
=KJ7G
-----END PGP SIGNATURE-----

--lkhd22gveryrhohw--
